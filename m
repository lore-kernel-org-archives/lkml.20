Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794121345;
	b=lgLSxTWJ2Lb72HyQkN6pmfAWLJVVkcMnwbptpSAXd5JjDAdKBeCsIq2/d08cCQ84/fux
	 aJIR3kPzYqJj3MQ/pFpfVVVFLeVDfXzR96y0oYsEzW34uS/pdBcizwq8i8UNJCz5LsSkT
	 g7GMCfOIw2fhZs2jHarm3KLN2VVJP3oFsnSvtiO0OX9MfxJ9CbpoB10NW6X59lo/euaSS
	 45LrpSeWqTUv/h0u8FhC2orxXhgLSfj77nDpA9XxuGtfpUWVRAc0DZBg437YkUoVg3kwi
	 3eIgwItzkdzg7qCFAng3e/Z/c3ADmrkX8fZEhTkWZY1K4Zy/AEuU9OctVb8kP6Q1snQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794121345;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=ipj/1kh/Qwg8JtQs5mXT+prKceKUcPF0OcBii+U48yo=;
	b=cpOgIVqB3kiZGZr226iUp3C66Oak7LHRXfg5OoOdlUu++LbN2PXNajR+FnAGHWlylH2S
	 0Rod3JDIsng7oEXEWPC9xyhg/Y6PASqM+r+mxeM/DDVA7zbJao6iXcXuopOD8QvA1Rl16
	 ZsrMtPO25ZF9b7NB5uhMXGeVUXwcS1Y8I241W9yUvrbz4iz+RCd0c+/WVox/H7IYMkWdO
	 U2b891/OdFjUgKpjEPUQOnusHUz4oL918Ttd7dxPydJYl74uGE0NkDo6ZfvlOkRtzs3sR
	 djf5UdO+pmKdR9LoWuHFysG6pn9t1Zwd7A46CcuZHQVTAJcBjB5jqZPTvzn3ZtL4iwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=Ge4ThRxW;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jRXdFEKZ;
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC465606A31F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC465606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=Ge4ThRxW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jRXdFEKZ
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 5C2EF1D00165
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:02:24 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 08 Nov 2026 02:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794121339; x=
	1794207739; bh=ipj/1kh/Qwg8JtQs5mXT+prKceKUcPF0OcBii+U48yo=; b=G
	e4ThRxWh0vIRQvC4Dv3tLXQyXysOOsPjWJx+P5isDVksdqoRfsnEMTvj6JHH1A6N
	4OhNqvuYDeeURUT2h99afD0b9fWzKgA0s4yKAkXEMoP2KKeVICN2SUrJ+OGSZxx5
	5JZy8+N3oT6vh8t32Uuf1CgS1Jyig80wmtrryznMSMmjHkv5hu+RxMeMYCGIF2Wm
	2CqGpaW4uhed2xdbuoJlP0EENXXKGIC8lDHPyHvnmwtAP+fqxpsZN/cXBZOCKWRA
	MYvi+bXzuHe93MKv2ws1rtX5l7xB+n1OsKvuIcRKf5t1BVC+2kGhvHxKDKAZHzm3
	puB9EjJD0Nz0EVVNV/zaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794121339; x=1794207739; bh=i
	pj/1kh/Qwg8JtQs5mXT+prKceKUcPF0OcBii+U48yo=; b=jRXdFEKZSLKDr2qsY
	H7gH7MKBzk8xikzct4ZaIqdSqLEaohH+Et22uYLygJwbDEWPex4pQr7Yfzd8KD+C
	yPjy23plKChkx0udTpzvApXwZrOYJJzxdUYrK0eSsJ71lsL9PTBVGVFYV/tX919D
	ngQVn+aaCc3pB2Eq3+0gd9DzlsCoV/I18xlE53A40GPyIU+AzRvM9Qal5tcQKvPI
	HpaOJAMchjE26K6zT2qQfkdh/IaWacCPnRupyWJJFaKzznWEqIG/ptF/RbzMLqCq
	YizI3juWDqRwTJbnEDiJwCsaiOpMI+JaqWmXuwwRf90fXmE6rf74Nhot62i8nuat
	vJwgQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794121339; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:Yx/7Ih2Q5FIPFtHv6B2GYFgf9B9STZpD/YhDjuSbvYoiyz1
	2SIDBJgaYnRAqiO82QBCCtLsgtcCe4BGXzNE/J47lRbLuOpUVI6RtuhLQxJETq3X
	MgVWgFnXY2PdZ5Aed1mQHF7+zvbggRGF70N5TztBLB9d010CKD8w1nBQHgt0CJLA
	mVTzbwvXHD47eClESbeHR+5WczdwdGJNPP8+TuQO1kjJQqD/w+Hq4nAMUf2ox/1M
	2q24q0cWiFfIii/ewnrksE5HU575ObkkYpx8A50JF+QxYDRDlh2R9QMzgr0CxYHd
	Sbyv+16KfjpG2h7nSEM4iDBG1iWuR+x/IH1OptA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:N5tYU2/iD9Uri3jXaSwJ0j/PV5kGe7ooaxT77EFpjB0=:PPqraYF2OaL2b1Bphz2UFK7WJ1HoiYNzQKLY9DdBz2o=;
