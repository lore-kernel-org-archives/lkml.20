Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088518;
	b=gWCtZ9FB/z6e7UOxtznZYNUjrbjhEOYwk3Fo3eAQj0s2YHLWFifbdeRuu0cNdR+1j2Er
	 jUZvlt5hRq7V/GZzFBj9PQopNFinjP42PU6pSZ+2A9E1hB/vOYfJ34svWk95cOKw4Tmho
	 /cbXBb3Zh9+E8+hU3kQUMdO7JmxoHx1NstK6HGZ+uxGhVYhIPVjLcAEqQdiiobSm3eQ88
	 ST12iyD/V5C4d7YA0c8J83+Y4o8M0KwtHLyQ97Gc63IP2Z9QenCH/8hX/Ako6GYjBeO7D
	 WoqTpDnCG3PzxiF8EzjFsTFWCaGhocpocoQyQ4SADZu87U5mX15WTTt/9NOrozYW/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088518;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1UvL3mp5p0BwJk6NSPGETpacBFCSAwHbGB7AHkVNMDs=;
	b=E3Y/55C9ig3g77/8x/l/IH+lLEjcnq5BOVazQuqL+tBRQ5HEaU4BsBq1/5JONFhCMQrb
	 PfTL8yXIGu5nXC86NxA7X439+Ci/Jwh7+xc/aCrLMIhL6196pDwj+qii5CUh6fBKyr7yq
	 hzbqBoN9SwQd5d9I2oSpWqNWpKaL4NxaEWO9mhMC69QSw26BLt44HXZFqYu5P/vwqu4ji
	 tKeqmTZ/FEGsZa4Z3r4xKSJVsGh8LuqQhdQ/oFQdM56tXjB2Xng/MZfeCSzWqfSIVXC8Z
	 9edIcw6gFc4qXSHysn/p9qj9QW2uGB+7NjSJULjFcZxW3XLq6ShsdqCDWEjpAfjwnqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cVpFXZ8r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B21C606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cVpFXZ8r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E2E1F01825;
	Tue, 27 Oct 2026 08:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793088518;
	bh=1UvL3mp5p0BwJk6NSPGETpacBFCSAwHbGB7AHkVNMDs=;
	h=From:To:Cc:Subject:Date;
	b=cVpFXZ8rDt+M0QuPUBN9cuE8SKJla7WpesX0xEtRFsjFQv+Z97EKyOXRSlxr+nsz4
	 d+Nu2Ip8jzNTD7fua28JfePWeBhosPsjS9uerJV6IPV7MGQaiX6eDFVGHQsnkZV2c4
	 BFeeA2snZOAygloxE0QcZ/DkIQP/bc4mGTz/OwjTgPStPmNHzWWH3zLCCDsX0mm76x
	 fdFunBHbcX1owTZT/s5ewswAOezOcYQW7ZvotTpPSr+dZzTsNr9pOslnk3bNYMXSJ9
	 ziBMhufOdTUCT1Y/zbjl+N6neJYbvEbdidqfwR1gK8PHbCg5QuDlDhWqJU6qa+dEEZ
	 +daiH4YMyp1/A==
From: Gao Xiang <xiang@kernel.org>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <xiang@kernel.org>
Subject: [PATCH] erofs: drop unnecessary .read_folio() checks for file-backed mounts
Date: Tue, 27 Oct 2026 09:07:46 +0100
Message-ID: <20261027080747.12207-1-xiang@kernel.org>
X-Mailer: git-send-email 2.47.3
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

Since currently dedicated EROFS-owned meta inodes are used for
file-backed mounts, .read_folio() checks are now redundant.

As a result, EROFS file-back mounts can now apply to tmpfs too.

Fixes: e587a984d332 ("erofs: use dedicated meta inodes for file-backed mounts")
Signed-off-by: Gao Xiang <xiang@kernel.org>
---
 fs/erofs/super.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 16fa3b853f1b..254b32f77a42 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -850,8 +850,7 @@ static int erofs_fc_get_tree(struct fs_context *fc)
 			errorfc(fc, "source fd option not supported");
 			return -EINVAL;
 		}
-		if (!S_ISREG(file_inode(sbi->dif0.file)->i_mode) ||
-		    !sbi->dif0.file->f_mapping->a_ops->read_folio) {
+		if (!S_ISREG(file_inode(sbi->dif0.file)->i_mode)) {
 			errorfc(fc, "source is unsupported");
 			return -EINVAL;
 		}
@@ -871,8 +870,7 @@ static int erofs_fc_get_tree(struct fs_context *fc)
 			return PTR_ERR(file);
 		sbi->dif0.file = file;
 
-		if (S_ISREG(file_inode(sbi->dif0.file)->i_mode) &&
-		    sbi->dif0.file->f_mapping->a_ops->read_folio)
+		if (S_ISREG(file_inode(sbi->dif0.file)->i_mode))
 			return erofs_file_get_tree(fc);
 	}
 	return ret;
-- 
2.47.3

