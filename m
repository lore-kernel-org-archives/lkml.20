Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED853859EE;
	Fri, 28 Aug 2026 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897543; cv=none; b=hUHtoe1FHPksvFqseWRuZI0FVxftUNt5SSNLrP9PJ1g7xo7OyTe2MBMelMIt8ul1dt/0A7c96MS7xSVHP8NQP3eT3cqDU3tMUDvRrEL7jI5W98IVX8AH+wRCLaOFfAtyBl1s2O3lxt6IhPXuilj8Sw/wbxfuAnW/IOM4JoAkT74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897543; c=relaxed/simple;
	bh=ednTl1cvE2s9gu1TyG7SKWIIKQAEAahzbmWOShcMPGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNxtq+G8yrI4hoiC3ZJ6Xi9IqIGEEO9uiT2hG9enASVf3JENGio4X26N0oBsF+kJ3rDI8geU1w17Hry7NPOfV8vxBdoztfyyxIZKRYJnAvUgEk5iOu0jH5ibq3zQBdNtbC3f5kNho4hlqm2jjrxeAvFsSPDc2jSQPxTybtDgu8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bHyHgDWH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bHyHgDWH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F9E1F000E9;
	Fri, 28 Aug 2026 06:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787897542;
	bh=Zrw+PWsGve0X9uKYewCtEv3Tkm8K6guAiQGx+evBGKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bHyHgDWHKy3JBDpDObuGYhwUyxlKUOZowYdkf3srx0/+k9mDHxSJ4tVOSp/zcQ2Ys
	 h3GexTUbDjqQPXVcxSwYbZozj9wqPZgUqR6zUGhl/Q7kpVA4TvnUzT3bklXXC2faCT
	 TH559wQr9ATxV03jy1s0QVnMpIgaP9E9eafDA2dI=
Date: Fri, 28 Aug 2026 08:12:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, falemi@asu.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] platform_get_irq_byname_optional -- dwc3-haps registers
 IRQ 0, WARN on first gadget init
Message-ID: <2026082853-proofing-pungent-4e23@gregkh>
References: <CA+0ovCh2o46zgc5Be_Z5=6NNJTKnd3W29zeMJ+gBCgL+4fFLAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+0ovCh2o46zgc5Be_Z5=6NNJTKnd3W29zeMJ+gBCgL+4fFLAg@mail.gmail.com>

On Fri, Aug 28, 2026 at 05:34:05AM +0000, Farhad Alemi wrote:
> Hello,
> 
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
> 
>   https://github.com/farhad-alemi/public_bug_reports/tree/main/149-usb-dwc3-haps-registers-irq-0/
> 
>   dwc3 dwc3.2.auto: Configuration mismatch. dr_mode forced to gadget
>   0 is an invalid IRQ number
>   WARNING: drivers/base/platform.c:492 at
> platform_get_irq_byname_optional+0x1ed/0x220, CPU#1: repro/9498
>   Call Trace:
>    platform_get_irq_byname_optional+0x1ed/0x220
>    dwc3_gadget_init+0x607/0x2170
>    dwc3_core_init_mode+0x2f8/0x790
>    dwc3_core_probe+0x2345/0x2850
>    dwc3_probe+0x100/0x150
>    platform_probe+0xf9/0x190
>    really_probe+0x267/0xaf0
>    __driver_probe_device+0x1e2/0x350
>    driver_probe_device+0x4f/0x240
>    __device_attach_driver+0x270/0x410
>    bus_for_each_drv+0x258/0x2f0
>    __device_attach+0x2c5/0x450
> 
> Our reproducer.c is available upon request.
> 
> Happy to test a patch if that would help.

Again, see my prior emails.  No idea why you are still sending these
out, do we need to set a ban on this address to our lists?

greg k-h
