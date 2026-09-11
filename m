Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3DE2F5A0E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789101322; cv=none; b=SxBpdHG42s/zdaA1bIFxx4NUKHd5VR5nASBBx2Rae2s+txEaG44u9VF8IzfILCMe/KmWWLKBlV3lL7VxEALzva4dcZdBkm8JsrfT+T7kF5us2DdGF8bdcmLSpsSCPAlIjtKji1BQnlyQ40RsqnBRhMHO543WatCCci2+nEENkY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789101322; c=relaxed/simple;
	bh=/kMl/1rrnIVRW9JcYOWTg96y0jK/y3vHPbvg97GUJNc=;
	h=From:Date:Subject:Message-Id:To:Cc; b=HjxTT/b9qBXL83af2lX7Yb7TWAbue0lDBTqx7iXnXr0gfboSmOgGLSwwo64RubcshHqXGGaXRDKzvs2+F/y68Bew6D4NaBHMcOLrtSn0RAdnish4ZeWgNxnfdC6ZIXaYTJxWEJr5dJUs+umorX942CvB6jbrqMm7WG3aqoe140A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBt/mN0i; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBt/mN0i"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398b3c37877so464901a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789101320; x=1789706120; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9cA0DR2ZY2xB13Au7WRv7yOzSeiiqKeGVX9UZNYUmM=;
        b=qBt/mN0i28oSPFk12GeXNOvXRekmMajvqlGgF/8j5lHUSRaX/y+RSkh4ykVhCTzNwb
         TPenASEXcROxD2Y1K2y4C9HhZOAsPu1hk9taNKecLsZIBaJCGSiEU2G4oGaqIr2tSEvR
         GXLsBl9GAK9HXSNjJwBf6tpBeGlgfvLySqYlyaxVSMCAPcpqPUQhkoG45uQ3+kVau5L9
         lnTqoyHSx0GV3/44jQnM8y9fRuZ/JJ6A6DntzIbR1bRS73VoQ0Dglfm6r393Jbo2VqYO
         ahb4d3/QWyiKetq4DtL6D5YOQjekpZJs65zAYa0SyNX5Uv3EfGHgd02yMkWn4v96o7Tq
         qYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789101320; x=1789706120;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d9cA0DR2ZY2xB13Au7WRv7yOzSeiiqKeGVX9UZNYUmM=;
        b=s5RrR2V6lngyOcpyGXCF7DiV+z4UDRW+0QngWZnE7/+p6VDDMU2xFSP6HsXzkzqaoM
         KHF45Z+l/78Kx89nHZpwNVw+VNxme2ghl8QGhj8WUyeOWhsK64B8Wkh167RzpaYfwrhs
         5YYkeLxltPVKbIV8pD1VfIWib2m/0KPUFotp59Z7HCmIwp08EaOhwC7PXPjHgyNM2gmN
         SRC40XJ36ohiX08esbCIY2QNVlQImZWru0pN0lp+BwO0ixHa+Jh8bnjO8Mi017y5SWvV
         vr9/KTJcnWl//eAAcUZj0PnlmeygixYWBz1PMzsMDNsNNzTLpGXm9ISBz8Bigy0AY1Qe
         lbVw==
X-Gm-Message-State: AFuF++mHl0UHMH4S4BkjowHqe/mlX0JfaNoHSukrbppYjWz95mhSpiad
	fJ5yv36053qTSL6IISmRLdurUXRphRK3YmVasXCAvWD0+rXq7oAIpcIBBfGRc6MT
X-Gm-Gg: AYBFou0zhTqAwYgqY9v/TsTJ36ibqi0XK+qlM3I3RDrJol0HpPLMIfTHA3AQY4J87qb
	xq6l8s/MpYD9dXv2MOe7aGJBcynxCdeTDpFbLAJwUA0owClByuEoU3lRn4iSmljXN3yoGHhHRhJ
	VU61gG3r6YtnoE4C++ebwrdkBLT4n6TF7ewJwey1wA5B4GO6vI8pPG0WwJyOj+Kn24L/0s8w6ZB
	FTHKHjSJL5nLJzRz139i3YrOKr7CL8kkH/BUR3c2FvVI30ODGukxk/roa/IlpV9ehi7zraJBhxb
	JKGdTsgW3CghhXuNkbPupjnOx7zsBfyqwRkPK9yE3l1w6SM8mOTUGDxXYgKqyIY7fcDtL7SkmiX
	u8RNgCqCc+CDWq2pk9fZGDVlg9YUSQWVmfylkIdJCfKLP00ig5B5zKH5DVADCYhPtPXCg1NNVLl
	gWQwQs8P3ZScX+46PLT4sNCzGrk6avNCgKCPDh4lDoSfsD0EHdeAsU3Q==
X-Received: by 2002:a17:90b:52c6:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39d9c34c55bmr3875419a91.22.1789101317574;
        Thu, 10 Sep 2026 21:35:17 -0700 (PDT)
