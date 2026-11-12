Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495447;
	b=fYgVxUjb1z3dVfOhJzt2YFVAN3jxiFV8C2E2clmCaz4Mp1kTiyDL1Iis4AKO+tJhGQuZ
	 utG4HT8rxHoJmhkE0ufusF0ijqg6d1ldJwD1GibOW2YosubopLlG42W6OPqBbKgrTBjnm
	 Xq5LKcvMv15ckv82nb6xtcvmyhMwoMU204wUW+UiTh/jSt35igF07xowJAlz1epknhqzx
	 qXoboMI4BG+zQQJaJVHIdeVGpHWy6ocNFT+XHXiIJ9eitJb4RQkAF4e68yjAGcwH6Ws26
	 ljpO04ahpILWyK5+bjrR19gUizPyvBp08l3uikcIQZYAus9Q/3nf1Nx/vbNs8NbOVtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495447;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=mS1ut25pAkhX06KpI5+b6SzLMFwF8RaPMcofkkPb8+I=;
	b=WQVawRr0OCEi6i7RGeB3arx2L3fYKO4IybcsFJwlOJrsUSCEVz/fZyCgFeXjR5pLoKPO
	 VhvNiIQj9MhCEBVtOEi1ysTZQToqkbkhOQ3x+YnWplMVcNVTpPaVUIEw4h/H9qySWDNSe
	 2HEexP+g2pWK4B+sZtjcY4xFOlKbk2nk8+7JeEmuPxHY8rZUAD4v+V4LyW3Lc40MCHYD/
	 wUrlt/+ePvwFUlIXwkSJksy0nP2GPqpLNY9GdL9q7zXLsoODhwYjcpbMXPAugrqO+5fAx
	 Fn67TPEWg4kK7xJRKORu33y/kEidxkdMNKTbA/sJ6+7KVSoaDw1TgBt7GCzU14bpsBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8029606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8029606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-990703f817fso2115372241.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495446; x=1795100246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mS1ut25pAkhX06KpI5+b6SzLMFwF8RaPMcofkkPb8+I=;
        b=j/aYgaCb3sFquyJjD0+cH9b/iGe7HVhjpThxa7ezIqVdf0XSQ45aigcp8kBsEvhDMA
         BzziJvOthk09d5JoTkgQ/qac6rBHYL8RfTNApOB9W1vb/1W+WqQA4Y7s3zLY7kTXaFQj
         fynlL9wkiTBdxCZCKCUZTjtoLseMliVOSRnp56u9OTeUfnXFnO2wuRzwRc8H5uRH/P1H
         1BxkcOz4eKXxFXYldvdzl7onJsXjsgbLGs6QiaqlSpcvN2/kczM0t9Lmke42VUNiF2vC
         QNpVNZnaNl7Sncr+X8AAReMO2io3tn+SZraUx7mrOj1f/9zdk/yE1Xx3Jx6VJ26msF/Y
         c0Nw==
X-Forwarded-Encrypted: i=1; AL+hErGSdGOoDy7vUVziVlx4IpOswJnbkJ8dTLioESJx3Kn7vq60uOBp4vHRjAmLHMuxcOfPlYueP41UtWwA0PQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WKHz7tJEr5qy9yASJe9mThs4QRTgEmkpISSHUMKp6uGqs5jji
	j0KwfWPoXN1drrLhFk36QfaEUy9Xjm9RfMyR4mTNsXmai9WTwPQ7dicg6texrViuLjU=
