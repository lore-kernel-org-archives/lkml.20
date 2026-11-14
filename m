Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794687502;
	b=aH3Xnue1qcpBWrY0FDsgCAL8ICTuRbLw+RykcCKbF60o7nf2VLr89CUlqNqVybKSL/56
	 Z+y9VRqZxfFJ8HMTTn4KvFZKllm3con8zW0RsZ9Um+n7dw42yV3sCfpyjeU2aKBA48jPU
	 P52dtsH/Ue0w7BVCGaXZpVw5tY6N97MHvq5kHQg7PDZcqu6Y2oLN1d1Nvab1bxGlFjq0q
	 C5d0KbykvhXZ4aAl98uq/oMPPd9DNnl+0eCzrysPFgbax6X23YvwcFGGVwMtENK3NYCd/
	 gHqLe2E5qhIT7lywQe4xJohSTbflPBJ0g+YXL+6UkheGg3Hg52cJ4oeEfKd137dZXTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GaypDnBDTKD95UXTeMPBFIQBqq5jbEVqGZw6bocPJEE=;
	b=RC4pv70O/57e2t7mw5auMMP4rOgyN/y6bVFMBGViysWxGLu5dA/T8nrVpg4oYjAbeRLp
	 TmZthUAVgy1xAcVbRf8njsnRnSsQjxPZ2w1VsufhVuals2Af5UXoxz4FOT1TUeLWEIKRL
	 wLG8t/ZMobYG+ORbE8wsuClTXh7VXW/hmAAMJYjpNFoFN1KJOl3Id9xCo6htBvBuNIb2Z
	 yaK61ipe1J8P21QZaSfGqePWq51qKst+Xf0IYBoNnZtFaJipFo1V5LeBKX2Mrr7XAoFky
	 rdiZ2++plzJ80y1ucK0Sxb/lpTm0bXzUrrWMCHE7Sh44vKCpSxa5nvorpjStGmCrtmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnGtOWCL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF11606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF11606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnGtOWCL
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso420777166b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794687500; cv=none;
        d=google.com; s=arc-20260327;
        b=nxRaAvys+TFluO9QaDaHBga2DbP1K53tCSNzq1C0Jt02DpHtgQ4fNmEOlw7XCK4RZW
         T45qo6/iRkxkjMbbhWU55uakl8d/8XThZTz2FWZAAHdMUfVsdg/vWCglsFIDtbvMH+vR
         YzLuamknm3Lyf/jptNSekvbYB3DTP+VZIo2LM87L7wBmmMzah+pJXwM1uYGXkW8QP+4W
         V9GWmCFTFj9G9UJa3Yg1ZgFBCLmO/Wzht4Q3BikHqm9FGZqC3y/5MRAFm5/Ty6a/j+PW
         gYdj0Wo55CnHXkMWGX7EeBMx0y/tV207v/mMHqYKNhw/Yt7+1z6Tapj2WggTl2epcRDi
         m/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GaypDnBDTKD95UXTeMPBFIQBqq5jbEVqGZw6bocPJEE=;
        fh=brptgxACEP8NtP/1K8lBDS7+1Zv7p2vESFNMD9esMso=;
        b=jtzCB8aaQoaM20doY41atVzRigbn/vw6VD5+n7FHtsuuK7C9orMWmfENekDVImK76B
         vMIzvtG4/Y+KPwFfQ9Fw7utGnSerHkYyzWefGxpQyK6t8byHOiWRbVJv++3diliKajjg
         zPI2lXLfuGy9mfcxf3L6QalFX0OeSbpB2P+fH4Kv0OrhUPz5TFSBW2ijDjX/I+CU1VCF
         tGy1F5IP1nFFuYFzCd4IFqiHleYt4mVgzxK2nV9DVDqh/oEJAu+YVmOTmTdNSYST9F+z
         AdqY1S0u8D8UM/zzBubcBrGW1Vw2DIYT7ak2YPV4/mIv93tgDONONk/Sptnl9lLF8jtH
         oC1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794687500; x=1795292300; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaypDnBDTKD95UXTeMPBFIQBqq5jbEVqGZw6bocPJEE=;
        b=cnGtOWCLKkGNGDDLOokyNEL7hqSd9LGaqN3O4n0KqG/iwnvTXNoFg2Y30Hp0/r381K
         /dp8upiC9sSzj5PLtDq+7VKYFvUaAlYsnLw041g7oDNhSoNabCZIEcpY0lKVf/5lL0la
         5uHk5+GVu4ui5ZqAmPsltoVShG8ORUWR9GsUkx9VdL0vwJ2V34X9Xhe6JmJCwaXxBVi4
         d+NQOHNt5YOrcElf8IzqlK96RhPxyetufwTzX2/NEY+0qgBcHjxvxdvcfNv+7XLmg97s
         g0Nu58rHUf3EBJ6mwRGfLSzsjsq6RlVYHaK3JRwQzx8y0qyzqeXvDTusEssVKsJTBnfl
         INXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687500; x=1795292300;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GaypDnBDTKD95UXTeMPBFIQBqq5jbEVqGZw6bocPJEE=;
        b=PZBRgQrm7GiA3B1p/RDZEFqIY3PlcO/DPqBLExy5LzSF+5ArerR5jz7nOqocmEYBcG
         Hmlgs8LBZXU+iuqqUv7cK8BlgTPvhbWeyhII99gOp9kywUl7OAHA2NPkrxifScKv6SNj
         tOI9KUhz1Xg0wE/dR3FETuH4BxRtAYghOseuCogIAN4u/o2vVXL1okJ6H6Toc7KzPEzi
         kS9/0eFycvy1vsDjn2BCWQrC1oCaKT3lpWO7R2az3gIgeFoLQ7RH81JKaCKv50VQJEJl
         AlYIRglkfGzlceEax4rV6vcgILanJ1VtthH+MAh5A10ScIgYXfZUh+UsUaxuAmb9YZed
         gMTA==
