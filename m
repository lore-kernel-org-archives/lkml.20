Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814504;
	b=KsAzi8EWU7HG6BEdqZeeLAXeu2aCSFMnkcRkxpZ9ZL8OpALWSjJwatLkb/QCM5DSDTqb
	 kCaOx4kVCl/eCk+pF9PfcIptiCv0rZyFu6pe1I5ygWZvOmjto+syUbedExzJIKoXByCl5
	 Y1vO577TrULb+n6vkmb+JlFBqfig9oS9Pot6JS7tz6O76wuXuYYSQFkYrzDz9ScjjR8n5
	 fpTrx16b5XCMfmQIXZQjSrl4rpEeEOZXd7bqa7Ws5kdtg0AaASi/Y3b35fMu2sUAp43RL
	 4op0jMy+QN9t3Ih+/06lCaMr+PXzFhM7EMwUJagYxVw1xYMUtKpwu88xXy6CUaSRe5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814504;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=mH4Kh7etZDYgMktnm8Hf7N33NxWU3Q5SAabtWk7R9zg=;
	b=BklYZQv80rCiER94TzxXpyjC2DSS4pIFFiNnGwoS/9HQtI7qTq+80UpQaaIkx9b8tzIu
	 uVaAeEKdA7Fp7Ekw25FHVDIVhO7wkmNvjWQKrCUVADsb0YSwoQUxqW93xOAvKYTWa3ZHT
	 1Nu3TxhCbjipZosHQDVT9WJGX0WXh8ArJumF+DJBIw4m4vLiu+sGP7bsUgyjXH25TGX5r
	 RUPEkb/kbFxAJjCdCNJTEs5l59aZXiRPJ0Sfv6E/fVOHtBh5/Z/SraDCMkDp7YcIietNI
	 3Y0Y+471nj/SUrGVT0ggRZ0+XKugEiXiwTzSEiZIy4v12z+WZh87D/Zw0RXuIrbwxBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CY3C5N0i;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F995606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F995606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CY3C5N0i
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78B2D1BB0;
	Wed,  4 Nov 2026 09:48:19 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4300B3F673;
	Wed,  4 Nov 2026 09:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793814502; bh=muYRvhfARv3v3/KeY2O26NVZR0TN5+fnh0xSFjdjX4Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CY3C5N0iE/LSA+YPtP3zijzp9X/hfvcwQjPT4FJlSSRiLew83TeVKr6HpWLzGlQsL
	 uRmrxhFxkFamSZH/55vHRTRvubYCVTJpIYRnXc5h8uKUvUnfpFHU9k76wMZBjg9GK/
	 CQOvVRuReS74kb93LxkmRypHdGB0NKEmnTgaysd0=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 04 Nov 2026 17:47:55 +0000
Subject: [PATCH v2 01/10] irqchip/gic-v5: Reject SPIs not backed by an IRS
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
Message-Id: <20261104-host_gicv5_fixes-v2-1-e47ad20ea3c8@arm.com>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
In-Reply-To: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
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

It is possible to build a multi-IRS GICv5 system where there are gaps
in the global SPI range that are not backed by any IRS. In the current
incarnation, this results in dereferencing a null pointer.

Reject cases where the firmware attempts to use those SPIs during IRQ
allocation by catching the case where there is no chip_data associated
with the irq (meaning that there is no IRS to back it). Spit out a
warning about broken firmware when this is encountered as it shouldn't
be using non-existent SPIs in the first place.

Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 8c0303af71e7d..f3cce2bd28cc3 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -727,6 +727,15 @@ static int gicv5_irq_spi_domain_alloc(struct irq_domain *domain, unsigned int vi
 
 	irqd = irq_desc_get_irq_data(irq_to_desc(virq));
 	chip_data = gicv5_irs_lookup_by_spi_id(hwirq);
+	/*
+	 * The global SPI range may contain IDs not covered by any IRS, i.e., it
+	 * may have gaps, in which case there is no IRS to back the SPI. Catch
+	 * broken firmware trying to use any of those SPIs.
+	 */
+	if (!chip_data) {
+		pr_warn("Firmware bug! Unimplemented SPI (0x%lx)!\n", hwirq);
+		return -EINVAL;
+	}
 
 	irq_domain_set_info(domain, virq, hwirq, &gicv5_spi_irq_chip, chip_data,
 			    handle_fasteoi_irq, NULL, NULL);

-- 
2.34.1

