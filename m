Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215172;
	b=te3AeTXpGf3cKSUGrv3XuIk76LLCZzdwRVQ6985cM1Pgwsa0KHDLHVSvO6vD/K9qX0Xz
	 kfQfGowNSGPUwYfS0f8bRjp8TEiBjiFv9RSqDiKZabwSN9YvSztxizkEgrHElbCI9EK/w
	 0GVkglOy+Nv29j9gduAjIiR/7e0b3Rn/qC09b1ouVyr7xnM5y0n6eonS/byGd8d7AhK7p
	 dSCfYh9jueLSFCXKiEWyAAXTma4iJ+v3c79so+r9Y7bWK7u+bV3ZiGDa31Ok2Z4CdLsvE
	 kxY/dVEKUKSGOgMmVX9+MuvbzQVLido6FSkxZh+jl6FJdj8mGOBBcVEF1rOoaxQVNrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215172;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=0mh8O00PdEcyHz0kNW4bP1iGgZlLwDSQnfXvvqXnux0=;
	b=izZbShJkGD9IAzKcI03FIFKNIB7ekz/F6m1OCTpL7SfyiUryg1ZrwvdlB+E3dyS2iRKX
	 Q3/FGSSWt2ihA4mYh0nwdukpyITVTzASW0LdjHl5b5kvuS7oA68akwqlVzeAltNTY/vkL
	 wPa5lJm1wZaHW+78El2fUMxfQQXEkk4d10NIwf7+oy8oUI8zZa+S3n36ItLPJMF2f3Vkh
	 OzoE1InjaBDrtRX/G2vmRbubVLzl/7gfID/dtw0GcCsZdyxsn0rPpCRhEuOD+8zum/Pni
	 7W6q+70uHcXx0iKCPqn+8S5SqeF/nTHlVgwfqIjc/CxNeLSY2QC7ZNtV/08OWOe1A0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3wiCJCPS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DmPhB0PC;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62814606D819;
	Mon,  9 Nov 2026 09:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62814606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3wiCJCPS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DmPhB0PC
Date: Mon, 09 Nov 2026 09:06:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794215169;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mh8O00PdEcyHz0kNW4bP1iGgZlLwDSQnfXvvqXnux0=;
	b=3wiCJCPSKdwhV7pjgiTaUH4GHQCcDkKMjApj527rF9W8iuktuB+zB1Ile2XCeE51cK4hMi
	Pmqx3mIDVxq2YOJBLG6EVWopwRh+w5TZvHscivbQ70/EwMedG91aY2foODMNEphORTeuFv
	pm8e79F3dmbcqom+h3wnhhVIgbjvpvW5eadCpqw8xka483S5zR9/TBPUcEx3DObp4bzO72
	ew6GYehWS3kYhTSGxUmhBPiW/QIZHoG6zCLOoOaqQbUCblHJ7w67qWlwd20S+b1c5pld4/
	EC30unHybChX2q6Y3zHcKEZQnqVg5du8tECr2qyNQamzrxO09zNlcIOEs/5++g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794215169;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mh8O00PdEcyHz0kNW4bP1iGgZlLwDSQnfXvvqXnux0=;
	b=DmPhB0PCx0IhsQcdHxQj7cxBa5IJWEVxoOaKR0uW1RbzmfNCEOo3eQt/EQ/JneEZBtZalt
	JNvlH6mg6Qa5PSBQ==
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
Message-ID: <179421516816.2093942.17364110491655615947.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     f833e77463782f11b2b9c64212b9c0e2527dbb04
Gitweb:        https://git.kernel.org/tip/f833e77463782f11b2b9c64212b9c0e2527=
dbb04
Author:        Jindong Yue <jindong.yue@nxp.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:55 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:01:08 +01:00

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
index 6e1f77d..9e8e660 100644
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
@@ -357,6 +358,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[] =
=3D {
 	{ .compatible =3D "nxp,s32n79-irqsteer",	.data =3D &s32n79_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
=20
 static struct platform_driver imx_irqsteer_driver =3D {
 	.driver =3D {
@@ -367,4 +369,7 @@ static struct platform_driver imx_irqsteer_driver =3D {
 	.probe		=3D imx_irqsteer_probe,
 	.remove		=3D imx_irqsteer_remove,
 };
-builtin_platform_driver(imx_irqsteer_driver);
+module_platform_driver(imx_irqsteer_driver);
+
+MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver");
+MODULE_LICENSE("GPL");
