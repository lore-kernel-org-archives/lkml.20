Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C1C44AB83
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544069; cv=none; b=TqxmxFb4vpoB/uphpRsPY/UVn2Xd3yEsKUGjd8kziCFeFIeeQw3D+11XFTafBW4gEnE1qnVcesViU73xbzsIQm2TXLbS47AP02pimEATbWzyIu1iWSxDcnGyoz69VJ9g7V5sZ/5CjkHhVmhSYCh1KGx+FRYKh2GOfHZ04CcH/Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544069; c=relaxed/simple;
	bh=i3vHU3LR9aFfw1+vVYaK2vvLeAAMyhHKndCzIt9KxR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doSPRiU0fdGUprYI9U+uOozhGq3ljzvAuTR5zcnZmOa1keEXjYvbUZ6iwx4ZF7ssdgRs7iqi+leIrmJbB9kRYAfMim5QabJJRLKzmxWiFCJEeOn04tgUUmldok2DqLwX/FED7wn/7RPsCfvz0tSp/rD8+a0oNluPeDbDQ1jtS3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H0x7pydS; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H0x7pydS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=59
	Qxv3rSo5O7nU4Xe36a42YydBtAqW22tqp5/l1FX48=; b=H0x7pydS92weuOIbqQ
	cb521CHTg6L7QFyuYRSdTX1SLcTLyScQ+jMKnGMH1m0532kGPBV6hkKVzgEM9qNU
	FeIRJVE8GtNXlVqzbEKbQ/wbZMlU+DZbqG3T+ow4dd1ucBeViQmGtH0Px7Byz/dD
	EarhgORQvNEDkoGDHLJSrPbVE=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAX76BjRqpqxycvBA--.1764S2;
	Wed, 16 Sep 2026 15:33:56 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com,
	syzbot+7d1563afac6cb196a444@syzkaller.appspotmail.com
Subject: [PATCH v2] hpfs: reject dirents with an invalid length in hpfs_count_dnodes()
Date: Wed, 16 Sep 2026 15:33:54 +0800
Message-ID: <20260916073354.40306-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914013801.394622-1-quchaosheng000406@163.com>
References: <20260914013801.394622-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAX76BjRqpqxycvBA--.1764S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryfKw1UXr4xAFyxAryxKrg_yoWrKFWUpF
	W7K398Jr4ktFZ2grsavF4fGr1rAr1Sqa15Wr1Dt3sakan8Xr1YkF1rKa4jqw1UKryrWw1a
	qr45K3yUCa92g3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRbBMtUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-wXvZWqqRmUY7wAA3k

syzbot reports a slab-use-after-free in hpfs_count_dnodes():

  BUG: KASAN: use-after-free in hpfs_count_dnodes+0x854/0xb20 fs/hpfs/dnode.c:773
  Read of size 2 at addr ffff8880471a64d0 by task syz.0.17/5986

  HPFS: de_next_de: de->length = 0
  HPFS: dnode_end_de: dnode->first_free = 7b3184b6

de_next_de() adds the dirent length to the dirent pointer:

	static inline struct hpfs_dirent *de_next_de (struct hpfs_dirent *de)
	{
	  CHKCOND(...);
	  return (void *) de + le16_to_cpu(de->length);
	}

CHKCOND() only prints, it does not abort the operation.  When a corrupted
dnode contains a dirent whose length is zero, de_next_de() therefore
returns the same pointer it was given, and both loops that walk the dirent
chain in hpfs_count_dnodes() spin on one address until they read past the
end of the dnode.

hpfs_map_dnode() does validate dirent lengths, but only while the "check"
mount option is set, and only up to dnode->first_free, so it does not
cover this walk.  The default "check=normal" mount option documents that
"it should not crash", so the walk must be safe on its own.

Reject a dirent with an invalid length before using it to advance, in both
loops.  The validity check matches the one in hpfs_map_dnode(): at least
0x20, at most 292 and a multiple of four.

