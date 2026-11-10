Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794286167;
	b=jmk6LT99fsjRCBGG225sjOPh2s2asdd2eMy6IaCLwUoigu7wet9Il6lYn39K3EE+kahG
	 jzoUGRpOf/7deRZJYxO/yerHtkfJ8qLxPxLoGL3091QIJatSb4JsRT+pzIaoKlUOJBjkS
	 By4JCE0pRJrxstGG53OSBqU+IP6bXTtjhQCkb+vsRAJpge9/EZHEv8dySVW950E8f0V4c
	 RNa11k+vNDzZ/5quCZh8+6HpSiMlzkItk65v9ZNrgkZIgcM1xMhvDxngdJnGlNNlcDxrE
	 vCumKXWq+2jGNHOX2bqW53qNGr91R8p3wu5dU3aY4qx3Y6YN/CgFSSR8N22IRlhdyBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
	b=LNHKosW2+6ZRkL8P06m8uQ/Uxwh3W0DzBBGDpZfpLhk8dC/Ek1Ltptj6QTBlc6sT6ic5
	 lCej5YeKKp7w3PeNusY5zDTEfFUzUPi9W2FZP9WQPS8xl3bLgiDnJ5NRuyX3kgLcHZX/7
	 Hpjau9BiWbte2HNAwaVKER7+XCrEP8SnZDmdwXEY9hD8DxejAySSU37ixYM6MDYA/b/mn
	 4H/1uD85QuIbF0xk2ZGnLNvFd0DIBc+zUIVLUvB6oaAdqANnCOXkPUXIg9wbX5aj7+u9v
	 RFMPU+5ox9u561CXpXWJqH8J2U+GY34yLoGl3qLYmr5qnou8l8TDeJes4WlbH0Nk4ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNAj7Hna;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824C606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C824C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNAj7Hna
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c434376dbebso302190466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794286165; cv=none;
        d=google.com; s=arc-20260327;
        b=n9DHfZnzsO9wgOa+omme0FefOd9OEHUbCExWOYj8rNZ0wD2NpiHUlXBIRyQzBxyJix
         dyh0XheEpXw/syajRGTIa7OrzmRVpznmhT8KlrEHh42NodG3qGe959GiO7hi0INFKI67
         xdzVoZASuS3u0JZP0Waww5osjcAnnCzgLwVuZBzxo8oQVD8SKrs5kbyImLK1VbFLiIrm
         uuxXubFpVNAm6zUfW1VyE1vK8CSSNFWe+v5xm+e9g3NWShi5Q5YD5Mi51HKCb8VJtalj
         qtPDLj4dM+GV3GlBI2gCHCI6GMKnbR9Jnbf0YjqMd5m/imauZZU8ecHjQvzzP5CWUmz7
         zbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        fh=G9fHAib7eO2hi7/vvrVYV3+MB0EU7/T2DgFNhYjDRq8=;
        b=c45ceR8KututhU97YXN4peA+YDlb2Pq6xutpfqXJQgN/Yr7C0YhFjg3BChYZbti0Gk
         XDe8qkJObSxHaj7hJRPukc6gV/hjIaZt9OZUO8moPgbjR4S2RkbEsh1q6WOURzmlLrdT
         HzWY1logZLdVgxVJBwJc9QNzC73ll1WwgTN6nOfX5d7q6fa8QHKholFT7EcFHGn2Rxtt
         5w5XABT405v4dPcy6V+5sUzE9NDJ8LCAERml2RqPWDzq/kj8lh8eq0Qh/GdMBUmQxS43
         Ivh+0XV8v2b28UAefQhENyWhLyphp0/PM5uOmVjcvKTYD3HCowMb5uM60DT10If/KE1S
         epNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286165; x=1794890965; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        b=kNAj7Hnam86gLl8THKLqXdVh0C1qrr1kxLtviI7/vCTsNqfeZxlmCyoWeGx/0zTCpF
         6umq9a1wq1Bc9+eOQ5j1SlGEAwbWdZ5jhMvn82c1glJoiwGJamNNdkb6wAq7CbKKpcGV
         BuD6VO6w3Hn6rfI2rNLarxBsFhE41NxYrLT8vRCKREfisA6tclNBTDhgSHAR/3NPezGy
         uDeMpfa5SOiLB3PPrZIhk0m46d7Ti3WQYLMSJj2a+1QM2CmnMal4shqDBZZyXhIbRK8R
         oFOhliLrOfisx8JhUDyrIExFXI3ZSsba8nuxYxEilLXt2IqmJ4pJ/XA0dM2my5FRDtNj
         qmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286165; x=1794890965;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        b=1GGOV5Vbgmaz1i7jv0Prtqt3ZPoiCK9CMx2RPEOmnAPG0b+5+RyEyjw9VlH+PZxDG0
         Yp2b1iKJ1K2zCfDCWJyTx22Da/rLDnrgZG7FW1DoAVsSrJiPxJNsAV1lYLLqOJn4X0kj
         hqOBUut9rYJfZy/+Q014FDSW8Yqp4z0EOwsGr7abAjhzGHOf/OifvesB8vGK/3I/WY6H
         XpIWObVQs6NyhPvt1yvN0Lxh46UPCgf4v/agbjsGRgagsuCfzwR1hUOYe5fmbUlBlXdH
         aeEI+ONNu1j7KHTL0awPaojAaA+EyD9ZfgO84TxuEpmoK+qHllLMvyEpRBMrvrfgj6sV
         5i7Q==
