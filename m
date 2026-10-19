Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EADD48F00C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397307; cv=none; b=Pgi4bZgugaWGTkMsisXvGLq0YTKIErIrDdCsjNaGtvNyaYlRa0TNF5zOBwsORxnvZZDtCHXVyDsvCejkju8WCeO71UwmOTOVkwjpnXUpRZjnPh5zubHdoNeCQ6yMVT6pCBWDVCtSKqenZi0z6gHCEKr4BrLGzwGGxIbay2vsqmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397307; c=relaxed/simple;
	bh=QfENBpcHhADpjfd53lUe0RxsDEJq18op5rWidDM1g4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiNSPJuwCtAjRUigMoTooHEdjitjSI4vwBp/gmmVsFbjew8B+x7Xfu6oz+DIWKKD0m+x2gv7zhy+NLZ0gYmxzTrGkGf9SqPPXJG2h4bFKiL7jEijaVzJd7+0tIniLbXbKiNMC7hqdngOQboWLq3X4Kc/bLyU5hCX9sZ/RbzQD6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso50281e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397304; x=1793002104;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=botmgDWh3QU3uykH2zSrPm6okwvbkqaZK5yti63bokk=;
        b=ppJutpc7V+QdhiVDBDsM1iU1KYsAm1ZpkM/EFccLWn8HgSVsVwrTSjbKHQWVgobFk5
         p/qV6lzLn2zl1hxKEwDFKYjh7qPWLhWh/Fe1XiBiXGB6kEYMHg7nyccRrczZfAUjEABG
         pfiENxIMsngkFaUtg18mklTPxqZJdq9D+iFmSViC9U3h/L0MDUiPVfP7GbvxDM7pz45+
         +XKXMaAtDSbaOGRdkHgt0Qx4CQrGR6Uwm7ijn96WHOgxKZOeOSoB9Jk61rrIJMpYUiOk
         mqBUpi6eJ+5GwwohMH4bZZZWZMwogLlBW1HpSkLeqJ2nIUcEjFccK+9SkuDW7ubXuVXJ
         crug==
X-Forwarded-Encrypted: i=1; AKwUvBzIbu9UX+MLUBBNSS88gRQum/DDIgc7ruSjpoj1hCAOZp1RjhoeHSsCQ8e67b15rpGwIZ+VqnHq4F31Q6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJMJZhVX1ri/aROorThjcBmyUs73QlvkHOZmCsCL/B43eS5fYK
	VoNgNmT93efxlfY2iYoeyZMDNxIDkhe2KMcGJKsbPOPsm0/4QAsyolJh1rP33jEa
X-Gm-Gg: AYBFou1V+84jRXLUglAF2d48os31CCbT6SAU3UHH7AvXODDFvAQTc9V9Wa8nLdgYhLR
	vVVSmfHEzGQeCrDK6NOvEDNbUKuChbhxW/GIU/RRDAom5cPeANq6ZTzE867pHAk+IZRKvolPBlr
	a2kpIQP0bSXvfjeRX+vMAMREWHfoHPm11HH0UvI03ZDc7hh9pDPv5uIGMTkVVh4LwEMSD4bG3fi
	ZRjOaCL/M2dVgjDbdZz+Weueuz3QTOIbzEb+Pon1+yuSVwVorGC+LFvKSbHQHmFqXVfSU45PF37
	CWqLvaCays0f6myKoHDWkh3jFtNNnM2DQVGiFglS+qX3wz9joORtKJaXzZafdiyUOWah3CzbCqy
	cRuo7xjejmMKgzmCp4sVC5knM4xgXGSNhAh/o/mqyGCtrIyT5thJ+rDwIMpKkQcq9oFtgl4eNrt
	8CLgPP/gqWGAiPDwSMTn4KbjN5kodV/2VuCQ99hPY954cpy4+5ymMk8tNN6bGC/RinpKuS2/KPu
	gjYyhg71djpFLYokGExpvVwTj7fdS3CsaU5vbiNZdmAODRHM78=
X-Received: by 2002:ac5:c003:0:10b0:5c7:a9ee:dcfb with SMTP id 71dfb90a1353d-5eaaa391a3cmr1577288e0c.5.1792397303843;
        Mon, 19 Oct 2026 01:08:23 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eacd020162sm1613301e0c.10.2026.10.19.01.08.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:08:22 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eac3b6b2ceso243166e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBytSNBte2+NMJKfNzrAIvq0pFNJJXMid1Xj/jUZJujRVIKDmbS1zNKOf9fGslz0rAt4Hr1DSzLmVMCIW4s=@vger.kernel.org
X-Received: by 2002:a67:e703:0:b0:7a1:f980:e934 with SMTP id
 ada2fe7eead31-7cc369c0d0bmr1772093137.16.1792397302431; Mon, 19 Oct 2026
 01:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019022717.511096-1-artem122novak@gmail.com>
In-Reply-To: <20261019022717.511096-1-artem122novak@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 10:08:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKpkTFBEj9HkSPOMfefNYcqGyh33H43oVhHVHevn4bag@mail.gmail.com>
X-Gm-Features: AclHuK_PpER2TShAXTflyONo_n8Icmw2EzWmH61DvSpoBwL56FzjhvRFzzvqUgE
Message-ID: <CAMuHMdUKpkTFBEj9HkSPOMfefNYcqGyh33H43oVhHVHevn4bag@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: timer: renesas,tmu: add SH7305 compatible
To: cacioandpepe <artem122novak@gmail.com>
Cc: daniel.lezcano@kernel.org, robh@kernel.org, geert+renesas@glider.be, 
	tglx@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Mon, 19 Oct 2026 at 04:27, cacioandpepe <artem122novak@gmail.com> wrote:
> From: Artem Novak <artem122novak@gmail.com>
>
> The Renesas SH7305 includes a three-channel Timer Unit (TMU).
> Add its compatible string to the Renesas TMU Device Tree binding.
>
> This is an RFC because SH7305 TMU0 Device Tree support is still
> under review.
> Feedback on the proposed binding would be appreciated.
>
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -21,6 +21,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,sh7305-tmu  # SH7305

renesas,tmu-sh7305 (+ sorted alpabetically)

>            - renesas,tmu-r8a73a4  # R-Mobile APE6
>            - renesas,tmu-r8a7740  # R-Mobile A1
>            - renesas,tmu-r8a7742  # RZ/G1H

Probably SH7305 does not support module reset, so "resets"
should be excluded, cfr. the proposed bindings for SH7750:
https://lore.kernel.org/3b3f41148158aa146f06a40aeb5b23c8611b1895.1716965617.git.ysato@users.sourceforge.jp/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
