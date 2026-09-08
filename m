Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8307455D86A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788904804; cv=none; b=NOZ5Ws2cAGPinM14r3C/XYaQ+KsInjevZ+zg+uz0ucuPew3tJsNXDHAPi1CVVG5eiexYhKDgIX3mDxLCHiX3Mi+YgOfGhX9bZ7/YZoze5GzX/isDAxWmzqPDO8U/MoaiHj8jTdGIUyamQu9r5wzlNN6+ou2JszXf6pYXJoHfOMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788904804; c=relaxed/simple;
	bh=AMxIza50oGlujwHS6xhiHxlVOqV3q6LSfNBiaiJG5yc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=egPlb5/h0ztgIMQ8MInihhISWmWFcbut1pyrhzQqAbMptvznFHA1BPDWll652Rt5Ph4Hl74ip8eskW2lQeXFm3PrH+OlEAtPkDWEvUNfN/kYYoUXL/hUvCKoO7nvPdNiZZBexDHIcb8/DB4tfnxEqEu1Kw+/UTOZTWRhtqJ9l6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=DnLKMYqT; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="DnLKMYqT"
Received: from jfs-fuzz-510.. (unknown [5.144.71.174])
	by mail.ispras.ru (Postfix) with ESMTPSA id DA5E240ACDE9;
	Tue,  8 Sep 2026 21:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru DA5E240ACDE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1788904793;
	bh=35VU8bbSh4IY8fc436OVoB6WiXOtMBVJ2g8p80Ky/oA=;
	h=From:To:Cc:Subject:Date:From;
	b=DnLKMYqTPGHhfUT3gG7JjeSIO/+fsC+14V1sR4a7ZTdzoZXeccIYNPquqhCFqe1RX
	 U8+k4mdWlV2plZegKspJIR2U72WC62eOKu5+vs0IfTb3OWU+L9JgyH6CWmZejqsHYR
	 JB3lGbFVVKDtbdetFerBkmzifMxKyXbAEx2Vc7TY=
From: Dmitry Morgun <d.morgun@ispras.ru>
To: shaggy@kernel.org
Cc: Dmitry Morgun <d.morgun@ispras.ru>,
	jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] jfs: fix out-of-bounds write on symlink inode with negative i_size
Date: Tue,  8 Sep 2026 21:59:42 +0000
Message-Id: <20260908215942.9458-1-d.morgun@ispras.ru>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i_size is read from disk without validation: diRead() calls
read_metapage() to get a struct dinode from the on-disk image, then
copy_from_dinode() assigns ip->i_size = le64_to_cpu(dip->di_size)
directly. In jfs_iget(), i_size is checked only against the upper
bound IDATASIZE using a signed comparison, so a negative i_size
passes through to the fast symlink path. There, pointer arithmetic
with the negative offset produces an invalid address far outside
the buffer, causing a kernel crash.

Add an explicit check for negative i_size that returns -EIO,
consistent with how other invalid inode states are handled in the
same function.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: d69e83d99cf8 ("jfs: ensure symlinks are NUL-terminated")
Signed-off-by: Dmitry Morgun <d.morgun@ispras.ru>
---
 fs/jfs/inode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/jfs/inode.c b/fs/jfs/inode.c
index 4066d263e9e1..bf940b2c623f 100644
--- a/fs/jfs/inode.c
+++ b/fs/jfs/inode.c
@@ -19,6 +19,7 @@
 #include "jfs_unicode.h"
 #include "jfs_debug.h"
 #include "jfs_dmap.h"
+#include "jfs_superblock.h"
 
 
 struct inode *jfs_iget(struct super_block *sb, unsigned long ino)
@@ -50,6 +51,11 @@ struct inode *jfs_iget(struct super_block *sb, unsigned long ino)
 			inode->i_op = &page_symlink_inode_operations;
 			inode_nohighmem(inode);
 			inode->i_mapping->a_ops = &jfs_aops;
+		} else if (inode->i_size < 0) {
+			jfs_error(inode->i_sb, "symlink inode has invalid i_size %lld\n",
+				  inode->i_size);
+			iget_failed(inode);
+			return ERR_PTR(-EIO);
 		} else {
 			inode->i_op = &jfs_fast_symlink_inode_operations;
 			inode->i_link = JFS_IP(inode)->i_inline;
-- 
2.34.1

