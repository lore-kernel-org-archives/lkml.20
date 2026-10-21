Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578943;
	b=XfDpqfozhJ4Vac/umujZAL5y5FrBkzX11ZhAXNmcBTdZj6Ph1js9Xvmkgp4KSrL7NE1e
	 BST5q6OoIsw+qP6yuafdubE4d3x27dY/WAR/Ig/6BmIU0z3mTk6Vygqghesu6vPGLwovy
	 4MpKUJ4aITVHREj0PkCcso5e1/XV1mmY31FpzSic8hFWpb6NyjXqLHPvcEojkHgLMd2DJ
	 72h3ibATARB4uT+WemfdUwzgr0M9txDlcY4VeMJdzjKS1mkn9hO5mPuAwUL4PG0qudMKR
	 Fq73jqjUBv6qFJ+MVFI9wFl+VzmCfIP7lJCOU4XHfz9gP1pUL5tV18IHQPQe+cDPRng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dh+Ae+f7goZcRiPvLnUzNRTlWIUaTewojh+/EuxjxlA=;
	b=NI5+MJGa5OLxmydOnM44OdE7D19m1CjElSsqmbVAXpjrlcROUzVrAzr8GdAU/DAfq3Sk
	 nndOxtZWHmK0lovR2caD4Afyn8wYniuUz/0uthaax3l0mljWi73h/BxBZPAh7+Eyi+KZN
	 qqwBAfRm4cy6pPgPnjzRrZtHzI9tnbqC2YJGpdnCDQiCTB6VDnaY2wnhVDhjdBmREtxcN
	 oDSBROIu8fdEScKmKkYB2+w/Lbs46eOuBYkESzcG6qQ6CT+1JIZ5OMIFUP1z9XkAgpY1F
	 fbopFWXxaCDdf96Lu826Jfjpi7NiBE2R0xfLQHOr4pk7b46W+S8c62dFu+1UTwlM5Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G0jda3F7;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E1F606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E1F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G0jda3F7
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso394715a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792578941; x=1793183741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dh+Ae+f7goZcRiPvLnUzNRTlWIUaTewojh+/EuxjxlA=;
        b=G0jda3F77cRYI34SxQQfhclAtQyzh/dF/mrW6Ky3oKCVVzLpJvmMHIxj8ERZWjRgOR
         ZaIGpWNEWrLKF58tiPfzDPSfCppFzl1iACNXxov0daUuhFF5fUHx8oImmBCdIlMxSLBx
         3pugRKUUdEzNFg6S7vKkYLsssvNsDlAIkOWZdVoW81hpYjfnlaeFGSOdlPgIm7FYkS2z
         lkcwiDd8BZtzhZP0E47Z7+i/1cIjugVAzBDXBCtQkhw370PgeIUoGJ6oN3lKxE6XXHKD
         J+3ZHhC2OBikzUUp6uQR8NPIIQRO6YZnGou189VTyNBhjqsMIHv1A8pR1j66oiqf+f2y
         1Vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578941; x=1793183741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dh+Ae+f7goZcRiPvLnUzNRTlWIUaTewojh+/EuxjxlA=;
        b=11YwHaR/EeTR3cO7u6ZT4P5dTgDsJymNrHrrmkPF+cflJKjFHNkpJT9TRxjGhStCwK
         mCMJZukuiHVEGsO9qIGBA/b2sg9CFOxBgfRHIggU71MnMlp9xYS6q4w4H+cFavVTjli7
         XAX5iEiuMrGZGixI0AZndy8O+ljJJ5Ff8VvJavekRXXzgLd7+8balniuwpChS7FqhnDs
         QUkZzqu5JNY9S3zamIXagrG9SuI8GhcrvrH3dxEpm5DA1w8rgLANjdfC54H9uGauTtZl
         WxXyKdMC1dx2ZY7TQGP/qgCGFY/IsA8N49GjgQEmNpqqZTlX6eXkW3cr5OI8KgSyeBd2
         VpWA==
X-Forwarded-Encrypted: i=1; AKwUvBxqn+cvFr8npr3f846E7uXBAd3iz8LIs3tOs3Aa3Pi93aNU+jRDAd7rePwctIIZ+q9iCTFPLybVPx4dSwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1RsUzU2ElwYkYO/Z0sH6oXAibDGBuR+6naYL56cNpxrTlAYyD
	bwJJmAfOk/UcVik6G5fJkPp2gAkxLW/gky0t+4mYMhHwffgg2kHjfsWcnCGjvmqFveg=
