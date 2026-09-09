Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6436133E355
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940683; cv=none; b=VYXKcPLYyWvfqFWgiydsqjip9QCGZQJ56+67grVEF7ieoWgYJ339titxEunQpCiSZ5WGTWKCPVX6fnzjtzS5ClSLPPzcKEBj4Z5ZEGr5TTWQEDM98hN+fQkgz6I+EByvI612cTIag3fUUjcgdEZAY9rQkuDkpZ7MFrKzhVso7FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940683; c=relaxed/simple;
	bh=Dp0zVYlRV/ykV6DkWI/HZNZ2E595JooxGaLy6ystZi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4GK0v5qsgp1m+Jvj6+Yi1WYmLXfdkUVDBbaZSoz8axvD/MbXUCja5TO94I+pE1pGvEiA0llkUquZTfJXcnlpzXQ8loT+A2AilUwNZ3MDbGledepQihgZQzRIaVrTxCxS2RKHd3G50T+wQmX8Q49X9tNUZ4rjZ5lSFk2ROlLYZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a985799954so1460760a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940680; x=1789545480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u4dyKB/emFRDPrDqz9X2vH5TTb96Md3MW8gLHSI8vTI=;
        b=q4awCN5ff21IV6Jt2k7GA/pLbxt2U5Thga/Kmm4MWz7Ln/WmpG4mcBh3S7pQMu314T
         MO8F+gefYgSHTLk7eHwZDrd5P9J5HIBJ2Xy64nM9+gDAxZhog33Dyzpf/JCKxSil5627
         uuj879hHj+vsZK3wYFyR34Sq0xQUxCsCoy/ZWa5o4w+IrsSKMSsgLyGOVW1SM5PhH5XP
         IZxSZBuwRUy6WALw6YyeVBgvi46J5132KmZTFUjqqM64M6HDa3QNXy8MCHMKJuXi5axb
         nb58ACYIsEqpMJe4TvCxowyMhgvSp+1RqPt+CwWAc+Ge38rZaaGZzT1Ij8k6xlhAici0
         P2lQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9R/0NoAQblhYxdiHzM5v6mbsjmMfLTQ4dg3DFP36dvwEcvB1lZXLfDIWVbUu+qUUgPqmfo1FMkOYMOMo=@vger.kernel.org
X-Gm-Message-State: AFuF++lxCzE2BL97laHnV23OVLd5U+hc1e0WDf4oa8NQ1tIo0QUPmPFl
	c3ByZlypSWLM8HRjXjt0skIsOLAyu0rSCIXc04gKoNRd25alK7CpqAhp/JM9nTFWbzg=
X-Gm-Gg: AYBFou3sKu69bE1rAFZJgvk6fjoETP+jyW7KbQeWBAk9LGvvjJ2XEwlC8paU+OrR/ub
	vIIwVsFK04DHeHYHaOrMzfthV15bWa5jp6oLPdvIaYarTzvYYUtfclDiVynU28jSETyOxaS3LvH
	/5YzfEjDzUT/wTwAmXo/21fdZcz8p+7T5kGudGripKZKbjzEVbyaO6C/Pnwwx8qAXGZhm1aYWqm
	4mGfpy8MtJbvqArQ29OPwt8jLt9Sr4bQ8mQ0BQwPaDNRo3qRMfTdwsVShnPfAnjz8oxcF3F7owN
	Isd4lXa77LWOelvNUsin2atHsP2ZwhKXC7EVVWCeuzcoVR9NuPjiXGDhsqpwJ7RVyjOHNpZFGui
	rQPgvqmm5MLjCW9g1sz5SmjyGAPSZDVFk8tF54A1bRigK/ySZZfhpK6QWcy/BWt8+iXGGqMF7eV
	3NY1L33SKZIsvSysQzvpn8+H07DYPerDhP5t0Si33312pIy0RblqA0TAonBPKlyLzGmd0EfwmVX
	VFrPbqUyF26C7DG9iVzWq0Pq14j6ROPaoIJ
X-Received: by 2002:aa7:c389:0:b0:6a6:b2b9:7660 with SMTP id 4fb4d7f45d1cf-6a6b2b976d1mr10086834a12.13.1788940680334;
        Wed, 09 Sep 2026 00:58:00 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9882a8510sm780993a12.21.2026.09.09.00.57.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:57:58 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so9342057a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:57:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx5fCjOA4G3+fB/G9D3BZ0OgBxNmoJt4hs7aVxvGMPaj3eMcd49+DQ7Q4X4F6r9Cv2HkafT/XgZE+y7qVY=@vger.kernel.org
X-Received: by 2002:a05:6402:3247:10b0:6a6:b2b9:7662 with SMTP id
 4fb4d7f45d1cf-6a6b2b976demr10117247a12.15.1788940675713; Wed, 09 Sep 2026
 00:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com> <b1a64102-9c86-4cbc-aa07-11ad051b0dc2@mailbox.org>
In-Reply-To: <b1a64102-9c86-4cbc-aa07-11ad051b0dc2@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:57:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJso7-432-pgJ7SJr_QC_krOgLE6U1dhP6c5=r_TL_og@mail.gmail.com>
X-Gm-Features: AcwNN1Ua9Vke213V9Nb0AugUOA6EaQLwJxCjzIaW2N2cORqAOZX-qMn7euhb-OU
Message-ID: <CAMuHMdWJso7-432-pgJ7SJr_QC_krOgLE6U1dhP6c5=r_TL_og@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update
 PCIe node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 8 Sept 2026 at 18:27, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/8/26 10:46 AM, Geert Uytterhoeven wrote:
> > As I am not PCIe DT expert, I am comparing this to the corresponding
> > patch for R-Car V4H, which I have already queued as commit
> > 7fe73a3a3f2c3718 ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
> > update PCIe nodes") in renesas-devel, but which probably needs some
> > updates.
>
> I sent a fix for that one:
>
> [PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS

Thanks!

> >> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> >> @@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
> >>                          resets = <&cpg 624>, <&cpg 1121>;
> >>                          reset-names = "pwr", "core";
> >>                          max-link-speed = <4>;
> >> +                       msi-parent = <&its 0>;
> >
> > This has an extra cell "0", which is probably correct, given
> > "#msi-cells = <1>" below.
> >
> >> +                       msi-map = <0x0 &its 0x0 0x10000>;
> >
> > This is not present on R-Car V4H (which is probably wrong).
> >
> > Interestingly, Documentation/devicetree/bindings/pci/pci-ep.yaml
> > documents msi-map for endpoint node, so should it be added to the
> > pcie-ep node, too?
>
> I do not think we should be adding it until we can test ITS with EP ?
> This patch adds the ITS only to the RC side, where I can test it.

OK
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
