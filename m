Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D114657C6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676609; cv=pass; b=En2ceHz/g4MA7FmyExsAHVB+FW4oZ13reBsUDC5O6vLE6FbIG1OtUGYEY5rz3oPnUBzOJZ8Q02nJF6FErxIv008JSJbfZ4eJGA5FiJoHfBz38S7Zc89X1waD5IjsHWEoEYIU0LF8maMi8etyqACIHQrnkk7UCu31BllFXSIGbNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676609; c=relaxed/simple;
	bh=ugqhqlW2+gdWnYyVA2uZcdO8IYtwk8wf07W/RuYSe7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThEiXkZBrYMYIP6i+jI1m/E1KuIuh8a7nCnX+j2VxwkeylDQ8KyQkKknaCleWzzDXlKMj2ty5piHqHZ/CPFNylTQ0PNOh0PgtLS4W5X6snxDtRIcmpfQKCrmWfLcEuQwtQgy5qtLRaZQuKA6cOYqxHlZcdkWTuO6XrzB8nqWdlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLfFruuz; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLfFruuz"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso7022419a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676598; cv=none;
        d=google.com; s=arc-20260327;
        b=Lf2Pdd/cnpDt8NkdMcnT73rf3WxoggEfsvHpJ6Jp/ZHzmXXLlJYMbfjrR9YSB2u6Qr
         hIJiCoosyUzAbIVSVesmX207QWwajDkZcuOKkrlZXc250mOhFeb7Fh0DG2b/22teCeRZ
         GrSbhNAI/IGH8vZhpel0glM56967INnOnfIUblZFpj8I6jQ/7CHkaow0ebaPkYzq6n+i
         e1kuH3JkHQv0U7o8Y1nCFK0tYpwAg2nn1SSi7vm9vIB5GxIS49PVMM8vGpbsrn0u7uMg
         4BvdBoCHOjb+QLSs6L6FWWxa7/mMi2uorVmULiuYlyTfUDOA2qzMu7Lo4tOEX2MidddX
         RYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        fh=oTaVdKSy6b+/xVRiPQRDAj3zuCavtUhtWyzEKjNued4=;
        b=TmEsgeTEilNM/Pzw8m1IqGeFM9h7E0SwgIlH/DrswpN1ts5eiXeLp6fzINq6EL1KOF
         TCj3HNOEg1HI/aJd9KciD/onPj5H3gwMXghmuXkmet3AZqpOV4x4wP/2KlZgk0D7fOLK
         1tgPekRA+vpqvA82uDauUQK/82ktMuNjlZd8rs4UONb0L3Wq5Wm9M1YgMWzCnjd8bU9i
         x48DSGIhalqxZL5tGAVLVON/FZ62+k2sng0HQCuZR72LLhUWEWq8B5dGyT6GHcXQj15J
         LYd9I6c/5kc1HkwVTe16gGcoREyfzIIjjSZAQA4hxnAWT/YDpb1M+V7fScKBpgGJcUE9
         e89A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790676598; x=1791281398; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        b=eLfFruuzSD6VK94I1ZOgecR5WuCkwCewUnqYwsZjijOYG6HQFD3oaRXZNY0rj7ALsm
         LryYr0dwh1IQar9qi4TPHR11HNDoG8myw+R3WOYYZCWsoZ3NMCVeY6cbAeVFfpfYBp/Y
         eqWmMP4MoUFMm1aJnepVHf+OXMIUap7E6Xz+CJwwlcTYt+oeEDPErANA+ryssPHYlJPN
         DFtDmaleI3Z75Ob5ndQtSvFnoAgQJwh1oFid4CRAsDF/9kGJTgJX7QYM+xSfm6HixnCe
         +BCT+knQ6pUGb8dcr36lqfoq1EVJC1hvfam2udhpMUvrPQnAsDC+q3x0MtRGyjH50P99
         diQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676598; x=1791281398;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        b=EPJfBzJn2+JpJxR8k7+rjVjDh6KMg13Ev4CSpSDjn+JxchrrA6iiqm9eL4caiPHW2Y
         yPhrsD4KuF0Rxo2YQZuhx1AvXON0ArReT+7VUJJotrnN2Rz6RUEcjhW0qWIvltKxXQ2A
         dece7Klv1QHB6EK9MZyoBhF1nHc/dCBNksrOtPskVCgmrEcqAmqZUQlb6CtKXVxhs1oF
         kpzUJO/HNSPrjMXjqpeQbtzhGctoXKytKh5RBqvwLAtS4aTcUrrABjz59nPRvTWZ7O9f
         yd/aqPN55RyvxOjBuzV/fv75Zo0/1ijNquLIYp++Q9pDwSeZtBmySs4eSg+ERwa76Zjq
         9kkw==
