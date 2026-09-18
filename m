Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E63D48C41F;
	Fri, 18 Sep 2026 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743402; cv=none; b=Sz3Q8svsWf3Pc5rFSRo8dd/76IiEgTTbtlqL63F+ARokjCugjYFtGLcSGGPqzjQfs+SshnpF36XpTOApnFP3uzvfT/VGjH3HeCNoYwYKIqBbMZsH0xPf4kLLKisR4QD4+P+qdI81v/W/uDbWTGIVm3TIOtKyr3WHfMXmIlVtRFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743402; c=relaxed/simple;
	bh=oOIO9pCdAjpASX61YRJnpxEtfvK/jUG4mmonirvTHaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyMlMKitPwh/d1t+YHHQ9txD5vFI6GN8+QdDX+deS1Cts29f4pe4v27QITiTFyCymljsLFEfshb1jZ9qddNMKYFoDxveUXnvMYB3FeFMAQKyLbCrrPrsmhlhn1qG9gLNXBa5a1nmYkdl4govkimCjqLDZnjQKhY8YFF0NKu0UlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKTijAzw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKTijAzw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170C41F000FF;
	Fri, 18 Sep 2026 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743401;
	bh=/jFh4pXIwPDQu3bdIGlolLTFuilh9G4atiKhDaze6Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EKTijAzwYwhPuLw/VM0draKcbRXVxPoaj5ZN3ZwHkmaRR08st4lxCMFuSZtqgPOkj
	 EBHRhB4JMzmTnwCShaf79VXj0d2L+c0CeQGTBti5SsyHZXDlQW9cTJhfESiLLhQmuc
	 nHyBdIv7livMDHd0f7fT9frrHja2iS3XbuhzXSryJIbZc+z4x4/ROkvd3T2Rk900mI
	 Bqc6jjC37E4QjVblwL/fzzAoOFRax5xDLxMpJBFFeA4AbDZ9X6DcSc1nonEF7S+N+u
	 eTClTcILr8AKkviMv0/HtO3v9N0R8TruNbTe1xfRKF89+wgy7OdEsQC2WysR2F0AMa
	 AiU0/MvPLTRWQ==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1x7a10-00000001As0-3z6v;
	Fri, 18 Sep 2026 16:56:38 +0200
Date: Fri, 18 Sep 2026 16:56:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: Support attaching serdev devices
Message-ID: <aq1RJuZw9MLKIMbl@hovoldconsulting.com>
References: <20260917081103.1917665-1-alban.bedel@lht.dlh.de>
 <2026091739-spousal-linked-2a36@gregkh>
 <20260917153736.600061de@OMT-CWNXR4TFW5-LHT>
 <2026091756-unmolded-fructose-a018@gregkh>
 <20260917172152.1b1cb540@OMT-CWNXR4TFW5-LHT>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917172152.1b1cb540@OMT-CWNXR4TFW5-LHT>

On Thu, Sep 17, 2026 at 05:21:52PM +0200, Alban Bedel wrote:
> On Thu, 17 Sep 2026 15:08:11 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> > Please read the archives for why we don't want to do this unless/until
> > serdev is "fixed" to properly handle dynamic device removals.
> 
> All I could find is the "USB-Serial serdev support" thread from last
> year which sadly doesn't provides much details. Like Marco Felsch back
> then I tested disabling/enabling the USB port and didn't have any
> issue, the serdev device get removed and added back just fine. In my
> case the serdev driver provides an I2C bus, all devices on it get
> removed and added back again as well and work just fine.
> 
> I really fail to see an issue in pratice, would you care to explain
> what I'm missing here?

Serial drivers use hangups when tearing down their ports. Serdev does
not support that so the port is shut down underneath the serdev client
while still in use, which can lead to all sorts of issues.

Johan
