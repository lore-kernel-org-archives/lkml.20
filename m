Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B223397943
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485716; cv=none; b=ris8gsGHkiNB0Bj2kmFaMjILExPZpnGO0URhhYRMaVABmDkvGA6KOWOxyNj+yTJTVsq5WZ1fTMvwUOlSQ/f7onjRAuXInfA95uNVJeo4dXxgIwIFyYLqkkRzoodtKylvqffu7Hrn6LYGQV8vy3mm6N0UR4+PE9QQoZ0kmZMBUk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485716; c=relaxed/simple;
	bh=6xXPxNSmsFKV2TVA93HTty6D+P8jZ+V6clCDU9AmmVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxRT6okLZTexg8iq653Y7Tg7YMKvRpTDplj7pMgZuNuWrYg4tUYRb7w25UVPr5NDYfLREeVrQXd4peGa8YZxylh05jelud4EsbjIA2T9RGYc4NTUkMECQiSaeNbfqQUz6BZBXKQKJhpmqZ18E4IDck5IjnxjICnFEelT17q8kLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtCmSRDH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtCmSRDH"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f01363so12301915ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485715; x=1791090515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFhbuoDvUhhT0NM7dVUo0Ay1NU3i0WuHFz8vsUDnISE=;
        b=LtCmSRDHpSD3TE1lgLqJuRXo5zeNM2uk3uCJq7S4EiBxBiIo18I6wTDaI7pAXoRI4w
         vHr8HblGAYUvingiHhqNT53ExPrh69SGH5/BsoX5DDR3WtmzTz5j+RG8KOT2rm1mRUJl
         pn7dAWjPAY/rSxk1PCuBUUDNnH/r/F0jrPm0bk6uHTbfTcjZHZZMTzSSvcV0y358alsu
         hcX4n+nzZ72FIgZkT0xVS4DjS0A722DD7luloXKxzMQwDN4C9RcahnSolnL0rIwd0cxa
         /7AflVWySJYQQooJSjene1SiA6W9kp/ZgWcV3c3+KkNxM/gzZHcgcdbo5WlUr6r0D/Ti
         mAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485715; x=1791090515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFhbuoDvUhhT0NM7dVUo0Ay1NU3i0WuHFz8vsUDnISE=;
        b=Xl3G74X+mCJwD/nLLZTpii76QCCHQJwrWN6P3PNZGqQbvQHpRfusMYLH/yZklaSoBu
         Jz94MId4jq+wSfmF6RWa8dJE+J0AGk1OCb82FLLptpzdaG6n1eAJvvLgoZmYOKC02KRv
         NZMdV+pg1Bejgbe2LlBlmkDo1Fbdtde1IwVF21Po/3m/W7w4/U+8jKFWQ90tx9xHvAOd
         T9C7FaxP+Eu/5G2fVnih2b2qAU0YtIqxu/vuObZuYgHTT6KGl1uCAbn5MMWyfE/6f83k
         d60CxhIVcxh0ovhJoi0oOnrTUJmjvxncj16ETyvt2FghPNII7ZeUEgdSgoagUVMV1gGn
         3BdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQknfZbpi+FNEIlTKWkj3SncyLwOWpnPInUAd2Jymcy5+g3nmTORyVjgaxpuD0FwQX8O+WK1lxeEHeWQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1nJjK241K9c9KycoNoR3PnqBVpI82ocymeHW2FwAcdUPjwr36
	cYq9xb7KI44uYBoHGDdygfxYIJS/ZXTeBzi0OUCVx8AYVSq/jYF2y7LFGC2F2GVNJpoZpw==