X-ME-Sender: <xms:ex7wavqHNPFdj89XMLq5GlFSlcYo-AJ33FhA5vvHvqCXuP-8SKjqQg>
    <xme:ex7wamECkO-iBFRfc1_wi09v9KDy-dy1NBPv9N4TduodJPhhWqff5m0n1wGTU2xce
    kXyAkFO3-1TeDpFinulAYhNLHjRAUlMV1OkwOyjhLidNVrlmc8jbYzB>
X-ME-Received: <xmr:ex7wajd0vrwrn71fAIVHzdr72UmeS3eHLZJnOm1kNBsHu5Z-Kac7rNGf8R8CKvJbvs_nllcN>
X-ME-Proxy-Cause: dmFkZTE7q/PaJHHdIjHCwXOiOVEFZs/HpKKLTe9vg3wZU7f79Ij3haRvkyHnxyLaZd5xFn
    2nF7NWLZIKCO15G5xwm/jfrx1kpO0/UyWi1QSYCjdy1aaITNdD0xbUHP8sWrPzQ+FC8jSQ
    QRqMqgO1i9RPNY8j6cbrLJzRfuBtB76KmaZbmJr9Y5KNwvLj4AFeUBxzbjQMqdgLXx7Osy
    GkgdPvwJAvPZk6efYIyEiKTAI4rZFD6XKWT5UjEBg4Mz2zU4EoIBxfaXgk6EOjG8dtL7D4
    HmEJFSqc0OPvYgGH/lx+SmVevAsZD1uW2EsoriZehi9npffjrvA71JdLHvJBF6keP3XUof
    x2BtrfRNRp9waHRxrHeceJJf6N+h4yMTgnV9ICixDvG3DFKv7onOHmEdWEc9VBX4yCFRkr
    N7Qgmh8pwqa6vKdGxMdELnm+ALXPRRzZ5bNH3bEkjFlcCIdll9ENOtWToV1aW/DvyAKxtp
    2QlIG2dPLeGOTJl9w0qM4Q0F3mwxcqPdTTundc3VRX2htmR+9Quwtbey4LO99sNtLkiqO0
    epzGiZOwMu0eQ3wPp5X4kLN2DbXIvb2whQsfCh0iG/flN6B5/oEfp5cxh19o8bE2q8/P9Q
    LDrA9sO3WalSn4FvYURYMmdgaMM+hYgeG904wVCtj7wumvpNgPToYqRnAhZA
