Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794780808;
	b=F0shlPadDnCGmcDQc7YRZgpQo1KR9oESdx7UCCDg6DEmkdeBEnI4K8nWv988YJb1yA7N
	 H4ARsuR5BNpWnPafZ9lypBAMXr/laWVI1FSC7WrRqY7i6KpRQVpr7BSUQyRtZAfmYUf+t
	 husbGC0LqNpZpeFIOuNgdCb3oXJQgBve5HPG9MD5JRDQeuYa6NZkWiv6Xml+btkWu2ClK
	 T0OkETD0iV5N8KPx8/zx6pjIzE6qu3Xcco+145Q0+RmJian4p8xzKO7/4ICuNjFLIKxR+
	 GFV4kbleOtW+X7J5xhSp5/VJ5z3Et5QCXKnoDEe1P0AZVF8TUJc8Gfu5bwQ/8jYCe0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
	b=ck1O9UYgMpL+4Kj6rOvfuevNDdldrP7CTUzX0gY/nUhA1SGV6KCbGBufQkBug4AyD1hp
	 k8UCSKa4llow0yHBR9JSc0DbHOpKczy5zGwCFbzQ8sMoVosIk5ufWFlo3RnnGfsL6U2Ax
	 GaD1wF2/HU+ZankHPngDh/dq31w3XVKKmIljobdwXTrY3iwWAl4FRveor8sTHPjR8Ah/B
	 MSOiicZW5Il6DfRBxi9iSBOJoTIKyaxXm7zVESr9sokVQzaGqXVGZeyUPPmMhlDG+BRbR
	 fhVn9K3N2nyrOTJTbEoxO/J0tX30pCzFnbAedGFO607BFqMng+c8iwigs6qJKvnKe8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="KeOT/WJT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4806D606A331
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4806D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=KeOT/WJT
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67da69e7c31so1018088d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794780807; cv=none;
        d=google.com; s=arc-20260327;
        b=ce9iVcrmnl1GaVll/Us9tWx/3754ZfDX6nfsqXv2DL5oVyCk3X4t7isTHcE43Xs4Mp
         WFuhPgwrJ5ez/fNFKX/jiwGDiF5Zisvk6NW8oeNY9vU7fd8Zlp8c+5zca/D79Ju+OwQl
         PVmrwlJLqTLRLJiIeVH8BRtlxh4lnq5HjukW6aS0KKjzJ7pXsGxuN9X4FgNDven2JTsZ
         1SGel9NMLPCYcH3DoZE3AINvzb8ZrNl8Prul6TeuAkW9BU0hgUY72atCVY4/JPnsY4wI
         A2U+iRK7mDTgV3PAXNuUjuwxymTGnPM5lCRolO5r4WNzn4bbhYrIIW1EoqGUgyn49YM8
         mcsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        fh=oSikfW7tLAnxrWVuLcN6co2tv/gZtd78nNF2YTD/0zI=;
        b=PksMVHtiikhiXCNewFVavoZZTOiuImw8p+0Vgc2VnJsXs3ob5qYae7TakDENm2lN/n
         mkJ5pYPRAPlM6lvtHh5ztjha5WYxpzeoM7xuFhPJGFxcbnseKizBUQDrRWO5v75Z7HML
         Flm2iXhg0SdlaH60Ff/xKrZXYGXrBX+nm/9JAg1aiH9JUaZH/WVDI0ugDv4tRQKSDTMz
         GaInvXsr/v3sv1D5G6Xpf4yQQxAWhdygN8msxxrUTVsHl9pnyGYE4u2HG8FzpcIe53uV
         KJ6yNPUaGHGVEQW1ma+tuKakUbTB8oqrx9mZDk0ontOUSdB4Rs879EDkECfIOaLy4Slo
         7Dwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794780807; x=1795385607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        b=KeOT/WJTkV/xO3s3/8ho6ndXpXXmKFe7CrwbymmlzfKNpL2wgykSqq+IbgR5PB4lEk
         Z3a6hnz60Co8dAtCWycw3vFlsCiAXYgV+gEEcdAiy0LyoIOqz1HOkB5J/r5RDJ06ZkPV
         ns0QiBSOEvZuK/yRJLyW0/Fcbj6KjiJcfqDPlqIBjW32EqGP4EaH4z2Wz3ERrV8B/N+D
         Y2I1ULu5cmJpR9AXV2tEugVzDWvFRMeJHUnyPYNyJnBQ1POsE1b6hTyTc5c0SDzVaTru
         2THBO9lT/A75TUQGP0fbrtrcyN21R1FFWCAwizN1ehsTfSkmcunisv0Q3nXFibwfR1XO
         2N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780807; x=1795385607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        b=2BfiQvNJguH2tF8X1zxJIS3CtwnV018FP+/HNLf6m0HwsB6SRKihZkTOKGpZIjIt/z
         KIGlmHUCsw+4jqAFYFxIija8EH1iuIh3UT4qc6N1tEancgS/C2ji27LISaTLo+J7fZt0
         8bBZKGbS7h5l89mnw6ZLTGT+PV8N9cadn8ZjocRFBxxOgn86jhM9wd9SX7pfjWk9Wnts
         NgLu2VuBrgJpuz4uxakOVBhfu99ZbTR1bqrlXNoqqF27KqW1/ctBawz5vaeb0rm6YyjA
         6i01txym82KH9ThRyl16evxuLfyQHmFCK2L+VyyJLGzvrOaj6rBKsMqlHYm69QGcu9qe
         CPdA==
