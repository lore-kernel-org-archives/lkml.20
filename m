Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABB826982C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839598; cv=pass; b=iuzPgB08JP5IXdNVw5povU3UDl/PSXWeLmjeMoJjY/4Y9ST+1yJP4bKKrC9onzGVz3zIK9OjKxxGY8dMxbfdgBdMEHlRDDwdf95Hs8et2vF4NVYUmQikqJdqijHBmnQmlC2vosGXSR0FYbVKOQmihCigmXreWszoKpG0TJma5rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839598; c=relaxed/simple;
	bh=39+UbTrd15evl4BErQkB3FfRMtQYMZH3Gsqk51OEhGo=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=BY7Hm0K3vux+CRuoFI6M3aMgWTQctQdFCXZTeAjHkm3W/Tzn5u3mM68IrJqjqQo1W1c64cNvAbVfFrGNLmlIBDVHiaW40fRjSKgx3D2i4CR3NjsRNwoYWVyOQABSxWS6cMk7C3c9u/U1w33nLDlpqZcSuf3PkYtn/0pdIrh8C2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJ8WDps7; arc=pass smtp.client-ip=74.125.230.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJ8WDps7"
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-917b200d49bso4344156d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790839584; cv=none;
        d=google.com; s=arc-20260327;
        b=TARZKBdzRsNKUgaYG2hmt37lP0+w3lIxEB+WbsRnw5tlWJzni/iiOg6e6BDMyG3LyE
         C5Hp3kFav7ZaJ2w8k44xygLaruXr9mh//AOlYabLVuWiKed3B1714I8ijg07Gmk6LrEi
         /oux/chbmx7Mz2XF7WelWdz/m0aahzE1pZwsO+uJRSs7zYsEJwnlOlAkWSkNWEKEisgo
         RmXjeHi4RpIeE5yusZt3xd6WPdUOIuIzqQ97k8WqoNhhbnQ5iJ+eHm7NgeuC8RXftqkh
         9mNhbGJYN74LH8fwDoytnvLTdNciBnPuGRs8a5uKhU5BD+Igb4ti04MzqrGtBEZUipaT
         mCUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=RQhxhIkbMtU/v8KdCMZ8ljBnV91qWcFJsDkycf22N9A=;
        fh=gpZW5oG/MVQd9P/Bmp5AM/ezK2mYGrklLNMhatCDheM=;
        b=Ld1wuVCIIt0ED/tbbowvzAcycCutZHZvIRs+sDKHM59YvFSG6JIi+iyXmbZsDdb01S
         frhE5IJTS02xTX5XIodG8HeFz6eSB6VM5x5wVVLZWmQ2VuoIDDTscqUl+boUgFS2h6iJ
         5A6x049Lt24l3INGZuwlwuSuUgUq2PgyxMj0yrhFwopJ2Q3fUZ7sHCFB88U4xXdnY0fk
         BTVKEXLgFejdc/wApCyY9fE8ewykuEehxUspBk9xwAnRfWdagCGiqVIzB9AT/TSQUy3v
         cLJdaf8tgozKGxXFCUPwO9Wt9GRzCJy+hswsYWXVk9cXRIHYPUeQFy1JcsUkzyhA850b
         +51g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790839584; x=1791444384; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQhxhIkbMtU/v8KdCMZ8ljBnV91qWcFJsDkycf22N9A=;
        b=FJ8WDps78YL36KrNRFwNi+NOQwoUdOe4KbbjYwTDZQs30LderCFwzQAfRQb686qh3m
         CkIQjtUY3qy9m1wFbdGMXqC9RcXi5o16ogOdD2fj9USvGBA6CoXObu4KO6KY+OPLw3P4
         3LTaQ/sc0dti/qRerJj83ckQHGrOgWPzIbQtECOkTH3gM/UHRQplnqfZ7P5JE3v9Tjvv
         fg6jyl527eBFwNfxWe+9ii2kLTQYZQ6JcRhGkz6GjriOVkvlPrYSaQH1upDBqJ6sfxOD
         k4+S6lbLdTvZ4oGaGl6qe0yjsNXd4BEjOo/aSw9YR9ih6Nj32Sbhf/Fv/idFN3KOdLd/
         ULYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790839584; x=1791444384;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RQhxhIkbMtU/v8KdCMZ8ljBnV91qWcFJsDkycf22N9A=;
        b=pxmK8ZHqk3UDH2yApUeSo/hzFnagBrJhnnreb/nPwvKRFP2XfhGRutx9P76CrM8UuT
         yd8GHGc+U7y5Hv5RWpdPzfRCqoRJoUr4QBfQsazCsgbpEwtXDahv/5h9ylDEvAN2Gfsm
         SZ6E3xZRQat1hhgMjWeo11MTv41cb40i+7S1U2J42dL8UlLHvuBDJTBvbub94H5rV9rJ
         R4fRwGNs7HDuBsmaT9PEnOrhKxMBNQR3WBaD/3KajFvYcvx/3lmsCWTuAPlrB8tCv0sG
         6YBhVhXzbkPm69IkPUJrQ0WJCFvkldiY8zEYRWB4H8dQiOf0JNWVzKWU/XdlWZFz/irK
         NZKg==