X-ME-Proxy: <xmx:ex7wapYBigvXuQGSW_oz4rRM9qIiW_ksPWksKnTogMGEtdeVmIRgfA>
    <xmx:ex7wavLVWsUlUHtCusvCWpH3Gq_JZrFZT1GsW3Kdt0zYgr29sMAZKg>
    <xmx:ex7wagh7fBF2RUCwPelFEROxfddKDcWKYdSm9dMu0YB0ZKtULUqQnQ>
    <xmx:ex7wajuHy3jzKxI7pxXSafg_KObcrsvDxiTvOp2Xe8Q8PidMuCnqbQ>
    <xmx:ex7waqAau6yf7UERtA1QPgK0p2GWMTwqrWjsjm-YGxtBv9kkLk7S_o4v>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 02:02:11 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v16 10/16] pmdomain: rockchip: cycle an optional power-domain reset on power-on
Date: Sun,  8 Nov 2026 19:59:11 +1300
Message-ID: <20261108065917.135194-11-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108065917.135194-1-gahing@gahingwoo.com>
References: <20261108065917.135194-1-gahing@gahingwoo.com>
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

The bus interface of some power domains can be left in an undefined state
after power-on.

On the RK3576 NPU this shows up as a hang on the first register access
after power-on. Resetting the power domain once makes access work again.

When the power domain node has a reset, the driver gets it and cycles it
after releasing the idle request and before restoring QoS.

This is optional. Power domains without a reset are not affected.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/pmdomain/rockchip/pm-domains.c | 33 +++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index e3cc60fa2277..0f4ea5471792 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -19,6 +19,7 @@
 #include <linux/of_clk.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mfd/syscon.h>
@@ -103,6 +104,7 @@ struct rockchip_pm_domain {
 	struct clk_bulk_data *clks;
 	struct device_node *node;
 	struct regulator *supply;
+	struct reset_control *reset;
 };
 
 struct rockchip_pmu {
@@ -688,6 +690,21 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 		if (ret < 0)
 			goto out;
 
+		/*
+		 * Optional: some domains need their reset cycled once power
+		 * is on. This goes BEFORE the settle delay, not after: a
+		 * domain that asks for both is asking to settle before the
+		 * QoS registers answer, and a reset deasserted after the
+		 * delay would leave nothing between it and the QoS writes.
+		 * On RK3576 the reset being cycled is the NPU core's bus
+		 * interface, which is what those writes go through.
+		 */
+		if (pd->reset) {
+			reset_control_assert(pd->reset);
+			usleep_range(10, 20);
+			reset_control_deassert(pd->reset);
+		}
+
 		/* Some domains need to settle before the QoS registers answer. */
 		if (pd->info->delay_us)
 			udelay(pd->info->delay_us);
@@ -873,6 +890,14 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	if (error)
 		goto err_put_clocks;
 
+	pd->reset = of_reset_control_get_optional_exclusive(node, NULL);
+	if (IS_ERR(pd->reset)) {
+		error = dev_err_probe(pmu->dev, PTR_ERR(pd->reset),
+				      "%pOFn: failed to get reset\n", node);
+		pd->reset = NULL;
+		goto err_unprepare_clocks;
+	}
+
 	pd->num_qos = of_count_phandle_with_args(node, "pm_qos",
 						 NULL);
 
@@ -943,11 +968,13 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 err_put_clocks:
 	clk_bulk_put(pd->num_clks, pd->clks);
+	reset_control_put(pd->reset);
 	return error;
 }
 
 static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
 {
+	struct reset_control *reset;
 	int ret;
 
 	/*
@@ -962,11 +989,15 @@ static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_clks, pd->clks);
 
-	/* protect the zeroing of pm->num_clks */
+	/* protect the zeroing of pd->num_clks and pd->reset */
 	mutex_lock(&pd->pmu->mutex);
 	pd->num_clks = 0;
+	reset = pd->reset;
+	pd->reset = NULL;
 	mutex_unlock(&pd->pmu->mutex);
 
+	reset_control_put(reset);
+
 	/* devm will free our memory */
 }
 
-- 
2.43.0

