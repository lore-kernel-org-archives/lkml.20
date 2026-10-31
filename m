Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424574;
	b=4aOnENnwgygFALj0MCawxc8x9YabN4JdFqvheVkcnNtExW4jpB7zzFogxA8kubIFI/k0
	 0dxCcbj3Ciio0z6vZ6+iLXhFndUKCZHqvkNQd5sjwLPLkWwtKKEnN9TNRh09U0cggIUHb
	 NUR9McvJVj810TCoQMDHpd1LYRSJCV8ZOtLypej2Y8GtDze4zFtq+IHnzMi1MLvGRkAOo
	 RutygkFEjf5Oi8AOlbGGgUeOyyA5kynIcqjiBEbmwbSNWdLKe+ARKzrujU7g0wfRtuyx2
	 L+qtDxiryye8QPr2o1IQKArG0DSGXmqVF5eV7z5JmMiXBce3wypVSU7ke14IAXk0RvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424574;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=ipiwYmBGt3kV8WoGVnfjKgzTk3jGwziE3HCRQl92GmY=;
	b=N1v9bY0PjcE8PLpt3fOfsySYXv0dBlBBFhjqXX7z5ifHF/RgOJWxaKipTqALJDArcBn4
	 eraookwCvbfPn8T0QVEqu39OPOKJCSDuma6srBYHj7FtYqSLGaQS7pdsy+A3fPgRLc29C
	 I7vT9OanndZJwMUX3CBP/LRk9bWBr0G7IuMaiV6sXgd7spGjimEUnioAJP4RzIdKQEukn
	 sjF7GCak6ARorIoV0kgO4rS0IXILzalrWospzdTIfVDKaKb60+7wiqC0NbwCUjnPBfmGM
	 95f1xy8piSl+mDZbMmWnoRTXEaUTwiPOpoNj9rmZhyg099ZPckm5zv9i3UHm6uqxY+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Nf6rI1cP;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAF0606A329
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AAF0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Nf6rI1cP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ip
	iwYmBGt3kV8WoGVnfjKgzTk3jGwziE3HCRQl92GmY=; b=Nf6rI1cPnn2SCPjdtL
	GTnXA2NIX1tvHXXllboy/PpbeydCB6qkGoSY8tfjNbI+h6VIAt8FU/X8E7jqqWIn
	crjy6FoXOwI6K1swOgt9nUpK2XThcSMbUbSn+oZaWZ+fIcpQS7PoonSTX3vSNHWE
	JGl+Ewm93oBww/VDmMAPUekxI=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDX37adfOVqFDprDA--.9490S6;
	Sat, 31 Oct 2026 13:29:07 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v2 4/5] ntfs: write unlinked file attributes before dropping their cache
Date: Sat, 31 Oct 2026 13:28:56 +0800
Message-ID: <20261031052857.1542936-5-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261031052857.1542936-1-liubaolin12138@163.com>
References: <20261031052857.1542936-1-liubaolin12138@163.com>
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
X-CM-TRANSID:QCgvCgDX37adfOVqFDprDA--.9490S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryDtF48Gryrur1fuF1UGFg_yoW8Ww4DpF
	93uFW5Gr4DGFyIka9avF4Yvw1Fva95Jr45Jrn0qF1UAwn5XrnFqFWSy3W8JFs7tFWfZFyj
	qFs09w47CrWUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jco7tUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gNbJmrlfKNqHgAA3w

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
Tested the standalone five-patch series in QEMU with a 12000-byte EA on
an unlinked file. Attribute writeback and cleanup completed; published
EA contents also survived cache eviction, remount and reboot.

No functional change from v1.

 fs/ntfs/inode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 62dd5bd5bb81..2b1388de7bb2 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -4052,6 +4052,14 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
 
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

