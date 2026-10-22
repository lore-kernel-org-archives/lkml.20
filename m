Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689108;
	b=xZtCWQ2hdw9kxUzCqpQxl5D9RNrWJFX4h3Jx0yGPBSwIv8dqpwP2PU1ERbBfC8edO3i4
	 dDLCjoweYX6kLjPVtzGw2OQwn1DHXB/OXUlhMLW7ds+ZlSugFJ3ynpzunfgQgTQV3/5xs
	 fy0WceAhQ3sBMGs1owK3AXS5j2hBYzNWNYFOOASVyYmHiYJmiZvwdumAD+QLi1M5EvuVu
	 mKSsoiCuAA6NXWROYeaPYCUI1nEdwcvxjlAc2ZCuSG5R/f2LoQt7x71WWEEbkT01m8WDA
	 67FCBVi3xoL3q8kflUkIv91TwVy8dOCnIiP/tgmrK+eENoJIEPDZ/Pz7NnWi71b75zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689108;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=X2uug97+9g9Ifw2alnlucQZ1byzTMHdm0Mg+gmOCcls=;
	b=TKf47l7ZiHvU8yDZ/rBYVW53J3JgONSqxVfbONpOmVqIRLZHs05oDysQJvnK2z/589gU
	 tPECFwWLNWKiOm/KUKIfGt2kCLFhz7RakZaAv2HcKAwUsvZm6k8XKtq1IF+mFJIloTu2W
	 Y+T+EH32PwER8Yp6NKfu0CrEA58D8hajfu71V/xQNqKKMyGKuhmJvqYmPdWx4oK3vahNF
	 80dN949kvoD0+tLc38NGAXwvfeG/wzw5x7n64XiaKAXjjwr3mC//Cspm+5tPXFhbuN1Tw
	 oM7De9pxP3lW4GL7qH5V80f5fWEN9zYJTtKjVxn7jM53qJCU2eSXFtFYAarkifA5Khw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3506606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3506606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4649b35bso22593f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689106; x=1793293906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2uug97+9g9Ifw2alnlucQZ1byzTMHdm0Mg+gmOCcls=;
        b=NM/+bbiWLlx45KQgIy4mYNqCKebZBrLDup9Iboy4E3CYJGVeUFXdEHVGSefJXZInYN
         BcwiUx1dq2JMZUCLyG+HstDaVNhSFyN/WNYdPLDvGfPE6ofDNZblgas1uDT7JLOdDJ2G
         dZd9Kejebtz5GNzhXyvSNKZJvuFrhE+qocq5KgIwt5+XmnB3RBS65OeKRQjqa1jy5V3L
         jY4o/ZIwrXS4O9Rt2lYGZ54pqNMT68Hf80p0w1aKPH6MGFPILl10e2baUqD3EYWnmIrv
         oPCPyPJKBiUJr0SmWWYgajWUWXFzraJ66OwSdPClC+UMJxzuUvHgyPCgiSt0kJsOxIe9
         nf8w==
X-Forwarded-Encrypted: i=1; AKwUvBxDYsLawM8uxEpSe0tBMJTu5h0K4ACc5SDfK6M4oEqAlYx6MazyY9G9GIeQ7Vfvb7XzVYg5FHH05FHNTL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC5c1HuwKwnp01oj+Z2CHf2bGGAJ4cbbhE7uMU0GGhR396+ud/
	K8lxbEHaNRHNbCNj2o2rpyc7AhN0WsX84NVXxJ5/22ZFBhG9sSZ8bshW74AyRXpSVPw=
X-Gm-Gg: AYBFou2ZZt3mxg4p0R0Ur51zGYjd5Y/+5uzfIF26/gyCr5AontI3DQkY18hO3K81h6L
	HGK0wUTQgXW3kn5tXAVJ2BhW7VYxK3XRoKJZaYQQ1ZkqKNq59EqYOnk9wwh+t7WqKo/RlIs+04U
	PaJ183Y05sQ7MFxecj4CRfrF+2KD+nuOCDGGnPJbIlM9aLwTaLmqIanXkbIX9weEmff9DQmAoIk
	wW6w9Qh1A4wLuJ0NTVVZas3oKLAFQmF2If747EJH2RUklU3Lzuhezjzyv/oqkKTugy2awUo+piQ
	g+lBmSJmdGnppS8WZinlMlK/DggMygz00uXUp9/LEQ7XnsudulEJkj4YFrj7k5yEja1JZpegYH7
	3sW4RdnqblECOyXxf8v60uJdi1PzmTHDK4P/Vqc1S6tWztIGrN5gbho+2zda6xlmx+8AGUxWeuI
	R9QkCchnnexVshoXv6D0YcrRJEPXfNKhCY/548hWZhHcJsGhneiK24t4nwqvbod63W/Q6SzZxMB
	1A2QkEXMBi0uOfu4/i79dIkGoykCUDJ9Yq/6US7NBfgaxJWTRE+CC827jumKb1aZD5HUNy6/Icn
	Shmf13Z5TyE9jbns71rFd1wanMlB9vw=
X-Received: by 2002:adf:e004:0:20b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48e264a640dmr8341797f8f.44.1792689105826;
        Thu, 22 Oct 2026 10:11:45 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm13532427f8f.32.2026.10.22.10.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:11:45 -0700 (PDT)
Message-ID: <5100a774-9c85-44bc-abf6-9679f8395856@linux.com>
Date: Thu, 22 Oct 2026 18:11:44 +0100
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
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Conor Dooley <conor@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-2-tanure@linux.com>
 <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
 <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
 <20261011-starship-foyer-1105c1b35e31@spud>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20261011-starship-foyer-1105c1b35e31@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/2026 22:13, Conor Dooley wrote:
> On Sun, Oct 11, 2026 at 03:16:18PM +0100, Lucas Tanure wrote:
>> On Sat, Oct 10, 2026 at 11:04 PM Martin Blumenstingl
>> <martin.blumenstingl@googlemail.com> wrote:
>>>
>>> Hi Lucas and Conor,
>>>
>>> On Sat, Oct 10, 2026 at 12:59 PM Lucas Tanure <tanure@linux.com> wrote:
>>> [...]
>>>> +          - enum:
>>>> +              - amlogic,meson8b-dwmac
>>>> +              - amlogic,meson-gxbb-dwmac
>>>> +              - amlogic,meson-axg-dwmac
>>>> +              - amlogic,meson-g12a-dwmac
>>>> +          - const: snps,dwmac-3.70a
>>>> +          - const: snps,dwmac
>>>> +      - items:
>>>> +          - enum:
>>>> +              - amlogic,meson6-dwmac
>>>> +              - amlogic,meson8m2-dwmac
>>> Meson8m2 dwmac reports: User ID: 0x10, Synopsys ID: 0x37
>>> In case it helps I can submit a patch to change the Meson8m2 .dtsi to
>>> use "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac" - then
>>> we could move it here too.
>>> That leaves only Meson6 with a single fallback compatible. I don't
>>> have any Meson6 boards, so it'll have to stay that way.
>> Hi,
>>
>> Fine by me. But I think it is best to wait for this series to be merged.
> 
> In the second sentence, you're referring to the dts patch I assume?
> IMO, you should submit a new version of this with the 8m2 moved to the
> other enum and Martin can submit the dts patch now, since the current
> binding permits using dwmac-3.70a, no need to wait for this to be
> merged.
Ok, I will move.
I will sent v4 with your Acked-by, since this is the change
you asked for. Tell me if you want it dropped instead and review the new 
patch instead.
