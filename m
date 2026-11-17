Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893444;
	b=4lnYt52XCsMYPU3ZhZCcp9MAg3RSVgNzWSlgXJAjFtVBMUuy9Nd+pJMuZnR8qPyAeKnh
	 kheQ7gefYpDBC5xNU201DzISL+UFzUCCiA1H06jsyQErGl8K3Wo572+BEhC25mrkRX2Q9
	 AO/K48LZ4ZDMokuwI9WngTuQ8DidWnGJzGZv0ZjQzhZrSFvJJNCe6ocEL7ta6x5HajO23
	 w3e2UksuziMUZwbExlI0xlEZZEgZK/ytG3YJi6xYdWHlus6mG1DEb6o7snBpJJgojWuXX
	 lXhpTpz4O3eimB8GriEQJlwDMtiYssTKK4vyfx+6EC0NE0S73DCjThSQ+h7eeXo/KxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kIAvslGIGz26KiTObfr5XZM247DFbxXRTcH4PvS8dNM=;
	b=MAR4fvxmRW0zs4zn+o63rNnHd4AXenREQMPmb8AHhhC57vrHR1whPAKKI6Qbn5kIPnge
	 rdQbSZt36J1vdoXprducF/a5/R9DIMMkQpo58Lk5dOaq+X6RayrwhK8Ix0THE35ldxuRe
	 jnAv9LvGG7UEyI7mXni10iKsf+4rDOUeK3Yz3lfqPkesznx2XgokdliU4OQjtfTRtgaQ8
	 cxHR9VHj/s5TngfNjiUaS4OdjWf0VZQQmV98zqLlD9jggsmyQsWbaYFU6ZfPLZ4PVjHtG
	 5cL503o45aI7iuv5eGgpze6Cs4WPGb1kNrF5H8F2vQ9B4pWo/TAznAgn4pisjjdXmmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zf4QXcp8;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5E5606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED5E5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zf4QXcp8
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e795af1d4so401190eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794893443; x=1795498243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kIAvslGIGz26KiTObfr5XZM247DFbxXRTcH4PvS8dNM=;
        b=zf4QXcp8BIXJgVQ932XNIbJBipZ7OOoNr+x0JQwatdUhWjptVB1cVAQ0I4et3Y0vLk
         Kc5yATO8atKFXpKmIe4fY5otpiE5bqcdClrDQWlHVlVda9SUDWarzKu87gUOjbat0Li9
         WxQtTjeTyS+x2LvSFJqGQIpR56cZIlPEO0QOTBQyaJvjDAzOudqDA/LidrE18foibQG6
         wpZO5e8Euu7p4lT/S270Os2CbQ9LyPAVZTkasmQAo+YAC045V1r+v6F8x+uZcLD/4kPT
         /4RKjLFxYSj53EqbIDhapPSb08DghVty5keXFjLHVWPUEoeKTZH3qwCoRpdiArHiY79w
         Plbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893443; x=1795498243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIAvslGIGz26KiTObfr5XZM247DFbxXRTcH4PvS8dNM=;
        b=xkNeSFx7HDzmZLYbHo6dK+sScfHyNK1go6ebVNGk/ktaVRaAWBaKBR63E2hemg8wFG
         j77GxXvsKMEOmub8MK/ZhgwlAq8Hi3SZyt2UApDDRp8iu61OzKDtIPd5buw6GLTMFl2L
         hYeBaQT0BN9+rWOetRyBKoMf3rM9804He8Nfgu9WxBK5X8XRuRyBNSHC3JXmkqIWnMfX
         XJgRs88v9deqE0ehLe9V6OHnjErrC0y5KytxuBWDWyLoZQoY8ctfZqXYOGPzs9NzbUg1
         rR1dOZuXACV/CzHgABrJWHN6R03RZVIFuSAYmcmUp6ebKybAg47j9YeeRv3zMbULHX4q
         82Hg==
