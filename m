Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3118D370D7C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262381; cv=none; b=aNo/YOFz+cC5qCxJcEc2Koh66STuUuGgKQD7vDT7mPBC5dHiwQqasZvH8nZ+ak/5pt9mBPoW39xEpMHbTlwC5FlPatgDuU7ZeqASG7tIbqjWqlVL+zNAhLq91ybh9EIDIRX5Kn5Rv1ALmqlfWG8Jgcng8OVPtk9VfpU+ZaloJlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262381; c=relaxed/simple;
	bh=tWsplIKQlCrKEI3znVxfP3UflojL0jxV8E4AkeIkcUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t5tFyeBGbygQdEnLs9G5afJG+LmEwFf4KBNEyYty/J2F8Q+buTCcf1CXrKjTrCdNUNjGnL6YjwvC8jtvEDwn+EWaH+n002WQBFZKU9dxd8l8A9Ce6Bn3Y/KmdtRmlhgCjR4gnmEaGT1o8bVs3qXbXNGGq1YdqhSCAi8xwtsI5F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gENbE+Wq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gENbE+Wq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso173964f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791262378; x=1791867178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNnyigt47m4RvfnCZkqOS4nkufUVHYq8Muto1Qo9rTo=;
        b=gENbE+WqfFn1PxWR6MM0w3E12/ymiq7M0igc0V+w8avrYZilcHxelR64/DtYh3W9eN
         SxkqojHaWZxeWWc7jB0V+JfhmzDQt+TXqhDnMr08MikSt1tpjW8Wt+HXaMBKxQhY94CL
         ELQ1PxyBgb1PgWFf8twHB6oXFeaaqNyq7aZNOzkx/gGn43rz4KqdLK8fpB4YuEVN67vw
         ogPnJHjBxMtnf5njOyTj8nMX0KZ1KGfiTPfaKxAQt5xjuMtG+ylPWpI67KLb863iGHyK
         1cQXIzZJGkCcoYwqfi4z0xb9Dl2ECT8yv+ajBvXH/WD3aqLjnDFpzRVQ13uJ/xNwoaTJ
         TH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262378; x=1791867178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNnyigt47m4RvfnCZkqOS4nkufUVHYq8Muto1Qo9rTo=;
        b=Ae/4KRjknXqIJy+4w+r0QAqkE39MCwAnzwJvvoBL9m3Iw2pVvCGTBqSGkVuvYEOsBk
         1/BX9YCCBEkDJdGw+oqgpMUVbrF+3FYLpisvy62X2SjcCHE4haiifdVjth/U8TGftWEg
         H/HgWA6uy/0JDqHsm6jDy5nMV30524wa4j/A/zbYJ9N1vCWWGzubc0ClPxZLt5iYuyqu
         153/mh7ojUjN46QzkrekGDUEwwGPBICIS9vrz5gSUAhMbojc7vsEggVbsWLf/JzYGWNt
         TcLlhs7FLOLPSOi3KFldY0JGsWhzAHtbcxA8fhazFUPkzbvA7X/dL0zL++c3Rt7dq4Te
         7w2g==
X-Forwarded-Encrypted: i=1; AKwUvBwB0MHa9pFQH6o0vqVxhapPSWvu344OvurQQVHR8U4Tc+xYQrPdxODmHEh9C9jiRmSf/aKiTCUyv1TgSoU=@vger.kernel.org
X-Gm-Message-State: AFuF++nZFd06YiFbxez9YMIdKi32qd4e4Vl5W7JCTLe+yyKXx30nwsCo
	LweCxr7OCpuhhHlJaLYqhYazakgadO7U+ypxxOo/YuZ40TTwV4UYoBsRBKm6Xqhn
X-Gm-Gg: AYBFou1yyiQV+jdLI/LlB3hMNprLakHYQTpy+09nV0VqozCB6DBB7FJoeeInLEQuPO9
	EgkeVR8YOUESAJ0F2E8dykn9on/FEV/cqet2Jfb+9q4pZiLIvOhqIqsPpMETE+cS0UfwwLmcVYj
	NF67Z6SsVRoL4kus5U9TIob78ojQQRSHk3ZC7IY9w5xRJ2yP9FYusczb0WITmjwFnzDXDQmybIL
	frWjDIqt40oQoTKDdFbh1TdSQFJ9/ew4VoCDnx1gjg1ifgTRij6xHB4INvHHmwpiYygqyxsUSH0
	4cwlsqlMAT6uYHHUjnt2mq35RO385RPTi2s0hJG6GeKhzZw2c3LMcsDKrLbkzsOkZcqCQsnGQgR
	xau0HBGobNLFNfTnIcmgLCUDG6j5khmfgylwQsb5atXzOitMh0B07VuhmCETTmtLCefcRXtbNDt
	EBn57VXjTIGlqyqWcXIXn2cw9xhkGj89BDYm/Q+brts6jXjWdir+7YgZa7/VxABo9A1mMEiL3rI
	2xAFajvYo61TQtktkaY1n9SCm4xUGIQ4dyBhmiLiQvyxnyGb8rGCot/+5Ix0zrL04WKnQJQML7y
	Iga+4FC/0jKAzLQxqKTvDUSsxsdFV5hy3kQ=
X-Received: by 2002:a05:600c:4e8a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a17b4b99a7mr4513795e9.0.1791262378092;
        Mon, 05 Oct 2026 21:52:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm72322225e9.11.2026.10.05.21.52.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 21:52:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ntfs: fix kunmap_local() of advanced pointers in check_mft_mirror()
