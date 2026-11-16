Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794798083;
	b=nynudEam+lpfP4N4sh3wJqWpOPoV9qKUp/djWG4eQgK7zRWrmXWkeIencMQh37ZFKXuF
	 S4yOuJu86G6Twh+E5uOJrbdadUsfmqkUNZAuhqQGwVGdV/0a5teYB3ii5UPaQ6+lwvqGL
	 BMPGeKdppfFbDq+NOVqIikePqcDpLdYf6RBWfdOMWl/xrXLaRop19q2ilHr1DPz/qDZ02
	 zAVEe5VTaO9rSiIOgV0L5wRtRCA3eAvcp2Qz7Nqms2t8J2qaWdG5QS0IjFW+lcmY3he9y
	 l2KvZT4F/BWqDso6yNrS99fWX5IEf6ZSQDLCwBpncl4/0yLv3+QbLm/CJMeEklpA1aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=;
	b=diYVuyB262A7X+bwWLZuie+EUE0B2YUD7tgjulOoFK5r8VF8g9gsJ8Gs3T3auNXjK5f6
	 taKDksZdv4I2dsc4BctBV2XRkoptKH4cf3zzLpCcTud4gcxvXyyAazyP4dgzDYzv8bFj5
	 3rCqbJUiv/yQAoGB7NGyQrnXQbpBpytuDXzD3mmy+3e9mZg7go3NMSGZQcqfzo9zzVT9Q
	 LBpYs9MwCGr5cOJ1PcASHHhdqKtNEO83vT7lZcNgZAqMyLB9AxvVs12+7QNTjDBsHTIbZ
	 c/1ynRGDVwNiovvvnoQ94aISscfT3A8d0uFbG6wncjH/iNnuULc3nuxHOPxKWEZA4pA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLeC5wjI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427C8606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427C8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLeC5wjI
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b56521181cso413712a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794798081; cv=none;
        d=google.com; s=arc-20260327;
        b=egMwzaQ2SeNNXRJ2oqo/LorkwfQjDMX+pfXOfuvOVcjQ1cMHZi6dalhepitLwC3mxo
         Bc1Mi/eG4NnDn4O4VmJpYAEyd5U1DFfejuWMnwa8YHkx9s7p1Z66wHfOYRbWMPhb7DX3
         E9LEF/jQATK1AjxgltGsGOJBNk27Y6iClf3hiVoIB/mnSDahNcvA1qlDGQIcmleEElSV
         n2GthjEjPp2hke2Tq1J1goKtNF5D2UaxJ7Y5pPPPfyk7sFrnr9tMd3Cf60gwMcl2PBxL
         d3qxp/WK/sZawLeP86obn7MOud345yFAsx60nc0lSug8TGpFRV4Lqx32FwFXhApF35s1
         EtNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=;
        fh=unj/hWMyPk5+BWl9H+b2DQ9YVUKhjPUuZuWx12EtO4M=;
        b=ACm/wJLEbSYVUPkaXiXiWiUR52sd0pZXkupwTbzfT7lKzuU1s8KVqrpsBZzCzgp4iU
         ogK9WndxGhZAtlU6VjMpo/8b+UWJjTQAjSP+otPaLfcXpk0uWlBra44khL4dzGbU/1u6
         qdpwuDV8VI82lix9m+vnGe30hpmVORvO8TCU0vFC85xzyZvbB6avxUWnrB+dPKUK/DJ0
         UPoSaDLY3HiYG4fpPu2eQ80oKc3YiATJ4sB9iQdEI/XmHSmUoSjOERfWR3A3OoY2gWuT
         vgQvBghKpX+wkowH5Rfe8R81fOI3aXTMEopZAWJvMBpUHqPM5KyoMxiWifwUEhyWGWf5
         vH9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798081; x=1795402881; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=;
        b=aLeC5wjIitBTuqiifowBvrM6hxDoACM+Cj+adxHHaOfAcO0Jz+uFR96UVPxJC/Bu+a
         cXtzqWCfw9un3Bt/iiwpEuea4b9T0nVKJXaI/GQnKe5TmZDQDWgCyL6ciUgGMOi1Fjse
         CzaVU4azPrAmoyjrcRKHQsYQemdlyKYZ+HdkjEGVFWGyySPuBYY1RcbxCNjXHyOQweHB
         ED5SktK6krqXW0RAUlwTtUrAKlOW7SKm1fH0ZqB8k2WJ8wocuPFR9Uz+/yzIG+ZthK85
         fF+K+yY1lFlUtvNJlgmDeHIJeQXChyBqLlZCBUZtf3of9KDnBEJCZbyyx6vUhKBQSlR4
         XayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798081; x=1795402881;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4qUheKg2Lay7rkyQAuqzWzkTXaIYOEjjSVeDSogdieo=;
        b=x6wtTSMtkgrIjNBfm/25ogD1CRqgTZn3UaJD+kNgubwCgNVa7rgOTI2ZIN4l4+K6NN
         VjGCSTdWb9xp4e/LGiNiMUtjIUprWCMocnt0kmSFByeH0NGefaCiIMs1N74+ICI6dIz+
         6GVct+yiagLOb9pgMEabkN0cb7MufyDM/fYhpSvVH8VVJ0wUswcmaLjlF+pvAk1lpa4h
         7a/bs2Fv8NC+qQDMHdHHQQ54E5/wLmnG8yqrNOjCte/PcACJHNuULkQZ0qucl1KjkJV7
         sTFcUZlfQORzYnGJQY+mHAFNs/90BdYM/uk9w1CyqBRycxkp4xxNnczUmtKeBgBJdyUW
         8/6w==
