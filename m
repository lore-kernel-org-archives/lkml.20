Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EAA3F788A;
	Sat, 12 Sep 2026 16:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230315; cv=none; b=LLTMuvN5txwmdOjGWqZ8/fcu8LWBYVz2crmBUxt7eWoMOEss6CourCkGxrnFzhRCUYHjaaQrutTsoxjWwgru6xe2X7G4KewVEF/nhclWFsbXxpu5Mk6uKBuv+PEFQy3LQWBifn20AZMbqm9fWPD4jnirEqHFWH11AUocJNjDWsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230315; c=relaxed/simple;
	bh=5EcGdTK07kJZaKvVBPpcTN5PTQDeFvr5AXf65PftjqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=El4Vf7wG+hhRR76JfhM6SEhK3nZlnOIk23SAqLPsKRjds6mW2PUpBNBqb1w8eCoTYd00DdHj/PDv7yu3yTksACLzZfEH5YKKARvBHIvzLYA/STn0g4At7hm7kb+O7jU2K7FFcfLmh6Pgrbg6mFbd3khaFZW+RJ0okeuXWpNBgt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jdlRXLv9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jdlRXLv9"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AF824DC;
	Sat, 12 Sep 2026 18:23:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789230202;
	bh=5EcGdTK07kJZaKvVBPpcTN5PTQDeFvr5AXf65PftjqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdlRXLv9tzLMmOPKaweCayQS/Xl5Kiara8s5Ew3K4B+QoGBg19qaXwRnlukfoSMEv
	 EPdcj2Ubuee1QYGAsAXuykpv2OfDmMPOVEK/zn16r6nWrz7BGNW76eHyqnQi5T4bw4
	 xPsKwJdBftIYrIPqn0kmg9aKYLdkok1SUIzrPqKg=
Date: Sat, 12 Sep 2026 19:25:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Fix media_entity_operations
 references in kernel-doc
Message-ID: <20260912162500.GZ1892234@killaraus.ideasonboard.com>
References: <20260912055850.39828-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260912055850.39828-1-kmehltretter@gmail.com>

On Sat, Sep 12, 2026 at 07:58:50AM +0200, Karl Mehltretter wrote:
> The kernel-doc comment of v4l2_subdev_link_validate() refers to
> media_entity_ops, which does not exist. The name is
> media_entity_operations. Say media_entity_operations.
> 
> Fixes: 5fd3e2412ade ("media: v4l2-subdev: Support hybrid links in v4l2_subdev_link_validate()")
> Assisted-by: LLM

Throwing LLMs at this kind of things is neither a good use of computing
resources nor a good use of maintainer time. Please refrain from doing
so in the future.

> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  include/media/v4l2-subdev.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d256b7ec8f848c51416cd1b62ff931ddc4feb4fd..6c4a0a6334e8e210c5da48527c1ad514568bd633 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1236,10 +1236,10 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>   * width, height and the media bus pixel code are equal on both
>   * source and sink of the link.
>   *
> - * The function can be used as a drop-in &media_entity_ops.link_validate
> + * The function can be used as a drop-in &media_entity_operations.link_validate
>   * implementation for v4l2_subdev instances. It supports all links between
>   * subdevs, as well as links between subdevs and video devices, provided that
> - * the video devices also implement their &media_entity_ops.link_validate
> + * the video devices also implement their &media_entity_operations.link_validate
>   * operation.
>   */
>  int v4l2_subdev_link_validate(struct media_link *link);

-- 
Regards,

Laurent Pinchart
