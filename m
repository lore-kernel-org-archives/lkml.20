Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42CC52FE48
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176171; cv=none; b=ZFmk7hpr6FDvwtTpJD+RdYnpwYYgQXwvhQTkDtOri9/hXeenR04SrFTq1HDYQu6gpuoMpenWOadJRYeN/e4vFO+RgUv6KblRlDbvWhakJqQacd3R/iWbK352/wX1vcKrJwZ/8AfvU0E6sl47P0fHJ67z+bWKmAu38c1DHrOzNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176171; c=relaxed/simple;
	bh=3CAD3EBkGvkw8ITbSCbAKxzYiupi8Enwarxa/dgYn1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5W7+QXLVqWOiP3KmuCcToRakTmJ6XZtzKbG3Yj4F94+IkL48JJvr1pY5EErRZYcp9knbXKLf+/Jx1TDat0Gkut9+i4+AVDjuxxOU3kNMVPTveoJ7NE0/xHPuXi0/ELsvH5wi0DSGSHLCeXBcD7PgGspCYKukI3rNTc6hKMi4y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7856441f7d9so417336137.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176169; x=1790780969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6YS2k2hncr+GFNhOluY330WU9W5Yzfq4y1ZEwqZxKbc=;
        b=tUp3o3x2fz69Qx15vc5gUUamPujLu9sGk3Pdgo+7OjjFnraKAgLDLxEaN82vuqLYxq
         jpsT3VUFuUD1jCp6g3MqOG2TevHfXw0JpH1wy+aZiDXsNveWpLnkpjHW093qrIslsPLB
         GLaHsz3gTtxKILMVJ/ZnxYj8dW8mf9F9ZEYMSp01mu77w3k0iMGLn1V7PeCRsZA4Cy3+
         8iZyna+5xH0h7FC6EBU7vIUv5cEtxyeee9+BP28zPIyKJiR8ItkAwUpom9807IH6j1Ao
         aMzEch5YnTsXzaC6X1T0VIYKfLqaZDjhx7KyM3KqbiYjsG6AE2ClrAO9v5WE4226BtdM
         SQXQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6loH8i2LOe2mbYXC9yxVdrr3TqAbZPW/SmbKPWGuTBJO2uGrdWz65FAgXFOOOGG3zfU1RSkA+Cbbbxp4=@vger.kernel.org
X-Gm-Message-State: AFuF++lgGW8ltuulfOrGjQ3oZWvIPjJi0JiYsQGBNAsN2hCC40FUscS/
	MC2S7s/PHXrCgE1Ikaqe3Oi1kcTMg7qRSVpLRkJ+FF/SaDFTugnHOHbj4mhxcuZW9yE=
X-Gm-Gg: AYBFou3irf0xD0nlzQnzsazv8heM1AYByZYxOjVgS0+s1RV+fm515tbA060WNySsWDO
	Hac9MhdLMQrjWBVocZyM/x2zzwNRjXCVAI8y76Po91ABkgO1bByXjyinmpzZ7GnQ7eWs5yixGyG
	PIkH8hf4WCvxYI7JfU3Ekb5VjXJUI30udvfV+XBTO4t+Hh+g1No0s4ZDezUwra2q8iru60pyw4O
	QoEGIKPODq1WFrnjNyqGl/YyjSYr4X82R21hsVwwOPtYaBLA2uUCrVMQvtxhX7+g99awvxqlNC5
	lzZM0yxLF1BzMI5+WouQK7bc4LjlwCbJXtjGxK2TbQmeO2hcofKXmxqed/yvp4IXBFDsTSXiezc
	BASRmvqamaDXXbhJi6d4HUh1kekGO/4y9W47mv8/lKxGF3ZvDQSePtUxHlMMNV9CVv8uOWzZs9T
	fv7eNtEyn8DXOLuw0X4i1QAOrmW7RXWQTXl+Bx8HPABoDDr2Sf1Z1dvQ+IozR9t1IJXjekiKwFZ
	ZxpKX2HON6fjD8HhUPkeHbc0l553dbi21ivjA==
X-Received: by 2002:a05:6102:2b9c:b0:7a7:c789:888 with SMTP id ada2fe7eead31-7ac1b0005f5mr3067583137.5.1790176168792;
        Wed, 23 Sep 2026 08:09:28 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf65b6a0esm3849364137.12.2026.09.23.08.09.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:09:27 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed2so635423241.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:09:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxvRntReMUK6sczxDlthcba8R8wQH9aSHZCFfRPW6L5xMAdStIb9t2crF84VcQiFqYiyKt1EH10RLa898s=@vger.kernel.org
X-Received: by 2002:a05:6102:f83:b0:7a1:f7e2:aae3 with SMTP id
 ada2fe7eead31-7ac1d0cb103mr2545079137.21.1790176167279; Wed, 23 Sep 2026
 08:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-8-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 17:09:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzDBMVEV7VP4JeoKFvbbYs6txYqHzw+j4qnvkKZJ3Zyw@mail.gmail.com>
X-Gm-Features: AclHuK9TWKX7_LFBBJY6lEHypNQ2_JvEQbFVziKurEpWXaJo034l1OL9z_ll5Zs
Message-ID: <CAMuHMdUzDBMVEV7VP4JeoKFvbbYs6txYqHzw+j4qnvkKZJ3Zyw@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 1Gbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> While the variant being supported here is named "Ripple", shared include
> files are still named according to the full board for consistency with
> schematics, silk screen labels and other SoMs on same board.
>
> Description for microSD is shared with HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

I didn't compare with the board schematics, but the rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
