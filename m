Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598609;
	b=CMVe4gCKcHnNLZTm6A2KAHP2VYCG/r3m04QREE5AVaGkEKA8m+CM4EzWg/WbQEBiWXs2
	 WsknSAsxRbd44vhHWT+ymH27nj+vCw1Fne65aQOIR6oM5IS3hSG/KA+vSCiauycHyPeFg
	 U+PRU4JyEhFowb80PgVeAllmO4Alxo8CoA6IcxfV2giT1/WPgzYYeV5BR1kt6bTfJCqso
	 0UsqL9nbwEzTFaGazNXzKeb9DL4yOVUEloBIh4PFQc248GEn5TWit3taISlJK3HiPjuvm
	 T7Fq8rws0QmLEbitLCyrEWcOzF2ilSgGIm9PpMlwbKmhO0E5xwIPU5hZuKOrK/qE9Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=;
	b=XAQOltJj9FrTU9c+Qr0HJN4sSqRuxna+7fYcbR6Vii0zf1+1rfnMTxrNTsQABOI+sWup
	 LGXnIpbIGWLhTwY7eHSF2PzfpvpAz6K62z1Gm/xS4O9Yq58wuftthJ6cVbOdiTLftEvgN
	 DYCSDCxOUj5HcgCZuYzVvn7USWSpvp3xycABWpvE6P7LLE7OeeCB54uNFzl5TIkMAOv0e
	 mRDjWQn/8R1gYPJwrIwVHua7VpLnGsR5f2Daw+6Ad36zqQ7bkAU66IaUtKq01TtzBT8Ny
	 Azk3QqdsLKHSToKCC60wwOe7LDoCcr6Izggqf6WqoaD8robdckSPYWjlH5nvfYHCXHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ODCOUX6J;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE2C606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE2C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ODCOUX6J
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so6904255e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792598607; x=1793203407; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=;
        b=ODCOUX6J/nS1bCRsALhyLHPBU1C/xS1fj8nsp286e4DZU3u9ZxMeUpnPoTjjFJ4dt+
         OhIjX8/kTsg8hZgQl4jcGPbP4QNI3iLqN4j8UIcStfSU5AaHDykBzJsuvHVVHQmq3ULo
         ccu/oNz991Yuuc6hNeqdWrNIGLZPLWYCW037fOHYAAG5Vbcxm4ht4dgdVr2oqATfRecE
         3BOIlfqLELk1H5r7OKFZOcJqHhYCmA3w2/j1hCocM/Ep8NH0Y71ljW2kFVkP8NJSyQnE
         RrmkoBcBg3f3LU6ktePBz8jrf+jg+IpysFIyzWJ9IoWzMg7M3//4Cn4lsnscoKkehLa6
         pQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598607; x=1793203407;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=;
        b=cnwKHZBzFJaVfqL0W2+UdhB3RNHKeJwRHDJ6zenzjVqxehnkWsgesAyn8w/e0DNtRs
         RouIpJSTUYTyypJHhPG5j4iXyNP8Lmig/uwThy3DRadGT73PGcn2h+C9Gim7mrkiN8Dg
         TT0kZfStZRrtXY746p6MD1u2S7CcNLUB8xDrSoFvoon+xRCdD0nR3uPfexmYzm4lrce6
         lq4hYHhTBzNoDxyNCwx7kDdN+hU7GN6p38YVh4U3gb/MSA//CWp8L2EOeeq0dXen3n6C
         t3AuT/eJTigZ0lN0h/dKgfCMZSu7V/kwHWmXXSJJwRq0x2Wonxznhn+LCRx1WovrkZQg
         aWKw==
X-Forwarded-Encrypted: i=1; AKwUvBw+57b/56Qlv4559D8wAIxO3lvZBvQDArLcblyY4xsOB5wssNt9z/DdFaEgdIelJdxulffg3XXRtmlxqXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiaD/5U9ET06n3eWambdnEn7OLXr1C1didoDYx7ri5scLkXbHh
	A0W9+HgW67ma6uzmTVQBmSLMuyrPjB+hX4JhjKHD5HmswuijswTkNyvXgMf+6HBAp9E=
