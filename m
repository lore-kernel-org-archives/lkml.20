Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C041F35E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233460; cv=none; b=kS+0goLYROwSgA+4DeaNTppQAo1Qag8cv25PDCarBO2JslGhyINqOVllCaXng0DDGWYxKD9acVvue2/BRmJCdTjvE8TNIcJOMSTA37dBOITaF1LJl34WfrOAF6muUleHkqzUlXk2aB6W5xlvD/cXrEl20MKjXPxwgfC0tRzrIJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233460; c=relaxed/simple;
	bh=hSzjj5EWj93aJkVCLgJoqkSUV4JeHbR4WsKjyBSNkqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aoVDI6are7JFJ0w7qPa6mG4icx+hdpjbAp3iNhYjhRpj5Rg17UZr1fsqQO3nqySplhTiM55d0GixSWj1RifrEpqxDLXpUwPoscVQB4m89hgoDqVK0ek2fggymYOhw3c0ZVy1SkkNWsWiGaEC+rhYBF1c95TypRWbaSG+3iUvRqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AASOGoCP; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AASOGoCP"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91c22d27dso6708065ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790233453; x=1790838253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y2LTg3vvPFgbzPTkmqn0IohkH/9PUn3rBZlX6gCR2Kg=;
        b=AASOGoCPmgpcvKwW6C5Pij6fWD8oWuFePAYlGNEP4mei+K+IJw9mF+JkIpQtNfBW3R
         stxNIIJwQPht3FDyHXjXhQp1geXi+E7nnhl4xbqWLJkDEYe5Z5v/Ty/fgaTrrjdf926c
         hTagZ9ZJ4z6ZiRBbabJnvcvRZUdXOZMnfMi3MfspG+oz3fs68Edx/NAzWoy6TcGZVh5I
         jEcnjwaswU01AsVQO0AmnRM0kzy+Eivj9n+s/OgKsyxbNY1qMzx5UuGMPzBIZjtu24XW
         T5PizlQ1hjSiixUYz/GUJ6/1IhYIk8kbnuW65IJ5IfRPt/SO/3ajhjlJTNGQYQyvuhdU
         0vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233453; x=1790838253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2LTg3vvPFgbzPTkmqn0IohkH/9PUn3rBZlX6gCR2Kg=;
        b=18cX6Bkwx65I6A1xX5/LlYBtvImouY0cE6IMRCLpAt2MRImyI+DIurIyYdnIaz5n3H
         fe0xVubTb4+6dJElIHl/nBvTvc82Tnqwk2VeL39IHFSLE4iMhhEk8yeka02nnSPFXR4J
         tt1jKci+/ge7WpQbnYj/In/qjn2X3XkVBUqgCXpxc/Y3EDDBLZH91ECy8aE75fxzQoMa
         7pdNU6szstaz0xataCUSs9Q3ZK8ZJFCUOCpX5VXMlGBVs8E9afNAp0o5xJ+DG7qsrt+V
         s6Z9qYM3KXGzRcOGaeY2IWNwQhbis2ZUg95esV8nWn238FBx1dsgsP/4SnCQWuBf45KR
         OSAg==
X-Forwarded-Encrypted: i=1; AKwUvBzE5qN/k1n4UisJtkvBakiiDXGfyRmmMhzRf1r1Cstowpcr2iB8ZD1vjrG5JkaoG06A2A9tvgEZTENKSzg=@vger.kernel.org
X-Gm-Message-State: AFuF++mvEM9FEg/8tytHDAmoYyMaZ92vT2XWiHGZrNknZUNb8cWZeJix
	QOIJ9UfHjZjDfSMUCvxBmWQqVYZGR8OtrREXVkUrGJskSbamstH8BVm6
