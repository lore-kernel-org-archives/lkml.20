Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794688138;
	b=IlaD/MFUh5VTzyMuPlYSl/X0S6BlPFBTanoReF5+0R4yQIdtjzkXyrX74Ozb2uefNlLl
	 2NfoabADDrgxnb5QbuXrQBrr1dVts6mcyuLzQdTXNeGIpLXE7DpFIEY+u7IFbZpkSTt03
	 MMJ6DwyLzCPcpyiJayVTChjfUba9+OyD2QV16poLDPjn8uLjb12BkCByoUk6/rFxUwgZR
	 VCyE8X5Th3/0fx7wjlAINBqmSpTiVSRaqIQidcEG+4Z7Nn6G+XGDfscuFEQPqqZSjmvq5
	 CqAcbhKm4rKcXyh1kewqWCbRcagmjUxCoW+pwiwcJ42bd1AApaXdUV3Zmqxqw6gHkEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794688138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aDz2nWPFGIej9ad0t62RDC+6xG0n98E9SHtr+O+wOoY=;
	b=JlCG7wYh/SPE/qAofUrFHCSSHdmbJMOcs9Vl/q6Gh9f0O2HjwQPDy9A2TxTqHGvolYwC
	 gwoYipY1xZgtrBmxb0HsVVt0Q/cyQHKVokH8SDwxeeUV0Uj204bUTN1xRGZoIjlj4sSgo
	 k4LGwm3w0C54jBgmunUfMZFVnxpr/d2t2jxkV/eyF7GyrVx0QP55kkrwfJVjMWufc0M68
	 vNNGtRYVsb3ZjoCijhxxqt4E/71I1mzDDE869D7WzO0AYBNU3xbWBJ7BSwoP9dQ+Epnxd
	 F6Pir4mXgag2/bhZefD7govW3KZoY32SJhia5gViv4PRQ/v7ndH94B7hKn3hQ5blzpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGvTFcC2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F8B606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F8B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGvTFcC2
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50715c2757so286224566b.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:28:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794688137; cv=none;
        d=google.com; s=arc-20260327;
        b=J8JNt3sT/sPQCM3zQt7A99jAs5y0blEsAJQ3qU3x7nOqX+ksOW9FT5CxHNkm/MDP2W
         UjaZkQznhp3zSqHziByiobEYDsU7iS/ixo5ycB3FQ71OlQavtygkgC0tBtAoD87xbSTI
         veoQUMY3m3n+DSaWgu6s9XVsZuSsZnqYI9MZ278vABp3JbuJmiOiVdCVSnqaapeNBGPH
         3hP/9f3oGD8SBptjAGI8yloGP+sfpSC1SpYPI7xSJqyjGHwp7YZZGfJ5UqM31bN6CHBy
         Z3Ux1+yX2haj17+fDrN5qdT5WullKo4ko3RboXQq5NgnbmeuLCokbm4ZIgh5Tg28W2yI
         f9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aDz2nWPFGIej9ad0t62RDC+6xG0n98E9SHtr+O+wOoY=;
        fh=9viqSL5ITckoQWWsEwQiwP7l4KXK53Ge1RVxTBCG56s=;
        b=jcrkdC7oobllGqhm4G2xujM/X2avy8wpR2kbXt+1HugwJhlc90QC1hSFTSlv9euH3g
         2CxQ6V6/14OlfQ0wfi/9PPWnPbmzslEYU0CYQ80+GiGcEIxZpxnZaQJ1mlb9Jj80Z8rC
         zQxXSncMzehRzKbSg7ODuDfcBmZr1fyyIoXbgClPy3EIdb5oeQ1RakyUzMb76Ot0a5wX
         tseoGZWNozlAVeYAZb2jSD/DH12BAHJOQy3nr8K1/8DaU2Bw+gyQ3arJk4h3gM257oVu
         8FtzhuVQwU3QQgwuoMSEOrx8C0iXkfQ9Qa/7guuds5EFPu4xUBnh0Un6lvIzjCHN2ydJ
         EusA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794688137; x=1795292937; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDz2nWPFGIej9ad0t62RDC+6xG0n98E9SHtr+O+wOoY=;
        b=OGvTFcC2SIzje5Xue5Fb/wzdTxffK6gDD858vEmFDBIi92b8McWHfa47cn5eqFhXb6
         jGpjiP4i65KocuKeLoKTv32YPySZH5b8+Bvm6ggcgxujooudAIKW+ZuLaCMaBo+opoRP
         hOQwhcJoCuV4bE8pJO4tgDc9+TPWGtiiuHO5rVUYUXkKzyAvfnA5ZNui3EzpKf2SCV2o
         Na6pNgYy5N6gpbhjR84MRyHMO6NrycQM9+v0oiitQJPTnY+GryaKHIe5AfS4UXNKyMft
         TXRYVkzxNcCNS2ov40nwmefsYSmuzQl+VdkaNRxz0I/i2ea1MwO55D4Ketwo0ELFEERF
         57vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794688137; x=1795292937;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aDz2nWPFGIej9ad0t62RDC+6xG0n98E9SHtr+O+wOoY=;
        b=PGDjRX1uiKWIRr9l+B/NnSP+BHSJzEWwMt3leJpYyOpuh8Wxrz80Fqjn/akCioCDM4
         LkNCYJROCMA8hbqc90q2aWm+k4HZCLqpBSn+rQ/cvHAGP0WMdUdyQ/8+FOgjj7LB8Q8s
         VP3EMV2C2ZvaZkKVke+WOeXp8/FLryIdRDUtlI9sfzXLxx1VwQxx3inmJy9tv62SkE8p
         I9qmuOVD6nGPoAPBgbOJ8BK++OL78QtiI+rY1VilBVFGn8ma3KkGkllruOHSchGa4PBz
         1KkjJ2n2HauJtoAkGOCxL1xHkWLB4L49zzuaS3MaSjwiYCsAPbP9zGCkJHy4HlR2fezQ
         UV6w==
