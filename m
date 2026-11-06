Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966558;
	b=xe5RGv9E7uJpc5mtap85LidEL29bbwfkITyP17hYA/hUfIzrsUGgGlFnSUA/5sZVDjVg
	 ZxuQwOqyp5kter8HQGEFTueDYnzemoElFGjIqEQHL923Z0qmtrhTwtIsEFTirp8PHpp+A
	 xPnEcT0WvXMURKlbI0QJKWJCd+PSuGMJMQU6XXlcZTfHq8Pz8eQYlsnQ5lHQmghDB6rRc
	 oBJsRjXNQb2w+0ZX/+c/WV3D66WILMlZX/KedTOn1v+aX7NugvCH42q6l2DbNOftU0zcr
	 O/NOGpTE9E4zlMDVvYFfRclVopa9xKFcoNUAtS7ILA75Ti+zH5rTr6FNFbDuejjy98Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966558;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O8RkL6vjgz7s3PYbOIeBih+CTzkMDKhpUQb62pbipoc=;
	b=4e6cbTKuUySjf9jLKy56zSzII6XAgP6dIw6xQJPE/L5SyIYtwGTHhY21vVJyRiDCu1zG
	 Zs37H5rD6ef8zD1Z+Y6S07IuaH4Ztn1wQyCGs7tkhvtWGBuO+ArW6GVkOPteo0lnFgjjY
	 GcSnX1177vY5R0yBxvxuaiPETxWVOzhvKQykpGor8oxPDguQuu+9kuQXbBP3sh/u0FhYx
	 4OuDq23I2c+mbN67YSk3YxUn9c4yj5iO+54+rtKqsr3N4SjTdYuNExtq96sEeRagQBSm8
	 lrZdWXuxVjN4ieNr/6aKMLGTWcJZNEuP732mGx8StXnoICtk2YBwKmPHOF4P8ntINyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="rRn/ijYe";
	arc=none smtp.remote-ip=95.215.58.243
Received: from mta1.migadu.com (out-243.mta1.migadu.com [95.215.58.243])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5489606D804
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5489606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rRn/ijYe
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yNefybntTG1L/O8byYfqw9hjpQSNkaHxLxwAmXPvo5I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793966555; v=1; x=1794571355;
 b=rRn/ijYeof31L17BBvUIqQ9rbsyPv42zcI1vz8cUu7CveTCLbsnCVzkUy/OM2OGxBYGlcl1s
 94jDEKAKDK6fxwuTz86sjZ5vngbBnNSGKvN/iFitbMbRakivL6+fbxF3iwW8Sf1tCfTRITu+FWY
 JmrTiEy8DPVJI3vHAcTg3cQg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4c246dde72db0327;
	Fri, 06 Nov 2026 12:02:35 +0000
X-Mizu-Trace-ID: 4c246dde72db0327
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
Subject: [PATCH 2/3] irqchip/gic-v3-its: Order table zeroing before the GIC can see it
Date: Fri,  6 Nov 2026 12:02:20 +0000
Message-ID: <20261106120221.347309-3-fuad.tabba@linux.dev>
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

The ITS driver allocates the GIC's tables as zeroed pages. It exposes
the ITS tables and the vPE tables with a single store: a relaxed
GITS_BASER or GICR_VPROPBASER write with Valid set, the relaxed
GITS_CTLR write that enables the ITS, or a valid level-1 entry for a
level-2 page. However, on a coherent table the zeroing isn't ordered
before that store, so the GIC can read the page's previous contents as
table entries (UNPREDICTABLE: IHI 0069H.b 5.2.1, and GICR_VPROPBASER.Z
in 12.11). A level-2 page is published at runtime, while the GIC may be
walking the same level-1 table for other IDs.

Add a dma_wmb() at the end of its_alloc_pages_node(). It orders the
zeroing before later stores to memory and to MMIO alike.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    herd7 -model aarch64.cat, the ITS modelled as an observer PE that
    reads a published entry (e), then through it the zeroed page (p):
    with no barrier the stale read is Sometimes, with dma_wmb()'s
    DMB OSHST it is Never.
    
    AArch64 MP+dmb.st+addr-its-l1
    {
    0:X0=p; 0:X1=e; 0:X2=0; 0:X3=1;
    1:X1=e; 1:X0=p;
    p=1;
    }
     P0          | P1                ;
     STR X2,[X0] | LDR X4,[X1]       ;
     DMB OSHST   |                   ;
     STR X3,[X1] | EOR X5,X4,X4      ;
                 | LDR X6,[X0,X5]    ;
    exists (1:X4=1 /\ 1:X6=1)
    
    The model puts both PEs in one Inner Shareable domain, so it does
    not separate ISH from OSH. OSH reaches the GIC whichever domain it
    is in: DDI0487 B2.10.1.1 says Outer Shareable "applies across both
    the Inner Shareable and the Outer Shareable shareability domains".
    
    The register publishes (GITS_BASER, GITS_CTLR, GICR_VPROPBASER) are
    the writel() case: the same DMB OSHST ahead of a Device write.

 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index de1f1b1f26623..badc3843d90ca 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -234,6 +234,9 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 	if (ret)
 		return NULL;
 
+	/* Order the zeroing before any store that exposes the page to the GIC */
+	dma_wmb();
+
 	return page;
 }
 
-- 
2.47.3

