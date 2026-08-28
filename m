Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE03A6417
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897798; cv=pass; b=CfBnSZeH0GvYb0Y/VdhOCMeFfJvRMQkvtdLR8DXznU1xhkja2U3T802uVKxHXsY0eyr2djxb3QcwOBFMPBYk4OmxY4WKXV/eiWlcxrdmAQcwKikqxeNdyRrQpogkJxKM872yjZuzgGKesQggQqUIO+pREtjxAytx4dc6Si5tYmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897798; c=relaxed/simple;
	bh=xoMiV9pBhr3XdnzLt7GGRC4M0vLljGvUyUzXHHfPtsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNA7c+V7x9hhVrcreN/atEShw8xyUwJyXu9StbBoiPGUjZvEMahnCxayyzBh+7T6KEK5k4/ugDe7mPU7xPli4Iy+7QnQsRjRabtI11Nu75toE72l7i6LLzyILLrXdXxIke2xnkojB1+JZRj6iBRXIzPZ7NSS93X525xw1bYbugM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=NND2t35b; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="NND2t35b"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso841229a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787897796; cv=none;
        d=google.com; s=arc-20260327;
        b=YeQE+8T1sReeeEQN4zVKW87/oZt+AIJOLfGCwQOY/8ORbtm6Fc/55ClEX5WwST+Tlq
         +RfH9bEfPJ/73vs79agLDgdGDL+hbpcuADsl3qZc1Hu5ASRTi1VpYvsoAFzLlFdoAUQw
         w5RMYYuQVFLwUPTkoaGuqUiD2EGUAqKxIbiEIgpcHZ7kUIybVAbUNGnniv4Y3/HdWNyg
         lc1B+CWahHxisK19maS/zl3R6fPqBK5dw1+OnF2kcwxsD9V2OWiIlJUolgz/c0abEus7
         aJ00RFGGs4RFHeT3qbTVRlKODAObSHVsvdKQYaIiM+QcKJeifv16/hS0WNu06PZr5HJb
         Ym/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sflMmxyu0cD4KSTlFZjH7uOclQyjcfSGu1IXDQSkpX0=;
        fh=M+5ut3Bw9KldffS6do3uNQppnn/Pc8NX6+eFVZ222fs=;
        b=Qu2lghJpWO4kGIqdL3BciLEvilKR3r2TUs7rCHUeXmPIG3mcAfQECNcvBNJzRM/GsI
         Vbfrtn24OZj1V32xuo4Vg5hmvPax45Zg3BfSmUuFG6cK1rR17TlAjUsWLVN+p7o5aBTt
         RpupTsz6q91L9YZeKXxYGG6tDWkvzeFIKjWQSefECdYLasqxNDkJAsr2vVThzsitxWrV
         NLet8gbOuzo8hDcwtDFqXz+GWWuHmPs1Ew3Hlp2lNKVBYfZqB2duD9UBqHQp6Sqoklh7
         S6xm91HDKs820v9mjMJPXtYB77rXvVDrGBRVOTaxofvxzdm/qdG5PktvQyKLWsT8kE31
         2cAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787897796; x=1788502596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sflMmxyu0cD4KSTlFZjH7uOclQyjcfSGu1IXDQSkpX0=;
        b=NND2t35bzFhYdKArGYhMr+2WTbTIAkJ8Fw4Skou7TtZGW40Q35u0YdV1hdVx6jhWnA
         rA9T2e3f/oHtTN0DpLEKlIqOOgDd8Eebhr4bF3iMHDPFttP5FZZaGqNlC0DpSwSfqETi
         R8ItiRI0vy4BwYXvfVl4wvupyUN6UzBj5nlXjAoC56M8AqY9IECOhQC+NMt8rsf9Khi2
         zG0HVSRguedbYAuNXFh9wROG0QbnFNpkRm7hJLYOBDR90n1L7p7rJf7VFT/FVl7+N+Mf
         /d2Z6KSKunWTImE0DZnGKC0sYAAYV3cObKo/h5DPfV+hWwlUKOhWPngG/ADiagXo+skM
         DhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897796; x=1788502596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sflMmxyu0cD4KSTlFZjH7uOclQyjcfSGu1IXDQSkpX0=;
        b=Cfsnu2JhEBJ8A+nbqcGiBIGyw65Mcq9SDb+NuOi5W5KNS5AHLnkEQGSQ2Lvz4PL1xl
         Wk70IFNz+EkB83WXazbduVRA09HiW38wLyydZ1X5B4hEsCnghruamUElbp9kbxqj9Dln
         823EMNdnZFFFDzy+g6u4Dnoq67xORUwZU5bc5Pv12Pg9SKszkGvuYVww7xr+tHwCMGht
         XPNliJRtQG8ZVDglwDqJejXuFu7aqbe9HrdaAoJCITjeJjgJ/ScNDcpJrSQGGTHo4hZo
         5W4eKC34oaKBgM6GUC+jqcRG88VfYl9HKqWpZ+7V7px60y46f8bmdZPuZbzyBPRL1eRQ
         sOMA==
