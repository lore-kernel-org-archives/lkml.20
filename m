Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093742;
	b=vRzp7SBe4ibQkMH9Fap3+PCSaxjSr2Aa48U1G0GzXnlZ7gtPsRtjkHWZZM6+HHY7apko
	 DWswS1IcZbtn/MbDd0PI2Ft4M46SR/TJciBWTUpJ3zoKpb6MWMA1hoKk24nuIlTOoBkNe
	 EL/EuwqNT4C8TwKKCNgXzqO1MrPYi31IYeMhTiA8tI4ZrBFSuzpL2R4tFLt91DRGBEC5K
	 aBXh79o+BZguxWf7vsw5vIK6JUw3RSdBmMA5ax57NMUYUQ7e8LyN4/Xfa8MxmKeP698i1
	 6Ymtw+tyUhnzSiAuqTEWuZTjZYVUMpz5CGKsjGX3w8gXBUJka8zj0eOJ0LiDzUPebhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093742;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=vcGNE6YrQbHdwHURcqo35vqeADb5j36Z4wn2p5AL/cI=;
	b=LxI55rCbuygNQIJaLbtQyO4FlYxWX8L5y9kjwNYElFhW5fRUWtVIH6b2fpcHT2Tj/TKl
	 qDRGVvmkuXamWmSNvZVyJcidd4pyBWlUoo26XaDoQht9ivzIK/IPgpwJ4xr4VODWYJmfD
	 W3JLBuXLeLNBoCKEXSMiCHyYcwVSG8pI0vvZaBUNQjUARNAnja+DmvLx47FJzKMSI8vIT
	 TeJ17y1SeT9tYFX1vuR8KhwbuCSGZsMP+jjhYmWUuZNoU+N07dKcLNGjoSzeVYlKztjtZ
	 sE3J7EpM+/r36rbem6J4YpMCnYw8idKCUIl7cwHA2jvk68CY/Hn/p0NMMCMcd9A9nDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UF4CV+Hx;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3981606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3981606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UF4CV+Hx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vc
	GNE6YrQbHdwHURcqo35vqeADb5j36Z4wn2p5AL/cI=; b=UF4CV+HxBZmrXjky7D
	x1Q+cM16mAnGDVnpVUAlO/BZjZzFbEbRqXzRd9g/n7Z07mWMtdKBboK+LyMF5Zm9
	whlVd5k9tyxD6+RbXjA7XGvylp6oHjdQcT6nw4IsCmLUVFWednlvcNFVCtMDNobX
	j9Mwcu4JVU/JyAiqqUlaevd5w=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD33xFVcOBqdMGFDQ--.18497S6;
	Tue, 27 Oct 2026 17:35:20 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v1 4/5] ntfs: write unlinked file attributes before dropping their cache
Date: Tue, 27 Oct 2026 17:35:14 +0800
Message-ID: <20261027093515.344799-5-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261027093515.344799-1-liubaolin12138@163.com>
References: <20261027093515.344799-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33xFVcOBqdMGFDQ--.18497S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryDtF48Gryrur1fuF1UGFg_yoW8CFyfpr
	WrCrsxGw4DGFyIka9ayF4avw10va95JrW3Jrn0qF1UAwn5X3ZFqFWSy3W8Aan7tFWruFWj
	qF4Y9w17urW7ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4byAUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hkFz2rgcFm-+gAA3f

From: Xuewen Wang <wangxuewen@kylinos.cn>

Attribute inodes copy the base inode's link count when initialized.
Those initialized after the base file is unlinked have zero links and
are evicted at the final iput(). Nonresident attribute writes can leave
dirty pages in that cache, so an immediately following getxattr can fail
to find a successfully written EA.

Use the synchronous nonresident attribute write path when the base inode
has no links. Keep named data streams on their existing I/O path. This
allows anonymous files to prepare nonresident EAs without retaining
attribute inodes that would pin the base inode and prevent its
reclamation.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested with the complete five-patch series in QEMU. A 12000-byte EA on
both an ordinary open-unlinked file and an unpublished O_TMPFILE can be
read back immediately, matching every written byte. The published file's
EA also matches after cache eviction, remount and a fresh boot.
Offline checks found the recorded base MFT records' in-use flags and
MFT bitmap bits clear after closing unpublished files, including one
with nonresident data and EAs.

 fs/ntfs/inode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 206db4e..3c2bbbd 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -4037,6 +4037,14 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
 
 	WARN_ON(!NInoAttr(ni));
 
+	/*
+	 * Attribute inodes of an unlinked file have no links either and are
+	 * evicted at the final iput(). Do not leave their data in dirty pages
+	 * that eviction would discard while the base file is still open.
+	 */
+	if (!VFS_I(base_ni)->i_nlink && !ntfs_inode_is_named_stream(ni))
+		sync = true;
+
 	if (ntfs_inode_is_named_stream(ni)) {
 		if (NInoEncrypted(ni))
 			return -EACCES;

