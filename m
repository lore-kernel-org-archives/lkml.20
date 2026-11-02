Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626440;
	b=HkeCx7SQJ5BxbQZMSmb504galzW82nV/GtMiZQC6bX5s+FI+l2ek/0dapzChaPSZlbzx
	 CrOoyEAxEhnIQdJWDXkvl4QZ4ordgCKkp//MWhQr/uWWfz5L2RVEAu7Z8GONtzOC1csPr
	 ZDy2pOL3ZqSQZ1RXssIeT3ZDAjv+2N99u8D415q0owqkRKSbMZ3aRRgX/veOy64yF0vzs
	 1UkLeY+7hA1kTxP+SIR909HW2vl1b+wbn+wOAGvtT8LVaGjYmSFUwPxtH0in6lUBeL7Px
	 xQ/9DzJD+OlpILNyUEVsnc6VgHEHRlJr/SY/agShuQZaBybOS9f2a4RJa+8dbDgebnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626440;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=pdXx2sQwsc/FyGiF5q/4Ot4c5kPe0svLfhw7mmVF68c=;
	b=1uWzW+t9XAwzPnBufNEZsVPrwdZDDw4MRxfPelbFQ1xomloT4zKJ7VeiPA8LvikFjf0o
	 IZ7bBuG5kzqRy2A2ihiLp5dhQFfJBZYfYN4ezKIqBuDxT3zrFq7zZwoF7viEnoR6mAA8c
	 X8m5LzBK3eNDiB6JPIasiyJ/G6NqGsO7qVXWt+egrfDcLRbSmdGRNFU+OpW3l/VaWaSMK
	 4NZk9RCW/FYa5RgVkcfS7e9pMmcQcgORAXUsj+dODuDegKWwsnCxWzl6I6xZzCzSVkvc1
	 6uc5aZ2ZWueaOmMBTQ2n+eNGWfrRE/J2ew5u8PYLnqAsYNe4ujPLlubsKeN9j9Uz4WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q3OX7KbB;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D3D606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D3D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q3OX7KbB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F3D719F0;
	Mon,  2 Nov 2026 05:33:56 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D6463F632;
	Mon,  2 Nov 2026 05:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793626439; bh=+DjkWaHm5k69JfbssIC/07x1x3OslL+cMhF9l4xETqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q3OX7KbBB5gJndWLhynSMRwIf0T1hjh62z35YC3kfvHI45fiQADqn0y6rXkmZ/lmO
	 57hHMuQmesoWK82Ig5hLfx/XrUAePkg0lbjtxvqpRIoxOE91rpUpC4EJI7YZ/apBqy
	 4IDWuZnvGLb4GZwksWeHWMw5U4Thqwfz5JXC1Hjc=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Mon, 02 Nov 2026 13:32:54 +0000
Subject: [PATCH 01/10] irqchip/gic-v5: Reject SPIs not backed by an IRS
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
Message-Id: <20261102-host_gicv5_fixes-v1-1-743b61626fc5@arm.com>
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

It is possible to build a multi-IRS GICv5 system where there are gaps
in the global SPI range that are not backed by any IRS. In the current
incarnation, this results in dereferencing a null pointer.

Reject cases where the firmware attempts to use those SPIs during IRQ
allocation by catching the case where there is no chip_data associated
with the irq (meaning that there is no IRS to back it). Spit out a
warning about broken firmware when this is encountered as it shouldn't
be using non-existent SPIs in the first place.

Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
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