X-Forwarded-Encrypted: i=1; AL+hErGRsiqGCBWN08TyD42wujDJwL3r0pozn/C12E90Dt1eqNdVjfdm8O6uuQYpRFpJ8BddBLRo5E18ewPvZLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9utm2kmYPGpl+0t6sWwVKbAiFvPo+DKm2g2gs+rqD3yrXke30R
	wlNnqVKyPUbwonJrktTmpm7z6W5FxXj5fIWkpW58ElEaU8PnidYZIKGybyYW5OWUu5w=
X-Gm-Gg: AZFdTZfW2G7hi8Dt+HgenOx4DtKFH/NpRw9k4XWjTwUdMSaeVl+GHgUx2hi61UZTzpo
	T+KRl5BZaSuLvAA5w3G8UOSwNGG6h3fJ97TCYhGHP9kJlsaSnZyE/0BaB22CMa08ZiQiceNdFRi
	2++ZVH3WNHsOWDZxIJh98GNT7SAZo1+SlBiOmrUiCpdzjEUcc2sJIi/auK82I8ClKJnWJb/aliG
	Lq401YW5sAjeSuFnj1VVVMCa5/pPVTt/IjxdyTz45xR3fKfi/qyD83+H1DfEjSuG9+1k+hQYh5N
	RIBsqveabDPqMbRlfFvWzHQjp095PsC5eEX1YAIk7m+mXu88ezxZ6tfMGncSOUEIXvn3+JGgK/5
	dNdY/1O4HSsnUdf1ba0UY9hH/cjR6omq/Lh8vw0wTJMSGtFxvN9iiKFO1Z+Zn3StLD3f2G4l6eg
	ju7LNB5/ZzI03nNJysP0+uSAdJQQe8D1RSAmvtdpEDt1ktFh/dIDNVdmP9LbSN50lHPDaYBHEzo
	oIM+ot9kDTIaRjpR8wjWxCNp56sS4bWoMjh3ATFgPaWaZzitbnqUF9h0oYyIBkBM9k7r+kwp0ez
	36UeTbV+7Z+uGeyT7C18+waPOnKBKA==
X-Received: by 2002:a05:693c:83db:10b0:381:761b:f335 with SMTP id 5a478bee46e88-381761c0832mr629547eec.6.1794893442481;
        Mon, 16 Nov 2026 21:30:42 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm40154597eec.7.2026.11.16.21.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:30:41 -0800 (PST)
Date: Tue, 17 Nov 2026 11:00:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: David Yang <mmyangfl@gmail.com>
Cc: linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: arm,sp805: reference the
 PrimeCell binding
Message-ID: <avvmf71B4E2mKrgN@vireshk-B250M-D3H>
References: <20261114184257.535546-1-mmyangfl@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114184257.535546-1-mmyangfl@gmail.com>

On 15-11-26, 02:42, David Yang wrote:
> Unlike the other PrimeCell bindings, the binding ends in
> unevaluatedProperties: false without referencing
> /schemas/arm/primecell.yaml#, so arm,primecell-periphid is not an
> evaluated property on an arm,sp805 node. Two nodes in the tree carry
> that property regardless -- watchdog@a2c000 in hisi-x5hd2.dtsi and
> watchdog@8000 in mps2.dtsi.
> 
> `make CHECK_DTBS=y`:
> 
>   watchdog@a2c000 (arm,sp805): Unevaluated properties are not allowed
>   ('arm,primecell-periphid' was unexpected)
> 
> Add the reference so the property becomes evaluable; both nodes then
> validate.
> 
> Fixes: 73d3e43f9813 ("dt-bindings: watchdog: sp-805: Convert to Json-schema")
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/arm,sp805.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> index bd7c09ed1938..690456839fcc 100644
> --- a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> @@ -16,6 +16,7 @@ description: |+
>  
>  allOf:
>    - $ref: /schemas/watchdog/watchdog.yaml#
> +  - $ref: /schemas/arm/primecell.yaml#
>  
>  # Need a custom select here or 'arm,primecell' will match on lots of nodes
>  select:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
