Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792566389;
	b=GQ8nxfEj1Y7M5z60zlougIPP9FdYxkVjjupGXN90kWL1B/RFLZICtU0+EZCs6xY85/kx
	 s+slQgZy6LGwnAuueO+OxpRLAVzTJIRDg4Su2obm+WgRlEdexCjf55E55MuqgUXygj0Ph
	 TDLq2AbdjVbxjNf8jE6AFKHDG2hfx98pJ0b/E7LkxuQ2IsMrgTShXDqRIdKOwil/a84qI
	 uBpWNWF0I4Al8euyEZz/6iB+W8wedLw8yAeg3+PN287sPoz7ZSSxt8F4ohKZ+5YNRuDn4
	 SQU8pXASUFH9Pl4m+J7PEfTUEQANGPfAm1MQyrX0D/f1vBmCTIspg2C2xk7PQHhDMVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
	b=NaM6nIzZXISVkcth0wTWrCRaCrBLNcnEkiqhSQ8uaRgLSaXqG83mnjwThRj1kROvpAm1
	 ffl8wJzkopwqC3XP9rkqDDYPV/w8rPdbs3sl7WgqPb0+uBh8+TLMexR6ry6qGJBzztEWW
	 /sMatICNHYhwKTuYQ1IbjFdy0mc4BfhDfWMZ6M/InUdrSWw+8XWLn9bGtYWMs9jKp0zNo
	 L3y98yOALeLkEnieIghNROFLrKIo/LjzFRK/d88nyJIdlGhFNJHsRsHmr7IQDYq1XD9pI
	 aJ7HHDrDi4LvFy9maLMmQXpoPRs319CP64KqZNq48sjWHcX/780RGPYikIyOFDXKs6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C2aW6AfO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE9606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DE9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C2aW6AfO
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so407302a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792566387; cv=none;
        d=google.com; s=arc-20260327;
        b=Ao5eNBhfrffPliMoJWsnvmtwJCgigAht8MxfQosCfAYOmtc8ew1XZPZK0XBKiJ2JJ3
         8WQ97asPtpgjfnnjwRa5oJD6CWyoSzmHnq3Y5liqnTEH7MW0VmHH2YWsPQB9cacEeEkb
         LhRC7VgQPe0DIPj6y8XNWD05+Y8eljxHvo5MvzqCeM7hUM1EmkySF83QS/Qh1/VBYL1w
         qW6WPgbh9SGSp21DoESTyPwf9DyjQ7k3l1qytw8Z1D1eCcBwlrPBa/rLqGQz84AJOSI7
         Kt5ZvSI4kOu/M/XlsVsW+2O9Bm/yrxpPiOAJHYbKDqIn8jfo/NVhRlngVTYtDDNYxJEP
         PNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        fh=6S3TxpfjxntRKlX762i87G7HB9/wHymcv5aqNo2DUak=;
        b=d3GOOwTB6t5IS5BH4LpkP5BdycpWV5Ct0Cow5SEV7S2dIgOSMiqhAuLmBUdcWyfI2k
         KP2sHVUUUEe9QN0CwFyH9h6wMmO/92SvIMFPAZGneQ7QfdJsdS8u9dUDo1hnRpqUNpWt
         a417WjxI3EDTFBcrbaa8BSyUeZVjnPPndDUWADwpGmbxJQpsF3tKO4hrTbuYMkbXvzEA
         5d1vdJTQMtblvl5dkqaS3hN67drBN7XNLkVnw5yIHkuIUm5xtHf1KG4vFTDWzwdAfgcD
         HY3RxDpoulXIGxB349g7rpoX731+c7Y6dNx9jvBJr3jGvee9mcn+bZdb0WQbazJ+rwU5
         Qktg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792566387; x=1793171187; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=C2aW6AfO2tXqS0Oxlx14bTBMVNZFQOYYIP++4Zjy0XAUzXRNiZIyd/we1pVq076aHi
         iVYIhUPzTRpHWbk8TgjZRClfvVa/ZIrYZGMbZO3DJMSCV5UIvg3fS/yC6mcleMkr5AZl
         CDc9kVye1E9N/IkJg93m7mi7sqO0whCAZMX9QcPqw07cX41RvUCWYBX2Ni2g9I4qZnBc
         vQc5Edq7qEPfSyUtvQ+/172O9D4MiKBbq1sWvU7Tk2+K4adLUinXmEHtrQ6sATHMl6NQ
         saHvu7vFC0jl/+EFXD61TpmMKJksXH1W78BY/OXH4ikoNly2no/97ZmvjpXcLfZRBf40
         7B3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792566387; x=1793171187;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=WOjkuo6O/PB86vNn5oCdg9rHMFLnVp/CxEa7U2u7D/HqkBDxmOMc1//lDsqSz5XEo2
         JvaCfEv8YkBDYpfg8JPiAbzxOerAmbQlJ1phPybaaxxgcRT9cDSxdNTOYTSyIEqNSH2i
         AEKoJGS3ZeWypK8e9oqwkAuCVxf/ghEQtj3N7x5V6UtK4hT+FgPlgBJMavLLB+DpB0hw
         90nLkV5097ChQ6IDcA535Dsc8fV4oZkUANM1dozAzKOT4sgG7ujpNPcHXK/oEGSaL90F
         MuCcPP+UYVu+ofwlX1WI+T+/4wKikyFRwE+k4knjyERToRE7azuzVUzGitI8fQOh/ISi
         reUg==
