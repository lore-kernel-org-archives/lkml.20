Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492410;
	b=MYyBUWQn0R9/33TE+BkGt5Fg+ULspFenz01qETIjX/3PDQrbyPsuD57iIO4EuBV+F0S8
	 BdGxq+ooP7oOim04VIn0g33W6uNxYTOV3jeiNKRZ/YiuBiNlVb0VTO5Lah4aiWWXrBaCJ
	 jxzV16jI4FLRY60mWxWqNCG51YlIub1Ez+cgWRi7GqXbUY4jh0R9m+z5xaKKjhHoshfqE
	 muh5T2lKMKpJjxLjd5/7CnR3IEi0Cw7LAqKtJqToqFbFGNHUM6JyIUJiCI2j0zK2JwlVt
	 0WY6s5sQ8Nn/u7qxxOHgUVlyjIAggMEQZdPyNGl0/86WeSEOOwWXeFtTnLFjDRxMTFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492410;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=xxhdn2OVUJtF2HEE/DiJItd1DbzLWHnmnzj0M802xSc=;
	b=EumpFAKF1uRPwQlyCJlmO7nSgOW+GJeQdN8/xAipzPdIi7Pz2CUpllKtlIsS5fmaFuFP
	 YCGY8XAwiCb4ajkji/x4TtbXl/bIS/2u4LzGgo4x6iH9y07g0yPXn4o16OiJYJRThsjBU
	 j35NLx9rCO2MTB+BuHaXdlS5VUMrQpLLMbO8Rtw4bFmSL47+n5eIgYOz25VGxfN/MWKTT
	 xCCeLPNCL8yRzCbQwpw5tBdf8oyxqXoBcvLSStY6N2bPq6ZFJ0aRGFNdvNypt5PlwRspl
	 HLGbWI8/TgmEL3NC0IcZaXmkG2oefN95jH22xQo28hy/VEdOyh4NL9Lnm1wJ/G1ZLuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BzEN+6L4;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E458606A320;
	Tue, 20 Oct 2026 10:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E458606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BzEN+6L4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1792492374; x=1793097174; i=markus.elfring@web.de;
	bh=xxhdn2OVUJtF2HEE/DiJItd1DbzLWHnmnzj0M802xSc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BzEN+6L4Xb5b735YRuDWr23IsYY2jdjjZ/xWH29Zil4mTVNrkgJbKCfUs7DAHECV
	 yk4dZikoi3ZuEl0rAC5vunjnNvbbRHAU+S+FNHCmOBUeljJ9KB+5p6OOVeE97JGaV
	 yBAhT8A1r43G0rMi5P6ZaXAVYs8x8esRhWc4RDcpJTYMVZkVdofA5s5Dt/n5f4J/a
	 NnitKG+j9Z9UsoktDgIP3Y/fDSxHDJ8WQDYoTMOb2SdR+itWLCtZBfDYo1AEvXmHd
	 9+eaQYs1jFh8KIeRzuMN434LkAyLEMedz8h85CEbfMAyg552k1MpkKV85qaYhg9wQ
	 nCyhiaJz9Cv8Y+l8hA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N5CQh-1wZqhE44Ob-011DnT; Tue, 20
 Oct 2026 12:32:54 +0200
Message-ID: <312bd510-03ca-402c-aba7-d1c60188f926@web.de>
Date: Tue, 20 Oct 2026 12:32:38 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nishanth Menon <nm@ti.com>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Tero Kristo <kristo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, LiangCheng Wang <zaq14760@gmail.com>
References: <20261019213726.4145532-11-devarsht@ti.com>
Subject: Re: [PATCH v3 10/14] drm/solomon: ssd16xx: Expose session management
 as plane properties
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261019213726.4145532-11-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AAJarhhkiBAz2y4aW+ppvNMAXpTP4N19qIpvKPnuVgBlNGYQOEH
 4vxBCVgmwIR4tF5K665MQ4Lqf/GG0wTGeraUFqyRh5NveRun+RODho46Hc9TlPB4uH9dU6L
 2hgWjFO8mUPhg7FhFoD3rEWitidBEQn6rpLZZH+MJj2xqh3G1XyyfZd3pzWQqeSUpfY5bTL
 X9YYt5W9w45IOSv5E9O6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r8m82L8B4u8=;uX5H6hrlye9LF/CYLwqMGj0RM9p
 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
 NWeTafeQ==

=E2=80=A6
> +++ b/drivers/gpu/drm/solomon/ssd16xx.c
=E2=80=A6
> @@ -1619,6 +1725,8 @@ static void ssd16xx_plane_atomic_update(struct drm=
_plane *plane,
>  	drm_dbg(&device->drm, "plane_atomic_update: calling fb_dirty rect=3D(%=
d,%d)-(%d,%d)\n",
>  		rect.x1, rect.y1, rect.x2, rect.y2);
> =20
> +	mutex_lock(&device->lock);
> +
=E2=80=A6
@@ -1693,6 +1800,8 @@ static void ssd16xx_plane_atomic_update(struct drm_p=
lane *plane,
>  		device->border_waveform_pending =3D true;
>  	}
> =20
> +	mutex_unlock(&device->lock);
> +
>  	pm_runtime_mark_last_busy(device->drm.dev);
=E2=80=A6

How do you think about to apply scoped lock guards?
https://elixir.bootlin.com/linux/v7.3/source/include/linux/cleanup.h#L332-=
L335

Regards,
Markus
