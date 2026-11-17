Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895729;
	b=lGlUsQlenqy3bVXli3kmU/9aImnq3GSKaeX0I5/8lkCxePq59gL5XU4dydTNrmsSSlrp
	 XR8aDXTXJOONecIVxhOGeY6W9iqAV74BDEFxTHWtw6EdTYVjejVRAIvfZ7/Wt+3pHgeGR
	 sQzAYUMnTWFC7r0IAjAFXDzhTiqhl2N2ePDpIoG0m6XZLBwiGAh0Q+OAZvNjuN8pQMJYP
	 digTii1Zs/vJm8MUD6Agxf0qAmZgV8O8gWBbsKVxzrNa3gWxJmsoxSDPwR7NfmxAmApUA
	 nG7p6JE44JNe6SvW9rUOZbbmvrfrGhKhzPH71IeLNIBXYHPY88TmVVG6Xn4K9j67OBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895729;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MDJECPrb826/6xAxoygTt3Udx1+QzGisBpJ6SVP0Utw=;
	b=ZfEQjnSNkfoJQwvlE+pgYtSY1BiWo8yE1m3e2b/feNnFVb3tFeIALOPzwKzRH7zDZbyd
	 FJ+N++cyLaQrmcImM7iO6iUxcuRlu5+xUiJY7YVlldZvv3O/e6ipJnWbNYXyEy0Pmc2h6
	 mlcER7hwHJvPd1iZSdr8yPy/BbgI3I+l+u8Bg+FffTCZDnFjba0IlIqN/piIe1rx93uwn
	 T/BivBE6OCMct6YsD6RKJd+YpRwIWE0Ud+tJJ6kliiHrJGJfhPeCTkQENRBWIbLHKG5Ea
	 w/PqqwVMCsHpLNK9OGtR78KiY99ENlFIJtFVJCzUldghn4pKnrQlLUV2di/ygV9Rujg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Xgdafn92;
	arc=none smtp.remote-ip=162.62.58.216
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A250F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A250F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Xgdafn92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794895723; bh=MDJECPrb826/6xAxoygTt3Udx1+QzGisBpJ6SVP0Utw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Xgdafn92FDtoY3Tj4Cdn0Xck2lmiLcSHvkz4m4hFoRiQHyhaYun58L8PDK5YuZgN0
	 7Zv6wr2HsFdyDa6LCyeI6ZzuL/FvZqhUWa7tqk8LjoJ9eyMwj7qAzU4hDPytpWj2XZ
	 CtXqiyAy+STwzQAj+C3cNsxEyG3U9vyco+qIGIf0=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 2271163B; Tue, 17 Nov 2026 14:08:39 +0800
X-QQ-mid: xmsmtpt1794895719tqdrgppmn
Message-ID: <tencent_9B9358CCE5C39B1E7017C4B42600DC95A409@qq.com>
X-QQ-XMAILINFO: MYj4oRzRRyycxhvlKZDxFhfr7inOMQUNTAB/9vulSPLRxB3M41nGRFNiiabTeA
	 rk0iStyxyiVDRNjxHxafpBVaXedWkXfe4R7lOHTml7+x3EyCkA16pAtOHIKVoKp/WbhkmqsjlpYX
	 IhBhmgeG0v56pHcQxX3o6Zhht9m0xAv791SYo2SKRcqBZZJPdcIhYVmHGd6fEgSBmrDD9wEZDdh7
	 wbWMZBLzlwQtnEBfTu66qJ63UcFeoS24/mneBCJn/wVOZqtSwBEOhWSgiWJagjrwZh4Jmb+sZHZQ
	 5EmqHz4fMGleeI9U8ddyhYaxoMzyjum995GR66GT/Nc1kGMDXmBqUklNvlyJa+Llr52oGBXCrb3d
	 OY3Eo2U27t+aikbfN3s1yE06F2Z6mv/IbdZ1OGeK5qL5Y2Yai0O3QROogPtLgLyyOIdmjCv4dQ/w
	 CxlKtrrmn7I2avGuXFJmSNgqMfOjeu3Igm+lJ53oLHsgeXL8HK4PRA873vd6x3CHx/NDgM9E+AmC
	 nJVPl9wrzkPx4qmC0bkUqlnYyCXihBpLlGGrrB/6EaV5rqDCRI+0qIPnW67I1w3InqYY4VMEyKxg
	 dfj7la5rv6H7CVs6bHtHiwaNloSxXng+w1+5eJTwB7TpKLauBvHXHHtTliTB6Ln3ZlBO/SMF27S8
	 WNy8aMJ5g1VywEGfswLMIbLszWBt07WgernJ+82DxPLHEkwWQdJZ/4qCCRqa1jqtaXxCEBF11tfy
	 t9LKcozXFl6aouHSx2h7Q1aq14KFqG5oqZPt6KjylpMRsn0SdJ7PiFkwOloczRWIaOpJL2Vf/yaJ
	 i1EMxpzh6YNCwJ9sQ6taSmokBS0mSjo23loGBg1dYGlHKiSGm5pm2Q477hs/xK0ndKxQcNYRtHCS
	 YHWFeGmkO1T13siDzdm2yXQCegby5+b5u6goYAQ9NVurv8cU8o65/N7q+9G5ssWOrGCE1Yi6TRRf
	 b1mvtkGsIsL1AsEAikbIc7tFyyAb4ZcB6k6GsQRR3ESaFwaODUv2fDiX7UDcKmh3mhPmwwtzHIr1
	 ow4+f3Sr37tUz2XIHxI6KY+ws3oO28nPNUeNNDd8tdcI6PjdExrOv4N3IhjX8GekdiWxnbEU+ZDv
	 gMaJ3ZavlArnnfQ3FGcBLh7/ao52hGz/QEqNRzpke81r1rTpE=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	syzbot+c66e7044aa73c620d862@syzkaller.appspotmail.com,
	sashiko-bot@kernel.org,
	linux-kernel@vger.kernel.org,
	847807867@qq.com
