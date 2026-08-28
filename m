Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FF03CA481;
	Fri, 28 Aug 2026 05:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895939; cv=none; b=ZwMTP9qRhtbgNC+hLptze4ahkRtcBKT8nMTutJrqolzgL5vGAYZd5TDBIgKThRes+L20bRgXCluJmTJtasXlVfmXutPdsCA/uk5WS3tGsHPCFepFMJaxBfnZzPp9ZHwJ8zIco+rAJxbnGFcXJwjcjNDuzuI2xfvAOcYx8yfhvWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895939; c=relaxed/simple;
	bh=hUV/KjrY8fo7ZKGnxXAXZbcqEoUZlRt2hrAcV1t4j6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uG6ax/D4/A7Ek34gfJthO9EaU6r4p3obTDmwP5dTSdSggNeeGqKwOXUsb8Cj0nj6QCJajYZh7332QDGEP47sJ+9TYDByVXoe3j/PmkMDtz/jXCBDA5PakyhQPOI1gKgFZxHTHp/On5+Id9w5TVw0mYiatCypmziYJHCPZNU6whM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QnpOaL3a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QnpOaL3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCBC1F000E9;
	Fri, 28 Aug 2026 05:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787895938;
	bh=t83oAOUbyAv4w2doI/vnkGuH77V6ZSnrl3EO9OJrlTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QnpOaL3a/Aaq4F39vAU0hiVTvG14mtxrb6CIyhxedEsltIlWnFbb37BuEZDTdiMtp
	 z9eIZRwft2t58UrwHh/MLMi+1uTpbMf78cz1jRyPdBElccRzbFwqLM8G8Ai0/E+8He
	 goXFSZBpiVJ9ha4dAQkoFMCNqpD0J1jNBWE2FIuA=
Date: Fri, 28 Aug 2026 07:45:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, falemi@asu.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] platform_get_irq_byname_optional -- dwc3-haps registers
 IRQ 0, WARN on first gadget init
Message-ID: <2026082856-exhume-footbath-5a28@gregkh>
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

Digging through random urls isn't that helpful to us, please include all
of the needed information in the email itself.

Remember, some of us get 1000+ emails a day to handle :(

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

Please send a patch.

thanks,

greg k-h
