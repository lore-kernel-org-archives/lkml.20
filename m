Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ACC4EE84A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535421; cv=none; b=NkjVgCfn4/wZ99aUqvDSfATyug4pLSRPJEjrXrgr/oEjUFUkV8h4ZQ1O++7UTwewX9xbv03ioZBB1lHHKTKaj8I/hpaF7K2rxX1Dgnx4f1IIsyvagZRZA2YPa3pMItIEYbUX9aSpBYdNmp1Rsx/i9Mo/R0g6PCh70DkJE16cEhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535421; c=relaxed/simple;
	bh=nCrntIDhyuwP8BQpdMv2tSN81fhquB9QOVe0SeizZYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScGYfme7ffndhs3+5ZiOyJnrATv4vXuBXXXQMl4tGh2PkGXFw/x6YWaO1s5pJ0tpMxoYO3JKQxvPohd6Pxc8aG2vqd+YUiw9qL10ywzHEvUEW9GEfVQSHnM5N0YU/h2rZhCL8Y/9ubeSKz4vV38AFbNFml2DntK7DW9kMDX5nSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so364206241.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535419; x=1789140219;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mr7nrVkZKYZ/vaRmGYmX7E824Q9vDG1RqRG5Sn6gSeM=;
        b=KYLAucQy1oHqpIieqr88ZXrOCIGpbCp6IdTDzFcAYxMwcMRyBz49t+O+a7QSDDzJZD
         vpFwKjXF2O068UUeDrupc2g4e1tCpVp8Ny/ZQ66bCl+3F54gnHPE76afpXveFordgB3y
         1mNPiIK7DcZehGz18vrirC5VEiEaqA8wOmp54mKjIHhKq/F5ErUDZ/3oZOe9MoZk/HTC
         c5cmgeb4IR1+4bNzCiTARi8Z3DGi+Czy4mEKK7L10CxWMOnjUeJXcXqCtrUIOjHZJ+Y3
         UqmD27Bl9RAiJ3XwoWTeBril05Kj6akm1msw4o8UDrs4KLicfqhEDDqHS+J1FhfvRbey
         VFzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRTS0gD0w78HnE+yWp5KnLdUiZCtZXLuGELlK4o3fl8h7taYNHbCKkudWBU7YcQYSn95owmYVOphaDlwg=@vger.kernel.org
X-Gm-Message-State: AFuF++kL+q/nJpI3UZBgm/vXYU9TF4bon40mR3b0YKuiIqp9UUu+XPwk
	vu1v02lkeL9yZdBnQvzKoHKEcfNjEDYCYRAaKYsb0vUuvSREjP1Cpqy8BVS0JDBY
X-Gm-Gg: AYBFou3x12dmOqbKDKsst8K5c5GL8d0pp1EuGtO+aWNUxgTCJWrobt4S/W8ZREi8cG3
	9fu5HIxmWpf3Fq5nX9m04EdLuysWJxju70jd17BRbcnIv1miZbfVT6XjFrNm8Iakru7SR4bJ6vg
	WkQlWwB21EOUFEbopNy7zVDWZQ5J8wQTpBPs3aZGW4Uri2yT4dO/XmVn3YvtLmpUIaFzBoaLbvB
	06iOyT7lZEzSANcx7e+eZkCjrM+9hFWBSYqQV5jWtIXB1QC81Q0GJAZtXHz+bKOOln75E98M88P
	lr/7TFBkeWFeuYGzJpEMiNjkHEPZY0cXjb6zbJH/TF/NFOSA3Fc63hX8kcjs6Aq3gmKe15JqhWV
	m+NFozCksdGR2hs970127pua0RpgSVfHZv9wTykjIPpxUj7PTrTT9x72fYAMcLGEOxRVDPlPc+M
	Rp8HkYD+GYx46N272MtMLHOXT06Rb8MiRDlyFuP5TWbprPxisuFXUSc5Xu7E51SpJh6kgP8nf5E
	JG5Cfco7xaRzYKNl4T1A1TpIgm2xQ==
X-Received: by 2002:a05:6102:1606:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-78a4a9621d7mr1998745137.11.1788535418778;
        Fri, 04 Sep 2026 08:23:38 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b3468csm2050082137.11.2026.09.04.08.23.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:23:36 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso512384e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:23:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxrIUlRaCsPLFHBFI2dAqqc08Qloq38EG4kEl/yzQHFn9+FdaPfvsLmzUllBmpVk9w7r8DGKr+drtXaXu4=@vger.kernel.org
X-Received: by 2002:a05:6122:32d6:b0:5c7:a3a3:a4bd with SMTP id
 71dfb90a1353d-5c7ed3a528fmr2695851e0c.4.1788535415032; Fri, 04 Sep 2026
 08:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:23:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyPbUEy1sPZWmosVtL9GQviEB+d8RW8Xus9wpxZREgRA@mail.gmail.com>
X-Gm-Features: AcwNN1VarzxavclKk9EMuPnWIySi6CxTEUYbBFaUC14MO-nuKk5tEQAZbU7dyfM
Message-ID: <CAMuHMdWyPbUEy1sPZWmosVtL9GQviEB+d8RW8Xus9wpxZREgRA@mail.gmail.com>
Subject: Re: [PATCH 08/10] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

With the cosmetics pointed out by Krzysztof fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
