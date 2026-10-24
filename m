Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829846;
	b=q40Zed4zZh12OEitGjGP0gRgdVPRIPvW+T+QHt6+Attl/F7EjQYY9dmM57uzVzkF4xnV
	 A7cYoTYJez4Oe99Nek8xj/iBnFd+zhV4YQnX7XojURLps6ziIvRlyW+v0/+Fa6mxie5rf
	 suZac/2Ty/oVkWG93aOOiURqXEZoB2pZYvuIhxz3Aj8a+plzfPlliAaMnfku1XSaO2crd
	 y2iVLfACRquxPQf9r5/jCA0ve9KXkBjrm1n0y4ft19VPcjNnhTexAfzpGzV0ePe5w46fx
	 TyJxvyqFmo0qb7F36I9AH4k6Fzx/AJq4lsLbVvuy+0eUcdvwkoBV9rZHiY1lFqQ0UDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
	b=sXsYwUOuz34wizPBy+32T7KrwjC50pqnwaC5ru22rIiDuHtJdKqaCK576n0br7ySNl+a
	 JZVKONavp3z9h7rtw2IiOl3M2Q5u3OMRRhgleJTjjHIWTQ3TdBmhq3OFAtTjUjDSxMvpg
	 KO9tUG2Dhv3yS52u0WRxM/NoDVC3k4JjK3boYaUePGIxKhQTKsqg41wTrnPGZQnSJ0b9x
	 FscbvQiUJHYfiHkodFrmNCehHd10amQdbzIVOQsCzUuysWr2v7KmgdjRC/hzVIlPNo3IL
	 kaNfU8yFGvomHKDWwzaDub+SngGx/RxIQNDSXPh2TGj9ZfMPxN/5owFWmN3Aj2h6aKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6430606A326
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6430606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so860562a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829845; cv=none;
        d=google.com; s=arc-20260327;
        b=hLpzB5Sp9Fcw1QdjivY0EIUOS2vgogJdkQfT+a7ujiQcQZTZTwnWyEHcbKen3vzHJb
         /JdiFHTIH6kyfMtMMD1p9LJOyBaVreByb+/3etlO5FnUrQNrXpLBoXVOZWI+JeP7Vw5D
         cZoZgbm+8dqBlATGbXuxSlN7t2D4UqAxysTdYs6EJKX/FCjAF5N1aXQRgli/E+VTwWP7
         AFV5Vy+fOzpLu8/lLzJCbjbjbIuqZMah/V61vdGk8yBqslX+Cct9apK8GDD4gmYB72fx
         C9Subf9f8fVHuGK9SOqwF40z5IEdyQzJCiQ+UzgIeccsqRChlMCanw8bGs2jt7gknW+m
         2a+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        fh=tBh8GJKiHTwtgk7qTuLVuIE4dYBxVW6aIGyQesG/fn0=;
        b=A9B9RMzk+KccHkhYPizVqQBLo8JR1s6yfh9H58LwWva/LvxcFsNl/mwq6E8sP8jCPR
         4RoxN8tYEDFdoOOa70HryEAjz8obgBh7coKZzTXDMSBuUjOrWA0qYkgf4+ZDYIEwhKII
         Lj3GREswi5MeuwxqfNv+7uR4zhLTj2lv1dYwGNwx5DFqD3JYbWeuPWJSmZ2gkwEpTtP7
         VzrpI1OtWSmbjCmUzt8EK6RXowfViVLQMWGWvsBtroKKOUUglI+lEcaZEnaaZzo6GoX1
         V3FpXrXUmU8G/005zWzR4sl8oDYhJbHkvCZb6IPAH7Cxvyn6MwgYqvwyp+KPP6LCetcT
         gbqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829845; x=1793434645; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=W+scGDokeW8IVUlPw1qaHOR19xQPyTOtn+x7HYHtCqXqHaqa9rlnDqjOM+2Ceue7fL
         Aju4fOv9xr3yNjCoA1fmjYX1vQStbRNTO4lyjJ+X0ScdnOQnU3gmpoLqAC4vffWd2TMB
         smWVx5HbLNJaVGD3+OBLLSqtnKQQ46IxDRMvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829845; x=1793434645;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=MdsAFJwPOTbS4Su/zwIP8g8yIRl+NcnjbhHNR/IUVrzdw0DomimLWOhiQQg4Kc6hfn
         VQbE4a7B+vaVlpng13VXGIu5ajHdZGWXJ3p8LT+RL8eWB/FLU8i2+T/Em03Nl/92FXzs
         ep35r9xDM0n9gEVoa9fojs/RRkwQ+V06g6GnmWp60R49DBaUiMQV88CfXYhgNL8geiZt
         kWaCF5LAA5yQpiHBFBCJJOUDt8QMiVfCgp/fAzNtyZGUCmwmmvxMdPiKhjEC8XyPuk5F
         HT8cITrBPFiZ51owe83Nr/zvwDVrsWADJe62b69FZr5ri425vjgJsQ7pE4nurM5oJjWA
         +Psw==
