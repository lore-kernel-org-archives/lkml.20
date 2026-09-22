Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847C838654F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790046834; cv=none; b=jx89SQYrn0hZhiRUzor6bh/pmP6jYc7MDj7AvWj6Q+aDXwA/fY2eHu99WQ4gOzuAIskPMbgmzJGUgtYpxB+mhvg7S4YadwmVg2zO3vEOb253AMJUsv9znJLA00uHmmD3NT7qcE1C542/oQ8bEmamv95O7wfCrK0qoTKBSet5dmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790046834; c=relaxed/simple;
	bh=q+Q/x+N/wGgVbden1nxVudHNpvtx7gnD1MJI+Ih1Zfg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jjxyRpPp2jnTZNry9RW7eN//1GR/LvtfDsm9tDdsfA6iQuLAVzhnw5bJlsZuLb1SGI+nfNlrOhu2a6S+18TXQtO1tKd/3fQy54xXDGeiU9j/LFybB4k1SuNI3/QNu6HKoQLb26lWn1hytxXrV/lt3a886usjRnptZtJfQQCIyPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=CGzBdxr+; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="CGzBdxr+"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=legPrraacMuoh6xTghoAnbFizIXVl12+EiqXtOBu0V4=;
	b=CGzBdxr+Z8MnLYncC/n+h/wtSqJcNnLfJo/4QsVcZnjPbFw6XKYiw60COrRk+fyP0dLsUoLyQ
	NDgX8EfWjCArX53N1rREli1r52O5g4rAEBUHtme5/7G+HSnp1ZW8nQAaNdMcDY7P7NE42kiFhhI
	16QOxClI9awvpak0J7yq0pI=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hplJd01MPznTVk;
	Tue, 22 Sep 2026 11:02:40 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id BD5E8402AB;
	Tue, 22 Sep 2026 11:13:42 +0800 (CST)
Received: from huawei.com (10.50.85.155) by whupemo200011.china.huawei.com
 (7.152.185.179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:13:41 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <song@kernel.org>, <yukuai@fygo.io>, <magiclinan@didiglobal.com>,
	<xiao@kernel.org>, <eadavis@sina.com>, <abd.masalkhi@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <chengzhihao1@huawei.com>,
	<yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v5] md: Fix the null-ptr-deref of 'mddev->private' while submitting IO
Date: Tue, 22 Sep 2026 11:05:38 +0800
Message-ID: <20260922030538.1634904-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200011.china.huawei.com (7.152.185.179)

Concurrent processes md_stop and IO submitting could trigger a
null-ptr-deref of 'mddev->private':

 BUG: kernel NULL pointer dereference, address: 0000000000000070
 RIP: 0010:_wait_barrier+0x2f/0x250
 Call Trace:
  raid1_make_request+0x150/0xf50
  md_handle_request+0x104/0x530
  md_submit_bio+0x76/0x130
  submit_bio+0xdd/0x250
  submit_bio_wait+0x1f/0x40
  __blkdev_direct_IO_simple+0x1f6/0x370
  blkdev_write_iter+0x3b2/0x520
  ksys_write+0x7d/0x190

              P1
  fd = open(/dev/md0, O_RDWR)
	                      P2 (forked from P1, fd' <= fd)
  write(fd)
   submit_bio
    md_handle_request
     raid1_make_request
      raid1_write_request
                                  ioctl(fd, STOP_ARRAY)
		                   mddev_set_closing_and_sync_blockdev
				   // check passed, mddev->openers = 1,
				   // because md_open() is only called
				   // once in P1->open
				   do_md_stop
				    __md_stop
				     mddev->private = NULL

       conf = mddev->private // NULL
        wait_barrier(conf, sector) // null-ptr-deref !

It is a common problem for raid0/1/10/5, and __md_stop could be triggered
by several paths(eg. ioctl, sysfs, ->dtr). Fix it by replacing
mddev_lock() with mddev_suspend_and_lock() for all __md_stop() callers.
The caller array_state_store() is guaranteed by the check
mddev_set_closing_and_sync_blockdev(mddev, 0), we just need to remove
the check '!md_is_rdwr'. For example, someone open /dev/mdx, write
something and close /dev/mdx, it won't trigger the problem, all dirty
pages can be flushed before mddev->openers decrement.
The caller dm_table_destroy() is guaranteed being invoked with device
suspended, so raid_dtr() could keep using mddev_lock_nointr().
Besides, fail the submitting IO in md_handle_request() if the
'mddev->pers' becomes NULL.

Fetch a reproducer in https://bugzilla.kernel.org/show_bug.cgi?id=222020

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3fe892ea5fc292e1353f
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 v1->v2:
  1. Add 'mddev->pers != NULL' check before make_request
  2. Delete dm-raid caller(->dtr) modifications
  3. Move memalloc_noio_restore after mddev_unlock_and_resume
 v2->v3:
  1. Remove modifications in array_state_store()
  2. update commit msg
 v3->v4:
  1. Remove '!md_is_rdwr' check from array_state_store()
  2. update commit msg
 v4->v5:
  1. Skip checking '!md_is_rdwr' only for inactive case
 drivers/md/md.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 680b34a63cb3..02798f2dbf0e 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -414,6 +414,20 @@ bool md_handle_request(struct mddev *mddev, struct bio *bio)
 		if (!percpu_ref_tryget_live(&mddev->active_io))
 			goto check_suspended;
 	}
+	if (!mddev->pers) {
+		/*
+		 * The __md_stop() sets 'mddev->private' to NULL during
+		 * the IO submitting, check 'mddev->pers' before the IO
+		 * being processed by specific driver to avoid the
+		 * null-ptr-deref of 'mddev-><member>'. The check is
+		 * safe because the IO has got the 'mddev->active_io'
+		 * reference, and all __md_stop() callers will wait for
+		 * the reference to be zero.
+		 */
+		bio_io_error(bio);
+		percpu_ref_put(&mddev->active_io);
+		return true;
+	}
 	if (!mddev->pers->make_request(mddev, bio)) {
 		percpu_ref_put(&mddev->active_io);
 		if (mddev_is_dm(mddev) && mddev->pers->prepare_suspend)
@@ -4670,7 +4684,7 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
 	case readonly:
 	case inactive:
 	case read_auto:
-		if (!mddev->pers || !md_is_rdwr(mddev))
+		if (!mddev->pers || (st != inactive && !md_is_rdwr(mddev)))
 			break;
 		/* write sysfs will not open mddev and opener should be 0 */
 		err = mddev_set_closing_and_sync_blockdev(mddev, 0);
@@ -8299,6 +8313,7 @@ static bool md_ioctl_need_suspend(unsigned int cmd)
 	case HOT_REMOVE_DISK:
 	case SET_BITMAP_FILE:
 	case SET_ARRAY_INFO:
+	case STOP_ARRAY:
 		return true;
 	default:
 		return false;
-- 
2.52.0