X-Forwarded-Encrypted: i=1; AL+hErE2Qh+ccwB7PISkoVypiwXwCeuOKliNUlFJuNvMEGM5UKGgemv9Ly9usK8DRH7OkDOlFcPfbJmKbSRsHFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pd953Au1++NTaAgwNzyrbCCKikHfw6kkpjCYV/05fhQyWFuBj
	dGmwfniS8hjC6qxBfb26s3nODql2Qb5QNFfT2gtPSdywfSIb56S5RPtBGt1q0NWQ/IdChIrQ6Jv
	jZ5f86L0h/v1UbaB5kUYBhcJV65RQzQY=
X-Gm-Gg: AZFdTZd9NiapLqZZ1rL4r/rqRirvjenYyhfdrFG3azVjChwjsDKqNoAx08YJvwPNMAc
	PgTwjBSoc2UsqimYhAuCmkBw/+n6zByPuupu5SWi+U6w92ciKOSGqt0lxtn5WCjn1iKVZLEbPBa
	7dZXpcqVyypXgbKOibHlXDbir5nfQNXErniPLcFW8aZgxmd2Zy1b9LvO6u2Mpv7girxKQEVifVY
	FFMUb2ZAl4cSPteBQPOIaLNg3WdMqwYgonWjYFntijrH+qBtSQYNaa/UXm3qmopMlVFNiWSWBnF
	17dYsKB+ZpsKHirmS3h5NBjTzSwI4W2lMo/efJ6RhdIo8N45jcznB5UQBjL29ttC9X9JSOiCJCq
	chJMSylP3HiKHhC+GUHE76qE4RChsXc4Pn9JKRHZmT9oOp4BtGX//rcMu/u6OqXrxT52RRQ==
X-Received: by 2002:a05:690e:47da:20b0:67c:2ae8:dc7f with SMTP id
 956f58d0204a3-67d895a8de2mr3616052d50.26.1794780807215; Sun, 15 Nov 2026
 14:13:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-1-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-1-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:13:16 +0100
X-Gm-Features: AclHuK_5guKUt0BBmOKSaBjMvD6Ef4THAVZjtyLJDUGu11vns0QZX0fCV-z62Yc
Message-ID: <CAFBinCCBZTN8m+u+VyR8sijC8ihaQR8woBtG47LJ7tw_ftbO_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pwm: amlogic: Add bus clock for S4 like
To: linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:56=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> The T7, A1, C3, and S4 PWM controllers have a bus system clock in
> addition to the two input clocks of channels A and B.
>
> The channel clocks are acquired by index in the pwm driver,
> where the bus clock is fetched by name, with optional get
> which is silent when not provided.
>
> Require clock-names and minimum 3 items for S4, and devices
> which fallback to S4, where the PWM devices do not work
> without all 3 clocks.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
