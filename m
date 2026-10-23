Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754121;
	b=mI0z1NAOOU0VgK3xq/UM+K8equ1ZT0nUWNLxmbrHMva9rxymNxpOWch+gg4ZOt/xyAha
	 Do/UO8te88es6jEA7Q5pW3xxoqkke04vQbEzZfyMLV8XEGGtuguG0x+cUWYZ+RT7wGI85
	 ceq9sECiMEjxgLCExgqmKK9vBE+IDxh51DnsEDbDzgJXS6rRHA0IqTMG3f1uj6qTQiqzQ
	 ARGQy0Bbj9JAoewXrhUgZGErns0ByjYfX+eCBtY3D39kvjIQMB3cGfsPyV/eBtxT/Y4LZ
	 LvIhcyxeGhdAxIP+D8uZ8efsU7QqGdRGnfJXSOEvf9/DaXAIwgk9ZqIFZ1ZuyiAWRqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jIxHZGuZV2ahnY6L2CqzTw2j0WYDDpMIbxX1aENaO+s=;
	b=mKlnEWIq5Ej9fJQG1Mq/dd4pXG3cbgVIHUtqJft5wzpwcujxrGK06gg6zXYg4CkDePzF
	 I3vV5SQNjSzbq9fA2u/opcq5aAFSg2X2bmcLDQLOw0ZD5yEaokPOczpt64ddp87SvuokJ
	 rybiN2i2j45x6zo/Bd6RH9rfw2Eg1aZ7At+VFE54Q+oyh4Mv3Sg6TPU0x+SobPfytziAz
	 O4S8L3YpA0OfuXACVgXoU73PWX3n0jZwwrxIhyfoL/0WoObwjCy1JxEpvADiMYtUuFI+j
	 NW1+rJzPobhoaKdtO5/UnCTE76LBxz/xgwX0CBOxO6KTPelvR83OJlqsJvGSGF2fzGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gB7ZU72T;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC35606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC35606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gB7ZU72T
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so606272a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792754120; x=1793358920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIxHZGuZV2ahnY6L2CqzTw2j0WYDDpMIbxX1aENaO+s=;
        b=gB7ZU72TlDrjtJg2VoknUpiMrc5WLYdiqf4lkuMe3uifTtYoe7UpNL2lsmXJmD9kvH
         SsLAi0bz0acbuZguvc/MJxABOwXflROvoJ8fXKuCex/V5dfSWnupFH2RRwK3EOJ/0Bge
         6F4Y3MDGJP6oj474/IOPZ1XnA9Bd43ACAeZzQ9CAx/aKusmx4s3DpnEIg1st86GSMR6o
         S2TXN+ak0DiSPieJLTyV8uyQ3co2B/kCLvqlJA3wcwQFQFtCjjXuv6dX1SqYeofFleQD
         vgTpIYXMp/KtAvZtXa3YCiB2P4VG66t2hbESu+Ea3WYI63IPpSbD6lJiuDhV+6rcB48z
         AkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792754120; x=1793358920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIxHZGuZV2ahnY6L2CqzTw2j0WYDDpMIbxX1aENaO+s=;
        b=OtgZ1cYMl5/WT6lhmIJNUW1JKaOYiXAZKvKGqUxT7/tmzKaqfUMSLphLvxn3PLepQo
         swlZ+zBXWi1VCZSDzdqnqZiETLsT3UpntgRXYgzvL0fGn9OScIFWbRi+SosgZmcZcAf1
         Gii374gvgK5Sd775E17nsam0I/NolikWRMd1OXjqbw0C3sjMYMgOqlznCno6gbZ2F4u1
         XGiyuGQok8qfE0zgVl8eABuGuma6odGch7N0cyyAEOH0dMlaItPgLQhNaASNI0ZG5wV5
         aU6qdfEAjZnj+1NawMUJcS/4aTRITweriypO1hSc/8UthUiqsKv6kw6MSwNlmaWGFzd7
         OxuA==
X-Forwarded-Encrypted: i=1; AKwUvBwPZ6ou5UPvTIRtrXiP4Gsrnb9yfoAwKP43VxAmNKdCaP3/RWRRS0hJPzMeIx02g9+CYXydlhKZaHEbi6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeaUtdJCZnxOh8tbvZdj1jnT4vHYh6Xb/LrgFuGtSHDzvwTOwW
	hCZQEFWbw+92BgoDxOkYdsxSbAFpNP0v6/wKLk/P7Cnd14tRej1iy5rb
