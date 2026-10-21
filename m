Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541717;
	b=lliq7D320w+dNQh93k9tMuqpEypXp428VtDjQq3HF+nMWLCLNl8bGtMeZj2NxuRqrCze
	 aCvjpF6awoBXi418r2oTI8B/AOzjfktySHvuo73PWrixBqQYRCxFobXkvVVzzqFxaP3L/
	 c5fhyIrVUg5JbNq3eQi6XDrCijcxBGgLsK9FDfskdP6nZ0gE3lJyh2qKi6ID0f3K6GQH+
	 d0Ji6r09yl8dOIWCX6I9p/oYr8LHGg8h+zF67eycd3eu4Dh451HEmpTdy7EgZzPa4dV+g
	 GQBCS+2/gRyNqDWfelOtbOPQ2XCeI+3l3dPBCLbF3nwfyapfAy4vSkTrKcTcKKdyFcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=buJFybofRKAj6f/cOm3YyhAusR+wZtUZbjqKpPWA0mE=;
	b=LZj7RMWvHZovS9UGlFRCN/y0Eb9G5xg2dfMTHiYA4VLFFam602C0NrvuEkP6wgYel65Z
	 bXZGu2MOdtqnGXpmkoHpavhkfM/DvCz/IuWp02Q+LgYxqS23mF5xQo4fcTyImFB8xaglQ
	 Az0Rz2OBJuomJDViH4hxLsilLYqCc3PW/0sLievDpmYDMUpdKfwWHlW1jYRlFdYw4YZqQ
	 JjDA59pT/rHFlwiHKafKsnrgl4CgfMJEadj6MjQ2zBvBiLxhNVFIkHWcgsuDgjVUiB/vP
	 u2NqvKwJQ6trl7nsblgnJDT7ULDROKyBbXiZZNC0tHun98VW6+3v2tp0j/R1DOXoJkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=WQHE19US;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265D6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 265D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=WQHE19US
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-157fe9d771bso199402c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1792541711; x=1793146511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buJFybofRKAj6f/cOm3YyhAusR+wZtUZbjqKpPWA0mE=;
        b=WQHE19USH9U5cqIX3n4xGtsapTcnXA1cYUxwTQybJpgn4ep6GizDYqpEZd9oBDaz6f
         njxHGyduIJy2iqKwNaylf/2dYUHgft2NGKq5v1O9UXJHXg4v2uvBD+j3KOQbfLAjHOkh
         14iJNsV9LjBxcLkO9PRDdCbzAkyQigooeZedUkJzfCtVmRON5LpfsVJIQwa56Ugf4HrY
         yJVSDbz+WhjcplLhGmLPM9tERkVlUScsHm1hk3RhZh2QKjmMxKwY4nnnuHoMbLXdoEGf
         BKvZs753EsG74jDXDCM/zrodfTmUYi3D0aHCwXcs+lpsv5Hm/U8IMt5qm9EasCRAd0wH
         f1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541711; x=1793146511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=buJFybofRKAj6f/cOm3YyhAusR+wZtUZbjqKpPWA0mE=;
        b=lHeBJ9nYa0fhcTIQjM4PRVdm17ioStxJJSC+K3SaLn1f5LmHw5nbdbxQ1/tu845YTB
         L0oFcXxmVU31AdL1ygPna/eHxEO2jmDLUzcYp6o25K9zICfrLuMy2LiB59MPrqJ9NHTo
         6e2pUX5TDmQVVdr740tzXNqKTsF5UgRTzfSv6HPq25sc0FGd9fIT28OogoLqp4+3E0Zp
         9JBNGpUFqIN7aK64jKZa1Asik/cxonxo4Gqlgc6GEcEI+9mvPF4lQ+0vNAxQKP3hIgVG
         f87jMF73RyoeKyaN1J2/oVcy3/7bVwmqBsTFwu+x5+eKqK06JI45V8QikVGZofmYGxWy
         9Pzg==
X-Forwarded-Encrypted: i=1; AKwUvBz6e2L50YHdSC3s61RyEK2Pdq5Xnfmfcy76Us3FdJYh7fCcUiBWAxDp9FZpTdvZRcQahtiiceB5FS3wErs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkrR4hGRNP89N+VUYdC9eUHk1Bc8jo1N0k44WtadAYR7tFMz66
	NIYlXEVu20KH8R3SZxTAjocOXJxvQpMto81k9drKUda7twFKbdWNmPnuLpiJmy5n5w==