X-Forwarded-Encrypted: i=1; AKwUvBwFxDhVxXtiTEtutyVYLu+CA0OC4Fx2wJGCT1C4poQ90yzXzIpImgH+l+9mNEEEYEcvD7hLLdy+MX/maAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2W0ecpOCw+Y9pDjkySBX6e2+HwQFWuj5q3N6YCM8UzsabiryU
	qLlpyPI1JY5ncdAI3mi78K/Ul44p/DffztCb1fWPQyCkVK/P8KlN0KDdNxCQP48cTvcyBK7Qupg
	FFUTL7m489A/zmsgTlf5M6xgLHjkDpMk=
X-Gm-Gg: AYBFou2u/szxY5ypOXJew2zKaf4F80hCZjOWBTxqCr3q0M71IdbvcCGPv8PXTerSty5
	pLjtcvrx9Gmd1bMoIfYx+pjGMaCoEK0OFurheRR1pwqkXPm4HOB0oI/k5Ii/la2hvg9biodpkKy
	kUypRbg8hwv6NcvGICf+MhlcCaOQpMEZSDiFtE29jv9S36H2f5jfLj4bHAM36DLwD+KhuSRf0CT
	PFKZvFeura5/L6idRShBVstY3GvAaXjgsczQfqFzMP2f299lpGRXZfcb6GRspcKOfEVpVx3ETEx
	WP4+e/GiQCsAKBvR0vzLs3BSmVsWTErGgXlGq55xdA3YijtkZ9OKD/ovB582gXYdJBQ85Ol/LVp
	YCYb7i1vD9MTyRJMB0tyuRr/9l4RFhE270so=
X-Received: by 2002:a05:6402:1585:b0:6b1:cea1:a011 with SMTP id
 4fb4d7f45d1cf-6b40893d0e9mr633902a12.0.1792566386899; Wed, 21 Oct 2026
 00:06:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org> <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
 <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
In-Reply-To: <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 09:06:15 +0200
X-Gm-Features: AclHuK9050nRGHSTN9753pi8bjuF0vHRU3cnUbJida-ygLIdS4pPdAAtcMwmgKA
Message-ID: <CAORyz2KsozjmcDCd+KVfvLokuxs-YAP0E5yJawHECu9pbPQmKA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The dependency of this patch. This one uses compatibles defined in other
> patch.
>
> Just apply it yourself and run full testing - you will see notice about
> undocumented compatibles.

Thank you, now I get it. I had already removed the example from my
testing branch and removing the example also removed the dependency.
I'll run another round of dt tests to be sure and resubmit without the example.
