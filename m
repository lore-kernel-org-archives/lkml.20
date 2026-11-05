Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793865154;
	b=p5VPLf9s/CiaYBbKCzDkTK1nYZdRkuDRtF74MoABAwibMuFznad3NI9uvTSfZD+cabdj
	 TgzKJRh7BXC9RDJTGYArdih9YwRsK80BtXjIrvJ6Zy000g4iqr4OBpQrFjdwg7XyQ+hFh
	 OhPdJdPf4AgpMXQZJwuHNEhlblQbQFyYxqKbGISPTFbC404jmJEunST6kdp6yO5zd6C6d
	 H3JsmO0SurdxXywnGmYgWqsmt2YfEBzVL2P4O1QgE8r1mqkKspyS5JEdjhT7HYlGn4Bde
	 cIRJayz1C8KON+P2J7DG29GQxhb0OYS6/FSoywJgHsqNO4oAH+YPcfCZZB8FgSj0YlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
	b=q6wGkFGfwc8pGxoBISAecH8UjQGWIIFrP/Zg4GFqvnONelSVELn5K/wFHmY65WGQh4MQ
	 OB//Otwig8EpxbB+Vy8EpObkqqjrHTOWiLcVIP6974BI/5S7Wxeg4jIs6rWVeseRtiL5a
	 chTgNMHJfagMDN++8bI5G/uoffvA6JKhAadURz3B/cltR7BMkra5lKwsRuMVdf9IqXdLi
	 tQ7U+cRZNhJ/zYGgrzp1ETn/GjxuPKg1LMIZkm+uaIThiahl2DXzfEAVRBlZel2RHZaFH
	 8ZmhYREkdqeeuT/V7ZcUf+eWIZabprQwER6btH33VtjX+2eMpjJ80cbu8N4HFhqFv8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="fj/Utz0+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0326D606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0326D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fj/Utz0+
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5366463571cso15922711cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:52:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793865153; cv=none;
        d=google.com; s=arc-20260327;
        b=nOmtVyJvTEJurz3+wFfvAIsmOSremyW8FE+x5JcC4uOlVuQv8YM3odYrrGKZ9DZ0ai
         F3tb1D7LMOxwcsQfKQmF+XZanZOC0JKmU401DfflwoZ5n42A13Qfdn7ycLkJGKDOH2CH
         YpqTitVqTe85e8QcBt/iCbnfHzYrLIjUvuYdfF5J0PrFViFEKgvjwWdnbRHk7tC0KeZi
         JrTH3Dk93DHJVCVG4kEcg5wcWd/sRb59doVaqYGgRH15mzY2gOFT/dTTClfnJnXv2OMX
         lZj/gjrVNQqxJupPWFiG6NV3WXAJOonpbZ6a9YlABjUInkTXQJYfbfYDti2+g0WsWEV2
         rbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
        fh=oHeFW1nRqRxP5QKLzeH35Z448xCREpxE9SmzKFpTbUY=;
        b=ITKT6tcv5Od+9SLvr9P515wdV3NSvxyN4sGsfqGZh5Kh3SKORu2iDd9ZMdV8nadUM9
         3YM686xpSZrvU1REDCCHQpdo18GWy+W1y8LkqnmTjvoM6O6JcTEqBAdOz9YKt7AhNdnX
         1AubccJDMTvxCoGkKePpI+Be1HO09f29gwORqy1nheRFLWeAOcnk3AMJdgDWrk/G3gC3
         g8BiKB3KsZEO1CUgb705pnaBr/nJF5zrlB+fJEnP7qEVyDqmL1lqMZRJdU7u6z7hx54U
         LeB7KYYuzxhQ74bvm3P75JN3+TlYONaG7W6oS9sAYuQL5xtGwFEw4E7kk28Ns3Q7mwKS
         7qdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793865153; x=1794469953; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
        b=fj/Utz0+Y60yxuICoU+fCjL6rWSodnNW6GiJHpZFeQ+K2c9r1QwILznm9v34n66don
         oJmzfyvtULO2tr6wY+lSqq6zbRaU/rDDqXMmthU+VRX3LXLjyEd+frpxnTny+Zi6Bl40
         5aZFwvUXnt+aJD703LqQYGi16cJJa/n+KXmo6ZTgZv0HO08YeC/iQQlgbb6ehBs74UJC
         MqOimmMyxrchQL+wAPHSdoYvcUvNohjaX/Wfa4A3hfbTpbjwXam50XCSlFCHfrdVIki0
         zQQ45uBjHZUMzFHITfSuog9dfvY/WAx1yFsc7j/TyUIyCNISIizr7gkGXBMA7YHDjJzJ
         AWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865153; x=1794469953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
        b=zy8tJ1y3XQLXauIJfbjBQofxjiiON2w8swlx0Tbhl+HQOfVlS05Q4RpK/Q1tuW8YGI
         8IiXRWsD2szptjAF7YMl6Ev6sv30BF8/lM0XybgsBXHvO3cZLQTygGeE15Fhcjd+O7SZ
         MhTjsg061DrRzfPrhDjdSiKQOR68EGCBYDC0Td40FLAAZLQEWbLQzdgtVyVVxRw7teUS
         JVU9IbRV+supqhysRsm2hdUHVPPrl3KzmaUOOd3pxb9S0XOCFFNj9oScCTBxv4JQcQ3u
         zICv06qDKgYWFRKUuUJitkwlGLpeV8AnyDyobfPT/bKhJMASQpiuxjWDkzglETDlHTdf
         gCEw==
