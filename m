Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC64756CC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872300; cv=none; b=V16jZ90q4qYTsxYBOz2wSeaU0pOHwMdSGb/x80q5xLTE6zmKJIMABfsKg8fHPifSdMtaH1e5jifcwII8gGk82Y4D/UbGo5ZVoU1fROI+wG9UsR+XHOmkUZ7utJVYnOzEJ4EByZUIIPO/kH8axxeiWb6zPGBA08vTe+Lwd8Ze8fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872300; c=relaxed/simple;
	bh=P8CkQIWj5HcyhZryF67jWCNKYqPLLvoZRPKw+1O7lIU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=If74sXHaC9wduR6t7m/QRF0Bq0XNovxrshtbdZLRMjEaXf6SKZCbwTQGGmqquhn9CW5RLMJ1Ivlynm60wFM3PAngVISZLoa36ENiUlKGt7Mw3Fzamdv5qqZDxlMIt6QIvqzzL0nrPrWrV2sAJHXu7+NRNT+y9p0HxImdcgyQ+jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vTiJeW9o; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vTiJeW9o"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2535B4E420D0;
	Thu,  1 Oct 2026 16:31:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6AD760346;
	Thu,  1 Oct 2026 16:31:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF21B10328316;
	Thu,  1 Oct 2026 18:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790872294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P8CkQIWj5HcyhZryF67jWCNKYqPLLvoZRPKw+1O7lIU=;
	b=vTiJeW9oDRe8HNFFUD2jhR+6xFmder3DG3A2GDGJ5TirFWrz/FsuRKT88vXwinhv7jC6Ir
	/UcdI9D6JH/85wGJGWCyKLkfnpudXXNyfezASoYhK5uOmyrN+krkCfcS470I8/x/9DO5Re
	IoGXOERxZx9MHENpyrB/YjRh7RQGhsPT3Dy40wc4Ox5HlkaMS3HfbSvjxr1jectlZ3TJpQ
	C2TsHUIDE0IHZy/Rcm9zX8vhezU2s8wYIiu/QrJPUFghxIWJ75D2wnk1RNkJY8CuUEC8XC
	ljnWucnwjgDNyXQsJJ7cR7qSO9mH1ZWujce5j1reexJ95C97kbHAnO5CmDZsQg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 18:31:28 +0200
Message-Id: <DLTN8RLBW15A.PV8OJ9089OGL@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/2] drm/bridge: lontium-lt8713sx: Drop redundant bridge
 funcs assignment
Cc: <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Sandy Huang"
 <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
 <20261001-bridge-alloc-conv-v1-2-f0a1fe040a86@collabora.com>
In-Reply-To: <20261001-bridge-alloc-conv-v1-2-f0a1fe040a86@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Oct 1, 2026 at 10:25 AM CEST, Cristian Ciocaltea wrote:
> The driver already allocates its private data via
> devm_drm_bridge_alloc(), which initializes the bridge funcs pointer.
> Remove the leftover manual assignment in the probe function.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Well spotted!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
