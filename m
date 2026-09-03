Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D104A99DF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440426; cv=none; b=JdqC/qKGaCRkcHHbIMRcqUci4ytdBK8HBVoLJGZOSX0AIoyiVUI/NnZWAQ5rLG1BM3glQQxqlXOHDDbp34HpilZBv5igRPbfEX2OCqGYiXf1ob/4lsOBU9twQUM1VQp+oXLlaamstuIRf7+Amtwt/tgRWIC4Z3B79Wq5WCNlk+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440426; c=relaxed/simple;
	bh=jIu+OlxanokFLSfiquBpo8YXaj6PW7O81zppVlD1xwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTqVu3uY3KlO577svGT+O+pw3jmrdl8YiAUoioMftj0ivnpVWsdIxFbwNPuEQC62E53Whj8+VsFTqeOb/8jadIAxLgmqorrLf8f5mSRCbKT3Vvi5j60NtmJX3ftOA8eoVVxMUH2jHs0jdGp4Qj6cfolr+l+QAAQ4szBE/Lx9wV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mma0Uzwk; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mma0Uzwk"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-853c401326eso1435637b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788440419; x=1789045219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7QKH2r7d66SxSFJm8bjz6ZBcyuRFjzyujOBEDXlc4U=;
        b=Mma0UzwkG8xdTwfb5jJvwaqAGSgzGlon5iJSbIfZHE7aOiBS5BkrAAGIdtXw+ZZnJI
         bsMOnhT/8Dt4ESWQCNeabTfU6DJH6nDwYZfiAbp7doDCbdly05zXPw6Mt1DbWq2x168p
         9t1vu0CxqB8uhPQxRQIhW3U1HACEsgRD3FD5aJE8X2l+8uWcY2uCpTDO3BwkB4//R3Wk
         V8shx2IszUFho3C+p1s/mM5TpAxsN25aw6jXfKPxE1McPCSR+1BQmgFI0HvqEmQYf8Qg
         b0dkYmFG4cSwWOAJdxd6OKyj9gUYQlCEnCykWDfcgGTpYasySjS1TVHHgLGYtloWzShM
         EZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440419; x=1789045219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7QKH2r7d66SxSFJm8bjz6ZBcyuRFjzyujOBEDXlc4U=;
        b=ESfuI/1/ZOXrPIsfvWhljGu4o+IbCOmFUMdG+/bjRpvU3UDBSiBI+I2P3uWrybscFJ
         sh0zKuRFyY6oK2Y/127RlZk0+1AEfP7tPIfYhU6AaEZqStWuaGfQAXxV1J6ZpjoFuZZQ
         6IdeFVsgayGgPP24GchNCCAJYdULPw4L6dVoGnCvNWNLB9k7I/VCWLReBQdtq/CYA3/V
         EaaqWbqv5EmGurHlEVkVnYUOYd4lTnDeKHn+SyHYx8a9fh8HUXGFyuMHq4iPrekvQSP1
         b4XSuDh0Fs+zw8Su+mmLCB0xJ05+uabEquLPlyQ9j7ca0VfElUbtF3mb7SB7D5Q99dDy
         Rqpg==
X-Forwarded-Encrypted: i=1; AKwUvBx7/V8xSL0B8d5ErjN/rMGFoHGb9Y7AkMbFgo0SubG3CNfJRaurkPZeljVzFoAspncibMT2v7gq9jTp6bA=@vger.kernel.org
X-Gm-Message-State: AFuF++k0DdIqpVvyFYuUC/pHlOBiErolaG/BEq0VVh+LHeG6xkE+SCx2
	DAdRmAxE9BLFlHN585/ec34L2abDZ+SaoXfX2k9r4ws8xBYDuJCE7ftp
