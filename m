Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521432;
	b=FJIZFBgUw45ZildZBJ4nlHZg82bsgD1hN00ytMKBOHMyNr0C8ByZUpQQxPDL1EKjc2p2
	 cPNm8hrLpJ4/8A07WAz7OTLsyioWlRUM4OGS1Hgc01Gk3QOepz//kD5Y5ukJNG857Fd2U
	 m7Oe1BtPvQK4uW/Ym65L7a9AiCUeoV8Ssbn27hmMOVH56D4pX9G3xRWHLIp6DSxynOs4g
	 3w/2/X60u8JSM/2dKstmw6nRs0lk4QQXMdsdL1F0orf7B7aeT/4FXp2EZh97XAmaePVFA
	 p1zWoVVPJopbtaYsNqqlSdA4qU+ZbGsGKT4dytQLOJZwKg5/vqcAOJgvH/NJOA2CSsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aEfafPymAY1ju6OZbZAnj6e5+ZStzszPQQTeE4b0erA=;
	b=QITa2JARbgHkS0/FOkzdQlMpFpO4/CChJyrnrwdg6IOHBK3gZFrsQ4IqABtgUXTDnv4n
	 2jpQ9jzbeM3a1R57c7edAt0qrxr/uK/sppz+LTfhOwJ9/qryGPKl4hGe81QDEHwlYIT6J
	 EosQ1q12g+G+GrO6gtlZObTX/bSvnhy1mTs9Bv/qOeJb+r2nX07vNCxksKxjTo6yxqdhX
	 tQGeyjmCeaIlx2eW9j4dV7gJLHAs74nppFh3lduJc6ZDcniulU6xBZaM62idJjg6JBQCK
	 l2D2c1htHgSO4Mdd3X2RBG2dDB86wno/RpJNt1Jmt9cjfh2cM4ZcElmfs2nT/cYsP0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slzuCEAI;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E17606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E17606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slzuCEAI
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e795af1d4so229150eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794521431; x=1795126231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aEfafPymAY1ju6OZbZAnj6e5+ZStzszPQQTeE4b0erA=;
        b=slzuCEAImnD4jqWAMEvntSEWJ0U4ruTCHHB/zPMILhLk6k1uqXgAtRrnAo+/pa9wab
         ynvnTPncvbBnPJcfgytu3tBxT0qB3nIkpsl2gdQZl28jJDuOYmxnBzzaTORfhTbeJ4Pk
         1ZV6Bc5NmGKbhSB2aPurX+7nE0yfPeqekuS0BtbdNqYO+Sl/I4KkVZKsIQHK/MfuGUZ1
         V1K46jOf3V2Bmf7vEwtE8ITypgrbWrF/keGp7HLF8CEZzTZBLfHE7cMLTvP98tjmIkeW
         dbogzYZXhUXRvWnUuyW//7xjR5NQWHikYxISPpurBgQuTJqXRvx6j3LFNbFJNzfZbZKk
         Hy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794521431; x=1795126231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEfafPymAY1ju6OZbZAnj6e5+ZStzszPQQTeE4b0erA=;
        b=ntq8hUigViFRCjNdLfJAMbzmFtaSJrmdrWgMIwjv1GaIX5p3eaXkLB2Qhu6VZ0ESj6
         ZBsx+1puOWBArhZco550wIooR3ZSyRgigOSmEpCy4l/jEWpmh32l/t/H6Yh1/9xt+IxD
         +ViJ8FLAhYb0k7taUCuZAgW/resNucBTypftf2ZN/piYuwr5uCewUs8raf7Y3w2/WnzS
         iRi/Ds4FFHypou/A+KVHTRuwSX/4vLoSbrvtbHC0/rD+s8Piu9woYNJtbucCtoO2pvfA
         yhot5cWppE5o99CbatmEZtwMYmTAb7m3966w5rDIPt5SXkqrR1lHFydN2/ffsvzNIz4r
         mhYQ==
X-Forwarded-Encrypted: i=1; AL+hErFTCaNH3WdY8SDENNAgcVkX2soV6W+KMs1fnVi7Ve9tP0delpxU54TgBOkzNv/gpBDxRvth4dK+ZwG8wwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e+LAyF5nt3joUA9FZIRbl+y4P3MftP2/SyKlxP3hsB7t3dPue
	ZcMvwqJb1UdGU9CoX77j8dO291PB0cCtUJMLxz8vHeV58D4gISZ4z5vO
