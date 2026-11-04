Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814518;
	b=lHvxqxrriO2wjr0evBSzdTcMLF0snZ1ex0U3EC01xQeObN9zO+ZCkBxmmvhwWJj/JYeE
	 ZgsPfEVj+uKkr5HjWZb2GTKaxmqXe4rJLCOaHRPF1gAbXL6sjYmJESFGsRpGQZmhOD+Eh
	 JYyfgMEJF9qqIYhY64tJCmxpZu75ZqsKnEw3gfawI4jZLZ/lfS7sJn+s8bJTuZJSV0kTz
	 U3YjXDy/htnDDHsu5fiXyY8mXJ8EVUO8lq+pLMKXYpVccEIJAM6K/QSuzOMWR7sAWUduM
	 aK7vcNgYQ9auxszH+5tzyeBWqq8qg+XiTSyxCTayBkWTlyLwVbFDULA4c0mX1/RDi8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814518;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZMmEwIPZ2s+Faw1bSTkAT60fP83UKxdaz6POccvAnVQ=;
	b=Dp2qDyUh0KCiHzw4hB2VXPaTLW+NMOeNb0V+3WEb+87EtMD2D3OjYUmCUXyy5i6aV7RZ
	 XjnXBz2nwJ0jNyWL7cWq6vRCyOQBQuxbFF8Ie4ZyndbAnp39/TrNVaQ4f3xe5ORX4yYni
	 uN2BLB/bKxgdvlWKsDRwB0PZx5BmRyx7vahCPPiwX+3gsdK3b/2HfZ/RkICHnwfaV3W06
	 qVf1pfhfUL7/cVHYpFh388Sjmg0ngg+KMEpf7ux2SY+zhrC+1YTfDrj7HEDZ6F6gxwd0R
	 DmcoIIND70TiEM63Mpdw7hp+5ZbiH/mVuhU2K/waZqLY4C6ZVjntZvaxErWO+aP5hAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ukHbPpMm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB22608361F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB22608361F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ukHbPpMm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7386C1BB0;
	Wed,  4 Nov 2026 09:48:34 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A4CF3F673;
	Wed,  4 Nov 2026 09:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793814517; bh=847936L0BKkfHn86p6Ex3FvzCRa05a6B4pBN33YkgPw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ukHbPpMmSS48XOoGNh4BsOsFB7TEJ89nm2VSr3f8kXm7ewhfThvxaKSUF0EbU9Mkb
	 ayO5GtbGo7oLGzaVGN4MhCJPz7ew4mZ9K78n+famQVEibKL3ABwRm8izSzZPeK1qhZ
	 qHiJ1+1QaJ0QR6RfJuywaWovjGYGZR0gxKT1jxO4=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 04 Nov 2026 17:48:04 +0000
Subject: [PATCH v2 10/10] irqchip/gic-v5: Release ITS MMIO region on DT
 probe failure
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
Message-Id: <20261104-host_gicv5_fixes-v2-10-e47ad20ea3c8@arm.com>
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

of_io_request_and_map() reserves the ITS configuration frame region.
If ITS initialisation fails after mapping it, the error path only
unmaps the registers and leaves the region reserved.

Keep the resource description and release the region on that path.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index aebab9f306476..101aceec68f63 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1188,6 +1188,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 static int __init gicv5_its_init(struct device_node *node)
 {
 	void __iomem *its_base;
+	struct resource res;
 	int ret, idx;
 
 	idx = of_property_match_string(node, "reg-names", "ns-config");
@@ -1196,6 +1197,11 @@ static int __init gicv5_its_init(struct device_node *node)
 		return -ENODEV;
 	}
 
+	/* Save the region to release if ITS setup fails after mapping it. */
+	ret = of_address_to_resource(node, idx, &res);
+	if (ret)
+		return ret;
+
 	its_base = of_io_request_and_map(node, idx, of_node_full_name(node));
 	if (IS_ERR(its_base)) {
 		pr_err("%pOF: unable to map GICv5 ITS_CONFIG_FRAME\n", node);
@@ -1212,6 +1218,7 @@ static int __init gicv5_its_init(struct device_node *node)
 
 out_unmap:
 	iounmap(its_base);
+	release_mem_region(res.start, resource_size(&res));
 	return ret;
 }
 

-- 
2.34.1

