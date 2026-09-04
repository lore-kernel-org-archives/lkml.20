Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6D43B14B1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788564953; cv=none; b=BopISZJuSQK/9hwa6BhwKtCWK4gt0PngVugj2y7uyJqBz1L8Jb1tTbFFsaxCs0SVttZ5tnoSrLH/tEkPIfkG5HsSCseLBfAzxUjSBLtj2y1cNAiG9moHWGankVqVTLxYJFB/fOKzIrhDTHeCGHDI/dSnY8Qf6/dh7iq/0PLeaJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788564953; c=relaxed/simple;
	bh=9oFdzcNSXwfO30LxDKvwHi69W5gBCNxc+H63pnaXZgM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=s77gJ7vfmztxTB8ogk3kLTzAdG5Un1MZxCM8yaRpsfmIJKPMEN+mnksu2PDmelN+QxiHG3xciRynKXQF4Q9NTP5grPovuziCmiM5woI7zJeg8RpctIUGGLelCGiXxCXzjHqK2j4YDx98l8fBjAebP9VGlpq4Zf+ciDgLXRgwyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1a3f01d2aso2404061eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788564950; x=1789169750;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/e6/5ePIMIpOYEhFajWQ9cvMB/27MDTyrWMi45Ge3YM=;
        b=mSyoGNq/VDui02R77bR6DMIauo8wUgeQL1FnFu3dJSCl2hSoKbQ1kBafxRqiC/X2R6
         XXtofXZL1bn8HtPOLKrTimtnNV7zx2ZcjiSvULZV7b7189BdlFb8mc2TDW8oLibprmNA
         BToEZyDMgOfmzd1CyqrRDait6XuMK4sHhXl5TL8IwOQl0dxyIWdHFb+e4RIEtce5CYmk
         1ZnNp3tzUEAQiC0AjIwhXsWzMTthmFq5GXYb+SextETa8tSvABHCLV3jJlA6II4K7srP
         g10EvRQHM4z3ROhLb/5jYGGl8YSrqKlo0WJ2+PRm3fFUVIzUR5LsZe/iBJ3oFvT3OQjb
         x56A==
X-Gm-Message-State: AFuF++nIQIlPhA0aTZdgILFlWJ1QjnjJSDXRioJVDP+8+3wAM2ZYn3Df
	/TIjbi1qiMUmIoTvpfwrcIm+7oL2+ovF8Rycmsvs1fV6T1z7DrIPmtfM4hvvhlD+xN+PZTmFhuG
	BLP1SkF5vXGLGakgX3ZSflmi6zxtL7i/50F/71XKOGnT7Y1UNirsXISK/KGk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1997:b0:6ae:4d93:cdc2 with SMTP id
 006d021491bc7-6b6fa8dd522mr7326295eaf.5.1788564950524; Fri, 04 Sep 2026
 16:35:50 -0700 (PDT)
Date: Fri, 04 Sep 2026 16:35:50 -0700
In-Reply-To: <6a9b3f7a.2e649fcc.1e1977.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9b55d6.a5e650b3.363816.0003.GAE@google.com>
Subject: Forwarded: [PATCH] ocfs2: fix use-after-free in o2hb_region_dev_store
From: syzbot <syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] ocfs2: fix use-after-free in o2hb_region_dev_store
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Concurrent writes to a region's "dev" attribute can race, letting two
tasks both allocate/free reg->hr_slot_data for the same region and
causing a use-after-free. Add a per-region mutex to serialize
o2hb_region_dev_store() against itself and against
o2hb_region_release().

Reported-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3025e3e8fc0b928af8f5
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/ocfs2/cluster/heartbeat.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 1c3def99bb07..6f03de1b6d4a 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -273,6 +273,9 @@ struct o2hb_region {
 
 	/* last hb status, 0 for success, other value for error. */
 	int			hr_last_hb_status;
+	/* Serializes dev_store() against itself and region_release() */
+	struct mutex            hr_dev_write_mutex;
+
 };
 
 static inline struct block_device *reg_bdev(struct o2hb_region *reg)
@@ -1616,7 +1619,10 @@ static void o2hb_region_release(struct config_item *item)
 
 	o2hb_quiesce_timeout(reg);
 	o2net_unregister_and_flush_handler_list(&reg->hr_handler_list);
+
+	mutex_lock(&reg->hr_dev_write_mutex);
 	o2hb_unmap_slot_data(reg);
+	mutex_unlock(&reg->hr_dev_write_mutex);
 
 	if (reg->hr_bdev_file)
 		fput(reg->hr_bdev_file);
@@ -1879,9 +1885,6 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 	ssize_t ret = -EINVAL;
 	int live_threshold;
 
-	if (reg->hr_bdev_file)
-		return -EINVAL;
-
 	/* We can't heartbeat without having had our node number
 	 * configured yet. */
 	reg->hr_node_num = o2nm_this_node();
@@ -1906,12 +1909,20 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 	if (!S_ISBLK(fd_file(f)->f_mapping->host->i_mode))
 		return -EINVAL;
 
+	if (mutex_lock_interruptible(&reg->hr_dev_write_mutex))
+		return -ERESTARTSYS;
+
+	if (reg->hr_bdev_file) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
 	reg->hr_bdev_file = bdev_file_open_by_dev(fd_file(f)->f_mapping->host->i_rdev,
 			BLK_OPEN_WRITE | BLK_OPEN_READ, NULL, NULL);
 	if (IS_ERR(reg->hr_bdev_file)) {
 		ret = PTR_ERR(reg->hr_bdev_file);
 		reg->hr_bdev_file = NULL;
-		return ret;
+		goto out_unlock;
 	}
 
 	sectsize = bdev_logical_block_size(reg_bdev(reg));
@@ -2029,6 +2040,8 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 		fput(reg->hr_bdev_file);
 		reg->hr_bdev_file = NULL;
 	}
+out_unlock:
+	mutex_unlock(&reg->hr_dev_write_mutex);
 	return ret;
 }
 
@@ -2149,6 +2162,8 @@ static struct config_item *o2hb_heartbeat_group_make_item(struct config_group *g
 
 	config_item_init_type_name(&reg->hr_item, name, &o2hb_region_type);
 
+	mutex_init(&reg->hr_dev_write_mutex);
+
 	/* this is the same way to generate msg key as dlm, for local heartbeat,
 	 * name is also the same, so make initial crc value different to avoid
 	 * message key conflict.
-- 
2.34.1

