Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276507;
	b=aVA6gLlSu8i/qcS++kkpxLqvZmiIIxZgu39kwarPO5R0GLbjYvFkCYyiw1FrC6n7qrif
	 gKP+LAEoWaDwZGHb9YCsovpJgcJ3Cy7u6UxTvb/I2FiGFJBfmgsVvyRQNApeC3fTXeRwa
	 ZI44XwyprLGUElYq6WR2KKq1fYVCluJPRQg0ElpAAtPsZRkdrIbxMo0PEsl26A77MtdPu
	 VfN2DO8qTkcb2CeScbri2vluGaqG3hpNR3r2B6KjEpyRscm5d6JtF8BUoG2rBcseGQCqz
	 twSBlWMbc6NJAYpQeLld45GQTIkezim0iKxYgb1wsHoqNvC/rjpLNMdNVq5mt92Y9Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
	b=MwuhSFRXY9RPMNOjndaRI2Fiwp3K7Y/p1WlFIbrOjV4fF6YSa4D88rqbTawGcrNgFne4
	 4Y0exR4y6TBBWKjMYD0F+l+m+0CbeA2Lp2/8tk/p5FGnXfX7cDrAPjYOEMRbBoU1yqVUQ
	 MQPR6lQstN+zwUPPRmoSCbUjic3XcH5TSWY++q3VWhtliXU3bTQ9Q/m/yqvpKfJija1TB
	 u7Ce+ciUwg91axt2bJtX8wyboE/D2jnuMp2x5Gs/ynzsOMkQmc2pZd7FrQKB3O3a6Th9I
	 8lyR/FjwORtWomCQbYLgeneHYEeyLKgnNLm3o6aeCotUK+KoROMU0TlPpSFKX10X3AA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g37a4kR2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBC4606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EBC4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g37a4kR2
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d427836e9so200516266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:08:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276506; cv=none;
        d=google.com; s=arc-20260327;
        b=TxAOIECo6F3rZn+pVdWqxA7C2EZBLsd5kRxxCP8TyJ7XyYpkt43mgGjyQ7mf9lIx5n
         zjDGHs2CP+olvuAa2uRPo5EvfRP38X269+xUaqOsX9yq+c2+qqUlzLjwl82bqLyDMitm
         CxysAThnYh+1bqwib2KaDa8cKJYwlLbZddpIGNEnvxzB3OhHSeNyZpEk0+PkHnNJFF/5
         MSFI0VsQrnbdsh9fmBzc+zDwq0b9PLL5m9RtBmnS5TrqGT77YdOEP+QM+hz8j0uNawZt
         aaTDMu61+k8QipgeXrlo9wuqn3o/NC3Ru8sLlReyIdGMPdbqcd0SNtfMQJ7tdGgDLCgQ
         inqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
        fh=fqu3erTgKcdi/YPZrw/T2UqQlCSn37PTQgz6I9FlwB8=;
        b=FL/jgeKvMru9nH/NKkMggirQ5j+q6p2JEIRL0XU+HpBJRNGNQl32uY1bmQ19PhwnZm
         Ao2s2XJhRRz4122c28Y5JuIBe5I/u5pFVBw5PGbpJoqbRQWxsH1BImipKnWuV3D4V0EP
         GWI80A7vyZQiZdZoaca2AuA7w35Icb/Lz3UCPqlsd3iApBvURC51IrMOSvS4pNsbaxEX
         uV0wHG9O6YxD6p15BPQO37TIen3gJ+59yo5KMYePI1r/2TlnN6+IeOsDi60ULpiGrh9R
         z9PYrxGsTn1Ld2JZJ9u4hHAG6bhZ07+OZ+cdrakjtq7vzohenpUHaO49IyKd46gZeOaD
         xNlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276506; x=1794881306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
        b=g37a4kR2OYKgQA6R5gsDZ3w+ZslaVu5nQQYNH6WhIbL8yiCQgzA7D2ZFEzzf/Uyi1L
         ms+IVBX416UN0axrp2IrbT7uQDhVyGpa/n+iK4ZTlddd0PpEBhkuxCh+aUB8O5awVI4e
         V7toYv5zJA5WX2qlPCVlnWyJaefJxlDH6kwtknCChi/fd8EyO7Sb8gHCBeYRtYqp6kdF
         bpad+lD4UgzPg7O88Qdg+nBBBfKX1hZYZKDXPyvt+F02rGBnw0jjmUg8WSQXAlnbJK5D
         +CxeTkQgWXy8raJlGxdWhhSn4XIhjN/sb3JCNZ5ddWfRnMJBbJdpjLK9JvzgTa6qRgy6
         Kl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276506; x=1794881306;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
        b=fMY6cA0PqDWZM1FymhAZdHI3AaZNarfvqMPTxIMSkJTd6RSZ9s2ZJezlB4qYoHIqfI
         1zZpxQD7+yLKedthH/U7iQIfl4GFl+Yz1Sqppz2JSixlN51ge2mvfNHpdnfjUELV4dPx
         UaBX8khcGhSd7ToPjlGaRAM0umC8408Kwwv+6hs9+BEh7dqjmqHo94ztQJt7FXeZjWw8
         7zWCGztge21jgs7aBuoTQ0n5vtIAjYN5VZ8WROpBs3cWed4JBPdEk49d+Woqwq24ja/m
         o4MNGJWLFbbI8Otbxd0PboV017UQhs9ezvTjqcpMyBvgmZ3WzAGP3p3DPIOd6C5FYsp0
         klLA==
