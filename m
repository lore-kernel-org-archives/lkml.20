Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E4548F849
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815969; cv=none; b=Y9rNZiTui3ANQGM9wlmQ3notsoTYekQI8yFwKNHuHB+M3yGpTOqysn+rVAYPyLTvSnnN4wrgTno8PoLT3Fcm6IBpCpAxTdwg4poFi1+4gvM8SgMaJose8z0KJ9xkoanKFFlPAmjxeh0C1Xz1RqljkpnCQccTQ6gnKIT29QT9jgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815969; c=relaxed/simple;
	bh=xh9Mmvk06Au7lG0R4sR9TW7rJ1wuJFXH46qIEUS9m84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nC9tBpf+Aw/cNNRahSoOQDs4joVyVCD/vN6P7cp6+pzV7M+AN1ngt7QWH67kzaJENa7Gc+CLwv4OBx8TY9xSQjdx1vabM49olSU1Z/9U3SW+LVMCvyCMu66RUEe6zptdmNmgvNY3U4nRW1MGGQ/7DM7MR24+HNNZXoc+C86Jxtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noCB9nHG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noCB9nHG"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2db80fcdf8bso10721935ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815967; x=1792420767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8AhwaiJTOIO9yzRLrCBE5zRrRd3YyiOnh3b3vVnas14=;
        b=noCB9nHGbiZbCKFTDGVI3oi/isnm5lbEDvSC7rBvJ9PqQNoTHYfycwdSLGSw9kFTIY
         v0HgHkSLD8yVZtt9daarhXVm9wIKe8/6r4SfEpdmUOrAmIGa/ZbiXZNuqBGl1m2mDnKQ
         3553B8LOFkMSEpu27fwytsrAdNUXxs42IBQlQa7+AbMH3fVz+v8KCCaAOdXEe/G+QJcH
         XS5xisS8BLyGw/kMFZZxTDGvx7GRWR7ETb0jVYyTcQ/kG+Irh9iKyeBOzTzwMR8NgqP4
         TWw+4Qk0MqzGeejj26NwBkUfFmqM6ybUn+4WWKGU9db9Q20wMY73F9HInHdHwExKRuCn
         u3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815967; x=1792420767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8AhwaiJTOIO9yzRLrCBE5zRrRd3YyiOnh3b3vVnas14=;
        b=m3ERuwxtNa9k13SFH3W1G+0HVJ2nRPhZpLh3rKpm01+pgZSIeU5mAqQ1iZdxq3kFIS
         liZ2wFFIQg4f71UMo1Iga0etyQ+e9OdSoNAXGczT77f6OQzmc3Oe8u4Glb/IN9+DxJ3q
         p07ypqmZh4awhcrmk/eeKPTsZA1v7GjAneUsIGtZrGA200QdhmNwBJ99kq/t6FlwBGqF
         2e93DA8V05gmR17iC4KiQXZR418e4Iv/4gUNqKtXYb0OLi9JCgQ75K0CH6JjdjNR/VO+
         X87707pXSQGV1WVtKPpFWNL+JlxhgJF/IKuIXqcJmbe3X3uPELWqrB2yEBzN64htrgK4
         jQNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbtyapFTHDO2wDC7zozbECF7KuDV1xWnLbO39EqfaER35hTigTLS1la+cnhxpRJxAVkSBgI+u8avMER7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuPVRTdEihHAPQGqHhUIoHneomEgzdharHf/AJVjbxmv0bVBD9
	zmnj6QB6zQYuGb4kg+FFf4hTh73Nz2WK0fuAn8zmnDlF7mDJLRjq2j58
X-Gm-Gg: AYBFou0mmm8wgcvDPndW4ZLPsvkWJcSFs9mEoMAUwnl+ZksCHVXZTnJZCK/j5CZgETr
	RvSFTUS/i2i4GZYjwSBk6tVhRwv0cmQqmx11k7e/5VXJdzy+yjS/AhMv1vMkDVlquw/aLtd62Wv
	bdKtzZMssXM4IMWO0YESVS1w+7Oqu16XyhqQ4xbeoB5NfCOv1xyIZ5m3w2j5Kzr6VSDdPRXLcNh
	hdTHNse9jxLhzy0VE1FFtUJI4PtBuKmO0w/BSyMOV96WuQKGE69VPfO5TuwrrlzkCuG3TcoI5Dp
	VzXnfPnWi0Z1h1oII0VOrGtUqufeE/o9EWEGs6JDkXhLuiSRXNxC6SSkAIYec9PoHcpkAt2MMGx
	HxKWslBSYWV1u+AWXxzi7Q0JXWQ0Q+EROwTc5YBPR7UyFgCePLka+TQRt3EIqttgnm/jxwRT5Sq
	F01cVvKezVerx3Xs63nPvdOvr3Uw0ksDwSVi/ZNRNTcAEFaXFsxfJySVw2dm3k8FHXHNYK5w==
