Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857385;
	b=ZLN0+2rH565jlVweSvoUG5tQCJK2iRKXIz0ORjVUi+XZN5YEdnsniQvZ1tupscuLMaUL
	 18so/qNGwgMMtvCeal8U7Qfgl5cFDFQHrJTsHxiQ3s0GCWbMbQSllsUG7jGi3ghbvuwGk
	 GJYU02VKj2x2gRMdIctQGfU33uMaUC2xxzz7ZNikfbesOszYIF0I/VnKndntMJNAEdow4
	 cUbDNvFfaEDELmQVukgyvvG2Qhxik1hALe8cQZbAsCNjdsoqzkQ33SLOeXnuKWOPmlgMn
	 wZWiupS3MZD+I/JdG44fNEWNHO6GTBQ+IsiVdC946NmJ1MV7UdXiLk7l9deDjAd9Qsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857385;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iVKkn1Qt8urtg33+T4CbLHRgvt5i2katmTYO4GRbEMI=;
	b=pQvzpIFMhUQyNUaVZfe0PZA1d5azJq+4sGaege1BGaVekYyk5WdpYxUzwocI9fl3ziMR
	 cpvRS374TP2k3OnttDuLLKcpcZKeT6oyfXEfMYQUVQ24ufee6jl5+cWj85uR+KQ8kaR9Q
	 hAuVWQAi90z5GsXvVHizNWxTUWqZ05uN0VTSbRF4YjwJ3fA5YZV6ryXU3zpJk8H2I9+ac
	 Fjio0bGN85poyzQ1XQ7rGH+T3BEzwcLEijJC2qHE6Tg3EBRYSkDA/e23Kqb07gRaiSRGH
	 M/wkPFAqCoUFkH6wi5X4/wMFA5GkQJmoY61186nOts6h2YnlXmFJMrhWutC64Slvs9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sG2gNghc;
	arc=none smtp.remote-ip=95.215.58.18
Received: from mta1.migadu.com (out-18.mta1.migadu.com [95.215.58.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60679606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60679606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sG2gNghc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=useyEi6UOp4DdWiLFMZSoaOzTXlnpBXCpm7MiCMNcks=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794857382; v=1; x=1795462182;
 b=sG2gNghcqYoamWMfqVPcAkViwmPQmlMA2sb//9qfN7XWtwg7ez8IiAwX2RQKoJza01MmysUG
 3oJcIHfOp4zKVsBig8VNBA0KocB/DQO27+J9RfHc7tet8n3VwPY1beYKmQ+jdxROj1BWAXu20K6
 T/l4pLW5BFqFdQfK3mPi6gH0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ef3350f581aa456f;
	Mon, 16 Nov 2026 19:29:42 +0000
X-Mizu-Trace-ID: ef3350f581aa456f
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
Subject: [PATCH v2 3/5] irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
Date: Mon, 16 Nov 2026 19:29:31 +0000
Message-ID: <20261116192933.3266502-4-fuad.tabba@linux.dev>
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

Commit e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
dropped the ALIGN() of the ITT address in MAPD, on the premise that the
ITT pool returns 256-byte aligned blocks. However, the pool's minimum
allocation order is get_order(ITS_ITT_ALIGN), which is 0, so its
granule is a single byte. An ITT whose size is not a multiple of 256
leaves the next device's ITT misaligned. MAPD drops the low bits of its
address, so that device's ITEs land on the previous device's ITT.
QEMU's emulated ITS has 12-byte ITEs, so two devices with 32 vectors
each are enough to hit it.

Create the pool with a granule of ITS_ITT_ALIGN.

Fixes: e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 6932dd0a02c42..5756ffe4ec13e 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5854,7 +5854,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
 	bool has_v4_1 = false;
 	int err;
 
-	itt_pool = gen_pool_create(get_order(ITS_ITT_ALIGN), -1);
+	itt_pool = gen_pool_create(ilog2(ITS_ITT_ALIGN), -1);
 	if (!itt_pool)
 		return -ENOMEM;
 
-- 
2.47.3