X-Gm-Gg: AYBFou1F7Rfzx7kGbzDo0JvgUpn+DVNCipLax6SJwErwLbOwyZJ6g3k06JLg/+GMtup
	wG7JzdAx+p7OSOw/LG5xgXpu5I7z6ljoaceEj5yPxLABzPjCcNFWI/8BSanMp4HTj0zLv3lINH1
	MzWuq5xe9iFrVhSOXj1vxMdNje+X/XTk5cvx51ZdG+EgWYaCO9NMS6jqfOpqb9R3MVwlo969PS9
	RM34ALsQOGWx1Lzs+hxyYOARqZNx1xsFu6orcp52VqT89PYB+wuRfspUPK+FFr6XgB+UY7IqXKv
	Umr3zgxOVIy9Ncj5wceGHKoldZ6LXP/5IjXkl7J561mQ8hJtoaUMqfr7Naxzl3G5x3hTgkn4dEw
	WwflwMSU4g/bkCefeXmUVGcws8RDt1xHeAEr1jNPUY3qONHZu7+06L1G6gegd1/roJ1XwoGRoaU
	PDPCcufyGhJqZbVCheVh9w31vVBdcr3SDkkc4IVOThUI1PtHKTe8xDvh1fVrKAk52o62WGUKxTF
	QBdMqQGhYdbxpmvPIK9Oj04dzYcRZD5t5neASbrRy7aKVj7skPKhwvl9Vklz+Fsi+b1gux6rzyk
	9D1kSjatI6aIgdgX7AEQHe1lpiUjvwSKuT1C7eb3T2WoTQA=
X-Received: by 2002:a05:600c:4fc8:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a1fdd2472emr58485645e9.11.1792598606167;
        Wed, 21 Oct 2026 09:03:26 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm53982045e9.5.2026.10.21.09.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:03:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 18:03:23 +0200
Message-Id: <DMAN65SWMXQ0.125AVDDDSIG7@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Paul Walmsley"
 <paul@pwsan.com>, "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Christopher Obbard"
 <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Linus Walleij" <linusw@kernel.org>, "Rouven
 Czerwinski" <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
 <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
 <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
 <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
 <20261020215143.7dd0ad5d@kemnade.info>
In-Reply-To: <20261020215143.7dd0ad5d@kemnade.info>

Hi Andreas,

On Tue Oct 20, 2026 at 9:51 PM CEST, Andreas Kemnade wrote:
> [...]
>> Sorry, does dm814x.h not look as bindings? I'm a bit confused.
>
> probably also not the ideal placement in bindings.
>
>> FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
>> Following=20
>>=20
>> Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs.=20
>>=20
>> For a better solution, you would prefer:
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
>> - Replace defines in dm8168-evm.dts
>> - Add the header in dm8168-evm.dts
>>=20
>> or:
>>=20
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
>> - Replace defines in dm8168-evm.dts
>>=20
> Hmm, there is dm8168-evm.dts which uses PULL_UP / PULL_ENA
> in nandflash-pins. Do they factor in this inversion? Do you have that boa=
rd
> by chance? We probably need to take the brush there anyways.

Andrew has one, AFAIK he already tested that, it should be fine.
We are checking the schematics anyway to be *extra* sure, but the board
boots and all the peripherals seem to work.

>
> If I had my head in some OMAP3/4/5 dts files with non-prefixed
> defines, I would probably not object against any PULL_ENA without
> DM816X_ in front of it if I am not very awake.
>
> So better do the undef and not use DM816X_ prefixes there.
> Maybe rename that file to dm816x-pinctrl.h. That is a bit
> inconsistent with the other omap files but at least that inconsistency
> can be catched by the compiler.
> Other arm32 platforms have things like e.g. nxp/imx/imx6sll-pinfunc.h

Ok, it is a nice idea, I'll refactor in dts/omap/ti, using the same
pattern as dm814x.h.

>
> Regards,
> Andreas

Thanks,
Ettore

