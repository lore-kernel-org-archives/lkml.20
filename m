Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF22491581
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988819; cv=none; b=aX8r2BpfQhWhS4sWmf3/Kw24x0jtSgb9ct7+TPzX9Xr9lJNN72SAiPaiGxswoeyMAkSd2nzFp3PXsf2xzf+ZZWMD/x3lYTRJcbngmKra9ehK4RgJu5Oyumv5mqI+xsk4xAg9jKlQucEtH6q+WaNtzXzVNSnIYQKewS6Jrdtjwgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988819; c=relaxed/simple;
	bh=UUOINDD93jJS+LUcebWPI3js4hVCQibaR3IC0U7k49c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=H30n4bCLutLM3DAtzr8O0I9SbgkpvfdYu/35XJ8CN7So16bNe8TkBd0Qa2wWvaXR6L2EswfpCh6ERUISclgjXfwto0kT7Zf6zWnLNXBwSBokaWrjvic1pS3EZLrQIEwc2A1YjsJOS8+jS0YPqRThJKXZl2slxS2sjmyDLa+Tobk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmd4dzw7; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmd4dzw7"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so25282355ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988815; x=1790593615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycnprV0l+QiM05HZAYzXXqeG9wnBaUsBNe37TTIlwsM=;
        b=kmd4dzw7YZwUGOpAohpIZBA84zGfg7XBW2MOXiu/6PtAIAey7CGoejz0Zx3N/LAUQY
         hFXz0jGOkd74aCYP98iga4k3O8w5+pl6eeik3e6AgCWKaNYVNkL0KJ49+QuGXt2TOM/s
         /JHmiVKtrRmdFk10TkJzqzwvM4DA3c65JItDPe7ALCMyGcfHUZ7IKfuvW9BuYSq5v4YU
         5wep9KIJutpDUF7a8BqfsG3nRWCmXCfuNK+qLGffBqgpR6zEmK4431v0FSYTS42e2/CL
         USWzYRVdteKi6yadRWl0nFHsuyfd4szDleMnlgzO+1zis8tdTbWLsol2SHHHcRvzcnT8
         GC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988815; x=1790593615;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycnprV0l+QiM05HZAYzXXqeG9wnBaUsBNe37TTIlwsM=;
        b=LcYalUPGYMmWKpusXuVhrKc0nGEsRkYPHuKQ83+9o9IMJuzgPb9dp1BnVyRhn/V+p7
         ECu2ya+y+p17Vntw8AWC/Rq9OtSLJaUZul0Amdl3oo6RhgE8qk+D0HazmOji1lljRGz5
         pGtH/1+BJscQ0k2C/H4zDELnbSb196MZVzF8wJBGs4hDoDoMZNDXzqHMPzcgAimb52/B
         xmRYqqgCCfKLqzX2ofm/lwOpIqZL492NhU4l5vvNB3bVCwBJQR70F0Z9LHKOvnrBVKj2
         rhiHyEUurNZlcEw1t1n6u2SoAt4bvmcYPVjVoH36u5r+JTsWsM8n48UAmIO5gXshccpO
         6CDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwClXK4VA0p8cgtUIuC2PaTHCEQcCWGhFPO3gb9gTJNB3OBbgO+ACDeMBT65OWgTTOseIrs4j0+Y9Z7/fI=@vger.kernel.org
X-Gm-Message-State: AFuF++kE9sEdDL0p6R1aMlofAbkr/NXAWmsS8tyonnyotg2EMWBsI8wg
	rVzWL7u/lZBmfvsjAxGsFLKDJ3PAlw/1+s0BH/ztf+75P1MhNsGGEvV/
