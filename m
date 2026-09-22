Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA5255C328
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091086; cv=none; b=Jv4PQpaNjCOSjUaQP0G66LieXPhTnMHMCyWe32hD/opaVwhMK01A5Y2wz7Ry4ydwiJzLd90rJ7svGbxpdSaN8OTJrph17486SyMvxB0z8iF3sgQX+4Np0hMLAwcHMkuca3Frlz3/HGBR2aLlojQ9Y79lhbxxd9/Ca1B2MSeK71U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091086; c=relaxed/simple;
	bh=tAyiwXOmkifke3Bc+NxLOBMDbHXY6l1OlgnArNcsfhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJiWzYc6vnpbR0vtbjF/ZejiAyqXF54O7Qn81E0PVwymHddTspK08r2DPJPjaiXyMgiwjB5k2Ngk0DoSePJLKo1PIxQGUkVy9v0pgY7SA4gLXEPR1kRPFSlfqk/KyztO2q7GyZocdoMnzn4aj6+BAC0H/Zrw+3smgea0++igy18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bc5bfso1189761241.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091084; x=1790695884;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EibhQgWiuapM4MkmPRwugdMJ27jgZzllZGbWfakUivA=;
        b=NTkrphCcGYSSkTklE49A+RfjDidlq8Y6h1+5TSU52S18LxCrc7iwVsETx+BnbFVJft
         k9Qr8qDcFyTcW6s6blcb1CW8bFe9l5C4LUyBoOQKH9lqz5EIEmzYt/zEawmE6mGjc4NO
         mQSXrutrC8uQDEhkpNlrrrzdr3huvWACq9pZgQ02w+GASgq9Ify0Gny4s+GTu5CwBQKV
         D6chWPo8Kwa452UHuwjFlR+2PppPwUH3aV3bYcSwaeTWhL6nZbmmoyqeNlQrcIyXhaYO
         v5GudXwupOBJTN5SeoneJ8QpFv245gP6Wh8X1JgydFEiyH49LpFZLnr4viSKIHbOx3SC
         nmQQ==
X-Forwarded-Encrypted: i=1; AKwUvByxHrGjbgE1LSnJKCweMMSvr8XYS2ze2Z4vrf+ZmGDJrb5b4vzJq3KHfsstFTMz7a2yz+BagGNplaCudlg=@vger.kernel.org
X-Gm-Message-State: AFuF++li5eTRL/j+UAaN+4ygSkqeH+qUHuMgr58x+nTiLt194lH+ur4Z
	XXwNc+nVnfqzQLg00YQ0f+fYNVekPe5xszXti3Pyjo5/AuFzB3CHo2wwi3LXzIg0
X-Gm-Gg: AYBFou0ByaRr8QyfErUXrV5fmqwqLCCWb8MlRZ4Yz01uFTfmahsyXCa/Hh6xLzSrcd8
	HIODZKGPITD2Fm5aJvv0x121GZe+zE6LkiElB5a/wdaKXDcDDa60rKML/HZtS3LWvS5BsWUJ2MJ
	cv5JcD8qhi9EdpV6X3ghiOFNpEpl2xeJyFsnGvpNRD/DX02T75nJuVG+EiAeg8hUnNpgtcF5TdZ
	aik5aFKWVJBIKnz1QwvlPaBuY76+Lxt3R3w3JQaIwh2vb409fGub8EPgymOgWHGNqO815DuSE4w
	ggPYpCZVPgOisaxUKCJ1FaF2RpFE3R315dyulCW7J0UGmNr4fYz9fMABUb+eE32GEmfoY5Oi6Qt
	soIVEqWwe1WLDU0jM+89HHloNYcJ70ygl2ucLv+1gXuEmaCt3EQ73uZ+WaHenyQyygcSvhUlcXC
	C9ikQOTS6V7j5rp7zEF5eAgRn7NoWgEOTw7/7ZXubsd43DEsQikVg1ab/ZOIYeKFZ2lIKr8eKY8
	JIKIPoOQGA0iR8rKePS/iTT9mxNVap3lmYe
X-Received: by 2002:a05:6122:2982:b0:5c9:a60b:e5d3 with SMTP id 71dfb90a1353d-5c9b5a027f0mr8194264e0c.13.1790091083634;
        Tue, 22 Sep 2026 08:31:23 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0582b6bsm93082e0c.18.2026.09.22.08.31.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:31:22 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963d7503fso1449360e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw9EY07uKm+cG+k4Nj4r0pfZZ5Fl1RI1BL9rJsDRb2S8GABKuxpE5M+xDVVmaZb0ELx32pEGaeqLqkuzqk=@vger.kernel.org
X-Received: by 2002:a05:6122:e183:b0:573:a779:62cf with SMTP id
 71dfb90a1353d-5c9b592206emr9513571e0c.7.1790091082417; Tue, 22 Sep 2026
 08:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260921110144.44425-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260921110144.44425-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 17:31:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW44-25RV5uR2=mn63xMy9e8Q-nB8fteaUveigvBt2Zog@mail.gmail.com>
X-Gm-Features: AclHuK8eE1mJ10XIW9ciQ8bZMT3j6oSiCVVbmbWm-UvOOnb6nS6TVY6Jb0Jgh4g
Message-ID: <CAMuHMdW44-25RV5uR2=mn63xMy9e8Q-nB8fteaUveigvBt2Zog@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g077: Drop unwired ADC interrupts
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 13:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the compare match and compare mismatch interrupts from the ADC
> device nodes, as these interrupts are not wired to the GIC according to
> the hardware manual Rev.1.30.
>
> Fixes: a82a42963c89 ("arm64: dts: renesas: r9a09g077: Add ADCs support")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
