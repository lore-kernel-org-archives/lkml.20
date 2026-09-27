Received: from mail-ej2-f26.google.com (mail-ej2-f26.google.com [74.125.228.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA76120D4FC
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790545427; cv=none; b=SAHvgox4zvDlaPkdVplCpU94x7TzhHDrzBpje3JGDqmdmsLF5Iqq/YcDInrAJFcXGWOtM4LXdYMuTRV/lkBC34CwYijCmt1jFHF8r0I6Huh248v6m8kCME8TFobvbxSgqjnKrydU3/eVmMrM1pFURXB2a0pBYqe3WEsAt67Z2bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790545427; c=relaxed/simple;
	bh=L01dxEkesUBA3VBO8737+O0T4hT4GIFzjrZLjQXI62s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bmkr+yfgxPNudopKuXnvL5vV6J1/PHwJWThKkaYq4MbgwBqEbRVgEYGwW/sKu1ANZh88n6aOVivEEI46FoGEtW81PpNen1cQ64lxbRHFf9XKam0x7vsiH/HQAV6S9hxkRKnlB0N/OMdFikGTM1H5CQHluC8xHRqcjInJLeRfjVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f83Hp21Q; arc=none smtp.client-ip=74.125.228.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f83Hp21Q"
Received: by mail-ej2-f26.google.com with SMTP id a640c23a62f3a-c2940ef15d3so286444166b.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790545424; x=1791150224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmHZZ2mWny07hG6UzfEwL1BdtLA8PVUAlm+jdgUs4YI=;
        b=f83Hp21Qt21KyLDykyMppfPdAOIc6/Ax7YRJG7N2udJ6zu7vgW2f+69A2/Mb4OeCdi
         WN2RDdroBwIDF7w1G7Jt38+xzTTVIYuSnLw2JIGqo6tG/XWBwUoZb1vEi8Oso5+zs8XL
         pumrZ6MGSlOL0XqyM7A8gzhPu2CYPWalwK3xi035hd3sceH0o7Q30sD6Sii9qYCuyuyx
         QaJy/PEkJMZbn8gFnAwdMjJMH9xZ3atDdjAdrB/IRwCUdcHWiaMdiSyacI4EtGY5yf0d
         3cgnD4cHnCgSKjXXY0N+dWSFsyqryPIC8w1E0Krh1XNYdft9RzoBj1pFBIaDof+mVi0Z
         7zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790545424; x=1791150224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmHZZ2mWny07hG6UzfEwL1BdtLA8PVUAlm+jdgUs4YI=;
        b=FbcnH196xdXwpNJsOxnMMwaBrIQ/IHQ7ZUYNU0FL0ZGXf/bEhMI1ci01ircKkahFlY
         E0kQkAqEprIYbgfevtJgXrUv7PBJZXIKMx+TH3dgJJ2moCTolcxens5danwyQZF+Urb5
         LbxCDZTLVrujTcc73UnVUvmlDIMUKn9Afc/wniCFSrWQ0pPk/Rm4SEKdh1kJgVvxnuFJ
         ZOlKzRec0ByQiSTFz96nxBWdYfvVumnfXdTNEFjbm4H/U3Are9GRMJt2Fr2/u86bl/R8
         yh5pH9oyi5cxTSRY1/oENNu77LAZeoAK0vEIZVxuD5pJwNtRo5/NnGlWDqMwgb7P4A03
         nmiw==
X-Forwarded-Encrypted: i=1; AKwUvBzuyI3AtT76ZrMs5x3rlEqdq3Lyjb7SnWOZDem8s8J1NgQ8HWdGHhe8hzQF7zokHKJFLSBg8KmX77cu9nE=@vger.kernel.org
X-Gm-Message-State: AFuF++mmh3BhrqXeFiQQlInxY8c/9yl3pvHS33swfwOcMonc8KoyxlIn
	gvm01bwzcN1N10gLxBQiM9XxboA4Kz8WheaBKKPWiuOrqVrHwbfYpBGV
X-Gm-Gg: AYBFou25I9G25rkuB58lYF/jF+ug34PUmvFoz1D1gsdtqD+kFasMQFTfcz4NaFj/P1J
	vdqTkfi8h2Ue/F1hp/Tb2PSW70Dp87NaJBBqht+Yz8VZgR7wW/0MV7rbtiyRa0/nTfNVJr3KbZG
	ashVQd/AeWJsW3GScMFknG10Phk0EuuL5GXn5XVr0lMN2yFQB1LwsOcI857Y05t3j6f+X/Bi7Yz
	iR8VOzKB8nJIydKOBSjrOMpW1up8l2MiveUz9rEw3/0k/2IKaNCm6UtznA/uP/4VpzC3NJjZ3U5
	8QteZqF/onlIF1LEeTTRdDluVaWyyUD5F+kMi+fJpekcZvrULZLZpHrfDmgHDo34MZlIkwHTpcG
	U9tnXX98R041GdDCm6X2IZKMB+4mLeVTFjBEqPt/bWISEPqVlwLg7bLZCPLJ6HSsO97hmW+qDZI
	pJiXMaYSfWIB7iAscHMQAIbHv+q0R6YUo8AKh2eH0lHM1m6qqcOPhIgnSpkdKlWdW5lQB7WOjB+
	10EBflXatzZCG1QcqVO0UDDYydTbLl4S0H++eWR
X-Received: by 2002:a17:907:97cd:b0:c29:f5d5:5a97 with SMTP id a640c23a62f3a-c2ac241b098mr961595666b.33.1790545423787;
        Sun, 27 Sep 2026 14:43:43 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm376091866b.33.2026.09.27.14.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:43:43 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH v4 0/6] sparc32: replace sp_banks with memblock
Date: Sun, 27 Sep 2026 23:43:11 +0200
Message-ID: <20260927214334.886582-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the sparc32-private sp_banks memory description with memblock.

The first two patches convert the SRMMU consumers that already run after
bootmem_init() has populated memblock. The third patch moves memblock
population to prom_meminit() and applies the mem= limit there. Patch 4
removes an unused address bitmap before patch 5 moves the early memory
setup into setup_32.c. Patch 6 removes the now-unused sp_banks array.

This work is based on an earlier eight-patch series by Sam Ravnborg.
Patch 2 directly carries over Sam's memblock sizing conversion. The series
has otherwise been substantially reorganized and reworked for the current
kernel. It retains the sparc32 mem= command-line option by using
memblock_enforce_memory_limit() and uses memblock's exclusive range-end
semantics throughout.

The series applies on top of the sparc32 phys_base and Viking fixes,
rebased onto Linux 7.3-rc1. The prerequisite tip is recorded below as the
base commit. setup_memory() preserves relocated-kernel handling by
removing RAM below the physical address to which PAGE_OFFSET maps.

Link: https://lore.kernel.org/sparclinux/20260816075141.3489194-1-linmag7@gmail.com/T/#t

The v1 series was boot tested on a Sun SPARCstation 20 with dual
SuperSPARC-II CPUs (SM71).
The v2 series was boot tested on a Sun SPARCstation 20 with dual
ROSS HyperSPARC (RT626) CPUs.
The v3 series was cross-compiled with the SPARCstation 20 and LEON
configurations as well as boot tested on a Sun SPARCstation 20
with dual ROSS HyperSPARC (RT626) CPUs.

The v4 series was cross-compiled with the SPARCstation 20 SMP configuration
and a sparc32_defconfig-derived LEON configuration, both with HIGHMEM
enabled. Boot tested on a SPARCstation 20 SMP (ROSS)

Changes in v4:
- Use max_pfn in LEON's _pfn_valid() check, preserving the bounds of
  last_valid_pfn instead of restricting the check to lowmem, as requested
  by Andreas Larsson.
- Correct the description: LEON systems can use highmem.
- Carry Sam's Reviewed-by tag on patch 5; all six patches now retain his
  review tags.
- Rebase onto Linux 7.3-rc1 plus the three prerequisite patches; adjust
  patch 6's context without changing its code changes.

Changes in v3:
- Add Sam's Reviewed-by tag to patch 4.
- Initialize max_pfn in patch 5 and use it as the highmem zone limit.
- Use PHYS_PFN() instead of open-coded PAGE_SHIFT conversions in patch 5.
- Remove the obsolete highstart_pfn and highend_pfn declarations.
- Use the generic PFN limit declarations from linux/memblock.h.
- Document removal of the duplicate private HIGHMEM summary.

Changes in v2:
- Add Sam's Reviewed-by tags to patches 1-3 and 6. Patch 6 is the
  unchanged source change from patch 5 in v1, renumbered by the new patch.
- Drop the unused sparc_valid_addr_bitmap in a preparation patch.
- Use for_each_mem_pfn_range() and the standard max_low_pfn variable in
  the early memory setup. The change to LEON's PFN check made in v2 is
  corrected in v4 to preserve its original bounds.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://lore.kernel.org/r/20260817153237.GA702187@ravnborg.org
Link: https://lore.kernel.org/r/20260901214611.60560-1-linmag7@gmail.com

Magnus Lindholm (6):
  sparc32: use memblock when mapping the kernel
  sparc32: use memblock to find available system memory
  sparc32: populate memblock from the PROM memory map
  sparc32: drop unused valid address bitmap
  sparc32: move early memory setup to setup_arch
  sparc32: drop sp_banks

 arch/sparc/include/asm/highmem.h    |   3 -
 arch/sparc/include/asm/leon.h       |   2 +-
 arch/sparc/include/asm/page_32.h    |  16 ---
 arch/sparc/include/asm/pgtable_32.h |   3 +-
 arch/sparc/include/asm/pgtsrmmu.h   |   1 -
 arch/sparc/kernel/setup_32.c        | 112 ++++++++++---------
 arch/sparc/mm/init_32.c             | 167 +---------------------------
 arch/sparc/mm/leon_mm.c             |   1 +
 arch/sparc/mm/srmmu.c               |  69 ++++--------
 arch/sparc/prom/memory.c            |  51 ++-------
 10 files changed, 98 insertions(+), 327 deletions(-)


base-commit: ff3cbaedcebcb60f8f13fa4dd667116f29cd53e4
-- 
2.43.0
