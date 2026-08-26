Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1939936D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787768673; cv=pass; b=TF1nnqSvvPM4aJKluAAaRkMmM7emgtqzMm7Li6woR291tx3+j+1asn15oQOT6WNCV43cFP/6m37mVun/56PFNDR/r/q0TMqVJ9kGggSiJyhSk7zZY59NGqmjTU5/MykT6/Mt5cJL9MqkLWyUQGAekeTrLWiUOgf1IZVJRf0zGWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787768673; c=relaxed/simple;
	bh=/hkdG+AxpPNgaRw43nyMN4hk3txaTAaG2qfvZJhgjY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5VPSmp17WFNNxiVMK3vqm+qoz/MokKAqUev2GlBbu466Ewy+jGJNgBMIV9Aqc6r0rJdM1g3Ksf/jENCyeD7TM2G5CUKI5Li4wMZuJrRU7fq+zlU8O9eq1j3NNLP2nqneRMOZtUEWc/DSpUKfuuHEViQmWck6xIASpiDhmAJydw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q85El9jf; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q85El9jf"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso2190815a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787768658; cv=none;
        d=google.com; s=arc-20260327;
        b=fD78mOs8cKnFBZ4cEmxfGZ0/I3t9kKe84ZL2R3laQHSGWUFHPjMT2d8WKmW4m2Mwtk
         tGiwpa/dBwaPfL1s5NngT3bTpdG4RZ89Qamf9thzpKOBHwa5bIbQWNw+VAV1SfyUQ8JL
         nfmNjGkUcstH1UblD7VVQTAPEyM4oWtV7N0GhcTFNXkxfhO9A2cbIVejXAUNk0zyUadZ
         5QCeAeS9/KRjpYf0ZQmIdRg1CEVM+bbIRnWQ+SMaR9FjxVI/5sxcFaAw/rYfNiAberLd
         hTsaq6aSMXTobfRCuJSGt47SGm5JW7nS2G/qRxGH/Ncz+LLPf6Xexx6qHqSplrQbEgqB
         m89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vTKYEO3+t9EiBIVa1nORleSR1iayevsfGTi00Br03V8=;
        fh=tSOnRknipcxyywMdKBu52ANqoyLH+nUEeG2kHC7Bz5Q=;
        b=fDPVN3p+bFCFMUDVf69Rg9YvlM6KTtUQ+P/mpppDvrdP/lGRXL9mN92RHSW/15C2EW
         EOGjQvNdOMieI7KK+hi6Dva8Q26W/FXC+PEkhoS+dsVA21EJGNt4JpmLCQvTbqYM2ebQ
         CodRIC6Fq2Sw4lDnENM0srFntNRXhq8D4KdqXq2VkJ5FepmroOF6pNFJR0yDJ1jQcIXs
         ZhqK9EhXDBX2jaNDD+pWTRniyeIY2vnH//WFfNLUvpKomonIkZgiouxG7SonHXA3n+vc
         rZXGXV6dzx5XNUOZyK8vKMBbWOlY6FQ1rY1drBdAFkS63Vq02qc1IxcptwFD9Z6MB65X
         ebqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787768658; x=1788373458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vTKYEO3+t9EiBIVa1nORleSR1iayevsfGTi00Br03V8=;
        b=Q85El9jfcs3J1yJeSYsVNnX03sC6wOWllcmDsBkg7oea7khHsgxqGueM6dd0xheRJl
         muMpIcO8QuGZcuu/+Tgq46Tgr5boJm4T/X8Y6xTgWVC2SVGhoAMtU1SpgyzpK5AgOTpy
         OGgQSH+cVMT+EflKbyWJPOSeSZAhNPNUleGOBx8+VQ34mP9MGQrBvEoF5Lu8Ovcn4eAv
         zOUqLHlf5Hhs/Qv06azAmhrTDd9qr3Sjh1GyP7co7JZWp3V4xlHng3o0rujXB1ZLqKpd
         VgeEl6WbbBvjKx/rqNzo6j8+BQG6lWSpKx5CDNc1T6F+fFDFPhKb2xt+tW074b7x30Zi
         O5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787768658; x=1788373458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTKYEO3+t9EiBIVa1nORleSR1iayevsfGTi00Br03V8=;
        b=Xr/4xiDJuNgmjZquAcNByxESL8RlzmDi+YGgi0ivqdMblYmmceUuLcLnaQjqkxn54d
         AKSB10X4wgd02ykIcMP2r+zdUVLirHDhmfLdfu6uQ9VhQ0SBfoarCwPR2ogEiv7yVwVk
         rq9+Yud3AgwU59pZu6XnDBmPBu7vJc32qOAb7VVvunUCjlVpOEj0IImpdmicGoqaViEz
         qe3IsApS22LpdLR5UvJJ/gIuAnITVvsWuYN9wxaoYBrx9A+52qEWkpa19dJ+DMaVwSoy
         3nMzXr1MAWW6klzWGaMTxfVMtCFNtYr6w6u6K6orejDkGN+HJm/Mdopa4xI1oVsW1JtH
         fPoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNDPBZknjSNC3kXBrx1HW6cxh92Cu4TvMR3yo8E+xEJyBBOl57f+/WYzATeb9wvdTJvjItjZBMA+cFVqo=@vger.kernel.org
