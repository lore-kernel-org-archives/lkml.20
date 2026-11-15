Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749203;
	b=2CXbstThHaQaJ32tGfN2eFQ/0jvxhTWgo1gp9FisK9o8C5BRVTDUtzqjWYr9+/UYIEx2
	 HKTxRRl3NqYnZ/oTFKkNSIcYSPJRAvBhd0x080yqeX7/+1BPN9xX1EM8t7zPmjc6qvGv2
	 I4isf3ns5hNSSgaHkt6Xra+KYUJS5M5D5r3hgPyNNyttLLLqpGPjL8aNF2bHMmmkxQkBB
	 1LlW8Xz9vRTpq0VPR1LvAEZVUp9SAdjyjaHw4lyubeCYR3t9Z3CXPxsAN4Mg/lMPaik3+
	 d3Gj0+9m0UCXne9VP11Jmh7aPqAVC0q7xKZBHjHHmqv/9cagxt7z3bx6YxF73RpfZaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749203;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=XXJaXzxHBixcD1q9auniGUIiTqL7+5xpVycMghx+12U=;
	b=xDWGRuUNgM6Ug2DlIXBfARf+Z/Mjg9BsB85IOLgOH8hYY8EljWsf5ZC/Jqtc54Cz8X5Z
	 +mU0gxG0IynexDMStd6RlBtWs8U5lbNApQjDbPUUMBmU7PRvMjIR0EueX4naXLtJaOM+C
	 r/zP4DeknOUsNpMOtnhs3hXWpsvqSrN4dH9q6GNAco/l56KgpiRkMjewagMmGV9BsF4FO
	 h13QZQi5sYBIkx7HGO94ZmHyU2ttdSXSDlkIf8eL65RBOh2BVQrEVeNGkMYK5uEJzWdkc
	 0kUciKiBr/qycQERTV8MynTqsAZ8TctOYroOi5cFxAE6AmDE0dRIsID2RksbmAYJulw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ncYlHkse;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93603606A338
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93603606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ncYlHkse
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=XX
	JaXzxHBixcD1q9auniGUIiTqL7+5xpVycMghx+12U=; b=ncYlHkse/xtlj5hXIc
	HDksTLqfaWjMA2yjE2huq5BcHyR2uHIjcNcFDb9hDgGRy1r7n/Nug9ZSM0r9gz6v
	/xI2CeT0o0CeP4bD4vmGnh605rFDWnNnS+muSzFyFQ8dF01tZTvAK5T+eSp1Ykgb
	lmSV4gUqAYCUlQVlj0CnaZ/6k=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD33yHzsvlqXCkHHw--.36757S4;
	Sun, 15 Nov 2026 21:26:14 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dandan Wu <wudandan@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 02/12] ntfs: discard attribute inodes after failed initialization
Date: Sun, 15 Nov 2026 21:25:59 +0800
Message-ID: <20261115132609.209957-3-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261115132609.209957-1-liubaolin12138@163.com>
References: <20261115132609.209957-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33yHzsvlqXCkHHw--.36757S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFy7KFy5ArWrKFWrtw4DXFb_yoW8WrWUpF
	Z7Cry3KwnrAr47Kan3JF4UXa40934UCF4Utry8WrnrA3Z5G3ZFvFy0q340q3ZrtFWrKw4j
	qF1qg3y7XFW29rDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDzVbUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RYDzWr5svZtUgAA3Z

From: Dandan Wu <wudandan@kylinos.cn>

When nonresident attribute initialization fails, ntfs_attr_add() removes
the records but can leave the inode cached with its old runlist and base
inode reference. After creation rollback frees the MFT record, reuse can
find stale attribute state and fail even after space becomes available.

After successful removal, clear the attribute inode's dirty state and
link count and remove it from the inode hash before dropping its
reference.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
---
New in v4.

Tested repeated creation with a 3236-byte inherited ACL on full volumes
with 512-byte/4 KiB clusters. After freeing space, regular-file, O_TMPFILE,
directory and FIFO creation succeeded without stale EA state.

 fs/ntfs/attrib.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index a18d74a9f685..a88dc62c6a4e 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3039,8 +3039,13 @@ int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
 		(val && (ntfs_inode_attr_pwrite(attr_vi, 0, size, val, false) != size))) {
 		err = -EIO;
 		ntfs_error(sb, "Failed to initialize just added attribute");
-		if (ntfs_attr_rm(attr_ni))
+		if (ntfs_attr_rm(attr_ni)) {
 			ntfs_error(sb, "Failed to remove just added attribute");
+		} else {
+			NInoClearDirty(attr_ni);
+			clear_nlink(attr_vi);
+			remove_inode_hash(attr_vi);
+		}
 		iput(attr_vi);
 		goto err_out;
 	}

