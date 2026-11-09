Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211060;
	b=n7I7sYf+Mp/1/cXzi7uO0beGpLb92yXLvTUZgtl3GPUyJHUeTP4peyWavK//XWvhpZf2
	 IuDSp0q0lYUlwbeZvHwLkK9l/NGHI+zuIiFPJovGyNIBKiacPKdVOmezAznBTFpTd8Vf8
	 orIQyNPILPTZjWLHK4lJjbFgBxascBoE765F9yTqnnYkpLqrgEtzJ8sIw2/1mKdSYEp1I
	 UfQh690T0t5eJK1xd+jNjRPrLkQgkQYcVkPPY5E5+PylxTIihz1JmOQWYjAWTa9lSTevj
	 mDiHFtqAB14QblgH3WmdIWdWtiAuzQQ1qrBHOylIWnGBrVGLaYrNMh9BSdLPZyuMIuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+qpfaa8PB4siPyxqqKNcOFnVRd7Su/+oqhhjIbgVahw=;
	b=0d65yxBqoZpeuDRqw603KMDXmWtZ7voULHiw4Q3y1AikrwZ8VRU2qoWowcdUvFDHWdbO
	 dZmnk0BDp2L3wu66xZ2GFaWCH/mxUu82/L28FnL8NPIuLXisnj/Pu1zJpDhcO34DP8pOn
	 D3nptFBOBuA2/VGblTSUjzNTbGNWeUM6cm+/GciC1wOVWKszypbEuTJlaWQ3YeQQHlOuZ
	 M/rFzI83TxVUZpcp1Tt3hrfDB8BRUTeIY2omCDBHvy4JpXH0tdcvCpCDz686tUchMckmP
	 8hTaQ5XUbFd0EMvVFTmAjJbcogO4PVUczcW3ac70HUYnSnEw7+58nJv92FnfESC6a6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQ2ShVzY;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F3F606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F3F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQ2ShVzY
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3403155e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211058; x=1794815858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+qpfaa8PB4siPyxqqKNcOFnVRd7Su/+oqhhjIbgVahw=;
        b=TQ2ShVzYy9q+SHssB5D4X3eAdhuuMSTjdW06GcG7TU59KbSaUVP+ZWlB8dyEdeVMoG
         6UEGNjRbAmBSjnXOKCVzk/pPhHSU0e8L8qo4Mrm/PTJeGSFSfDGEwG0yU4Hoxe1G6g8o
         zsp2HR/m/UTuEZPOL6XWW7FI4pUJSxYUN73XaKVxgAq/jdthjbBaCZD2AdgPYVAm97uU
         q5UkDFciimiGewRJkNri7C0ub2ZhMpGHSZu2BVJ3Hs34geJhwCblGkT9/Wfh/79Td0p3
         TxSlVgz0/UaZJp0DJnmd6jGsujw692MkGFfBJD02Z5Tb5YO6moNphil4ezDjGYF6Lr23
         XAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211058; x=1794815858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qpfaa8PB4siPyxqqKNcOFnVRd7Su/+oqhhjIbgVahw=;
        b=0RkmnqsR6pGPR2pHeh2xO+iDF2sPnFBmf2NxwGMLnBdqTnBnVVKqI7VRsQCFJDPA6W
         anbdyBpBpBbphsqa30R6Ucd4fmgKerH5hcBiIIQYzfA+bIPGMidmmLpT85mG6NqzDKxZ
         k3RX0SiShZ3KDcH0riRX5Zg0CpkzplaMqSyAkTTbId6ZfzhGDAVDwMZfbAj3s87f+arY
         /l2CRE7J9ODB4lOJyoQB9FF06D60GWMPEq5V1TM4Y3hWjY0lJ7umcoxs4979y6uJYrVA
         EPZIXhxJX28mBB0YY9JyRzehtBtPGYAu9QQZx7oW41GiQgWn+Y+3Qsb57G5u+GuAY55u
         uBaA==
X-Forwarded-Encrypted: i=1; AL+hErEbJ5qs5ZgdjsUoBlXOYSY6rWX3iToDexf0pGxiHi1PTPoorokRY++GMn0YN+gNP3oRsVc+jMPxR5FNHJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Go+rFFMro5pwdQZgj3VY+Iisgqi9BBkkqVvy0htiu0j02hZzU
	Sp9ffsjDF4Swyi201od01eiUSoPC9HVV7OXgzSXGjgqmXhZUWYEEUEk3
