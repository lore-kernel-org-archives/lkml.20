Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4843B3B52EB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789524034; cv=none; b=qdWBmmqLx3ZqJd7S4VAI80ihuwUiYzzSiEvRTgwtyLix5nmZPqX/P7HVah3HHgn+tyW1OJtPUF+74gb1MAEyOp3b5No65ORgYiyp2hmS9CvChb2PzyZyOqP1imwBEdjeUYKJa7Iq3bvg6I9zsVP8afe+MAzk1pPIyjT9BCEpBiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789524034; c=relaxed/simple;
	bh=NoV3INDAw/o/T7RpwFX3qeENLG5Wsw9EAKdufHIv5X8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c9Mbko0EHG0e915lkLIbJZXgMsuEXk27YAVPgnU8UE7GE1kCNYnVatUN01ny8OlJAf79RIvopD3sTJotVb67lZN3gaFqGsdhwZeA2zdw6Mmly7vR2mru6SCeIbneQFSHZhomaQSJOAT2YMA1z2Ido93oB6RUsZ5uZqjU4uVW7UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=C43F5/Pr; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="C43F5/Pr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2m
	HBBch7D9ifuXMbe4mL5tWaDAVFntSaDMBpdABQB9s=; b=C43F5/Prhdaou6UMAr
	UCzR/5uvS9YFutTSRUNOewKMOj1QZcQpzpXK0GOsuJsuzXzZdiJmCUQfTjolwARl
	y6GkcwTHBI3DttxEPRfImJI8S6lM2m+TTB0WCu3L+wy8x2BCDOo5ENMdYpGIWaJP
	/Sqhp0GHFRH4VReVsTjMsgAiY=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn_0YY+KlqcYAUBA--.47977S2;
	Wed, 16 Sep 2026 09:59:53 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Cc: linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com,
	syzbot+7d1563afac6cb196a444@syzkaller.appspotmail.com
Subject: [PATCH] hpfs: reject dirents with an invalid length in hpfs_count_dnodes()
Date: Wed, 16 Sep 2026 09:59:51 +0800
Message-ID: <20260916015951.113116-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn_0YY+KlqcYAUBA--.47977S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryfKw1UXr4xAw1fJr1kXwb_yoWrZrykpF
	47ta98Jr4ktFZ2grsavF4fGr1rAr1Sva1Ygr1Dt3sak3Z8Xw1YkF1rKa4jqw1UGr95uw1a
	qr45K3yDCFZFg3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pReyxiUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbDABlJvmqp+BndWwAA3K

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

Reported-by: syzbot+7d1563afac6cb196a444@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=7d1563afac6cb196a444
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
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

