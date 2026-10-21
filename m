Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584868;
	b=k9MkCsA8rQpanuS2rFgVyRqzJnL86o5i7i1/hHKhEiwaa5RQMXwzn1kdRhH1gx3AtZ/a
	 gn8B+APbF79kfsPHmPsD6e2OzxXCzPdl28UScdqjTJ8jxIUWDo2ZWemZSCUiSsxvI3D5G
	 2PFDk+hIdKNfPIEASYu4McW07sdoIlauRZ58X7C+SSMxt26hz8r4bc8NtsDbfOvATqibh
	 xwGYuCiBDGUG6luzDnsASG1jXCeV8a/hxytwOkEZuIoSCewE9tA8GVrvn+/PHII+40LeD
	 XEB3JBpV5t5WKHkCB6brtLkSdEQgLiM/kf31zVvobgkyoRBKk8Fe7PtNO4oMo97sZnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584868;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jY9SF4V1JMKT4PVOJL2PHfTazqJrCrQG2IeykIxkdEM=;
	b=dfBQ/76HOQ/dotbCWSKa0bbunmd5bKPtWF0CrYAphEoM72vJSn+2IVRPBCq6Df4HJWSy
	 R56XBIdBqJX4tjQAjK/LdZ2+cmkN5kdwGo+Hg2Cu+fqn2odUnR2hbFzVCdV1KSUmqSVg3
	 Gzq9TQdsoDhHglDzpXQkyKtDCzgN9suXdtLFc4kVH3HG0jE9oFIR+b5ZW1KUZNwqOkdzI
	 dXTOaX4ctXtivT21c+TSx1F1FNgja0x764AJBsWoqXS/6MpA0VFsURJTU2eF8yA0k5xdx
	 rkSRCR4/p/Bu2Wj57PqZbF+VVkhbSvTdeaadwNLpP54eA6k6deJbXHB4sXJ7j81bLjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CKaG2RqQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E0606A321;
	Wed, 21 Oct 2026 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CKaG2RqQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94C01F000C5;
	Wed, 21 Oct 2026 12:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792584867;
	bh=jY9SF4V1JMKT4PVOJL2PHfTazqJrCrQG2IeykIxkdEM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=CKaG2RqQPqdXMdtGcMWfFmbamrVQXKsKgjPdVF8mX1fBJG/sms9GdNoY+N9zEMcD8
	 ZuESuj6iPtEIcA+PiCAMhP806SXaovUaZGNG+tFDEqc2NxfwagKE4LmPrERExgE8xi
	 5z709x0I2KF/Bitxxih3c6ux3fUwxxPWHkl8lV8l1geZv/xql5lgvHjdXRKbGiP2rM
	 WohPqFCdEVnPU+hIMAYSf0Z+SzFnTWa5aRMcDl1P24cu9mJLSxeJEJtqdwJPgYk0AK
	 MvrEaw7tByFgEfMSNUgFA/g157IACm8r67bN1BwEooeObzOdpduXgdp0tYftDqOLwn
	 X6eehvsQAuhsg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	cover.1712920132.git.mazziesaccount@gmail.com,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/28] mfd: bd96801: Allocate watchdog IRQ resource on the heap
Date: Wed, 21 Oct 2026 12:09:27 +0000
Message-ID: <20261021121245.3111563-5-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021121245.3111563-1-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bd96801_i2c_probe() declares struct resource wdg_irq on the stack and
assigns its address to ddata->cells[WDG_CELL].resources.  Although
mfd_add_device() deep-copies the resource table via
platform_device_add_resources() before bd96801_i2c_probe() returns, the
shared cell template and the shallow MFD cell copy attached to the child
platform device retain a stale pointer to the expired stack frame.

Allocate wdg_irq on the heap via devm_kzalloc() alongside regulator_res
so the stored pointer remains valid for the lifetime of the device.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/rohm-bd96801.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
index 66fa017ad568..eb7a7376ea89 100644
--- a/drivers/mfd/rohm-bd96801.c
+++ b/drivers/mfd/rohm-bd96801.c
@@ -642,8 +642,7 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	struct irq_domain *intb_domain, *errb_domain;
 	const struct bd968xx *ddata;
 	const struct fwnode_handle *fwnode;
-	struct resource *regulator_res;
-	struct resource wdg_irq;
+	struct resource *regulator_res, *wdg_irq;
 	struct regmap *regmap;
 	int intb_irq, errb_irq, num_errb = 0;
 	int num_regu_irqs, wdg_irq_no;
@@ -692,6 +691,10 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	if (!regulator_res)
 		return -ENOMEM;
 
+	wdg_irq = devm_kzalloc(&i2c->dev, sizeof(*wdg_irq), GFP_KERNEL);
+	if (!wdg_irq)
+		return -ENOMEM;
+
 	regmap = devm_regmap_init_i2c(i2c, ddata->regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(&i2c->dev, PTR_ERR(regmap),
@@ -723,9 +726,9 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	}
 
 	wdg_irq_no = irq_create_mapping(intb_domain, BD96801_WDT_ERR_STAT);
-	wdg_irq = DEFINE_RES_IRQ_NAMED(wdg_irq_no, "bd96801-wdg");
+	*wdg_irq = DEFINE_RES_IRQ_NAMED(wdg_irq_no, "bd96801-wdg");
 
-	ddata->cells[WDG_CELL].resources = &wdg_irq;
+	ddata->cells[WDG_CELL].resources = wdg_irq;
 	ddata->cells[WDG_CELL].num_resources = 1;
 
 	if (!num_errb)
-- 
2.56.0.218.g1ec904b173-goog