X-Gm-Gg: AYBFou3yBzXfHwCcErcYQX0nUwLHblGhTAOIxsAmnRa4eT9ix9fHu0Tg6BRniCBn+wg
	vteGMOJq4Gy7qBGJIvK7NaPqchjmoGT58E91/SwKa2cBAfrxHKdiSG3Vs6XVDAbIiEbwkZF4A6L
	Lo8PYvF96bLgCfKEcOvcEXe8Dis6/nxZZjdADbVFfh3IDh83vkMiet5wPFiJRA+93Qc/kJWeixc
	3nesrl6RiBBq55CQ+7apR0aNPvsfTmFMZ5HpzNdEj3KKbHV7+jRFJ55We4Wjt/aFE+RDClM6FSz
	oOHC56FDdpT81Ee+Smv1zzLudaw89mXLCBxRP5uRvafPXRDijVTg49Xt5a0atgBBpxS2X0W1V5P
	/fuLJMSQkLgFg0ocFRrlsB55EYuOItcc7oKC6h63S0KzfVv9EUYgs4HNm+Vpa10NaHrkR+w4tvz
	RppDVPKfTAna6U+5OmJna+B7HjOnZ/ZY5fzMt3FwnaRUWlEEawhK2sxRvQOmE0RUPtXWCWU4MSv
	MZ4Jxw/kuQThxi04v8gw+IPYedncsscb7uLdncC2lR6naEGO2f1x3P/bC8CjQ==
X-Received: by 2002:a17:903:2447:b0:2d9:43f5:b462 with SMTP id d9443c01a7336-2ddb1b79df8mr144230985ad.5.1789988815140;
        Mon, 21 Sep 2026 04:06:55 -0700 (PDT)
Received: from [192.168.151.214] (222-228-113-186.aichi.fdn.vectant.ne.jp. [222.228.113.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba719sm31428165ad.56.2026.09.21.04.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:06:54 -0700 (PDT)
Message-ID: <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
Date: Mon, 21 Sep 2026 20:06:47 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoshifumi SHU <envzhu@gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: arnd@kernel.org
Cc: Frank.Li@nxp.com, aaro.koskinen@iki.fi, alexander.sverdlin@siemens.com,
 alexandre.belloni@bootlin.com, alexandre.torgue@foss.st.com,
 andreas@kemnade.info, andrew@lunn.ch, arnd@arndb.de,
 claudiu.beznea@tuxon.dev, conor+dt@kernel.org, david@kernel.org,
 devicetree@vger.kernel.org, enelsonmoore@gmail.com, festevam@gmail.com,
 geert@linux-m68k.org, gregory.clement@bootlin.com, imx@lists.linux.dev,
 kernel@pengutronix.de, khilman@baylibre.com, kmehltretter@gmail.com,
 kristoffer.ericson@gmail.com, krzk@kernel.org, linusw@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com,
 nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr,
 robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev,
 stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com,
 thehajime@gmail.com
References: <20260914140821.1805449-1-arnd@kernel.org>
Content-Language: en-US
In-Reply-To: <20260914140821.1805449-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd and all,

I would like to request that the core Arm Cortex-M support be retained, specifically for v8-M.

I'm heavily using Arm Cortex-M / NOMMU Linux for academic research.
In particular, I frequently run Linux on newer Arm v8-M (Cortex-M33/M55/M85) processors.
However, dropping CONFIG_CPU_V7M also removes support for these newer CPUs.
Because v8-M is highly compatible with the older v7-M (Cortex-M3/M4/M7), the v8-M support is tightly coupled with CONFIG_CPU_V7M, despite the name. 
The major differences are essentially CPU IDs and PMSAv8 MPU support.
So I need the majority of CONFIG_CPU_V7M to support Arm v8-M. 

Regarding platform support, I don't need Linux-side device drivers.
In my current setup, Linux runs in a virtualized environment hosted by an RTOS (like Zephyr) and accesses devices through virtio served by the RTOS.
I also understand that maintaining legacy MCU platform support is a significant burden.
Therefore, I don't object to removing the platform support, though the MPS platform remains convenient for bare-metal testing.

I am willing to help maintain this support, including modernizing the relevant code. I can regularly test kernels on real Armv8-M hardware.
If an active maintainer is required to keep the support, I am willing to take on that responsibility.
Please let me know how I can help keep the support.

Thanks,
Yoshifumi
