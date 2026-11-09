Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794233807;
	b=JufDGU4m7w3VRn41SWoH82ifmJQZUBf2Eb0y908sf7eASRJmGqhfgfQ8Q5UOES/HkHV6
	 WIIXbWkuvhInhJU7qa617FSOVUucQ6Ho0ybXVvaK1Cg70v1iWKoNidXC92irVEFx+HQAl
	 JtV2/XZDWmBJqghvcgOmY9nWD9seG/Vu+FgUspzcHkxZuvB8BUwXzZ1aWhosH950Q9o7n
	 ADVY4ixL5C8Qi1LG7u0C917pLMSD5TerhfAdLTCjvePg3DNDiEULy5Ji0kvrSiUtURUPv
	 tuZ6YoHCXZLM6tLImigRSNStwSziQG0jlHcnK7+I1Tssjh+vukguODIIHdDoSXFu8dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0Es11pjpc3vZGasBDVSFJuT3wSMxl4W5FtFNnbP35PY=;
	b=VgH94dH6SUU6IpDz7eB01YEWIGrHQE7Hdg73eaEd69sT7uHQWU5ICjJ1qimJYiEFdxHI
	 lMVAFld/VryVqTYOHY1whKDckWsIcL/KgeBRCwwygHhrr96CVIsCsKGmcgOOL+GI4s0q7
	 je2dKKUR+VtBwNVjAWoD1b67bQyefQWdViez3TFkKtPoZr9rSA+p4Idb2rhm1Xh2ZGzbR
	 ilKPFKZtg/NG63RSt0O1nVj4QDHcwxuopbxiA6/clAhLi+ylbWl5dM2nN5nz6wCvjjpME
	 d2V6yE4+VtDy46vP1bEbtL+pAyzx8W3DfUTIVHkiR6EPD329wjHf126kef2eqKH0JSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIG9xiBh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16168606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16168606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIG9xiBh
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a058315c79so385689b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:16:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794233806; cv=none;
        d=google.com; s=arc-20260327;
        b=horIXDC50PcXuD+449lmH3FAS7eTUE97KaEhdCmjJtp8VLZ/5Z++GbFW4jlVZ+oX/I
         fHL+Yera+OfVW3afFH3uKWUXjUSHXyC3guAyEbWkNRaUjIzQ5hugFa/2tuKNKTwV8jxL
         HNmHVKfGFQW3oPFdQTMEyKf9+I3djwcJSpozLQCoNZJL2Y8/MzKkV5shLZcTODvFdCO3
         OZ583VNJnxd5miwb+dF0MPwbq6vohdVWCTFvn5UUnZGv1PSrDrx6rftdRPnSlGXWUuIv
         dUcS1fUuViAnPDM2yC2rlRugSN670fdA1/KySueDuxMdFacGfnmKKiWRMFJFeFsd1cio
         dbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0Es11pjpc3vZGasBDVSFJuT3wSMxl4W5FtFNnbP35PY=;
        fh=xdnZCYDUKwsA9I/sFSI9/gsAikQZD+KrUzR3+p5Y+zI=;
        b=r/7CEMiXOSWeNCx+q7NXU0x23wNO9n6s3FC1f5ofIdBoQPUAvGDtjd7c0Bsr8nc99G
         J4ZBCrSejcnjTOynRYkRCqEokuN3/oiyAD7pTOOiC0ipyRnDaKzw8hSnIKHUCHFPlLjI
         roFGg1STI9e2u98QO6f2IY9ZMuvDHUHQR1Mx7ec9TSjxB/Rf9VYQLLrYYrhNDjsYPwvM
         MJFCG7VpWFgjIfOOC7VTUYMRRDIe8vXKkhZcluGa6gICQLYF9SDn1j3htZGjngFaOZ6x
         4JoG2Mhnj+2gCZoCJvzLoCcPhRe7CYxh+M6M451En3/NLM2q25JzYVADeTy6E2KyI9ji
         njXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794233806; x=1794838606; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Es11pjpc3vZGasBDVSFJuT3wSMxl4W5FtFNnbP35PY=;
        b=sIG9xiBhdNIHMXGNGEvPlbFyZKQI2EPQrE+Fv8IC6A3WwfXP3CZAUockc29tu3EMK2
         TWrWCsyuYMMUrnCVvKIYQKo4JxD8oBorh5q0DQOlcb4BCgSJurq+XSPF5p60lKpn6QGl
         vC1s1pomJ0bsLABLmKC8skzib8mgF3qv+VoRzw9EVoZN5Rg2KFVNc7ERXJNDsHXmrywH
         cYu7s7HtfcWg2HgyYKGYcjSJ7eIK9CyebDcZl5m/A+6tUDgg4uhRLZrfFXD6MZAqzg/r
         v4xD+HEtYOaghGmlISzLQW119KXgKH/sanelKuiGKwbyAqpVKqyWSKutQsvWORit+gA1
         QxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233806; x=1794838606;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Es11pjpc3vZGasBDVSFJuT3wSMxl4W5FtFNnbP35PY=;
        b=Xzh1GUTJvRmwO9iemR2sHOtg0t9NG/MX+rcwHNu69c2nYMFbRpRvFwsKuY2Aqsba7K
         oir5P9p66aHjc+neVmWscnG3CJPd8T1sgNyHElQzWOadZWLWvhudbtjl0jevY4Bfxw0J
         qRZrMkwHAc2qeDHUPrfRQNSKXMLUwNQXdOoRaeG+mg3H3i1RasRDTTLKiwsYv3e6ERGu
         kQcsXujM5GoFC0JHfzaERmxC2cRSVcBW8HbehzKfRb7naOem7x24z+KP6w2johbC3/Ph
         XkRw9CtbIfrh2EDADQE9QZFk8BJLFckGZUCAeuJOMnbhboTgbN87wr1F0XoUMcZROdXN
         Lw+g==