X-Gm-Gg: AYBFou2ixvgo+fL6u1+/5YMpvvKZHc3y8TuZFGNCiNdIkYv5mwE6tWO5S2AWYQ7xpM1
	k9a6ViIkok5LdtIwxvhScjLs2RwFrjeqg88wvrOPY/0moNTPliygL1FSZymzJLVnEHu5igbYgo0
	VqPUAKRhQC1M6jO6LzT5fJucrrYtvPeGBcCC5lslXvF8KF0qmIXYKeGtND2V38XQ6Xs4ZqNvtbG
	04Mx/Dtd6sa0PJ4Aa+Fe4lQtF9x9C5vuVPc2GHbXyxHln/OFpvLXBbJg/vHiEEwaTBT0k6ej3Cg
	iBbEsqtq/GJthp/vFlFyfBp0w8ry/zUL0BJy5h5Ehz1nO10hoDmQiCnAXSUm1D8jf0jkNy4p0YW
	kSekqUP0Q0x2DjeVVcpp5EfSvi8xdj9tulJteef9m0TBiuqE5mPgomf1QqLWA1+K9zi3ZuHi68w
	fNfd9x96NJ0jWP/i6WWRtItcBI8BLhSbHAo7In3YX1rVVPZpv7RbdYTzy8BOMddw6cwLcHz+fsP
	C0ArZFVQ5RTfBbLNxdFklcwuK7o4ZuKH7nnqmX7eMsRhz+a8eV7X4PCVTjPoMomp9vyDZ8dIrQ=
X-Received: by 2002:a05:7022:ea59:b0:182:94d7:f76a with SMTP id a92af1059eb24-190a728a66dmr496799c88.43.1792541711094;
        Tue, 20 Oct 2026 17:15:11 -0700 (PDT)
Received: from cantal.lan ([58.136.73.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm2249259eec.25.2026.10.20.17.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:15:10 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	richardcochran@gmail.com,
	florian.fainelli@broadcom.com,
	opendmb@gmail.com,
	nb@tipi-net.de,
	theo.lebrun@bootlin.com,
	andrew@lunn.ch,
	linux@armlinux.org.uk,
	conor.dooley@microchip.com,
	bcm-kernel-feedback-list@broadcom.com,
	tglx@kernel.org,
	jstultz@google.com,
	sboyd@kernel.org,
	mlichvar@redhat.com,
	olteanv@gmail.com,
	h.feurstein@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 6/6] net: mdio: bcm-unimac: implement timestamped MDIO writes
Date: Wed, 21 Oct 2026 07:15:02 +0700
Message-ID: <20261021001502.1306545-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179240607580.3135.9897216542640862141@kernel.org>
References: <20261018100257.566267-7-jjc@jclark.com> <179240607580.3135.9897216542640862141@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [Severity: Medium]
> The comment says the reference rate is taken to be fixed. Is anything
> actually keeping it fixed? There is no clk_rate_exclusive_get() and no clk
> notifier, so the rate cached at probe can go stale if another consumer or a
> parent change alters it later.

[ ... ]

> Could the driver take clk_rate_exclusive_get() at probe to enforce this
> assumption?

The clock this is for is BCM2711's GISB clock, the SoC's register bus
clock. The firmware sets it, and nothing in Linux changes its rate.
clk_rate_exclusive_get() would also protect its parents, PLLD_PER and
PLLD, which other clocks use, to guard against a change that doesn't
happen.

> [Severity: Medium]
> The commit message says a deferral of the clock lookup is passed on
> so the MDIO bus waits for the clock's provider. Does that work on the
> GENET path?
>
> There the UniMAC device is not bound from DT. bcmgenet_mii_register()
> creates it and calls platform_device_add(ppdev), and the probe result
> of unimac_mdio_probe() is not propagated back through device_add().

[ ... ]

> write_sts is optional, so would it be simpler to treat -EPROBE_DEFER
> like any other error on the pdata path and not offer write_sts? The
> cost is that write_sts would then depend on probe order.
>
> Alternatively, bcmgenet could look up the MDC reference clock itself
> and pass it in struct unimac_mdio_pdata. A deferral would then happen
> in bcmgenet_probe(), where it is actually honoured.

We chose to pass the deferral on because the alternatives seemed worse:
treating a deferral as no clock would make write_sts depend on probe
order; looking up the clock in bcmgenet would hold up Ethernet for an
optional feature, indefinitely if the clock's provider never binds. On
BCM2711 the provider is clk-bcm2835, which is built in and probes before
GENET, so in practice GENET doesn't come up without its MDIO bus.

> [Severity: Medium]
> This isn't a bug introduced by this patch, but the new comment makes it
> more visible. unimac_mdio_clk_set() still computes the MDC divider from
> priv->clk, falling back to 250 MHz:

[ ... ]

> Now that ref_clk is available, should unimac_mdio_clk_set() use its rate
> for the divider too?

I agree it's a bug, but it predates this series and is unrelated to it:
unimac_mdio_clk_set() is unchanged, and the write_sts bounds don't
depend on it, since they read the divider back from MDIO_CFG.

James
