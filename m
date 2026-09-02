Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2A14A8A00
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366293; cv=none; b=T8bn5AUbimA+nWzKo46XBVW49bwyGF8O0kryN5S2Grbn3GHa2DJUva0/x/aYUmTp8fdJDvpUOVBluzIN4tjJCW0QCXTUMFXaFgW9aWjFxEYerGXiP29gCYxLrx0jWQHjWojKuvO/Z2BxrAtpq/l674AaAR/qatQ32aZvJEpWERg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366293; c=relaxed/simple;
	bh=vfT0gBCdvaFkM+WEDg2/FJFe0widSEDRA4F4WA0OKyA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O3lwKzwFiitQXgw2WSzlc1y7xONgJuz9kcPqxVj8fo9yL2MZ+utoXfiajsfgRNWIabpruCFcMaX0TxzB7l5JdTjpC/CFxxWdP+d56PipUrAWanzDZrMpaOxjkYNUI5Mxfbw8is89YqZw+a58kQZvy3H4CMRhddxZihnTMAAoDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qEQPobQs; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qEQPobQs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C0354E414D2;
	Wed,  2 Sep 2026 16:24:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CD896053C;
	Wed,  2 Sep 2026 16:24:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65A2D11C798E5;
	Wed,  2 Sep 2026 18:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788366283; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hLJ/CpxXuD6ymjaCOfhQB55zWbz7W46bUrSUDWQxz98=;
	b=qEQPobQsuSS1W3WnE+pn3kyGDUNRCKh/tfOnc09s0U2gLCWggput97YZW93UfrWS7UEqdx
	uhFblnOfLCVLJjzi8jxI6wHcN82dlQdoSJpOVloHidOKekKqmf3XDlO19kNLzub27a1I0p
	rxPKeLNZxAt88Q0fYuSVlmqxZQYeyKmfM4uwq9S5BdJCk683Tauiwd4fB0RpMMA2+yJ8n7
	eKl4RfzqYl79lcqrUlhhMDsq2AnPec2pFUVqEBC5BfpxEPTizB5B58hidT0rW9oiIFgphN
	VnExDr3vLLTsXzz/o0F3hgfoCXeWUJOUXXz4p3WwaU8gKdgo414iJaSRxuZ1Iw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Michael Walle <mwalle@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Osama Abdelkader <osama.abdelkader@gmail.com>
In-Reply-To: <20260812151000.74799-1-osama.abdelkader@gmail.com>
References: <20260812151000.74799-1-osama.abdelkader@gmail.com>
Subject: Re: [PATCH v4 4/6] drm/panel: Use managed helpers in Himax and
 Ilitek panels
Message-Id: <178836627813.834353.158292906822547823.b4-ty@b4>
Date: Wed, 02 Sep 2026 18:24:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Wed, 12 Aug 2026 17:09:59 +0200, Osama Abdelkader wrote:
> Use the managed MIPI DSI attach and panel add helpers in Himax and Ilitek
> panel drivers and drop the corresponding manual detach and panel remove
> calls from remove paths.

Applied, thanks!

[4/6] drm/panel: Use managed helpers in Himax and Ilitek panels
      commit: 44b944ab41afd9e490fc99014afa21ad0af479c6

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