Date: Tue,  6 Oct 2026 06:51:35 +0200
Message-Id: <20261006045136.5911-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261006045136.5911-1-kmehltretter@gmail.com>
References: <20261006045136.5911-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_mft_mirror() compares the mft records of a page with the mirror
records by advancing kmft and kmirr by the record size for every record.
It then passes the advanced pointers to kunmap_local(). After the last
record of a page they point one page past the mapping.

With HIGHMEM kunmap_local() warns that the address does not match the
top of the kmap_local stack. What it does next depends on how the
architecture finds the page table entry:

- 32-bit ARM looks the entry up by that address. It clears the entry of
  the neighbouring fixmap slot and leaves the real mapping in place.
  The next kmap_local() on that CPU that reaches the slot hits the
  BUG_ON(!pte_none()) in __kmap_local_pfn_prot().
- x86-32 takes the entry from the stack index, so the wrong address
  does not select a wrong entry. In QEMU the mount carried on after the
  warning.

With 4 KiB pages and 1 KiB mft records the four mirror records fill
exactly one page, so every mount whose $MFT and $MFTMirr folios are in
highmem hits it. A fresh mkntfs volume on 32-bit ARM
(multi_v7_defconfig, 256 MiB of highmem) fails on the first mount:

  WARNING: mm/highmem.c:623 at kunmap_local_indexed+0x254/0x26c, CPU#1: mount/85
   kunmap_local_indexed from ntfs_fill_super+0x224c/0x35a0
   ntfs_fill_super from get_tree_bdev_flags+0x1d8/0x2a4
  ntfs: volume version 3.1, dev loop0, cluster size 4096
  kernel BUG at mm/highmem.c:565!
  PC is at __kmap_local_pfn_prot+0x210/0x214
   __kmap_local_page_prot from ntfs_check_logfile+0x1fc/0x1210

Found with syzkaller. Kernels without HIGHMEM do not show it.
kmap_local_folio() returns the direct map address there and
kunmap_local() has no mapping to remove.

Keep the addresses returned by kmap_local_folio() and unmap with those.

Fixes: 6251f0b0de7d ("ntfs: update super block operations")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested in QEMU on mainline 551c722f4080 with a fresh mkntfs volume and
with the syzkaller program that found the bug.

  ARM     multi_v7_defconfig plus KCOV, virt, cortex-a15, 2 CPUs,
          1 GiB RAM, 256 MiB highmem
  x86-32  i386_defconfig plus HIGHMEM4G and NTFS_FS, q35, 2 CPUs,
          2 GiB RAM, 1.1 GiB highmem

In the table, warning is the WARNING at mm/highmem.c:623 and BUG is
the one at mm/highmem.c:565.

                          mainline            with this patch
  ARM, mount              warning, then BUG   3 mounts clean
  ARM, syzkaller program  warning, then BUG   3 runs clean
  x86-32, mount           warning, no BUG     warning gone

x86-32 still warns when mount(2) returns. That is the bug fixed by
patch 2.

The other kmap_local users in fs/ntfs unmap an address inside the
mapped page. Only check_mft_mirror() advances the pointer it later
unmaps.

 fs/ntfs/super.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 4066bacabe37..a53f9997c152 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -959,7 +959,7 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 	struct super_block *sb = vol->sb;
 	struct ntfs_inode *mirr_ni;
 	struct folio *mft_folio = NULL, *mirr_folio = NULL;
-	u8 *kmft = NULL, *kmirr = NULL;
+	u8 *kmft = NULL, *kmirr = NULL, *kmft_base = NULL, *kmirr_base = NULL;
 	struct runlist_element *rl, rl2[2];
 	pgoff_t index;
 	int mrecs_per_page, i;
@@ -974,9 +974,9 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 		/* Switch pages if necessary. */
 		if (!(i % mrecs_per_page)) {
 			if (index) {
-				kunmap_local(kmirr);
+				kunmap_local(kmirr_base);
 				folio_put(mirr_folio);
-				kunmap_local(kmft);
+				kunmap_local(kmft_base);
 				folio_put(mft_folio);
 			}
 			/* Get the $MFT page. */
@@ -986,7 +986,8 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 				ntfs_error(sb, "Failed to read $MFT.");
 				return false;
 			}
-			kmft = kmap_local_folio(mft_folio, 0);
+			kmft_base = kmap_local_folio(mft_folio, 0);
+			kmft = kmft_base;
 			/* Get the $MFTMirr page. */
 			mirr_folio = read_mapping_folio(vol->mftmirr_ino->i_mapping,
 					index, NULL);
@@ -994,7 +995,8 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 				ntfs_error(sb, "Failed to read $MFTMirr.");
 				goto mft_unmap_out;
 			}
-			kmirr = kmap_local_folio(mirr_folio, 0);
+			kmirr_base = kmap_local_folio(mirr_folio, 0);
+			kmirr = kmirr_base;
 			++index;
 		}
 
@@ -1006,10 +1008,10 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 					"Incomplete multi sector transfer detected in mft record %i.",
 					i);
 mm_unmap_out:
-				kunmap_local(kmirr);
+				kunmap_local(kmirr_base);
 				folio_put(mirr_folio);
 mft_unmap_out:
-				kunmap_local(kmft);
+				kunmap_local(kmft_base);
 				folio_put(mft_folio);
 				return false;
 			}
@@ -1045,9 +1047,9 @@ static bool check_mft_mirror(struct ntfs_volume *vol)
 		kmirr += vol->mft_record_size;
 	} while (++i < vol->mftmirr_size);
 	/* Release the last folios. */
-	kunmap_local(kmirr);
+	kunmap_local(kmirr_base);
 	folio_put(mirr_folio);
-	kunmap_local(kmft);
+	kunmap_local(kmft_base);
 	folio_put(mft_folio);
 
 	/* Construct the mft mirror runlist by hand. */
-- 
2.53.0

