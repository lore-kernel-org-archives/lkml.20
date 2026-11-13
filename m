Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584200;
	b=UOecTTLux3u/Lw39XlwKnb5DnFrRyyXL4ijJdT1NnsfLl4WmbchgPERnfN6GPsG7wznZ
	 iltAFTaC/C1pnbUkfVpWsKhAAdpMTLWLNK84NYzcGRoWD6bNw3UpdDHxOVvuyTGi2t4u4
	 VC7zC4qkIV4dnbEBFBrgezwcnCszG8FaTN4Gv1G02+eT36FZkyKr1Qqm2WOprNqokjopt
	 Wxvsp8LToGVnSLWcaGXUETS8hXb9c4G23qt1tv8zTUUtmZWL2Ca2VBFH0waFJHIG9Tv6f
	 GroWDmMVGm5dXFhVg/S8fszRwreuvHbxBNljATBEVJrMFAbuCHfnFP+JnGRKbMYVYQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=x62ZihgS7kh4nWdNrWclZKqO2BrkWNZR/gkUNOF/E3Q=;
	b=SGsfAXCmo8q2tNPFZf7lNZhIGbAzkDgpez6T57r3MxG28KVn8QxbqeaSnPFM6KzIOC9x
	 PmSOOQ8/8XDOcX36oFbZZ8zpHxzL+nYZUaSDqZNaLQqkRWPrY5yzOCkURVrZLahy3SrZu
	 WaO6usVsVybSyxvFkx/EAHASSIe91xwwiFnJi5eKITxChI2ysGdITjoYYYfqDaSG7TIWV
	 3wIDKcxZDDyvk0pi4S5ZVprtm26VPLzAl4ful2lazuavarf6ojDLrD4X2svzdOn6gnyPX
	 1SeybBwmfg62TuX6R6t5OJrnnGpx2CMSrZ/0hkZ33uxnSvfcq1LkvSpVy90R8VitoIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOwFdNzH;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7F9606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7F9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOwFdNzH
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so14921691fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584198; x=1795188998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x62ZihgS7kh4nWdNrWclZKqO2BrkWNZR/gkUNOF/E3Q=;
        b=rOwFdNzH/fyJv94XjX1UieKx8ePFP8iuZ7nP4Ih6XTpFMPP/l6PmZbpLrStQb/Ejbb
         SB2PTsN7A/l1Y4z5fNNxcv4gkf/VPebjCxm1aUE+9wAHG000TkHrndxkA0+z0d0dXCZg
         kaRKYraNW2gB6WcJp8h3+yoXHLyfR4UAlI5z1YEgK11EAg8u1LcnD8VqPrmODmZYMw90
         37xoGDhB7724r6OLL6En9NLUqfD+aOrgp05SWbCiyUua9YX+kieQcuMsKnEi9gQbJsyJ
         GjzEFTZrCtDeL1vkX/LZ1KOjgUjtPNMsUb3oZPy+++9COmIMLAYtDC9aB2lnGZpa4T7x
         mkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584198; x=1795188998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x62ZihgS7kh4nWdNrWclZKqO2BrkWNZR/gkUNOF/E3Q=;
        b=vT7v3XBVn6Mjdhf0oy+DJ9cucwMq2p7cmBW1JTSTLViDE3X3QG5eIlbwRjPz9tVbEs
         dQixT76MmobYGCHeKn22HXCujPqCdMQrez8NKEF/ACKgUr0jJotlRz5/5RRHYTchpeYh
         1F8KHEjsXDEOP0rLoyF3XdFuNft4B25WEphTPyRkdtblCT1czS3j3L68/5E/s8tbsX1b
         ZIqJh5F1qbgEZpvzUyqlRqmwfotOILrXeOqaKrxRzIJebHl7CaAPqhjmPwZLA+e+uSG8
         0IXAOVRqkPSbBs9HkTvcO0aB0ZNIVDjMwugAV/jOastM19PQslC1rBVzhIh85K3zMlwM
         RYHA==
