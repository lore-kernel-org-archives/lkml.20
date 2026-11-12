Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494312;
	b=z/S7+ByrWCaOSrp8ieA4bQoDVi1Dxyy4TCuWuISh6AwE7zEaGWerHjO/dBB5Kl6lxyO/
	 WIM0pTK4ce7S+avHmXYv3o2PQI9ZSgEiawmirrD2UH1xowlo6auM/IOa0+Kvy/9zf/6Jy
	 ul5HzDLZhb4hZ60c3NU6vyORfLjkp9HfyN4nGSPm8BH7pE6oEXJO9dfHLXOMPOUNYjGTD
	 NzxauQC+gB5F0Yms2e8XHMdsR6Qdsz8QYoXuX+v6kqeDoLAVg1jiin9vHso9OxPebaiH3
	 I5wa0+OF40aMXeJr1ToQeNy8ExGSfGFvJMtf+O16FSsXmrRCxKyD4kVojnWXPLxbN3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aU65DXWpgUDuu4YacradlXYGME3zl5bqQYFhid78PgE=;
	b=QDzxxxXWX/Lp9NaWEdr1sqUxT3Y0iisymwQ/+wJ9iDZ8+oSB649kPHfZk3SLvJYKNSoi
	 9lc/KLdT4vpsSBxOSrSNnf2IA4hvIze6DUayaBPf13Sw+rcQKeXKOdiVtY/qXlULIxuFB
	 4XOLlmn9Fr7uV4cMPbCe5HcN46bWiTFRhNOXzw3qDBs+ppkiT3Ga8+RJWXO1zSc//PXo1
	 pEquHm3lXibrb5A7RoBcitSAlNSD1S3nfAG9iWQEpdYGD5vE2AWcfLDnnc5HEExS7ivDn
	 3Vn2IKuXXvZLExe33cQRzMFK0jPaVayP+kWUwhGYvlWr0/qo2i20jyINYvOPhuWyMbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UMd+xXhL;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B0606A888
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 037B0606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UMd+xXhL
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b570bd4817so4493690a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794494310; x=1795099110; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aU65DXWpgUDuu4YacradlXYGME3zl5bqQYFhid78PgE=;
        b=UMd+xXhLJmKC1IgPTMjPFl5rKD7TK2v9ge8DS6A1snrinopBefpOygGylZ1WrJb2hD
         fpRmeNRiib8KJegdHUkExTG8GPOKFiGycIcOgNznS+d8SvyxFdti3sjVYl+VY3bdKebK
         YCbhJ7HpVBFwMxBmrq6O04G8EXnRQdnaxCjBwUlHPRQxmEC9nJtCBWjJCutboSxg8AA6
         iGUlKi0fDZjxCbeFfGSBiy5mXIqQ0vX4sh9wuaQR12o/kExBoi6Mg7ONBtudUHX87S14
         tAC2/dYE3kk7AWU+eFoXYWGXSUj+mMXnVRqXXymW95XeI1V+N/gUh8hRpG1MnYJQCjDg
         YvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494310; x=1795099110;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aU65DXWpgUDuu4YacradlXYGME3zl5bqQYFhid78PgE=;
        b=Utr1HX6fQD5k36H44CqoK+JmhnfuL7CyjKgU2q0K83sv8htSUwiR7ZGf9xitr3Dllf
         6bnYzdTnPVXSbM7rFYaLzUDqF5IThB1+GvgALKl1dnDluhOYlGdYS7h2hB5sYZ7uTgJp
         gCZ/2yTlKq+mh/Xkmexi427+8P/qfsRf+cYB6ZAcHFac3ozx86Fox/9HAPSex6dDLsJK
         +cKUgwc8XO0+SE3PBoliYqmuYcuLmdmStyuCjP+Cd+FyAeFAg7iGzwNZ8xBUWxIhz43d
         vWSfOGOW+eJiCotDQfYYvWR2rkVUpV0CGoskfS1wq+/v61XDnUOzPzDKGLZhzEtWeCcq
         UACQ==
