Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213426;
	b=wo2wFZOIwdelap6A8xBf7Zn5LkwDuUMa4nZPkS9o9P4xU/8zIdjh5bALIJIuTcWQujAk
	 AdBAxEpHwSIrEETXd/uvtkAAmzDsutFqc/ZEFpfx+kCZ83dZrLGz81IBx/aq5EINW8PPS
	 7Lr/J8xkNpuCb6gzC5Vu8K4lZsa1lkpoljIDyzYOc4S5ZC7MUH2OliTnO+oW+iYkxP6qr
	 gYAdELFiMh0DT85ni1WHj//LA5FzKRoYbHCwVj65O3FEEEqWwNKfiLBsuv9C/fNzvnI+N
	 3QTJN2bQ6i6v0o/Ps1l35Enc46QMIn6Q2VPNXsukKZeAWKJ+lhAGoBGFvjSEcG5ch/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
	b=oqUiWQcZGfAzLbRSkKxDGu0A+9jrB2cbZKOXLUJY08YFMFQVtnZu8OGiAiBqT9IX3CgW
	 d2E8rh5EX9JMSGTbpci65c/Cfjfd3fbP607s9j6trJSiS9kDwMN6bkOcgk0wKjz/brFbW
	 s/AhY2suhKv/Wi0lZbeFeOvn8S8Dy1ytRfTpwdH0UsGPObYyOIylHvL1zgpmCD59Mkk/J
	 AOjtewX7q1FWyZsZx1tF5b6ypFMH1jF8Z5j37i4uKflPTNX+H2IlYtNiSgZ8oI0sGGaK0
	 SQ/7HP8cIWoBkAF15dnJpYqcHxjrE/t2GY8UXuej1pSVkNXC6UYmbpjJSYpYn6gH03g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tzw6Rxrq;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEC6606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEC6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tzw6Rxrq
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491971ac844so545935f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794213422; x=1794818222; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
        b=Tzw6RxrqPja/r0l06MJeWiJ0A320QfCoAEQXFBZDyLMfOvcyVsNFSavVL2KeLrAjtd
         Iyy6sj0S3bd1T5cU7P3PvJaphryRjt4v6pqH94tBoCn9qqAdNj+FMMjaIhujpqNpdtha
         qPBGznQGAgMxY/hF4fXcXaCc9KTd9o2HvRfXlP+lfEQjxj7pkmweN1pWIS6Jk16O5q70
         oaXCHBTtKa+EAa8zwwwPq4eaJPiEKpkACrZvRz2jVQMN4H+Jb/kMxFDAcRxY2oydMRnd
         BvQqw9tBC51SFrUfgTtifHxsfqOIaNzro98P7eV+L6u+hjSAxHgCTVsDhAB2FSd6m3ra
         YcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213422; x=1794818222;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
        b=Tt4FUg2XfKEZ4yMzpwIspPBhG2xy+H5SaEb0omjkKiGCKnkia0ymdGU3lKaPndgOcU
         uf4Qh6AOqqt5ww61AlNqW7s8mXsy4ylZE9I6GMaRLt7hbCOcegPE9weBmlmj35FoSzdG
         h/gdsxPE+DOeLfNpHGfxs9zjqOUZI8scuof94CVveS6LHUAcUrk8jcuAjDzRvsIiCwcG
         f6cY6Il7mHmrFV/hKh9EGgRbOKMvcgBracJa5gsOPQpRQDfiE13Be4pQlEdEyyGuqxzu
         qPrLnFU/ypBX+GGkKXrgGYm57w1+cvdpRhif7ytur5ybiH+mwZ87Jx5WklfOGqD7FBB7
         ZRFw==
X-Forwarded-Encrypted: i=1; AL+hErFuLTsLpsuxfPSONJb9TlRtMaJYY/ErO8OQOd5A+NioCpfSS2LjYyyTiQEZq1VUbvSnOEfhEMNuDoqL+2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ifxc69EWX3ONrLxKZJa8EZjgcu7asqLjMhnKIDAEscJB8+KPf
	GtN1SuxthZ6j4whT5V5Wgoz60rabQNOiQzb+Hiotn5tHKILjobNgFyeIRHaXUG+xk1g=