X-Gm-Gg: AYBFou38vnbCsrQGgqIoyTaB6crp+5MDp//Kz3BG+aIn6svEXz/A9TcbmLyamITxi/r
	ozxJTwFEi6bKggEsciZO5hmPWS6z9PUx7yNfDhp7O4t/EXVFM6JhwrOxbpthn+YM9rVAI4/R1wV
	dmEPoGt9jFzeEG2fQTJ5lNazj3pJNhF8I8vs4G0Vtexb5B6h3BJJ3M7quyjYPHLPc9wpgF2HdVL
	6/ea5ISD/i2onr+USrpLdB+ebJGKO5pR8a3voPjF+vpC1muDwW1GMliVjHB7pTyGmvUI/GL5WLh
	xJfFjKeXR+L2lDTzfS72Tg4oDP6zCotnmvsGcihoQCpR8nZn7tYMEogZ4ZhUa4yyUCJoiVynyHV
	5i0n+e0EgoKe1DFku8itbG1oB9HejNZr1Ol+CkRzNClM6GM+jDe9eKyZTTtmqOa0b2zLOnObnNJ
	W8qU/BX722nOt0n55EiEbRXgGXZbD+05Mo2Gc0XJKZulDojnetCQAnRZBtGnV1b1dEIxBxGeHCH
	6hX9pv1ov+tUPckn1qkRxO+UIIbynFtiCLbKKqJsepM0hDHMmVvGwVNLAhtF/xFIt44+00rskbo
	nOdOWeU9qvltX1c5+eWLKU137yUicYpa7rQeevM7Rl3svdaVpcCPh4At4g4/VDAzMDA=
X-Received: by 2002:a17:90b:4d09:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3ad86ef20e3mr1192332a91.40.1792578941042;
        Wed, 21 Oct 2026 03:35:41 -0700 (PDT)
Received: from ?IPV6:2401:e180:8c20:3224:91dd:dbbb:1f3d:e712? ([2401:e180:8c20:3224:91dd:dbbb:1f3d:e712])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad7ffbbba1sm3896305a91.1.2026.10.21.03.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:35:40 -0700 (PDT)
Message-ID: <5b408217-52d1-4a22-b15b-1f0a560906f0@baylibre.com>
Date: Wed, 21 Oct 2026 18:35:35 +0800
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
Subject: Re: [PATCH 1/2] nios2: remove libgcc for lshrdi3, ashldi3, ashrdi3,
 muldi3, and ucmpdi2
To: Arnd Bergmann <arnd@arndb.de>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-kernel@vger.kernel.org
References: <20261019165015.2656521-1-dinguyen@kernel.org>
 <f13fd39f-1ba4-438e-a1f7-fe4184adbc26@app.fastmail.com>
 <20261020085630.w7je2ev3f6ectshy@dev-vm-schuster>
 <686f4ca2-0fb6-4a73-9cdb-0edcccafdd62@app.fastmail.com>
Content-Language: en-US
From: Chung-Lin Tang <cltang@baylibre.com>
In-Reply-To: <686f4ca2-0fb6-4a73-9cdb-0edcccafdd62@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/20/26 5:41 PM, Arnd Bergmann wrote:
>> On a more practical note, while technically feasible, I'm not sure
>> whether we can actually vendor/copy directly from libgcc; I think all
>> code there is GPLv3 with Runtime Exception. (I'm not a lawyer yadayada),
>> but I guess direct reuse in that way is problematic, given that the
>> kernel is GPLv2 only? So I guess we would need to do a reimplementation?
> Right, the easiest way would be if you can locate a downstream gcc
> (or clang) fork from Altera or Codesourcery before it was merged,
> if that still has GPLv2 or a more liberal license. Reimplementing
> the functions otherwise is of course annoying.
> 
> Adding Chung-Lin Tang to Cc, they contributed the original files
> to gcc back in 2013 and may know a copyright holder that can
> provide a GPLv2 compatible copy.

You're in luck, found the old GCC patches still exist online:
https://github.com/openembedded/openembedded/commit/77c8a823d4490619a247b0d4c0897761003acf98

They appear to be GPLv2 branded, hope this is of use.

Chung-Lin

