Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615733;
	b=D4ZhPw7tbSYhm6XXUvJdamli4Cb6E9ZLeU1ZjU0Vy6O+UbW9kIRdMYRwTVKPn6852w5/
	 KsEP5n3Aj5243nKJTT3R/FAonO8LMYkxTvkV9EfysMtuKiQx2DXFigzqxGlRQWFnxJR7D
	 IWv8QoVY/P3LX3HhJ9kyAcm3U4i6+1BSpruNY/vQsx1+iL6pnfs46K9RLveTaTyfdIPiO
	 yjnQSyBWeEgqb55lTAths8wk4z79MXL3jAc1xBww3VBMBbxAKrO9nelb5I4sz1EtE0k/K
	 Xr7nzP+x6E83zWLSoB6tUREygYg4z6Yr2Tmryx45u+xKDxzqg7r3qklzzm2ccxi6hcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615733;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=ZXbvapQaNImbXR9QF5KkcIq1gPNTKOhj+WrRUaDSC14=;
	b=uME8DP8IPoh8kwb3Hczv9WDg1f4y7qwHfwBZs7B9qjE0Z2iS1SrCo5y6M+K3BmiPPxGo
	 GSU125Voz85lVMHHJav12jhXSNBs63GJB5oXeyH+7AhjcjJi7sd6GRYWTDhfCiMxNZjU9
	 ZNgkYGduTVeCJaVZrr/NknJP4+Erhj03ETH4WWDb8WI9jemtYxJwjYNAldmVswAnLROXL
	 O72ynusgUwX3rld3Fd+y0NxOnq1SIDjGKyKcEPPNun/PfPzqqW/HXP9+tVTcAbew06YzG
	 Plr2H6SdBowpcnx5FgmJymTjb8G8xMjqgMALuTTVC4xHcIo10USgjM0uZPID0jnCN/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=15VaDmhP;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49174606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49174606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=15VaDmhP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 90698C8F446;
	Mon,  2 Nov 2026 10:36:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8363060750;
	Mon,  2 Nov 2026 10:35:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56F11103290E8;
	Mon,  2 Nov 2026 11:35:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793615728; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZXbvapQaNImbXR9QF5KkcIq1gPNTKOhj+WrRUaDSC14=;
	b=15VaDmhPbzpFpCxilWGbI42dOv4srUFUJq26JhYFL3LzPcTApz/JsW3mpJ7QYdqnY8m1Oq
	6VXfb6peEGSTSB1vt3GkfO0CEJWJm8VKegQK3DzGtJCpxzJZ8EQcFMv7wyQ44s5lZ2bu8M
	/DTsOlT5BCeqbjfd6pLnTVtxmovqJGishKRDO9tZmJqWweH1xAZwaKLZRMRAcKlzuGBRRw
	YcV0R1vBk/KhcXsdkpnUWNYj0SjhwDon2f9qyfZdkoftBTFjf2t/Kuevlfv1BtAzQrJzY0
	dlF9Uict4ErdnNT7OztAFl5HIjxa88NOqukg3mfXqhYZ7e26eXOUql2gB7PEoA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <jesszhan0024@gmail.com>
In-Reply-To: <cover.1789994813.git.osama.abdelkader@gmail.com>
References: <cover.1789994813.git.osama.abdelkader@gmail.com>
Subject: Re: [PATCH v7 0/3] drm/panel: Use managed helpers in DSI panels
Message-Id: <179361572393.120902.4850008963645944900.b4-ty@b4>
Date: Mon, 02 Nov 2026 11:35:23 +0100
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
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Mon, 21 Sep 2026 15:17:54 +0200, Osama Abdelkader wrote:
> This series converts straightforward DRM panel drivers to the managed
> MIPI DSI attach and panel add helpers, dropping the corresponding manual
> detach/remove calls from remove paths. Split by driver family/vendor to
> keep the changes reviewable.
> 
> Patches 2, 4 and 5 of v4 (Samsung, Himax/Ilitek and display vendor
> panels) are already in drm-misc-next and are not resent here.
> 
> [...]

Applied, thanks!

[1/3] drm/panel: Use devm_mipi_dsi_attach in BOE panels
      commit: f872d4e3a2ae6bdd8d88a4c19844b3ec851f2549
[2/3] drm/panel: Use managed helpers in Novatek and Raydium panels
      commit: 9ebe0565cf49ddaaefe136a0513ce31b7bf01c2c
[3/3] drm/panel: Use managed helpers in assorted panels
      commit: 525b076e340a9d37abaa1d34141669f96307698d

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


