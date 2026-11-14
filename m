Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794686214;
	b=DWm2et2H8Qjxm2lQLCOKjNwOt0/+PwiDSv7NKHIewRyOLfQOZ5cj37XMV55viS3LnUVP
	 oxpxhkbNAXM/B11NLP4UIaH071k8zlvzDLKvMHtFIEBI3VkFSlYV/tly8vJuiNiW1+7JN
	 WSp/XfUmD4GjnIzW6AVqao/MZPGJrcXlu+KY+JMUSrVlRz4BeMyOHUPGDNSSWYazQkTGJ
	 44ic0BS88d3V4gXrcV+xwoEoZaAqAQi2eP7gdsL8k3O/3v/ECxxpq8w5Iv58KVi5kEKj6
	 JbEO75KVTe9/DVGq8uj00RE/JY5NFZnIaixeXW6Z86Q1zIAxw3hm8UcY2hVa3wpG83w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=30MCZI4kNA+mBPnrnfoEtNdD8jnl62hOav7zZ9cZHCQ=;
	b=qZDSI02blIrj8Zzu2MHOcRU3P4dmu+mBNyoTuTM3FxriQ3/U0Xn2gwRPt/QvmNr4FzjM
	 JUOO457azzTtnjZwf3GH6vw4uXfLWwddlEN+0D0/1Ja1QCK4iP/QNzKEsNBDahUVFAiht
	 AYap1yBuvmJS3JA4qpXibRVfW8gpK/PrOAeyBLs+nSiXFSk0KN/rKNH6pcMTh2x1KbTFh
	 2LZ2CWwPAjnUs8smUIgd6b0wZcEIEdJGcfHAwYpDG1VFaOq0Qt1/GTKFMbyZaERJU1uQT
	 hcxGhzbPj2AWCG5jsgor/a1n84sD8ckICaL6vsBprbcrAFY9LgcPVMaTKbF9MNYXlIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQs3WlZs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A4E60A2627
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A4E60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQs3WlZs
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d28f75d62so456090166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794686212; cv=none;
        d=google.com; s=arc-20260327;
        b=DHG04x1g/hetHauvZ9B9mZIMW4VYmNdgSA/cRsPlTPbnydfb1DMFcmiBuR/BFsgzIk
         pJJq8KZBdXEZVTRF9ThHmQ5NdopimP1wnqVUZW0j7n5kX0mtJqEW5MYYrum5Szp/DZ18
         RVeKP9UB7nWopDosKXf6rafTJ2bQZDKoVipuiAzS5dUc64lXWQaFIC8fg+2ePIhewNN0
         t3b4EBnxtgzMbPAWuQFV8gXIoK10OHaGGHJ2WYssIaOwC978ShUMmc6MdkfPvvTr4DPJ
         NcrdgiTtkxoJ6Wx8tdSUKB6saAGr6bDIjSrLOjdnv+LAMEUTGXeVXzFXwndYcd3lentY
         hn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=30MCZI4kNA+mBPnrnfoEtNdD8jnl62hOav7zZ9cZHCQ=;
        fh=WPBvk8DrAVP+82A92pFJygCPHcRrTpfwPCBkIiuk8rQ=;
        b=C6M8uzs5Gx9WheGNc3e/Jf/SVNdR8f3/GawTPsn3GmihKEF3kDEKlp4jLIDe78X69C
         a2ZgYR/7hb9a9AqrTvxQudQvEWw3BxUBAkZqlUXgCP8NgdifKGPxjMDbYKGWnVf8zZXg
         zxs8ulqbGWQqP0QMvizodgPnFdKZTckdaX0Fvz2eHsEIh+KKOiqjbxg35XCiDjLTeIrj
         oj8Rao1yqI9TaGEcLJ5Sq1oQvPl6+CIqdVLZSUzLIUN7VH8GqVQjrv4k6C6tTRa+a6VC
         2E7GLB0MgS+xyBFoPzLrEmp0vhti2XSGK4phDMGx/6KBrs1qedrH5ndO4WYAYGJ5mjhh
         iUsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686212; x=1795291012; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30MCZI4kNA+mBPnrnfoEtNdD8jnl62hOav7zZ9cZHCQ=;
        b=rQs3WlZsbvbwOCe3JBwOj1wHNiPHVH1n1WPD06GXYcmU5bi9d5UePvKXpmPbv2Ro3L
         RsJGfjkHt/OOT8G06tY9HP5CnkytWPnYpMiDDVUmaAxenVIiLnnvnVxo9hr0fEUb7ac6
         wER8sL0audpLVOo0FWtVpiqOwVvXUmiftWNm036B0wkFSs7jJfC98HUREv5tchDf5xGV
         pLj72ErnU5nXqSIv/jB1BqqaWclRDk2aUowPEjF/LBYThZgWBwXdzN9qbTYuMysLGIcc
         23RW3Mv1kMWuAisovsEuYlMAJEmR56AwrLRw53rDydfIHl0DZOQlBDv5vHG+mBXSR0js
         9W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686212; x=1795291012;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=30MCZI4kNA+mBPnrnfoEtNdD8jnl62hOav7zZ9cZHCQ=;
        b=altxts0rYXjzQeYPCkp2GXwzorfjs2XQzk4UPYcZZOAQuIs9SZt8p8WZELrJsIt7mg
         v/3wN3d370yB46AWwHEFBdUSEo8WuwTGqqwGaobM1FIVxfTF7Q2d06qQhCcUn8pocBWs
         HYtkDajacdkVLJ2yuKQu2SMy8EQkM4GrY5HEetb+a5w8HMzldGkKgWeXlMJfz8ncEDkm
         tLE+rCub9BFfofFVr4zXDPcGOMknpeIJfmu3AjtMuEGZ2uhlQHUHxe4WduTRjZX7FV95
         oUf17ZBQwELaILBd8Sw1rluKXMp2yj7kxY9R/9nhME3/ia66R8/bYynkUQX3/6G8eydw
         Z+iw==