X-Forwarded-Encrypted: i=1; AKwUvBz8HjCvLxc5LtUHPrzM2c8fxkI8Tvz1Op7VMUrh/oJhAcfcFN5Wbvr/9FQvGUZ5g5qGs11Qth/T6IoQMQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hremNgHazc2tU9VW9yFwa7Oy3be9eH79OIrkFH/K//aAV0FWH
	N2DA24s73bJyReLREd8XDDXGB/5SbV+GMugWdZimiA1/fl310y6sTAljhQBuYFmBGrSRSYNqHkj
	cydpKzkH73F+p02UoEQLKRCnu5Ja+fptZVQ+xznEWzg==
X-Gm-Gg: AYBFou1RwY8VLu46zg2QH0eNP0bbUPZ2RqcpL7LpFnZrob5nrl3Hl9ArstF7wM6/TgX
	gIwIdZvGuiWvUBm61ZasG90b9+CcJuKwnSRmY0gYDBH1ZOZvN7O0NajhwgVGHHTqSwgA6hHXr/W
	rXJ9RGPFX0WJmoMFVcPQZpMKsaYzcKTAaRY8VVCxrdUvKOBjqrDg2VBnFrVSvArLsD5AtTazaVO
	QUm5eL3GwBl2nNSqqSl9MAFTXATCfXIsImqplf4k5N9pAj0EKdv1eO1m3mZqKRv9lXDzXftHVsu
	o652orUgl1g5pFp1iJVCfpjNCOT27vrjS9TPrKl+33bGsGYUZ4WSKV6q1q2EQXmwHCDR2qafQ+u
	yv4MMSOJZGKqICYG/4O+YaTXH3MMghRSQSmbqbCazSyEb+6P0einMIVdBSNaEKwc32NgsqLXZ/+
	fdMatn88UqJ2Ekrw6k
X-Received: by 2002:ac8:5e14:0:b0:536:79aa:de06 with SMTP id
 d75a77b69052e-542b781c097mr305348781cf.52.1793865152881; Wed, 04 Nov 2026
 23:52:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
 <20261104-acpi-mfd-v2-2-64b9dee3baaf@thegoodpenguin.co.uk> <auulmL-HXdzcdM2V@ashevche-desk.local>
In-Reply-To: <auulmL-HXdzcdM2V@ashevche-desk.local>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 5 Nov 2026 07:52:21 +0000
X-Gm-Features: AclHuK8oxaHoF3EiK88-RObp0nE6JLTdIkoUzrIpdnanDmHfkYi6XSLOF6A9rt8
Message-ID: <CAA6zWZKk9C_PnZKZueYYCT=XHcQA7r4SPM4MK8zWHLyYuxS=Uw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mfd: Use named initializers for acpi_device_id
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Thomas Richard <thomas.richard@bootlin.com>, 
	Andy Shevchenko <andy@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-crypto@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

> Haven't I given the tag for Intel PMIC drivers?
No I do not see it, the only reply on lore and in my inbox from you on
V1 is re splitting the Intel LPSS.
