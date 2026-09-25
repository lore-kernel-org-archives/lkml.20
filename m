Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EDE49A3D5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334998; cv=none; b=lPzaj0e8tsh5+8hKFOLM5C3PvFFd2IrdOYMUy4LOV7nmfpHNMAS6eVBhowGQb4x4J//nd5fkbnoVyuN2Igc371f+Da/3WerUeJ+gGNIGQD2uqPgV/Og8mBNSOpy+NW0/aNj2FsekeRbZ05qzE+qPPKvjYgeVwG1eL4iiUZovVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334998; c=relaxed/simple;
	bh=We+zlzCngSy/UjeEErH342+mGDGa+lMvJgYgEMT5s/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhS4oHchEq/BeYy+z6SyEi5Ir8c+f+IohLQ5cffnc0vZxdC4YLwYYHnidi0ynHBdJ1IQ0itcRvn/J4AeoBZgYjxbzZDQ+d2wbcWbnUFGbcyBsCpjMzt67lgNe4TbqN0B1bo5XiD3GBcqFFWxMvnqkwsTssAp6j4SfdUYjkwL7HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=N7a7YFKW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="N7a7YFKW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so8586525e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790334995; x=1790939795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdDHbNa4yNuLlpTfPbBsyNkmz/U7MP5VR/MdNvttOMo=;
        b=N7a7YFKW6dLkAUvH76vWXDIuyADRk+33adHvaZAiPxT7g76GmlqZHg92dASmSLqk/G
         b+EW6SAXDweQIceokfgY+unqN9GwYtQbCf3yEzF8xvQfYEyoVJ4jDVaXw8CgPPvtEWTT
         BXcadvVK1P4lOtvxh33XGxoLtgRpbBLkDZRIYKYpxzaEzV4anYkKABHVM++01aoGgp9x
         EPEpT3CXTudTZm01G5TAxknQDp1SlbBqRuwuZk5+TxQng7KxQ4t6w1dA7x2sNUo6Q6U2
         kfGg5EHsePiM9d+n2hruHtT7O2/0tn187ah1O6s8xI6AM7EVjdvPFxhGPG6dS3qzbs/m
         b7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334995; x=1790939795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdDHbNa4yNuLlpTfPbBsyNkmz/U7MP5VR/MdNvttOMo=;
        b=SFFOGIa0oOT5X42EG2w3Pcfk1VGVYYp8RQ2ak192ttlgOJNpwRJAhswG/z3vyAJsd9
         8DXWLFocg5vDzYDLcfgYjh4IW/f1IANSB9W8wWhEts6pGKm78/0RJyua5TSx/prPcJ8+
         ZvTB/56DJBQwD6xORcGOU1Cz3yikqnNf8AB5X8IpCxcc4zzyPtYpRAZgwn2gYB/ZusJX
         4udTa0Quo3XNCc2P/OR5LD9MbMFFHebPZKHTtyaDsF6iimPlUTRZUGHI3fKb0zh5W6rf
         nrXUWzKC7+3HU+aUAN+cDccN+H8F4XAYZlzsXn18lMQ2A7idE6i+f6o1tHNlush0XcGr
         ycZw==
X-Forwarded-Encrypted: i=1; AKwUvBzVLNUuEr641TZIo/fKxjiu7hkCW+Zc5BQxxmprJWpY7PpB79vLWlIA6BCSsSIZEh/TT2vIk2deFuUTJx4=@vger.kernel.org
X-Gm-Message-State: AFuF++kXzSiL6vqqLaHrvY9YHGCWsLalizEMeVhTrQQiCLEnYGN/RwEp
	uGRlJV/uoJpqrfLfdz2e8ZzYUESR59/+W5fTJAGpbiyO5OAzclSO/l3asXWu8PFlCbLN6Abbd9e
	8ocM9Pz0JW23EGQ==
