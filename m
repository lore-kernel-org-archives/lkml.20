Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D244A5C50
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440485; cv=none; b=nt3DSctYAnJ6+eMuQKyU2N75OsWC9dslG0Z/dC1PLBiEnMz6zkt2/nej6nits0lU6yzyZBWMQtaOgTxOcKmA0bzDAHqlbI62r66WH/LvJHwyFPJy/xUkWqB/mXbiDQJOg8MOZ0kjmpDIwHLh69GSO+Jkejdb6DL9zknGMHGWRzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440485; c=relaxed/simple;
	bh=QdSZDC6nbucSRvb+H51c3hpweaq1ScB4H0zhCJ0m32U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgjCfD4m6YeyMM5O/51yIcmxh4XdEYas7bdsLtg4ksjV5d5fwlH2sUg994tuHJzwGY3bBI/xWtGTWoCE5Fq9wxG2lgMORXIuj7QB3sHqFot2NTK8Y+DMaU6OJnl+4N/KcqZ3T3KVqwjCpSdsvnAygvYHGFxGMHMksHSx5vJogFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a68ca482e2so2379944a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440478; x=1789045278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DtmhsVTou9YrVYaMYKkGwW6MPqYIC4z5a7l3vHTtMQg=;
        b=ooUrftOkHhn4NYhGa/vG35cdGdz6iLRyUNJNPISTvcBxou7HdAJO/5AlP66wFZ+3s7
         QjMBGf7bp4snLYw7LrNN/96XmfoQv+ZuHBEV2td0b8gy9Iu6gNzPktXAmyyrbeTZPrl/
         NKWpuVOP7j+pNkblmIz1f3MgQbEAk6tzQHFE3ZnNFU6Y6XZz51bG9J65cHMiv338PLEa
         zaecNjm7oJBWFcvgCEFtIUT/cyKlxjXvb+582tmJDQJUag10jkBKC0qGneXpkn/vaDsl
         PR1eO6ga4BvX1nYgQbl0wzCOJjOBZRZxKLQI6MnEzXb0HBvzXiOja6YBmn3nXIoxpp8N
         Rtlw==
X-Forwarded-Encrypted: i=1; AKwUvBz+UYJqLHdZ4KvTZrDPR56C9of9HbbojVyuSYhMA5+O9JABuGNX+v/xi56ZCImb4gY7vbWcQxZjxdwl/Xk=@vger.kernel.org
X-Gm-Message-State: AFuF++nw/udGpCcRmovNxqRshSxykCRKQGfJVkiT+ngrjrCAom4Kj5va
	G+Vvn8ECN7CZCLkyuC0cW5HdDd1BbFEkm9ipUV9zZJl0bPbqqI51jiU1NLmoTnpATkA=
X-Gm-Gg: AYBFou0o4YRuywkv+6toOzqCCinCKGDdrViKlKdGo3QCBYqoTGDL+HUkqKUnosXBQUx
	Rwqy5DBhWwpXcjx1hbEVZYod5Tq51vtrCXVXIsGaHQkZDTWGXkPsaQnZZ7WVHckT9AzacIz2Jr5
	AlCIax8A5t1K1VXt3Nd4DsG5e+jRgaIr/T3UC4FbTrOfe4GQjw6kXVivPUwv+mHmbDMTWp0Zbp6
	4GIHs6JsgQ4xeFQZLzFWmz2RHinW44xMYmD9PX0g2IzCXBLIvORBUdzlF3L9LMQrbVIHkngKoWy
	39e3NAHROq3QIRn/gSlFnhiuNmqrWLOGwdHjVZ5qv2fWyyWmv0Ka3AnIti9eTaM7kIJ3bDqniqW
	AZ7gW8GkM86Do64hhGr8QNzPrD32xdtZvAbuluvTLe66phmAWNCzT9jQvPlRkBoD8VYPN/LZm0A
	Dg/ediSmlI27FVxg9A+g8jGmuCjNfsHKlEwCogfG8lHyL8T03+h19GHUuOdoE73OtAoqVHQDkoV
	pt+528AT3vEdu++crrnJkWeNg==
X-Received: by 2002:a05:6402:3819:b0:6a1:f7f4:200b with SMTP id 4fb4d7f45d1cf-6a6829b0019mr8155157a12.12.1788440477848;
        Thu, 03 Sep 2026 06:01:17 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41e71a9sm99016366b.43.2026.09.03.06.01.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:01:16 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a68ca482e2so2379881a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:01:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy0bSJs+3AKnW60xl6T0QJe9ba82Nt/+Hu+LF8nQ/0XW9BPX9nvXZb9MIacaLkegkuVNUxxTxFclelgcJY=@vger.kernel.org
X-Received: by 2002:a05:6402:388d:b0:6a6:32f5:90b4 with SMTP id
 4fb4d7f45d1cf-6a682af9bf4mr8204915a12.22.1788440476485; Thu, 03 Sep 2026
 06:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com> <20260825095047.9971-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260825095047.9971-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 15:01:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUpG0028kP=Cg9vr+tv2pMbUx78JLD5ddof=qZK6NA_g@mail.gmail.com>
X-Gm-Features: AcwNN1XdH538M7S69IlyE-ADj4jym5MH5kGATrABVVcF65dsXW8RQtGhu-Ybn34
Message-ID: <CAMuHMdUUpG0028kP=Cg9vr+tv2pMbUx78JLD5ddof=qZK6NA_g@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a08g046: Add PCIe support
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 11:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Populate the previously placeholder PCIe node for the RZ/G3L
> (R9A08G046) SoC with interrupts, clocks, resets, interrupt-map, and
> the PCIe root port's vendor/device ID, and enable it on the RZ/G3L
> SMARC board with the required pin control, CLKREQ# GPIO hog, and
> 100 MHz reference clock.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