X-Gm-Gg: AYBFou2jh0jGkbOogUl0EmOXDBKgXFSVNKLA6QKo9A5uNSc76WYYcjgiPhtLeu22t3M
	fwtVZgmrLO2MD1VcyR89wvJiVPsy8TUiWk2LjMNnDTPSxLBgEh5I0Fq3/tHisfRrLSyH+JoZiy9
	zfpo7bVU4H/hWp7WBDWVbxFYyNDEz9WB5puoagQrKol7KYSzomzWa5PCKStg9mI/Spbl6Nh/Web
	HC7/XxsOFxwJv/ezTX8vr4xIbf7qf1J481F/+9Qsw4LV5pJojKirpi0C9YjydugbF65k+7dDccR
	SYmAudxzwKDxflx+v48hGzkAiAJIBvuCO+U6+YAUA3DkAQKIPUsEYnhaMth11FfDWJZ7xl3MjsV
	PqvCgbbNNEgPu8PqW0rax6Q9/DOxISQfK1ZEDO0ARLlAQgelg0fwc/RGYwJevesSq4yjt+PsqDn
	7Pcd6Qv1jkA2z+/Q4ufxTVB4H3kGkDPwUOzFPkl47lUWGUr+gvBQ/RW4jR6Z+5J3l8Lo4qEhhSp
	hPou9nV6BKmzVeVW4O39SWWelvG9ib+KvDmcfHWvYqEbrFEl+1lSnACStm6Q4AO404+6BYFyhFw
	lIsZ7pY5CT9P4/mDw45d/KGFMJec8vxA3Vmhux/LoeV5w3xjHL8=
X-Received: by 2002:a17:90b:3f8d:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3adce7a5a5amr1475790a91.19.1792754120415;
        Fri, 23 Oct 2026 04:15:20 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2ae880fsm1037959a91.3.2026.10.23.04.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:15:19 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Fri, 23 Oct 2026 08:15:07 -0300
To: Conor Dooley <conor@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 03/10] dt-bindings: iio: frequency: add
 adi,ad9910-axi-backend
Message-ID: <hx6lt2u5j5yh3iez5zimolukip4a6ak36rdqridrvaz7bb25hw@6blwtzy2iuat>
References: <20261022-ad9910-backend-support-v2-0-0ff7f0bff326@analog.com>
 <20261022-ad9910-backend-support-v2-3-0ff7f0bff326@analog.com>
 <20261022-banish-scenic-030717ca503e@spud>
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
In-Reply-To: <20261022-banish-scenic-030717ca503e@spud>

On 22/10/26 19:38, Conor Dooley wrote:
> On Thu, Oct 22, 2026 at 12:19:01PM -0300, Rodrigo Alencar via B4 Relay wrote:
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add bindings for the AD9910 AXI backend IP core. The FPGA IP core
> > interfaces with the data and control pins of the AD9910 DDS, streaming
> > data from memory via DMA into the 18-bit parallel data port (F[1:0] and
> > D[15:0] pins), which is clocked by the PDCLK output of the device. It
> > also drives the PROFILE[2:0] pins and the DRCTL pin, which controls the
> > slope direction of the digital ramp generator (DRG). The DRCTL pin is
> > driven by a PWM generator, so the IP core is described both as an IIO
> > backend and as a PWM provider.

...

> > +  '#io-backend-cells':
> > +    const: 0
> > +
> > +  '#pwm-cells':
> > +    const: 3
> > +    description:
> > +      The first cell must be 0, as only the DRCTL PWM output is available.
> 
> I was about to ack this, but the wording here caught my eye. Are there
> other PWMs that are unavailable?

Not for this version of this core. Other signals to control the DDS could be
modeled as PWM, e.g. DRHOLD, PROFILE0, OSK... but that is not being considered
at this stage.

> 
> > +      The second cell is the PWM period in nanoseconds and the third cell
> > +      holds the PWM flags.

-- 
Kind regards,

Rodrigo Alencar