X-Received: by 2002:a17:902:d4c8:b0:2e8:cb5e:c3a with SMTP id d9443c01a7336-2e8cb5e0cabmr24547315ad.59.1791815967347;
        Mon, 12 Oct 2026 07:39:27 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7aa0:50::3cf:23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422db284sm42652555ad.68.2026.10.12.07.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:39:26 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Jens Axboe <axboe@kernel.dk>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+e0624b5bf72b99131402@syzkaller.appspotmail.com
Subject: [PATCH v3] mm/filemap: annotate lockless reads of mapping->nrpages
Date: Mon, 12 Oct 2026 21:39:21 +0700
Message-ID: <20261012143921.283806-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mapping->nrpages is updated under the i_pages lock but is read locklessly
as a cheap "anything cached?" hint, e.g. in invalidate_bdev() and
filemap_write_and_wait_range(). KCSAN reports the race:

  BUG: KCSAN: data-race in __filemap_add_folio / invalidate_bdev

  read-write to 0xffff8881004c4178 of 8 bytes by task 3600 on cpu 0:
   __filemap_add_folio+0x6b7/0x910 mm/filemap.c:919
   filemap_add_folio+0x1cd/0x380
   page_cache_ra_unbounded+0x1a4/0x3a0
   ...
   blkdev_read_iter+0x21e/0x2d0
  read to 0xffff8881004c4178 of 8 bytes by task 3601 on cpu 1:
   invalidate_bdev+0x25/0x70 block/bdev.c:98
   ext4_fill_super+0x2ccb/0x37b0

The same counter also races with filemap_write_and_wait_range() through
mapping_needs_writeback().

The race is benign: a stale value only makes the caller do or skip a
harmless invalidate/flush pass. Mark the lockless reads with data_race()
in invalidate_bdev() and in the two callers of mapping_needs_writeback(),
rather than inside the helper, so a future user needing a reliable answer
is not silently covered.

Reported-by: syzbot+e0624b5bf72b99131402@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e0624b5bf72b99131402
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v3: move data_race() from mapping_needs_writeback() to its two callers (Jan)
v2: use data_race() on the readers instead of READ_ONCE()/WRITE_ONCE() (Jan)

 block/bdev.c | 3 ++-
 mm/filemap.c | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index cd8323083740..233750f87e6d 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -95,7 +95,8 @@ void invalidate_bdev(struct block_device *bdev)
 {
 	struct address_space *mapping = bdev->bd_mapping;
 
-	if (mapping->nrpages) {
+	/* Lockless hint; a stale value only costs or skips a harmless pass */
+	if (data_race(mapping->nrpages)) {
 		invalidate_bh_lrus();
 		lru_add_drain_all();	/* make sure all lru add caches are flushed */
 		invalidate_mapping_pages(mapping, 0, -1);
diff --git a/mm/filemap.c b/mm/filemap.c
index 00fd89cf6f55..ff10ac8f56b3 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -680,7 +680,8 @@ int filemap_write_and_wait_range(struct address_space *mapping,
 	if (lend < lstart)
 		return 0;
 
-	if (mapping_needs_writeback(mapping)) {
+	/* Lockless hint; a stale value is harmless */
+	if (data_race(mapping_needs_writeback(mapping))) {
 		err = filemap_fdatawrite_range(mapping, lstart, lend);
 		/*
 		 * Even if the above returned error, the pages may be
@@ -782,7 +783,8 @@ int file_write_and_wait_range(struct file *file, loff_t lstart, loff_t lend)
 	if (lend < lstart)
 		return 0;
 
-	if (mapping_needs_writeback(mapping)) {
+	/* Lockless hint; a stale value is harmless */
+	if (data_race(mapping_needs_writeback(mapping))) {
 		err = filemap_fdatawrite_range(mapping, lstart, lend);
 		/* See comment of filemap_write_and_wait() */
 		if (err != -EIO)
-- 
2.43.0