X-Forwarded-Encrypted: i=1; AL+hErG39zCnk0KvgAsuEpqLGIA2KRBmlmbkI5wy0L+q+MwzRf6kGBkdGaQqNYQG8QxjQyFlVzbMglWVBPfIPv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JJSR/dU5qDvs1lJErGednNXGXo6sqYS09MshZbl95Yy7rq2e1
	AVpxJWxZzX9GJIPEnuNdoXLEvGmbhcZIZXL8ecvfi0PYwOsAdfkqAAUB8k+LIA07jRzKLIqIuuU
	EkqvW5VRP2hsQBUiPSj/OLuL0kA6+vnA=
X-Gm-Gg: AYBFou2UBZQYndOKk0SlPup/RLRaGSi5OQlO6zUN1mk4CukFNCn8z8e/yjeZw9ScTX6
	yGr0ORdxH/w0qTHt4y9MoDHuk6rse/3MOo/HnYVoBquPBWAtGiGprJIIELutVpjdq4sz1UOBKEd
	Hinpe2/qP5pGr4S5kWm0P4GfdgnOMCGlQjN0a6XI6rSLoYug8kSw0ifyJyLZH3RMPlXm44kRNM1
	tCsEB0vyiBPXGzfqY1whQdh2GXjn6l0CwpUPK/KtxVNTansuedmCd9gjapVL+PUazQ00Hqqtl6i
	QPy6kDe9Vhc+qiihTBjbpKPDgYzbz6Gd6hNaU0Wi66dU3RvyuQR0Srhkrg597zj+sDqinegHtuq
	F9r8jczRagQav4GE0O00/lguD0KQ7ajqO7tIMfA==
X-Received: by 2002:a17:907:6d20:b0:c46:74f6:e149 with SMTP id
 a640c23a62f3a-c5096328142mr523687266b.16.1794688136716; Sat, 14 Nov 2026
 12:28:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-10-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-10-f8e6fbdf8c99@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 17:28:43 -0300
X-Gm-Features: AclHuK88lPPnY4Qy1qmd3CQIsKdJzUoixh_uoF8kXKKLGiP0BSLaPyoFNYjqfgA
Message-ID: <CAJq09z4BGFMHTYdfTVtpZftJSnAX6w3Ox2GHPpKOahh9kbVnuQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 10/10] net: dsa: realtek: rtl8365mb: report
 the DCB DSCP-to-priority map
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> Report the DSCP-to-priority map through dcbnl, so that "dcb app show"
> lists, on every port, the priority a DSCP value gets once the port
> trusts DSCP.
>
> The switch has one DSCP-to-priority table for all its ports, with
> exactly one priority per DSCP value. dcbnl, in contrast, configures DSCP
> priorities per port and allows several priorities for one DSCP value.
> DSA could mirror a change to every port (dscp_prio_mapping_is_global),
> but a request on one port would still change the classification of all
> ports. Keep the map read-only. The QoS baseline seeds it with the
> default mapping from ietf_dscp_to_ieee8021q_tt(). Requests to change a
> DSCP entry fail with -EOPNOTSUPP.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
