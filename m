Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320705;
	b=J/N8RYGu7K3X1deFggX/DIXP2dVFtiSta5SC3b6mcXBfDyFWDI8qS5KvPhZ+cqdBYppl
	 Z/V6W6eAMz2dwWPlGRkWfBFSTLQXkMhz6UIzlyVb0a5mTTmIwuFGeVPfZTu3cPIdGHMqH
	 XY96gnqt2sqanZAwnxQF3AehaDsvlS+qWZRVIyaWFyVvvLdC7Dt0CXdCfNSj0V5unvt1e
	 5B2ptEQxXNVPWbpOysCG7Jcrpk5v+BhdWJFmjjd5GFW9s6jOUg15T2ogAfh9MHo8HFqIL
	 lY3p9V0ImMmo/I3VrcXOhElPX2suTJAGwuEqf12LXdI0V7QxkfT07EQvzQA3ktMLOuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AECngfj1kAfXiTFqlbWklHQFFBTR9hHj+ExNCNNt7RY=;
	b=sJxtNlJG85qjaE/nqL/vE8UfUK9NrqDj+Aza0R4/Xz4Exi8B2d8o5EYv/y7fT7eRT+bx
	 x1/kU0A6/8SG1yDnuJTTGgCr/lRSvF4Qr+Y1fc5FsgfhK9pWMIYfE95KNh3UUQOfYE1Nk
	 2MRQwijzlQVUxLbYkLwvrRoTvvTG7m8Lsfth3PVVuV2qZAn/HYrmTluej/zy87d2soRcv
	 zBrtNlMsdX9dgFMVyDBv2D7Ic4VEuCQgeMDgeOFE6pVkpJswJwJHSH9LVAQhvcX1BSy06
	 iOH6DvLVSoxOvjivFIn67qPVwXOHWO5iUNWk0SKjc1aadL148SSznwvW7Fopj+YrKlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hRBR0pqS;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C4460A2605
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C4460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hRBR0pqS
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5365d26ccbdso23624071cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794320703; x=1794925503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AECngfj1kAfXiTFqlbWklHQFFBTR9hHj+ExNCNNt7RY=;
        b=hRBR0pqSkrnFTH4GqUj4zzmhaASAKnAa1PUmTZzju/+YyUBw+UAreKVFSnRRHt35jr
         NaoYDzyrc70DgK8aa2l9XtSHuebxWl//C76ZtGTGsrHAuCCW+BgqlpaNrhow/PqpR1ky
         kQw2X9JPjWwbG8Vsf81+EfSK/wX7rTvCQ1wtNEaNzgRsYzRVnI221q07YpGPc52Ky0w/
         fuYjbroMkFdnAV5BvyPBqzhVFpvuUcvKxiuY1bWSSvnQTA8rgpUdFxT73dAMhsHZxfq1
         a1jildRfxReUl9kz6N7Y6aZgRMhbPcA1n3UMaBtRpvV729G0kfX07LmgoXjJq6yVj30b
         64Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320703; x=1794925503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AECngfj1kAfXiTFqlbWklHQFFBTR9hHj+ExNCNNt7RY=;
        b=Gw6nllLEzseXWdaK5GvFwsbxQT8TIKZxUujlcwY2wsD536sQpIlfU26PsOtwO7G4v0
         xrUiiJfcy2Y4ehET6Vri44GvvYfAxiTBx7nAVBwu6zhb5miWUWuD0wXznoyLP+jTH6t6
         EGzf3cBx27GRSHV2IMEgTUrtEohZhkyRkDiCpZ9DXc2K0L6sGt9P6a0nOLzPxCOASxDx
         3/v59mjxihUtPSAp7IV7HxY/h1An+RAyE+yKURWFHNHofiUk1CQgKIzAIDxc14VQX+S1
         X/+Kg85pYtfATpKyOzmTs4JxrmPz82ENWTw1xjoQHlIyndc1ilB5/jNvcMLvWKgsUCWd
         0SGA==
X-Forwarded-Encrypted: i=1; AL+hErHP68kZF3b2ja6OsZ14k6yg0bMaG2RHP0kNAi0K9vsFHNwhg/KZj67vKw0uY3V686xdZIcbpJ3bxiqwUfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pq8znrAeluFXYE7DzeaFu3rQaYY0Yalyx+kvusvV28FOHAuvt
	P9E56X/IVA2xCzmClMKNJFsKvyXtg7YzNG+6qZAc2ogozkC7ReLHRl76kwo8d1I2Kyk=
X-Gm-Gg: AYBFou3f75TLtCwUHD2lhjhexwbhuzzbdP0JhlrqahDrCNOxBQYu6Pl0ggAE/8rgm2m
	Tk5SAsRF9uzCX20hWoNjEE5uVr2ieESBdhAfCdvlA3j7E6/O1LLsHeJZTiuMk+3uovfZLUWp/rl
	ZJNE6rOLxG30f040ubpXg7upvii0jt2p3jI4TciagVSVIAqP3s/ljGYLqN82hKjMcmdNTFW/nLF
	JCnbRGqw06+li40YiqpEBmAevEfmOBCBkiYe78K7DlAeabxPvbaTM2Rbk8IV7rWM4ntCivUc6z9
	hVDK7IsNXTEtdZwBb2K+ymgZ3HttNFBCzdpNMRY+zYCZ/yUo9Eb4X/oIDWiOzoi/WZtO4iQTa6l
	EWIylgTeD7bHjz6xVcgOQNPaTR+K+Zl8QhMvAE4UBizEocUmbGLcohR4g+YWOv3PunK/2LBvC48
	6Npd1AV4FTrK8fWRrRmnSToDukJRyKphhSfrrek+m2vZdXgjoEPwZt34BqAJ1X5YAu9RvW37/OL
	HRE4fLqxaEFulDGrB6KUwnm23SSzV4NROFkt51sdRHaQ+27ALtbQTHm45783Dtd1K9cQiWEaTaM
	RNVf15uILEeppYWNso3Ml/BOV9TXivtGS0sJ1qk6rn4csA==
