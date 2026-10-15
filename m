Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7324F4C8C72;
	Thu, 15 Oct 2026 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052459; cv=none; b=erUkHDdjrtd25vgfG4VqnhvbVSrgQA72Zc1f6+R7lYEXp2Qs3i01FtkKaCpiWT8VeOQaKiOkfCKOwoDnvt9XZgg7b8VV5ilsYdee+c/3fTfMFo6glt9Pfor+MHaj9ZacEHDJMz0VO0CkX7JtjJq3gW7J41ex27z+s8DiZ6kmSdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052459; c=relaxed/simple;
	bh=1pRVcTAZPFnh2ezwUrQpexa+VE+rZN+lQnMhd9olV1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MfG9bkXu2rrLcnR5IkkGTs2M8NjhtmPRSxA/AbeV7ZTzxlnUbMIWCzwxtmv7flmjDoLsUYFipQOzqfc/zBZ0g4z+yVQCCT8iJjloFKHmJTVGPhRMOVb2mJFd3OsLBka3GsAM/Pylxpf94LqPaKyB8NQtOx/tTVF9br60ZOheDbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NS0SiHgH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NS0SiHgH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE4A1F000C6;
	Thu, 15 Oct 2026 08:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052458;
	bh=P0uwkz2ZRN4LBCNTRakCSfnPDDZuXpCCwbG+hEciceQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NS0SiHgHpN2u2rk3uKUmA+FjafjLQyudTOfO64KSX5avtepK1MDYtY8PowYRfquWM
	 LS9ZuoT1IayNn+vd82P30F03LPX/7BsFVF4efM4oWAYWx78k64Vqph+z3sj8Ru5Stq
	 bnd9q89Kty9Ud6FPiXQD8gOwVI4m34AcdJ/bzBa4sqPwrh2W/jjhY7G8ixXhDfcD1/
	 QB0N86MdS3LOaR7kYmi9sISc8C3SeQS17/FXp49lTQviOpbhU7ItoSvoc9C7MW+JlH
	 LoqSTiRRNq9rVRAu67+I4cNZqW3eHNkK0HyQaG2bIAEcyKR7lPDqw+mV+alJfF1IFX
	 SG+d8AFlow/nQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 15 Oct 2026 10:20:26 +0200
Subject: [PATCH 2/2] irqchip/gic-v5: Fix standalone IRSes OF probe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-gicv5-irs-no-cpus-v1-2-d4b337b7f000@kernel.org>
References: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
In-Reply-To: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Rob Herring <robh@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2

An IRS is architecturally allowed to be standalone, namely, with no
direct CPUs connections. Make sure such configuration is allowed on
OF firmware by skipping "cpus" and "arm,iaffids" IRS node properties
parsing if they are not present so that the IRS configuration can
complete successfully.

Fixes: 5cb1b6dab2de ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
Please do not consider this patch before we agree on what's best
for DT bindings in patch 1, thanks.
---
 drivers/irqchip/irq-gic-v5-irs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index b3feb6340b59..53639e6f85bd 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -609,6 +609,10 @@ static int __init gicv5_irs_of_init_affinity(struct device_node *node,
 	u16 iaffid_mask = GENMASK(iaffid_bits - 1, 0);
 	int ret, i, ncpus, niaffids;
 
+	/* An IRS is architecturally allowed to have no cpus associated with it */
+	if (!of_property_present(node, "cpus") && !of_property_present(node, "arm,iaffids"))
+		return 0;
+
 	ncpus = of_count_phandle_with_args(node, "cpus", NULL);
 	if (ncpus < 0)
 		return -EINVAL;

-- 
2.53.0

