Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3092737F9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545434; cv=pass; b=iy6igrm8opM9XvwhJJPuQlF2f9z/nZ3lNiFFjsZbPjyVIAtHRiAytmbZDvRW2fhmoAuWpGXtTWYY/vzRA3eK4johjd/L2F7XynyKQT/Q3o7YZmX/oFucOfnYhiUoRAgNApfItRfjyRaW015lwmirJWwNODoQM7VnB0xxQxDqtPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545434; c=relaxed/simple;
	bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrDLGEVHlSGD6h7ujGN2uPPJJq7wv3mTCgOldaJWprbzWEDFuGv/UGYVaVhLn08aMtVYKkwcO7rJd3W3YRtGDfjBFRRMLEri5KLIahpR8ZYXjRikSf9gvjuMeKurzx6nDw4cLLnKxJrgKKpVpeK6ccPL5oMolC37/h8rWj/VSxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heV51OF/; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heV51OF/"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67718201466so3674757d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791545426; cv=none;
        d=google.com; s=arc-20260327;
        b=f7sbx4CxCTDDKCFO0aFRyct2Jr9Lcsppp72bjWSufN0S6y7oHUKi9MXM/qxiXiu0RR
         CMHNODWFeHSUfF37vc73pk7jdJkIVgaUevMcdpCSMnzJXNpgROqJuIi/FmXlscVZhgp1
         kdWF63eLQE0FwG0bRylUn+V99hzX6dSRu4vK3kmdZqAMeTezK4kiSJJ/wkpYrTibZsTL
         t+LyFv5VHEn8bLzrHDxVO1SEv4eABtg/pD/El/aHQ2KlGwEITB5R2p39vcZHWaDyHG1Y
         3U8GuP5UZFoU4DOz067/T2sNeofP8/Zcp7ROJ601UEfrpsZ5I+0njurlL9IQ8D/lDdcl
         J+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        fh=gk7jk0IRjFyKBqNjliabAM1+eaCCFvKoRMrcAV164Hs=;
        b=X5Pk1JeP94iZ6ZuhKBgF/7yrtQLV/ScuUpGsP0cRrW9XfbHRoIaVSNQvVt+gnVr1lN
         u+YmEC0h/Oe2aZ7KlbKgcLFMOdXAnpmeHtXCCSqcQyGDYq+kM+MqPBTbPC5iqrn35pvG
         NNeSlx+7UUCEgoXWik64gCucFwW3LWOH1ECvNoBmYtFUeRvBS6t2fRWiOcxcOcb+N899
         laALCjbhFyMxOuutyN/2bgrY8LrdpB24g89mDt1GaLDXIAFo+Dg8/6SQjjrRRzfk9jpW
         CWPfgvHFIVTcYRpF9j5p9jK0erpiSzfLPHlmsAvo0itr6g+Mrnnzy/0pXkDYv+rez8Dl
         nljw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545426; x=1792150226; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        b=heV51OF/je6TDd7cnA4aqRFA7ufeixuPCY6OZfeY/ZhJPxY4GC8d38L1cUA+Ir9U14
         AtFl+rI0SFkyDls0E4F4Rnyj/a54yZa6jiWThn0cDF4uQajkHXtNRY7YwIcjxJMMLUbX
         8iXL0r1kboWd3J4RIe/8vMdka5inNZIQdvmSg7g2Av1DMVAqBA6JlQaoP7KIbRE8ctdz
         5puxRXOnrstfWHUMykG//7DRMYJ5unSw4Lk8bC9Vm1Vh5Vy1T4GDYQF2GMP1jMDP9wK4
         jEf2NkodhHNnRYMnQbHOcD29v5PGznM+eL4c49ujoIjM33JVRAhtZpQE5tZhbSqKobHo
         Tzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545426; x=1792150226;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SWFAa3FlRVlkGRW/o5QZDawPsX279VU1DGq1SPr0IVA=;
        b=nkv952vHeT6DRdJw02CefvbUcRYdsJDkMvF1KjEJ9gLEawAzRLW59QDCfuQMU0ZQyQ
         cIU7yuneKnpJT84TNu6aGfOrpWagH5ayh3Pc5VyVzaYt4Z+34JgXjGqu6tLkE2d/xi4P
         DKeyXVHQ89j92XA/t8tnk9sedyrrIGWR/YT93sPvkkk+Aqxp1JhCca1HHUMe78x/SxEH
         TnFuJpdYfyQDLyHKzzq232/nD8ujYOd5pqauJnWmAEEZ13hG+OyMCw5vsTEqo90bu1T/
         JKa3KNOq2dIUb8Kh7m0erUKdkS30sdSIP7chJ6kBTq4N8Un46xTAgiXm6vRxi/mJfFaO
         zRbg==
