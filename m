Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ECD408600
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410137; cv=none; b=TMNlFw6nrVQvX6piKY1EhNOY8DrVrIzTBJ2hzlmwaIniawYx6SNAMSsajhbui/Q/Y1+CIXcxVUOQJ9qXDJ8banbZ4ofNjyb2reqLJySZYaIiz7uYgO5Pm05KMw/HwRd2m9l7q8yQq4SfI+1tJmsl6WcuZ2puB0nVR4Sj2sb+AVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410137; c=relaxed/simple;
	bh=NLC2QIUzt+qhz7otktUSqYZ4ASAjZabeK/4gxWnvzW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DdP/Mt4IEuWL/mf8eza+sxrwTPWYOu767TIsTuA7XD9DtkOItCAs03/F90fDqL5B5Bn/ktXyWQ3xtEnthYPtbpXR5Is9QhxSifT3UzwUEaBvZVMedmGFkb0B0VkIdotTgjYv4KSFg7ZPqr4YO6rWBM86/uCuC8efAgo3vT2GMdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJI4cK+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJI4cK+J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37A3DC2BCFB;
	Wed,  7 Oct 2026 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791410137;
	bh=NLC2QIUzt+qhz7otktUSqYZ4ASAjZabeK/4gxWnvzW8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sJI4cK+JHp2KDLkdWbxoCn9biWb4HZqSufQg/cYFFE6JRf74b3cFnyBeZYZ225xTg
	 i9YVhzcfZD2yoMJb3h7rJ/jp6pzoHqHTNfunqR7gw/qKrRAGNqMVrIPhfMcbOX7VGB
	 LYEtHrqW3JX85EDhcGRuR7gylYjbf3MLpCtk7TZVf6HvwEF9e9U9D7J9zxBa6hdjns
	 w7uOxUmIN4iqXsTMhZOVkcp6Jbku2Fy/RMG420RBgK/wkfJYkQ70vVq8furKpcu8wi
	 BAkO9aGY66vqgu7b/1ilEoQQfeS4EAfkGhzSTGAsg2bIomLdOzY4I+4npAfVX6DOux
	 u1ZKREcFHLySg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2737BCA6009;
	Wed,  7 Oct 2026 21:55:37 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Thu, 08 Oct 2026 00:55:32 +0300
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
Message-Id: <20261008-meson-gpio-wake-v1-1-fec8a1f5d830@iav.lv>
X-B4-Tracking: v=1; b=H4sIANO/xmoC/x3MQQqAIBBA0avIrBswo4iuEi3GGmuIVBQqiO6et
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
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFnH9l/pZ85tm2nLyu50TOLVtKnaz3tEPY70ltbM+qZpI
 G+b73y8o5SFQYyLQVZMkWXCIY1bGUuu/vX3MH8AM4eVCWQIAxenAEzkYCjDf/d/t1oNFjL82nnr
 j23GvtndbQwHt6mkNZfs/CZ3MPv/xBcM/4wmNt1m03hw8uOFju43ef4LLzStXt9Qv1fLaO+EppJ
 psswA
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


