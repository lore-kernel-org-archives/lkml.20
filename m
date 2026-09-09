Received: from mail-lr2-f10.google.com (mail-lr2-f10.google.com [74.125.230.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A763F8890
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948104; cv=none; b=aDFK9WsukuRev3xJtC3HmSCWjP20ajg/oNannuLdeqicRYd/oKnrALxHgqLSxa3uF219VWGiojLUZ0Is0q1t8CNqi8i6UluGK0x0xkbtq7u3BXCNEwnXgmYJpBdNYLt5MrhcS0YDN60i+NZ/qXwScvbJxuNxNbEylqrwhs5o6LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948104; c=relaxed/simple;
	bh=fr/14uzfnjifOkUIimLTDNDBT8O6btLUilsS+08g3YY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kHA6YT1YDtLx8ob3G/EOD9tgmMtsyWj8G+BI+KgQF3azuK6iQMw0m/MCCokPXA7ueSX1rUkwCUNHDqJ12UOvz8846rcMHJTDvKthI9JosEZ+/rq3fsmGvHDhABUAAlO48Hs2g3dIyjTEX2o35n53dV3k5LfoJU4kdPoLqWXGkBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gP3M0CG7; arc=none smtp.client-ip=74.125.230.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gP3M0CG7"
Received: by mail-lr2-f10.google.com with SMTP id 38308e7fff4ca-3a499fd4357so3411551fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788948101; x=1789552901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+teM91VaABsA7Ow6jpFbUu2VedKMn5ZNdhX8m3+ru3M=;
        b=gP3M0CG7C99Ifbv9DHfqpl8SDIswvqSe5sihjYKiXkIXBamRTya/cWkLUneOkxXOAt
         2SnAhRjsA1vyE4cGgjGIyNbWCRNF7jqqFAzDwWjZwk8vDM54hA1wD2xikr3FS5dXeLI+
         xKVn+RmOZ9aHLUJ2OZ0EKQyg0IcIoO5LULK2evbR0h0SN8pNbjd5MyGIXYyKCqQCpM6e
         bx3pHDnGVhdwFKpx6jAOn8kQWSyCOll+W2r2O3VF6FzGuLXl9uhWxYqSPdzWUPJRzMSp
         W/CpiBGO2GQdfpGNCvPMD9Hk1yWwvuiKPlpFwDnchq65TUwg4Hsok4bmGlt9EZAnOCAz
         0q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948101; x=1789552901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+teM91VaABsA7Ow6jpFbUu2VedKMn5ZNdhX8m3+ru3M=;
        b=E5l/4c8tI7Sq/xph+PQq2mAv9b/QNqvoWeYd8ZLzm023QpWMztCFhNLUbjuMFn0Cs/
         wg5rmV5q5x/3k3dl7EEs6iufUB8EWgpJz5IkyUlSnbiQ5I95pf9ercSESnp/7srcfQHb
         uDEYje1+4XrhYu08sMPFapAEzY78H1pkP4iRKmiEJ44bW1B+1HGfZTqdd8ospFp72cmM
         xioSl+EaPmWtkSpdONYJ91Xb0taWR+Jj91b4Si2ohcoPVQ0Pq/puiJpPdQ2qHMZzMCQC
         F3RJ4C+LcvZwJAhZdYlesM/Yjd+5SAvwm8DZ7AqfGkNMOxMLneg5fN1ayYgtwZh5cbUS
         N8Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzbe+jjMEOQcsDgMT8sT/81yJlChPzCDo0Y31Vd1o74kXFLtHy5KMWdg0B6nrph6ph/KXdeQ3aH0p9Fw2A=@vger.kernel.org
X-Gm-Message-State: AFuF++l5zKCxOUTxpDvx+ScydOJS4t/vn3LWuMoErlvbfWQmKD7rMdE8
	xTWGezqpn6UjasjRvY92tv4x07JcRgGFJiLIsxrnGoo3iAXihJj9LvZZ4567wQCmWtQ=
X-Gm-Gg: AYBFou2BVmVpM+v2itj4YCPsuqys5LZlbq8mCIcJFK9B9XWG3nW4HmA0lpo1mou08B3
	ZK4RcUx5Gnw5DdHfc/9/K0/g89A6zANeQst3Yoj5Z+reQ0K3hCCqmbqH6/FNksXN6b1gdNZLF6c
	ByO58gXJoBYzOvU19jAb0Z/Obw9vtQZLM9WfkcgB1sGkFocYP6yzpJSPVIwJKxIihEMKr3onHoV
	8h+1LHSJU3YrbbZcPYGZVw029e4FpABeOzg762ci0xseQP/bPuC4XHhZms4zNJTVClZPicK9uUv
	gOOHFSpi4wrP6wG9IxqUt5LoNAlJIWEgdtYeDlgnR2l17I182V416VcS4xOZDy+QPIw2p1bSvK5
	WCHQz1TEhAWnte9eiJsqM5Pu69Go1IX6TpqVd0TTwISb8XbrE3yZKXgcvF8z7Q1BMmH0hg+NQm4
	HEy/UjUy8OLJ1g9ADXnnMNsxh7m5DSQjRf142HgAhY1HV83A2sim/fIs5u32lGwjohFYDsRSjmF
	gFq2VI0ExfeSL5E
X-Received: by 2002:a05:6512:ba0:b0:5b6:962:4ed2 with SMTP id 2adb3069b0e04-5b616f34d3emr5897163e87.22.1788948100644;
        Wed, 09 Sep 2026 03:01:40 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b76ff836e2sm236292e87.39.2026.09.09.03.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:01:40 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hfs: fix slab-out-of-bounds in __hfs_ext_write_extent
Date: Wed,  9 Sep 2026 12:59:25 +0300
Message-ID: <20260909095930.19979-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function __hfs_ext_write_extent() writes extent data to the B-tree
node using the length fd->entrylength obtained from the on-disk HFS
record without validation. This length can be larger than the actual
source buffer HFS_I(inode)->cached_extents (which is only 12 bytes,
the size of hfs_extent_rec). An attacker can craft a malicious HFS
image and mount it locally, then trigger a writeback by truncating
a file, causing the kernel to read beyond the cached_extents buffer
and leak up to 84 bytes of kernel memory into the image.

Although CVE-2025-38715 addressed similar out-of-bounds issues in the
read path and added bounds checks in hfs_bnode_write(), those checks
only verify that the write stays within the B-tree node boundaries.
A 96-byte write still fits within a typical node, so the overflow
persists in the write path.

Fix this by adding a validation in __hfs_ext_write_extent() that rejects
any write where fd->entrylength does not equal sizeof(hfs_extent_rec).
This is consistent with the existing check in the read path.

Fixes: a431930c9bac ("hfs: fix slab-out-of-bounds in hfs_bnode_read()")
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
 fs/hfs/extent.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
index 580c62981dbd..b588410f01c7 100644
--- a/fs/hfs/extent.c
+++ b/fs/hfs/extent.c
@@ -126,6 +126,8 @@ static int __hfs_ext_write_extent(struct inode *inode, struct hfs_find_data *fd)
 	} else {
 		if (res)
 			return res;
+		if (fd->entrylength != sizeof(hfs_extent_rec))
+			return -EIO;
 		hfs_bnode_write(fd->bnode, HFS_I(inode)->cached_extents, fd->entryoffset, fd->entrylength);
 		HFS_I(inode)->flags &= ~HFS_FLG_EXT_DIRTY;
 	}
-- 
2.53.0

