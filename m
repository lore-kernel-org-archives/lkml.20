Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626443;
	b=dmWv6pCJIO6vje/HWNZDczYVgRY81GZoLjhQbGbQpUg6xOVhcnGtTJAOFFq4M0pkoJ5o
	 2qx2oX8O6Wh9e6YQtFgxlji47qaSfpskT5wwkOWBjiJ4XlMMHnOmzMeYyegA88HH2ryU/
	 RbH2hnPliX1gNG+OYp1d9eePBhH2ZN8qaEjyPUwQUXIbWR191/VHejhmuMQtBomI7aUZM
	 JSaBIrAw8Gg85OM8eNsRB5K0oD4yEsiWEisuhAZKNFSJNnslvuoNrneiC7wCP5FLRbE0Y
	 +m5mKQVEvLq9kM8EFiI0saVgKQ2xonZqmhyOppzTB5L0LMuSlSY3JG/4a7YZyf/x3UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626443;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=gpaAuh2fOXwrcHbmDYDRiGqkaVYt/5u6+l0Qi75BqpM=;
	b=gov2O2leXxpDxFHy9ypRcC/eKCFNR4joIluS4hRJkEHzgkuh9uBBoyXAVTRhQYS3amUR
	 NJkIxDBdSnwk048ns2Ash9x3ejkNzG/kT1hBXpXLaXUGYHNAApmq1ka22UCFtSCWYbRXB
	 Jy1aDsGAVaUtmdxeZjFjs5+NFeWY4rbGg7lqV1AqOjK9xDLMAJ+ZW4J6YSPD3GIRpLCM7
	 UDv76Wqs1A/CEa4crfmNvWYYjMTV3VCVp/evSkFZe6SCFS55JjXvFp1xjawCjgwSMxJde
	 VQ9jVKujpSw2mznyuU5GAE5LJF0ThK7aVhK1/xRkXEPTAuafkHye6E327ny7Rv25AOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N1s297oY;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A42606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A42606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N1s297oY
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4056C293B;
	Mon,  2 Nov 2026 05:33:58 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EC473F632;
	Mon,  2 Nov 2026 05:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793626441; bh=cwIKq7uEVGikrcixQ23Qo9duokZSRm0jxI8WtgrhzLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N1s297oYlTqGLGTfiY+OEttSaJb0UdhNK724z3zOzGIDP3XapPLeJNX76ebo7epCX
	 q4AXggsPllUCzTtN6LHh+PaQtM5l/Xc75WXZN3tORVXVW3l1hFZUgg7luce2jprP5l
	 r5Sz2/j6R2vUonu4aZ8o0kCrUoYUjQRi72XqRZ2U=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Mon, 02 Nov 2026 13:32:55 +0000
Subject: [PATCH 02/10] irqchip/gic-v5: Only set IRS DPS when 1ofN routing
 is supported
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
Message-Id: <20261102-host_gicv5_fixes-v1-2-743b61626fc5@arm.com>
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

IRS_PE_CR0.DPS is RES0 when the IRS does not support 1ofN routing.
Read the capability from IRS_IDR0 and skip programming DPS on systems
without support for 1ofN routing, rather than blindly writing it.

Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-irs.c   | 14 +++++++++-----
 include/linux/irqchip/arm-gic-v5.h |  1 +
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 9d60f474aa4f6..4edf787f3f97f 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -541,12 +541,15 @@ int gicv5_irs_register_cpu(int cpuid)
 		return -ENXIO;
 	}
 
-	cr0 = FIELD_PREP(GICV5_IRS_PE_CR0_DPS, 0x1);
-	irs_writel_relaxed(irs_data, cr0, GICV5_IRS_PE_CR0);
+	/* IRS_PE_CR0.DPS is RES0 when 1ofN routing is unsupported. */
+	if (gicv5_global_data.one_of_n) {
+		cr0 = FIELD_PREP(GICV5_IRS_PE_CR0_DPS, 0x1);
+		irs_writel_relaxed(irs_data, cr0, GICV5_IRS_PE_CR0);
 
-	ret = gicv5_irs_wait_for_pe_cr0(irs_data);
-	if (ret)
-		return ret;
+		ret = gicv5_irs_wait_for_pe_cr0(irs_data);
+		if (ret)
+			return ret;
+	}
 
 	pr_debug("CPU %d enabled PE IAFFID 0x%x\n", cpuid, iaffid);
 
@@ -725,6 +728,7 @@ static int __init gicv5_irs_init(struct gicv5_irs_chip_data *irs_data)
 	if (list_empty(&irs_nodes)) {
 		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR0);
 		gicv5_global_data.virt_capable = !!FIELD_GET(GICV5_IRS_IDR0_VIRT, idr);
+		gicv5_global_data.one_of_n = !!FIELD_GET(GICV5_IRS_IDR0_ONE_N, idr);
 
 		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
 		irs_setup_pri_bits(idr);
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
index 299e75bc95255..34e22e7d4a4c7 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -532,6 +532,7 @@ struct gicv5_chip_data {
 	u8			cpuif_id_bits;
 	u8			irs_pri_bits;
 	bool			virt_capable;
+	bool			one_of_n;
 	struct {
 		__le64 *l1ist_addr;
 		u32 l2_size;

-- 
2.34.1

