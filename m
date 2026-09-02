Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88809481673
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365162; cv=none; b=mg+1lKwMkmEtVOOHgp4Bml2xmFeRebMw8xXBw5PSsBxVz3dcdRBdIPpma3zTCjrsMGVlTIOWxJSQcyS+UkCxPwxwcfHPNeT9hBlZcZyi+sJqOq29GsXGjOHsdWi2IJFv/Oxg5GP1Yb4Yd9VoZiscS8IZJmYTGkEU0ChAyXdPYKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365162; c=relaxed/simple;
	bh=ZCs63xC+gCv7Dq0T6TcvApogpwzcQuJZNjKqg9ralfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m0v2fJnsMvrJlVyFLBUM2iqQXYwK++nW++wIA7msdqWBxzay/GDvljYgWvpGQkYXM+edhjmXp8o6g0hOkjWxpp/bd0wffnHCxvoY/LUag5vLi2hHmdvNTXo3taZyG4uwyzu666GVCLgOQcLlZdZoaxfMmvlO4M9sCK2Kf9Lwodg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wwC7mXp+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wwC7mXp+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9D7E14E414CF;
	Wed,  2 Sep 2026 16:05:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E1676053C;
	Wed,  2 Sep 2026 16:05:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF52511C798E5;
	Wed,  2 Sep 2026 18:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788365151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zrTzfkQqRLDTUVVyeqa+/n/rEVpaf0rA4DIF+ImO+2k=;
	b=wwC7mXp+VB0uLYlpg9djzshEQUQv/UztrIRzXTWR+0PW19TDREcJA7ZmVRNbBTgnG78OVM
	KpaJvu6TDq9Ja/Ozphao7smMFFAHSdHDJ7I9Rn80y4em09CoyNpmiqtg3Ntj9zvOsQ1yVP
	yaisdWOmrg+SaJCedNyq41opZhsxMqy5g5itYd0D4IItd3IPlgkSq8wzDfR7+RHMsCmjQx
	hsU0w+R7h5IpD8xwgBDA1t7IVoEH0grplS1+RUpVmWrI2NUX85zeIdy15EZtJmTGthG5bz
	88CVjgED5WP6ZL3bNePYy56S+b761oQAqr+HCRceQ68u8lNxEm+MWvBdS70FFQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sean Chang <seanwascoding@gmail.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Liu Ying <victor.liu@nxp.com>, Jani Nikula <jani.nikula@intel.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260819151216.56833-1-seanwascoding@gmail.com>
References: <20260819151216.56833-1-seanwascoding@gmail.com>
Subject: Re: [PATCH v1] drm: bridge: dw_hdmi: Fix constant truncation
 warning on phy_mask
Message-Id: <178836514544.703493.6487349548131419366.b4-ty@b4>
Date: Wed, 02 Sep 2026 18:05:45 +0200
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


On Wed, 19 Aug 2026 23:12:16 +0800, Sean Chang wrote:
> In dw_hdmi_probe(), casting the bitwise complement of (HDMI_PHY_HPD |
> HDMI_PHY_RX_SENSE) directly to u8 triggers a compiler warning
> (-Wconstant-conversion).
> 
> Due to C integer promotion rules, the bitwise OR and bitwise NOT are
> evaluated as 32-bit signed integers, producing 0xFFFFFF0D before being
> cast down to u8.
> 
> [...]

Applied, thanks!

[1/1] drm: bridge: dw_hdmi: Fix constant truncation warning on phy_mask
      commit: cb6a133bc75bc4c5b25f7c278b6c74bf46a3d71b

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