X-Forwarded-Encrypted: i=1; AKwUvBwZKwp3cTsXI9iUrHL5aBZWdCUWKZF0G1tvMswIG4XZ1BM/3+K/qBEq8yrE58YL4qlMWWYzIaL3OaDLDf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQLijslOal28kOg2IXJdYQgO2GrGfl7mDdEYkdP/tV0cGBVt5W
	XQU9XF30NzHEaY8Qb/6iWO7eP1VLtZLuAS58YWSqwuqGceWnGVoEPa7UgA1fbP2ijL7UTMzG7Ks
	3U2ThrJTeC+VgtllHTpPyLC3CUX8DEKjRy0Qo
X-Gm-Gg: AYBFou2e5+yXYUv1wka6Ebe8YttCQptEnYw6EkMMyGVBoi+XFEpGbPW+ruyEK+sKv36
	LniUU0RYqlMit0U6Fe6ECEFus3Jo/ee2g3/VYvrpSTr3M/9LR9fwID868Yo7td7y+m0v6dm/aOD
	cJYRYIsnf0kt0GENFhHW3KHl9xkPg5PCZkuiB8XVzxxiy8DXlLT0fg0B5TpqoyjBhK+UgJz9taP
	dsLQQLd5MdZFggwYH/25RG17KogeppQnEPcHOwr0TtbSS7Gov/v3xh0yuGWOCvSaPiOMy1/tlc3
	b1HHvI8ffU3Y7V96E7QgH4M23hI6zAVn+gkF97g3dGZRcGdyIbYTF3laZG9Nq4AtmtJxFARoYWH
	njOxzUls=
X-Received: by 2002:a05:6214:20e8:b0:917:b08f:e8a2 with SMTP id
 6a1803df08f44-917b08ff134mr18560616d6.25.1790839583769; Thu, 01 Oct 2026
 00:26:23 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 07:26:22 +0000
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 07:26:22 +0000
From: aljojobypls@gmail.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 1 Oct 2026 07:26:22 +0000
X-Gm-Features: AclHuK8pvE4CJAFL_nt5ep6-wjgFpJoAWO1IdH6rdWgHF6rWWf5eras6BWwqlNs
Message-ID: <CAPNiJxCDpbQNO8K=+Oh+c0mKyji-HDz0xdLZnJySG-Yuj+d_7g@mail.gmail.com>
Subject: [PATCH] ntfs3: update iomap folio state when marking folios uptodate
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ntfs3 hands page invalidation and dirty tracking to iomap. With a
block size smaller than the folio, iomap keeps a per-block uptodate
bitmap in iomap_folio_state, and ifs_free() warns when that bitmap
does not match PG_uptodate.

