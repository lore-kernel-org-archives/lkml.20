Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794590724;
	b=xHzxVAkFbrCqTtCOdP2Ggp86CoO8s9kUOOEX8vlW3mmc3U+6hvp+gP5UMZpopqb3OjSt
	 G4S30L5h3hj4+x2K9o2mYwkDrafCqWotCrMSdZNYJHlaD7WCWB5gH6QvRPKoyoGXTTuiS
	 Xcs0jJ7Vtrgi9WcevlFo35r2RDPGlfeaHvnBwvHoziE4wtvLgxu3fpFdmY7THgIQO1M5Y
	 mn/8QrBcO7e/jZbKRSnBjnI9Iv0ZMd1cqTeun0Ly6Wzptq5unRQKy5aDtEuvP+Q/9pUtl
	 xNRJcFaBYrrbJmnB2zyB0fN4lmaByY1oMowAimeV05bbl3vJ9e+uLJcudeHxoiBCMcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=;
	b=yHKAn7RedvMY0pj8zT3SOwGVc30QwsS1ejN+xHFmYs7e8lW02iatbzE9fufdLnp/mT2Y
	 n+gWSOUL7Qti4Zoz1YelrB57wl92UUaTctcKkC5A7cPJ6CTINGpc2upije4NG3Lb58w6w
	 +FTOIxc2KvCvroVBWNZm/XCZd3IbpsTJQhxrAPEScMGE2r5V3kLiC7NZB9MT6m2CELfi1
	 I3ge2fKQMEZoxrPC2ceDBi6Bqgotv7MHZF7qhV5QslFbIMgS+JRDz9y6cqrLlUeq2/W4I
	 aYD8XZAMHZpVCjPpNP6svmTYR1YuDrnHz0vGWvMhC9At7tn+0Up788i7Bny4MRaAzLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C4UEmLeg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE59607A5F4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE59607A5F4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C4UEmLeg
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5383c97c8cfso473581cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794590723; cv=none;
        d=google.com; s=arc-20260327;
        b=ddZcj63PqQLr+Buoi9nQsaLQwkAzvZY+2Y03XVGOuzNlwkoMYYPZ18ziB4+h61DIB0
         nELQuutk3CM2JJpaE4LP4Jxk9VX0Ol4Y150Q4fFtiKtfP2hXbJ69MMr2RuA0b8inVRHl
         RIxfDicCGpC8llFeacOx61d7sxZiw6Vy6xGM1Jy+dw/5VLGeTFgNkBTQCSPGY4nHAc+C
         um+APnjWqKfzptmts0K9UZHyPrvZCyYVJWig/s0TROkFbgrwg+/O7QB9oy6VMPY2l4ka
         12NoJWQRQVhhyDEsCA7Sp68BUE4RP9AYxPKQUBXbbmEx2gr30RrakDptwJE1dNNfbdsO
         HNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=;
        fh=s2W3RN9gOdmdzkvpKlFcBOrW53GDxCRu5BY1SvBW2HA=;
        b=tCL+YhOq1JdWxLSbPwo45IDs/hr4gxXSL1NgCyrwy41UFu326fZ11qSKOeM3+gvdh8
         Zd0olHnLKcyHycQZOn9dGLAXD1x02FkKITPwOf1XjBmx75Nq/N+1sVnLYVFFbHy84RMg
         7pqpvSqnAgc86ltws1/J6bUDUCNk8pcKQZKHQespIcZ0XQcDDSnqwvSQEd8BFa1zm4YE
         Iu1RwjSxNZdhLmQTN851aw8ujSj2Bwzkxhl94cirMppI9NhZPJ95tErjCwwFXWVXlKP7
         Zrj8oGUW935Ry1l0xpAZAq/xpdlIukShzou4XUDNWp4popc+5ulyQXwJi72NEukXdWYd
         vWNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794590723; x=1795195523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=;
        b=C4UEmLeg3DogONw1DDx4wz2PheLHQTcZfoRNys3wCYZvrYOY7yTwu1rM6K9zytWBHB
         wepUHEUNef/4sfhmG6DOmKkATR/R6+gjjoIP4DnXD65vYkIN2jby/jkBVuorBrR9G0AD
         vmWlDuSED/YStVIm6dny09ahfbvPVVY72xN1/sDWOVcH8T+fqs7P6ITSGuZQCdQUYIQm
         o0HvcyYmNrnvyJ55H6ceOISbHrsz7yCegrkSzVt8498kQCy5UTmRC3KriqxdMQJbh6ct
         9wAeZpKJNf3IyEf2pOd6owiDgFeT5Mg6pa0S6No6gpHp+cvYRdWDrOPXH4R3WJBXUdhA
         +hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590723; x=1795195523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmCvxvXaIAuMt58sj6gAo6x9vrBCno8L/mc/0+Q4rlM=;
        b=Uhg6Vt4UlCpeTGjP8cMVTg/+ZTu3TdE8scc68itMMCvcEtnUB25Ktha6ORZp2g5dPK
         Fs8ACMjISIRL2dRbtW3d31D2YCyPFyr6uly+vqWQic4K7vn22Ws/cbq1VwMjPZKrdCWj
         Lvb81bl+p2IKDdfyb/Llu8mE2B4sydIQez2OZEuv2zdfQWWnrauCEz6IGtxRKUPh0N2T
         QrKoedB26fQk+kY4n0GWDzPy/bPG7PzIGXxs7B60HFB7HSWFGs+gdhTtazDl9Gh5dCH3
         qdgzlyBCZQkNZZPA796+AUmvLrmkNL01/1mgZcDKs8mZ2cRmMF6BnimDyby7zB2M7KsK
         vDOA==
