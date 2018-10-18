<?php
/**
 * _关于我
 *
 * @package custom
 *
 */$this->need('header.php');
?>

<div class="col-mb-12 col-8" id="main" role="main">
    <?php while($this->next()): ?>
        <article class="post" itemscope itemtype="http://schema.org/Person" style="background:#fff;border:2px solid #f3f3f3;margin:2.0em 0em;padding:1.0em 1.5em;border-radius:2px;">
            <div class="post-content" itemprop="articleBody">
                <?php $this->content(); ?>
            </div>
        </article>
    <?php endwhile; ?>
</div>

<?php $this->need('sidebar.php'); ?>
<?php $this->need('footer.php'); ?>