X-Forwarded-Encrypted: i=1; AL+hErH6M8xzN2NA0lRqv3dwIjoucrerDDa/xDvtMhSTmVAul8WEaiFcQwwIhgFqS7IUx5oW+eR1PA9DhLm5Pbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mVGL4VP+nvrryTmut8jeG15KVkm+x8E0FtwmnIHUkihOtZslX
	caNRixfY8Ec4tCrRTWCmJOFRX8zpquf/YZc9+67T7eBQEhLtFDFusiVeFHDs3lQsbDYkv9D20EM
	WXmuUnSxtZUYz4WuVuWdHqEMeKcG4FUg=
X-Gm-Gg: AYBFou2Z52nFRzMZXeMLMbIZ4t7PuvPWtvQixJyLq379EShSu4k7K4fVo8sa208S8Hp
	XGJIkOmFKglaTNa/EmZ3o68PxfQW0TvCZghHRuIqdyb5oeShD5l5tWIG2fjmtTWMimCjUPwqU6N
	NUCEAyxIx9nRLqd+bDsv7DV2cL8FXw9Ov1ZCbpsRzmXpiPvG0V8Fge1ZzJuUTFb+zPQBEbdpxxD
	jwN4zhA71bQIQu2BXJ6y5EVGvkG6xWOeUBfWA8mcd4PQOR/krK54PcnjqqSkJ9F959pfP3pZh5t
	pPoqYmb4SC2mm4OU08VcqUIS/FTWqR+uMLH37rf9pn4uha1IXUtHbTWlafKaIy5D8Hyr7HP/aXt
	i7rjyPnCBtOniLernX/d6Wy/nVpLN9/V6ugBo
X-Received: by 2002:a05:6a00:194d:b0:892:a02d:b6c8 with SMTP id
 d2e1a72fcca58-8b66e344e72mr3247857b3a.22.1794233806387; Mon, 09 Nov 2026
 06:16:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
 <20261017-ov9734-ipu6-v1-1-86eab22ae258@gmail.com> <avG1f6OUHUeHSgeA@kekkonen.localdomain>
In-Reply-To: <avG1f6OUHUeHSgeA@kekkonen.localdomain>
From: Tin Posavec <tin.posavec04@gmail.com>
Date: Mon, 9 Nov 2026 15:16:34 +0100
X-Gm-Features: AclHuK-koBG1Lh2nuzGjYJwOnurULhCfrrBVF7gX4ywgG5vLOsmLI6Sr6IL6vp0
Message-ID: <CAOJcTPXkPqRcHeySMKLB0Tt_LsMTxD+=4CmhhjvBQE3AsELNRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: ov9734: Return -EPROBE_DEFER if no
 endpoint is found
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

On Mon, Nov 09, 2026 at 01:58:55PM +0200, Sakari Ailus wrote:
> >       ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> >       if (!ep)
> > -             return -ENXIO;
> > +             return dev_err_probe(dev, -EPROBE_DEFER,
> > [...]
>
> Omit this error check altogether: v4l2_fwnode_endpoint_alloc_parse()
> already does it.

Thanks, I'll drop the check in v2 and return the error from
v4l2_fwnode_endpoint_alloc_parse() instead.

Tin Posavec