Received: from smtp.gmail.com ([2401:b60:16:d3::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm2729358eec.25.2026.09.10.21.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:35:17 -0700 (PDT)
From: "lichen.wang" <wanglichen9110@gmail.com>
Date: Fri, 11 Sep 2026 11:09:39 +0800
Subject: [PATCH v2 0/2] ubifs: add KUnit tests for scan and key helpers
Message-Id: <178910129195.312459.4416253112232222978.p0-of-2@gmail.com>
To: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This series adds KUnit tests for fs/ubifs/scan.c and for the helpers in
fs/ubifs/key.h, so that the node parsing code can be validated offline
without an MTD device, a UBI volume or a development board.

Changes in v2:
 - Use KUNIT_ASSERT_EQ() instead of KUNIT_EXPECT_EQ() for the
   ubifs_add_snod() return value checks.  On -ENOMEM the function leaves
   sleb->nodes empty, and list_first_entry()/list_next_entry() on an empty
   list yield a pointer before the sleb allocation, so continuing after a
   failed add would read out of bounds.  This affects expect_snod_keyed(),
   add_snod_pad_node_gets_invalid_key(), add_snod_trun_node_gets_invalid_key()
   and add_snod_appends_nodes_in_order().
 - Assert on sleb->nodes_cnt in add_snod_appends_nodes_in_order() as well,
   because the following list_next_entry() is only safe when both nodes were
   really linked.
 - Value checks that cannot be followed by a crash keep using KUNIT_EXPECT_*()
   so that a single run still reports every mismatch.
 - Link to v1: https://lore.kernel.org/all/178909365090.247910.11265261850560199708.p0-of-2@gmail.com/

Baseline:

  commit df2908090cda368b01ff43709f51890076c56157 ("Linux 7.3-rc2")
  git describe --always of that commit: v7.3-rc2
  (the describe string is that of the base commit itself; the patch
  commits sit on top of it, so a describe run at their tip reports
  v7.3-rc2-2-g3bcc6fa04 instead)

Motivation:

UBIFS has no test coverage for its on-flash parsing code: checking a
change to scan.c or key.h currently means bringing up a real NAND
device, a UBI volume and a board. KUnit makes the same checks run in a
plain QEMU boot within seconds, and it is the established in-tree
framework for this kind of unit testing, so the tests are reusable by
anyone touching this code.

Approach:

 - The tests are compiled into the ubifs module itself (ubifs-y) so
   that they can call the non-exported ubifs_scan_a_node(),
   ubifs_check_node(), ubifs_add_snod() and ubifs_end_scan() directly.
   No EXPORT_SYMBOL() is added to production code.
 - kunit_helpers.h builds a minimal fake struct ubifs_info with
   kunit_kzalloc(); only the fields read by the tested paths are
   initialised. The node length ranges mirror init_constants_early()
   in super.c, because a zeroed range means "fixed length" for
   ubifs_check_node() and would make the length checks pass for the
   wrong reason.
 - The node constructor fills the common header and payload first and
   computes the CRC last with the kernel crc32(), over exactly the
   bytes that ubifs_check_node() checksums.

Testing:

The whole suite runs with a single command:

  ./tools/testing/kunit/kunit.py run --arch=x86_64 --timeout=300 'ubifs*'

kunit.py exits 0 on the final tree and reports 5 suites and 80 cases,
all passing:

  Testing complete. Ran 80 tests: passed: 80

with zero "not ok" lines in the KTAP output.

The fake ubifs_info environment was additionally checked against the
real stack: a nandsim smoke test booted a kernel built from the
baseline over a complete MTD -> UBI -> UBIFS stack, attached mtd0,
created and mounted the volume and wrote and read back a file
successfully.

Known limitations:

 - ubifs_scan() and ubifs_start_scan() are not covered by KUnit: the
   UBI layer is not stubbed, so they would read from a real UBI volume
   through ubi_leb_read(). They are exercised by the nandsim smoke test
   instead.
 - The tests build nodes in memory, so they cannot catch bugs in the
   on-media layout itself; they only pin down the behaviour of the
   parsing code for the layouts that UBIFS currently writes.

Notes:

checkpatch.pl --strict reports 0 errors for both patches. Each patch
also carries the generic "added, moved or deleted file(s), does
MAINTAINERS need updating?" warning; that reminder is emitted for every
patch that adds a file, and the new files live under fs/ubifs/, which
is already covered by the "UBI FILE SYSTEM (UBIFS)" entry in
MAINTAINERS ("F: fs/ubifs/"), so no MAINTAINERS change is needed.

The cover letter itself draws one more warning from checkpatch.pl, a
"Prefer a maximum 75 chars per line (possible unwrapped commit
description?)" hint for a single line of the Changes in v2 list. That
line is left unwrapped so that the four affected test names stay on
one line and the list stays easy to scan; it is prose in the cover
letter, not code or a changelog entry that a tool will reformat.

Signed-off-by: lichen.wang <wanglichen9110@gmail.com>

lichen.wang (2):
  ubifs: add KUnit test scaffolding for scan.c
  ubifs: add KUnit tests for key helpers

 fs/ubifs/Kconfig               |  16 +
 fs/ubifs/Makefile              |   1 +
 fs/ubifs/tests/key_kunit.c     | 555 ++++++++++++++++++
 fs/ubifs/tests/kunit_helpers.h | 222 ++++++++
 fs/ubifs/tests/scan_kunit.c    | 988 +++++++++++++++++++++++++++++++++
 5 files changed, 1782 insertions(+)
 create mode 100644 fs/ubifs/tests/key_kunit.c
 create mode 100644 fs/ubifs/tests/kunit_helpers.h
 create mode 100644 fs/ubifs/tests/scan_kunit.c

--
2.43.0


