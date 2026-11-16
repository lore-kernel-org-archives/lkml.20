Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857380;
	b=F8CZ8HZNmgHsm/Yt/1WxLg3I3B1jLFhhrOTQfVgxUdluIOz8KqcHnu15xQrQAtOcZnoW
	 +yP/c+GdUkV8eFn7eYll/enidhL7EIGdiHOGILpN9n4MksHRrYmda7sHaUBUHgVX6W6VD
	 XhrcxlOrmsj8IriJNd1SD3yWftcdHgNI0j58r9sXEBOSHPCoN5rh1ELy8EAH6g+F9lw34
	 dPDyF1POHw2fGCgxT4qiFLqaqQjGM25dC53EhZ+uMTpCyGb1Z141XMaujY8VboooRrK1P
	 nbsleO3d62lcS5C2RrBKLzAsoARnDpjeHYZGi1dgEgEWoQnGAB4+3lvjys6fWkPpt5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857380;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NLEVaE48FQsqW5wCynx+dwoMtLwn3qpODOOwTrZzvVg=;
	b=HMxVFDR1ToJ4vh1qPCB6N81XpQ20NqdOela+q47/CD8phZLSpS0xa/Vl6vgCLcBrcVsw
	 pnuC9E43JLBbvsJ+rEzCiAdR/idLD8g8gyxdAXpMnxGhDAfsrHux2uTL5G76oJC/N5vqw
	 A1ASBlwIuFZWyePONPGPN1eT8FRdnfQ4InJHnWgvaPLarpAYEwCkKtiMfVgOLt9jt2L8Y
	 GeMS5lNG9OeJGcF292S67pEWPtQoXc1eFTbjuYaxanzvlwgzpgTR/TxUiqoqz2c6LwSNa
	 e6IlnyeI1aeqVpneOvgXSwdEFuqrMr2odwyyaxfHNCLqZ5/QQkauaTJRuD9vLBwdztA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T5lq4Gh0;
	arc=none smtp.remote-ip=91.218.175.79
Received: from mta0.migadu.com (out-79.mta0.migadu.com [91.218.175.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115A2606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 115A2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T5lq4Gh0
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HQx4VWaf+Q2UNANp/KesFc5JF3/bgr/mIFQz1FQDxJQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794857377; v=1; x=1795462177;
 b=T5lq4Gh0WgzvGUuvnv17OTDAn8KiPwL65MmxwoQ9vX7vg6a9evJKaygjKzjVqA1g4NUU1h8M
 cF/+C+JeTLE0U/Gz05cHEUW0ThRuY2FP4nvlOnA5w5sSH6qTnQrkjTBTcbQ57FtQZ5UgJwIRes6
 g11XtvYD82MJNm28eBb0XoSU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5bb806d544a59f94;
	Mon, 16 Nov 2026 19:29:37 +0000
X-Mizu-Trace-ID: 5bb806d544a59f94
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] irqchip/gic-v3-its: Clean the GICv4.1 vPE table to PoC
Date: Mon, 16 Nov 2026 19:29:30 +0000
Message-ID: <20261116192933.3266502-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116192933.3266502-1-fuad.tabba@linux.dev>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
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

On a GICv4.1 system, allocate_vpe_l1_table() sets Z and Valid in
GICR_VPROPBASER and points it at a freshly zeroed vPE table, but leaves
the zeroes in the CPU's cache. A redistributor that accesses the table
as non-shareable reads it from memory, where it might not be zero, and
the spec makes that UNPREDICTABLE (GICR_VPROPBASER.Z, IHI 0069H.b
12.11.39).

Clean the table to PoC unconditionally, as the driver does for the
pending table. Testing rdists_support_shareable() isn't enough, since
GICR_VPROPBASER can read back as non-shareable even when the helper
returns true. allocate_vpe_l2_table() already cleans the level-2 pages
in that case. A vPE table inherited from an ITS is cleaned by
its_setup_baser() when the ITS is non-shareable.

Fixes: 5e5168461c22c ("irqchip/gic-v4.1: VPE table (aka GICR_VPROPBASER) allocation")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 9900c6a53526e..6932dd0a02c42 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3007,6 +3007,9 @@ static int allocate_vpe_l1_table(void)
 	pa = virt_to_phys(page_address(page));
 	WARN_ON(!IS_ALIGNED(pa, psz));
 
+	/* Make sure the GIC will observe the zeroed table */
+	gic_flush_dcache_to_poc(page_address(page), np * PAGE_SIZE);
+
 	val |= FIELD_PREP(GICR_VPROPBASER_4_1_ADDR, pa >> 12);
 	if (rdists_support_shareable()) {
 		val |= GICR_VPROPBASER_RaWb;
-- 
2.47.3

