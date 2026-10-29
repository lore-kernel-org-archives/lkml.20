Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311355;
	b=0W8cAkN3BJOfvbnkQ2Ksp+sPL4DcvcmnJFwwCRrPGIaqVIMxmVxpdxGmsKKTnzQGeZEu
	 1BQGT+xCfVdJnIqoCF9tF/laWGBtLod8Mrvhpzhc/dOudi2TofSBzyczt76M24a8KFTxY
	 VHDDjywgfXB4vbI2JnppCuprf/baw5qGcHf1UizQpw1q7fOBuySuVOjYJgFqaviya/GG4
	 CFC2A4vE5ulKi7MpjhxacW93hLPVc6xzC5sZ6i/sGGgli1BuTqBvquxJfK6H6w2BEwfD1
	 sE+lGJjjYJUqpSZJZjsEpNwTicFyRD43WfWVU/0bTrbqykQQMonWRiVL+1sQjUfAAag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tqi07G2NK5B5Re2GQGo+ZSlYw+c4Yb95iVdRzLGMPO4=;
	b=UtaoGuordrn4vm7WVRYSfC/fwceeJHpx9CcICd+EV1lGVulOrGgxWT49JfwhehCuJVcT
	 Das3oENrsOIJSnCJZ0nMiWI+bk/bBd8pdqK8PCsqTdEyT5dzndH76FXjE9HQZS2EvYxiX
	 /K852aajodL0X9h0XKrIqJpbLs+d9hNs4slL26sGs7HlBv7FTnGSk4JUBLMcT+xG2jT5K
	 O/3RJPfQpxagHfLt27A/rO0DKMsjb6N1yTXE8Ck4kFZtI7dwocKGl0eYCRsGWGM0hFKPK
	 oTUjiaVZVaZesFkCIKwM5+gw/AUgwE8BR7SaJg8REcG4YXUNRhMz20PGkaNNZXjCH4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EZAcwi7c;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00B9606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B00B9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EZAcwi7c
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so9881c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311354; x=1793916154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tqi07G2NK5B5Re2GQGo+ZSlYw+c4Yb95iVdRzLGMPO4=;
        b=EZAcwi7cNjE8Z3elHqVYyVHf5F58mrbaRpdJuodzcKIs2zIDyzeNU7YF3fJi+rKU11
         ZFYQ7deGZRP3GtgLfcUnCE1CozHJud+8cYl5XZJbOTrvDbBTqaeRPT9CIr0DuNKCx3zg
         /fs75bFXju9fm5gr1oxoKpUWPXU5Y1wlETogtVrKhpEPT0Q3UWo71bmzoqdk50zxUZIn
         vI7xgGXQXCjvU7fbasOg6X0JyzcXXaNkvlS3H75K6dApI3GpGDFUzK9V44C/omMh4NzH
         wulFqIBY9jJ+0xb4Guooql37u+WPUsBrLZ1c/6G2ARHXZk8BWFQZ/Zrq8V6zhaAyTx0T
         nepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311354; x=1793916154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tqi07G2NK5B5Re2GQGo+ZSlYw+c4Yb95iVdRzLGMPO4=;
        b=IqSMuJQNl1OtHHMarTQdKd7iK73FCQQ2aq9jtLZL0nicf/qniNBD87NL8bShMhU6B6
         0xaSO+ad6hA0LLLDyefgyLE9L3Fms1vXsctCSZPwy2urIsl6LBCB0L6WvcVutL1Ub9IL
         QRvUXDTgtaJo1gaD68+N44p2gLw6N7/JDttAyP3tnkNSLN4LtVe3xmKPKiypH0c8yrMA
         J5jlQcGr2nXtmBFN5aulkEwMkNgye28SY6iBWT8lZXA0tzWqN5DygrrsuUGmkYltdiIR
         FUQbtIQ2rwb5I7shP15NSbeXhdohf06UiHdre8Iw77NAjZj4OXhFZAt3P8nB1FjVi9oq
         P76A==
