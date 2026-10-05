Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD2D3254B8
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187362; cv=pass; b=b111N/j6QszDYkHjNOPvHt21w68gdEghYG96XwhGYzPJApPd84Snn4NoYg93U3Iajl/Jgic2MH+2CmbRjk+5f010DwI8uPvPrCoT5xmIOspOmjm0n9jveRwRw9ScVDXdHu0af88N2kMYrweiggpZqJZiudlcX7K2XdWG985vlkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187362; c=relaxed/simple;
	bh=7zF4xdS44Xdj/0gtRmmbBKIp6z7kFhT/J/MOFXG2lYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSK+EtoweRd8r7JzJOAF6LZwu6Bex2mwxUcXiFbpolsOLRdwxwqnvTKz0+NKbQHBs87QV2Zm9bazjFvxrL1xKIqYetIp2modsOrMeCSQkdcuFcnfvBaUII3tyQ1nr/6ggTz/FJpQbqRmncygnGhha9vJR0wxtDSnavYJJ1eoGFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QskGlNfa; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QskGlNfa"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-381b831d535so1268647a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791187360; cv=none;
        d=google.com; s=arc-20260327;
        b=MBqRCmakOfOm76o1bCTkFmHAn9vmzC2el3MNziMJ+bEm+rUpTyvwkAF1nXlZ+A4LwY
         0y6KcEkTDezreyVWHrzauM9+RZPiUz5l3zkk66ktOWHBc8WK8WRF9ne1mny1HBgk0ZZ1
         6WCz0jH+/hIdk6pxf5t6nF8K0Plv82QYKya7KD7TRHazw5k8/mZgRPlW/IRLyxgS9zFH
         AVzw0IrLoT3xEEtEMX3YmIGVX3b7vr7rg5TlOXsvCvnf8x5dqDO7jlf0gq5DBUrsZTnF
         CTG9fBogTfF5iJUObjssl8zwXPoHJsCbgOEFCb+rx0ltOsurOrScvDg/d+UxbL7MkwVH
         q52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sxQo0TrlOMq0lWMXbruwrg0I1eTUMnNipPm9JCY8MIk=;
        fh=vMC78PLW/xacJ4pDX+ZFsgu7mJCKk2KVqBuUaleDuvc=;
        b=MmjMBrEX+DtCzTVjGH9cegogcG6NgAMDqlwySucY/X7HAsshARjtTXfo9smmkbhF/L
         0teI2DtwkDeMbOFN6X6xlbCo3wTn4sAS6bSMhKlFq1/sFrdfrsjjMMqapssOBQcCF21S
         64wjkYmAr+ktkynGBbrCmZfnkKgqEJXs1n9vt/pyKQOeqPQ6QD+bDeiQIb2ApfeuGFzU
         713pJPtAFl4rkvYATEv8XaLWJsJqHNbB56SlG9Yv5UCOZ+M5hZWAYwnKKDnxv4CXMppA
         W/MPfmxhATWL15GAk6uXr0xxqVFjy64mlJxF/ZG8Ttpf61kM+UaAr0/lIeIGAlPxgfLE
         5bmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791187360; x=1791792160; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxQo0TrlOMq0lWMXbruwrg0I1eTUMnNipPm9JCY8MIk=;
        b=QskGlNfaKR1NGm3Rf/TBxnIjcbUDyWTdI6pkV358Sbl+UOM7z87R5FWZJJIebp4jYC
         Xn+21AqV1bXNJiHEbjpNHdwPtqXxT7qWoVgVjSn8ffUYDhXDESqgRTCO5DDtRjIopRAp
         cBLqLuVSQh20sZTgsqB3Ml7Qe1py7M043jwH5D9OidK3FaQ/v/G8JjaCjUVsHER+O7o5
         a2bxYwWcrIeLxtzZqs1NNOJTz4iPa5VDdOL7La/amAQ+lYuSYXkUI5cpDYr/TpgMAU8r
         k7xDelXzBv21hyjgOdDF0HTYfGxZ8B+8HCcqYcvjAEcOjCD/NSpTC07RPguVcCETCTmJ
         eshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791187360; x=1791792160;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sxQo0TrlOMq0lWMXbruwrg0I1eTUMnNipPm9JCY8MIk=;
        b=LSIXpvF/3PfS6qCzDLkd9Hg13/XGtM+/Ja6DrEgc561OuwTa0PBDe/zlHh37t5HzV3
         2boA5sNWhqr/f2zHcpLYIyOxuETycqjWNi87widVE8ddX4f2aJpn/mF3ODKC8P+H4NH0
         DeMVOO6f/Dz1RohojITD/HEycfCj95fymIRtK6Tw5uhTYPRASkNbOzay6onby7D32bun
         nXDVLs2gmVeawZZastuebDQaktWNM52GQjF5iT8VHYT7TpHc7oIc+hET0m0WB/W8cQVN
         JPhO9O7k/Qex2U79OE6fUeyuohZ87SXoIjQgck2RRlQbLL0P0MYFYejLjPCKw+hSb83I
         e02g==
