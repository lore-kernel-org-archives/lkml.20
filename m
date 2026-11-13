Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794556464;
	b=yWq2RmN2jeTREC9sIPsBoUBaUgs0hMbBnjhSfojv4d5G/+gLjM9sAbjvo9mU8F36Hsao
	 LkpAvoZMBogo3+m9npOfS2vWCgruPwVmmvZA2Ry6ZQdo4uCD8hzFUllVq0P3nCEfqZsN5
	 Qd/xlXfcmFRHCMRIbfZMwTXOHNP5z/+5mzrtTxbZi9SgK8CIw4jOeChddj6IyR3IAyxPU
	 TIMKfz+dHoN+gvnil7LchRPIyYN/jtZIfDJ7dHdu+vP4Xrlfnqvmovxy86qX/GaWvdGk0
	 dQqZI0MP9E/H1HY6VZk4GbuVo6IPUEhbyRJf4iehN4/zhQsiFRwtQTKJ85qxgCHOT3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
	b=BFyG+wF4ncWxyyyHKsTRMq7wK2y9cwl4D2WMrzyPpDU0AW25eH4hdHkln9Lx94zOSKYD
	 KmceBxbpw4NXaY9e1JvfMsJRSiH+Ksq1JZd7jsPDz0+8fdx5BMzhksYVhwakjC1mpOjoK
	 Y2BH1PLC4tssmfRTEdbr6X0EtD7Y1CdmklAcWWGMffw+ImgQTHuiXs76rrLJwLmwAscWL
	 z3nFjWYNBwodCqUWM3Tc8qAemQ9bU+WJ4ASWcvdixC4iZiCHMTWZVjgCavJU9tHvYuJtC
	 3XO0lE3Nh8scfZShYXHaNizO0AF0ZKVL6YDCRxf0ulEQUo04KEYGZ7+ZHYyJSNOLs4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWBfalc5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A05D606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A05D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWBfalc5
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso1352281fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556463; cv=none;
        d=google.com; s=arc-20260327;
        b=TGOhBc9dThBYD1nm6WNlAZwDth/tLvm2mSvhBawv1BUUQxHvEm2qZVnxmqYpy3JlMx
         N4n2MYBtU+ZzczKc6MSPmyGAoZ/rO/bDTbsyjwLqzLeKNgV9ko0cwm8iN1P4Jlpg1biM
         brgJYbuwyCNpo0JDmj/4ntudCjncJlE/QSWX0u+BuBt/fOCEx60SzJzvwDFTaXg+MaUI
         4i3V1vIQ9d2e+OURKKA32LTb4Gcj+561Ey5lcqHgIrlwfFdmE+NQYoGIhH3w/+CfN+y2
         nQYO1QtIrZqK8fZrkka6SwisdP2qLmjZLGy86N9mwliNxjmFHqBMGa8ksM8NdFExmzxW
         LI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        fh=a7o/APlawXzo0BZSTdWAEaabe8ZiBb/6E3p4rLaO6dI=;
        b=e39xWPz6zLUs9ZurZcmGXo3VdLjpI+iGyn3wX4p9RXrQfRIObXNloV8jsi8/Pxwsux
         +tybBcl/bVejqEUeP1lYYkY3ggvCm4QxE1dLwQXZZpBKeuPuu+lDrQfKiSZoDL62dBSD
         DHa3xpbOb1OafsaR5SEXt5o2yeS2J7uL1i6nz2glog+XRlsxjKh0oEph2efSyAGL1d6D
         noy1bI0FO9uHgQryF8xT/JhO6VznHqma67mEDazEIkr+YMhhMvQXoWGMWjQNNXS4Kl4y
         qaxJK8mAfi8GIs7rwhcEbhd2BrsQ8HnJ0UmEiID5ahWd0NnRGndhD/H0bm+OOwz9AHWi
         gvxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556463; x=1795161263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        b=lWBfalc5odhHJQWPB0IRkDdkAm39vie6sBqtg8GNvSOoS9CHH/JhdjaTbIhIyVAckk
         GC3OB9V4gEMXN+jAMZPKOjBKUwtvBNfCBZHLMLPWFlZ3YzpBiIHNu7ovHm884isdQsVY
         CqP63Ase+zOCljdTJKMKuS7udyN5XNbtaORQGTZgVgSsPqnjGz+6+nUsQlEJAi0h6UMo
         uIpgGhI1fWB4yZ1mZLyTLJu2gAHkLxAT5Ygda7E7aNNiSzbg8tUH7yXumwmJQMVcoXmb
         cpygLUps/5aVKjZRECROZAlcCSnUSF6i8qCt1tPQgGDud5mnI9ml5bPRVixIOjUqthxr
         KkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556463; x=1795161263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        b=EbYI0iSwGSmGBtyKouXmhv0z5gx2EN0Degax3krOcBacwpT98lqNPn68/yOejgA2W1
         WqHpif6h+B/CXR0Wq3K9ui/mk7getRuGCH51uCgSP06VI5I9Iu3PQaEQUE7dEzqjhoBK
         9MDSt3qEeJcOEasRMCYb7Fndu4no3d107+/W0/hRt48CYISLUqK2n86aPdomhSt+CrKa
         UF3W895vzhKkMkS6Ick/0W9fdhC4pwUwUHzHSyagmX7ty1bvM4PKzblOsRPvdwRWv6pZ
         eKECLSQVbKY/GKcMYuxUYF5CJNSnaamSnond9JKeVhVbZYwTKremLObRGG0RVm2KASmo
         tVTg==