X-Received: by 2002:a05:622a:653:b0:535:15a9:2516 with SMTP id d75a77b69052e-555291c2894mr41649641cf.53.1794320703461;
        Tue, 10 Nov 2026 06:25:03 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550c21e1fbsm24834331cf.27.2026.11.10.06.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:25:02 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 10 Nov 2026 14:24:50 +0000
Subject: [PATCH v6 2/9] fs: add sync_fs_and_bdev()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-b4-ovl-containerized-sync-v6-2-43d1be16a4d6@toxicpanda.com>
References: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
In-Reply-To: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794320698; l=3481;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=cFXSmoX1EdwKarrdrXPJnOWTPV4jjSodNuQRhzCnuDg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJ7Xh6/QCyzvojjwCLy3DO4GMiUz+R8OGkR0vYdjGesZqw+SMpDnXvivajMC5tvY86ahnHIHU3e
 WVsd64FGGzgY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

sync_filesystem() writes the inodes, calls ->sync_fs() and writes the block
device, first without waiting and then with.

overlayfs is about to write the inodes of its upper filesystem by itself,
only those that were modified through the overlay, and needs the other two
steps as they are.  Move them to a helper so that overlayfs does not have
to know what they are.

sync_filesystem() calls the inner helper, so it still tests for a read-only
filesystem and for s_umount once.  The exported function does both tests
for its callers.

No functional change intended.

Suggested-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/sync.c          | 52 +++++++++++++++++++++++++++++++++++++++-------------
 include/linux/fs.h |  1 +
 2 files changed, 40 insertions(+), 13 deletions(-)

diff --git a/fs/sync.c b/fs/sync.c
index 0681bfcb2da6..c5e49914918a 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -22,6 +22,42 @@
 #define VALID_FLAGS (SYNC_FILE_RANGE_WAIT_BEFORE|SYNC_FILE_RANGE_WRITE| \
 			SYNC_FILE_RANGE_WAIT_AFTER)
 
+static int __sync_fs_and_bdev(struct super_block *sb, bool wait)
+{
+	int ret;
+
+	if (sb->s_op->sync_fs) {
+		ret = sb->s_op->sync_fs(sb, wait);
+		if (ret)
+			return ret;
+	}
+	if (!wait)
+		return sync_blockdev_nowait(sb->s_bdev);
+	return sync_blockdev(sb->s_bdev);
+}
+
+/**
+ * sync_fs_and_bdev - call ->sync_fs() and write the block device
+ * @sb: the superblock, the caller holds s_umount
+ * @wait: wait for the I/O to complete
+ *
+ * These are the steps of sync_filesystem() that follow the writing of the
+ * inodes.  This is for a caller that has already written the inodes it cares
+ * about.  Like sync_filesystem() it does nothing on a read-only filesystem.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int sync_fs_and_bdev(struct super_block *sb, bool wait)
+{
+	WARN_ON(!rwsem_is_locked(&sb->s_umount));
+
+	if (sb_rdonly(sb))
+		return 0;
+
+	return __sync_fs_and_bdev(sb, wait);
+}
+EXPORT_SYMBOL_GPL(sync_fs_and_bdev);
+
 /*
  * Write out and wait upon all dirty data associated with this
  * superblock.  Filesystem data as well as the underlying block
@@ -29,7 +65,7 @@
  */
 int sync_filesystem(struct super_block *sb)
 {
-	int ret = 0;
+	int ret;
 
 	/*
 	 * We need to be protected against the filesystem going from
@@ -52,22 +88,12 @@ int sync_filesystem(struct super_block *sb)
 	 * at a time.
 	 */
 	writeback_inodes_sb(sb, WB_REASON_SYNC);
-	if (sb->s_op->sync_fs) {
-		ret = sb->s_op->sync_fs(sb, 0);
-		if (ret)
-			return ret;
-	}
-	ret = sync_blockdev_nowait(sb->s_bdev);
+	ret = __sync_fs_and_bdev(sb, false);
 	if (ret)
 		return ret;
 
 	sync_inodes_sb(sb);
-	if (sb->s_op->sync_fs) {
-		ret = sb->s_op->sync_fs(sb, 1);
-		if (ret)
-			return ret;
-	}
-	return sync_blockdev(sb->s_bdev);
+	return __sync_fs_and_bdev(sb, true);
 }
 EXPORT_SYMBOL(sync_filesystem);
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index b5485f2c1f2b..094a4be6828c 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2617,6 +2617,7 @@ extern void __init vfs_caches_init(void);
 
 void emergency_thaw_all(void);
 extern int sync_filesystem(struct super_block *);
+int sync_fs_and_bdev(struct super_block *sb, bool wait);
 extern const struct file_operations def_blk_fops;
 extern const struct file_operations def_chr_fops;
 

-- 
2.55.0