X-Gm-Gg: AYBFou0LdUSshAkPaZnQlJJnoG5ze8jumZzRHyrT8oSSSsjiEp7/ej6Enxcn++VgWsG
	+A6zhLfDfzsVwfXsoC/13X8MOlLr+pVBFCwt4yng7oElRnu1s5U5BLN/H+FVccyTPFw3RS3JYN4
	HZ+TgFBK8p6diln16J/NrI+ZqjdvGqemi4ODaI1vOIkM+f6Ps9IkpXElx9D4S2UHboN5orObiY6
	x3A1mRZW+42UZVTeCVgZt1JModIyljgVVzJW96L/OciWYBc4qqv4LCvHCgwbewDVHcJ4qswLu1l
	21Qz0JBQaS4cAMupPlZzxAJ9EnGyben1S+qhK7clVOsSdKjE5FkerjWICNDg4s2Dz0nhr+f/p8x
	oJHBWY7u3vN3j71QObfATAYEeHLzyxKlzCoNsxuIwT/WyawvrPypiC9ifX1QsPgnsesXeovdq7+
	akKttqODrHAzqFi4nGkxoqsmXrTgF5Y4Du0FlpNLgMu8BI3KNe+b5hn4j1PYl/d/RXpGvrFIri0
	LT8Elg4xKqiJwEjLVDUbVdp/RnxiVvS55DcCrwFJSjnjF71Gq1ou18VNOLZpRtTrIkDRPq4GRzn
	NkamF1IuOYnCaw==
X-Received: by 2002:a05:600c:c0c8:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4b960d9c6afmr43080115e9.7.1794211057941;
        Sun, 08 Nov 2026 23:57:37 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm107949145e9.8.2026.11.08.23.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:57:37 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Changyuan Lyu <changyuanl@google.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	kexec@lists.infradead.org,
	Mukesh Pilaniya <mpilaniy@redhat.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v4] memblock: don't allocate new reserve_mem regions on a KHO boot
Date: Mon,  9 Nov 2026 08:57:25 +0100
Message-ID: <20261109075733.9051-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On a KHO boot, a reserve_mem region that can't be revived is allocated
from KHO_NOPRSRV memory, which includes the bootmem the next kernel
boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG, preserving the region
then fails:

  WARNING: kernel/liveupdate/kexec_handover.c:1245 at kho_preserve_pages+0x168/0x180
  failed to prepare memblock FDT for KHO: -22

Without it, the next kernel puts its memmap on top of the region and
the ramoops records in it are lost.

There is no use case for adding regions across a live update, so fail
instead of allocating, and drop the TODO. A KHO boot with kho=off hands
nothing over, so it still allocates.

Add kho_is_enabled() and is_kho_boot() stubs so the memblock tests
still build.

Fixes: f99230780211 ("memblock: add KHO support for reserve_mem")
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v4:
- only fail when KHO is enabled, a KHO boot with kho=off hands nothing
  over (Mukesh).
- add a kho_is_enabled() stub to the memblock tests.

Changes in v3:
- add an is_kho_boot() stub to the memblock tests (Mike).
- add Pasha's Reviewed-by.

Changes in v2:
- fail on a KHO boot instead of allocating outside bootmem, as agreed
  with Pratyush [1]. this drops v1's patch 1.
- not an RFC anymore.
- based on v7.4-rc1.

v3: https://lore.kernel.org/all/20261105213153.9572-1-azpijr@gmail.com/
v2: https://lore.kernel.org/all/20261104204235.9066-1-azpijr@gmail.com/
v1: https://lore.kernel.org/all/20261021211058.83483-3-azpijr@gmail.com/

[1] https://lore.kernel.org/all/2vxzfqxglrg6.fsf@kernel.org/

 mm/memblock.c                     | 12 +++++++++++-
 tools/testing/memblock/internal.h | 10 ++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index a450092a80fb..0f466fcfc719 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2827,7 +2827,17 @@ static int __init reserve_mem(char *p)
 	if (reserve_mem_kho_revive(name, size, align))
 		return 1;
 
-	/* TODO: Allocation must be outside of KHO_NOPRSRV region */
+	/*
+	 * On a KHO boot memblock only allocates from KHO_NOPRSRV memory here,
+	 * which includes the bootmem the next kernel boots out of. Only regions
+	 * handed over by the previous kernel are supported, unless KHO is
+	 * disabled and nothing will be handed over.
+	 */
+	if (kho_is_enabled() && is_kho_boot()) {
+		pr_err("reserve_mem: can't allocate \"%s\" on a KHO boot\n", name);
+		return -EOPNOTSUPP;
+	}
+
 	start = memblock_phys_alloc(size, align);
 	if (!start) {
 		pr_err("reserve_mem: memblock allocation failed\n");
diff --git a/tools/testing/memblock/internal.h b/tools/testing/memblock/internal.h
index ba4d1c02fde5..a68124d76b10 100644
--- a/tools/testing/memblock/internal.h
+++ b/tools/testing/memblock/internal.h
@@ -51,4 +51,14 @@ static inline bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
 	return false;
 }
 
+static inline bool kho_is_enabled(void)
+{
+	return false;
+}
+
+static inline bool is_kho_boot(void)
+{
+	return false;
+}
+
 #endif

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

