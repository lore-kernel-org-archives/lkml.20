Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC74FD7B7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677010; cv=pass; b=D7O4XCERi1hqPMAL7UeYVbtXDIyNTLTmoYtCIay34uztuOaPS7gBUzpx0v+nok8f3jts8+ko5wRZ5Z+7ja+NXBs96JK74YlzdjjqJRnYPYLv9ktLqw79aw8GTJCn3yxFeNEJ8R1bvs8NM3I4SEzfytzap9VKQgKX0yAyNqel0DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677010; c=relaxed/simple;
	bh=/pURnOfPd01iygyLUjpNk9X+T4L0SeXg5/g8Qb1SX8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4Y0e7fVjjb7hvoNwKg8ouoNb7l/G4elW9+5dRpEaZWIDkVmyn+tINRQhXIEEsyFi5iNhNiJtkwq8JVL8PlumNKhInX7tWl4tET8s7EEreRQg9H9Ju9oq4EFYjSMjso33oHwhwLess13LR6pg5NMIsqh6hjVW2ce2P7cn2vfrYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wpepKC9i; arc=pass smtp.client-ip=74.125.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wpepKC9i"
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so6290099a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676999; cv=none;
        d=google.com; s=arc-20260327;
        b=VOfYu1giv6OJlbPfdmUYOCnL/bYaS2CUtbYHULnaxdYFspO09FFeD0Ui7oza+NVfvd
         nvtdOGtMU2mg66m9Kcy/LS2CS2nZcHvE4D+FrwzFe+8RCPDEjr6LZyAnHljuj7FdqV+Y
         qbHYPXw4GtWpiIBhslaw20JoEOWb62o18qnDHSL9k9JPQdYqCzR4BzQyU5VDzaJzT79B
         xPfp+u7jGBudVw5L0zI0WVNK+a4zD5m/6NRchQyJQPX1suJASpk0O7pCIe3aZIxEwO6e
         PcXELO4rWDk2GmdOK+ZR2FHyoLs9+FfpgcDbdxHe3VBqBdG3Dpxw7zdf/b12XaTuh1/c
         YLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        fh=eavW1LYpoVPbiboIlaTHBrjUKyKr83ICp0af1KvR+E8=;
        b=NsBKKDcSe123fhINY4DyYo0wXj85ZOSXnL8cfc6BpGi2F2LDtHn1QHjjCzzqSwyS2e
         nbyqn9zUA7tA10YHZfRK9Fq6/ep5dfAJVxYOSeCoROXEStuZ0zkwuepsIOOo7AHm5XTO
         bmA5DWRNBXDt6mm7hiVvjwNH8itg7oYDBIChTp+Kk4EXo5C+X32W5TuVzhK3vSNBaLQI
         8YA1NZ2n/HappPgm0cSZcPDCNhSZTjLOPcWhftVV3CSYVvlGrXKhARthawulcRAqny3I
         PyCiKbhkwNG9PLsMJ2WZ/zITNZe9kHu0d2G+dzgaR8CHEmqxNciCkXNi8NsKbYM/sGtO
         f8fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790676999; x=1791281799; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        b=wpepKC9ikfKPC9p4CqWROnwComFJNLSxxEXrD7zPrVfvREDbmv3nlsz74LOc9vR6sx
         HgbesHRr1pF2xm3sZQbVhNX7NPp1QdwIJDe78id4bX212RhMbFkP+dX6Io/kLHSMct2M
         50wcgkFmIirIqSUQtWfLjK2/X8NGPjPcU59gc55ztm4vH2ty7WS9CKkIPnTUp8k6y7VT
         F5ozxPCBXrfwvIr+jMS1b2CSWto+90GHhuvzIpUCif8r+p4SE14qkDXtYHvAylxNLu0V
         vZjITdskf6Z7GLtW5V+9bFhDCmlpo4u7DQygL2u8XbUEGj3NACCd73nCKB1oLsYSC+UD
         hhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676999; x=1791281799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        b=tIjGKm0BrLB/NvyufNu0iQGUuwfNtZm7I/hmZaeg99KA7yXLfPofMr5H4j4R9kXnSH
         DBGQPHo8UI+bCL4awYo04H3iSCFZv5HClKmOpT9LQqeSoS/NSpQ9Rb/6GzaO9yatHvN1
         WK+iR/18pxFCvR80CxvyglqEx7u7UrK6o1LViuROe8hMX9gspLSVapoG08gshCAWRjOY
         j5ugdSe5+XjQh2hJXtxkS0l8QmTWfJy0QLw0J2ndQ7YTXBUJDSZ8l4zxFXXa/Ybxu/lx
         LdC08ko1h8yojQnU/AglycQFq+W64pcz8+HlgjmNddiq7RSXjNUU+aDrbPB8nEne25Md
         0lZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCbjKxmo7g+X4fnsu2QTHUa5h+JK8p0x8kNAer1W3DQm2B4kTSFLvis+Pn6CySdafbfQ3ZB7dEADKTbXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyctpGzlIxOEQ2Nod6NeAtYfsyZ5KJ2PxBj7y/14X2oLqRiBLs
	mqJAdtZirfJrj3uA0anaMhf6T4HYB2+S9zDM8+ii2hJfozgmcEtgKdc+INjcCwnrL5qW8eoCVq8
	vtP+bFcCPPMy07YKjL9QiqyYkCvaf5cS27wpU2MBFpg==
