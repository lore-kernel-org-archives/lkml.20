Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814517;
	b=KZDj8LwUAWycu41wh0CsGeKI1PgUhn1gqCRJPls5GImQ9xO+Wc5/1AcijGK+bwUE5Vru
	 YQ4NVD+OnZIJLeUX5GIQrHLMUdKyqh/+EYukkMU2fGzHsZbO14P2O9FTvV/PM1CpXuQ1V
	 hsiyEjJlCZqPMMAeu0qcQO6N/rL3IF5poT73i7rse57Kzpa1K1+9tvNlTz0wLV6llaByW
	 fc0/Xbe3AOUypvLjsho7PolI6/STLWqyUnholrx99X6zbFeRMKUG3+ylytczqaXWkuaDc
	 xD+O/DQM2q95dPDhYGJfXCfyrLmG9/3GiVpsxOw/yV8i+Dh2bXlGOMhM+Hmh9MJ/i3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814517;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=+nqxLnunkD+W7y8PwJCbzFzrKYsNzLwDLLWVvZu3tI0=;
	b=Ov5BTMmcXdgWMIzZnz3AtYWse+zDXpqEhQtppgXSy5lyv0nYBGeYx7mFxdBdlTnF0RR7
	 EgkddBTgE0IAkOlmivYBzbc2PyP57Le/iaFlASFbitotKHbOGV1MGEbkwjeTgwyF4j78t
	 r/7rJG6Z7S/h2mFtAeLseU+4wLaC+zty6kWPREwnshAFOjdLGEz2wQNK2plPoWnkZA/qN
	 9nbrXz1RgTGlwPT8ctQvUPA/PXuYMZ/NzNHgvFj6IO5JbqtOBlZ/gWAw0jGwWk3rudMbB
	 lAki0JaRzI/WC6QaiBeYVG0Nt+HjjVnJJzBZtSQyKkY8tyr/bsbn1/Kw/yA+9mCMfnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W8gctpxQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CD66083607
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CD66083607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W8gctpxQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D531F1BB2;
	Wed,  4 Nov 2026 09:48:32 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BFA13F673;
	Wed,  4 Nov 2026 09:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793814515; bh=Yfm8aqG7wkiGaNfDQlOqhwrvFMRVy3XZyB6DejKX+y0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W8gctpxQo6TNeVUz3GI3xE9Dxj98600XXbTwm6TkbbBGmKuaaRYeK4z3xq15kEom1
	 JKpHAAjYvISd1FSPySimJWERj31GCd0MS809eawC0CjYxj5hHJXDENZSka2NOsQOD0
	 o8z/pDExYvHbSm1e1YvwaPHmrAGcr+Ybp0IlmziE=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 04 Nov 2026 17:48:03 +0000
Subject: [PATCH v2 09/10] irqchip/gic-v5: Clean the allocated linear device
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
Message-Id: <20261104-host_gicv5_fixes-v2-9-e47ad20ea3c8@arm.com>
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

When the linear device table exceeds the kmalloc limit, the driver
caps the DeviceID width before allocation but keeps the original size
for cache maintenance. On a noncoherent ITS, this cleans beyond the
allocated table.

Recalculate the size after capping the DeviceID width.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 4de07bbdc4923..aebab9f306476 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -594,14 +594,14 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
 	 * kmalloc limits so that the system can chug along with a linear
 	 * device table.
 	 */
-	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
-	if (sz > KMALLOC_MAX_SIZE) {
-		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE/sizeof(*devtab));
+	if (BIT_ULL(device_id_bits) * sizeof(*devtab) > KMALLOC_MAX_SIZE) {
+		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE / sizeof(*devtab));
 
 		pr_warn("Limiting device ID bits from %u to %u\n",
 			device_id_bits, device_id_cap);
 		device_id_bits = device_id_cap;
 	}
+	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
 
 	devtab = kcalloc(BIT(device_id_bits), sizeof(*devtab), GFP_KERNEL);
 	if (!devtab)

-- 
2.34.1

