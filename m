Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227265;
	b=Xksso3jwe/JT2rm8wOoj+wTN1yvKEBu4zGBCYkiwfwg00H3RSQU+CsDs2i71N+/r02+z
	 oOmTAUIJgIQa50lJyeh+fliVc1AgrTK3yGtRcPe4Xa9aBVEHxuML/NCFaMUWTDp/r5/ep
	 LtIulBjzq4TIcNaD6rEWesMqMG/3Vp4oUeQ8qwlfl/DllLBUUFjvLsvD6GDLAgR6tORJU
	 +zZdRHC3mpXo1wVtGFcdN5rnSltBfM10ZHQrAUjmlxBxyZiy3tLWvKhwxeUPr6meWsoTL
	 aIjQdCMsWaYHJp5fJVGGUhtp4QBuuQ3T5GVgc4ed180qIStM2E3tVKXDLxFHq9R8M6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227265;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wQTQ2BlNBlnrIHdGytttWu+xdq4uRYYP4XBnlNM3/o4=;
	b=J+Nii9ZoCeKnJ2zfrfLBgIyIaU+LcXzc1fmmP+GLb/qPX7kgABLnCMicAPUAZsX16r1G
	 e4Mv217o9aU68kSSXvZNfBjlZt5NGI+w15EKvyJxdWUeSCiL51B/XD8qN3eFnUAEfF3Zm
	 ZlsZOFKiRrWIdyqDPyU/sxuW7O58f4bX5Y9pJvxqCwNnTLaWji2SIY1WcYysSCYKTspfn
	 /+s86Dj7LOYsQpjRQjIBYgcGmmmzGfKIMAAxAoTUw8sGbra2qOT/rUX1DYtCYU9Qj3bTl
	 e0nV/B2LmIPC/+dG6rx5mcNm2yhnFoJPGFGUK+Qj4P4g4nBlpYXkRSn9k3ZRfiCH+1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Etw0Vkb0;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BDD606D806;
	Mon,  9 Nov 2026 12:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3BDD606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Etw0Vkb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794227265; x=1825763265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Y8iBSvePD9F3+qWjIlNEwUQcsn2WT6jELLutndCvW8=;
  b=Etw0Vkb0UeWUIK60nXH03UDeuja/TacbKZgjUSb1gO3IE1BjWy4gaQ4W
   Y8xXctMf2NQza20J4m4YfBhLsB/X8bd2VdBbvIoJJFKazPT4zf2IpDLe3
   x0+WtwrYSHRvUS9Cm733f7UyeaFy+9o0YCQp3q8utSnyyVoQbyZOSVrwq
   wCsW/c0pmFNpLzbhJPtLBbosOznTZv/YnnHdYU7XB0PVHze8NU42+8c33
   An0rKoCjOJZxuaxsJC5SlMUq6y5nE7omIM41FXETZ99kvBj1XPqN/cx3y
   eZP4b7Cvas5acaB09R8p4ndTiIVI0PsoJpH+lEZVD5whFDoB54yGvlVzn
   g==;
X-CSE-ConnectionGUID: FSpFOjjvTI2vIEbACqABkw==
X-CSE-MsgGUID: sLw9lFV0SGmChttL2o5mpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2824401"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2824401"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:27:44 -0800
X-CSE-ConnectionGUID: UAcwG4PlRhuWVyFQQFvZDg==
X-CSE-MsgGUID: 47AtnCsMQOK1eFz0IkzprA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8188661"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:27:42 -0800
Date: Mon, 9 Nov 2026 13:27:34 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Faizel K B <faizel.kb@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH 1/2] media: rockchip: rkcif: Filter enumerated formats by
 media bus code
Message-ID: <avG782VCMTWTNax0@mdjait-mobl>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-2-faizel.kb@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105232310.385463-2-faizel.kb@gmail.com>

Hello,

On Thu, Nov 05, 2026 at 04:23:09PM -0700, Faizel K B wrote:
> VIDIOC_ENUM_FMT ignores the mbus_code field and returns all formats,
> although the video devices set V4L2_CAP_IO_MC. Return only the formats
> that match the requested media bus code.
> 
> Otherwise userspace can pick a pixel format that doesn't match the
> media bus format, and then interprets the captured data in the wrong
> format.
> 
> Signed-off-by: Faizel K B <faizel.kb@gmail.com>
> ---
>  .../media/platform/rockchip/rkcif/rkcif-stream.c  | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..f2a24832a8cf 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -395,13 +395,20 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
>  				     struct v4l2_fmtdesc *f)
>  {
>  	struct rkcif_stream *stream = video_drvdata(file);
> +	unsigned int i, n = 0;
>  
> -	if (f->index >= stream->out_fmts_num)
> -		return -EINVAL;
> +	for (i = 0; i < stream->out_fmts_num; i++) {
> +		if (f->mbus_code &&
> +		    stream->out_fmts[i].mbus_code != f->mbus_code)

what about dvp capture. The dvp_out_fmts[] does not have the mbus_code
set.

> +			continue;

--
Kind Regards
Mehdi Djait
