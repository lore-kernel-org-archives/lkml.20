Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857380;
	b=p3TJanZMg6XEVHo2Cg7oDU8KprAp3GpbBE+S5o+yaL6OfMkAO1lmo6QZNbQfhA7BnmTb
	 RM3+Xp40yvFnxMJj3mQy5JsNOlrYAiyXGQOURbn3vRO59iQilUoB3sQMHQXa/rO+cH3/p
	 FqVFaJFkDhLy2etDnnj5JY+LmWXTYOk8WxtfzjQ+AsLF7jLl0mU2sosDuITvDq1xIOHNG
	 t2A5rKuOEXhA1Cdb2nSkko3HWARSeDiJD0dytwKEqwDdICB6OcM7WMyEnbpYsfCqOLoX7
	 mbBGwN5rDtbeCrnDgkuPoaLnKeN4nU5MZc0gR/79KfSd3TfnHVGXVSpVjIcVJA5kLlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857380;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QTIqMpwFotyFgZHHMugzSk4gDQSvNljgXir96ytGub0=;
	b=cCcpegMIdgBSKRiogQA92ffBe/jK1DgksCQDQcZt8lkSI36moPxMQAiQE1BD6G4mHFyu
	 p9OWyPko50/5XQ1iECQrvGiQ56fvX3d4YGqQEh3SZA8u/LtgkS3etvhuUhe5IoNR2qt6z
	 5JdXcpMI+VrKo23XrwjBUFHWHCbOzzB97P1i1uIA+qUeVThB/VgyBvy6nE1To7/wbIwNY
	 Z9saQI7UKGeAz2KY3NyrYTK+IlbJP2tDJTiGgLajFFaxFfbsnDZaXuv/E2vhhsD8SZ4y5
	 yhUcE78nB+K3SoBbRPW3pNjp/AOk18XTYrr3k5lqjzRn1J1qwpfSYEOEg6kPrEwAyDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iUTnObBv;
	arc=none smtp.remote-ip=95.215.58.6
Received: from mta1.migadu.com (out-6.mta1.migadu.com [95.215.58.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616EF606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 616EF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iUTnObBv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UGNs4SfH68tZ5cYnkl5VUa/l3F6Z5x+yXOyIf+Qp4G8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794857377; v=1; x=1795462177;
 b=iUTnObBvLFq2YTRDxN2s1jf48dO1h8Lm9lq3IYSQx+t005LwaN80L6l1sqoWQCNXf0fiGjSC
 i3noa82c3GRIKcUq9+8HnYsYIqjILWOoIwzwjwUKNZNkvRXW7eajb2MH6E9OmhzWSYEZKQ1Mb4W
 q4PBX9l4jSc2EzAHIRUGf0Gs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 01525508edcc0384;
	Mon, 16 Nov 2026 19:29:37 +0000
X-Mizu-Trace-ID: 01525508edcc0384
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
Subject: [PATCH v2 1/5] irqchip/gic-v3-its: Order table zeroing before the GIC can see it
Date: Mon, 16 Nov 2026 19:29:29 +0000
Message-ID: <20261116192933.3266502-2-fuad.tabba@linux.dev>
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

The ITS driver allocates the ITS tables and the vPE tables as zeroed
pages. It exposes each table with a single store: a relaxed
GICR_VPROPBASER write with Valid set, the relaxed GITS_CTLR write that
enables the ITS, or a valid level-1 entry for a level-2 page.
However, on a shareable table the zeroing isn't ordered before that
store, so the GIC can read the page's previous contents as table
entries, which the spec makes UNPREDICTABLE (IHI 0069H.b 5.2.1, and
GICR_VPROPBASER.Z in 12.11.39). A level-2 page is exposed at runtime,
when the GIC may already be walking the level-1 table for other IDs.

Add a dsb(ishst) at the end of its_alloc_pages_node(), as
its_flush_cmd() does for a command. The allocator doesn't take a
shareability argument, so the barrier is unconditional. On a
non-shareable table it doesn't hurt.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f9373..9900c6a53526e 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -233,6 +233,9 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 	if (ret)
 		return NULL;
 
+	/* Order the zeroing before any store that exposes the page to the GIC */
+	dsb(ishst);
+
 	return page;
 }
 
-- 
2.47.3