Subject: [PATCH v2] mtd: blktrans: keep reclaim out of the ->release paths
Date: Tue, 17 Nov 2026 14:08:38 +0800
X-OQ-MSGID: <20261117060838.186252-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-218218@kernel.org>
References: <sashiko-outbox-218218@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

blktrans_release() invokes tr->release() while holding dev->lock, and
translators can walk down into the flash driver from there:
mtdblock_release() flushes its write cache via write_cached_data() ->
erase_write() -> mtd_erase(), and concat_erase() allocates a struct
erase_info with GFP_KERNEL. del_mtd_blktrans_dev() calls ->release()
under the same lock on the device removal path.

Reclaim from those allocations can recurse back into the same block
queue and deadlock. lockdep reports the full cycle when a write to the
concat device is flushed at last close:

    init/1 is trying to acquire lock:
      fs_reclaim, at: __kmalloc_cache_noprof
    but task is already holding lock:
      &mtdblk->cache_mutex, at: mtdblock_release

    Chain exists of:
      fs_reclaim --> &new->lock --> &mtdblk->cache_mutex

    the existing dependency chain (in reverse order) is:
      fs_reclaim -> q_usage_counter(io) -> elevator_lock
        -> set->srcu -> new->lock -> mtdblk->cache_mutex

    Call Trace:
       concat_erase
       mtd_erase
       erase_write
       write_cached_data
       mtdblock_release
       blktrans_release
       bdev_release

The io path is already protected: mtd_queue_rq() disables reclaim
across dispatch with memalloc_noio_save(), because translators may
allocate while processing requests under dev->lock and the srcu read
side. ->release() runs under the same locks, so give it the same
treatment in blktrans_release() and del_mtd_blktrans_dev().

Verified with mtdram + block2mtd + concat + mtdblock on QEMU
(CONFIG_PROVE_LOCKING): writing through /dev/mtdblockN and closing
the fd produces the warning above on the unpatched kernel and stays
silent with this patch, with the readback still succeeding.

Reported-by: syzbot+c66e7044aa73c620d862@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c66e7044aa73c620d862
Fixes: 048d87199566 ("mtd: blktrans: Hotplug fixes")
Signed-off-by: Shuai Liu <847807867@qq.com>
---

Changes in v2:
  - Add Fixes tag pointing to 048d87199566 ("mtd: blktrans: Hotplug fixes"),
    which made ->release() run under dev->lock and added the ->release()
    call to del_mtd_blktrans_dev() (Sashiko)

 drivers/mtd/mtd_blkdevs.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 42f250344f0cd..be4ead01f5210 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -233,6 +233,7 @@ static int blktrans_open(struct gendisk *disk, blk_mode_t mode)
 static void blktrans_release(struct gendisk *disk)
 {
 	struct mtd_blktrans_dev *dev = disk->private_data;
+	unsigned int noio_flags;
 
 	mutex_lock(&dev->lock);
 
@@ -242,8 +243,12 @@ static void blktrans_release(struct gendisk *disk)
 	module_put(dev->tr->owner);
 
 	if (dev->mtd) {
-		if (dev->tr->release)
+		if (dev->tr->release) {
+			/* Reclaim must not recurse into I/O while releasing the device. */
+			noio_flags = memalloc_noio_save();
 			dev->tr->release(dev);
+			memalloc_noio_restore(noio_flags);
+		}
 		__put_mtd_device(dev->mtd);
 	}
 unlock:
@@ -410,6 +415,7 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 {
 	unsigned long flags;
 	unsigned int memflags;
+	unsigned int noio_flags;
 
 	lockdep_assert_held(&mtd_table_mutex);
 
@@ -435,8 +441,11 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 		then put mtd device, and don't touch it again */
 	mutex_lock(&old->lock);
 	if (old->open) {
-		if (old->tr->release)
+		if (old->tr->release) {
+			noio_flags = memalloc_noio_save();
 			old->tr->release(old);
+			memalloc_noio_restore(noio_flags);
+		}
 		__put_mtd_device(old->mtd);
 	}
 
-- 
2.43.0

