Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495031;
	b=OGmlEBsfqutmRKiBCFPCdAy6XlgOWPVAbifaj3b1oybx9KwjZR8zWcuxZdHraDEmm6YP
	 iEfkex+F1mNC0Jbgi2bjtek69hZpo1jDmUiVOitcTLRf7nDMKQ739hSejgTShQe489MPQ
	 gd0RDRr9FkczpECzhtv8Epw1wk83e2J1hSzUzWZR6AsXKhzmZCYzDAzI1C32kOhNS8KR/
	 WwLFLaNHX3dXKP613R84L4A6iDyrECG1U5UZo05yTVjVYlsF76hK3ZxGuFsPy8lawM53O
	 e0shq6ev6T77iHYNZPhZ4ps7+Q2f+iI9CgiJn7VvM5rrQd0NrJNBjjL62MXOj32qfZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495031;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+5BCTHh1J6xXvkZ55mDmFJRrwUlGVc7lU2YIf178GaQ=;
	b=lHEvq+qRX4QpN8vwLw1Ta7ytrwd7ju1qKh8eakvdQJZHB8rAX1EvV/C5wgM8f/kaW+57
	 PzlqGJok3cx9tOA0sxnOp+86tx4ZH4YzCBBXs9ynIEsbrMYwcaseEGeXXnYHsglmS9l4y
	 WfAnAsgknhEz8OqRVuBKVIfCtrLo5x95s59xLWGMT1gdVv783SHLSex5s8ltnl7msvc6q
	 4lPg+RTbqOTLJR741XvjaPF8QIa7mtje0T6XHyxtzxwIYAFHI4/+HWaQOgyXl8rt4xemL
	 KTq3HKqBHyItCZX0X7gwyq4NrmMckAMi9tT249eE8LsrtKYZy8pwUIEcNLp1FZ0Yuow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB46606A897
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB46606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ec690faf85so1411815e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495030; x=1795099830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+5BCTHh1J6xXvkZ55mDmFJRrwUlGVc7lU2YIf178GaQ=;
        b=KUSjb7z+6jdD8h0tM6zobGRUvbcs0pQKnx5AulTSEN4WSzCLK5BEo9Mh7ghUWAqN01
         d4irtTbUIrto1CJrU298hgjwsFvp/kiX1R99zrJQ+LZi9XQ8lVLX/y+vrf9sJYLokveg
         shJbsVEc6jwAxQnz3X/GQAUlbLF99P3m5YMHWyoRPak7qBOvr/o0CkJf9xp0fKjCIDZK
         x7JSSb4uKExZqJA3j6t7kz6qJ5rhXvDPhUNWeJW3EsmTo2zZTL2fk3nzYsCCKZ+cWS+S
         fYTJzziGeFp+yDqI2gUWS5IFhuC5kpSXp24qjD3IwuyuKhlPdRzwj9ORgTuW81AyDQjX
         wblw==
X-Forwarded-Encrypted: i=1; AL+hErHtswuOY4kPiIw2Md7rSyUWC1Pg5Y40du9RApLCNPv2AD6419eYz9N9PLcGoI0vCOU8ZbtW0Bn+oAZg0ew=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hs5NWjlN25+Ji8+EoAinersVzbTKH/4DTyy33zrIbeWV+3I1S
	ecRAmCWftePqTtrb6U8/kMQGy6ClPuoF/z+JZ2rFuVuKon4KNq5fvFYG2ryTK7q4kKM=
X-Gm-Gg: AYBFou1hm9gVrqju5xM5lC8r6T0FucTzh8eAGiZD2NVTzsRjqRY2UyxBTF92aYPSAiN
	duiCSGbz5wbFlr0dP7YJgA4by05OKni9UeOjjcN93tIlF4oEpdUlhGdEbbrehYqxGwEGblKuvcr
	1UckKqIV5zcNcA79RLMAXpXbWobS8UYZ4BkH9gB23yZG4rOecU7eTThZnGWEYZZZtI1ekjkDD9N
	upwoGrcPBTyWKLmsoXaOCIijzWzsSxkOMjqGeLQKH6MwtHDV//gXpmuSb2e5H1KWbNWqSGPgtlj
	xuXnR3fBRnC3rrtNFEgo1pYijFIhEFDQqPT2XqVGsZJJuG6xjqxxp8sn9ZhegUOAeIGeLaPxqSv
	sn7g1Mxv/1BHQRnBCAUfg7TF5qtwgNb1xV8kAES+Cl0eo9+rVBQw5sO/dVkpNiVzaXvrR1IhvQZ
	543LF1WUR130ecyG0s6u5JqQG+cuCGYygK32MmnXgk0bOyXIUqGsardTKwiEKag3IA28qj2lDMZ
	RJ4cnOJ31F+ywz4hKA8H4TutS9i395atSVB1tOoig8trKsbOEcNrZPjAaE/DUERzHDyYS6O0Sl0
	dIHgQ5dbceUy1rfIYILNMFB323C79APumrWqYD1nB3c1d+iXqKY9wwlmQB5VQ+zsOeb9VjBau3B
	BX448dvzG5e6l
X-Received: by 2002:a05:6122:1b8c:b0:5ec:e128:2c19 with SMTP id 71dfb90a1353d-5ee1c4bbafdmr2537766e0c.23.1794495029824;
        Thu, 12 Nov 2026 06:50:29 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3243e30fsm67197e0c.9.2026.11.12.06.50.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:50:27 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso1102955241.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHFbyrANeooJqN6XiHlewreC01Onr1ERC02pF1WGUCa7abR4ej2xsTXqS7tV1EX4Xy41eebbmVApu0Bgcg=@vger.kernel.org
X-Received: by 2002:a05:6102:2925:b0:7d0:5688:f511 with SMTP id
 ada2fe7eead31-7d4fb2b4baemr1940643137.16.1794495026588; Thu, 12 Nov 2026
 06:50:26 -0800 (PST)
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
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-4-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-4-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:50:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWw2O1k44Rn03VOFJ_0RJAFZro-bzmzP2gSD+Hc8UbPaA@mail.gmail.com>
X-Gm-Features: AclHuK8sy96nMijWIpulMeqo_3YMpISU_WECBzNl3ZKvutsCseDDYG3iuq5rfEs
Message-ID: <CAMuHMdWw2O1k44Rn03VOFJ_0RJAFZro-bzmzP2gSD+Hc8UbPaA@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] arm64: renesas: r8a78000: Add VSP[BI] nodes
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
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Add DT nodes for the VSPB and VSPI IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1646,6 +1646,105 @@ fcpvb4: fcp@c503c000 {
>                         resets = <&mdlc_vio 0x106>;
>                 };
>
> +               vspi0: vsp@c5080000 {

> +               vspb0: vsp@c50c0000 {

Do you want to sort the VSPs within the VSP group by unit address, or by
label? This matters especially when also considering the next patch...

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
