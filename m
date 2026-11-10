Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794347284;
	b=UiADX3ru/PZuP1ZdslmE3lAHNixKvnMa5/tgjWxCwBGAiRnzuddneeLMzQEEIVUg6ATN
	 aUwOnjH46LViRJM8aF8OnNEP3sTYbfs1dHF96kF64id3ZquaDP+vcufQKWq7UVJJeLzSF
	 /NaBOVDGs6D2EKuup72ZsVIOVJQykYNyqJmkUBxfe6TSGILmG1a+AH1jq0gfzDwJECp4L
	 x9vBcicZL9+aTUr+1xB8gMS2Wdfzmv8934Biq4S0tKGyygxgCWBPrUAQA80UoOGtKc2fp
	 G0F9UVqHxlAsUwYmNQKqxx6ns5FfTLX8Dru+gBjg0BuVLVc+Ahqi1X+OPWl69AJ6tGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347284;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=/WOcayzJUskhUHuQDojqHJCdJ99yTsrsphbc40waRqk=;
	b=ZoSSIt6Cm+9dWux7YENN552Yfs73u7z0eo3ceZKsDeK0z5VUDhpnUki7E+m9TOzRNPyh
	 HuGkXTGlvQkhEulESDhuhTZlBTF5PY5kempOafXrFXU+JCxKsPM9QgftfC3d10dbpoOS9
	 7YujkOzAGIccgmv7YzdwX9NZ/d1glJW1OJX3In+O/8eYHUp4vHgUgjWFwJTFzSqS3p6Zo
	 eYvOHfGm8kxHgvx3rGdoi3ILRhnApu3L+sedavWIwUipahhQGYMnfy4dsoTUCjGvkuNpK
	 8ArdiY0D1dz69ZiGXzCX3d+3eq0DqSQ7gCd88HSfc7iO+lqr59t2+FMhUeFsMbw6Eyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17EC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c5067a2411bso13712566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:48:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794347282; cv=none;
        d=google.com; s=arc-20260327;
        b=rbCft2M4m5bCMUhr/DqoO059FwaQYcIa1e+9ju10Lu7aYPKdu3cxsfyCGggcIrGobs
         rmXv3WgORPvsSqULKC9wD06m6wB3pPOANqoS++rmTLgPlB2zgRGWO1SVpA/djQKE5KpQ
         fI6AamnqVG43EXSIFPiMXrx5rX+muC22dXSDy1/xFrUIGH/b48D5UxHTvWFHvRYUW80m
         Tc8/RFbifC0hNdh68pkEWMbmRz3BhFFG4CmAlJNLhWVDHCXslli/J3XG1kjEdaon72a+
         vFG/1qd5x30VsmhB8mnNcDXyPVbiHv7wBB8Q/7aoTzIuOBcRHIV3B10gk/DZwZjdx/LZ
         EVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=/WOcayzJUskhUHuQDojqHJCdJ99yTsrsphbc40waRqk=;
        fh=iUeA5cjJvnSSAlu9aNnmKgAXgZuyJYcJ+kuCwtzIVrs=;
        b=HjBvAsBE7zo/LfFDK3lI/aRuMRPohJpG8O17ZkNkRFxf3nc9Eu1DWbxOxB3XOSnRuF
         F1Fe/sbineT30z3k49FIKc3QU6xmym36h3O+DiE5CgU5EqhtlUyhefh34cvShUYvZmJj
         Ef1gBPL5PD4mc8IehgjQjHm67NaSetF4eRqj1q0nK1RpIL1GOai8Fw/9mrrhaAQwCkoa
         Xb10NGSADNxzJXUbTBxNnuZaF4SngcDi7HdYdNyVPWg5V7fZvO6fTSeQVnBQEQGYBT8c
         Y092VeMJeHqdJWjGPA1TIE+/DTomfIFoh5MeydyzpXMg8Q+/bRhUawkR9f+RYoTWifxM
         nTRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347282; x=1794952082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WOcayzJUskhUHuQDojqHJCdJ99yTsrsphbc40waRqk=;
        b=NRTXpaLcHvg9PvBSM3NGCEAnNRMgpI/AD2JeZujbI2LjPYptTXjPsbn5aArE0ToiTh
         AP3W7AX/pyo3Jx+i+cwHnmR94U6ZToW0Sc62zxqyxbA1dDcxolwH/sApA4IgnJjLWAo8
         90Tw2aAr2qLAqNotaU/TsrcfksPYweZc7KXHtzeAjYWV8HsXtDpKusSrAG3pXtRUyVBF
         XgLnThmKqT3VHXnl1RXvqaFTyHnd0YbFQX6Kn1QKyIB06uUhyVlqNIM2O6y+1OZDIR1H
         rb00bsY3V4RY5VTMxyGTx+RgOPBSRW42P9C81RKjZE+VlsH0th1Yi6kR64ipPiTKqZSV
         YlPA==