X-Gm-Gg: AYBFou22kXBBw7VZb91bepQVG6QQLn1kQQG1ofSJS+mWRDW+DYp7X04UlYfOuxms6Kl
	STku5PErtrNKwbW9euRnS9TdDlSH2qPFw8vfJQweLzrFtVfhpHgUvszbM9e/q9lraGLA4HoqxYx
	3OoyzoTjT/oYeeCKC9aUPsTmtDca31RZe96fx4BFRwOa2mOaYm+yuCla+y7LAtv8c0dNDAaSAyi
	F/WubRVEfkotxww6ygcNWm+ZEm5TllscGdvuQaBMQPUOws5bATLwB3Y4pHsv5QrQmMQXg8Tw3Po
	yurhHJysev+wMCWoz3TzAHZI1v1ExAuVP7vglgCQjvfcDdiTrLc5EpqCDtYRnL+N1y71/G8w/7i
	yAFD1ljBDgDZMcnRTyhTXw8hd9Cnz0RjLHVIhd9KzhtrxUxW7Zq7u7yLkGXn5EXoiU0ZD+aHofr
	sPVuPLkhMa58Lreoot9f3ecJ5SbXc9IfXmbRdx73Ckt53MasK9HsfxNS053x8LsBmtI1Tc1ergd
	L+IxM6vfMvCP/iIawM7MMc/ZWWoCVCkHYt3Mx0mkWG8RbZUkblyZAS8KTSHbcIopeWqXW+v3Bbs
	Ro0WXJqnKuUq1RQXn14m
X-Received: by 2002:a17:903:b4e:b0:2dd:c100:4b75 with SMTP id d9443c01a7336-2df7dc5aa2emr13480375ad.44.1790233452740;
        Thu, 24 Sep 2026 00:04:12 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c4a8sm21543205ad.79.2026.09.24.00.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:04:12 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2] hfs: validate allocation block parameters in hfs_mdb_get()
Date: Thu, 24 Sep 2026 07:04:10 +0000
Message-ID: <20260924070410.2629558-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In hfs_mdb_get(), drNmAlBlks (fs_ablocks), drAlBlkSiz (alloc_blksz), and
drFreeBks (free_ablocks) are read from the on-disk Master Directory Block
without checking their mutual consistency against the partition size, and
failure to allocate HFS_SB(sb)->bitmap returns -ENOMEM without releasing
HFS_SB(sb)->mdb_bh, HFS_SB(sb)->mdb, HFS_SB(sb)->alt_mdb_bh, or
HFS_SB(sb)->alt_mdb.

Validate that fs_ablocks is non-zero, free_ablocks does not exceed
fs_ablocks, and drAlBlSt + fs_ablocks * (alloc_blksz >>
HFS_SECTOR_SIZE_BITS) fits within part_size, and clean up via
hfs_mdb_put(sb) on error.

Tested in QEMU against Linux 7.3.0-rc3 by mounting a crafted HFS image
with drNmAlBlks = 10 and drFreeBks = 50: on the unfixed kernel
hfs_mdb_get() accepts the inconsistent MDB parameters, causing filesystem
corruption ("hfs: (loop2): extents (cnid 0x3) bitmap corrupted"); whereas
with the fix applied mount fails immediately with "hfs: inconsistent
allocation block parameters in MDB" (-EINVAL).

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Validate consistency between drNmAlBlks, drAlBlkSiz, drFreeBks, and
  part_size in hfs_mdb_get(), as requested by Viacheslav Dubeyko.

 fs/hfs/mdb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/hfs/mdb.c b/fs/hfs/mdb.c
index 277de712f9d4..665753a2cba9 100644
--- a/fs/hfs/mdb.c
+++ b/fs/hfs/mdb.c
@@ -214,6 +214,14 @@ int hfs_mdb_get(struct super_block *sb)
 
 	/* These parameters are read from and written to the MDB */
 	HFS_SB(sb)->free_ablocks = be16_to_cpu(mdb->drFreeBks);
+	if (!HFS_SB(sb)->fs_ablocks ||
+	    HFS_SB(sb)->free_ablocks > HFS_SB(sb)->fs_ablocks ||
+	    (sector_t)be16_to_cpu(mdb->drAlBlSt) +
+	    (sector_t)HFS_SB(sb)->fs_ablocks *
+	    (HFS_SB(sb)->alloc_blksz >> HFS_SECTOR_SIZE_BITS) > part_size) {
+		pr_err("inconsistent allocation block parameters in MDB\n");
+		goto out_err;
+	}
 	atomic64_set(&HFS_SB(sb)->next_id, be32_to_cpu(mdb->drNxtCNID));
 	HFS_SB(sb)->root_files = be16_to_cpu(mdb->drNmFls);
 	HFS_SB(sb)->root_dirs = be16_to_cpu(mdb->drNmRtDirs);
@@ -305,6 +313,10 @@ int hfs_mdb_get(struct super_block *sb)
 	}
 
 	return 0;
+
+out_err:
+	hfs_mdb_put(sb);
+	return -EINVAL;
 }
 
 /*
-- 
2.55.0.1082.g2b9226bbc0-goog
