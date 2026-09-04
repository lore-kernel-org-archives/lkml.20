Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02EF4EC657
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534735; cv=none; b=VjX8g/ox2av5p9TtbQsZ2nQEIUIl/RvhsTRVohUAlAcRXBx5yDBye9u+GL05W/mHVi05oYdHXDzD/S7oQIn/XBdPT40j6y5vuh/Ded4Wh2SYVJFMJzLzNHWKNYsJ6kdxhHPbU+lNjD9hzbZAK0njR4ytBKCatC6+YzVrlcH+JRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534735; c=relaxed/simple;
	bh=d1r8YLCgRIdy4KEcRiU5xhMZDzm5Ir3G6LE/EtLImp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Li7Qq4/ACX82M6S1/mHPzsUayDoHQ2LW4lufkdgrWiquvadeeMV+d9U5HbHwHW5rr/nUJ68yyk5UdWRLeiE5HkECMVNbSIpdhiD+cchuYJd+OTTZMf1q6Rg58mvbv9M92FM1kzX5RGND12i2phX72Gr1qaaCs0GIuBiIQ1ZXfvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66fb8a78ad2so1001171d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534732; x=1789139532;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DBpBma5dCQR0Szv2MO2Socgh1RkSDenfZa0jgmlXBh4=;
        b=kWNSfr2vS5XmXHVI3ZjgWsYhAryXln1TP66QdmX3lrn0B6ri4mMLISsvQAKHiiYbER
         TV9qvq6VIlFEaIsddACJQsSfvD1UEXobU5ngph3tKT6tsnPyJJ1tybwLFaTh5jvGrlNf
         ocJfOrqg/xV7IXdTejTEVIqwggS7McPZlyhIek4udzW0fIfoEv7BZoNrdqFT5XYELbfG
         2UFI0NyUUez0O63klY8o9wFXdfVKZP6NANaIQMGnazPmvNxu7lo0PWM7XqPk8RF6S6bH
         HWllTMlVMU0HIIdqD3QLGfYfADedxtUrHs4+dSF6siTBM2TQwxQOE41ZvzaNH0vUYYxM
         DFEw==
X-Forwarded-Encrypted: i=1; AKwUvByF+rOOx/U7UoENV5XPyWus6OaSXiI1derSmAnYCxHNn5//POFWp2LAAC9+m/CX5kx+OHJUfgly7ch8Lr0=@vger.kernel.org
X-Gm-Message-State: AFuF++l8X5Nzul72KD20mNY5LIA8pjpd2/ourLKUbf81rW3Rn48tXyHA
	UqjPaUs1LY8xDZTS65PJg4+hXxwipcsKDYBqw46+ulPda8YhwEIokPwnJVUwUZMg
X-Gm-Gg: AYBFou0FyWCctWgYJFyDKNBNWzoIWKaGSJ2xrZ73yATogL6xcFKBdfgZF53QdDjKuG/
	yQJrYjoIaF7dWxfz9eqDfGyRKuQtuNwGCE9y6Rf6yp/E0Y2th/vTdXbbNiSojZ9tliQkwC6uHee
	AtSVIokiiNteZlv+RMrocR6fPfdoNMbgfXE3YHLYPh2ztgispWq37gsAHB5wuGU6XcSdlvt5Ywa
	z+IsezW2cIG8EXE8ozRgw6ImpmmhH2MLFcMdDa/cr1jQphFYLskZP6cbDSiqF5X0c4nL5cQJczY
	uuyfdKOrt5x51ArHQDCUDVGwFkCfxT+Mjf17BdUMd1a2eU1EdGyx/zZeBsxR14zGFE+hjJ/5Kml
	bgz6Lg0nYtrIPIr1R3WrMAIb6MqvbsZxtdZZsJr0cim1+bH1rfQ/cnDejeKlTLYMSn2AV+C779o
	yC988KxEE0drqiImjYkQLyZJTJLMKWAGMOKdoL8tr9wSu/GMFITRfK+YgSx0l/hUzx0kw7a8Cki
	hF7Y8xYkxgXtYgzYS9VS8XV85nba70wK0N3
X-Received: by 2002:a05:690e:484c:b0:66e:44e4:436f with SMTP id 956f58d0204a3-66fb592e358mr1870451d50.14.1788534732351;
        Fri, 04 Sep 2026 08:12:12 -0700 (PDT)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com. [74.125.224.52])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb494b79bsm2382667d50.16.2026.09.04.08.12.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:12:12 -0700 (PDT)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66ce4a63e17so1242028d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:12:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRg5Finx+9OlWq7SU5QBzpCzvp5fXvAJN/XZ0jSYJgrzMSy6y69Jizol27QOVXRQq3RRjBgw7P78KuTF4=@vger.kernel.org
X-Received: by 2002:a05:6102:f06:b0:785:eb33:8794 with SMTP id
 ada2fe7eead31-78a4a91756dmr2264959137.10.1788534332492; Fri, 04 Sep 2026
 08:05:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-6-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-6-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:05:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVch5xkg3p0+9mvEk9393ZuV2TO-kcyVci+VBAMCG4RPg@mail.gmail.com>
X-Gm-Features: AcwNN1XC5gp_Xk8OzyKjoKwIynG-nLTbzWvj7aLGFiNz0LjJGn_EivdUH3_smAk
Message-ID: <CAMuHMdVch5xkg3p0+9mvEk9393ZuV2TO-kcyVci+VBAMCG4RPg@mail.gmail.com>
Subject: Re: [PATCH 05/10] soc: renesas: rcar-rst: Add support for RZ/G2M v3.0
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

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC to the R-Car
> RST driver.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
