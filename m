Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626454;
	b=sB3x3XskHmKz6v6ZKEhmIKpBoVsWqCbV3tLcAmzuKIcKWYturUQCt0JgZNRwhKJd4ylr
	 NkQc4WaWpLAjsgQrY1QYU6jaMVQ4vs9j0qgkcmt8lDuO0HhLzwgXuFM5IV9xtr3Dd72QD
	 5hzg54/sL1zDZ4y1m4HmXJk5wfcFBrrI90blwHNrzrn7vX/jmS64SgpteGjrIowk9cV1j
	 Uc2JOTF46KjmEhsb2YbhhBEBAXmd2rRQyQ+JfJYAIgZZw/FB6rQiN6C07rbPssCjRUAH8
	 78KMzHPu68bCk/3EglZvHZSSh6pcoCWeyR5C0y/vf3E+q4vTN0vIGHxQdNGjDndBUiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626454;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=2SKyudsQT7hJSBIFwaZaYBFABRNCtMtBW8qSgv2VxvY=;
	b=RmY9X9EhTvhtYGo8KuDfrGKGngUtHa+qdsP9m3xr96XxEF1ae4qW3OCsVKPNi7JJ99y7
	 Vh3LZE6ZJ9fRXXR9A/imSiNQVehA5Jn7QjBDU79KjLDKPwUL6rpQh+nqgyBlE8WDTepVq
	 qmJIbM7mAHEbFclgmRHq+Cx7X8ugqk+or7JaP45MDUvEJu1nAtGXgHT2RedH4MX1vt9NC
	 tp4zEUs+YRNMEQiEULOiRXUIcOqAoS95gxctVkw0HDWxvZdNi+xKbk7NnnK/Kxlm8k7Qo
	 ibnvrmpmmjdPTdlEjRk8VE5SfRIf1x3hMNQombMl4flsIyXu4GBeZXookmhpqnvjP7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sPqrhyT8;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C321760A3807
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C321760A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sPqrhyT8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FA9719F0;
	Mon,  2 Nov 2026 05:34:10 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFA903F632;
	Mon,  2 Nov 2026 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793626453; bh=YMtFF5YusNfOp7alil9V2pUVHaqO5KLltDonqshBJFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sPqrhyT8Um/uLLVfoazVQZhlmsNWCHi2UN9yUdKM8TDB/a9qxGIDM8F8IUowx26mD
	 QjgrdovxBCAmbOMBC/YXgDCvkiHWAZ0cl1Fgcxee0QgNACxrbF06+TWn9bmhj41rAF
	 P0PnYPYW8y626/d278+0QKjXZG17hty6tFZLwxnY=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Mon, 02 Nov 2026 13:33:02 +0000
Subject: [PATCH 09/10] irqchip/gic-v5: Clean the allocated linear device
 table size
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-host_gicv5_fixes-v1-9-743b61626fc5@arm.com>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
In-Reply-To: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2

When the linear device table exceeds the kmalloc limit, the driver
caps the DeviceID width before allocation but keeps the original size
for cache maintenance. On a noncoherent ITS, this cleans beyond the
allocated table.

Recalculate the size after capping the DeviceID width.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 4de07bbdc4923..c0f3982229194 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -601,6 +601,7 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
 		pr_warn("Limiting device ID bits from %u to %u\n",
 			device_id_bits, device_id_cap);
 		device_id_bits = device_id_cap;
+		sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
 	}
 
 	devtab = kcalloc(BIT(device_id_bits), sizeof(*devtab), GFP_KERNEL);

-- 
2.34.1

