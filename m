Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10403A59A3;
	Fri, 18 Sep 2026 17:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753897; cv=none; b=FvE74xq3azo1lgxOcy2HAhXK6u1PKDPcl4TtO+TL0UKhu2MDsfaYoM2u2XuQ66t6p681sV3d0RDTK3qbtvIgnoU6rnHZhJkdj4+VpI7h23MMTq7N+wdfTR0FHVfNdaLDDBV0l5nyYCXROyFsmPKb9GGUtruTgWHcniJkoRLTO5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753897; c=relaxed/simple;
	bh=uoQwKbBnyLwRMO40qRLvwT+NMsnkuXSfHgdIzhnQ13w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EB+YTqLdLHnYsc7nqS/r/ht2Qx6EfweXaFLZn5hpBxTPjUJv3vxfPvGd+kr23iTSiEofe1jiustDuqZc38RIO1pcKMasvLOPUQcSwpfvq2/FZSOwMkEvEP8VW2Cxdy9BbyNm95WyEp9nBEwCGQctdhmpy9IxBrEmRXdJjN7h3IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enaMoN+F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enaMoN+F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F351F000FF;
	Fri, 18 Sep 2026 17:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789753888;
	bh=olch3WWvnNqURyGe2D4RLU0hQ/8jCIKXb6iPdnVjxJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=enaMoN+FA3FdlQJZTLUkI0UHY4sPnebKA8ahX3RcJxyRhrQsWvhF77Hzg/u01ZBFu
	 phw6i974mM00IxsZN3ZYdSrpnP3Jtx6XeKjFOCaeCXH4wHJPqGEkgg1g/ztCXY5mQZ
	 XhcZVGB4+s4HvaRUfcGIui/ZcWvk0VYECPEQJRivJd8TVRRwt1h2WvPUQbw8RUYDwp
	 Ox+ojPu0FlvovYeiWO7IO99jZnNcTsWVHEUVzTnlKW6qML4VfxjZ0T8BSrp6gX6l3n
	 9CJ2PIyyUjcKmFbSOFfr5PK/FCOvACKo/tiwV7f2i5iDp5JU9x8EgWaeGnI+tEQ8vO
	 vHm0N9Cj3a8Pw==
Date: Fri, 18 Sep 2026 23:21:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>, Kees Cook <kees@kernel.org>,
	Xu Rao <raoxu@uniontech.com>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] media: m2m-deinterlace: replace direct
 ->device_prep*() calls with standard DMA engine API
Message-ID: <aq16HJ7v9LWuHJ2V@parshuram>
References: <20260918140225.2027053-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918140225.2027053-1-Frank.Li@oss.nxp.com>

On 18-09-26, 10:02, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> DMA engine consumers must not call the channel's device_prep_*() function
> pointers directly. Use the standard dmaengine wrapper APIs instead.
> 
> Assisted-by: LLM
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