X-Forwarded-Encrypted: i=1; AKwUvBx7HNJMTvvjJSPPZ19JEgy05574dFCz9f3bNcoPmZmzMInOnPTBTw9fYGSHtCIpIZp6COL1PP8eSs857KU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV8ecxt2vGUFxQpWwDldEvP7oQcytiqpfeM5aPZjucnQ59HD11
	p0PNKVnocRv9PyD2m72LU+IUV3MxDCjlVgKZejxWGKK4CMBv8kjXqaclxxJ7jaIsiImd/vZ1VUo
	Q9YZvd7IQ/rUb3ReUkc2yYSbZ1micLNw=
X-Gm-Gg: AYBFou3VWb6c5yxWPwuiJoSpR7I4lvUfZuKTzoM9lv1VzAKEGY4IXKEfy2YMi/n7VlP
	amUHG4PK11V7deNMeTqpYUbTGdRkxN90gXtxUCnFoX+nuXPDJ5Qh0iSHR1En3cow3CHYv2s2DIV
	4AqgZJEeOPbYlC2b8ask7/e1mJ57gTMSWE0viLANc1WDlT+6Lc9jwXseEeMYIR3ez9mR08zVHzg
	YM/UmmzJ0qcGgsMzQJJsqvf18FVbO/IjRMvH8djFInOXcOwR4189SA1qWA8+2GgoDL1NzI3VuBn
	UZH4YfTYljyG/9mZah8/c/ETUyFg6iEq88SlUNI7Jzp07ETc+2/JkcLrYU1+ZY5JUakHdTkDtpJ
	zsLQwhQFGJfbbibwR+k7CDRpokmPs0oQWsRV2y3Q7QrRBduD6oLkEGWEVh+SJpZNP2gg=
X-Received: by 2002:a17:90b:4d82:b0:3a7:f5a0:caec with SMTP id
 98e67ed59e1d1-3a7f5a0d163mr2413572a91.60.1791187360538; Mon, 05 Oct 2026
 01:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811041934.7609-1-phucduc.bui@gmail.com> <ar_fLAeFU4rmrwiH@willie-the-truck>
 <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com>
 <asCyI2_CNSoDJy1w@willie-the-truck> <CAABR9nH3pkFB-htyrD-Z+iBBcYoVX4Z-hFa_binWCXg9_cHU6A@mail.gmail.com>
 <asISGdljsG86gUwb@willie-the-truck> <CAABR9nFMR+D0j5kYR+HwLBOHG4WF7PUDrqjE4Bt0-VTUacxmBg@mail.gmail.com>
 <asJlxV06xzDIgqW4@willie-the-truck>
In-Reply-To: <asJlxV06xzDIgqW4@willie-the-truck>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 15:02:29 +0700
X-Gm-Features: AclHuK_-IzVQxn_9iJFhUH3HgnqyIHn7q3tI6SFZm8WjyMttspFJ0qnFCtIhvys
Message-ID: <CAABR9nFz65Yt-SeHAx-Gxe18c4i3Sb3b_H-zsr7d+wwK5gB=CQ@mail.gmail.com>
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ lookup
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Will,

> > > Sorry, but how is failing the probe possibly better than continuing without
> > > the optional interrupt? Add a diagnostic if you like, but aborting the probe
> > > feels completely unnecessary to me.
> > >
> >
> > My understanding is that the driver is designed to be generic and
> > support various hardware configurations, some with this resource (IRQ,
> > GPIO, clock, ...) and some without.
> >
> > If a configuration describes the resource, it means the board is
> > designed to use it. For that hardware the "optional" nature of the
> > driver no longer applies, so if we fail to get the resource the error
> > should be returned.
> >
> > A log alone is easy to miss, and the root cause still has to be found
> > and fixed later anyway. Failing the probe makes the problem visible
> > right away, when the board is being brought up.
>
> If you're doing bring-up, you should probably pay attention to the logs.

OK. Then we should probably write it as:
-------------------------------------------------------------------------
irq = platform_get_irq_optional(pdev, 0);
if (irq < 0 && irq != -ENXIO)
        return dev_err_probe(pdev, irq, "failed to get irq\n");
-------------------------------------------------------------------------

> If you're trying to use the device, you probably don't care about the
> interrupt.

If we're worried about returning an error here because it might cause
the device probe to fail, then shouldn't we hide errors from all
the other functions in probe() as well? :-)

Best regards,
Phuc
