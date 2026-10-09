Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5A93A2E2B;
	Fri,  9 Oct 2026 09:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539294; cv=none; b=WNrWdbV6Xb2w9x4zLjSEPDUsMgCjhHeicQ8I/kdgaPSJrwjdln8TPYHRiF3AR5bKoE+sBG1Gg0HcuGCetlsPmJwvkuc3tegNAx4mMTrnG++nQYcPG9ee44EMsrRWukBP25zuW4Gh8n4Nc6QmXiq3R/mjQzQ8UPO13c3zlRtE3K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539294; c=relaxed/simple;
	bh=yRGQBbXNM6cnPeq4lhKvA+f969iiMzso1I1B5mUvomU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0O0+TZDT+muhyMdVbQULXGvhLhlCFd0dQa4ThLX0tfiOiEs5ci98eGf3ubNO2QGqiR5NoK9UIqYC5NE+f1P9Y00EgYpOWkZ12Nzz6bhn/m22viLxZ+2+VoYx0iRBF+ktBVVbNwdau9OK4dt59EEVXWIFGRmYSRTJQ+iK3lHdH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jZhD9si2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jZhD9si2"
Received: from killaraus.ideasonboard.com (dynamic-2a00-1028-8389-0276-8139-a635-2d39-b80f.ipv6.o2.cz [IPv6:2a00:1028:8389:276:8139:a635:2d39:b80f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A58F424A;
	Fri,  9 Oct 2026 11:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791539172;
	bh=yRGQBbXNM6cnPeq4lhKvA+f969iiMzso1I1B5mUvomU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZhD9si2yg8zSJNwrICMvaI6lT62plC4S9OYrWoGUXN2r66IJyzjGFOOnhwPCn4o6
	 Y2Hyj0AutYiXopjvooGa8BdkIiC7a96j+dPTj1nsL95m3OvaE01YntOaw+1sLaLfaL
	 XbhfdJoY7qj6qlsglpt//Tld7ufMI4jYpCNcF2wY=
Date: Fri, 9 Oct 2026 11:48:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicola Fiorillo <nicfio@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org,
	hverkuil@kernel.org, ngocthang2710.1999@gmail.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: v4l2-subdev: Fix NULL pointer dereference
 in subdev_open()
Message-ID: <20261009094810.GA716311@killaraus.ideasonboard.com>
References: <20261008042600.275884-1-nicfio@gmail.com>
 <20261008042600.275884-2-nicfio@gmail.com>
 <20261008054842.GB683793@killaraus.ideasonboard.com>
 <179144316198.13032.1846729931094664641@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179144316198.13032.1846729931094664641@gmail.com>

On Thu, Oct 08, 2026 at 09:06:01AM +0200, Nicola Fiorillo wrote:
> Hi Laurent,
> 
> Thank you for looking at it.
> 
> On 6.12.86: agreed, that line does not belong in the commit message.

Why was it there in the first place ? It gives me very little confidence
on the quality of your contribution.

> The runs that matter are the ones on media next described in the cover
> letter, and those are what the commit message should have referred to.
> 
> On the fix: agreed as well, it does not fix the problem. subdev_open()
> now goes through vdev->v4l2_dev->mdev, which is only valid as long as
> the driver keeps the v4l2_device and the media_device alive. vimc does,
> through its v4l2_device release callback, but ipu6-isys embeds both in
> struct ipu6_isys, allocated with devm_kzalloc(), so they are freed when
> the driver is unbound.
> 
> I checked this on the IPU6 tablet (media next 9cfc1aca0781 plus the
> sensor drivers mentioned in the cover letter, without this series):
> with the media device, a video node and a CSI-2 sub-device node of
> isys held open, I unbound isys, then issued one ioctl on each node and
> closed them. KASAN reports use-after-free in v4l2_ioctl() on the video
> node, then on close in v4l2_release(), v4l2_prio_close() and
> v4l2_device_release() on the struct ipu6_isys allocated in
> isys_probe() and freed by devres at unbind, and more in subdev_close()
> and __vb2_queue_free().
> 
> Patch 2/2 rests on the same vdev->v4l2_dev assumption, so I am
> withdrawing the whole series rather than keeping half of it. The
> underlying issue is the lifetime of the objects in the driver, and
> that needs a proper fix along the lines of what Hans did for em28xx,
> not another check in the file operations.

-- 
Regards,

Laurent Pinchart