X-Gm-Gg: AYBFou0d5XpEaBmcOz/6YDB6UVa0i7Ph9Yv9ELbvYiilJwd9V1/5hckE+NNeWtflvXI
	aSSmrXmJT2C9XDOZvXoZwb7uklISQ+sixi+W30NvuNZYItPqkJpxKnp6eXEXRE2UgJ6ZaXswP+Z
	++tF6cdjAaO6z/zCIaNosKX3yasTwwKHrCcwzBhgIemuxg/E2rmi3clayYjxY7QlWBPa+eZZUcO
	3V8/j/sArEjGeziu1CQ4PacOVuzNuK8GeHNviReI1u/ZX0D6miFF324NvVLGAnxsvQCqt8WQGNh
	xFEizdPJWCskv8teX9lAEAc2Y4VDpO6YLmvZ4raYAsb53AED1f9KmLyR2X6Jn+mb0yKWcM57cDv
	sleD9HbjRuuuhGUj7kXP42tzixzDfGZ3KMR6wniAka+dmCXMxz9m5jD9SmDrC0yTb1ng+6FzIvI
	lJlPgjAi18SqQ5RvzbUwQQmLINXm5iF5Nb5IxJkHfrLarKQxnUUMX2oKx2ikk6BpYBkQf3vQaD3
	ac0vFpWK2LkKB7a1AzftB8pXLJZ471flIt1OvYthe1r9YsGWO44gELJe929Ql/6/MwJZok5oq/P
	V8+R3HDYRy3ER+uRYGxWv6g20X9vhxa6IT3LpgNAYa9KDxI3Ad/1quCcFRBkuElaITfvup5+0Pa
	PjcKFnSHfJmpKEvjZ2uLcPgGsDoiCQ62XbxukduA9eXfecIMlaHqK81MDsgjLCNzwmwd9Y33KPq
	o2C6kia8/3FzbD+kkY8P5PTYIfm3NcaaoNZXACZhqe5g==
X-Received: by 2002:a05:693c:87c2:10b0:36c:a3ae:936e with SMTP id 5a478bee46e88-377e093dc83mr3350875eec.5.1794521431203;
        Thu, 12 Nov 2026 14:10:31 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm1079471eec.22.2026.11.12.14.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:10:30 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] iio: proximity: sx9360: fix hardware gain encoding
Date: Fri, 13 Nov 2026 03:40:25 +0530
Message-ID: <20261112221025.509996-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107191409.0e4acaad@jic23-hlaptop>
References: <20261107112335.444813-1-kapoorarnav43@gmail.com> <20261107191409.0e4acaad@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Nov 07, 2026 at 07:14:09PM +0000, Jonathan Cameron wrote:
> The default value is odd.  Do we have any idea what is in that top bit?
> I'm going to guess something harmless and that perhaps the gain value
> due to writing a 0 is either rejected, or actually mapped to same as 1.
>
> You are correct that we really need someone with datasheet access to
> sanity check this sone.

I still don't have the datasheet, but I found the vendor driver, which
is the closest thing I have. Samsung's Android kernels carry an sx9360
driver with a Semtech copyright, for example:

https://github.com/TeamWin/android_kernel_samsung_d2q/blob/master/drivers/sensors/sx9360.c

It decodes the same field like this:

	gain = (gain & 0x38) >> 3;
	if (gain > 0 && gain < 5)
		/* prints "x%u", 1 << (gain - 1) */
	else
		/* prints "Reserved" */

so codes 1 to 4 are gains 1 to 8 and 0 is reserved, which is what the
RFC does. Its init table writes 0x09 to PROXCTRL0_PHR and _PHM, i.e.
gain code 1 (x1) with bit 7 clear. That doesn't say what bit 7 does,
but the vendor's own default doesn't set it, so I think 0x80 is the
same typo as in sx9324 rather than something intentional. It also
doesn't say what the hardware does with code 0.

Sashiko flagged the same off-by-one on v2 and v3 of the write_gain()
series, though that is by the same analogy with the sx9324 fix, so it
isn't independent evidence.

If this is enough to go on, I'll respin the RFC as a patch on top of
v3 of that series, which needs SX9360_REG_PROX_CTRL0_GAIN_8 to become
0x4. Gwendal, Stephen, a confirmation from the datasheet would still
be very welcome.

Thanks,
Arnav
