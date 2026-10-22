Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658665;
	b=Zd7APd0MehG9QfwZnJ2FFRHUn/ebenrRaAZq4VQyGM0v0eAvcF/OXr8vtnU+UwF5sXhA
	 cQGtmdShF5+W139u3Yv3ut/3Ddl89uKKkFCcMlHz28p0op6mrR4rnHhr4zb9K2/CHm13/
	 RddJgoRL55Zv+sPZeqGfBO6r99Il6gQgqO50rQ9nkqD3t9r7EXjJQEBsEbXAPVbbTJdTM
	 q908U+VLFb+lpEbccRcfbIEFQ/97+YcQ++3ouA6H8tAndR/IFO5y9Q/PJR3XKGtbVBQ57
	 mKUMER24S0L9hJJBcVz/bHXjJvMEqqPCECX5p+ZprVDIfJ62oJNWAqr9lXxU4XJrIcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658665;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4D0rJHqRh/8AKwxOHlD/axx4zgHO0+ep+YacbjEkTGs=;
	b=cU7mUjTF6CFUdKE1s1WQ8HaTlc9jFHY1Ij44TGXrEt3YjsIzHJwbuNTy+GBbGrT47p1r
	 hgv/wrlJkYXRJOCatPcXSF/9R4ibzglXsjH2HhbYlQVOuoZv3BVAI4Ooj8axzutb/VClz
	 MlSvB2OnDZvtiqXKjqCL8c7LC9iDctRUIhJyGHXqWBOtd9N2jC92mM6Kjf4b/Z4KFH3zv
	 mTK03ThR+3RtO7mfICY1auupQpUvt3rBYKTkjTGUvkor/PBb8YlbFcHnbxNQ/pCqJwNCl
	 L1iS2DiLnIa3fspX+EG0m18cxu7XMvf1+BlD8M/FSQIMi+wGyIMvPs+PdS+RJLtg7eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/JIqzv7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC246606A319;
	Thu, 22 Oct 2026 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/JIqzv7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBEE1F000C1;
	Thu, 22 Oct 2026 08:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792658664;
	bh=4D0rJHqRh/8AKwxOHlD/axx4zgHO0+ep+YacbjEkTGs=;
	h=From:Date:Subject:To:Cc;
	b=H/JIqzv7+kmqbSZvX22m8YEdAh6qzL+PaKtQ0+9YbjorYlyvXIspDI8Os/Vvnjl9q
	 e3zkxPCcxf7J96Z2GXMfSttpQzfr5jESj3SXrWlcA1U1xnEk8Nc+0h6sZMxkO/kpSk
	 GiOe2Hbqkm3LL/GWZg0mDhV8yl2f5TJ0PDU9zEOBZ6WucsHabG97xsKXphCIlE903s
	 GypxQnSjN948mxsxVAP348lW8CoC9/02MBtQEi1nagBn/kBG0nhFsrAcvw1fjQhPnh
	 /EUdmjAZGr04b0IsrGIUarZxOlBID/GMpFFA5uVreUVq9QIab//a4yMmmu5v5sRh2H
	 yozhiZ4W6h2aw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 22 Oct 2026 10:44:02 +0200
Subject: [PATCH] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
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
Message-Id: <20261022-topic-pdc_map_espi-v1-1-7c481a42bac5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1hZqdUS8iog4TUYjqKHRYUC8+
 1RdvsX/BygFJoU6OSDQl5XXJSJLE/BjvwxkGKPBWVdm1jmzrcLeCPpu7qUjFTZFjkVuLWL1KiG
 GEujDv3vatI91f0/kt+sE5/kHKOkutXYAAAA=
X-Change-ID: 20261022-topic-pdc_map_espi-43d4300dd856
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Stephen Boyd <swboyd@chromium.org>, Marc Zyngier <maz@kernel.org>, 
 Lina Iyer <ilina@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792658662; l=2155;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=EUD3WqUHZTgz9OzY3594TzoRv+NP0oCm8r97bGUg0+E=;
 b=MGVSWM+DLFxT1bMRvgkyPSLsALY26JnPMfu3jrU0us6zcGputJ4ixQDI8s+Hth5X8mk8T185T
 7pK/x1/0zSfAE95yOYrTimL3ADjz8XsXvXLzumLj5Prq3ZkeKSOHkFz
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The qcom,pdc-ranges property maps GIC interrupts to PDC output pins.
That data is then subsequently used by irq_domain to resolve into the
interrupt parent (which again, is always GIC).

The code that handles this hardcodes parent_fwspec.param[0] = 0
(GIC_SPI). Make that conditional to prevent this warning at boot:

GICv3: SPI 4115 out of range (use ESPI?)"

Fixes: 81ef8bf88065 ("irqchip/qcom-pdc: Add irqdomain for wakeup capable GPIOs")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 29025a212ece..bf4951dfa0a6 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/arm-gic-v3.h>
 #include <linux/irqdomain.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -21,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 
 #define PDC_MAX_IRQS			256
 #define IRQ_ENABLE_BANK_MAX		BITS_TO_BYTES(PDC_MAX_IRQS)
@@ -597,8 +599,13 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 
 	parent_fwspec.fwnode      = domain->parent->fwnode;
 	parent_fwspec.param_count = 3;
-	parent_fwspec.param[0]    = 0;
-	parent_fwspec.param[1]    = pin_to_hwirq(region, hwirq);
+	if (pin_to_hwirq(region, hwirq) >= ESPI_BASE_INTID) {
+		parent_fwspec.param[0] = GIC_ESPI;
+		parent_fwspec.param[1] = pin_to_hwirq(region, hwirq) - ESPI_BASE_INTID;
+	} else {
+		parent_fwspec.param[0] = GIC_SPI;
+		parent_fwspec.param[1] = pin_to_hwirq(region, hwirq);
+	}
 	parent_fwspec.param[2]    = type;
 
 	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_fwspec);

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261022-topic-pdc_map_espi-43d4300dd856

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

