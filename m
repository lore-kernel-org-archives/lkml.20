Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794605670;
	b=MPzF/4bghmMFyq5fPaHMIq5mQmQkWXKu1hMhlG+ZqjbULlAeXdFaoh6C2vuS7GCqvG7O
	 UCQUyOD9Rqs9m4v+AaUVrFeyzNjXj1RPHvIytI0/3ZRWvlFm70+iU64Lqh1wFoC3yF/tk
	 p5r6CqdRKJtzOcO39paO2a/HuGh1RaXL1XahEtBcj1bOYclz24cD30BV6/xPxbS3UUDJA
	 5stZyXUvwUrLZc5GRUedO9DLODT1pmyw6BpaVlohMm3KfSGcw5WwOPy8SShdVAxkrdg/U
	 L8HhEQGN2A3I6SQQf/YIoIAPH9J1Sz3Z5tW7e9S9/wSjgqV9Y8g/moWaTKCjWepX+HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
	b=u9Nv8yJUQVp7Cnby1l+tXBcF12dahz4Bl8QkWVAscJDq0F0NvqPPvv9eaJEPGpCvxyWu
	 mylm6+uUiGRG9O0Fsr5y0N60HELvF+IYpHW+ucQlurHiGK7L/a0QCNvmGCk7uq3EzHp9v
	 J/blDlxqH8s5J9Sr8pAT8tnH4BkrFD0Ek5d4+60U9aJvWjmuKNYgLM1N4AI/wkgnpGXYA
	 obvHXrA82MrCmMKq9DHnARgxN/r1IAH4BpHtQkKr27ZEIXeHyNzS9+ia4FevWh8YDfdm+
	 7KOBxDczfHhSVeYQbYsObd7xn64xRhdbPtlHokk6iJ1MOZ8FE1rXalRU8hFQdgNB+ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6Zz1mY3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096C9606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 096C9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6Zz1mY3
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b79f5115c0so2937459a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:34:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794605668; cv=none;
        d=google.com; s=arc-20260327;
        b=gVdOxxQyK8T13N7PW2Aht5I0GshdNAMKGhxtD5fs5MbH1qhh7iWb0KouDTpWK0nxD9
         eD6bk6YfWjVU5GDk5bnv+1jDJj5h++3gZm3hMjAz6ySQV0hlXbuj7Mydekh108hT164k
         cFqQFKPENvRFDWr7kkOBm0RxZMpFhfWffM9HIATEAuOmPF+Pt8Kgm23yIVzm0ZZaRHEE
         LTcAnakeg0E1lKb2HORbl4rlPbWNWrInTpgv+jw/2d7UUhwUHCg5Q3ROo/wCKmyUFNNB
         hALD7Ym1oLzK3e9vbiwwGEybIophapw7+X6qPVOD4YPD2S61eTgeO2k48qgHFSzBBhyz
         XGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        fh=HYGWAlKc46KZXAxbtZH8t9UQsKWkqmPbKYFjU/W/oiI=;
        b=O1jccIbBwOoI4bG1Zo6rNb6vCAtv7x6vMykY0NDuvQNSQolJAuvas5zgKPxOjkyE7R
         jOt88pWuvdisvT2e1/l5iYQ1KHboEnh6d9FJ1cCYeEXB2fcjnLDMzfrTfevBkyshXRGp
         Fu6zTLOXAqlQat68KGe1JR0JZeZr05ftBwyU6sEkoFdHiIcGm1oCi0TKzKfM39nMhY8d
         2Q34ByZQK0oYtskGuCW2f5OdK/EyqdlIyh0BDduGQogmR3zQP65WlsnA1Zhp3n9W8Ylr
         Ddkj54SmDTMp+JrX+GAnd56u66VjtB7BZXZ6utLR/EXjjt8DJBhf1xa/K+xQuSHm3Mqx
         Dajw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605668; x=1795210468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        b=n6Zz1mY3OwnMRux9AIi8h3mMM8K/rdexRAXliMbI7BUAeRbFl5+myZIoZntCimF8Gh
         NRFXIgPkWX/XM25RdeuiL4uKgE4qBsXMFNPKRRGN9AypAcEYXtdDkayrgRITRAP116u0
         TrsYowDxQL8tggHBaLER/J4IKU/BsHTwzLTco17LuHBVBDXEGn0cccQWQpL0pMg7NpBA
         DMWTxB9UXxK4HysvunwnGs78kAETl4RiQMdZbfsTr45AujcYPUU4AwQLAD1jEjVvLGc5
         NVzTn2sXhZooZEFd0LVw38BEJHFLDvvmyZuwv7M6IE1Gs2PM/5oYmKBrgAj10tQhRtOh
         uULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605668; x=1795210468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        b=urZx1W2i7Vc4wGu+rso8z48Q5PNIQGXFaY7nCGBYpwsfgniBkI9/BvRi2zOil8KY4C
         8o5Zjf8kc8ju17MyCAB355FhNig/68oJQgYaX70ZjXZz7w37ice8zb6+1faSIlZZ0Ur2
         dQIutDKopZptjbZnDKvCRqCKSH/jT48MonVCyyBQqVofkSbwS0/9w7AFecW4qCnXFbUN
         vLh/5LlXpTVP6MuS1Ezhy97JBGAGz6HOPYgyQceDzm8i9mXmWzsfnP7DynccuAg5pmUo
         /sjDwBnyJFK+cB0jwBOBRhGa47a1CSAGpFFP6nzCdfK0w3XAfpRqxWaeDNV4Qlg6A1RX
         Cydg==
