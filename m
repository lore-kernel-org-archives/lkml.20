Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857386;
	b=lT9/+SRoSlCJroBF+5HL3S/I9dxgSW/PP3aPHwa9twJjH7Wm+8KLv2J3OYseX6kNq+7G
	 8welU0KXRfuhnHMyck+PvuvGt2Mz2OEGihfTArURenTd2bAKKRedrEMQDEu749kVb/5wu
	 Q/OyBaHIxPrDbJThs1oNOTxUx19gnIf4F1Yr7szATasU22/H+hSsOcE7kvkN3dO8G1TIM
	 FAfcQXb6m8hHSdUFBtR/vjrGlh7VYVr6XmpPR8xwdj9ddsDQkv6J3fL+IExZ/08epIjfZ
	 S5qPGNLdDHcVqmSqnpiLlK2qRItBj3iF2Ywh5zRL7v8w7Uzy9kOcpa5EDcpidp8SiAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857386;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KjKvUvAawCFU3bWit+XhkHzMO764c02htnZw5tUtqR4=;
	b=bDW644BtU/OIGp8jim9urP6nVnxJ8zzBq1h678ork4UrQj8+3Wwf5x0bV0XdOyaSR17d
	 Mis6rA88YYRnO/Svb1P9x6mUOUAKA6hDF3DJcEAjXi1wWPDUJvQMrDuK174ibLVLWM+cV
	 uDPt/yUJ2EWZGki7RuV556crM6MWnpazlImgtYBeoXd7V9Boq8f8r0jEOtl9QL/g4eVKX
	 uClj5RT60Z0hW4AbdkmwPx+62UAKMSdDpApvmAnmW5pydPnXinIuF2TtwYYo2utA5+Zb4
	 GGqp27BbAZqP0oQMTRuew4JWv1Af320WzLXse03E5yrqiLXreH6TWr0JwSwSfU9ClNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r+60sCpw;
	arc=none smtp.remote-ip=91.218.175.87
Received: from mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DA8606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4DA8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r+60sCpw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j2loqvL1J6sU3mGKb+Ta5KdRoj93Xc6W2nwaFZdNjTk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794857383; v=1; x=1795462183;
 b=r+60sCpwzus8z6EhMTEqtmvtKUYks/gaKHrkbT5gYYM0V8zdisIxM4QB31RCfUISFASsnh9z
 rVXNgNk102dJg2a8/UKwqNHyE9fb8v+pLuW3Zex2ZpYSFqNTgPO3L+66n0Rz676h+gMqFuzVqWV
 NCj8bwMurf2OBh9ZJi/4nw4s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a0ec9ac2fa47d2e1;
	Mon, 16 Nov 2026 19:29:43 +0000
X-Mizu-Trace-ID: a0ec9ac2fa47d2e1
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
Subject: [PATCH v2 4/5] irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
Date: Mon, 16 Nov 2026 19:29:32 +0000
Message-ID: <20261116192933.3266502-5-fuad.tabba@linux.dev>
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

Commit b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a
non-trusted hypervisor") moved sub-page ITTs from kzalloc_node() to a
genpool. The pages added to the pool are zeroed, but an ITT freed back
to it goes to the next device as the previous one left it. MAPD is then
UNPREDICTABLE: "When V == 1, the specified ITT does not contain all
zeros" (IHI 0069H.b, 5.3.10).

Zero every ITT that comes from the pool.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 5756ffe4ec13e..33aa8a355ec65 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -270,8 +270,10 @@ static void *itt_alloc_pool(int node, int size)
 
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

