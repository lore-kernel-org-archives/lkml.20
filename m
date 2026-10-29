Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793302253;
	b=yYQiBe2Q39hhGvtUEKubvoLRNnXVII53KpClT0ODhirorg34j5LXdtu8+0/++Jw/IVHI
	 Ob5fZpWdz/dG1jh0S8TpKphpOuXkHUBThcgGx95SvwzFOKCQMCUhQ9qV6S9dbgmWIklZh
	 xmOt/B2ksEIlDpMvLHUJfCaxgA/fXjvNZi2cNhPaki5Pp43s84Icou6EWnPqyXnTL35+Z
	 +0iUwgwfQDoquJYA4NCUhDHHqD43673lBI60gqSeL9jFKlxjnaQ3gcy9v8wAxrnr1+ovX
	 WO+qVFfSLImczDexLQuiQwqbuD9MG3m0yhGv1yN1Lec0hdv923BpeOUEFWXll/DWmLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302253;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=5Ll62Av3zqAK/UwbMKhO8aHQhK9NIEhSdwE8ZCKZZSM=;
	b=E24huirNetksW5NjxrbAsD1GnbHmnXumSy3fO2Qs812lAF37VCY5DhzRcdQMr5+BX66V
	 9lj9nHdcuagwaQgwOVpTuOf6uSGQQRe12n9AnTFNFKGXfzpH7OjTNtn7JpKPhtDeqoDut
	 DimXJhFyi/cbp6jhdeIzCGq2ZjUWOQBW4TUlp3CbVcboOdYTyt+kCEqEAJRLqolLpGeyD
	 P5NTqbS9WhRhcYcYPzPxGe7aHErXr2eYlU6eOEbSyek4djnKLjfY/vuFOoz0EjjibRPsm
	 3tfq55YAp43zFvs00yvYcPMCYoyHSSqpnpuaSd+fLoeQs77+8FH1A7LthVtidubSpKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BcxkCqPP;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8220B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8220B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BcxkCqPP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 168B94E41399;
	Thu, 29 Oct 2026 19:30:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEAF76076A;
	Thu, 29 Oct 2026 19:30:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12A6B10328F94;
	Thu, 29 Oct 2026 20:30:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793302237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Ll62Av3zqAK/UwbMKhO8aHQhK9NIEhSdwE8ZCKZZSM=;
	b=BcxkCqPPeOZNlzvUkt34zUi+bPlBrwF5/ELWAjACOSKLOEqu5ZG8BwQ5THjmZir8WXDnia
	KtakL2n+IAEfH610ac1VwmOjNYM4/+sPGZWQ7qkz66dfKFBgX0E80PznTP4W4oPiXQUGDm
	B2Yl9wZfaBDBuNoxNu/dI9EH6NggUwaAV7hpmhtV+QZctGjVyNGTrrSBz7620nTwNJCe5R
	v4KGhscGj1vAlNEpblwwc1W4D6Pq6gF2eR8o81b0LMUw2QMDA9YrPEhRTqWN14Bse7rY4V
	3pkdHWZ4JSXnCP7dClBjXtpe7bwC+8A4vmkHbtpUc1ptRinSDxllx0HqogqSUg==
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
Date: Thu, 29 Oct 2026 20:30:31 +0100
Message-Id: <DMHKL3TFB3D6.10S4BKS9F6TXJ@bootlin.com>
Subject: Re: [PATCH] drm/bridge: fsl-ldb: return -EPROBE_DEFER if the panel
 bridge is not found
Cc: <michael@amarulasolutions.com>, <linux-amarula@amarulasolutions.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Laurentiu Palcu"
 <laurentiu.palcu@oss.nxp.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, <linux-kernel@vger.kernel.org>
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>,
 <dri-devel@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261029144132.572020-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261029144132.572020-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Oct 29, 2026 at 3:41 PM CET, Dario Binacchi wrote:
> of_drm_find_and_get_bridge() returns NULL if the panel has not been
> registered yet. Returning -ENODEV in this case makes the probe fail
> instead of being retried, so the LDB is never bound and the display
> pipeline never comes up:
>
>   platform 32e90000.display-controller: deferred probe pending: imx-lcdif=
: Failed to get bridge for endpoint0
>
> Return -EPROBE_DEFER, so that the probe is retried once the panel is
> available.
>
> Fixes: 802372cf316a ("drm/bridge: fsl-ldb: don't create a panel_bridge")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