X-Forwarded-Encrypted: i=1; AL+hErGwaf4Gg8sC7qGrDNwYqshK6vquhEDfkW7wQN9RCyWH0B+OYFCqGkbF8+7Z1CHFe78v3oh/oDRGeNmwX+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FBCCCsoAZig3MyvAJrx253ALSzuShWwMeSn+wytHV++A9CuZh
	B0fwJIjA4raecYhiSSbF9VeOwHeSRdWIahFbsIp04bkL+o0ia4Vr9H4cFr19D3GW9LiSzDZZQUC
	50H5I9lyZtnbXfxUyunmoW3du5YK4Bc0=
X-Gm-Gg: AYBFou2MvX5uWJGf6INAAxgxgrrrj31cTFKh1w8TqCX3hD8sGnjsYHvdzVTZEpUOWEO
	p1RfBF1SREbLu1CvCR8ACRx+Vmp3T7pO+IIt8ZSDJWzQrbnTC6vV7yC46fl0s/NxAR5L2ZiGDQz
	H1B8eGOa0PLFjC16ggqp5oX3KwxgqORM+Iy7JpRjc/6Nw37KZlqHZA3DAxrSS7PBVnS0AShr8nD
	BxmCcx3/XAT4GWttna+8S1K7hf1OKm7KUIS+6JwioXa5ZyUyZSCP/8iDCXJhYWoStPgbkEGL0zP
	0m/DEAIW3qY6XO1umF23WFZIoiCDkY8Djnh6fT4MhS1kRFw6knbBA7BC1SmNN8dzN/li3IyojMY
	wlO3AlSO30ZxZJznugvKqv0hUE2v6m25M51fWnySl3NSasGfqMxvB5ImeA6aRmAb7fAJJQMLGiE
	jQt8tPZ7YXmeZzeOEv
X-Received: by 2002:a17:907:6eaa:b0:c4d:1768:48eb with SMTP id
 a640c23a62f3a-c50962f0b77mr1233752266b.2.1794798080923; Sun, 15 Nov 2026
 19:01:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com> <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
In-Reply-To: <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 16 Nov 2026 11:01:08 +0800
X-Gm-Features: AclHuK_2CCL-6w7SS-4GVGwc0x2u2Iaps879pDspYuxXhI4Edd6EqNeYrnLX7uA
Message-ID: <CAPwA33JHxsd=nr9F9_KFKWPx+HGaR8P3ee7hxMc8XCS6QY46gw@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On 11/11/26 14:02, Michael Riesch wrote:
> I wonder whether this should be here in the first place. Only judging by
> the name, samsung_mipi_dcphy_pll_enable is something that affects the
> complete logic block and probably should be kept in runtime resume to
> begin with.
>
> However, since _dphy_rx_power_on does not call this funcion, it seems to
> be something related only to the TX side of the logic block, but for
> D-PHY and C-PHY. In this case, it probably should go into
> samsung_mipi_dcphy_tx_power_on.
>
> On the off chance that this is actually for the D-PHY TX operation, the
> function should be renamed "*_dcphy_pll_*" -> "*_dphy_pll_*" or
> "*_dphy_tx_pll_*".
>
> What do you think?

The settings in this function are indeed only for TX, for both D-PHY
and C-PHY, so I will rename the PLL helpers to
samsung_mipi_dcphy_tx_pll_* in the renaming patch (6/9).

samsung_mipi_dcphy_tx_power_on does look like a more suitable place.
However, I do not have a C-PHY board, and I only have one panel with
mainline support, so I may not be able to test the DC-PHY TX side
thoroughly. For now I am trying to leave the TX code unchanged unless
my series affects that code.

Should I move the PLL enable to samsung_mipi_dcphy_tx_power_on, or keep
this error cleanup path and the renaming change for now?

Thanks,
Jason