X-Forwarded-Encrypted: i=1; AL+hErEkbaFnYJF4tHZGTxLK8MInAR41wyaa52AMpmvec0HpYpn76FgMTmS/UYBFfh16eldR0Tiao3RLrP+pPww=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7rUmDxaZoQSZ5AZhncKaqxrM3+Rv33SKbzlPcS0KICWqVHDN3
	YWbpP3faf6H/tLNupLscC6fNAb1aA9wKnxo19w/Q1M/SUwrV695fd7FcSRmFZuYvURueLkZyQlj
	2+79hRUCMOOJzED7DsoTJ7cDPnck6h7gUeVlMQdDI7Q==
X-Gm-Gg: AYBFou0mFWZWtMVaWSSE3A+OmRbZAlLLHKnvFk7ysUSuf35DcXma8VmiFLjnT8LFO4h
	h3DeV+RzvFEkowwNBYgWvlEOxNzTZKWchnRU8DH8mqGg95xjLDd0ys6D/oQYLUk4aadptSKd1uc
	7a5FlgYiUqkc574bI9LI18W8utXPZ5JfHUaxadD3gScrX2LFXXl6ReBZUAIK+VAljBaZZN2eOV2
	lLGR59dhU+MtOedRhTgNbfxac4Pa6oTqIhFYxMbffiEVJkuYlAwvAbXmUBCcZ2P1RmoG7PCrVj0
	tsG7QrPOA3Q39yAV9w+OoQ5ryF0j5Id0I7UT/2Nb145u6tOH7pUazNytMR3o5nN6AwoJlbep7JS
	Slr+sjwFRF7QV4pdDqMC2a4NAllYfwEaVHb1yHF3paCnHwui+Ni3xEaTE56e8+jh5QqRPRMBFNs
	+IH69IEItZsCsoVTo=
X-Received: by 2002:a17:907:d311:b0:c40:cee7:3918 with SMTP id
 a640c23a62f3a-c5066d8cbc0mr27479766b.44.1794347281996; Tue, 10 Nov 2026
 13:48:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104151914.2651241-1-opensource@grische.xyz>
 <20261104151914.2651241-4-opensource@grische.xyz> <20261110122536.7cca85ce@kernel.org>
In-Reply-To: <20261110122536.7cca85ce@kernel.org>
From: Christian Schmidbauer <opensource@grische.xyz>
Date: Tue, 10 Nov 2026 22:47:39 +0100
X-Gm-Features: AclHuK-CLlMl769sSx84CkwDdaR-obj6arfB97PbP_3TdPcxS2uglw83nZZfEio
Message-ID: <CALsH2cyxzm3OTzyyFhBk_LSkFk4sw+6xcAtUc3hVJoLr8WO03w@mail.gmail.com>
Subject: Re: [PATCH net v2 3/3] net: stmmac: dwmac1000: stop hardware from
 dropping checksum-error packets
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	pabeni@redhat.com, Oleksij Rempel <o.rempel@pengutronix.de>, stable@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:25=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed,  4 Nov 2026 16:19:13 +0100 Christian Schmidbauer wrote:
> >  /* DMA operation mode defines (start/stop tx/rx are placed in common h=
eader)*/
> >  /* Disable Drop TCP/IP csum error */
> > +#define DMA_CONTROL_DT               0x04000000
>
> Maybe just me, since I don't know the HW, but what does _DT stand for
> in this context? Other bits seem to be documented with a comment,
> let's document the new one as well.
>
> Not sure what the comment above the new define is deferring to, either.
> Should it be removed?
>

DT is the Synopsys GMAC field name for bit 26 of the DMA Operation
Mode register, see [1]. The line above the define is actually its
description. The define was originally added in 47dd7a540b8a ("net:
add support for STMicroelectronics Ethernet controllers.") with the
comment on the same line, and when the define got removed in
5a78fd3debad ("net: stmmac: remove unused definitions") earlier this
year, the comment stayed behind.

I will move the comment back onto the line of the define in v3.

[1] https://docs.altera.com/v/u/resources/r642178/cyclone-v-hps-register-ma=
p
