Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878277;
	b=vfSFshuiJ7IFOHtW6kQkiuN7DX609J3owsihJN3/V9u4AYV/Uoo5DgmLbpLZrRqbvplV
	 YZ8fe3l0ql9M++0MPw2V3jWID5mLTph11zmhgsFRp1ksQTbZ9tEOBzi+lNAYYPPFvpDOv
	 RTj4CYaIE9D0lJs1anW3FukplW14zDZjSnKyAtbcDb90UXEkgIoxDG49Zbem9OHbVpIOx
	 1OzU82GD7EFMOsWp0bAgM8QUdv3gdsMxaeU3g9a9xr2gyCy5WroBXlG02cDy3EGf695aF
	 QgJGGrHAR0twZFQPm2IXWOLuPxubqSvDeJAUO1fjuQEdz1JePSAEVUABUMkxmenuKgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/DUl5nkubottrq+DmlqmVS5vhvOiDyY993sZh0Q2i6w=;
	b=T0Em1aRA5mQXB+jMqbpCTOxS2GKvaT88xsJaJVrLTm9V2rQO2ADITQ/z+l9fabyZ6tIE
	 5cXu3ObYNpZdxGU+c/rDYqg3exaDVXcn9ipvSbX2iLMlPIJOQIUos0wATTVWudtBSPlaD
	 h3YdAFoBGUth6VU7/1fuxB1ErJ7xO+xA6ndcxSPhSRulRkEm6G2eJkFziOmP3105qqiPf
	 V7/RDRklqKl4OiM4LrOC3crB64cbMo4GGiEuWqF9NZLsiiY2Qwl6pilp0Z1JyekqubO5G
	 e4RtF2Y0K1PtBkSa6X9UNitDQztXYzPipJ7ubtURilM+Q9GX3UH418hwLEDjBMJ8POA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4YS2TRG;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B473606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B473606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4YS2TRG
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6768530eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794878277; x=1795483077; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DUl5nkubottrq+DmlqmVS5vhvOiDyY993sZh0Q2i6w=;
        b=P4YS2TRGiYo+OE7Dv4hYMsPhD9R6X+IqEgqM1bI5izV7LBwohPF+81z9NiZdW67eJ1
         m7XeaVnppGN5G37RPH6T4BqsCep6GsYY0TuTU10oc53Hump2xMM+VTdc27Tb5RgdLCPV
         4+oL3WKazs1Amc+QYAp8rat3K7noIPd3NgTpasLSxWs7gpJofGMod6+CRuYQrn6DVHH2
         7vd8KdTZDK5fV3vLSUu9lYdH9ooZce6ooqD9KXYv4KUb/oPqMtZ7K6h2QG1pWwRkYu3w
         yku/uBmh7c6dXXJL6vgz+3VLjVaI/ShTyQT1+bs+4CNxmdDRq4Mc7GZ77BBRZ0dmRWKB
         +zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878277; x=1795483077;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DUl5nkubottrq+DmlqmVS5vhvOiDyY993sZh0Q2i6w=;
        b=P7B/21ragqeJ2SrD8r2nIxsO5/rb47i22K7izdO9l3qYgyL+zlMyizhiqs5a9spSj6
         pk1EU1F/TqM2nT1R+BGH1KUDHwjF0wMn6tgVZRJZLEO5UC4xfz5ZlzTLQ2jdbTbXp+80
         zFKI5fs0SbWRad6Z1/bbKs0ysuK+HiotjSCuLUhJTsXgY69aI7khIxfoRzSjyeDzfQse
         FjJOgN5hBwsBCL8k01Djw5CTxp4huAlJwe48kYjEIr6YEzS/aOsCZ9ExOcUjY3N0/SDs
         WJAl6O/0w5kA9tLYm1JEgPm46owVVvBYY8rQk8aguFVZSZQtbmY7UoqFIU4umjV7uKV+
         q3qg==
X-Forwarded-Encrypted: i=1; AL+hErF5dyDUdVXntSyGNMLZtYz4iF0k6heukFJM8ztWwBPJu0wYmWMEFp96EFGMoDUE6A2eHvEa8NGiW4yA16c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cL8z07f1MR+EDCZ8LzmTctJhu85+H7MxpWTfO1vBp/FTuDvLu
	LRQgzbQb/v2w4HtKQzN8HQfNapd6O+Pvc6Idla7MP08pVL5tva1fi4g/