X-Gm-Gg: AYBFou2Rci2fYr5H6ywajm3pXLsmyaXnxz05ISpCrwcxHlfemfWFwh8R1tXCYrFsYW9
	8F3sZk86pB1QoeaMUQIdKKt+15Maxmof6Fv8gebZjjM4l0L0wrUfEB14zbnsBxlnMZEcaQlfyyP
	KAwQR+HRXmv0BE6z/SMqnbT6oYXxEI2rlu7ONhdkGdeywei11SChYDUIxNcvmuQlE7LeN5uwzZl
	4HD5pe676FMCbNSqySFlyJ1PZsssdWISI3fRMsEJcdLQkWZaEXoNXaWGngFieUbik6Gt3CESjsj
	RZ9FYRg5KQA5169K5XznenyPwpa/AMQNeKWIRccZ5Vdesnuy4QtXRkNle/Ohf1crlKV9BopXwly
	UUa5imILYOhNvmjmgBg8Mjcx18XaO4i/LGwS9qKU3uHQy9yOnNZIBnkyyklzdeug+AXr0itq4xc
	7CSh0LlqRfCgJPcWAvmcwJmdtOhBj70VmepcSacvD6wEa4roSoklTUkE78PZPrQa6QBFoeH1nol
	xJWPgsv0EUhTKeBw5ViWBuQpHJ8W81FL7wgW3irvXMy5qG0Nh0nk7DKxQwKnvsEpSgQmxLs3ZUi
	20L71t2y+Nj9kBy8pnCpaH9Gm1kW8GdClrKh0OKp8fYxgiv8R6vMeJ9kMFE=
X-Received: by 2002:a17:903:1b70:b0:2df:4876:50d9 with SMTP id d9443c01a7336-2df9499777amr48858435ad.18.1790485714624;
        Sat, 26 Sep 2026 22:08:34 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm26615495ad.45.2026.09.26.22.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:08:34 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] ntfs: do not turn an unmappable runlist fragment into delalloc on write
Date: Sun, 27 Sep 2026 13:08:21 +0800
Message-ID: <20260927050831.2739166-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790417653.git.matthias.goergens@gmail.com>
References: <arMoap0ZgeORuktT@hyunchul-PC02> <cover.1790417653.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_write_simple_iomap_begin_non_resident() has the same unchecked
retry.  LCN_RL_NOT_MAPPED passes its "lcn <= LCN_HOLE" test, so a
buffered write into a range whose extent record cannot be read is
merged into the runlist as LCN_DELALLOC over clusters that are already
allocated on disk, and write() succeeds.  If the record stays
unreadable, writeback fails too and the data never reaches the disk;
the error only shows up at a later fsync() or a synchronous write.

On the volume from the previous patch, after a read of the file, an
8 KiB pwrite() at vcn 1000 returns 8192, fsync() returns -EIO, and
after remount the range is unchanged.

Fail the lookup here too, with -ENOMEM or -EIO.  That pwrite() now
fails with -EIO.  Writes whose range can be mapped are unaffected.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/iomap.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
index c812d7f19b360..b4475963e57a7 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -394,7 +394,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 	loff_t vcn_ofs, rl_length;
 	struct runlist_element *rl, *rlc;
 	bool is_retry = false;
-	int err = 0;
+	int err = 0, map_err = 0;
 	s64 vcn, lcn;
 	s64 max_clu_count =
 		ntfs_bytes_to_cluster(vol, round_up(length, vol->cluster_size));
@@ -429,12 +429,24 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 
 	if (lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
 		is_retry = true;
-		if (!ntfs_map_runlist_nolock(ni, vcn, NULL)) {
+		map_err = ntfs_map_runlist_nolock(ni, vcn, NULL);
+		if (!map_err) {
 			rl = ni->runlist.rl;
 			goto remap_rl;
 		}
 	}
 
+	/*
+	 * As in ntfs_attr_vcn_to_rl(): a runlist fragment that could not be
+	 * mapped is not a hole.  Treating it as one would put a delalloc
+	 * extent over clusters that are allocated on disk but unknown to us.
+	 */
+	if (lcn == LCN_RL_NOT_MAPPED) {
+		up_write(&ni->runlist.lock);
+		mutex_unlock(&ni->mrec_lock);
+		return map_err == -ENOMEM ? -ENOMEM : -EIO;
+	}
+
 	max_clu_count = min(max_clu_count, rl->length - (vcn - rl->vcn));
 	if (max_clu_count == 0) {
 		ntfs_error(inode->i_sb,
-- 
2.55.0

