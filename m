Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495503;
	b=LrodXksoX/2IMMQVqvT+epCWFES5ttVIy5muP8cY+XPPGiEg/603ikljqaJYt3+q8rEp
	 PbVz/KWZfKYqws925QmV665ICgxLlP7SCGUpkjXcP+51vELEL8j2wB3nR8qYsix1q2q06
	 j7hnzNY0KGsr2NvFKeNtkLIEDyO09h83q4YpT4fILotnET+yywtm25wTnovuiu5Xabm8a
	 kaimJQmsRwWOO9wmAiMlEp6xThmuzZ7QW1gmjQnzBJIwA+5iLixOxd47nSwyDbYl9ob+7
	 KMhZhwhU8CgL0CKc31tCq3xu23tLXKoX+bZc/9BL1QOpTZ1S+4AcOeb5JIhgZvwdvdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495503;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QUP6SPSOZxiHeyhbfS+dXlCbcG1HRBsJUZYj782mpUM=;
	b=UbvDSZVkj3Fc1iwUUD/oXe341An3UjI+xkiJ/+ndMYVYEQojDduPTnFh7JyMKltlRgXg
	 3kdjB7FNK7WHiLOm8nD6WY/4bIBE7Q3n6lYDUGUgi/X+rTxYga8V6gLIbHMQ2doWv/cDt
	 NVGv2VurtY7+smIFVO0D8FzJq5z2KoEEQQgTppT/1mI05/M5/4aBPV/ZN2sAA5A/TCQoC
	 3uHsI1f2GXWSoIpd2ICVLuG/TB2TtY8otWdJfkkkkwJv+8bNYrP8Y6BJ24o0wNuFYM2i7
	 oBRgpMlO5iWwrAhXaOqAljG43fNov1CYUxu423vx/2PJwpXfl3IuufpsrPGQxRmvMKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Eahz2/CO";
	arc=none smtp.remote-ip=91.218.175.162
Received: from mta0.migadu.com (out-162.mta0.migadu.com [91.218.175.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB6606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07EB6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Eahz2/CO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=i9Q3SmOpz+KPYEpALmvkIJWw5TduFHLPeDEKt173MjA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794495501; v=1; x=1795100301;
 b=Eahz2/CO7aEKj+nbHgYn+vvFzcU3PoOkMG4OSAmzc9p9jCPCplEyMZQ9DibkaDV72ND7vSKD
 gsH49oOsdVUaJHxlxngU1OVs7JxA5RVFe2shGIhTnwxQ+MesLtgY3JXlLosat65Nb7uCR0RzoXI
 NwZm3Kj8vZ41ccQlVQIea798=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5ac9d45833a0da8a;
	Thu, 12 Nov 2026 14:58:20 +0000
X-Mizu-Trace-ID: 5ac9d45833a0da8a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host driver issues
Date: Thu, 12 Nov 2026 14:58:14 +0000
Message-ID: <20261112145814.853424-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sascha,

I found a couple more issues in the GICv5 host driver while looking
into pKVM support for GICv5. Rather than explain the fixes, I thought
I'd send you patches for two of them instead. If you think they're
useful, please include them in v3. They apply on top of this series.
Boot tested on the GICv5 FVP with a two-level device table.

For the third one, the thing I spotted is that if the IDLE poll after
an IRS_MAP_L2_ISTR write times out, gicv5_irs_iste_alloc() clears the
level 1 entry and frees the level 2 IST, but nothing cancels the map.
The IRS can still complete it and use the freed table. Keeping the
table isn't enough either, since the next allocation in that range
rewrites the level 1 entry while the map may still be running
(R_SDVFP). vgic_v5_alloc_l2_vmt() and the ITT frees after a timed-out
invalidate have the same shape. The question is, can an IRS miss the
poll, or is a timeout here only ever a dead IRS?

Cheers,
/fuad

--- >8 ---

From: Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH] irqchip/gic-v5: Invalidate the level 1 DTE when registering a device

With a two-level device table, gicv5_its_device_register() makes a
level 1 DTE valid when it allocates the level 2 table that it points
to. However, gicv5_its_device_cache_inv() invalidates the ITS caches
with ITS_INV_DEVICER.L1 clear, which doesn't invalidate the level 1
DTE. An update isn't guaranteed to be visible to the ITS until a cache
invalidation that covers it completes (R_HQFDL in the GICv5
specification). An ITS that cached the level 1 DTE while it was invalid
can keep dropping events for the DeviceIDs in its range.

Set ITS_INV_DEVICER.L1 on every device invalidation. It covers the
level 2 DTE as well, and has no effect with a linear device table.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Setting L1 on every invalidation turns each registration and
    teardown into a range invalidate, both rare paths, and keeps the
    function simple. Setting it only when registration allocates the
    level 2 table would miss a registration that fails after the
    allocation, which leaves the level 1 DTE valid.

 drivers/irqchip/irq-gic-v5-its.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 101aceec68f63..83952e30178b1 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -372,10 +372,11 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
 	u64 didr;
 
 	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, its_dev->device_id);
+	/* L1 also covers an L1 DTE that a registration may have just made valid. */
 	devicer = FIELD_PREP(GICV5_ITS_INV_DEVICER_I, 0x1)	|
 		  FIELD_PREP(GICV5_ITS_INV_DEVICER_EVENTID_BITS,
 			     its_dev->itt_cfg.event_id_bits)	|
-		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x0);
+		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x1);
 
 	guard(raw_spinlock_irqsave)(&its->inv_lock);
 

--- >8 ---

From: Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH] irqchip/gic-v5: Clean a level 2 device table before making it valid

gicv5_its_alloc_l2_devtab() allocates a zeroed level 2 device table and
writes the level 1 DTE that points to it with VALID set. Unlike the
other ITS tables, the new table isn't cleaned to the PoC first. On a
non-coherent ITS, the zeroes can still sit in the CPU caches when the
ITS reads the table, so it can take stale memory as a valid level 2 DTE
for a DeviceID that nothing has registered.

Clean the table before the level 1 DTE is written.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v5-its.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 83952e30178b1..b2d61ba3828cb 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -416,6 +416,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
 	if (!l2devtab)
 		return -ENOMEM;
 
+	gicv5_its_dcache_clean(its, l2devtab, BIT(span) * sizeof(*l2devtab));
+
 	its->devtab_cfgr.l2.l2ptrs[l1_index] = l2devtab;
 
 	l1dte = FIELD_PREP(GICV5_DTL1E_SPAN, span)			|
