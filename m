Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793418091;
	b=r4F4xC0y1unB/iOj7aOZIatFC3Q2h364bg5SeUVPUjwi8m/aF1+8Zo2ypug+KlM9G8Bt
	 oYOQ6xKprTiarDp9D6Tax5S7EQQa1ch7LfOwFjKd3C4kOJrRg/isM/1f8KbNSc6XNqBfz
	 6oyTRCNiCUA25wkYQZNCivcw3tjbpD1FMCHcCsmRdaQXZfB++7XuSIExZllFEXQJNtsKf
	 ZAaJFHqHQ8HKfVx76a7SmAZcd7GzAZ4fwHbPlnirYGK9c/aGDrp3n61dUBTJghnSFeV4f
	 FfFNGsgO10UVVXxX/t9IC+n0kGJuD8E2NJVDmV3vSD3Vm89YHiYT5OY70SH84T/z1aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793418091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=wZvy9SzN1+/ZQllAihZB3y4rVnQ1u74CJPCb15ddjFY=;
	b=GQE/030RUpa80qjYjX0Z+v0RdZsZ4l7UlLWW7K6kxinMh21Glb0Itg8tPLUUq4x8XBon
	 kTgjl06ymtT2v5ysuzH2cBR2kaYXGFfA/2XVK3uQ7qQnGukecLpNu0Noqqwx2gOPZH4Fz
	 gEGWjxtioZo3+NruLhNvyAr/lY2rquI9SAweRjgDcTvOy1KvSbcBD0hc4umVCFcAer0qE
	 IJmNWF17JnlxcUDwjMsEsQ7/UzEAyRYKSxuUdVsuPjKHHmIcJdd5969Srfq/3KSFtiViY
	 l9giwqoPW8p/4YUQI5H9sF1Ufk6ACZ2QY/moWdyz2g0Fn0nM58bhnk3iOZRrDnEzO4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VKYK/BoK";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEB3606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FEB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKYK/BoK
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1aefd1bf74aso120406c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793418090; x=1794022890; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wZvy9SzN1+/ZQllAihZB3y4rVnQ1u74CJPCb15ddjFY=;
        b=VKYK/BoKU5h2LLHXcYgZtRYZvABMiPirQNSKunFJInYvtkh33JziKXOktTRrIEv3D9
         SwhnAwhw9y12bwZn65GFRbietahrwxaen7g2m/zFX1ysgpRsTnOsLjihHYhGj9b457Qc
         w8d1z2jXu66QfylsCokq+hDBPkd3wRPAzwtMiMmNKvApkhupEJxe/ZuScs71zWEFlw+A
         N9PuiMdNruhDO2eetDIde3GiXdjdGdX/iM9vHQax9hOeIHxMfGi//Pw17+rOWnQCBTAl
         I9LSe8+rPC33wtqEPJerJSrY9h6/u1GNQ477htMD2Gvycjgz7duTY5peff3pw6BrX+Hi
         9Z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793418090; x=1794022890;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZvy9SzN1+/ZQllAihZB3y4rVnQ1u74CJPCb15ddjFY=;
        b=ZgZ/VhBskeJoMmQk0KK5JHkcgxU1O/9Pd6OFvNBqIdqNjBH9V1qaV2uU43PS/GQ5La
         rJCDZCkgRqfBAFVNr/4NhN7y1Zj4+5Uo7qz+WdsQP4ZfKBbXX00KAzQ1URCrqRxvKRRL
         Piwet7EA0yEl9wqmhaP4cBFfRBZYLLoUHgh/Q+B9u17r92jotywz+Mwr1IctzDim/pWs
         EVUA43EG8ax3+aXmFWE9dbAsmm38bDdtgTQMEtB3vuP2wIEtPDwEp8RscO5uB2UCRj3R
         zmBCWEllK/2DOuln1AOvx6DZhk0cStCBHySMZPs8myC05CzDc1ElaQQMxAO3NB34GRq7
         42GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPyhTyxC38+s9EYOK7cLEx9L133SltXqO+nfId4O9boYUHTwmWRZsyymXwmEgssXmbXcdD5j/3GNco6IU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlHYa6S+xE42o/p6RQk7eHNeM+3Ur4LGg5NAewZio9zcwcgP/T
	6pxZGuZcN9BvE1penEs1Mfm2NqCFVniW3XQivDzSM6+4DCdNFug/yCkU
X-Gm-Gg: AYBFou2JAbCoUkchfwxP3VYYGit31Z8jYT84uqkUaXMJlxUkUmxo5PZGlc+7S/0y9/X
	2OPGGFVN/2HHYjzOL9YTPZ9mx71LVr4w6f1mUpsMHfioRo2gBe4VBlFdR6triUXtE1w4++e/Eyc
	eXQDTR83UJrGSvrfXplkZwVUBXbbWbc1iS8iLdNy90ZWuQOYALA7uk5ZVrzkCr3U8QMZlgk5rb1
	lwkcUBNmAqLziU3fnJBHUhHFQTCsvfNsr7PYg21y3AAJUcbSdly1OPtysSiCwiLHh2B2ksoaoMi
	3JzzJuctp6uuPz0j3zgDFcdFBFpF+N8bETs9mtxmQh+D9NbJpqkHedGsyZTLHgxaVF6//nSibIt
	CV3hfT9poYcQsxqj+DJQvlSBLoAZwc38vqmxEa3QV+BoroMtrXcUAuae5q7NhK88GAM7ZGKiWMS
	y9nlDGtKJmUdn4wGk8XlgHdDskJnWxUk2DC05XIsuVYgo7qq2be6qvfVm6GPTN9+KsY6G3AAohO
	RCV37CLBWm0dzCot9BZ/j5Dd6lVnmwQgn1vIZwYhsOYmiN/NLnp+u4UJvsenScn8NtFDW6XcO3B
	r6gGn35QbjrY5+IlKR5VO6qlU3Pk3daQJ0SMiR5T4QGO/PTGsXOIwMSgc53C/fIDhaSkeJQzRM6
	w/c+N/l2mrso+EWa+8My5VBr/EakJNF/xO5bzf6KRax2BTCEr/DbYvPcfZDK4R1fiBotXRuv9xE
	VgTuWVH5LEIlCYQsha5N0ui2GSsQ==
X-Received: by 2002:a05:701b:424e:20b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1a9496c2e85mr10732429c88.14.1793418090155;
        Fri, 30 Oct 2026 20:41:30 -0700 (PDT)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm13084809eec.20.2026.10.30.20.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:41:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Frank Shi <shifu0704@thundersoft.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Neal Gompa <neal@gompa.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject:
 Re: [PATCH] ASoC: tas2770: Fix VISENSE at sample rates greater than 48 kHz
Date: Sat, 31 Oct 2026 13:41:24 +1000
Message-ID: <7grM17yBRo6a58q_Jnwbgw@gmail.com>
In-Reply-To: <20261031-tas2770-sdout-clkedge-v1-1-5266daf35f4c@gmail.com>
References: <20261031-tas2770-sdout-clkedge-v1-1-5266daf35f4c@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi folks,

Please ignore this one. Will send a v2 shortly.

Sorry for the noise.

Regards,
James