X-Forwarded-Encrypted: i=1; AKwUvBysNOajuHjEtOFlzbusGaZ1NavwQQeHnxjvbdytmzYaVPDA/lJjFu/D3NMce2SJNjjIOfH6UH75S8G3PXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3Uo3aeoqcYN5P1KhmetHJ6o0CwHx1LBnM10VTNXD/dpjktQep
	MHGgjeuEDPBHSonuFVOXuPwvkvHIyN0fYdE6UqBREMzgyxeQyLxxs43l7FM9sGoaFRzg7TnqCr+
	mbXMNlMTt5BSaMpzIViRyXSPsdDheEbY=
X-Gm-Gg: AYBFou1OWQiOYaNltCgjzINTtLWmNPlWJvyr3vdFhdrfkKDrpDyQwhWKbO34h+cqWCP
	7dIbIYbXEyOB3GkuJGmH5lu773C0eaNnwy8MoedZzyES4AHFpVQASq22XPcdWSYGooQAMyG/PLm
	8xRogGS03rzpWsBI6Ug2gmoj31TB2eXOEr9gPkQ3hZo4Gn8pS7lz7RInWPHeJgdJvgAsWcSx5MJ
	rtkUeAbCWC8M0YWTfLQIGbVTHL0z5moLIj0fT2bWhHRRUFI+RMIFCrTShgBHEFeMu8Y4q/K/vlS
	ABtmP0B0PI8h8j4Oeoq+vzrqQzsErfePDNoVjYZvMJicyXG4KxDaeyQdV4M5FgjEd9EP2s33qra
	YNvnvsAtbt7ET8TkkBjUWO9k=
X-Received: by 2002:a05:690e:b49:b0:675:6da9:1473 with SMTP id
 956f58d0204a3-67936984122mr569837d50.19.1791545426481; Fri, 09 Oct 2026
 04:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908090448.3332-1-ansuelsmth@gmail.com> <6c610758-5f34-4408-a6e5-f3718218ba94@intel.com>
In-Reply-To: <6c610758-5f34-4408-a6e5-f3718218ba94@intel.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 13:30:12 +0200
X-Gm-Features: AclHuK8eqfw6Ev6f1SKA8eu2eg8tRj5EFkf2BXzzFiX-0ipAFbVTyYej92ofmYs
Message-ID: <CA+_ehUwrzx2gLS88438mqQC=ms71kaJpoU9ib8=zAdpsrXcGeA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Darren Ye <darren.ye@mediatek.com>, Rosen Penev <rosenp@gmail.com>, 
	Daniel Golle <daniel@makrotopia.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 9 ott 2026 alle ore 13:25 Cezary Rojewski
<cezary.rojewski@intel.com> ha scritto:
>
> On 9/8/2026 11:04 AM, Christian Marangi wrote:
> > Add all the patch and documentation to support Airoha AN7581
> > sound driver.
> >
> > The card follows similar implementation with Mediatek with
> > the codec present on i2c but with a simplified implementation
> > register wise and additional frequency supported.
> >
> > Changes v6:
> > - Fix PCM probe allocation logic
> > - Split driver patch to dedicated PCM/ETDM patch and machine driver
> > Changes v5:
> > - Address comments from bot
> > - Better handle concurrent irq status bit
> > - Protect enable etdm
> > - Add Review tag for documentation patch
> > - Address formal comments from Cezary
>
> You've not included all the reviewers in the Cc list despite addressing
> some of the comments. I hope that wasn't done in bad faith to avoid
> further review.
>

Absolutely not. I usually use get_maintainers script to get
the emails so it's totally possible I make mistake and I forget
to include reviewers.

If you have a better process, please suggest it!

Anyway, what did I miss? I can totally send a followup patch
to address them! More than welcome to fix anything.

> > Changes v4:
> > - Improve Documentation YAML
> > - Move IRQ regmap to mtk_base_afe_irq
> > - Use mutex for user tracking in ETDM
> > - Register IRQ after memif allocation
> > - Address suggestion from bot
> > Changes v3:
> > - Major fix to the ETDM code
> > - Add duplex support
> > - Improve Kconfig setup
> > - Rework and improve YAML schema
> > Changes v2:
> > - Fix wrong edit in MAINTAINERS file
>
>