X-Gm-Message-State: AFuF++kUQXmiMDMg1gTNyRLKdQG6WtSA9fDpqwm+snzvssJUfR5gPxdl
	ZMrQck4FQwTvify2c/ra7oUObRc6/4CgNbpEaVyeaDb1pZXZTcm0nTGawUQ7kG0rfr77dp7rt98
	ntZY/wuZ3W0eVfNYz2xgDr9luimua3X0=
X-Gm-Gg: AR+sD13m7paJ75qAnPZlJtgqUl+tifw3dYydkiTY/cwjb6CV/IFmLr6U/RL7n9lDEM2
	BRT8+ZBy9jo4P8KOauGsvf3FqALICpdYOO0n/mfFeTI6ArJZwz6c4BhliNo8oE9vGVd5jc9vUrw
	DLi6TQTfZSOdkiZUdgf++DO8d32RJA4zsD/aLMOwD0s07uzF/kNWkxYymwfJi6Si3Jg2eq6DYF2
	O9/ciWd46MvMXfGzW1wAIGsRtV5XHrku1hIDGnjvXC28PbvqE9xeZzjAlqG77TtxBF8Vpkawb/c
	AOucw+gGZDEikz16HHurHBzoF0E26M5Qo8puVpRAJnSyZ+HCrodUXosS9cUM4yJfbbO0Onwo7JF
	EyCC7AjpQf/lmVoB2hjMRevJphPMJMnY=
X-Received: by 2002:a05:6402:1cc7:b0:6a0:ffb0:273b with SMTP id
 4fb4d7f45d1cf-6a5df320af2mr13171809a12.0.1787768657868; Wed, 26 Aug 2026
 11:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824181126.3559638-1-linmag7@gmail.com> <20260824181126.3559638-3-linmag7@gmail.com>
 <ao78x7nKbm7fcdzk@minute>
In-Reply-To: <ao78x7nKbm7fcdzk@minute>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 26 Aug 2026 20:24:05 +0200
X-Gm-Features: AcwNN1VnjhOH9dJ3c8ruU3KupD9XzqJrq-dWWRWQVF7X93Vv2Q-_zF-DN80HcTA
Message-ID: <CA+=Fv5RmcTGFgmCwTVvSWq2-2RcVDWi+CRJfysCoKA1RRdiomw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] alpha: disable DAC for 32-bit PCI cards on Tsunami/Typhoon
To: Ivan Kokshaysky <ink@unseen.parts>
Cc: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	Maciej Rozycki <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ivan

On Wed, Aug 26, 2026 at 4:48=E2=80=AFPM Ivan Kokshaysky <ink@unseen.parts> =
wrote:

