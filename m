Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268106;
	b=PCQyadSjUw6dSgVXGwM+TVTVUFt1uINB3ZpNhv4qH3yb3z8UUvyKT2nOrNv1k8104zjI
	 GTTvSLw8l3FKl03KzvbuFJgqBCQvxY1chP3W1dLFi7O2UT4dkAwb+iWYByxCO+fGFHUjp
	 tg8Fm8CCJB/WuY5E0szUqv/XxiMU2xMI/t66DAtxBibc0XeV/YgMRGzcD7U4/C8TFIvfU
	 w32KvkNEknqkZaV7hUJDB0JUHVN1RCXOxCtwUPp7IGB/BdEaTmFRMC3zf8D/lUpip8qPI
	 2VWrNk5wJPu4/u6Qrc2KXzvSWgZUbpltdbn4gbp6W+FrCfvR3Byp0QLVCL5us8nNAhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=mgC3aFnQzEkUSqr0EdV9/pvy4kdF1e+4cJ+OWTfkigE=;
	b=2gTyiWzYqEUzjg331G0xtLi/vNwW10KQB0otFeViey8dBVKvR/mB6oOruHpyrtwH43/S
	 263eMOvCHa5eQJXTUooN0FjDI0pJ7daJdLpFhe9za9TT5jzHGkJsruET4GcSj20FYnnVT
	 cawRizF5iw3aunCwu6Lakje4iQ4j2VFIMAzl4Gzo1IKDqkHi9GZfjiYXPyyDd1TBxGO1e
	 yzixE5iu+8QaQWL1J/sLIjwPQ+aWgoXs4YJfvDRPMFXdpJQ/wCNSDQvw5MaNALzSazfPQ
	 3WmWlGkcVENY9XbMf9cL9Epm7NKseP4LB8mbfiNEW3KhpMEry4XrUy5iNEZ5yuNtqbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JCV1Ttpn;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29629606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29629606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JCV1Ttpn
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ed06b725fdso10978455ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268105; x=1794872905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgC3aFnQzEkUSqr0EdV9/pvy4kdF1e+4cJ+OWTfkigE=;
        b=JCV1TtpntEO2y+R3SwQjg0sprnLUZgcAIH+abSygcDUpyFJxTFDalHfw8MGnB9a0y5
         TRXJVvZZJLFxh3BwOs0WsTv53xhKY6lbuiT/Dc6u8M6mpIfPFHQ99/tpbqEjKR5bBtal
         UA/UzkXT3DyhoY0d+QxQ/GwFUvDMIthYPWvHv0PQopFgPe2HfzQXHo3rLg9kl27EoGi3
         EtqsUruCtPOXI4/gPYj+rW05dH2AYvQD666F6EXjBbXK7RPE795oRQ/e7D7ADvN+b2cW
         KDZXGaNiwpR7X0EEBRaIrGYDsR21J6VSiRz1J0r3ONfd1VxnPmuNRSkDefmnCUD9I5jG
         tcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268105; x=1794872905;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgC3aFnQzEkUSqr0EdV9/pvy4kdF1e+4cJ+OWTfkigE=;
        b=wU1MwgQkJ/U5pUN/V9MRqBoP/gap2dbdO3X+yjD8TZ5Vvb3orflq74WuJgU6xXGi7A
         671Z/xUgvDU81qr+FkR0rRiwuKXcxL7vFJLBaXcJTl6SlkB3iGrTon6hKIbiqvhhKsG/
         vXDNjlwUON360fgjAOgfr8/idXO9mdymT3+jMxT6BFaQ70OOfyiXGf/ADCa+jyQfesdz
         3haCm1pD/S3DYdjkJaoXYX5kNp0eXXildYnneoU5OfXS51c83ugx4aI/XrYmn0bxk84i
         z4B0cWdVhnU1qqz7c7wdseo8r6BZEM5jQKZN7CWh9zhagUUh3BL7AEM4uvJQQwWVzPW5
         Vttw==
X-Forwarded-Encrypted: i=1; AL+hErECC4jGSjg8Iy/lQvMIizDcWl6FTn4agZo/MloTxnWVahVkUF2umwpbd8qtw4MFraeogpXYj8lN9Mqv5VA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YagLvohTlSHStMBoFPlRNElT7/Y0KprDZFTzbIPz7GQoC10dx
	nEP64gQwgbzh+UPyKrUv4aRGGo9K5A0JRLqSYxYh9z+CUFws0oNcGxZMnMldvPYawYg=
X-Gm-Gg: AYBFou0eiSwikqo+324Wpr7QTh1ZIDJ/ytRnXsz1O0sseA9NkK1aIxjHfmzE9y+VB5c
	MOuthf0BLs+HjstGYK/j0k9mseidgI+bS11cRQiv9b2ecssUU/Tii66FpK6PW5qEUYPFhEfy7Xl
	hN+AxczmOG+iarRgqc/11C1j9G9bJOtChgqcRsGNweOKqx5dlbXycaWAeMJViLpJkJ3H+Cujg2j
	gdWKH5TsoUlcQOZ03CKK1m/hgD7vEjvsrk8XgF8x/gxhdVY4uRYvkFDc1VqiGH09jzzlyasRQnB
	1qsRVb5ZLV2INbJrtAOHSQSa9nchxqvYwLekvLw8Ej2zMt8uzsivHpI5mVtBCqjVBGlauTSlYJU
	7xdVCxOOqxP2guwOFIsU+oOFkPogbShSKTD32/KlnzaKjJEW3Xm0EtRtR1OVWm3iMar3HcTRw0z
	zAAsgtK6uSS3+LcFqeugKJrC+CombpHUnrt1Ze0F9BY+UYNV0PBLGLw+ojVOWQDnz0IebDo1d/O
	QLRGBF9bgdMgzAAgjf7fJ/CVX67aa4uxC40a6F04ixPqTaoMFGS00T8BRmEM48KeXD0DYyO3ZRp
	YQPUhpo3pzpj5lgb6Qt2DY5Leg==
X-Received: by 2002:a17:90b:3844:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b16797724fmr660791a91.18.1794268105529;
        Mon, 09 Nov 2026 15:48:25 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b16771705asm1371571a91.12.2026.11.09.15.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:25 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, stable@vger.kernel.org
In-Reply-To: <20261103-v7-3-topic-am335lpm-ti-sysc-v1-1-1b9a23b4a7c1@baylibre.com>
References: <20261103-v7-3-topic-am335lpm-ti-sysc-v1-1-1b9a23b4a7c1@baylibre.com>
Subject: Re: [PATCH] bus: ti-sysc: Don't reserve the system timers on
 AM33xx
Message-Id: <179426810432.2265990.13205445943569497614.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:24 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 03 Nov 2026 14:24:03 +0100, Markus Schneider-Pargmann (TI) wrote:
> Commit
>     3f6178392050 ("ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx")
> introduced handling of am33 SoC timers that are already active as
> reserved. During probe this means the clocks are enabled and a reference
> is kept.
> 
> On AM33xx deep sleep is entered by the PM coprocessor which
> requires the PER power domain to be idle. The system timer driver
> disables the clock during suspend but the additional reference held by
> ti-sysc leads to the PER power domain not being idle:
> 
> [...]

Applied, thanks!

[1/1] bus: ti-sysc: Don't reserve the system timers on AM33xx
      commit: 196abf4dabe28fe7732732d0c79b84bf30994cee

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

