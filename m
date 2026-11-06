Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957202;
	b=0OyB90hlVL6wIqyQIhqh4ZsSIrx26fweqsvOV8nTjGZc21H+m2N19RKEirykxJIRQTdB
	 0BjBHgaHxADaRnrloz1OYKRQiaUWXR9GZxcopIefSrsd/4iEaipqC8wD012Hjenj4b1yV
	 cPb5fBF9S6HzB/Z3I59HjPEGVkBJuldO7IH6PLiH+W70t74LTY/EU2GX9ack+eb4hDbER
	 JdNNy4JIvriyazNzyg1cQgcqBn3HPfsDKo8HqN4UZ+M2V59PPbnaB3gGvcjXegj7Pc3CN
	 zZRTc7ZDDRhv9S/cL5LkxGGbIL2IOyGKWGSlDMNrOZCPhGpJR4mg1KE3IzmLWI5z0Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957202;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NXsN+Nc9LKkQyfTr7a6I9Wtbd+7FU/tueUh4Tb5MxuY=;
	b=wA3J7HG1FVjA8oqopIixsohoQK8w1oKzn/AsecAd1udQF1do8gl33PtRoDJfigr+b7ld
	 iHWL5MX4IgZ0xgIuRItAZ4oiWwqYXEEkI7dWUF3Oi1oMbi7v2isp+7DsmvwXqvMJWaqAe
	 XLBLBGGPP8gCcrABuUuq47Xlo3DHDZ6A7PyxmvXFhsC0IWQ9qN6dAnBFzaA+kSVzqkofi
	 nUHjkV/tCTsPWLqUHvXiadc4M/JvEKUsEAFnIiXG5ADgzRaKdGibnotVs6T8/6R4DBqZa
	 7uL6pL2ZkKvPKhbXGERweInooum5rh0hPso6ivWrY28CjPMkAf1eXpMxgwkyjc/kE1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="i3/tDBnl";
	arc=none smtp.remote-ip=95.215.58.240
Received: from mta1.migadu.com (out-240.mta1.migadu.com [95.215.58.240])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFFA606D803
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFFA606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i3/tDBnl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=33+ek2IPCN0Ato3CURA0jrCZQOA/qb2gBvVhEO3MB8E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793957199; v=1; x=1794561999;
 b=i3/tDBnlGNxNPWwu5rd8XpQQwRAE6Sk3vxGISe//z8j4dZZXbGhBHySVUUJaHrx3LV0T2O6d
 ZLVns5Th1Bb39N3qE9CWneNRCn7oM1XYHHubjuWknV75eH1oMcjnBG3eHfy7AScEB1GFjy9al6P
 TIG0UoRhcI/S3IaMzuEK5gpw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cf7aeb392c53fa65;
	Fri, 06 Nov 2026 09:26:38 +0000
X-Mizu-Trace-ID: cf7aeb392c53fa65
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
Subject: [PATCH 2/3] irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
Date: Fri,  6 Nov 2026 09:26:24 +0000
Message-ID: <20261106092625.3977163-3-fuad.tabba@linux.dev>
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

Commit b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a
non-trusted hypervisor") moved sub-page ITTs from kzalloc_node() to a
genpool. The pages added to the pool are zeroed, but an ITT freed back
to it goes to the next device as the previous one left it. MAPD is then
UNPREDICTABLE: "When V == 1, the specified ITT does not contain all
zeros" (IHI 0069H.b, 5.3.10).

Zero the ITT when it comes from the pool.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 5613c52adf88e..5c3ab9d30f6af 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -267,8 +267,10 @@ static void *itt_alloc_pool(int node, int size)
 
 	do {
 		addr = gen_pool_alloc(itt_pool, size);
-		if (addr)
+		if (addr) {
+			memset((void *)addr, 0, size);
 			break;
+		}
 
 		page = its_alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
 		if (!page)
-- 
2.47.3

