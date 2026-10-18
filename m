Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2223D79F1
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364703; cv=pass; b=UqnKFKZNeOs2qNYB59glegjyTDEyIMmjaqrTunQpduTtDGbp1wCX7u09s4gayXf8ODMN1398cmx9+UiQTsntTL7BwipdioB6tqOFNaoT9RBZkhYvFLJLeaaAVMy0XY7VCEXsOBIEpFO3fM1wppz3vDrG2GOyI+VHlffkTWWIO8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364703; c=relaxed/simple;
	bh=5hlKbxxcI0prTGWkY2kVG+ktXHIzZp+G584+bSjB6Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNlX5tYouLQ8oqDVtF7gzIbaLn+vHnAivF2MExoHvBWnNWyy1ascy+TRXz7lcnIechtHyGv3kbACFeh8AjsRgaVeoN/Nrr7T0enQj1UlnA1ZzLmr+8TDPGFMkfiCbSfpJFEc2WT1uQaq3uxgFpkfOGP4cnCuc6/fIGEO4zqPEMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Sq80VPeD; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Sq80VPeD"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so3856059eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792364700; cv=none;
        d=google.com; s=arc-20260327;
        b=n6RfsBXxv927TxQA8HdOiaxekQX6v9gbn1VHhdUnKWGKkbvbpahfuZy1Fs7uwhlefu
         21opXGGlQPfzrLXglGbVMfizGYL3m6/Bu2HKkENX+kf9mcFhTa+mH0mk8IMaGVYHfx66
         v9Z4fYnudgy0XDoaK0ids5yIxKjgm/5hS/XtQMm0NbO/HcrbVcFlmFUgYQuFdjc8O6g4
         e6RKGaHmqasHUW3oJvHD31nafvRcpxVpyxwoPPVDq6+XdNVqJTP0zdARIfmpzk1vSaur
         /qoJiF4BYfDVYeRN43llEOKj31D2LJCDaXjBRxKX3bzLGrZzafUYnMAyCHdga6qxvn95
         +ifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pdNuBmcWi1wZSwfuz2mNY+kCv6367R1XFhsEmvefW7M=;
        fh=CNC0yjkrLjtmGl3Inz+3W0/0oXeUP6hUDm2ldAIrWLo=;
        b=Qjkj2JVXMDJlr+bRtLfMiFqQaAtjuixntlDh2VgFwsYtdhDSs2YeiV5v+I98s2DdYB
         Gdlg9lHnxx1YRLC9rzfh9q+clPz8EGORdfA7egmPSSqSewkXGcRm4txeWpEVWVb3cUBr
         2RZhiXsG2uP0efEcdp5/snA+86hnPA7OvgCbAI+/qmVCCoZviWYo580d5YD4XV1cgsIs
         p0nmAv3zFDse6diQa2/Pp2/G2wyzCSWrm1Og7d0QOTsdYjR1uRX7SHNVP9q2wyViaTw2
         G77ZoXjWuPp0dZ8CJd829lxFcdRonuWa0R1RL6NzBZNBBMdLYoITYUP0+HGyQyTLE1cP
         kxxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792364700; x=1792969500; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdNuBmcWi1wZSwfuz2mNY+kCv6367R1XFhsEmvefW7M=;
        b=Sq80VPeDEhmhoLpqqAvUTNuHS1WxtdEkZ+e+9Zu/DUSZ9g9lj7wEvYRM3TaX3hzezq
         R7G87o9zmI3cLru+IoItLxQ+R/S5PhyKjtOSDtN90/Seg/3Sil15q3joal94Ks8QKt/g
         Qdng0JwJS1HpIeivDj+2UiJEYo+nDtJCiWx/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792364700; x=1792969500;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pdNuBmcWi1wZSwfuz2mNY+kCv6367R1XFhsEmvefW7M=;
        b=LtTNsCZGqk/fc1TpF6idgvyPQM97LQRQYQTDVhWUt3f2Q+syWaNeKEU67AhFyG6Rdv
         8las9M00cahW1L1NcrF5xXNj1+f9ldVwXdO0DowE1Z0MfbPM99REe/8D2BuAko7P2+ah
         Jf5wmD8OFc1eClxcow7VG11aKQAUZPSo+tfsEpwa/lhL0zuoGGHPmZtajWkdR9ASzCPQ
         eSIcqNAar0WcU8+uEPC52mkNbiW2/HBJ7K+69G4bq56Nt+Nd4CEouKGS2H9GrlHBLIKX
         IiigvoNZq1qbMKJDi+58fh9ry0C/DDoHeK7DGCOLB5Xk+TJTyxL1N7Ve9UUEDTgl0ah8
         lSew==