X-Gm-Gg: AYBFou0vI6p+v3kp97f+E+I1HCdXA+CkQMihwMxNb8tcj2k1Eknfq0TVNlHOfYlgzOe
	hRGY89HOA4JK92Eq4hhF99M9/1epFgs6QlB0in/E0s1Y8nFz5Vk3lgk3JV29Sr6Fs/llOmLNni4
	KxHBTu6UVPsWiYvnoJyKuSj4RayNongfveB0mDPtVb8rmBIYuLA4dfvlxXfNtGg6EcXkK6sW9LZ
	5B14ltrOwpTAzg5es/aoeEKXrerL8d/R3CQN3J/gEoYVat+Iw2alUHJkr4NKvCoUsVf4LV7zdVO
	kdsLRUQsVlKR50nNNpuQW9G9npSKTabNQnYHFe7qq2v8Y3nQtHQ/pXp94oj8YrQKgldm3OimCQc
	q1ptv4KCwt7OB2O+/G0dbqtrebBy/Q2FF/NVfMwZgkNA0GWzhLCmFaLF9FS7Xou6I6EZVfrHWEC
	qx97/hXeb++Quk6lUXgGIP3ZbQNS039cSRztC0u2g=
X-Received: by 2002:a05:600c:a47:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49fe66abc9cmr93939725e9.6.1790334994846;
        Fri, 25 Sep 2026 04:16:34 -0700 (PDT)
