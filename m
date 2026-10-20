Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495471;
	b=ICiYuYjYQUHmyr1CQpgLn4qLE6624dnhSWAcuAEImWXDXevqR6VQwYve/pc3zdwlxWSD
	 hN1UvgoTwd3VIoNuQJ4cc+yU5vLYVqKZQmaZBtlRB+58B7shP8ZhiSLXRTfL1LUZLru3w
	 rBlKBG736jgl7Pec3jCZi9AHXfJ22mkYaL9hmsKh43UwlHjFbdm00pxDVChlRIO5uDoY+
	 x8pi7W+Eq0Pp4PDbGZS5C6XDZUBeduLfloYWLRvgC5mN8+rsgf2nmfJQB4ShoXWhIlk1D
	 NWpUPZub4mZryPntP898u4fxt/Blo8FiIbz4y2+tXHCeC0BbEFHaMoT96ml6APiC0+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495471;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=WPYH5eJzAisIOEp1pjCJoZqCbTGKIzLWnktSJcS/LYc=;
	b=pQ70Pllaed25x+GBb/hJy6U36j+V8dh2GFSFwyFyAYwDMEgFcQjXsQCCaIbklf37HO8d
	 ugtq2ZzHhpiFWYz+fuRSBeC9h97VJD86d4zm2IXvwcSeSA34Q6Ghe8oZ8JGNE3J0wI2Yt
	 0phKdZq0ejQIyCtskaHbKtkUcQwGEV3ndLk5vV/GhE6+XRP8cO3YXhrZ3m+7Fg5WE2HAx
	 lPgvkSWViGRUesTD+lwzQckQsxJpHbAL/YKPa0MrG97QOnrpf4BMx6POm0ZdoNZJE5935
	 AZR+L5NodAAvPXSXub3vIFPFh3ORcVcfll9HvFgAW4M6mJxn+CBy/XCwb1w96c/AxzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W8AYzVgc;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C9B606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C9B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W8AYzVgc
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 978161A1295;
	Tue, 20 Oct 2026 11:24:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AA3460393;
	Tue, 20 Oct 2026 11:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 910C810328BF8;
	Tue, 20 Oct 2026 13:24:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792495462; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WPYH5eJzAisIOEp1pjCJoZqCbTGKIzLWnktSJcS/LYc=;
	b=W8AYzVgcUXXMyE2vqRY6IUNDBTT8EWJ+rlvHhYdj949JwsCr4CW9KtROwxHXXDvIr+GHAm
	keCsUkflawBRPvMZr9ofeHk6qUbty2S61i2g/895K/Gp/2s5Yk9CbQn/VVJm2fix4e9Uhk
	mt5qfJQzWZGZCBVYZoIv4cCv9FCiXYFFHbu1nwzSJZWyKH1GTKQrlRuPIlCYktNahC9EF2
	RHVNM6F4W0Zp9xRPhHRjJtX+wJmTN8UdWpxzDVqrNd+BcYWd98R4YPEeVARcQyfzOCJ91m
	jrWpp2ZN67zmIjvGFNbO6v4les6kJveWyUFfigtvtcInQBFkY85hY7TwTfwKdg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 13:24:17 +0200
Message-Id: <DM9MLWZC070K.3PS5NTIT64D25@bootlin.com>
Subject: Re: [PATCH v7 1/3] drm/panel: Use devm_mipi_dsi_attach in BOE
 panels
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Jessica Zhang" <jesszhan0024@gmail.com>
To: "Osama Abdelkader" <osama.abdelkader@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jerry Han"
 <hanxu5@huaqin.corp-partner.google.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <cover.1789994813.git.osama.abdelkader@gmail.com>
 <e9b653b02636c19b60d1153ee78284a8b915df3c.1789994813.git.osama.abdelkader@gmail.com>
In-Reply-To: <e9b653b02636c19b60d1153ee78284a8b915df3c.1789994813.git.osama.abdelkader@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Osama,

On Mon Sep 21, 2026 at 3:17 PM CEST, Osama Abdelkader wrote:
> Use the managed MIPI DSI attach and panel add helpers in BOE panel driver=
s
> and drop the corresponding manual detach and panel remove calls from
> remove paths.
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

...

> diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/d=
rm/panel/panel-boe-himax8279d.c
> index 4a8560b4b899..facf37bd1c14 100644
> --- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> +++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> @@ -851,9 +851,7 @@ static int panel_add(struct panel_info *pinfo)

As a separate series, renaming the functions in this file to name the
driver name would be nice, e.g. from panel_probe() to
boe_himax8279d_probe(). Would be much more grep-friendly.

> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu=
/drm/panel/panel-boe-tv101wum-nl6.c
> index 150dff3ab6c3..cf9f15fae272 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -1736,9 +1736,7 @@ static int boe_panel_add(struct boe_panel *boe)

Same for this driver.

This patch looks good:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