This only changes the read path; de_next_de() itself is left alone because
it is also used by the write paths (hpfs_add_to_dnode(), hpfs_add_dirent()
and delete_empty_dnode()), where silently clamping a length would hide
filesystem corruption.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+7d1563afac6cb196a444@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7d1563afac6cb196a444
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
v2: Add the Fixes: tag and use Closes: instead of Link:, the whole bug is
    fixed.

    Resend: v1 never reached the maintainer.  The 163 SMTP relay was
    rejected by artax.karlin.mff.cuni.cz with "554 5.7.1 Helo command
    rejected", and the HPFS entry in MAINTAINERS is stale -- the address
    used for the last fs/hpfs/ commit is mpatocka@redhat.com.  Addressed
    there now.

 fs/hpfs/dnode.c   | 22 ++++++++++++++++++++++
 fs/hpfs/hpfs_fn.h | 14 ++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/fs/hpfs/dnode.c b/fs/hpfs/dnode.c
index 8c6aa060f..224be4124 100644
--- a/fs/hpfs/dnode.c
+++ b/fs/hpfs/dnode.c
@@ -767,6 +767,18 @@ void hpfs_count_dnodes(struct super_block *s, dnode_secno dno, int *n_dnodes,
 				ptr, dno, odno);
 			return;
 		}
+		/*
+		 * de_next_de() returns de itself if the dirent length is
+		 * zero, so a corrupted dnode would make this loop spin on
+		 * one address and read past the end of the dnode.  Require
+		 * a sane length before advancing.
+		 */
+		if (!de_length_valid(de)) {
+			hpfs_brelse4(&qbh);
+			hpfs_error(s, "hpfs_count_dnodes: bad dirent length %u in dnode %08x, dno %08x",
+				(unsigned)le16_to_cpu(de->length), dno, ptr);
+			return;
+		}
 		de = de_next_de(de);
 	}
 	next_de:
@@ -779,6 +791,16 @@ void hpfs_count_dnodes(struct super_block *s, dnode_secno dno, int *n_dnodes,
 	process_de:
 	if (!de->first && !de->last && de->directory && n_subdirs) (*n_subdirs)++;
 	if (!de->first && !de->last && n_items) (*n_items)++;
+	/*
+	 * Same problem here: an invalid dirent length would make the
+	 * "next_de" loop below revisit the same address forever.
+	 */
+	if (!de_length_valid(de)) {
+		hpfs_brelse4(&qbh);
+		hpfs_error(s, "hpfs_count_dnodes: bad dirent length %u in dnode %08x",
+			(unsigned)le16_to_cpu(de->length), dno);
+		return;
+	}
 	if ((de = de_next_de(de)) < dnode_end_de(dnode)) goto next_de;
 	ptr = dno;
 	dno = le32_to_cpu(dnode->up);
diff --git a/fs/hpfs/hpfs_fn.h b/fs/hpfs/hpfs_fn.h
index 237c1c23e..95330fe7a 100644
--- a/fs/hpfs/hpfs_fn.h
+++ b/fs/hpfs/hpfs_fn.h
@@ -126,6 +126,20 @@ static inline struct hpfs_dirent *dnode_end_de (struct dnode *dnode)
 
 /* The dir entry after dir entry de */
 
+/*
+ * A valid dirent length is at least 0x20, at most 292 and a multiple of
+ * four, as checked by hpfs_map_dnode().  de_next_de() adds length to the
+ * dirent pointer, so a length of zero would leave the pointer where it is:
+ * a dirent walk using it would then spin on the same address and read past
+ * the end of the dnode.  A length that is not a multiple of four would
+ * misalign the pointer as well.
+ */
+static inline int de_length_valid (struct hpfs_dirent *de)
+{
+  unsigned int len = le16_to_cpu(de->length);
+  return len >= 0x20 && len <= 292 && !(len & 3);
+}
+
 static inline struct hpfs_dirent *de_next_de (struct hpfs_dirent *de)
 {
   CHKCOND(le16_to_cpu(de->length)>=0x20 && le16_to_cpu(de->length)<0x800,("HPFS: de_next_de: de->length = %x\n",(unsigned)le16_to_cpu(de->length)));
-- 
2.43.0

