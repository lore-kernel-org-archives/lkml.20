Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588371;
	b=Z47Y9VNfKOJkdmd/xNp+cNuGoMB2D2Ueh7g69OoRxTqHSSZJcHe+qa0Ipbpb0x8LyyA7
	 i6vkS03aV0LyjzVaxQeyDmWqodDXgNsMPvW15euGJfyFbs6XUJKcf8Y7ownBYZSIIO4Mu
	 /LwTR4TnvW2qtjzNPLjqhFJIBsXzv08yB80uhVyu4Xkf9c0XHDoDf68/v3+oKGqfH+6yk
	 l9uE6PxR1qGYTeDNE1itsgdeQFuo3yrh3i+1MHqreWMT0rmnsPJId1CGt9OU3RJ44FTkI
	 8egXAPPuIIlmJCI9wNgbsXZ26pVMqnLwoYqJZ6GRieAddbD7Y5hfjJQD+z8DuianL5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7adDJu+xJ9rJRwV/7K7rSG0s5vC11B4S7V3+Mb90FEk=;
	b=rq2dItAZh/tTrI8xMabOZhWUoiOduQy3ckNuzhXlD7Y647P9pIYVYh7TvPDETcJWby0o
	 9vWGJ9Q+LHaIO7ccsy3qwIqTRlxg6g/Iiz11pzqXYuErol3gHUQxRt2mT2cs35+QvDG9V
	 /wlijw5weIUkKrHVyWCJT593NFYkqrgMDlJl/jG7cUH132O7S6aF9L1XVbpb152qcQjZe
	 j/WIzRSg7YouMak1CcURqHGrppnQgIS9FjUqZZqoZkW4KhlBGilNsFjk2ShqKl/oyEeKH
	 uXakYmlq5/HhvzqtBaU8uwqPIbHDVuKWg6pZqwyzrjcEX9qGTwYSau22+t7/oLBrD6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S/8/O/LJ";
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70464606E233
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70464606E233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S/8/O/LJ
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9ae391a05so7271005ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588371; x=1795193171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7adDJu+xJ9rJRwV/7K7rSG0s5vC11B4S7V3+Mb90FEk=;
        b=S/8/O/LJKEzeClFPb6i2ohZGtTKtLDzfJindxVJE8tQvas8wsiyFQxM9e/ialrRJZb
         zlDySdTOa5SKcaD8Oa2hFb0MZRAg6o7ui9hEP4z6d/mS8a44w4BZguSqE2Oa1c9Q/TNa
         uTctn5HeYoIb4RurMLijI0QmDxPq3TCp2kBeoSWd/a8N6yTFVdksODLOw/nEuRkJmzeb
         nuB9iwsEzjuc6BnZVGB3wrj52WD0YoF98pA9YJ6k6tOhsr0jDr3ZiJ+rydOYf5FypLQ2
         srLzi02ftCc9O/nu13CpOeyRJMX6I6kSXQAtuUP/CiAh+e0NCmC2C6YjFrGTGdXZejol
         +T7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588371; x=1795193171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7adDJu+xJ9rJRwV/7K7rSG0s5vC11B4S7V3+Mb90FEk=;
        b=OSiZLUugYHTjMabmxzGh8J9AAbk0nVJG2cRZ4HnAvHmpGB6HE4ZULSUUMATytudKkQ
         QdbaHGcczDCAYvkJXgiYw+SBx9j9xwsKPB5+T1ykT0nrSw23YAG2N+El97+lOc4E6IS4
         ND1ieIWMrRVqzcx4S+G6w5EZQNtmZFVm2dS2iA6nFWg7ig59tPWMVI0p5SP0wGsRltoC
         qxt8hwBJZbxZezZ5wbjKXX+1gzWXb7YG/vvjZnn5KONItLmGEi6rcUiIWKYA7cgEGIqp
         XJUoeb5fT5kYm0QC8oiO5kCEdhcbRSzXs9JktZEwOEGu0EyRuXcmy9yrnQQ+J1EOgorn
         F2mQ==
X-Forwarded-Encrypted: i=1; AL+hErEh3bV8jQun/5a+SZgX85D1F21UMuVuPCfg6QfohGPH9BrhqssOPK3ztePATkxM/yII1vLS0gg2tIYhH4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zzZXRCpcT4LhT+gE7NBX5wc4QjxcQcL6wUdt//LSqnshMeHkv
	7SwINWEcHB1SRFbQWGZTUf5eft6NHo503cp67yIeKKWpmgcWo70iqXdA
X-Gm-Gg: AYBFou1/ukpqADWNLDKIXe9mh/Zk7MANLKIIcoU4jhMGXnL3DQiDooCaEYKNeAYu9A7
	I4UX7KdgMSAT3QXaXieExyirxNEnewNGr/wc6KqljM3wusE7CpGcvl+6+XleBIlKH5Ff2EPtg6q
	H++i03z2T2Z4iyMKhE+ieT28NwFceZbL3i4Z+u/xnHDp57p2uWKnX4v/TTNpERxzpDT3aE/rtav
	e3JiAW18kDHpX79Vz68zy8oSXfasOIt887mXLbnwwxTJ5Y2mLZrcjGjK8F+ZbwI5SRVyzQlkxmn
	Yhq4nWcoI3OGctlioGo43UTJYw7+58xwo6qyBsnDv57hDwijaB4+MnAYHGYdEnKpAUnkYwN69vF
	IkgJq/p1JfFBc7GXDAupbApqklqRLG7I1B+u5xdOz+B2jQYtt/k+qJIPQTZcOMHKc1zGUSS2RG7
	k8YRhg5PaM8ZUa/K2Bf5JVHqiK9em/b7JRbNX3ff3A0B+TfifIurmpVGR54vtc8FQdnvjDDmzoZ
	N3uz7R0OHw09OnjwtuYCJ9BHX48DF/UOjtnODrJHBw/ehX/+JARewyDrRJUY1GxobUoJrSEhDh4
	fz3nPIQkieYYVvDIQ4O3nCn3l5NL/x4f8eP0Qj7puRt9NF2y4A==
