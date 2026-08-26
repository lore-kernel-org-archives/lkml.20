Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438793DA5C7
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749806; cv=none; b=aPLLBzsqh5NyTfgVlGmx8HsuBoUw3Xq/AlRk34nRB2zMITdIdAMKgpALDXPqEo6mKDp3LGxIdEnG54q4n9Z1xwXPKTZVYyTWTFuNneAq79ON8fAq3uHxbk1W+RzYjtFagdaxba5FDH0MzNO9ZrfAFKZxT1By5jRRaqtysfOyoVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749806; c=relaxed/simple;
	bh=OSP6XW7ojsv6vtfB2+FqCcMXN0Ss/bmzysMjgxGZ0dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9rFpcLG1zNrpXuONmY2+oCQbHMsg190dNNuGPqWOI9RmVTkiopuCl1inrYHvaCpVeyrF+q/lGi68y50aj4zbtTGNBu64sDlmasCd9P/933zfI8US9uwSNl5rUZb7S2eztQqxvqbLR9QlTwHe0iAJYUqLFDVbEv2kmB3Tqx5P+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=JRRbX9XS; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="JRRbX9XS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=HB
	8vD9Vghuu1IqwMhGeSD/BVqt+ianc/vWTayOF09mg=; b=JRRbX9XSxud2L0P30k
	ZonoXSo4ojNeZmJT+OX252a7M/igxPQOqZaqmIbBzmPXkH6Mbkb1LQvMF8Mbn7Vi
	o5eg2QvOuA5kbjQ5XEBSTl79EMwwUUCLeV22DD6drCdrbAlWAtbUcrqS4EzYmsDA
	VbQt4JRRwhRpYGWEban9kvNdg=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3P5N85Y5qx4G3Gg--.15517S5;
	Wed, 26 Aug 2026 21:09:19 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <nzzhao@126.com>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Pengfei Li <lipengfei28@xiaomi.com>
Subject: [PATCH 14/14] f2fs: make compressed files compatible with large folio
Date: Wed, 26 Aug 2026 21:09:15 +0800
Message-ID: <20260826130916.2231342-4-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3P5N85Y5qx4G3Gg--.15517S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr43KrW7Aw4kJFWDtF4DXFb_yoW8Jw48pr
	WUGryrKrZ5Xa4j9w18Ja1qgr1YyFykGay7ZFWxGw18AF15Jw1F9FyxK3WS9FWUKrZ3Z3Wv
	va15KFy8Xan5taUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joc_fUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsR-WpmqO5X9YngAA3m

The compression flag is the hint indicates that the inode can be
compressed, when the inode is using large folio, we expected it keeps
using the large folio read/write paths and its data stays uncompressed
on disk until the inode is evicted and re-read

Let f2fs_write_begin() skip the compression overwrite preparation for
such inodes and remove the compressed-file gate in
f2fs_read_data_large_folio() so the data is simply read/written as
regular blocks.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2e20833c6417..befcdc3742f6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2955,12 +2955,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	int ret = 0;
 	bool folio_in_bio = false;
 
-	if (f2fs_compressed_file(inode)) {
-		if (folio)
-			folio_unlock(folio);
-		return -EOPNOTSUPP;
-	}
-
 	map.m_seg_type = NO_CHECK_TYPE;
 
 	if (rac)
@@ -4935,7 +4929,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	if (f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode) &&
+	    !mapping_large_folio_support(inode->i_mapping)) {
 		int ret;
 		struct page *page;
 
-- 
2.43.0

