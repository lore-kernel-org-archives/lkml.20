Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279671;
	b=Jkpz4LiCfAMQswArLHRt0OHThbyIiNevFHAm3mdajPbqJ/6blBXnf9/2Dg+Slcurj3C0
	 W0uq6iuC5yXql6vSXq/zEnrPP4MWqrbfkIlVk3b60H053oCxfNOZ7tY+G4WfzPC6A1vc7
	 LrxyZUMr0S2HQVT9kYNBA5XMhCHCp/beiaPWyNCCg8T4VbritGvKhTzDSqBx96jWuXd3f
	 7cd25B5autOqI4IE4ZOHadWn52kUwwfouJ0YlEZXm9dl90hi2mUvvmFUd7I1HBCOUbxuH
	 Nd5iwlns6cNjfxzJ8AEuuN/cNMSC91hbmVuGhlm2NeYLG/k43osMXOFVvGcHTDfnTUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279671;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=cJdBYcQWZzEcW170Dkg1FZUpnGDs52EYrFStRAwM8lw=;
	b=D6LiOoVCHBQ16xCfMV0FprxG9rc0SgK1eC8hI5+QRpxL9JSLC0V50ypLKFa13y/8WATm
	 AtdU8/6hP/tQSAJSV2U5wAxbptTpOsbWSPMnTUcnLP7SpFoCl+iBiTHhx0rtuEdgfKMI9
	 jpGWnYOuRptuSiyHBCNcsTSkLYfmwDrBEPdEyqZYMuKP3UC1zlv8WSMBVtw2v4byjeAC1
	 Lmuch2kCWLBvL5cQzuGKEuPMlAdJLXPM/Irct6dGVCjOtpBF8KyL6h/RKTWKCRXTuCKZr
	 HIOuL7PMysPQRqRBnn1o75R2zI51gHh7R5x8dtxKYwH7dCOvfqoeEjW88emH3dkDGCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="cEvG/H26";
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF18606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF18606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cEvG/H26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=cJ
	dBYcQWZzEcW170Dkg1FZUpnGDs52EYrFStRAwM8lw=; b=cEvG/H26TrlAW5LocT
	FBivRxuwOdpf2GPxisJ0huVJ7e5boQE9NQfeNaWuqbyIUoeI4iQNy0URW++jQkGR
	Ib8NhO57fbcerh/TC1vnTwtsnuEJnIRIqbPW9SzOoGKTjBnIf3I43cMNr6N8jNXb
	/LsyBlfKMKd+Cgc/PiXRZ7NBA=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgB3u3eeRuNq+Lb+CQ--.14261S2;
	Thu, 29 Oct 2026 21:14:07 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: bound UpdateFileNameRoot/Allocation by the entry size
Date: Thu, 29 Oct 2026 21:14:05 +0800
Message-ID: <20261029131405.30-1-shxzhaosr@163.com>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:PCgvCgB3u3eeRuNq+Lb+CQ--.14261S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFyDGFW3Wr1UKr48Xw4rAFb_yoW5WFW3pF
	ZxCFZ3Wws3Jr17XrsIyFs5Aa4Fvw4kZ3WUWFy0yw10yr4agw1xKa4DK348u34Ut395ZFy3
	tFZ8tw47WrnruaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbL05UUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7R9MimrjRp+HPgAA3d

do_action() resolves lrh->attr_off to an index entry only through
check_if_root_index()/check_if_alloc_index(), which verify that the
offset is an entry boundary.  That boundary may belong to the 16-byte
NTFS_DE end entry, which carries no file name.

Both UpdateFileNameRoot and UpdateFileNameAllocation then assume a full
ATTR_FILE_NAME follows the entry and memmove() sizeof(fname->dup)
(0x38) bytes starting at e + 0x18.  With the end entry placed at the
tail of an ATTR_ROOT that ends at the record boundary, the write runs
past kmalloc(sbi->record_size); the non-resident path has the same
layout in the index buffer.

Reproduced on v7.3-rc6 under KASAN, mounting a crafted image whose
target MFT record (record_size 0x400) holds ATTR_ROOT.size 0x3c0,
data_off 0x18, data_size 0x3a8, ihdr.de_off 0x388, a single 16-byte end
entry, and log action UpdateFileNameRoot with attr_off 0x3b0:

    BUG: KASAN: slab-out-of-bounds in do_action+0x3407/0x8790
    Write of size 56 at addr ffff88800375e400 by task mount/205
    __asan_memmove+0x3c/0x60
    do_action+0x3407/0x8790
    ntfs_fill_super+0x33e4/0x3f40
    ...
    Allocated by task 205:
    __kmalloc_noprof
    mi_init+0x81/0x110
    The buggy address is located 0 bytes to the right of
    allocated 1024-byte region [ffff88800375e000, ffff88800375e400)

Refuse the update unless the entry is large enough to contain the
region being written.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
---
 fs/ntfs3/fslog.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index bb8d40b..abc066a 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3568,7 +3568,19 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
-		memmove(&fname->dup, data, sizeof(fname->dup)); //
+
+		/*
+		 * attr_off is only known to be an entry boundary; it may
+		 * point at the 16-byte end entry, which carries no file
+		 * name.  Bound the update by the entry size, as the
+		 * neighbouring UpdateRecordDataRoot case does for its
+		 * payload.
+		 */
+		if (PtrOffset(e, &fname->dup) + sizeof(fname->dup) >
+		    le16_to_cpu(e->size))
+			goto dirty_vol;
+
+		memmove(&fname->dup, data, sizeof(fname->dup));
 		mi->dirty = true;
 		break;
 
@@ -3753,6 +3765,12 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		}
 
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
+
+		/* As in UpdateFileNameRoot: e may be the 16-byte end entry. */
+		if (PtrOffset(e, &fname->dup) + sizeof(fname->dup) >
+		    le16_to_cpu(e->size))
+			goto dirty_vol;
+
 		memmove(&fname->dup, data, sizeof(fname->dup));
 
 		a_dirty = true;
-- 
2.49.0.windows.1

