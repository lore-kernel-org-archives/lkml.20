Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9570F37647B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410136; cv=none; b=g/4zaUZaxmOcSgtKpLtIdPMClOtcyuvvYtmSUG1oLa5AaoqyeVvXnJs1v3zGNv5mugAxjM/WP8+0RyLETS32Lem/TMHKldKVPoiUtoY1Zu3SUVHMvjQZIAEFkVyKiZYSw8OE03nlkYUOgEAEaj+jK2qvJpzLwMQholHA6MQvDmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410136; c=relaxed/simple;
	bh=NLC2QIUzt+qhz7otktUSqYZ4ASAjZabeK/4gxWnvzW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=quOU8OeV3RE8LQ3qd1GXhaJZgUXN4ovclJiPmPOcW2RSd8yOSaZxeRvfn/t03IDdnVJTPI3pKfS58H0WwfE/lqlmL7DQalIfNCjFP5MgKAs+Q2OGEslbYAxHokao9EHpk9Itoo8IkHbag3/nZXtP7V33+QW00wSR8wLIygLT5j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYfSCFNv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYfSCFNv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0778DC2BCB9;
	Wed,  7 Oct 2026 21:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791410136;
	bh=NLC2QIUzt+qhz7otktUSqYZ4ASAjZabeK/4gxWnvzW8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=qYfSCFNvtjLOgWVLTbeQxM4/i3wFLl2umQ2ZqgnZWwHoLHLQKI3lcLtQh2mIlQKoN
	 oTohF24r79qoVI8iaIf4QLqdKche1gr9QUI6k+GzPazdVOMC0WxY1+ToNF0c8HAKvs
	 nhVzNUmwiqd2exckMTH2GORSXxYra928rEksphLZ6DnQL21vjlJYKju6HNym6RbiXe
	 +6Aku001AfkGfwe6QnRX1PWHLd7hgDHy1pB7gCINIpqM5uSQHVCbyaNqbYxBmiWE37
	 lkKqRZVMSwTehWPGWwd/0rzxbHPgYwAs9E+mAS06r3DtPGiHEOlBQmgZJRLgChbQLD
	 dTG19IoEn7i3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4936CA6002;
	Wed,  7 Oct 2026 21:55:35 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Thu, 08 Oct 2026 00:55:29 +0300
Subject: [PATCH] irqchip/meson-gpio: Allow the GPIO interrupts to wake the
 system
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv>
X-B4-Tracking: v=1; b=H4sIANG/xmoC/x3MQQqAIBBA0avIrBswo4iuEi3GGmuIVBQqiO6et
 HyL/x/InIQzDOqBxKdkCb6grhTMG/mVUZZiMNp0tdY9HpyDxzVKwIt2RtdYR421hluCUsXETu7
 /OE7v+wFOugp4YQAAAA==
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=HcsigEkp72ihfLJvHs4V//Nip0TbJcUATNxrvhUqbWw=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFnH9l+apeY931DihQ7Xu415qeIblhlLWrwI2dnDb/OFV
 UZe+F98RykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZhIVArDf4fUj2pHdd156xuD
 Lyq5Xqv+lalXu0faTC08KDis/PbiRwx/Rc+5bVc/wa3b29O2wi5/hVP/afYFC+K+ZN3uvCgSOiG
 BHQA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

meson_gpio_irq_chip has neither .irq_set_wake nor IRQCHIP_SKIP_SET_WAKE,
so enable_irq_wake() fails with -ENXIO for every interrupt routed through
it. Such an interrupt cannot wake the system from suspend.

Set IRQCHIP_SKIP_SET_WAKE, like the other hierarchical irqchips with a
GIC parent. The GIC sets the same flag, so irq_chip_set_wake_parent()
would end there anyway.

Tested on ODROID-HC4 with the PCF8563 alarm interrupt routed through this
controller: the alarm wakes the board from s2idle 4/4, and 0/1 without
this change.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/irqchip/irq-meson-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 91a9c337fe6d..e0329ef5e4a2 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -538,7 +538,7 @@ static struct irq_chip meson_gpio_irq_chip = {
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 #endif
-	.flags			= IRQCHIP_SET_TYPE_MASKED,
+	.flags			= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_SKIP_SET_WAKE,
 };
 
 static int meson_gpio_irq_domain_translate(struct irq_domain *domain,

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-meson-gpio-wake-f3bfa3bb2e5a

Best regards,
-- 
Igor Velkov <iav@iav.lv>