X-Gm-Gg: AYBFou3t5KqfiXRPrzMcWSAEbf0GLrinpQ4Uur1e4qjTi/9i6xO5iiWktvQkU2VbkLl
	sx5L40sdWftegt7QOfBIOxi704SzugDSmVRci3UG+GMkRaTTWlJ7bjEyFEiZLfqxU/qcUhflyyH
	D9+MF9g5hOfuBDPLpwzwmESqBVDv0qgS0pq3CItOLjIfDQUEUsXNi2cgKDH8ScjzufFlIinRGjN
	fMIOJGVEPEZ+/5r72goyUC7v/9yvvKqsd5GV5MR09Ar1Lr8Uoqf3DnIrEpliAKw3LphBhFS6GOO
	LOuy8mjyVJnlY4M8Teee9Z6ck8xBbHZuFtUC2zeR/vJ3L0cPkYFjBeooUETXu4cEANL9GwV+nie
	DbMtwRgQAqzXPrOVIETtz4FS1s64FNNIBeAt1oYFUWTXn+00WZvl8nuRPS87kYlQVLbOvpnH/4A
	fy4cIB+TjIwur/pZsAe5QByWgCSKQff6bgyS+4fIQDh+6TkzF4HbCnLD4aH4i6Cyr7Oy86b6jlv
	dVSPdB5K9vyXkm4jmceALjMvuTRfEggMgSgt7HEiEEot+2kPfh4J2MGtIeN+kF3EXfTA1BxAMtd
	QmAyM7+nX2COO8tqG8884m9Nc2E//0JBFqj5N2NcSF+GbVUe
X-Received: by 2002:a05:6000:383:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49585bae5b9mr5896344f8f.49.1794213422144;
        Mon, 09 Nov 2026 00:37:02 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm8320547f8f.7.2026.11.09.00.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:37:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>, Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan
 Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
In-Reply-To: <20261108-computer-backed-d98862794d18@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
Date: Mon, 09 Nov 2026 09:37:00 +0100
Message-ID: <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On dim. 08 nov. 2026 at 23:21, Conor Dooley <conor@kernel.org> wrote:

> On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
>> The S7 firmware exposes clocks through SCMI, including sources needed
>> by the other clock controllers.
>> 
>> Define their identifiers so devicetree can reference these
>> firmware-provided clocks.
>
> Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
> vary here between versions of the firmware?
> They're also not a "made up" set of indexes, like traditional clocks
> are, they're real numbers that come from some document akin to
> interrupts that we do not have bindings for and no driver is likely to
> reference these definitions either right?

There is no such document available unfortunately. I'm not sure one
exist to be honest. Those IDs have been stable ... so far, but sure,
a FW change could change them.

The IDs are totally made up, in the very same way the other
amlogic clock driver IDs are. Providers and consumer just need a common
reference to desginate clocks, this is it.

>
> Is something like this not more suitable for being included as a header
> in the amlogic dts directory?

If you think it is more appropriate to have them there, it is fine
by me.

Carlo if you have to respin with this particular change on the DT side,
feel free to add

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

>
>> 
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>  include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>> 
>> diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
>> new file mode 100644
>> index 000000000000..10d7caa5d1e2
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) 2026 BayLibre, SAS.
>> + */
>> +
>> +#ifndef __AMLOGIC_S7_SCMI_CLKC_H
>> +#define __AMLOGIC_S7_SCMI_CLKC_H
>> +
>> +#define CLKID_DDR_PHY_OSC			0
>> +#define CLKID_USB1_PLL_OSC			1
>> +#define CLKID_TOP_PLL_OSC			2
>> +#define CLKID_HDMI_PLL_OSC			3
>> +#define CLKID_USB0_PHY_PLL_OSC			4
>> +#define CLKID_USB1_PHY_PLL_OSC			5
>> +#define CLKID_USB0_PLL_OSC			6
>> +#define CLKID_ETH_PLL_OSC			7
>> +#define CLKID_ADC_PLL_OSC			8
>> +#define CLKID_CPU_CLK				9
>> +#define CLKID_DSU_CLK				10
>> +#define CLKID_GP1_PLL				11
>> +#define CLKID_ACLKM				12
>> +#define CLKID_PWM_G				13
>> +#define CLKID_PWM_H				14
>> +#define CLKID_PWM_I				15
>> +#define CLKID_PWM_J				16
>> +
>> +#endif /* __AMLOGIC_S7_SCMI_CLKC_H */
>> 
>> -- 
>> 2.56.0
>> 

-- 
Jerome
