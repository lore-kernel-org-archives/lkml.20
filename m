Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD0421CFE0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600546; cv=none; b=ELz35F0qXoLfm/NVCjyY7FsvmoebBdZo2NIkiPKXssyPiqUNT35cnlrziulMUvsLLSw+FIgmtnvrl/rKhaQNbCm6OwLjejgEYoDRRfry1IR/uWAsvulBmqATrMIW88JM4M8jcTKh5W2N0iBKOw2zkljZM6sxkf612EbBDWCd0lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600546; c=relaxed/simple;
	bh=MNgEkF9rzvNLwkhHa+USMkamAutraVbddo1NEhjIddg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BF5KCNyYTGEPLfVZzzw+EqN0OKtBdTwAlEEPlW3hwJNtCaHiSwinbge6cP01c861Szathl/wO4auuLmP7T8MGNfbZV52utWMLO+PTk/j8J2q20RfGgsh9wbIS5Fi3H5Fu/FKwmGIb5QjVcyvFW7yXiAsuHUqnI6iNSTQacNbko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9832c759198so1591720241.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600544; x=1791205344;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2wjW2JTwOVXb3h1ozyQBNpHWe/T9o537b+crN9rr4kg=;
        b=jZNkRRRgzedIpQLQDFdBov2K+ixh21Is6oL1mI1rVjgrIlFP2uoa88yMCG8lbEmoFt
         VjQfbeiLODyPQ+nd4KJ3S6ijPucrja/di/eMV9/XCrnxOrU2Nx5VOhwgEyGpKlzHkV9p
         tiT+sstrvmpwNP1NVlsnOQNwkDoMI5TqlTJL5LHWRg5li09tu7Zi5kOZ195AvOoBeAWi
         Sp0F49U4zdrmfrrH8geGNNAWE/5XV/bIki79DyKJq+eBoSdaZSY21+aWPdLaWtTBScyd
         i/CIBXa2NkG3oKNGMTbnV9g8E5/0g5RaPfwM4MPWCRwmG5uVffy57LZyWw8+BQBMr/tp
         iNoA==
X-Forwarded-Encrypted: i=1; AKwUvBzsEGQMPdINXWb6jytuCeiTWnOaF8AhjY6NTSb3Sx0sb/nAZWxdm1OukEop1Ch9WHFaoifZPxYJHSbHtp4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbQxg6Lpc9J+QQwSszzLfobr5b8pN2FC+3FME99b52YNKBabmM
	kO+y3nv4+MR9nRhr28tpeLi83WE3vfv5dFpXK13n/yw793N7eKoG7zAmKqr3BHVL
X-Gm-Gg: AYBFou1S/W8/kkK2cg35fXCgbwZx1Ev0Rb5iD32y6g9nmOEQSs8ZCGYT6m5RDosTeab
	+trcuUbVloAp4tcqCn5/Wg8GpL3LnBzwpnkcgj7NXBgV5zesWkyKF3chjqB4cbFPmn5JziMSg2e
	YTqTVhtycwDE1oUm9bcnTuNzwOZ2EfXcSzojSlUp0hGG1oSclrK6ZHS24fOOYC61WxVTgGuHeBF
	VQNX12YEat5Ay/kxUeAj1o/B13y6mJlO+99UqvKKW3tgnDOuQqdBxpBeH9AZdFyCoFNVpFZ1sTT
	OymU/ic6vbYD7p3gfpXYVkbaJw4LO4dnG1NBFiYRdXofL+FJ3u6j8r6aqCMqMiLpRt0EHgih/oT
	CfWdqgtvxU3unRZwPcxbVt3ENxU7r0pHJdP5Z2H2X8uHglKZxCqsVwUo7WYP8oGNBVbvBf0XNFU
	Kq9yfhNPY48aP26yppWj5mYUyB5LRWylkkueawscW0I7flbQNLDE+ftrS7BzviLdxa0Qk5NOQjQ
	Nkr17XKKDDglj0i44ICSFD5kQUcBQSHn0ThqQ==
X-Received: by 2002:a05:6102:2910:b0:7b3:54c7:7ce4 with SMTP id ada2fe7eead31-7b354d6cbb7mr2049402137.35.1790600544364;
        Mon, 28 Sep 2026 06:02:24 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b6a6272sm9262222137.7.2026.09.28.06.02.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:02:24 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9832c759198so1591704241.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:02:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzsxAVLcRgNHCPT0gcXhhERxZzl5WqPscRQ722NLzUM+TbZthUI1kmiBcvaZYzHNESbTZ+se9TV+5zbLR4=@vger.kernel.org
X-Received: by 2002:a05:6102:3c8e:b0:7a7:c789:888 with SMTP id
 ada2fe7eead31-7af1c799ab1mr4246322137.5.1790600543175; Mon, 28 Sep 2026
 06:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903205153.283553-1-marek.vasut+renesas@mailbox.org> <20260903205153.283553-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260903205153.283553-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:02:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFm--o+J_dCEkQEJOYPCPhemwfujNm+j0veMPYn-g53Q@mail.gmail.com>
X-Gm-Features: AclHuK9PxP9o2Iptr30yrzx9bl3oQSb-6qLfwXQyJV5JcRh9RYQN0Hhi1zaXUYw
Message-ID: <CAMuHMdUFm--o+J_dCEkQEJOYPCPhemwfujNm+j0veMPYn-g53Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: r8a779h0: Add PCIe
 Application/Local register reset
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:52, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car V4M documentation R19UH0217EJ0110 Rev.1.10 , Jun. 30, 2026
> attachment R-CarV4M_UM_009_SRCRn_FSRCHKRAn_FSRCHKRBn_r1p10.xlsx row 411
> describes PCIEC ch0 Application/Local register reset. Add the reset into
> both RC and EP DT nodes of PCIe controller.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