X-Gm-Gg: AZFdTZfnrFCBf0kMQ7h3gtGXnHg86F+E+Z+9MBjR93RQhBlNX28h0jI4pXTT6aVaFQA
	b1hpTFYUSEvswBBeit6j6p77geFjkyGS5+smAfihzSJesM0uxJsXQnE6hkIDF7ONvctIjQD0esA
	4i25sRbQwGr171K9YQN2oFz5lFx/RNl7Pm3EEa/rTWB+ZZWiRNP4gUbSxtqdpKnsbFzVZAWuO2L
	LQ512jW6gkiPTkKZYV7oIOfB49Dcoy+k84ZtWR9xII0p20UJ4BiU0migLmS015/abd5ctt5vmeN
	iEIsToGKNoVHikS7drQmElLsxzQVVIlH3zUkByVh4C1BWhz+zKEhv2Eyms9NLQCpOmnDhQiVPU9
	Y8Hea4auJ2gZ9x1bCZzwXOK0wdPN0/YE1fsTZGuIGRXX9uxsMeyT6bnPktH6w6zqzYktPMKtVEM
	uwwNIW+zXmOn6elFnxWGF+Xhtgcq1NOVf2Yp+AXsEsQEJ+T3BBL7lLLuK3ge3PuRzLLF8uWSOpv
	mGXqkYtlW+00wXyJfPcf48ynjvtubj6043Qh9dSIH5usG6yj6loE61xd4+eVKWuY89tm6p5vm3U
	Sqlnq0AWwnNMJ6DtAKnM29w5LyOAu6mXnrUzL0DQytNI87zuCzfWiTu6/fZ3/NpshENY/2HkMEL
	8ilKv
X-Received: by 2002:a05:7300:540f:b0:380:c3d7:c263 with SMTP id 5a478bee46e88-380c3d7c590mr2579893eec.5.1794878276258;
        Mon, 16 Nov 2026 17:17:56 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm36639201eec.22.2026.11.16.17.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 17:17:55 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 letux-kernel@openphoenux.org
Subject: Re: [PATCH 3/3] pinctrl: ingenic: Add X2600 pin groups and functions
In-Reply-To:
 <afd42cc2ca2c93501ff1769b7d7a25559ef68a2f.1794557697.git.hns@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
 <afd42cc2ca2c93501ff1769b7d7a25559ef68a2f.1794557697.git.hns@goldelico.com>
Date: Mon, 16 Nov 2026 18:17:55 -0700
Message-ID: <179487827555.2153459.1199232821591145638@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Nikolaus,

On Fri, Nov 13, 2026 at 09:14:58AM +0100, H. Nikolaus Schaller wrote:
> +	INGENIC_PIN_GROUP("uart1-data-c", x2600_uart1_data_c, 1),
> +	INGENIC_PIN_GROUP("uart2-data", x2600_uart2_data, 1),
> +	INGENIC_PIN_GROUP("uart4-data-b", x2600_uart4_data_b, 2),
> +	INGENIC_PIN_GROUP("uart5-data-b", x2600_uart5_data_b, 2),

Per the X2600 PM, shouldn't these be 2, 0, 1 and 1?

> +static int x2600_slcd_ctrl_pins[] = {
> +	0x34, 0x3c, 0x3d, 0x3e, 0x3f,
> +};

PB20 (0x34) has no function 1. Did this come from the X2000 table?
Should 0x34 be dropped?

> +	INGENIC_PIN_GROUP("pcm", x2600_pcm, 3),
[...]
> +	INGENIC_PIN_GROUP("pwm11", x2600_pwm11, 0),
> +	INGENIC_PIN_GROUP("pwm12", x2600_pwm12, 0),
> +	INGENIC_PIN_GROUP("pwm13", x2600_pwm13, 0),
> +	INGENIC_PIN_GROUP("pwm14", x2600_pwm14, 0),
> +	INGENIC_PIN_GROUP("pwm15", x2600_pwm15, 0),
> +	INGENIC_PIN_GROUP("pwm-trig-c", x2600_pwm_trig_c, 1),
> +	INGENIC_PIN_GROUP("pwm-trig-d", x2600_pwm_trig_d, 1),
[...]
> +	INGENIC_PIN_GROUP("wait", x2600_wait, 3),

These groups aren't in any function.

> +	0x000007ff, 0xffffffff, 0x7ffbfff, 0x0000ffff, 0x000ffffe,
[...]
> +	0x000007ff, 0xffffffff, 0x01ffff1, 0x0001e000, 0x000fffff,

Port C is missing a digit?

On port E, 0x80 is pull enable and 0x90 selects up/down (PEPE/PEPS).
Doesn't that make the X2000 pull code wrong there?

Hunter