X-Received: by 2002:a17:903:22c3:b0:2ea:f85d:a076 with SMTP id d9443c01a7336-2edf21c0a32mr46602165ad.35.1794588370521;
        Fri, 13 Nov 2026 08:46:10 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f868231sm12908475ad.50.2026.11.13.08.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:46:08 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: validate dlen before copying filename dup in do_action()
Date: Sat, 14 Nov 2026 01:46:04 +0900
Message-ID: <20261113164605.782979-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
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

In log_replay(), data and dlen are derived from the on-disk redo_off/len
and undo_off/len fields. When handling UpdateFileNameRoot and
UpdateFileNameAllocation in do_action(), the code unconditionally copies
sizeof(fname->dup) (56 bytes) from data:

    memmove(&fname->dup, data, sizeof(fname->dup));

Neither handler checks that dlen is at least sizeof(fname->dup), and the
generic log record validation does not enforce this operation-specific
minimum.

A crafted journal record with client_data_len=0x98, redo_off=0x90,
redo_len=1, and the multi-page flag set passes the record range check
(0x90 + 1 <= 0x98), allocates a 152-byte buffer in find_log_rec(), and
triggers a 48-byte KASAN slab-out-of-bounds read past the end of that
buffer during a read-write mount:

  BUG: KASAN: slab-out-of-bounds in do_action.isra.0+0x353f/0x83c0
  Read of size 56 at addr ffff888007d9bc90 by task busybox/67
  Call Trace:
   <TASK>
   __asan_memmove+0x23/0x60
   do_action.isra.0+0x353f/0x83c0
   find_log_rec+0x277/0x500
   ...
  The buggy address belongs to the object at ffff888007d9bc00
   allocated 152-byte region [ffff888007d9bc00, ffff888007d9bc98)

Validate that dlen is at least sizeof(fname->dup) before copying in both
UpdateFileNameRoot and UpdateFileNameAllocation, jumping to dirty_vol on
a short payload.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Notes / Reproducer:

- Tested on Linux 7.4.0-rc2 (067c5c24cef2) x86-64 in QEMU/KVM with
  CONFIG_NTFS3_FS=y, CONFIG_KASAN=y, CONFIG_KASAN_INLINE=y, and
  CONFIG_FORTIFY_SOURCE=n (patched kernel mounts cleanly with 0 KASAN
  splats).
- Note that previously posted patches bounding the destination index
  entry or checking off + len <= client_data_len do not catch this case,
  because the destination entry is valid and 0x90 + 1 <= 0x98 holds.
- Disclosure: Assisted by a custom LLM-based tool; all results,
  including the root-cause analysis, reproducer, and patch, were
  manually reviewed and verified by a human.

To reproduce:
1. Fetch windows-interrupted-1.img.gz from:
   https://raw.githubusercontent.com/antimatter-studios/rust-fs-ntfs/main/test-disks/windows-interrupted-1.img.gz
2. Patch 3 bytes using poc.py below (`python3 poc.py windows-interrupted-1.img.gz short-source.img`)
   and mount read-write (`mount -t ntfs3 -o force short-source.img /mnt`).

Reproducer script (poc.py):

  #!/usr/bin/env python3
  # SPDX-License-Identifier: GPL-2.0-only
  import argparse, gzip, hashlib
  from pathlib import Path

  BASE_SHA256 = "c45659e95104eca5f793c3f21061f42705a01783e62d1c7a46c63e4089db0b9a"
  TRIGGER_SHA256 = "0e176bdd374e73dc3f40163320d6d69bfe36fe664735a50001a3bcbcad2ec2e4"
  CHANGES = (
      (0x292F878, 0x00, 0x01),  # LFS_RECORD_HDR.flags: separate allocation
      (0x292F884, 0x28, 0x90),  # LOG_REC_HDR.redo_off low byte
      (0x292F886, 0x38, 0x01),  # LOG_REC_HDR.redo_len low byte
  )

  parser = argparse.ArgumentParser()
  parser.add_argument("fixture_gz", type=Path)
  parser.add_argument("output_img", type=Path)
  args = parser.parse_args()

  image = bytearray(gzip.decompress(args.fixture_gz.read_bytes()))
  assert hashlib.sha256(image).hexdigest() == BASE_SHA256
  for offset, old, new in CHANGES:
      assert image[offset] == old
      image[offset] = new
  assert hashlib.sha256(image).hexdigest() == TRIGGER_SHA256
  args.output_img.write_bytes(image)

 fs/ntfs3/fslog.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index bb8d40bb5869..29840814c82e 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3568,6 +3568,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
+		if (dlen < sizeof(fname->dup))
+			goto dirty_vol;
 		memmove(&fname->dup, data, sizeof(fname->dup)); //
 		mi->dirty = true;
 		break;
@@ -3753,6 +3755,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		}
 
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
+		if (dlen < sizeof(fname->dup))
+			goto dirty_vol;
 		memmove(&fname->dup, data, sizeof(fname->dup));
 
 		a_dirty = true;
-- 
2.43.0