X-Forwarded-Encrypted: i=1; AL+hErE1wUpS9hYie+YycnUR7V1sljCAOL1iIlfE3kMwY+22qWivB5ZpMpTxWhFr5999qQ5izOay4EIXj0isn7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FfgO0eNDy4OabqOFG3WNVCfwmRnQ10xyQ/3ycrdUMJr5nR32r
	GLckHjCEvvX0HsxRenqwAho+ChBRqZkLTgQ1a+7P6wx29ipSHaiXdI4GEre1DI19vXkliptGb3m
	tX7YjX9Wez+EkVlZrLVZFCLjJIr4BZNg=
X-Gm-Gg: AYBFou0wnLl2Lm67GhT+bUXri+nJ7tppZhu4EPqSru2p+3zYX+uGVVhiAymIaZnYgxq
	peYTIMt//jb3oY3wEYayJI3nmAXnlNM55yMP6uPhTl7Vm8q5eJek2MbASImsb4bXzB3rypKMpTA
	xBEk1kq+bd+zc3/ZBkXnGXCiHnDaf/DJ4iV/SPtfA0pAe2znGIl7QPWYTsmGMzpyox/sIKeaise
	8IRWFaszMw8/Wi1ElNq6gP6LkVqYzcpeNxXw834PtYHspYiVqSsdkebUSm5l65U7/EtLkTjr1nj
	ej9M9/GmunCdFUq2l2hwjQqjAVMOhcNkILRMde2NkbSvbu3BtetcRfBcYvBsb7PXtPus+SnQ7FP
	FhhrGaqC7SuigLS0SuRzfX5bUzfGlZv5k2Iqh2OXCLyhMKAcnn8IUC5D4m+eWxOry11R0HBU=
X-Received: by 2002:a05:6512:3da4:b0:5bf:ce1f:cd22 with SMTP id
 2adb3069b0e04-5c170434e66mr787433e87.0.1794556462452; Thu, 12 Nov 2026
 23:54:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-2-18561fd48838@gmail.com> <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
 <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com>
In-Reply-To: <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:54:10 -0800
X-Gm-Features: AclHuK-bvo5dDl4JVbgBvuOoQVFelHqw3mvt8zCrdDgOeg2cHm6xn5vl5OrzWyU
Message-ID: <CAEy9hNU2ox76TFKtdisqUHDxZ=3gPVBDBcjz_W8RtCpCpK5d7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: verisilicon: Don't hold the VPU in reset
 after remove
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Le 12/11/2026 =C3=A0 11:19, Philipp Zabel a =C3=A9crit :
>> If vsi-iommu accesses require these bus interface resets to be
>> deasserted at certain points, why doesn't it request its own reset
>> controls?
>>
>> Depending on implicit assumptions like another driver not asserting its
>> exclusively controlled resets seems fragile.

The AV1 node lists these resets for hantro only. vsi-iommu would need
them in its own node and binding, and both drivers would have to move
to shared reset controls. Device trees without them would still hit
the SError. With this patch hantro never asserts the AV1 resets, so
vsi-iommu no longer depends on what hantro does with them.

> There is a side note on IOMMU doc saying that once the IOMMU has been
> enabled it can't be disabled for security reasons.
> That means that writing 0 on VSI_MMU_AHB_CONTROL_BASE register in vsi_iom=
mu_disable()
> could raise an SError so I would suggest to remove this line from IOMMU d=
river.

I only see the SError after hantro_remove() has asserted the BIU
resets. vsi_iommu_suspend() does the same write on every autosuspend in
normal use, and that has not faulted here.

I don't think dropping the write is enough on its own. With the resets
still asserted, the AV1 domain is powered off when the IOMMU suspends,
which is the fault 8e26d4c20ed2 fixed for hantro's own suspend. The
next bind then resumes the IOMMU, and vsi_iommu_enable() writes its
registers, before hantro_probe() deasserts the resets. I have not
tested that.

If you would like the write gone as well, I can send
that as a separate vsi-iommu patch.

Arun