The read past i_valid, compressed reads past i_size, compressed
writes, resident-to-nonresident conversion, and ni_read_frame() still
set the folio flag directly. truncate_setsize() from ntfs_setattr()
then drops the folio and hits the warning.

Mark those folios through iomap_folio_mark_uptodate() so the bitmap
and PG_uptodate move together.

Reported-by: syzbot+0e70362e1726b5a7502e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0e70362e1726b5a7502e
Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Aljo Joby <aljojobypls@gmail.com>
---
 fs/ntfs3/attrib.c  | 5 +++--
 fs/ntfs3/file.c    | 6 +++---
 fs/ntfs3/frecord.c | 5 +++--
 fs/ntfs3/inode.c   | 2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index b1c315206..73f059765 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -7,8 +7,9 @@
  */

 #include <linux/fs.h>
-#include <linux/slab.h>
+#include <linux/iomap.h>
 #include <linux/kernel.h>
+#include <linux/slab.h>

 #include "debug.h"
 #include "ntfs.h"
@@ -327,7 +328,7 @@ int attr_make_nonresident(struct ntfs_inode *ni,
struct ATTRIB *attr,
 				goto out2;
 			}
 			folio_fill_tail(folio, 0, data, rsize);
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 			folio_mark_dirty(folio);
 			folio_unlock(folio);
 			folio_put(folio);
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 2abf334bf..520b72456 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -1071,7 +1071,7 @@ static ssize_t ntfs_compress_write(struct kiocb
*iocb, struct iov_iter *from)
 			folio = page_folio(pages[ip]);
 			folio_zero_segment(folio, off, PAGE_SIZE);
 			flush_dcache_folio(folio);
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 		}

 		ni_lock(ni);
@@ -1080,7 +1080,7 @@ static ssize_t ntfs_compress_write(struct kiocb
*iocb, struct iov_iter *from)

 		for (ip = 0; ip < pages_per_frame; ip++) {
 			folio = page_folio(pages[ip]);
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 			folio_unlock(folio);
 			folio_put(folio);
 		}
@@ -1166,7 +1166,7 @@ static ssize_t ntfs_compress_write(struct kiocb
*iocb, struct iov_iter *from)
 		for (ip = 0; ip < pages_per_frame; ip++) {
 			folio = page_folio(pages[ip]);
 			folio_clear_dirty(folio);
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 			folio_unlock(folio);
 			folio_put(folio);
 		}
diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a95..3bf794dc9 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -7,6 +7,7 @@

 #include <linux/fiemap.h>
 #include <linux/fs.h>
+#include <linux/iomap.h>
 #include <linux/minmax.h>
 #include <linux/vmalloc.h>

@@ -1943,7 +1944,7 @@ int ni_read_folio_cmpr(struct ntfs_inode *ni,
struct folio *folio)

 	if (vbo >= i_size_read(&ni->vfs_inode)) {
 		folio_zero_range(folio, 0, folio_size(folio));
-		folio_mark_uptodate(folio);
+		iomap_folio_mark_uptodate(folio);
 		err = 0;
 		goto out;
 	}
@@ -2521,7 +2522,7 @@ int ni_read_frame(struct ntfs_inode *ni, u64
frame_vbo, struct page **pages,
 out:
 	for (i = 0; i < pages_per_frame; i++) {
 		pg = pages[i];
-		SetPageUptodate(pg);
+		iomap_folio_mark_uptodate(page_folio(pg));
 	}

 	return err;
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 4ac26c80b..8e4a5dd6e 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -842,7 +842,7 @@ static int ntfs_read_folio(struct file *file,
struct folio *folio)

 	if (ni->i_valid <= vbo) {
 		folio_zero_range(folio, 0, folio_size(folio));
-		folio_mark_uptodate(folio);
+		iomap_folio_mark_uptodate(folio);
 		folio_unlock(folio);
 		return 0;
 	}
-- 
2.53.0
