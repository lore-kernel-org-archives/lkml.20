Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9096C324B33
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503658; cv=none; b=dT9XtLcPxNISx0CH/oLeMK+cNiHqTLHpVda0PaPJzybTO2VrrFL095aKdSOCymTlqLTldotGWaM78zHGIPNr0xTiXwmDQHD1sFuywCe/SDr4bRWubOqHGVTJPE4xv1bm5vKsPtVKRcuNZJbQzJsOW3NosXxzpVcZcQj5UugCh0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503658; c=relaxed/simple;
	bh=tAdh45B6ZHFVqj4WgSvf0WZhKctd2Lk2TZ1YVcBta8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ioDDnSCj5U7EP8tdRVgMYMtR5oH6e/xSRIPhNpDboBbBvWNzrr2jYMvrupgXGlv8sBJ0hjsediTV7RxLAnd6r36My+KM85B3WPLpksPe/q0SRBf+b0FaUzXOZzhrRQqKxZJnpoxV7QisSb9AbaLSYuxhmPYA/l9vc8vx9LP1j1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sA4laCNU; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sA4laCNU"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9196b81f00dso1429706d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 16:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791503654; x=1792108454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LiKuR1cop6zWSqjy7NaZ294spzxiEHuaWQoI/VIIui8=;
        b=sA4laCNUhcWfPeT9fR7XPwk1EL0t4oGRftvZpWbGyzi9CUGqxGCUqGOTnnJMuYx83S
         PLXdYK+croYAi45ECIGloTuncUiJE0quNkkAZuAAHhPmwtvltrFi0bc6GfYc2I7c0w4P
         stmhupR6N1FWYTs1u9lKVIIRGu7d8UglDhct0l9IPeCizAgruVw59841ouAnNmsPOkfE
         Pm8FgneRNtlNavTuWPzMe5XUS6M5Bl2XJlHj3YjasEjKcLS2kuOnOp+eqPK8RI5q3iu2
         3IG25RWgpMMb5uDQxTDF1reRgCANyEJVmchcl4n2wfn+klRTwSw/R/C9Z0TOHWaRq5w4
         QJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791503654; x=1792108454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiKuR1cop6zWSqjy7NaZ294spzxiEHuaWQoI/VIIui8=;
        b=PY1fW/fzIFGJYfqUdWYUlDOWocwHSFOkVo7h+XI81dbU889Ft1SXuH6vCavTcGODwV
         BSvIQNHvH+A6i0c5F8/RS/0jK37Dg88UBUcwEFCz/ND5P00ReB8/6ok07LmdNivXNUYD
         pXc7HziQ5kyEx30DicJ5XJRXfGvvQzrxGzbRvgmIZZXdu94g2os4qIkd+F+r30dhxnHp
         PgQ/KrAAZ9fsH3/j+u6Z1r2pQK+pkIZ62hW2DiHp6q29orCD0EOlH7Yrx8NTyVXD9QZH
         o6NCEu0O9DNF0Szu5z2PaKB++pEJirGZATrDRWOgFXR1v6f8QLJJ20X+/aXdl9VqcEaa
         yjRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZkr4wRBuLbBkfNmtrqfg6/0ax3Z/tOuCww9WoqwCwxnNcQxgJhvZJlV0bxuVeglYBOQ1A5n9rDp3zPcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLejRZ8SwYxfSxDzgawbdNe6pU5GoJcMjqm3zf0nx9174knp6wW
	96TNkIJy8RKC7qdqfRiKmDwDHJLPCcTMbahw8vGJTXXsFFUGotVl0JUv