X-Forwarded-Encrypted: i=1; AL+hErFRAfsjQyhNcucJUqQjDVmoBQ+ra9INT3P5NBKKPG/0PM9Yr/QPV6X4SZhqB5K5i+ANuKj+wQYd8V/rG0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zz3vjHc2bdkhmYUqqs+sMPyHmCKI6sx8lMR0axMqmPY71hYTJ
	jEieGh4k4JRBzOTGTJ5slAhNzud9VaDh1zSUn81ASpbDvJsiP/3hYEYIym119/1YN11UYvXzr/m
	OlXLPJogpk2cjN4c9CDrpzAiPqem54g==
X-Gm-Gg: AYBFou1/30nWvK7xpKDgvoV0U7BNKVPzTav+c9j6mQIp9hFRMNx60yQJRUghfb5COsD
	jFyTwrG+HOsQy8Pg0PG4WoAnW6l65uOrBfUZyC4zBTu7RjMlCovqqFBm/HPpMdq2Tc9vsBgd+vh
	3loxreuBmcUCk9LNLNzGZBlntg4K2MlBdDKG31aKF9LNEn7VGbk0AJKJkDtTzqZX/yJlqTlIggv
	0UG7nyDGiKtpY9Xi7KY6uxqToD63lHunPeAa/PZerN4WB470zKRWBSKI9Wt/PV3ZVx1GaDvP1mz
	y4p0316o/0pHgMga3pBwZ5NFCmh49StIy8dZhhua2ozsvgHk3jxVDUU3lJUvF3JJjbVv9MEy22g
	r5iHfjwl/oSEoyCLiFHh1vQfd01A80C4miyw3dDL46M6MZbfu0VLW3N+wkvbvQ/nDZKVPnOueez
	SwMsbiMJ9R7d6n3oQeCPSmXnIJt0bEWMN40EVsaLxlzBk=
X-Received: by 2002:a17:906:f58d:b0:c41:7e99:c6c2 with SMTP id
 a640c23a62f3a-c5049656cbamr100998466b.44.1794276505640; Mon, 09 Nov 2026
 18:08:25 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 18:08:24 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 18:08:11 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Mon, 9 Nov 2026 20:07:59 -0600
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
References: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
Date: Mon, 9 Nov 2026 18:08:24 -0800
X-Gm-Features: AclHuK9zIcEhLJfPfTc1f-zmgRBrGB7NhIU0-U0vwWpTSSE_uoc-gqIjLG_ZynM
Message-ID: <CAGEsz8G5RuLvQUkfg-H0zArwLrPuoCWEt2tNO+nMssu+w38sMQ@mail.gmail.com>
Subject: [PATCH v4 2/2] media: rcar-isp: distinguish absent cores from probe failures
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

risp_probe() interprets -ENODEV as an absent optional core, but resource
setup also returns it for initialization failures and deferred probing.

Reserve -ENODEV for missing core MMIO or the renesas,vspx property.
Preserve clock/reset errors, defer until the referenced VSPX device
exists, and use -ENXIO for malformed VSPX data or failed RPPX1 creation.
Convert remaining resource -ENODEV errors to -ENXIO so the parent
rejects failed initialization instead of continuing with the channel
selector.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Suggested-by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v4:
- Handle resource errors and preserve deferred probing.
- Apply after the IRQ lifetime fix.

No hardware runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c |   17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c
b/drivers/media/platform/renesas/rcar-isp/core.c
index 14f3c8f..0a32201 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -800,20 +800,20 @@ static int risp_core_probe_resources(struct
rcar_isp_core *core,

 	core->clk =3D devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
-		return -ENODEV;
+		return PTR_ERR(core->clk);

 	core->rstc =3D devm_reset_control_get(&pdev->dev, "core");
 	if (IS_ERR(core->rstc))
-		return -ENODEV;
+		return PTR_ERR(core->rstc);

 	of_vspx =3D of_parse_phandle(pdev->dev.of_node, "renesas,vspx", 0);
 	if (!of_vspx)
-		return -ENODEV;
+		return -ENXIO;

 	vspx =3D of_find_device_by_node(of_vspx);
 	of_node_put(of_vspx);
 	if (!vspx)
-		return -ENODEV;
+		return -EPROBE_DEFER;

 	/* Attach to VSP-X */
 	core->vspx.dev =3D &vspx->dev;
@@ -840,7 +840,7 @@ static int risp_core_probe_resources(struct
rcar_isp_core *core,
 	clk_disable_unprepare(core->clk);

 	if (!core->rpp) {
-		ret =3D -ENODEV;
+		ret =3D -ENXIO;
 		goto err_put_vspx;
 	}

@@ -860,10 +860,15 @@ int risp_core_probe(struct rcar_isp_core *core,
struct platform_device *pdev,
 	core->csrstc =3D csrstc;
 	core->csbase =3D csbase;

+	/* Keep channel-selector-only configurations working. */
+	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "core") ||
+	    !of_find_property(pdev->dev.of_node, "renesas,vspx", NULL))
+		return -ENODEV;
+
 	ret =3D risp_core_probe_resources(core, pdev);
 	if (ret) {
 		core->base =3D NULL;
-		return ret;
+		return ret =3D=3D -ENODEV ? -ENXIO : ret;
 	}

 	ret =3D v4l2_device_register(core->dev, &core->v4l2_dev);