Received: from cachyos ([151.36.34.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbd2dsm50237695e9.12.2026.09.25.04.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:16:34 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] fs/ntfs3: fix out-of-bounds read of redo/undo data during log replay
Date: Fri, 25 Sep 2026 13:16:13 +0200
Message-ID: <20260925111619.68345-2-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925111619.68345-1-giulia@bynar.io>
References: <20260925111619.68345-1-giulia@bynar.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_log_rec() is the common validator for log records consumed during
journal replay. It checks the header size, the transaction table offset,
the 8-byte alignment of redo_off and undo_off, and that the record holds
at least lrh_length(lr) bytes. It does not check that the redo and undo
data ranges themselves lie inside the record.

log_replay() builds those ranges directly from on-disk fields:

	data = Add2Ptr(lrh, le16_to_cpu(lrh->redo_off));
	dlen = le16_to_cpu(lrh->redo_len);
	...
	err = do_action(log, oe, lrh, t16, data, dlen, rec_len, &rec_lsn);

do_action() bounds the destination in its copy cases, for example:

	case InitializeFileRecordSegment:
		if (roff + dlen > record_size)
			goto dirty_vol;

		memcpy(Add2Ptr(rec, roff), data, dlen);

but it does not bound the source range. The undo pass has the same issue
for normal undo records, and the analysis pass reads DeleteDirtyClusters
LCN ranges and OpenNonresidentAttribute entries and optional names from
unchecked redo/undo ranges.

redo_off, redo_len, undo_off and undo_len are 16-bit fields read from
the on-disk log. A crafted dirty log record can therefore make journal
replay read past the end of the log record while applying redo or undo
data. In the copy cases, the out-of-bounds bytes are copied into the
in-memory file record being replayed.

This is independent of target_attr and restart-table offset validation:
even with a valid open-attribute entry and valid destination bounds,
do_action() can still over-read the log record because redo_off/redo_len
and undo_off/undo_len are not bounded against client_data_len.

Mounting needs CAP_SYS_ADMIN, since ntfs3 is FS_REQUIRES_DEV and not
FS_USERNS_MOUNT, but the image is untrusted wherever removable media are
auto-mounted onto the in-tree driver; replay runs on any rw mount of a
volume whose log is dirty.

Before this fix, mounting the crafted image on an x86-64 KASAN build
produced:

  BUG: KASAN: slab-out-of-bounds in do_action+0x2820/0x89e0
  Read of size 1024 at addr ffff888102404f30 by task mount/67
  Call Trace:
   __asan_memcpy+0x23/0x60
   do_action+0x2820/0x89e0
   log_replay+0xcd38/0xe690
   ntfs_loadlog_and_replay+0x3e0/0x500
   ntfs_fill_super+0x1fd3/0x4510
   get_tree_bdev_flags+0x2ff/0x5d0
   vfs_get_tree+0x80/0x2d0
   fc_mount+0x15/0x1f0
   path_mount+0x77e/0x1d70
   __x64_sys_mount+0x207/0x270
   do_syscall_64+0xde/0x4b0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

  Allocated by task 67:
   __kmalloc_noprof+0x1cc/0x480
   read_log_page+0x354/0x5a0
   find_log_rec+0x383/0x5f0
   read_log_rec_lcb+0x1c7/0x550
   log_replay+0xc85a/0xe690
   ntfs_loadlog_and_replay+0x3e0/0x500
   ntfs_fill_super+0x1fd3/0x4510
   get_tree_bdev_flags+0x2ff/0x5d0
   vfs_get_tree+0x80/0x2d0
   fc_mount+0x15/0x1f0
   path_mount+0x77e/0x1d70
   __x64_sys_mount+0x207/0x270

  The buggy address is located 3888 bytes inside of
   allocated 4096-byte region [ffff888102404000, ffff888102405000)

Reject redo ranges that extend beyond client_data_len. Also reject undo
ranges that extend beyond client_data_len, except for compensation log
records, which can have undo_len set even when no undo bytes are present.

OpenNonresidentAttribute also reads a fixed-size open-attribute entry
from redo_off; validate that the entry is contained in the log record
before reading it. Because check_log_rec() intentionally leaves the CLR
undo range unchecked, also validate the undo range locally before copying
the attribute name from it.

Every caller already turns a false return into -EINVAL and aborts the
replay.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Giulia Aloia <giulia@bynar.io>
---
 fs/ntfs3/fslog.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c23e..88bd6ef98467 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -694,6 +694,7 @@ static bool check_log_rec(const struct LOG_REC_HDR *lr, u32 bytes, u32 tr,
 			  u32 bytes_per_attr_entry)
 {
 	u16 t16;
+	u32 off, len;
 
 	if (bytes < sizeof(struct LOG_REC_HDR))
 		return false;
@@ -731,6 +732,17 @@ static bool check_log_rec(const struct LOG_REC_HDR *lr, u32 bytes, u32 tr,
 	if (bytes < lrh_length(lr))
 		return false;
 
+	off = le16_to_cpu(lr->redo_off);
+	len = le16_to_cpu(lr->redo_len);
+	if (off > bytes || len > bytes - off)
+		return false;
+
+	off = le16_to_cpu(lr->undo_off);
+	len = le16_to_cpu(lr->undo_len);
+	if (lr->undo_op != cpu_to_le16(CompensationLogRecord) &&
+	    (off > bytes || len > bytes - off))
+		return false;
+
 	return true;
 }
 
@@ -4736,6 +4748,25 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	}
 
 	case OpenNonresidentAttribute:
+		t32 = !rst->major_ver ? SIZEOF_OPENATTRIBUTEENTRY0 :
+					 bytes_per_attr_entry;
+		off = le16_to_cpu(lrh->redo_off);
+		if (off > rec_len || t32 > rec_len - off) {
+			err = -EINVAL;
+			goto out;
+		}
+
+		/*
+		 * The attribute name is copied from the undo range, which
+		 * check_log_rec() does not bound for compensation log records.
+		 */
+		off = le16_to_cpu(lrh->undo_off);
+		t32 = le16_to_cpu(lrh->undo_len);
+		if (t32 && (off > rec_len || t32 > rec_len - off)) {
+			err = -EINVAL;
+			goto out;
+		}
+
 		t16 = le16_to_cpu(lrh->target_attr);
 		if (t16 >= bytes_per_rt(oatbl)) {
 			/*
-- 
2.55.0

