Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814513;
	b=j+hYzi9WAzYHtQ1HFfxXlYkuriO1ds/t6KkbvhtJph8y0a0SL4f1jeKXszmf8kVWUBBy
	 XWq6ijssSFxlMzyyS5I08ruFAUo1VifAbrYdxd3VLygNQ3T/pXFkxRplWDkNpwdj3NnR6
	 SGH7Jy83mBd5nsVL3Myk2wE1xHKHMxj8ZBxA/WRK5JB78RHgc4eErlMQfgNyuY/RFqzGQ
	 wxFVycO94KrnetXbx/ToZlS0aB+GF1ob6GlaWrCpYMc6Bn3ViKnLDHdjWbWEtLRUjYVPT
	 CSDY2UG2iEw9BQc5vsQidbCVAiFkItbo7B6HTpgwDtE1r0KOVUQj7cC7PJCrJl+lvJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814513;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=4db3TAYZrLFjZxxwxODyZlvyyYvYf9/5/RO3Ou953XQ=;
	b=YJVGU1pN6HqQaoSrK9cpRE9w3l9kCQwPz9cmDYZ/fVzp2WcRbR972vu0R3HlsnMS4oGH
	 cvQhwsjOZpKgMHruOCg+zx+5wn4cfVwtfTymhd6L1rfmUQbodjKFeXfO28Nti66TLvVVS
	 ZawFqWlLXx/+3cTmSjWpQcmflF2DrOLChvu0HKlidRkwLSt7hmZNu3+tFTQHPvQJiy4Cf
	 +E6XkpSm5dXjvT5Sn6lRTgKbYnC1BbN3e+LHutjmfMimURpZ5mFFRoCb0odIxr3btouSm
	 N2XyNA2NzZtliBLkGAPuXd7dEiEbdsilnhyFCFopkPHqOFTusPhnTMhJbFOMW4bNEQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FWtVy0s5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DECA6082BDC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DECA6082BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FWtVy0s5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A14B01BB2;
	Wed,  4 Nov 2026 09:48:29 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B2FB3F673;
	Wed,  4 Nov 2026 09:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793814512; bh=wwoj6e9SZ5tH3Hot4vOKxZhdLcE0F24IRGtuBeTvcps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FWtVy0s5v+Ef9yrygsYgBcwMQ+o0vvB3O5uN1pBPtCJ1dZarJ+oqIK4gtaTYr9ggF
	 vObRE+SjFBuapeo1Qaz3owt78nI2u+qnJ1AkMxS7Jk0URzbx9VvqOtSrCnec3WaFws
	 KuHKwCSiJjov5+w/5JEzQukRKHhu951eIU/QBoOE=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 04 Nov 2026 17:48:01 +0000
Subject: [PATCH v2 07/10] irqchip/gic-v5: Use firmware node name in ITS
 warning
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
Message-Id: <20261104-host_gicv5_fixes-v2-7-e47ad20ea3c8@arm.com>
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

The common ITS initialiser can be called with an ACPI firmware node.
If firmware leaves the ITS enabled, the warning dereferences the DT
node pointer, which is NULL on that path.

Use the firmware node name for the warning and drop the DT-only pointer.

Fixes: a97efa5ba5946 ("irqchip/gic-v5: Add ACPI ITS probing")
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index c5d057f713134..8628de326f28d 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1109,7 +1109,6 @@ static int gicv5_its_init_domain(struct gicv5_its_chip_data *its, struct irq_dom
 static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_handle *handle,
 				       struct irq_domain *parent_domain, bool noncoherent)
 {
-	struct device_node *np = to_of_node(handle);
 	struct gicv5_its_chip_data *its_node;
 	u32 cr0, cr1;
 	bool enabled;
@@ -1129,7 +1128,8 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 
 	cr0 = its_readl_relaxed(its_node, GICV5_ITS_CR0);
 	enabled = FIELD_GET(GICV5_ITS_CR0_ITSEN, cr0);
-	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n", np->full_name)) {
+	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n",
+		 fwnode_get_name(handle))) {
 		ret = gicv5_its_disable(its_node);
 		if (ret)
 			goto out_free_node;

-- 
2.34.1

