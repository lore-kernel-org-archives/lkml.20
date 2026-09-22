Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDB9542EF6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091074; cv=none; b=cCOD8R1IJpnhabIqJY/4C69QojKHG05yUFkV8icjWGzxyNkBXtd/akqlfpg6vaEIPr+bXnl6Keh79nRdFV28F/hSnNozxiMcNTyJPcid1nCBTVx6iLJc8YkzpPcCEqKAvlN934qD1tks29LT4BTrx6TIRrPZ81cpjGAp+PdDCog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091074; c=relaxed/simple;
	bh=0IK9+EwvsBoYDJYGUac8cxaRSG01Rz8fKvCBOkF5H0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RH6pjBsol3psKFqzi9CXC9Jg6cm4VwRyTLV5ud+Mstv1hxmzCHCktzO30lTdNpn2WByS0Ccy52vQ6iUBn/gEKP2/ya4Zs79WpA437BpQ6ZHOZFHVAi7waSYiHtBwDHa4mVOLT1f8TYd9/2KfFmgOQxaLSQtjxKQ4p4UcGicGnj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfa7b2093so5270285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091072; x=1790695872;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Ivia3s8tcpv+jz42ruOpNgJ1iPkEln4U/VwumY2Fss=;
        b=bjwSZL93ROs4QmNTCQG/rp6PXhU+tQw6AqIlUdj8psFrllC4uNVx0IQpYx3fF13zft
         zt5gNKCf9d2gQHXUpmwXu9/oQnB3zopkUEzq8f5Ii3An8Dy3SmlrVJOk96OCYtkX85Fa
         RpvuQH8R/8QwXJ4fAdqLWvLr8crTnk3jwH1pTwhQOv8EcrqzAbdK3AMceVXUes6MsEIg
         RW2VIp6SnpVT6njJYX004FxNMf5wl2yyJ6E0UOyD+jVZ+XiZBCwsvAluNRpETRlJIqvu
         xve3DQLqN4XPhaqRnp9/H5q2jwhtCwHZQ3gnPBLcnFawoTvQ+nAenRhe96dxiCIt5Tmd
         BQcw==
X-Forwarded-Encrypted: i=1; AKwUvBx9sge1sjIkQ27BlhAOyCUy6zI947EBY7CH9BJkcaVLbmKvi5eMtM9+PkSZ4Q2cTW+YR+QKuzWyH28yPEU=@vger.kernel.org
X-Gm-Message-State: AFuF++mi6pKmJSYrvTqrGiWftvk17X1LTw+5sF1KlQop0iRvEnAXd7Zx
	gftXUTq3XkCFZDJUBZZ+Q9zdKYart5DjcXDdGyczANhVtslLcdFwV9YFqEN0bWW7
X-Gm-Gg: AYBFou0HCjLE6nOwwhrA+AD+92t6JA0nBNd0JYyg1Sm8qaZo3v3DfJPHuiC1hR36Yu6
	KY0rLHtHhmmrw3EKH7QAbB33z9NdbaQMcdLfdrAjxWel8V1suPPfbgrbtaRJtPrhjZ1P6HBm9fB
	PpKlfCgwWXkoWU1dM0qRMBTgApDgJFHP2a/AOXDYE3gKKOqRWHjo3WWFqE5k8+rC37zkGOLBBIl
	cfgqk1li7U473kFQM09oI2P29MvZ79j6jN3KTDReowTMuRDXP5blX7OAcbkA53kZQSnWZ0qbAXD
	cr50SPJvVxW2EXS/jPw3ironUJC4aUozWZHvkaiT1MGW7m9Frd63kWOiRLzn4S5mPRtLNlQZEU9
	SH28Se8xcO5/92/mnoXn4POls5GcLRkIRMjXKN9mxQllR+bRY8CkoEB1QXMTfKSABk8gGKUdbc9
	ffoiaDHtZ47TZs1zy3luTp5oeGkja3xYY0j8bB+VyNak28dIfp4IVy/Hp31WdLlFuFmCGdRXqbI
	UVOvqLg2WV/xLfVdFg9zW2H2P8emz5oTuGR
X-Received: by 2002:a05:6102:809e:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7a55cd7f911mr7793496137.36.1790091061506;
        Tue, 22 Sep 2026 08:31:01 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf6087f6dsm123042137.9.2026.09.22.08.31.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:31:00 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5292faso1936533e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:31:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAag0ug65CnGc1+KoAff5xKRnO67zbVVmSaXLJ3se3QJguluHPz4hycBHGwM3PhAkHrx/UA0njM5nwZWs=@vger.kernel.org
X-Received: by 2002:a05:6122:e230:b0:5bd:b2e1:e1f5 with SMTP id
 71dfb90a1353d-5c9b58fd54cmr8860951e0c.2.1790091060069; Tue, 22 Sep 2026
 08:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260921110144.44425-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260921110144.44425-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 17:30:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUX9s1q6SdrgiMciGfHYAvCp1kFzGYL4pHf7PzzipEPUw@mail.gmail.com>
X-Gm-Features: AclHuK_p5w8PzHnOOSGm4t2QYnyy-nd81aSQvB28I4MJvz8KTxnmCW8kHjNnqd8
Message-ID: <CAMuHMdUX9s1q6SdrgiMciGfHYAvCp1kFzGYL4pHf7PzzipEPUw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: renesas,r9a09g077-adc: Drop
 unwired interrupts
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

Hi Prabhakar,

Thanks for your patch!

On Mon, 21 Sept 2026 at 13:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the compare match and compare mismatch interrupts from the binding,
> as these interrupts are not wired to the GIC on RZ/T2H and RZ/N2H SoCs
> according to the hardware manual Rev. 1.30.

These are indeed only wired to the DMAC and Event Link Controller.

>
> While this change introduces an ABI break, the expected impact on existing
> users is minimal, if any, since the interrupts are not wired to the GIC
> and are not used by the driver.
>
> Fixes: 4d8d58987cb5 ("dt-bindings: iio: adc: document RZ/T2H and RZ/N2H ADC")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