X-Gm-Gg: AYBFou2RHFo0NGHcCE1wqcxBLZHfdCtSvA61p8wt9DnXcO1xQRuuyp6wO1jx58wGfFz
	LqPd9iZEnXyLIOFLQTz7SVquhKZLF9AOSdAYZmubpGUDICyYWrGx22ne0QEEVO5YlhI2WxIs9K/
	K/1lTrGxkqqyL/CPPHfCqiCi+Nb1WfnlUGYepIU1ZT/jJ9RFM6xxyG3Xqs04OImcos6PgDIOUEh
	j4gjZdrDYh3PZZhEpXjHab6GergSZ17hqzEJB1ztgXAYzukX7UQyj8VXAKPTMLYRpCKfVdcZ8Eu
	hL3SNNnyLsSi0hwGwMVEN1TrLYh7RI6K7iIvW69S67fGpRy6tDY7aF8QoeUyOvCoTtVVv24+I+0
	71RANAW+EHQijK+0OWXKobq8=
X-Received: by 2002:a05:6402:c212:b0:6aa:e589:87de with SMTP id
 4fb4d7f45d1cf-6aae5898986mr6832193a12.20.1790676998743; Tue, 29 Sep 2026
 03:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <179067486422.102650.10176830320558486814.b4-ty@b4> <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
 <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
In-Reply-To: <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 11:16:27 +0100
X-Gm-Features: AclHuK9G694Ra3CWigev-SgKIG1dKrfnmFi4vSCyiq_Xo-NTi_Nls6PiXAbko7k
Message-ID: <CADrjBPrErWJR_01+Qhuw6mu0Kpe8-tvBMjci=rBO13RaSqnfZQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krysztof,

On Tue, 29 Sept 2026 at 11:09, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Hi Krysztof,
>
> On Tue, 29 Sept 2026 at 10:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 29/09/2026 11:41, Krzysztof Kozlowski wrote:
> > >
> > > On Fri, 18 Sep 2026 19:05:01 +0000, Peter Griffin wrote:
> > >> This series adds initial basic support for Laguna (Tensor G5 SoC)
> > >> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> > >> 10 Pro XL) phones.
> > >>
> > >> Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
> > >> 10a) were offshoots from the Samsung Exynos family. Laguna is an
> > >> entirely in-house Google designed SoC.
> > >>
> > >> [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/4] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
> > >       https://git.kernel.org/krzk/linux/c/ecf6405fa6c503c34eb4e7e905957d70d4018e93
> > > [2/4] arm64: dts: google: Add dts directory for Google-designed silicon
> > >       https://git.kernel.org/krzk/linux/c/cf3df78629f24b40cd0cb2da74e3ea4a944bed82
> > > [3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
> > >       https://git.kernel.org/krzk/linux/c/54edd8698bb1fb40c339d0cb2f15baad6993dd48
> > > [4/4] arm64: defconfig: enable Tensor G5 SoC family
> > >       https://git.kernel.org/krzk/linux/c/63f674fe8a0a8d6e4bee3e72f7ae658f0e9a0686
> > >
> >
> > This introduces new warnings:
> >
> > /home/buildbot/kernel/build/arch/arm64/boot/dts/google/lga.dtsi:368.37-391.5:
> > Warning (avoid_unnecessary_addr_size):
> > /soc@0/interrupt-controller@5880000: unnecessary
> > #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> > or "ranges" property
> >
> > https://krzk.eu/#/builders/28/builds/845
> >
> > Probably you wanted address-cells=0?

Yes, it should be:

#address-cells = <0>;

and no size-cells line

How would you like to handle it? Shall I send a v5, or would you
prefer to fix it up locally since you already applied it?

Peter.