X-Forwarded-Encrypted: i=1; AHgh+Rqh7X54NGh7okPj8aSymy3HncmgR10UeBIIadwnAJQk5dGk4D6adv96VpEsloUjlSGGP/2rldLx1OY84oA=@vger.kernel.org
X-Gm-Message-State: AFuF++m/LDyNM8HqPZZwwkXW66h64GfUv4dRrnY36BwvUfxFOdpBk6tM
	oarqVPzwrMm/IWNZkhR8gxDxcssaotw5rRIMPQpS1eYquvJGdcKSeQqw0yChwaQOQtmmH6+QIL0
	Tu1gvVKNcUUMedfg176enwacoI/QXuADw91BujcZC
X-Gm-Gg: AR+sD10qHWolcltvYUrZr4LShpNYQGiLkh6wDpip1g94Wy05+FZq4Ny7ivhTBtwZRH6
	QwqbxK/agmLVoHW9/lBzrSqeSoAugCdSisBR1fKg+PhxQxyAZzHB7jsKqAhnzq/SrM+yK/Y/pnd
	6p5HqKMS+QHSMg+2JXCwTp93dDCazCFl6V1igsITi+crox1AFqRa3iBSYgxnUwYDREKjUqx7iPy
	ItrkkavK4utXawVq6ihNUDkq3hgU1qEYNK6HJF1hke7hYh4wRGL0m105hNWJKqfabQi3bDf49Pg
	VJWtd+52WRjtDoaO2AKhv7wg12s2FkOGuxwA6CXczq/TCfL3eDCnr+56Zi2aZsJHXMSnIIYdBi4
	CToPMB/94Qn9rfz59fqffjyDQwaVoyYSq4tWUr/HGZsMZj0kmhlF4Bpedcr5azzA=
X-Received: by 2002:a17:90b:440c:b0:381:6c5:3f63 with SMTP id
 98e67ed59e1d1-396d0eab08bmr9179421a91.6.1787897795025; Thu, 27 Aug 2026
 23:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCh2o46zgc5Be_Z5=6NNJTKnd3W29zeMJ+gBCgL+4fFLAg@mail.gmail.com>
 <2026082853-proofing-pungent-4e23@gregkh>
In-Reply-To: <2026082853-proofing-pungent-4e23@gregkh>
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Thu, 27 Aug 2026 23:16:24 -0700
X-Gm-Features: AcwNN1VKlBjci1xgsuY-L9s1bkbRjRQnZ-ek12mQnwOMDHFbKaacflx2cNEeSn8
Message-ID: <CA+0ovChEnx=kEPqK025rVH9EXRBk-dvSTts8+2ufw6bmt7nrvg@mail.gmail.com>
Subject: Re: [BUG] platform_get_irq_byname_optional -- dwc3-haps registers IRQ
 0, WARN on first gadget init
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, falemi@asu.edu, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg,

You're right; sorry. I've stopped sending.

I'll resend individually, with the reproducer inline, and a proposed fix wh=
ere I
can write one. If you'd rather prefer that these not go to
the lists at all, say so and I'll drop it.

On Thu, Aug 27, 2026 at 11:12=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Aug 28, 2026 at 05:34:05AM +0000, Farhad Alemi wrote:
> > Hello,
> >
> > As part of the kernel research at ASU's SEFCOM
> > lab, we hit the crash below. Crash reports can be found here:
> >
> >   https://github.com/farhad-alemi/public_bug_reports/tree/main/149-usb-=
dwc3-haps-registers-irq-0/
> >
> >   dwc3 dwc3.2.auto: Configuration mismatch. dr_mode forced to gadget
> >   0 is an invalid IRQ number
> >   WARNING: drivers/base/platform.c:492 at
> > platform_get_irq_byname_optional+0x1ed/0x220, CPU#1: repro/9498
> >   Call Trace:
> >    platform_get_irq_byname_optional+0x1ed/0x220
> >    dwc3_gadget_init+0x607/0x2170
> >    dwc3_core_init_mode+0x2f8/0x790
> >    dwc3_core_probe+0x2345/0x2850
> >    dwc3_probe+0x100/0x150
> >    platform_probe+0xf9/0x190
> >    really_probe+0x267/0xaf0
> >    __driver_probe_device+0x1e2/0x350
> >    driver_probe_device+0x4f/0x240
> >    __device_attach_driver+0x270/0x410
> >    bus_for_each_drv+0x258/0x2f0
> >    __device_attach+0x2c5/0x450
> >
> > Our reproducer.c is available upon request.
> >
> > Happy to test a patch if that would help.
>
> Again, see my prior emails.  No idea why you are still sending these
> out, do we need to set a ban on this address to our lists?
>
> greg k-h