X-Gm-Gg: AYBFou0MqO+qVu4ujMDoyMeCBhaAo+AIrNB5QH7PuOqNzwfwAmWODaccWoZSaB45r8p
	d21wwN8XUMtehN5vdNuC7y9KwO8QIHYFg0tRN6tEgANOU+aiU/zQfMFDGVenJll/5wjgDYbSssj
	Dr35E+zvxv3DXKwxy5xYzS+MMmVHwhAkc8drngCTDFTrL5jk/d+A5+EcytTWw4dY4jaNvhDxgLG
	4UrX4XghEA2oVHs9z29jM8JkEi0xteQsW3bJOS4vIE3grx9X5qeQqq3lGPuzKnmveE8lGA6QUFt
	S4FEMQ4krM+Xsdf8K5EF4QAGsKfSmoXiazYNWstCF3qbQ4uD4zovYzn9I4m9/NNcxhs4+wB6R3T
	1wkdJham57+s08Bv/hbFXhMWrfmcOg6izuNV8dtMK+ZgOIfSkzX8UARyXHKdmhqZT2JTVJxHTV9
	L7gvC/eHjVvCU+j/26OkdP9Ro1Cx+7G03o6NMLDYPUKWxRby8Q9C47So1ZbwaWcJhY/s2zvv0lW
	EUgpRm+ohfMf4SefZeVHXtp
X-Received: by 2002:a05:6a00:1a0d:b0:85f:4255:59a8 with SMTP id d2e1a72fcca58-85f42557303mr14081961b3a.10.1788440419002;
        Thu, 03 Sep 2026 06:00:19 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db23f7bccsm2980946b3a.10.2026.09.03.06.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:00:16 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	hch@lst.de,
	jack@suse.cz,
	axboe@kernel.dk,
	tz2294@columbia.edu,
	baohua@kernel.org,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v4 2/2] f2fs: enable buffered RWF_DONTCACHE
Date: Thu,  3 Sep 2026 20:59:53 +0800
Message-ID: <cd5bc4fbb9000e5936dfc96e97ed1e8ab94d0a94.1788438786.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788438786.git.qiwenjie@xiaomi.com>
References: <cover.1788438786.git.qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass FGP_DONTCACHE to f2fs_filemap_get_folio() for IOCB_DONTCACHE writes
and advertise FOP_DONTCACHE.

Keep the F2FS-specific lookup because write_begin_get_folio() adds
FGP_STABLE, which can deadlock here.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/data.c | 9 ++++++---
 fs/f2fs/file.c | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b0fedacfd12..6e816c9349a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3884,11 +3884,15 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	struct inode *inode = mapping->host;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct folio *folio;
+	fgf_t fgp_flags = FGP_LOCK | FGP_WRITE | FGP_CREAT;
 	pgoff_t index = pos >> PAGE_SHIFT;
 	bool need_balance = false;
 	block_t blkaddr = NULL_ADDR;
 	int err = 0;
 
+	if (iocb->ki_flags & IOCB_DONTCACHE)
+		fgp_flags |= FGP_DONTCACHE;
+
 	trace_f2fs_write_begin(inode, pos, len);
 
 	if (!f2fs_is_checkpoint_ready(sbi)) {
@@ -3934,9 +3938,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 * Do not use FGP_STABLE to avoid deadlock.
 	 * Will wait that below with our IO control.
 	 */
-	folio = f2fs_filemap_get_folio(mapping, index,
-				FGP_LOCK | FGP_WRITE | FGP_CREAT,
-				mapping_gfp_mask(mapping));
+	folio = f2fs_filemap_get_folio(mapping, index, fgp_flags,
+				       mapping_gfp_mask(mapping));
 	if (IS_ERR(folio)) {
 		err = PTR_ERR(folio);
 		goto fail;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index edc352569e8..570244ae4fc 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5909,6 +5909,6 @@ const struct file_operations f2fs_file_operations = {
 	.splice_read	= f2fs_file_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fadvise	= f2fs_file_fadvise,
-	.fop_flags	= FOP_BUFFER_RASYNC,
+	.fop_flags	= FOP_BUFFER_RASYNC | FOP_DONTCACHE,
 	.setlease	= generic_setlease,
 };
-- 
2.43.0

