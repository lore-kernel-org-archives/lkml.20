Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174581;
	b=3Vib6Y3KVQhINf2ANNu2zSAmDwbvdbdYGqaCAuONhOAVfYl1iyTslHcCSLpHDqVdiFs6
	 ao9UIAvxvUcErXymHmUZGPvrZMI/g+EgVsADNTwXyg1WCd6tKMzD8awRO0AVumE4ru3cO
	 /duvgxPqBqc3qklx5KLWjxmNzD0FSzRnkZSDM4B7gQFXI0rUxLfk0YbTUKf0IMS/u0iTL
	 9tuc4botODJgizXcENPCieeoxC3T3bw/Mtb98U4OHjvLhMDCjtRGFfFOuI/bZwgbpmMbx
	 DZzs3rgNmJMzsVZtUDENgBf0Pmny3UELV0y8tRfOrKuGW+1YRPX5KfY4E5q005tjiNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174581;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=vDhfaPXsVo/YvRSIxJlHyFFMi+wzWDv7hXrrtrtt0VY=;
	b=E5ya3nyPMNVLP3CGkKy35JT3Ns41X+Qan5OoyLMQ3FcfHKWl+vFKd7i04lWwXylQHFB2
	 Zc2PzO5jMbNhTaTNpjwRbl16Y8SHArlalA9uy9ODtd3/2/iI1AF0jfb5k8Os2o/zl0qk8
	 M9sz4wj+/ZXYMFi2VX6lVFBg437O26SVun/k5uyClgAK/jHl0cV1yyxF7TK5EedDWQ3Qm
	 3CbZakVfr6jpz61TvIxuSqJVqHN9KYs7qeLo65HipUsruKfsUV+oS5Y2nB6ujyXbkWF27
	 NHrX96w2sxSDJ+FU3rfWdSV3I/wEsuDwSInYCPtZ/NAIJBLA3rYm88osI8JKrZalRSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=al2pDhBb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PGGDRviZ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B9606D803;
	Sun,  8 Nov 2026 21:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 239B9606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=al2pDhBb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PGGDRviZ
Date: Sun, 08 Nov 2026 21:49:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794174574;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDhfaPXsVo/YvRSIxJlHyFFMi+wzWDv7hXrrtrtt0VY=;
	b=al2pDhBbtbSFo7nW/FbGDwp7nta2CPRLahRy83gcWXlY0/qb+3skiHzhUKymdwvjDPqJP3
	yiABR4ftI4W4zcJo2pxNV819B5GDchG1alShSHKJF/7ltyHzgxalsKUPM0TbnbD6xIBN7d
	tpeqWtv5FukuCrM151WqjRCcxTl+NLL8ygsbNoESpiWk8nP09bikacxGudvK1+8bK89hjm
	dVwLMcq3O4VcHu44fr+YGVwN3SQx8/Jv89trqgZMhh2oUZP2zIuKXHzqhaFoVXPgpn2Ncy
	TCapUYYMLt6qPl98I1O90PuOoYtCoosXS7qoHy5RCA4mz/TQlDgwJCLTHS+pvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794174574;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDhfaPXsVo/YvRSIxJlHyFFMi+wzWDv7hXrrtrtt0VY=;
	b=PGGDRviZ0ureHOH/QXwxn0qMCYPnTBP3eG9zMsrSS7Bh09GA5r7rLhXGWagG4ga4UKgzW9
	tDTLEJvRE+u5bYAw==
From: "tip-bot2 for Jindong Yue" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/imx-irqsteer: Allow building as module
Cc: Jindong Yue <jindong.yue@nxp.com>, Zhipeng Wang <zhipeng.wang_1@nxp.com>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104073759.386777-8-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-8-Zhipeng.wang_1@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179417457287.2093942.10886453998261591409.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     5ba8dd376dd1aef84f299c6ead82e65ffebe3018
Gitweb:        https://git.kernel.org/tip/5ba8dd376dd1aef84f299c6ead82e65ffeb=
e3018
Author:        Jindong Yue <jindong.yue@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:55 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 22:43:44 +01:00

irqchip/imx-irqsteer: Allow building as module

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver(), and add the MODULE_DEVICE_TABLE() and module
metadata needed for autoloading.

The clock, runtime PM and IRQ domain are already owned by devres, so no
further teardown is needed to support unbind and reload.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20261104073759.386777-8-Zhipeng.wang_1@oss.nxp=
.com
---
 drivers/irqchip/Kconfig            | 2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab4..1620a57 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -557,7 +557,7 @@ config CSKY_APB_INTC
 	  the controller's register.
=20
 config IMX_IRQSTEER
-	bool "i.MX IRQSTEER support"
+	tristate "i.MX IRQSTEER support"
 	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
 	default y if ARCH_MXC || ARCH_S32
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irq=
steer.c
index 5c0c5a5..234fd10 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -10,6 +10,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
@@ -360,6 +361,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[] =
=3D {
 	{ .compatible =3D "nxp,s32n79-irqsteer",	.data =3D &s32n79_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
=20
 static struct platform_driver imx_irqsteer_driver =3D {
 	.driver =3D {
@@ -370,4 +372,7 @@ static struct platform_driver imx_irqsteer_driver =3D {
 	.probe		=3D imx_irqsteer_probe,
 	.remove		=3D imx_irqsteer_remove,
 };
-builtin_platform_driver(imx_irqsteer_driver);
+module_platform_driver(imx_irqsteer_driver);
+
+MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver");
+MODULE_LICENSE("GPL");
