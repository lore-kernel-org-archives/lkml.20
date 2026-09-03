Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C8B42E013;
	Thu,  3 Sep 2026 08:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424303; cv=none; b=JRrS0u5bzaIymVpGmTU9uTugwhj3v1usDSkblr44wqAsdr0gRdkbej0aUU5PeKpYrrfk+QEVRINkRMvN6srPjxrr17bHFpFreixht4Z15pLBVRhXNe4hBsUg06Eal5x9nWq+GbJZRWNhHubB7YL1smj4IYnEZoAta9WAdQYtoLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424303; c=relaxed/simple;
	bh=s1U6soYiVlbv+O6jw1NLJ8PEdOJTCEPjqZWEPFSpts0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdScHxtAZ2uPuwmgzb4XycuRni0w+19sYgq+7Y4QDCfR+spgR0OZ2EzINa7e2VNNM+bNq+8dwCnWpmH5mncQMjAM8es5Zdv203Vg88Z4dEjQPb0xvrvZGcLOlHLkOGgb93RPFJ//0AwrBWpvoqPBJLtlAT8rPifXPsq3+4a4N80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wPU2Xati; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wPU2Xati"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C7B1F000E9;
	Thu,  3 Sep 2026 08:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788424302;
	bh=dB/JUNRlKNj5J4WWZhnycW1gZeIrGW8FWkFZ2cVN0ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wPU2XatiCRRThJSYAWuqxhCJtx2v/nDSNLn1cQzFayN/EGM/eGKGz57zmStuVqDzE
	 IyL0dgxzVJFeOwA9UoUigsQqIfRfO5Gc8/fuR3RGHMzGjlRxKXsDlxZPHeUppLVhnC
	 W9PKOOSUbC2ZelW/5cENlpJWpRfwajKWl36ftMSA=
Date: Thu, 3 Sep 2026 10:31:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Godana Emiru <godanaemiru@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: document the locks in struct
 most_video_dev
Message-ID: <2026090351-trickily-churn-6635@gregkh>
References: <20260901172055.53889-1-godanaemiru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901172055.53889-1-godanaemiru@gmail.com>

On Tue, Sep 01, 2026 at 08:20:55PM +0300, Godana Emiru wrote:
> Neither lock in struct most_video_dev carries a comment describing what
> it protects.
> 
> list_lock protects the pending_mbos list. Buffers are added by the
> component's rx_completion callback, comp_rx_data(), which is invoked
> from the interface driver's completion path (a URB completion handler
> in the case of the USB HDM), and are removed from process context by
> comp_vdev_read() and comp_vdev_close(). Note that in the comment, since
> it is what makes the irq-safe spinlock variants necessary here.
> 
> lock is never acquired by this driver directly. comp_register_videodev()
> installs it as struct video_device::lock, where v4l2_ioctl_get_lock()
> returns it and video_ioctl2() holds it across ioctl dispatch.

What tool did you use to generate this changelog?

thanks,

greg k-h
