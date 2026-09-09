Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C59378D94
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975524; cv=none; b=vEVgcsnZSMttGek7ppxzCF3DHoFezfrzbKV3YIxDvRO/S4Qh1PbLTk1oOh1xmX7LSUQ6eSZOwF/deaS+cLSKOToCBsnP6guh5Q6VFIdEl3YW3zZfn472PcPU9aMRF0ly4VzVC7qopDZFeg7h+jAw2dvCU8ACyTn0a48YFYIpUmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975524; c=relaxed/simple;
	bh=CjKaIa/iJ4VYI30C8aabovI3O3H91VbS/IgqSrHz7mc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NdG7quhUe4uPHOxsetG5XPcZ8m2QpammUhswNBJkYUakUyX3lTAQXGX0w/hMS2gBOvNnNDdAqguidC7J/p1LDoavJLVhK1SQ4F6wyreIce2tZ1HdEkkAEU1VvGbwuUUyPQJB5Tiw/gbnMzi3h/Vw7vVbS3jGIRuRWoZbp5DAztE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QelM13Mr; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QelM13Mr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4052E4E415B6;
	Wed,  9 Sep 2026 17:38:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFE9660448;
	Wed,  9 Sep 2026 17:38:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FA4011C7918E;
	Wed,  9 Sep 2026 19:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788975517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XF4mJSC2uWSHASV0wNm363y2tu47XHGouTpCiJXXoCQ=;
	b=QelM13MrQPE67bZtAJY3b3bIccIgUfM1qnEk8SdqSH4X17df4R/qRzz6oX83xdfHBC46ab
	2F2QXrbhsDUF+cE1vCf0VfWez++s2zsOcnmYVG5Cvo1mppSOTrMogh7fhBCXPUD8hIeEXT
	yHvjj42WAZ64rLzbXpB5XO7NVwdwptl5+VADUX4Rk4lUuLmVEaTWQm9WJaZ6S8znoKbH6P
	wHEudmnOn2uMDSowz4JAI0ww+uENcqL/8Mw1Q5TnkwvyPI/Hs51365XwX07HaBerikfMxP
	Rtfqj9SP+RHpH90EfZ2xzESzEObrgQmgg5Mcv5oy4khi873q91hAnXDTj/9miA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linusw@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, Marek Vasut <marex@denx.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Esben Haabendal <esben@geanix.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260831-ti-sn65dsi83-fixes-v5-0-e712765d6c4f@geanix.com>
References: <20260831-ti-sn65dsi83-fixes-v5-0-e712765d6c4f@geanix.com>
Subject: Re: (subset) [PATCH v5 0/2] drm/bridge: ti-sn65dsi83: Various
 fixes
Message-Id: <178897551198.1624291.16259294756475360270.b4-ty@b4>
Date: Wed, 09 Sep 2026 19:38:31 +0200
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


On Mon, 31 Aug 2026 14:21:31 +0200, Esben Haabendal wrote:
> This small series adds support for using SN65DSI84 in single-link mode with
> output to LVDS channel B, and provides a fix for an error-handling
> regression in sn65dsi83_reset_pipe()/sn65dsi83_reset_work().

Applied, thanks!

[2/2] drm/bridge: ti-sn65dsi83: Support LVDS Channel B on SN65DSI84
      commit: 0878e6053d01d87c75bb1d00b0187e8a2e105ead

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