X-Forwarded-Encrypted: i=1; AKwUvBx0D47Tzicv8Cl1P1wjdg4XqXd3IwI0yQVilyGWqnz/zEpHY6CpFDNOHFgfF6emzmst4Gy4wewWnqr5k0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPmHF5/tK9XLiLPpwfjqeoDVdVuUVd5K2e0LkMO9txFrPaUgHd
	iegUMdmFoMh8KfbZOOZnLBRVhFFErHQpNR1SaUI8N2ueXIxu6ROoy0uN
X-Gm-Gg: AYBFou2ALqy6KZDlI5gwieBPkrVd1FEPTa8c1oT6pgl2aoV08UPhrxyO6bhDwjVAvIv
	0Hibe2dRw6XmRDi3kigJTb3qDWupEZmq6X7q6TaUHnqxDYo6yNh389qk5DBHJT2AI/lfrDPW810
	C//puy2aYtCVxIodpHx2Sf5bc7OX8NY2OqKyeQcP0OSFaznXNef26tGCWDBEwbnVQHW5zACMenX
	/NGH5oNuilj2+WeUr42xF1CJMPoamqSEcDPjRXOEWF8zQFwmlZ8/ug2n+9usMMpvoXGLSNp569T
	wD1IKkDEAjKB9HR4x3vzmEM/q6PX4Tm4QdoyzDknQhR+ZbJHurOLE+29NxsQJTjFDLxg//KOaFt
	p62ZzXY9z4jL0XA60YJKi7B9dW2sItt9d5ewPULNVK/sOB1tXZUu24Py8C7OnrdewxT8rmqp7I/
	IqX3n45wCnzqs3Rm0zsYio9hrqrI0tobFRktoJIzyiDBVRw49aLrjip+4ApYy9HsDGsYXiuisO+
	Wlgrj1gvupDSj2dIppG/8/COuy9ssLVPFbG+IW7ZayQPCqZuZoC3OUoIsGU+JKAJrgvVxiGfBLH
	wKVrMgkfhPGxEYSXvzi9rtV1b87MfyxXhQFM9fCUauS5Px9wT4QDIbbg
X-Received: by 2002:a05:701b:4354:b0:1a2:6b9f:f7e1 with SMTP id a92af1059eb24-1ac5cb1a31bmr472033c88.14.1793311353726;
        Thu, 29 Oct 2026 15:02:33 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm1316007c88.20.2026.10.29.15.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:02:32 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fs/ntfs3: accept unchanged read-only fileattr flags
Date: Thu, 29 Oct 2026 22:02:03 +0000
Message-ID: <20261029220203.80532-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ntfs_fileattr_get() reports casefold, compression and encryption flags,
while ntfs_fileattr_set() only accepts immutable, append and nodump.
chattr preserves the reported flags when adding or removing nodump, so
chattr +d and -d fail with EOPNOTSUPP on nocase mounts and compressed
files even though neither command requests a change to those properties.

Read the current attributes and allow reported flags to be passed back.
Continue rejecting unsupported bits that are not already present, and
keep applying only the existing mutable flags. Requests that omit
read-only flags, such as chattr =d, retain their existing behavior.

Fixes: 33f29fc7c67e ("fs/ntfs3: add fileattr support")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ntfs3/file.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 52e1cd969e06..af6fb438eaa8 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -134,17 +134,21 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *inode = d_inode(dentry);
 	struct ntfs_inode *ni = ntfs_i(inode);
+	struct file_kattr old_fa = {};
 	u32 flags = fa->flags;
 	unsigned int new_fl = 0;
+	int err;
 
-	/* Avoid any operation if inode is bad. */
-	if (unlikely(is_bad_ni(ni)))
-		return -EINVAL;
+	err = ntfs_fileattr_get(dentry, &old_fa);
+	if (err)
+		return err;
 
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
 
-	if (flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL))
+	/* Accept unchanged read-only flags. */
+	if (flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL |
+		      old_fa.flags))
 		return -EOPNOTSUPP;
 
 	if (flags & FS_IMMUTABLE_FL)