X-Forwarded-Encrypted: i=1; AL+hErEkP/QPGEprQ7leV5mwobFhTEL5Z/WqLYIg8P+To9X+u4gHqqcPcBcSsgoi/Q6plmQgQ248ysh1dacbCsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tjWHmEbRmz7a699s1gyhWgmIiH5+YIkJUOPDqmSYeOUTIJYkj
	HGA5M48myWUYf7V17oxE8drcIcv1Iv2UPd5fuGUP4jR7NG/JPVbEHIjoTBKqLcQfqp5WO55afrf
	fBp7fw0U3/UGvI7g8D40OGllqb+Qv3tdeeQo/kW4o
X-Gm-Gg: AYBFou1YzFIKPWy9onOGkxce3GR5NEVClhOeKg8h0pZFlha7BqyhsuX//3cQvbAG6PB
	aEJuifad0WzC3CQyMJLc+AY8PK+np2ytT5J3tL51Ed74SOctpAJRLKdAK+0N4X5z1Uvqf/xrwfK
	LlbTnWcgXtCdHlqfoTw6wtnqrfTfAGG4ZFe9WPLgeJIOEF9J+cRVLXz7Z9MiOholG5HMQjqlSGD
	PaN88+n8T+pVauCPc9/9uWj6WS3I2iOyZlqiHY1rIiyGZ37P4OtHnV20E2Gj8dNAYF7kumrfe2Q
	KhRRiTzvo1oU9i9/JkwmYsQ+IHfYuqjzSaIzWayWr3rpPmLhACZypn5XrYoujvMuFHf56QvvfQ+
	GtmBDE3PcUMLs7bQ7pre3LeOTGmd7+zFHeaUmddQH2NY4ragn6K7bgfwCKPZtBlfhq+7c6t4Jo1
	eIwlGqtPAvg3abdmimwJ2uZC1s
X-Received: by 2002:a05:622a:1c16:b0:535:ce3:ee07 with SMTP id
 d75a77b69052e-55afd32373dmr16424331cf.13.1794590722631; Fri, 13 Nov 2026
 09:25:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-2-vamshigajjela@google.com> <20261104-rebel-kind-rook-abaab1@quoll>
In-Reply-To: <20261104-rebel-kind-rook-abaab1@quoll>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Fri, 13 Nov 2026 22:55:10 +0530
X-Gm-Features: AclHuK9IMsUAoa9IqlG448fs1zfhKtF22rMEISKsShaTjjacHR2eqg82hFisGkY
Message-ID: <CAMTSyjr11ZBqwhnnKpmw2tcRirvEctBOkO9AQeG_sVUW79Q0cw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add smartdv
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 7:38=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Nov 03, 2026 at 09:56:05AM +0530, vamshi gajjela wrote:
> > From: Vamshi Gajjela <vamshigajjela@google.com>
> >
> > Add the "smartdv" vendor prefix for SmartDV IP Solutions Private
> > Limited.
>
> There are multiple smartdv companies with different domains, so I guess
> you want smartdv-ips? Or maybe all companies are the same?

Hi Krzysztof,

They are the same company, the IP databook uses the legal entity name
"SmartDV IP Solutions Private Limited", while the company operates
publicly as SmartDV Technologies:
- Website: https://www.smartdvtech.com/
- LinkedIn: https://www.linkedin.com/company/smartdv-technologies/home/

In v2, I will update the vendor-prefixes.yaml description to
"SmartDV Technologies" while keeping the "smartdv" prefix, unless you
prefer otherwise.

Thanks,
Vamshi Gajjela
