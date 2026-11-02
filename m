Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634353;
	b=gQ8LGziBAOcrJ3BXh1jjzN14fwgTTcCD8s5i/wlAv7OBLXKg+QaMYCOPj8eUdXnbnSQ3
	 xDggOOgBv348p7Plny1F0DOtLlFwAt0J1i2Kb8YwHwgfBzsIZMeqHPeOyQn81mRm89awN
	 nXoF3XEpKufpmG3/Hh85hnfAjPDURiDOyshq1AvMWzsG0baMmgR1o1MlB9RR0kDhYl3SK
	 +2qgxLyiaVPC+vjrUjsuvaDGcexJEaZVouDJNSjgONJWUl/0R15MHKOMis0mokUHg23UM
	 tCTDtlXq2skiWGjPc5GjRfJbbnlUvmgCjBGBd/Zrqjewz8tZZ7ijfJn4r5OeHLSe2Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634353;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0lUl5CQLJCBCailzea4Gh1ucvNlPOHHb/3kbxfLuQp8=;
	b=i4ktPIU8EPlg/BzEvTkYzouzE/Ss0C2gKEbuqZhoQEHmnJLbkHwSWMT+MBjDQWb+vsao
	 25sR9uYJ+GNJa27rQON9MLRXC540oMauZmgqDVys58hPXsgh/s/HJAUHe7v50KvWsMrd3
	 yeE9xrhqqZPW09hSmNmxf8QUcHZS62w8VlgldL84807I+cC/8q9sVJsVSyXfikz0cBxB2
	 x6eudqhhs4ZBJvDKf16cIkTEwi8Iogdr8xBTP1FhjxU/nETYFbE/aRny9nPSjCgqxbH6J
	 Sg/w2em7V4Yovkq8mqy3HhZYCxxmIBN70z6+Ap8HS5B8+KyCLLbIITXVoe/NMTGrCiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e5kX/l46";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37265606D80C;
	Mon,  2 Nov 2026 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e5kX/l46
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9CC1F00A16;
	Mon,  2 Nov 2026 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793634352;
	bh=0lUl5CQLJCBCailzea4Gh1ucvNlPOHHb/3kbxfLuQp8=;
	h=From:Date:Subject:To:Cc;
	b=e5kX/l4629FTVp7kFn7vqYpPy8tHTjApI5m0IaEjxo09lOhZNTrWcNCELQbtNG5Cz
	 lFxVKz73rpJYbGWPtqI8rJZj8xEoSCv6f3BbftJbT0j4DvM2G6betYAW1dSBLikNWP
	 ablWKowlnddHVu1dgZE4V6dzrAhJHb62RXZbj+Z6xTT87oCkKuBNyPHYHar65u0oKm
	 awYQ5GEiOsLfIO6YI4dWWFSDfDcsQEkUXUEK0h8XVz/QBR0OgEGWmVHOY33Gqh6Z60
	 DHFqch2I+p9Jv+kv1tf0TfomBhBkoKydBW6sGi1SRZAtV/KC5q3LcR4yHMgqQOxzye
	 9p7dodg8e0Jpw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Nov 2026 16:45:48 +0100
Subject: [PATCH v2] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
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
Message-Id: <20261102-topic-pdc_map_espi-v2-1-64431c8f8ac3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBREr2L+2pK2FCSuvIchpLRVvhFa+4FoC
 He34N7NJC+ZmbcAuYiO4HxYILoZCf2QQB4PYDo93B1Dmxgkl6XgUrLRBzQsWNP0OjSOAjKVW5V
 zbm1VlJCGIbobvvfTa/1jmtqHM+P2tDU6pNHHz26dxdb7K5gFE+xkVCW0kq02xcUTZa9JP43v+
 ywF1Ou6fgH+pGSDzQAAAA==
X-Change-ID: 20261022-topic-pdc_map_espi-43d4300dd856
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Stephen Boyd <swboyd@chromium.org>, Marc Zyngier <maz@kernel.org>, 
 Lina Iyer <ilina@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793634350; l=2384;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=pWIIJfUJjWTfXyMQFjC9odAbSUyZBlAoX0S+RKTLCZo=;
 b=HdFgORl59I+IEyxeCUQ1TSlkHiaXQt0F4PC5szI6YmyZIJlSXKuqof87Q1IcDVdKPpyaqZDu5
 rcMP8nAh75XD+qjA5EY5o3QwTyz0n7UNCl3WL/ORWyPWEJYbZpgrm79
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The qcom,pdc-ranges property maps GIC interrupts to PDC output pins.
That data is then subsequently used by irq_domain to resolve into the
interrupt parent (which again, is always GIC).

The code that handles this hardcodes parent_fwspec.param[0] = 0
(GIC_SPI). Make that conditional to prevent this warning at boot:

GICv3: SPI 4115 out of range (use ESPI?)

Fixes: 81ef8bf88065 ("irqchip/qcom-pdc: Add irqdomain for wakeup capable GPIOs")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Drop the arm-specific header, replace with an 4096 literal
- Link to v1: https://patch.msgid.link/20261022-topic-pdc_map_espi-v1-1-7c481a42bac5@oss.qualcomm.com

To: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>
To: Stephen Boyd <swboyd@chromium.org>
To: Lina Iyer <ilina@codeaurora.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/irqchip/qcom-pdc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 29025a212ece..6c2a2d13629c 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 
 #define PDC_MAX_IRQS			256
 #define IRQ_ENABLE_BANK_MAX		BITS_TO_BYTES(PDC_MAX_IRQS)
@@ -597,8 +598,14 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 
 	parent_fwspec.fwnode      = domain->parent->fwnode;
 	parent_fwspec.param_count = 3;
-	parent_fwspec.param[0]    = 0;
-	parent_fwspec.param[1]    = pin_to_hwirq(region, hwirq);
+	/* GIC ESPIs start at 4096 */
+	if (pin_to_hwirq(region, hwirq) >= 4096) {
+		parent_fwspec.param[0] = GIC_ESPI;
+		parent_fwspec.param[1] = pin_to_hwirq(region, hwirq) - 4096;
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