X-Forwarded-Encrypted: i=1; AL+hErG4RAj2xEOWgIPovlt3MBQbHgDqzefav+acgko90c6VMGoumJweW/V28cG+WiSyxIHfWSulfLz1jIWlAdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n/w0UN3IeC8P8hzYNBdQD8Os62MSXOQLWAj8zy39CMB5Ewpwl
	ZBsNhr9QU+NCwIR7p20q6DbZfukMNOf+7EwrVcaBSe5N2grBxBua8ITh
X-Gm-Gg: AYBFou3J5weATz94P1UwTy9SX4dbzVJRCV3tYNpgPGD5Vp2Dtcw05lDgRSiSzXMVkVN
	pYNsrMrB6gafEcdIvwZ5VV2Zb/PSUP/7IYh1MFSDHrx+nU17oi3iv/1Pmz6H2XEib+TjHjtwz5G
	bs8oEODI7TmnaZjyDFm5LI8nTCPRTRoeEJOcIlZWxFrqwUxZrNGwa5fj2csHbo7QIeehE5S4iSU
	DsZsi5vLH42XcA4EwCWfY55emqhUx+YAXB5hoUkY7OPcPN2ouyU6SjyUqSxh+ifdIAREruldG+l
	KGTcftcQvl11N5GEEHPH68kAw62QgYbAWEFLdk1yK5cLe1FHX5UAZ80AjLGELvT2VmCfaTG6qzW
	/1oBgAx7MhmXuLT3IOzvc78UCbBurl7aili5rTHYZM7rFqw9J4s+RJ9aRVVn/mL4UHXfzmBATfO
	4+u8xi+pXunOw51kjkodxnjJNO+g1GskPcBSvvty69lFFX9fzncXOlx3l9YaI3SMYwqEJIfIlki
	j+/wVjoTktonDH3B7GcuR1dyLO3B61Y4AFCllYpc4NJXyfFbeQxShI1F+iPPYxG4Nsv1MAblbiN
	ykJzCbmTxUy01fakxK6901D8wXFcWmzLk2sNvVnhpPlUhRIjpKAIVm0ozMt8gxg/2+k6tylFSSC
	4lyCh9ABLw7GQ+xuePnpe1pazHcIseVU=
X-Received: by 2002:a05:651c:1596:b0:3ac:97e4:4987 with SMTP id 38308e7fff4ca-3ae2b4c77cemr10278541fa.7.1794584198178;
        Fri, 13 Nov 2026 07:36:38 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7808cbsm9395051fa.14.2026.11.13.07.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:36:37 -0800 (PST)
Message-ID: <ef47542e-308c-4211-9b42-ba2de13f5f82@gmail.com>
Date: Fri, 13 Nov 2026 17:36:36 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] iio: adc: add driver for Texas Instruments TLA2528
 adc
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Rodolfo Giometti <giometti@enneenne.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Angelo Dureghello <adureghello@baylibre.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Eason Yang <j2anfernee@gmail.com>,
 Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 duje@dujemihanovic.xyz, Joshua Crofts <crofts@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Victor Chernyakin <chernyakin.victor.j@outlook.com>,
 herve.codina@bootlin.com, thomas.petazzoni@bootlin.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261113151543.2241604-1-maxime.chevallier@bootlin.com>
 <20261113151543.2241604-3-maxime.chevallier@bootlin.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261113151543.2241604-3-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2026 17:15, Maxime Chevallier wrote:
> Add a new driver for the TI TLA2528 ADC chip. It has 8 12-bit
> channels, that can also be configured as 16-bit averaging channels.
> 
> This is a very simple driver, allowing reading raw values for each
> channel. GPIO mode isn't supported for now, as well as buffered mode and
> the 16-bit averaging mode.
> 
> Co-developed-by: Rodolfo Giometti <giometti@enneenne.com>
> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
This looks very familiar to me. I am pretty sure I've reviewed this. Is 
there a reason the RB-tag wasn't carried over? (Sorry if I've missed 
some change(s))!

Yours,
   -- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