X-Forwarded-Encrypted: i=1; AKwUvBxW7zYwNWMlXMoqvb3l5UDZPdjUBKb4joYoaI2Vbig3r/IYi1oVcqWJdoaRhP/Q0oFNx+nTVj1o2oDEQK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDw7u1vRvEsT1wIP4r9PFVDhXC484wH6qvS9Xud65jBRTmPk8z
	6BUnBVZ3iiVMKZxWy2IpGa3q9e04lWwuOSSda9Uh41/lt+VFSVc4O8OYwF0CeH4akrHuC2p3UOG
	bpVU9Y59vSor00AB+WDddGL02FDo8CgUPaUo7Ayurew==
X-Gm-Gg: AYBFou1f1Gq1r3Yoj+zZCN54B4Bvs9gv6NME5/qZoVqjA31u9F35RjygLje+RKhScri
	KaszQJwb6gqshwPJtNnxLtbmlT/I4ewa1Sb9r0Nu9Faqin+nbHWVuwufxVvT+CnembabEw79C5b
	kPHlR6VrtNnk5/gZ6o81Vpzc1aIGcxrbCNIpaxyMFEvqPr1Ms7g+QlqHKGt1MvPyWty5JZeiE6n
	LlF/7eo+w/ADtQ71hfWSHFQcYt6obyNnZ9gI8OVDTwUjl28iBECmkveELr0VuGp3XdFrZgcZLhK
	aUlcaz2a54zpqRrlO+uWnnsPaiszW47+9vg0tlf45WeUcLDJolH7sk9e8tya4ur7aW521SPawCD
	6Y6FyvCNmKJB4CWcu/C6lLWk=
X-Received: by 2002:a05:6402:3059:b0:6aa:9f53:221b with SMTP id
 4fb4d7f45d1cf-6aac8ecf650mr10133940a12.4.1790676598186; Tue, 29 Sep 2026
 03:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <179067486422.102650.10176830320558486814.b4-ty@b4> <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
In-Reply-To: <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 11:09:45 +0100
X-Gm-Features: AclHuK9WRHV7MmouzYCiFz5qe8OcNiIlPS3cNCTz_rrKcfw59IxyOBRtgpvUaFE
Message-ID: <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
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

On Tue, 29 Sept 2026 at 10:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 29/09/2026 11:41, Krzysztof Kozlowski wrote:
> >
> > On Fri, 18 Sep 2026 19:05:01 +0000, Peter Griffin wrote:
> >> This series adds initial basic support for Laguna (Tensor G5 SoC)
> >> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> >> 10 Pro XL) phones.
> >>
> >> Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
> >> 10a) were offshoots from the Samsung Exynos family. Laguna is an
> >> entirely in-house Google designed SoC.
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/4] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
> >       https://git.kernel.org/krzk/linux/c/ecf6405fa6c503c34eb4e7e905957d70d4018e93
> > [2/4] arm64: dts: google: Add dts directory for Google-designed silicon
> >       https://git.kernel.org/krzk/linux/c/cf3df78629f24b40cd0cb2da74e3ea4a944bed82
> > [3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
> >       https://git.kernel.org/krzk/linux/c/54edd8698bb1fb40c339d0cb2f15baad6993dd48
> > [4/4] arm64: defconfig: enable Tensor G5 SoC family
> >       https://git.kernel.org/krzk/linux/c/63f674fe8a0a8d6e4bee3e72f7ae658f0e9a0686
> >
>
> This introduces new warnings:
>
> /home/buildbot/kernel/build/arch/arm64/boot/dts/google/lga.dtsi:368.37-391.5:
> Warning (avoid_unnecessary_addr_size):
> /soc@0/interrupt-controller@5880000: unnecessary
> #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> or "ranges" property
>
> https://krzk.eu/#/builders/28/builds/845
>
> Probably you wanted address-cells=0?

Urgh, that must have happened because I removed "ranges". Let me take
a look and get back to you.

Peter
