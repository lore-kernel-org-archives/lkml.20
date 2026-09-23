Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D912372ED3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156467; cv=none; b=ewwrJZOK64X/FRO0E0Dso9V+pf9wgylUO/nstjJkz9+3OVM0iDYHSv12VmoJ+q7Pl43cHplEmrVMt0/uQT/iqGBeTgPfIpHcxqoFIAtXCCxEJLJHqONbNebaRxA+tPxiLLCVtBHfl44qk2NLN8d3arfrZUgIR/cgt/DwRgYVEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156467; c=relaxed/simple;
	bh=wHIiCEgdZtfqmIfAflpfV641BfeO9lzUS6fjDGeRjIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UUIRk5jVThxzxmZc+TiN1BuR4Vb1y3lM9LCdppHm3cLDMyBq8Ppvrp+pmDU94+Hnct9/Ef2R8KDY252IhkDS05ZixmcBrk/PG+0tU5PGDgpiNWf5qvayYO1F3Xje3Xtfvi25lcYZ5AvTSTGcP2tKBUY30ZUyrBZ90Y4hzRO9CEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c7e8a17839so176774e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156464; x=1790761264;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nr90W5Fnz0vjayQ2rPJMI4dvvs1Oph2WPp0m5lztwRY=;
        b=S0NB5jsVHugT6Dvq0m9KriWBbCiQBNAWOzLUVBaHHkUgXyjtyp0j9QeMMrqjh/uIzF
         cHyicNVJ7oeHURjOTVPl658zB2k/qwo+3326PHOrC77KXPXdm7+02Ycnf3FSWsIZlvwC
         wz2Yc9bf5gugYy7OyBxhiNRI2vmlHADWt322vvAeQ+qVxCb2ZQqukR9g3885DjeNA4wW
         tcDvYuE1IVW8KUCK14GESprj12m+hobkVi93x6PNteya4TTPGP2571iL4jZjUL7RMqzf
         4KWrPhZjeEFrtPR5B1RwzznqqfAPR+rmECkKFhBPZK28YznJQyrQmZPkjzPIwfdz3Ikr
         Q1wQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFkZI7WNYl7tK6bNnQtqY0Myc4lQLz4oi8VOhL5JRzIAMNddWA3lElaV5QVaEWmsL+/1lb/LH2Sc4ymLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++myry7SJBtI8tPNI9yfwwkyIWdT0++K4kDzDJwC3CLtMZi0QhSc
	I2mBaxDBGC9EOsbtOiS7cOp8Gi+lyLBJhV7ruTNu4nzn6uNiM65WnmnwczNx8XyfKHw=
X-Gm-Gg: AYBFou0IGKhKKEi7m44eNSZAj7D72V1EsMa44OxO6iHfY344XGO1/bB6cRHE4SryJBw
	ueuMKVIimFOl8mLhG2MJDZN10IB1JGP0qLFsczH8LCrYo6GvLOIceKgRZVsd8SoWaQ292KQdYxE
	6qLRzWdr3Nb8X8y+5ey0XhOp5kMVWpRxgVBybHuyej5WqHmWgQin2/g+LhicbPCZl+nbZ1b745H
	jIclArvPizyY5KzdW255HIlgm2qpvVB7zKz8rfwTobJdB8aLEuCKZhGH5q9jjnMBK9knfKeXM1c
	bUQ1tOJP/+I2ucBcM/T1ntm4gDyVaX4zjBwdWoXr2dnWoHVC35QlSSgDrev7sYauWR18eg4r0IB
	JMtw4Ovo8NEBI83R+4GjKK74XBoOR1eh0DW7tb3oAQiH+p+8B6p8oYco0efmADuvObIyK4Z5Y/K
	ifVc+uBSciOU3p50j653NzJRGophaiUdWugOiIDkQOy8O3+QlAOjwHfrAujUvmqhXLxC/8Jf4nR
	PyMP3fg390fKS0LQBeFXmyAFeENGT9OCORdCDJN0Rz0cVgE
X-Received: by 2002:a05:6102:26c7:b0:7a2:28cc:fa83 with SMTP id ada2fe7eead31-7ac0b1b10c7mr1877306137.6.1790156464252;
        Wed, 23 Sep 2026 02:41:04 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf65b6a0esm2871805137.12.2026.09.23.02.41.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:41:03 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-78a338fe106so1702114137.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHAAHh9peWmLWrIINMBOvDB4+j3gMf6WLnTgzhImy7TeH8mJwLeOMhLiYAjB7PHlYFzom21h/ZPNlZUdw=@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:7a7:69a1:add2 with SMTP id
 ada2fe7eead31-7aaa0708f72mr5644581137.30.1790156462933; Wed, 23 Sep 2026
 02:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com> <15cfcb44c2d6b6e03b5c3d0d5af8ed997c4d179a.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <15cfcb44c2d6b6e03b5c3d0d5af8ed997c4d179a.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:40:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw3vsV+rs0wuYbDmLpA_EXWZAKtpoP1ZXTY6Xt_FPLsA@mail.gmail.com>
X-Gm-Features: AclHuK-4kOrbGKvyDLh28vAfMHGiFQCwXQMIlG3sAkDSk9boruM0x-6nSZuHeBU
Message-ID: <CAMuHMdUw3vsV+rs0wuYbDmLpA_EXWZAKtpoP1ZXTY6Xt_FPLsA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0
 placeholder nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:27, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The USB2.0 wiring on the RZ SMARC Carrier-II board is the same for the
> RZ/G3E and RZ/G3L SoMs, so the nodes belong in the shared
> renesas-smarc2.dtsi. Enabling them there breaks the RZ/G3L SMARC EVK
> build, as the r9a08g046 (RZ/G3L) SoC DTSI describes neither the USB2.0
> host (OHCI/EHCI) nor function (HSUSB) instances:
>
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:94.1-7 Label or path ehci0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:99.1-7 Label or path ehci1 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:104.1-8 Label or path hsusb0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:114.1-7 Label or path ohci0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:119.1-7 Label or path ohci1 not found
>
> Add minimal placeholder nodes carrying only the reg property.
> The remaining properties will be filled in once USB2.0 support for
> RZ/G3L is complete.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