X-Forwarded-Encrypted: i=1; AL+hErGiL5aVrd+lpwVIMDhLcyryg6JdtOYBwgJEdNF4+myH465E9RjXipu9dum3jHESwO/1DTlnCEUlrFO2EdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sf9bmWPCkjGu8FL0K3hxhdv6P9+6XNl4efDbx6WItsmy4zZ9n
	2TpU53GzO9eUKmbMjSJYHEhzCTldWpMi4P2RiGq6pOgaiJntXgsdOxlVmmlWD1rrvqyexSNFOzZ
	JBOduGRj/P/Zyg3vCSP07DLCJFfU6xsU=
X-Gm-Gg: AYBFou3++PEnrEZ8xpWIiQPBhhzIbcLSk/SIvKGBJ14kQgZu+IdIVCDMqAsdToaR43m
	CCWFnzYjlD8NMzXJJLc03fY5q2zotY1wx2Ppul7KC1Xnyhn0zGn5W3rwmjMWp1F3bawHenpHaKV
	EbXvuh62lSZjjyd3MTucDiH8v46s3OFBkGQTy1BjXN6Ih7ygAqnO8WSTBpT3XSuz8v5nRLXcRF+
	2ZBhfRbYFDQgVQL6qeOrQgnPXpksNisp8SENXi5SbDQo2Lw3q8OBRs9MVJsTBsRg0lJAthjQFE+
	82uChhfTWn5yVwRay7Bl6pWUU9qCowV70v08stxvNaBprJRJxLYZPEBVwXxUC+bLoKshUE5vatF
	5AUzV/1nrCbH7o8lxQx6uIsu6phbEYNYVi5VB
X-Received: by 2002:a17:906:7309:b0:c25:afb6:2d91 with SMTP id
 a640c23a62f3a-c509614e541mr511427966b.2.1794686211861; Sat, 14 Nov 2026
 11:56:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-2-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-2-f8e6fbdf8c99@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 16:56:38 -0300
X-Gm-Features: AclHuK8e80Cs30KX-korijUfgMB35N8ODch8H-NjMETF8kqtp_dsj3zSHGq-DEs
Message-ID: <CAJq09z5BfnCjNnp1TSN+Hz8sCSocxu5ycoUH_PXm==zggTtKZg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 02/10] net: ieee8021q: add pcp_to_tt()
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> Add a helper that maps an IEEE 802.1Q Priority Code Point (PCP) to the
> corresponding 802.1Q traffic type, complementing the existing
> ietf_dscp_to_ieee8021q_tt().
>
> It is very nearly an identity map, except that PCP 0 (Best Effort) and
> PCP 1 (Background) are swapped: per 802.1Q-2022 (Annex I, Table I-2)
> Background is a lower priority than Best Effort even though it carries
> the higher PCP value. PCP 2..7 map straight through to the matching
> traffic type, and values above 7 are rejected with -EINVAL. This decodes
> the 8P0D encoding (Table 6-3), where every PCP value is a priority and
> none carries drop eligibility.
>
> Drivers that classify ingress traffic by PCP need this to map into a
> priority-ordered internal space without misordering Best Effort and
> Background. The first consumer, the realtek rtl8365mb DSA driver, lands
> later in this series.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---
> Changes in v2:
> - use a lookup table instead of the switch (Luiz)
> - check the lookup table size at build time
> - kernel-doc: cite Table 6-3 instead of Table I-7, fix the sentence on
>   7P1D/6P2D/5P3D, document the stub's return value
> - commit message: cite Table 6-3 instead of Table I-7
> - reword the @IEEE8021Q_TT_BE kernel-doc and the enum title
> - keep Linus's Reviewed-by: the mapping is unchanged

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