X-Forwarded-Encrypted: i=1; AL+hErEOD5Tw6tu9K42WFss4Ibm8f87n6iyKzEV/SBL85dehFsAZPDekGZE5SbU8ElA063QFAVQj/EQtAaM2C4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8El9G5kjiiuBQWeOns8TPNJxDgcYexkv4tXcQUpAnxuH0HJbf9
	GVfZsCgplZ+HvR8Nm3wQ85j+4g8/jYo7DamE3IgZxGuhPsduj/UnWDTcq5NTLpNawNLBf8YvKcv
	0kOeKv9jB0ycAQShcAyPk9pOzvesx41U=
X-Gm-Gg: AYBFou13w9HB3R1xIaTWs5jD1+OvvuBvuQyqHQYboW1wjlTmJX3ZYcm+PNaY6OsXIAU
	Yp7kI8R7aP3BsNUfMLmOJRPS+u8VM8CZNYlSPMceEds2E+Sn3v5KYlxFppWvaKQDy/ZQXfLYpD9
	nmrWQ5o+RPP3Xj2BssWXE/iCfFByPrCCvhlU8cCB7TLgtPmx+AzlFnzYIE4210BRWi6ooxgDaMM
	9KgWq82aEiI95NV8P2BZCGQOJKASw1Q8vRnav0d5F6RP+3Fd0C9FzolNW68snB9TgVJqGLvZOzc
	NcxTBKxVb24v5CN7GxSerPZtg9OLLPrOXU7pMPjkdGgGI0msQ4aD1JAKSmibvf3IMNZ5rGivPMo
	yVX+PlooRVwiI5VR3POmQnSn6s90hOJHvg2C4Y2/ua35xdzXSwKkOOx5Zw5nRpBbwr/gTiaPfhe
	2S0IfEtANYf3EyxAuK42PTO/cEWMlZSTQo98GYvr/VDZQFVGUzsOG8jbwiK8XoySdxsEi9n3pvU
	BxZuir7UIIy506KBjS/nY2At0d1s16XJZ2e5Nml6/ocv8hh6w==
X-Received: by 2002:a05:6402:2422:b0:6b4:2960:d38e with SMTP id
 4fb4d7f45d1cf-6b7c0c6c168mr3184743a12.26.1794605668245; Fri, 13 Nov 2026
 13:34:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111034418.194610-1-rosenp@gmail.com> <20261113-gabby-vigorous-dragon-6a2fed@quoll>
In-Reply-To: <20261113-gabby-vigorous-dragon-6a2fed@quoll>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 13 Nov 2026 13:34:17 -0800
X-Gm-Features: AclHuK860Je_aBBSmUpm949DigIPgWY0YZ3IdWomRfLhm8LCUntc7TDGkYsdgmQ
Message-ID: <CAKxU2N846Ebd50z8adJsNcy-kJBSNDSKU8_ZLf68fJzoc+r+xA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: wireless: qcom,ath10k: add PCI devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:11=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 10, 2026 at 07:44:18PM -0800, Rosen Penev wrote:
> > ath10k PCI devices can be described as children of their PCI host
> > bridge, for example to supply the MAC address and calibration data
> > through nvmem cells. The only compatible for that was "qcom,ath10k",
> > but the generic PCI device schema requires a node under a PCI bus to
> > carry a "pciVVVV,DDDD" or "pciclass,..." compatible, so such nodes fail
> > validation.
> >
> > Add the PCI vendor/device IDs handled by the ath10k PCI driver, as the
> > ath9k and ath11k PCI bindings already do.
>
> We do not need to least all PCI devices here. Were is any actual DTS
> user of these?
I have some WIP patches that include the QCA988X. Reason for it is
nvram calibration and MAC lookup.

This is basically copy/paste of what's already present in ath9k.yaml.

AFAIK this came up because of dtbs_check
>
> Best regards,
> Krzysztof
>
