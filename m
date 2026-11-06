Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966559;
	b=PaA2pUp+TMRsiLWfxdHXkqJ7v/xP08d3ItLDn73i+rGFSnvrNR+Z11pVtDS5oaVRj9JQ
	 zzX9aJH6KhdkMZ8siyWq51EWDYjCof3vLMf7IM5DpDvYwMLTM0OlIEWZXTjjuk5YoeG+J
	 kLmWxf578D7USd1+hJAN+zRFMaE76+DxoiwIlcvySbonrb9MioQEUxGb3/WqsyOfrXW5h
	 EM+gOyOsby9UAh5/QUxf8DV9pfqagwYe1hf15x60YnzG5NZ+JMCH5PP2jlBwpjw92xm2z
	 ZrElh5oDjphQLCvUXQqfVJfFfSM5YseTRRW4oSeLheZdk24uYER8U5aq+7UqMuE18qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966559;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tsd9j7DQmVwsk7vQj7YFqkd+QENwFYwyAFiOo9ajOok=;
	b=dMTR46Sj2Lpq4zTtykJBtILpNFZMeJRtMU7ambpMtzw/GK7GTDS+YlRkNmoP2NeQo1FP
	 HoTP6NGL3RO4kULbAXw+/BsvYw0Ah4y9X6TJkDX6iQpcB+3n23XJ4ysVHid+ZLYRLjbYb
	 KFLYJAhxgniJIrCYX4H2aZhbGtB/O24dfogzvgsCHd+345IOMGqTI1STNfD6gKgdc4oSY
	 Q5JfetNbkkcnTkn4PFytVDmXb+sgTSqkHJL6W9LXe0befkdTHW1DGa2Lkm6yWeEFlezpj
	 MBZgBvv+Ggx7lXOFaswqdoLBjw1MSdZKlwpc/AWt7izn7pZE2ZeN18/sp3E55JWw4uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ipnaVFMC;
	arc=none smtp.remote-ip=91.218.175.52
Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96E606D810
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A96E606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ipnaVFMC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sqSqTyRpszyGBYB7Puxj95eSOJmKiJOqpyoy1g3EpU4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793966557; v=1; x=1794571357;
 b=ipnaVFMChFK/kP0xFApf1PWsAKEE7nb4SvQT99mJIZEPPVoEuYjZEieb52tWCsT49enW0aAG
 N+TSEvwQpKrOYxIhrsM9g01AMQQIGYTmyMjdtMnkAfwSGaQLt8AEqxy5JXTVRfBC3KQDTnnyfLm
 6wD2GBYLo2+k3ukrHoTjyR0I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ff037b2ff7a2ece4;
	Fri, 06 Nov 2026 12:02:37 +0000
X-Mizu-Trace-ID: ff037b2ff7a2ece4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	lpieralisi@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	tabba@google.com
Subject: [PATCH 3/3] irqchip/gic-v3-its: Clean a non-shareable vPE table to PoC
Date: Fri,  6 Nov 2026 12:02:21 +0000
Message-ID: <20261106120221.347309-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106120221.347309-1-fuad.tabba@linux.dev>
References: <20261106120221.347309-1-fuad.tabba@linux.dev>
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

On a GICv4.1 redistributor that doesn't support shareability,
allocate_vpe_l1_table() points GICR_VPROPBASER at a freshly zeroed
vPE table with Z and Valid set, but leaves the zeroes in the CPU's
cache. The redistributor reads the table from memory, where it may
not be zero, and the spec makes that UNPREDICTABLE (GICR_VPROPBASER.Z,
IHI 0069H.b 12.11).

Clean the table to PoC when the redistributor is non-shareable, as the
driver does for its other tables.

Fixes: 846297e11e8ae ("irqchip/gic-v3-its: Handle non-coherent GICv4 redistributors")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index badc3843d90ca..5b3273e0dfc79 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3012,6 +3012,8 @@ static int allocate_vpe_l1_table(void)
 	if (rdists_support_shareable()) {
 		val |= GICR_VPROPBASER_RaWb;
 		val |= GICR_VPROPBASER_InnerShareable;
+	} else {
+		gic_flush_dcache_to_poc(page_address(page), np * PAGE_SIZE);
 	}
 	val |= GICR_VPROPBASER_4_1_Z;
 	val |= GICR_VPROPBASER_4_1_VALID;
-- 
2.47.3