X-Forwarded-Encrypted: i=1; AL+hErGmX+rxa76mwVZTXKDoaW70VPgqCn33iZYuSkVubmTT/4SuNYPGrSovAyv1iTuXFE2fy86YR5wbxlQfjL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HDNDRVHdnqA0JohfAhCD5gMHZpUMOCyuzKcD2EpM1SNYQ5OYh
	wYtE5XgzbIRSSc6wU0cAHc+z1L0Yb+CyT+IXRCfPH2cocgOcj3oUvtsb555jgIBFyxsadFKCBWG
	9H48fMd7R4Ss62rWnGwp6vJhgwZp4xDM=
X-Gm-Gg: AYBFou1t4Q9PcNVKNYwce2f91Kx2P3snAm5nAhSjM9JbPmANQkkQDgpBR2g5oJiz7b1
	jeYeBUK+n3gHaNhQLwFbYbgrChr5Ag0vE4Wk4ujHRWLgLRTWbxaVHHJiT80CSlP3fKhaHcbfW7t
	Es6xjABzBfiIaarpeXAEREEdfMu+5Oy3CvtA2PRE+faN3OLj+A7++ehBCQGzAc5YVoGHt9G8ISv
	l1nNwWOZTsv8NfiuN80qRVGS40sLEMKVD9gSU87o2lBYb+aGhqe8h4jgEUKJFl4nBLTik1YvGFr
	RqQuDd9aSrt8Eemg+JmEK8VPn8cjVVvMoZxBHKJKieG1h5H3nomxGvof25Brsk6htRzNwiJ9Ax+
	LQTr9ldaYh3BLkXIUoot4ZAXxga/Jpld1oep77aaZQqFbdJm35geZb/IpAg==
X-Received: by 2002:a17:906:ee85:b0:c33:923b:ad66 with SMTP id
 a640c23a62f3a-c50963ce0c7mr470070966b.43.1794687500370; Sat, 14 Nov 2026
 12:18:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-8-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-8-f8e6fbdf8c99@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 17:18:07 -0300
X-Gm-Features: AclHuK-OTaqwEXcyA-XPyp_4QonK-mUIP3PxcDYzpGXw4dF560qt63lIc3quSMY
Message-ID: <CAJq09z4Mvd5ZPHVFYkqPLuvv+XJyoPQ7Qnv09oEFU3j1JSrrCw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 08/10] net: dsa: realtek: rtl8365mb: program
 the PCP of untagged frames
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> Program the PCP that the switch gives to untagged frames whenever the
> port default priority is set.
>
> With PCP trust, the switch classifies an untagged frame by this value.
> The value is 0 after reset, so untagged frames would be Best Effort
> whatever the port default priority is. PCP trust is added by "net: dsa:
> realtek: rtl8365mb: offload DCB apptrust".
>
> The switch also puts this value into the tag it adds on egress. So far,
> an untagged frame that left a VLAN-tagged port carried PCP 0. With a
> default priority set, it now carries that priority as its PCP. The
> standards require this:
>
> IEEE 802.1AC-2016, 13.1: "The priority parameter of the
> M_UNITDATA.indication shall take the value of the Default Priority
> parameter for the SAP on which the MA_DATA.indication was received."
>
> IEEE 802.1Q-2022, 6.9.4: "For untagged frames, the priority parameter
> signaled in the corresponding M_UNITDATA.indication is taken to be the
> received priority."
>
> IEEE 802.1Q-2022, 6.9.3: "The priority and drop_eligible parameters
> are encoded in the PCP field of the VLAN tag using the Priority Code
> Point Encoding Table for the Port". With the default priority
> regeneration (Table 6-4) and the 8P0D encoding (Table 6-2), the PCP
> equals the Default Priority.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
