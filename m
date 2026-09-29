Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AA54E3EF6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672500; cv=none; b=UwcfvNAL6xOAIOBZDxmYxYbpzv2Web4IATctG2mu/KgtUSkLjMnJ0nRjpyi/fvNK97BP52QPCqZo5htBYtmlneBup0g0TA8Y8u6hZULZEa9bd6IVCuVa2ObPsplFrURK7mpuQm1ej8eF+BZX4Wjj8VivZy7q87vgF2dBaxUe664=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672500; c=relaxed/simple;
	bh=yGRUq+NkeA2wCzaT3ddrS1lhHL4f/8v2x/N+ptJUPEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVKxict4EKxfKxIGmgnDcgTY+jPUAxuCggPRaiZXOHr1Kul12A69wK6hfFUNWnNEN8TpX4r7h+NNfELutu7wBEWsmRl+ryFOCToQs7npyQ+x1+86+5ObTcUt09cWvjLniBTeyGBnFw1tEg4fx/5G+YFeccQ/hnSuQkk0xITISrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f37.google.com with SMTP id 71dfb90a1353d-5cfd29f1208so718885e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672497; x=1791277297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M48abSoMOPLnpPLpLH2wH9c2xeQ/JgdDngp0dUmsb3o=;
        b=zA1bGAEaRS/vVjMiT9u+b9IYBoP6vPyw+lP1E8Zo495WU3YaBElMntpO+1NpojGVv0
         yfEpuOO2EKaIqU0OzlAQqaj6arP4kQtSNKuUAp/YPQxe1Pg4atlbOziuwDAi81oTE9Ko
         xDC7eSRQFmHDCfpWHYUQCD4FGvy3KrSAWEs8zXgE970ZRR0Bw289ik/A56L/hOUlGuTY
         0pD39frTRJOUXAO4KCJPV/8WDALtzESOXnLHIW7cs65OzMu2QPxUXAs6AyUn1vO0Z7a0
         mKgyJCHgja79kXUdUi7PJHHvMDHkeKKUboBXAb8R2YPOovPrzyb0S2kGPfip3XPydfbN
         RRVg==
X-Forwarded-Encrypted: i=1; AKwUvBwyrAuEQNeC5D0yVxnJszVEyJzjLUH1dfgNTnxg+5JTlGaEXElNkrfYVV4KXhgFFSGzlL2LEhGsymuTlFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYNhF5qzIMsWEwwLjlHQm3YxuC3zrnPO50mXWBKegWAjf6YAjt
	6dfD81n4XCnD0Ox0lQunt9naF8TCeZFDfKMYdV686UwbawaMQ7GFZmyNGrJ+Fxvq5/U=
X-Gm-Gg: AYBFou2G6kFylExIwIfUqstcbMhAz2QjSe5O4Iis43wjCbo+teFjaIguaeUoT+IQBb1
	ytsxkOUCSlwHvf94xBIG8GhtE6p1Q2gzrBe7GRTorFqBC5/YjPLenfJi0yAS9OSTgSVroNQjjUZ
	Qv9NbBE2jOrhBKRXX0IgbcmRdJw6vEm/nQMZ9EkytCBZUcxg4m7DRH+Rhf1uImmw0jI+o8Zam4h
	na2XpU8X5ekT+ZBSP8HKvv6jS1alYIr1OyIfT//6EVBJJENM9tXBoZ9hhRDgaBV8ojrOA3qJm2T
	0AAi9pnneLCXoVcwumpPlpp6wWIUbwUdL4zvrk5I/S/Y0Dm1bY3kosq9i3JYQQa7DKk6s1/Xs3w
	mIh9TY+QeZHaGfnHkYGjx6rOqbOgda6Py7QcCi6lK9wiDK1+wcsI4LiRFo9B+mzJ816iDUxzvUq
	6vslszDlqFYK6bzwSi069nLXffex0Mhk1z7gjzkNXkgetVP1eUVF4AbioSYq3Avoz/4E4TRVvnV
	E+txQTluSBZhAOvjQMsAfvUqA+jgYNPXecs7w==
X-Received: by 2002:a05:6122:e16c:b0:5ce:ab22:1749 with SMTP id 71dfb90a1353d-5ceab221b4emr2723799e0c.1.1790672497102;
        Tue, 29 Sep 2026 02:01:37 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d30b9ec2e3sm924728e0c.18.2026.09.29.02.01.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:01:36 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c796e3aso815512241.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:01:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByNnZEcpbMh3AQRi3RRCpHvYpFoOnWlU65yL+N7FAJJ/f/PFlXL2bDez/KdLKxiqtSPWHkDIjUo5Ql/q6s=@vger.kernel.org
X-Received: by 2002:a05:6102:2d04:b0:7a6:accf:72c1 with SMTP id
 ada2fe7eead31-7af19740319mr5405907137.0.1790672496458; Tue, 29 Sep 2026
 02:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com> <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
In-Reply-To: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 11:01:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMURt52wR7kM3=7GKv7x-3O77MLwSuUDt7KJEf9e+hqg@mail.gmail.com>
X-Gm-Features: AclHuK98mw98nJ3_l_Mt7cVTGbvizjI_Q30Ugi6pttPN_xWKMIDQnQGX1HfBaig
Message-ID: <CAMuHMdUMURt52wR7kM3=7GKv7x-3O77MLwSuUDt7KJEf9e+hqg@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 10:12, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> > Add support for a variety of SolidRun RZ/G2 based SoMs and both
> > HummingBoard IIoT and HummingBoard Ripple Evaluation boards.
>
> Thanks, will queue in renesas-devel for v7.4.

Except for:

  - dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-/output-disable
    Already queued in renesas-pinctrl for v7.4

  - dt-bindings: usb: cypress,hx3: make peer-hub property optional

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