X-Gm-Gg: AYBFou10VJw3NE/kiwdnGeEHbwBS1lKU+W0SpVMHCSFd0G8m19vwBE1N56DhJE5LtYP
	ZS6+L9phWrodtXOe55G3GwCBbfD4nyi8KJkjjuEvPB55og04Day/ASacIlIlcerpUvP58zjN8+v
	KR7di6CmXp5AwBY87qHNuGZWjphvMfZJCbGYx7uqttbpUz21ZUa3dY2fuTIF+WvSAVMFccBr7zm
	BEGbY3nAP1MuICxyasHwaHWu17XhUA3SrEMBtZnZtJEvdop5D4FkTyJzNGWqOKozkkozjij93wO
	gAjY1UvnugBOxo4qHmarFfW1krXRkAEEHtsBKDPj9Ul8wGByIv1O6ItK6Ax3iEaXZ3Y1/DBdKlt
	P6ss+VZiyMRcARx/+4u0flEd29csoid1uP+jn9/Se88iIZXcg1ACMqklBNTn/AZOH6U83SG7uLT
	wgr9/ItfJ7A41FezVhy3KPD7cUE5MjopcT4YOHggaZDzxnK+FXNPpgZGp1V9lAdgaZRV1TW5Yl3
	+HIQXaLUYdAkF+m8YatUhKJRmsnC9KR+7LBnnSVDw6LX3HwY8Z4GLFBS0LLi18LrrJZ8LCwWf7/
	3UsP8YQv5/Hro0nPqxvjGwHyjU7X+7RtW5IlNC2UmWeEBRdzuSVPI8Na2R5/tZZygP4=
X-Received: by 2002:a67:e7cc:0:b0:7cc:2bb7:1335 with SMTP id ada2fe7eead31-7d50619786fmr2627250137.33.1794495445681;
        Thu, 12 Nov 2026 06:57:25 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c2019bf87sm6086910241.11.2026.11.12.06.57.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:57:25 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7d2b25786d9so2275430137.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:57:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHZz31CaFNEIeYZCCYiyCtcf/UQCMl3QB19+ionnI4YtqjIfSH1BMuFnM/8iz1EaEkPIrgdNwv6qxDmyis=@vger.kernel.org
X-Received: by 2002:a05:6102:f10:b0:7c3:9982:67d7 with SMTP id
 ada2fe7eead31-7d50609c9damr2546296137.16.1794495444511; Thu, 12 Nov 2026
 06:57:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-5-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-5-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:57:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUvhf=zEmd2tfodo7zf1hh9n8m88Okk7KZpq0n=mDR2A@mail.gmail.com>
X-Gm-Features: AclHuK_otbzgK2u3WYfd1DmRW9SD98NHgBcVxYwHNEPtms-IkWdgisCPqESp0Ec
Message-ID: <CAMuHMdUUvhf=zEmd2tfodo7zf1hh9n8m88Okk7KZpq0n=mDR2A@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] arm64: renesas: r8a78000: Add FCPVD and VSPD nodes
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add DT nodes for the FCPVD and VSPD IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1574,6 +1574,196 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               fcpvd0: fcp@c5010000 {

Please preserve sort order:
  1. Sort by unit address,
  2. Keep similar nodes together.

[...]

> +               fcpvd9: fcp@c5019000 {

> +               vspd0: vsp@c4800000 {

Do you want to sort the VSPs within the VSP group by unit address,
or by label?

By unit address:

    "vspd0: vsp@c4800000"
    "vspb0: vsp@c50c0000"

Note that adding the vspd* in a later patch than the vspb*
means the latter need to be moved in front of the fcp* :-(

By label:

    "vspb0: vsp@c50c0000"
    "vspd0: vsp@c4800000"

> +               vspd1: vsp@c4808000 {

> +               vspd2: vsp@c4810000 {

> +               vspd3: vsp@c4818000 {

> +               vspd4: vsp@c4820000 {

> +               vspdb0: vsp@c4828000 {

> +               vspdb1: vsp@c4830000 {

> +               vspdb2: vsp@c4838000 {

> +               vspdb3: vsp@c4840000 {

> +               vspdb4: vsp@c4848000 {

>                 fcpvi0: fcp@c5030000 {

Shouldn't we keep al FCP nodes together?
Same for the VSP nodes.

>                         compatible = "renesas,fcpv";
>                         reg = <0 0xc5030000 0 0x1000>;

For the contents of the nodes (except for the renesas,fcp properties,
as I couldn't find the VSP<->FCP links in the documentation):
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