X-Forwarded-Encrypted: i=1; AL+hErFtiXmiSl+dVgzWPdsk224fBfENTw4vqiQ2L/hHf5cU9xCu7/PkACqGwWOsju1GoApAOm0rgqW3JXBt/p4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g4A31cNQuUPFRcLviUFHFzAO6jN1P3HU5O+XfGek8z2K/I7e3
	mITbPFtnzcOg846a8eMTkk4UkAoBQUCN39ID4HT6SFSyLX2wIw1pqWNaeXvgHix16HLEVflQvtF
	oRwcQ3e+tGasZkESPwjmfgl4lUAOsxixAc2y5Sg==
X-Gm-Gg: AYBFou1IE++oOOc8HBRmw4Kfu6DjMUSO2ysWwnHYGPut9XJCeCIYlonKnUQsPh1Nvt2
	1jQ2oE84bSD1NPNis2iUSnFSBYo5Z7w+EyG/mF/aPVLhp/6gvloWnMxgEwCPXt+qrXoJ4lZq9bO
	UtcvNudVVfZO1Jx5egvzSlagQkL6xFrnDZ6a+ACWk4jboA0OTbBXjOTccpkmXwBO5xwc/FOUfc8
	UTaPchhKjg//tCLwn1YMlE8hnN4a/Z1ht2/pzQSbYJPyVrqN3XM/f6RMecvagVJDwxg+TrVcZrA
	7QLC6lKEC0DCjUe0SeZ9zO8cbHZoEn9U0QSGbpkqwhbea45kpr4pdDPsGeS/TPxnBwSMTdoNSmy
	8pyDW+xJfQGjBwe1AUnEsjq91fyq/nqRQoRovrire6johDOBhh26bb5BxEytTfjttB4bFmASzlE
	VZo5MY9Hdf2SkwMl5cKoPqjlrj4WoqpTXTQdh72ppWBYycjVk=
X-Received: by 2002:a17:906:240f:b0:c41:4512:560d with SMTP id
 a640c23a62f3a-c5049699729mr80819466b.16.1794286164826; Mon, 09 Nov 2026
 20:49:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <gm-top10-20261015191529-g65-295aa0ac5211@mhun512.gmail.com> <KL1PR06MB694295F7F33B8FEDA284C65DF1602@KL1PR06MB6942.apcprd06.prod.outlook.com>
In-Reply-To: <KL1PR06MB694295F7F33B8FEDA284C65DF1602@KL1PR06MB6942.apcprd06.prod.outlook.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 9 Nov 2026 23:49:13 -0500
X-Gm-Features: AclHuK9dEbOFpKZBzF18DRp2ysCfTdn-dJEdIFaJ5Bm7I0rvJVmVsW64xtISAdQ
Message-ID: <CAGEsz8F3XkYkLOzrncnLVNHSgfC3tZ_zYdVrTR4xavq+h9anhw@mail.gmail.com>
Subject: Re: [PATCH] media: aspeed: acquire IRQ after reset and clock resources
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: "eajames@linux.ibm.com" <eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jammy,

Thanks for the review. I will address your comments and send v2.

Thanks,
Myeonghun