X-Forwarded-Encrypted: i=1; AKwUvBwMciQjlwICn2EE6trIXD+P6zB1GalL9lUsJYBnj+d6dbR2uarV+uEUlWnCb4KKD03v1xRYQs43pTAzgm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxtqtkKDppsaHU+LynKI4x4Z5/KdXdvenbiEHEaAq5P1WMezHN
	HFEf65xmbK22uxHw2FRT5zfjhSzckWI790YeBBXYsyKRs2jM39hz1JBEkbY8TfL+5ixUXTao9K4
	j3hI/AR5NdlM6MJB8QYMpJHdq8PRGy+rsP8ByRvVWTQ==
X-Gm-Gg: AYBFou2+W1Dmn0RILwzWIqvRJETinzdGRU6GjF5AhU23T35GT3uDiyopa6qIdsqDHmc
	21C0dJLSr8jhX39u8GiutGGehSi7pS8c7EQre0U8kWgYWC3hAiSh4DG272SlrnxfsqiNUqxneCJ
	R+H0GacallzksVJ8QgijCh5CY83SkSg++B/ZVZJkp824xsbMCkhq/C87LPh8zPd+5bCsxLR0bTc
	G84y9WCIa5mItCYJ2tRMVlRF3w7mkkgtDU9B7NcV7tKUFmU376FpQHwbTZj6sZhOHavkF2vZacr
	/99EOVvZAN7jQ+4A8adzxIUqTGQ/Fb1MuqXnRusMNRpoh0A7vcZLn6ukO+p7Eu8cL94Om+KtOGz
	CgR4CV3TNFUkSbwg=
X-Received: by 2002:a05:7023:a84:b0:188:e51:e86a with SMTP id
 a92af1059eb24-1880e51e89bmr6391719c88.2.1792364699526; Sun, 18 Oct 2026
 16:04:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017041419.311921-1-daniel@0x0f.com> <4cdb2939264e0b7d767f44289fddffd40fddf504.camel@physik.fu-berlin.de>
 <CAMuHMdXmZash+8PmfSVrT=Wwob-mkq0x4umyRgX2-yikV9kaVA@mail.gmail.com>
In-Reply-To: <CAMuHMdXmZash+8PmfSVrT=Wwob-mkq0x4umyRgX2-yikV9kaVA@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 19 Oct 2026 08:04:46 +0900
X-Gm-Features: AclHuK-LLYBKws1C5cc1iDE2Bj1jC73GLJaKrThGJoscsEcvrzPj8IjxBlev-5I
Message-ID: <CAFr9PXn4henL=rQ3n73H7Mjwd7v6XX6Jt63h=Sywu-boOPggKw@mail.gmail.com>
Subject: Re: [PATCH 0/2] sh: Fix IDE on landisk
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, dalias@libc.org, dlemoal@kernel.org, 
	cassel@kernel.org, linux-sh@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yoshinori Sato <yoshinori.sato@nifty.com>, fuchsfl@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

On Sun, 18 Oct 2026 at 23:48, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > I hope Geert can test and review your patches and I'll pick them up
> > with his Reviewed-by and Tested-by signatures.
>
> Sorry, I must have different hardware, as mine doesn't have an
> ATP865 PCI device:
>
>     # lspci
>     00:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> RTL-8139/8139C/8139C+ (rev 20)
>     00:02.0 USB Controller: NEC Corporation USB (rev 43)
>     00:02.1 USB Controller: NEC Corporation USB (rev 43)
>     00:02.2 USB Controller: NEC Corporation USB 2.0 (rev 04)
>
> My CF rootfs uses pata_platform, which is enabled in my working .config.
> landisk_defconfig lacks CONFIG_PATA_PLATFORM=y, so it hangs during
> boot. After enabling that, the boot gets further, but it still hangs:

I guess you have something like the USL-5P that uses the SH's onboard
CF interface.
Since Florian has confirmed their hardware has the PCI IDE controller
like mine and reviewed the change I think we're good.

Daniel
