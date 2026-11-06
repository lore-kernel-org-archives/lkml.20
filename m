Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957206;
	b=LMIfSTdojmCl0HzSM62KLx22DO8tScfgkzfL+xuNPMcVdngJd3y1WGZoe8gEe/Bx0k3/
	 TxQsh/vu5hbAiHC5McoGG+4VkU9PpfedIvAXqelrpLMoSVBkB3D8ytz5++SEAOSfhkDXn
	 fZnxCN9AmOgI4g8J3A8+Z7qYGOnk3fmGLSNQTdE+jtX4UFD9G39eZo2mvwL35k1Ybeg3C
	 s+k+aFUAXjdR/Ddv0PcQtxsjvxqdjEjH6VGaqP7UzYkcT3OsQ5VUdo4NNW84AquEZb5Go
	 2E8OjsSy+xIkAda5yw2f/Y0MkdkTPVPT+8c6u9AqDk8vUp4YL7CzWEM/CAFjVdvXngg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957206;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OCpCPLJE3r6L2HIy1QKUiDL1dFMxS7QTpUCfmL7TFEY=;
	b=J5g5zIkhuuBM5aYMfGdxyvdi85FqQD2PEWBLS3BDwWIRLp/mpXQxbNSRbBsYRBJC7cwi
	 YzWp/UO6wNMPSTFtMchrxheQK+MWQYWw3ToG8vSZomI+yG2/iPrICddazd5DKtB4gcuT7
	 D0uNtFP8FGayihIG0gGpe1ZezY7gza8J2VbaskN08Aoyt6WAXInJoBFcyMLzET8ExkQQM
	 84+yv7ltU5mQJa3j4cxFkYT+FeSgWdylCzbHJAqd6juA6IsllTaSGKXCy4uPW862HHlra
	 g7lJtGEwmWCKwdA3utkKMpK8xSGABgaMwHkqWQr/vgf2xcYg23z4UdNHglQNKmeAg8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j5FoTRMq;
	arc=none smtp.remote-ip=95.215.58.246
Received: from mta1.migadu.com (out-246.mta1.migadu.com [95.215.58.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE3C606D807
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE3C606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j5FoTRMq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2ux1gTofI8zz3EdkWjLHTNMHqNkCiJdZMae9TBFV5d8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793957203; v=1; x=1794562003;
 b=j5FoTRMqWfs8BiZwjp4KBhazjToi5y5m2vbjgvAP0azmQ6fgjQrvt9gObrc5DL7jZy6dO687
 /91eGcqhZ8fuHqPytHunKN7OsdhLv5QL5pNYy31+3e8yS4O/J11o72GqS/thxlvdl6yvCHZDOnj
 d6gNBfXvWxVrFC3E6QLJ6fBk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fc821fc381e2c071;
	Fri, 06 Nov 2026 09:26:43 +0000
X-Mizu-Trace-ID: fc821fc381e2c071
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] irqchip/gic-v3-its: Free the page when gen_pool_add() fails
Date: Fri,  6 Nov 2026 09:26:25 +0000
Message-ID: <20261106092625.3977163-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106092625.3977163-1-fuad.tabba@linux.dev>
References: <20261106092625.3977163-1-fuad.tabba@linux.dev>
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

When the ITT pool has no room, itt_alloc_pool() grows it by a page and
retries. gen_pool_add() fails when it cannot allocate its chunk
descriptor, but its return is ignored, so the page is leaked and the
retry allocates another page to leak, until an add succeeds or a page
allocation fails.

Free the page and fail the allocation instead.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 5c3ab9d30f6af..bdf7c81e60c76 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -276,7 +276,10 @@ static void *itt_alloc_pool(int node, int size)
 		if (!page)
 			break;
 
-		gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node);
+		if (gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node)) {
+			its_free_pages(page_address(page), 0);
+			break;
+		}
 	} while (!addr);
 
 	return (void *)addr;
-- 
2.47.3