X-Forwarded-Encrypted: i=1; AKwUvBxIqtIS7egk+T1gvY/rJoS7ahomlHTPkcOZEiiwOG2EtueG/b5ZVi155zNS+FfxVYKVpZ9MovHQOSeITUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9KsjkSDUWvXb66QH8LzJLEKzldEgGOZtpIT8Jol/KAQMSaVVS
	Rl5ZRG/+uVfJ/gwDb6WGdoPWPY55nesk7bpsNGbrT0Ts+z4Sdv4gr5nuEIssZNQidjeSJWXKhxV
	zyR0zOW/ksO/fUJbOPzJFp8BU3mYMNU8h4tjkASVn
X-Gm-Gg: AYBFou27dYg+lNYejd+EHPfyHi7/hLPrkgQWCGPh7/n5m871650MIP8AVK1qBzhvdzv
	NayOyiQqlHqbgcJalMLC9eaL9SJy10FjejC+JxuaoBEWcBNIBsUZEO6gh+gLnY5jUX3uGxEnG65
	kbPi8FEcSocvKOZdLTeocL/mrhE2W4FEYi6RkYJdUnb5jtgFpZFwHxyVJg6Vat440qh8p+PgvkN
	Nvp7/+MTxYuLFixN/lFcbjOLuxmpStXbg8jQVeg78C4pFtazPa91tGSyYBgzQXdbBT9izxh8la8
	2v16PEJEdtIuHBSWIemQ06TC5IvUOuEsyZQ5tMU7DmS9fJL6wOjBEsU5lfE7JhACSVhlZEzGo/g
	PoY86TCazSxsArC4DumAYrGuJ802OMXK5+LU=
X-Received: by 2002:a17:90b:4d09:b0:3ab:31e6:12fc with SMTP id
 98e67ed59e1d1-3ade9475f03mr1281929a91.0.1792829845190; Sat, 24 Oct 2026
 01:17:25 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:19 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:14:33 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:19 -0700
X-Gm-Features: AclHuK9OzNbsUxoUq8dndEPiTUrFf9OR8thbHVNZoTYdjjGKeFC-1VE0qwrhJ4E
Message-ID: <CAFLszThr=rPCTxQxst2_Br6MWwaRFe_rHamzLXY=ua4Qr8mAeA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] arm64: dts: google: lga: Add lga.its FIT image script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: google: lga: Add lga.its FIT image script
>
> Add an Image Tree Source (`lga.its`) describing the FIT image for Google
> Tensor G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`,
> `lga-frankel.dtb`, and `lga-mustang.dtb`) with board and SoC ID/revision
> metadata in the configuration descriptions, allowing the LGA FIT image
> to be built with:
>
>   make \
>     FIT_ITS=google/lga.its \
>     FIT_FACTOR_DTBS=1 \
>     FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
>     image.fit
>
> NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
> image. However, packaging scripts will be able to take an image as
> built above and convert it into a format that the bootloader can
> handle.
>
> It should also be noted that the "description" of the various
> [...]
>
>  arch/arm64/boot/dts/google/lga.its | 68 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		fdt-1 {
> +			description = "lga-blazer.dtb";
> +			data = /incbin/("arch/arm64/boot/dts/google/lga-blazer.dtb");
> +			type = "flat_dt";
> +			arch = "arm64";
> +			compression = "none";
> +			hash-1 {
> +				algo = "sha1";
> +			};
> +		};

Just to check, does fdtfactor recalculate hash-1 when it rewrites the
fdt-N data? With FIT_FACTOR_DTBS=1 (as used in the commit message),
mkimage computes the sha1 over the full lga-blazer.dtb and then the
data is replaced by the base or overlay. If the hash is not updated,
anything that verifies it will reject the image. I'm also not sure why
the FDTs get a hash but kernel-1 does not. If the hashes are only
there because the trogdor script has them, it might be simpler to drop
them here, since the packaging scripts repack everything anyway.

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		conf-1 {
> +			description = "Blazer (board_id=0x070406,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";

Since tools are expected to parse this string, please can you add a
comment at the top of the file describing the format? For example: are
the keys required or optional, can they come in any order, are the
numbers always hex, and does the width matter (6 digits for board_id
but 4 for soc_id)? Otherwise the format is whatever the first
packaging script happens to accept, and anyone adding a board or
revision has to copy the existing lines and hope. But I think we
should get this into the FIT spec - will mention that on the cover
letter.

Regards,
Simon