X-Gm-Gg: AYBFou10VSoC1TAaXp5oWLqU+VfQVQOnpH8XuNTZ276oIA4ChE+xYS9y9MSO8ZQt2fV
	Yt9PhM4JdGn7q6aynyMv0c8p73/pAp2ywMidMGDXX8E+NKw31J6lCCShwOnm+h/5iNHRsUh+Re5
	67cU6Y531Hqb+k9wk5SJE9fKCFZ8ufJyPAojZYmOYyvCg/4infOjLCL9vLo9IfqVPzalpo0qAfA
	LalU8goXaffcsrQ1CnJXjk6ymqL/KVzPmxzMYSLEj8yrlAagqVO5Ey0eNW86ISpB+l5zqtMUA3E
	yk3Kte36FV3TcV7BiymlCio25R5AG4rF3aA0aABdr5K3FkNzr/uFOikHoLMCoZd8sDrqI8Snmo8
	vJUDEbPMS4y7P14twBAi4EaVRoId0JgxOHt0EpKHdZh82Oc3kZdr4ULZCx73F9wIUrGEYDdq4Uj
	huvG1MjS3bwsD+C/CPC5S2YGNLh8JJQD9/nmMaY9zQ0hNXQc7917qTfQcl/NY2RB1O06REPYIb/
	DPrpE+iN7NFtMqcFAdIVorHjhn/3Afvcd+Q6UzT3iUVQmXg4IV7adAODlx8edxjWguhGzRTBYro
	h6hhJNQkPdNAWnQUgS64i7r/S8j96w==
X-Received: by 2002:a05:6214:4017:b0:914:3ef6:ec0a with SMTP id 6a1803df08f44-91b55500ce2mr6371526d6.3.1791503654285;
        Thu, 08 Oct 2026 16:54:14 -0700 (PDT)
Received: from localhost.localdomain ([132.170.205.109])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550e6609sm3451586d6.43.2026.10.08.16.54.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 16:54:13 -0700 (PDT)
From: Sanan Hasanov <sanan.hasanou@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Sanan Hasanov <sanan.hasanov@ucf.edu>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fa495e1497c48a6ed885@syzkaller.appspotmail.com
Subject: [PATCH v3 0/3] scsi: target: rd: Fix oversized ramdisk allocations
Date: Thu,  8 Oct 2026 19:54:06 -0400
Message-ID: <20261008235411.56641-1-sanan.hasanou@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanan Hasanov <sanan.hasanov@ucf.edu>

A ramdisk page count set through configfs (rd_pages=) has no upper bound.
syzbot found that a large value makes rd_build_device_space() attempt a
single sg table array allocation above the page allocator's maximum
order, which triggers a WARNING. Patch 1 rejects page counts that
exceed system RAM and allocates the array with kvzalloc so that valid
large ramdisks also work.

A page count close to system RAM still passes that check, and the
backing pages are allocated with GFP_KERNEL, which invokes the OOM
killer instead of failing. On a 1 GiB VM, rd_pages=250000 panics the
system with "System is deadlocked on memory". Patch 3 allocates the
backing pages with __GFP_RETRY_MAYFAIL so that enabling such a device
fails with -ENOMEM instead.

That makes the failure path in rd_build_prot_space() reachable, and it
leaks the partially allocated protection space when pi_prot_type is
written again. Patch 2 fixes that first, so that patch 3 does not
introduce a leak.

Tested on an arm64 QEMU VM with 1 GiB RAM, with the syzbot reproducer,
normal and NULLIO ramdisks, DIF protection space, device removal, and
rd_pages=250000. The leak was checked with kmemleak by making
pi_prot_type=1 fail under memory pressure and then writing it again:
two unreferenced objects from rd_init_prot() are reported without
patch 2, none with it.

Changes in v3:
- New patch 2 to release the protection space when its allocation
  fails (Sashiko AI review).

Changes in v2:
- Allocate the sg table arrays with kvzalloc_objs() so that ramdisks
  larger than 512 GiB do not hit the same WARNING (Sashiko AI review).
- New patch to avoid the OOM killer when the backing pages cannot be
  allocated (Sashiko AI review).

v2: https://lore.kernel.org/all/20261008223712.49827-1-sanan.hasanou@gmail.com/
v1: https://lore.kernel.org/all/20261008215709.46014-1-sanan.hasanou@gmail.com/


Sanan Hasanov (3):
  scsi: target: rd: Fix oversized sg table array allocation
  scsi: target: rd: Release protection space on allocation failure
  scsi: target: rd: Don't invoke the OOM killer for ramdisk pages

 drivers/target/target_core_rd.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)


base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
-- 
2.48.1

