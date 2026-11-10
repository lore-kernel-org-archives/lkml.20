Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322057;
	b=3n9T9yEQzE7ovupMnlXW09ulsrVG75I119wRRu8LwPfWx87i6voYqm5EsZH92fGlHPxQ
	 6D77TEut8/1I9LjXgIn3inXpomELBv2UwcrGnZEkaaDn/t99mzJvMchAE+IxL8ToDs9xF
	 FmCtQ5M+pJspAwHiIVDeTpTTai8T7a+czOJrbt2tl3OQw3eCOOo7D+dRFSPqWQBsiL0kg
	 QR6G8fx/rGHbXhsn0ajhEq/NwoFQR8FHYvkfq4V74pi3nG+AFPaTCkcUdAVYgPJKVAqlZ
	 ouD/8lrvGhURNyBVxil860UGhL1M/qPeNJw2D6RGE5UyyTX6iVBRyQxiQ+HVVCDQy+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=;
	b=mN2TUCPnhty6I3UiQg8mbrglXm/8sY/aC7V1q01TLgy/f6/4WUNbqbGjBnYG1UlqdSg2
	 avxr9INElE7MvWwQfI8UwJu4t+xEehATH0qneMqL9vDRBafs0ff3x1RY1ddrL/bQ+2w6Z
	 TM2w7RjqsFaeLcSEY+3AtWklw064voOecLxdjrKVNpFoXZ5vilNpcl21wh62VJEAxSDNE
	 TaGErqdFvCFXMxHDJga5M3lrcvtJ+0Ykr3QWtz6JP3OPn0lVbIEuUkFJWV4pj5Se2Te0D
	 fhMoFFHFpxriwgl2KwDsiC2JwUauObryA8QOPt/fIG15q3Pq0XXl22zsAbMBfO1cLfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="lxQqOG7/";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE0B606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE0B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lxQqOG7/
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490f38e9688so1680917f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794322054; x=1794926854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=;
        b=lxQqOG7/ja3vQA3ubzTTIQQXnhHfPS+0aO2YnX7lae2OVRufASV1+doafyCZBTaKNr
         j+LVB34btw2XqAN9zO80UB04MX2wvWDSAaeIgqgzy09tS7K03khvWHJfsbJ3yE5fG7w1
         V1Y2hyUUGrxfopBFqMceSlnDujFZCC7M4rETAOUwOtRgmyj9Dz2JqaENxkNpcTKvOCYJ
         FOHoAKiTaLPRDLPo2MEqmTxxOSMRnZoSAp8o5sxRuz1y4ZYpS8h2JO2oPTuDHc8OyqpE
         gdkdqPf5esqDTQBfb9CPFOQjrCFdLQE9c1uI9wEa2IRvjK9dLYjshru49vGfQPPYXEgg
         yDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322054; x=1794926854;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MO+byH4b4UJciY+YAuSXOwdIPo4Acff/hgRSnkQLcP4=;
        b=DjzHMCVatAlzwBX35/SggLvSZPj3M2XWp7ZCt+CeLjL28b9KiECBL0OdiQMMkhkBCF
         MI7NmQrSHqn0g3+Sbrvo23Ll1uuVzY/N0a4biHXwtioKUXVYILq5cca4w97ZywocFN/A
         tDN/y2AY3NacfRYNqd3IE0Voc3PgHeojRixWkG3/IEOESM6kocn3ALSgQAm/I9CTJzLq
         uEvn3Gex5KhHyYCWRiHPp5LOc0mbWGgEX64PA8Dp2shudZPER3REaTV8Xzh2E+9H5c0k
         iNwqEt63TuLpLOoYqivf54Qlnslbg6dnYVigV6gI+sMf19c45pMoRF9kKotsC+IhVZGw
         AMNw==
X-Forwarded-Encrypted: i=1; AL+hErHhEXZE1bLFWqHgC9vnoWVKVvecH7G1YIFrjOY9vkfYZiojItJDq4MIplnBu7lBMOIeBooIy8gHUGtkMXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a1cF6oFy5JgCrN4r8ZlQ0NymLurdV2wK00Gp58Xb3rDajRP5a
	TLmyB7+RJIui1TIlotR0Bf7bPfXAf//KTo28mGQMaD65d/5IOrn7DsM4aTyIiCk3vd8=
X-Gm-Gg: AYBFou0s2iJot01aPYs9c5j93ZmFbIMA+FWc1D8c+69qAsDLoKYTyMX4IeYfAbmMuO+
	Uq4WSaELqmA3zOgSza2S5MeyaE9k60yBTRDfFWkivkegBKgHpxUynzLgVhqiaD107OXAKjtYTM8
	T7K+RUbunmbWIgWNc8z8DQM2wcpR4B0x8ANTlbQfhYLGUi+Kblw++XWx8e60vUMr8WYjjqRnLuv
	XMfDsPToZNhiUyeniffCE23EvMDgaVmYWdbyD4HFJV1VEWjvmaPtlJunnNA6iDsXwjAfh7N1Ue7
	baaB5ZO5dSt58FX6m5eWJ8411D6kmZUGDkFEEPSVv/QKDxblzQU8DorsyAqNnCt1EwC8UsglLtA
	cX+MF+dKC2qJ+BFgrow2LPjtIS7CgeZ7StOhCvpbFSAl/ZW3IZ3784NSMX9kDVSBnDwH9sUu5f7
	TYNl5De2Edo0X2LtHfMArqiz+Qh/y30zBhZQ9hNd1V9zYYdflzEpT8MQ7soDv0JoxDjKKLyuU2v
	3h95ZPclB35ln1iNPc2mXZlVyO93HDZB1q4w6fzUPFVyVdfwMfMx1JuZI+gSWLdzcowtqt8R6Me
	HPbEXp1c7ZYk2L8Rhr7womZfiJPNz1vNT7lTYzVD9fEgvf+U1/qNTdZHUQ==
X-Received: by 2002:a05:6000:29cd:b0:492:aff5:da60 with SMTP id ffacd0b85a97d-4982e82c642mr3775637f8f.13.1794322054505;
        Tue, 10 Nov 2026 06:47:34 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm5253059f8f.55.2026.11.10.06.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:47:34 -0800 (PST)
Message-ID: <7f613b00-bafa-4f4d-889b-4e37f5009b6f@baylibre.com>
Date: Tue, 10 Nov 2026 15:47:33 +0100
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
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
 <avL-4lquUqW9lUNh@pluto>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <avL-4lquUqW9lUNh@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Cristian,

On 11/10/26 12:24 PM, Cristian Marussi wrote:
> On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
>> A get of a setting that is on or off, the flags and the pulls, returned
>> 0 as a value, so every one of them showed as set on every pin. Return
>> -EINVAL when the platform answers 0, which is how pinconf reports a
>> setting that is not active.
>>
>> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
>> ---
> 
> LGTM.
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

I'll apply Andy remarks. Can I keep your Reviewed-by with those fixes?

Best regards,
Clément