X-Forwarded-Encrypted: i=1; AL+hErErYE29X9wTjuhIXsELos7ykFLJzFSdiWhVdWXaVTSMNjgOSM9ojeqrDtvpulmpOKr0F4fXfCPbulm6guc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sl1zZ9ZWaTv5TTa0zXSg2EBIRlb5Ie66tjlh90EVuEcbEqggd
	Sxad4HOJVUPynVuFPwc9t+2UI8TaSJ55+T9ajXzg0kd5x5QoDnwX6DJpSuH1BMsVK2WPv+SlqGq
	VuKjABuYJ6VppyysYUzr9c+avoYCVlw==
X-Received: from edqv19.prod.google.com ([2002:aa7:d813:0:b0:6b7:7ca4:bcbf])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1f03:b0:6b5:767e:f030 with SMTP id 4fb4d7f45d1cf-6b77733a4b5mr4305876a12.2.1794494310336;
 Thu, 12 Nov 2026 06:38:30 -0800 (PST)
Date: Thu, 12 Nov 2026 14:33:51 +0000
In-Reply-To: <20261112143355.2923939-1-jprusakowski@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112143355.2923939-1-jprusakowski@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112143355.2923939-6-jprusakowski@google.com>
Subject: [PATCH RESEND 5/9] f2fs: truncate blocks allocated past EOF by a
 failed direct write
From: Jan Prusakowski <jprusakowski@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Jan Prusakowski <jprusakowski@google.com>, Eric Biggers <ebiggers@google.com>, 
	Yonggil Song <yonggil.song@samsung.com>, Hans Holmberg <hans.holmberg@wdc.com>
Content-Type: text/plain; charset="UTF-8"

When a direct write extends a file, f2fs_map_blocks() allocates the
blocks past EOF and maps them into the dnode before the bio is
submitted. If the write then fails, i_size is not updated, but the
blocks stay mapped past EOF with whatever the disk contained before.
A later extending write or truncate can make them visible.

f2fs_preallocate_blocks() already handles this for blocks it
preallocates with F2FS_GET_BLOCK_PRE_DIO: it marks the inode with
file_need_truncate() and f2fs_file_write_iter() truncates everything
past i_size after a short write. But the preallocation is skipped in
LFS mode and when the user buffer can't be faulted in, and then the
blocks are allocated by F2FS_GET_BLOCK_DIO from f2fs_iomap_begin() and
nothing truncates them.

Mark the inode with file_need_truncate() also when F2FS_GET_BLOCK_DIO
allocates a block past EOF, and truncate after the write if the flag is
set and the file is shorter than intended. Skip KEEP_SIZE files, where
the truncation would also drop the blocks reserved by fallocate().

The extending direct write is always synchronous (IOMAP_DIO_FORCE_WAIT),
so the result is known before f2fs_file_write_iter() returns.

Fixes: d4dd19ec1ea0 ("f2fs: do not expose unwritten blocks to user by DIO")
Assisted-by: LLM
Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 fs/f2fs/data.c | 10 +++++++++-
 fs/f2fs/file.c |  8 ++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4ae61138a003..e978b6b18c26 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2171,7 +2171,15 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 			err = __allocate_data_block(&dn, map->m_seg_type);
 			if (err)
 				goto sync_out;
-			if (flag == F2FS_GET_BLOCK_PRE_DIO)
+			/*
+			 * Blocks allocated past EOF must be truncated if the
+			 * write fails. Don't do it for KEEP_SIZE files, where
+			 * truncation would also drop the fallocated blocks.
+			 */
+			if (flag == F2FS_GET_BLOCK_PRE_DIO ||
+			    (flag == F2FS_GET_BLOCK_DIO &&
+			     !file_keep_isize(inode) &&
+			     pgofs >= F2FS_BLK_ALIGN(sbi, i_size_read(inode))))
 				file_need_truncate(inode);
 			set_inode_flag(inode, FI_APPEND_WRITE);
 			break;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b67782043396..3fcea85c36a2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5896,8 +5896,12 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		}
 	}
 
-	/* Don't leave any preallocated blocks around past i_size. */
-	if (preallocated && i_size_read(inode) < target_size) {
+	/*
+	 * Don't leave any preallocated blocks, or blocks allocated by a failed
+	 * direct write, around past i_size.
+	 */
+	if ((preallocated || file_should_truncate(inode)) &&
+	    i_size_read(inode) < target_size) {
 		f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		filemap_invalidate_lock(inode->i_mapping);
 		if (!f2fs_truncate(inode))
-- 
2.56.0.567.gdb80ae8cd5-goog