>
> I don't think it is. You only need SRM-compatible device to boot
> the kernel, and then you are free to use any sort of PCI mass storage
> controllers supported by Linux. Personally I'm using CF card in IDE mode
> as a boot device and PCI SATA controller for everything else for some
> 20 years. My controller is a cheap 32-bit one because UP1500 PCI is
> 32-bit only, but there are much more advanced 3ware 64-bit PCI-X SATA
> cards still available at very affordable prices. We don't want to limit
> them to 32-bit DMA addresing.
>
> > The only driver currently known to hit this is qla1280 with an
> > ISP1040 card and a 64-bit DMA mask, which is a common and
> > SRM-supported configuration on Alpha.
>
> So it's just one unfortunate core-logic/controller combination
> and should be handled as such. Obvious place to check for this is
> alpha_pci_suppurted() (which ought to be named alpha_pci_dma_supported,
> BTW). If we simply reject 64-bit mask, the qla1280 driver falls back
> to DMA_BIT_MASK(32) - see qla1280_probe_one() function in
> drivers/scsi/qla1280.c.

You're right about the SRM argument. A controller used after Linux has
booted does not need to be supported by SRM, so SRM support isn't a good
reason by itself to accept restricting otherwise usable PCI devices.

I checked your 3ware example as well. The 9550SX does request a 64-bit
DMA mask in the Linux driver, but the card also has 64-bit memory BARs,
so the BAR-based test in my patch would actually leave it untouched.
Still, I agree with the more general point that PCI bus width and BAR
width are separate properties, so using the BAR layout as a proxy can
potentially constrain a 64-bit PCI device with only 32-bit BARs.

Given that the ISP1040/Tsunami combination is the only one I have
actually demonstrated to be broken, I also agree that handling that
combination directly is the safer fix. qla1280 already has exactly the
fallback we need: reject its 64-bit DMA mask request and it retries with
a 32-bit mask.

There is one distinction I'd like to make, though. While the ISP1040 is
the only device with which I have been able to reproduce the corruption,
I'm not convinced that the underlying problem is specific to the QLogic
controller.

There is also a reason this may have remained largely unnoticed. On
Tsunami the normal direct DMA window maps the first 2 GiB of physical
memory into the 32-bit PCI address space. Consequently, on a machine
with no more than 2 GiB of RAM, limiting a device to DMA_BIT_MASK(32)
does not reduce the RAM it can reach, and mappings of normal RAM do not
need the monster window.

> The patch below is compile-tested only.
>
> Ivan.
>
> diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.=
c
> index 955b6ca61627..d60c4c2aa8bb 100644
> --- a/arch/alpha/kernel/pci_iommu.c
> +++ b/arch/alpha/kernel/pci_iommu.c
> @@ -6,6 +6,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
>  #include <linux/pci.h>
> +#include <linux/pci_ids.h>
>  #include <linux/gfp.h>
>  #include <linux/memblock.h>
>  #include <linux/export.h>
> @@ -786,6 +787,16 @@ static int alpha_pci_supported(struct device *dev, u=
64 mask)
>         struct pci_controller *hose;
>         struct pci_iommu_arena *arena;
>
> +       /* The tsunami monster window doesn't cope well with QLogic ISP10=
40
> +          chipset's bus master DAC. Reject the 64-bit DMA mask request
> +          for such a card, so that the qla1280 driver falls back to
> +          32-bit DMA mask. */
> +       if (pdev && mask =3D=3D DMA_BIT_MASK(64) &&
> +           hwrpb->sys_type =3D=3D ST_DEC_TSUNAMI &&
> +           pdev->vendor =3D=3D PCI_VENDOR_ID_QLOGIC &&
> +           pdev->device =3D=3D PCI_DEVICE_ID_QLOGIC_ISP1020)
> +               return 0;
> +
>         /* If there exists a direct map, and the mask fits either
>            the entire direct mapped space or the total system memory as
>            shifted by the map base */


I'll take your patch for a spin and report back, thanks a lot for taking th=
e
time to do this.

Regards

Magnus
