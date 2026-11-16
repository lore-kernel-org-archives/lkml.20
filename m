Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834805;
	b=1sCi3zvxq3rzQdIVjv+s+wB0WEgHlVmkfjZYVJyuZG4sH9sjFXn12wNmfFrsHuhpAzAt
	 cz0az2LzddDkQQBB8NtkHJ3LfT32ipOAh/J9YsEgwDMF6Ghcxh0mURTJPGtZ3s6AJo15g
	 7afgN870kzD4EBH/a7GRTZiIOWMrsnFYkL2xJ2Hjj/bTKwP+2MMK24wS/g4nh5ah6xJml
	 uYLuF8n+Ele8uo9VAq3EGZLNXTOMscWe6R4cTuJGKhIB4z96vsL0shGXbYK36BjslJZoM
	 vZi7UPc3QfGj7jkfMcN3UVEZPqpfwekPUcaspsspgeH7xpvt7Zw7HfybCf8rA5GqAWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834805;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=3NziRagd3Kp64mhlLwSQv7c8QW0heczxcZxtep8cF2s=;
	b=KEVpp4OE4OtUxNKpcC4oQwW6I/7limFWN1mzezU98mkEPRZuet6XRGfeN68abJNCyYNY
	 Kl+RibcJydWgTmVYiZ1PPnyWZYNX5yOH4/z9DuK9aXpuPkpFQ5EB8oKSxY7r2v/eQlCfC
	 P3RmUaFIKH0Ksp7eu9Nv4fZZKcKicT6C2tg9/mIKpD/BuNnEy6bUdSI8niHvljiTUVjwd
	 KgdyCh+LHr707s2HIzsVVtB8vSzMsxMzyBrajTvrAI6r2sCaiQ9zXkOR5mAgaeH3+UANn
	 b9pMtFn5bG5G/0jYQ0h7ysVh9nS/97/bgLdA1m3q1QvNPJKJyRvNkgzQfe6dzqM9uYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l+Gnyxh8;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FF5606A329;
	Mon, 16 Nov 2026 13:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FF5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l+Gnyxh8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794834805; x=1826370805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pWEth8krOh4n8bcr9ApMvKZWcSt1+DRZOugxxERJq9g=;
  b=l+Gnyxh8ete85Yn9vxTQmXMzx1xtfjs3h4i/tSvTYDTJfZMZDwbDhoYX
   hJNzJhvlitMttawt8q7LgoJMQ4ZYHFsx/XzGchtFb0yhXDlZKh3jVmx39
   hb2lfywP7OmOFfQJ7sRUesgW0WyyesIwRZ/Y8ebryZwov2rXiUspQE/BD
   Df/YUMLClhtJsGxLmggPxbpmXen+IB7qhbr9cbyIDuxhnYPqwgdI9S8a+
   aowQy1YX/bGJ5MLK9tDfqdTnUQtmFm/JxsCpC3RlmZdPCtBfykgdD2LT8
   ndWLMLH1abVx0HrHThOLAvtGO8rPFsppmGlrkNyi+og+rq4Ehegp8btgz
   g==;
X-CSE-ConnectionGUID: NCDiOHO+RneKXNtSr8lTVQ==
X-CSE-MsgGUID: 41mn++adRVCpgjho14DPgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3610901"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3610901"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 05:13:21 -0800
X-CSE-ConnectionGUID: VPEmmfBLSma1gXFsyAJBiQ==
X-CSE-MsgGUID: zYvmf/SsSoCxFPDyxQbmFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="11338445"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 05:13:18 -0800
Date: Mon, 16 Nov 2026 14:13:11 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Faizel K B <faizel.kb@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline on MIPI
Message-ID: <avsA41bM33cwYfW9@mdjait-mobl>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-3-faizel.kb@gmail.com>
 <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>
 <fxrwhxkzgihpiz52rbeuomtqkzz7izgdfcbux7osamqruc7w7u@qhvh3nkqypro>
 <8c3805ca-0be7-4634-8904-30a9c36d8962@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c3805ca-0be7-4634-8904-30a9c36d8962@collabora.com>

Hello,

On Mon, Nov 16, 2026 at 12:51:45PM +0100, Michael Riesch wrote:
> Hi Faizel,
> 
> On 11/12/26 07:20, Faizel K B wrote:
> > Hi Michael,
> > 
> > On Wed, Nov 11, 2026 at 10:46:43AM +0100, Michael Riesch wrote:
> >>
> >> Come to think of it, TRM p. 2111 says for e.g. VICAP_MIPI0_VLW_ID0:
> >> "Virtual line width of even frame for ID0 path(must be aligned to double
> >> word)." which I would interpret as "it must be a multiple of four
> >> bytes". What do you think?
> >>
> > 
> > The VICAP register summary defines it.TRM part 1 (V1.0, page 2081)
> > "DW - Double WORD (64 bits) access". So 8 bytes.
> 
> Ack.
> 
> >>> +static void rkcif_stream_set_bytesperline(struct
> >>> v4l2_pix_format_mplane *pix,
> >>> +                      u32 req_bpl)
> >>> +{
> >>> +    u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);
> >>
> >> Please add support for the bytesperline field in all the plane_fmt
> >> entries here...
> >>
> >>>      width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
> >>> +    req_bpl = pix->plane_fmt[0].bytesperline;
> >>
> >> ... and here.
> >>
> >>>      ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
> >>>      if (ret)
> >>>          return ret;
> >>>
> >>> +    if (stream->interface->type == RKCIF_IF_MIPI)
> >>> +        rkcif_stream_set_bytesperline(pix, req_bpl);
> >>
> >> Why is this restricted to the MIPI interfaces?
> >>
> > 
> > The MIPI formats all have a single plane, and the MIPI path already
> > programs the line width from bytesperline. The DVP path uses the width,
> > and I can't test it. But I agree it should not depend on the interface.
> > 
> > For v2 I would:
> > 
> > - take the requested bytesperline of all planes into account, and use
> >   the largest for all planes, as the DVP has one line width register
> >   for Y and UV
> > - compute the sizeimage of each plane from it
> > - limit it to the line width field (20 bits MIPI, 15 bits DVP)
> > - program RKCIF_DVP_VIR_LINE_WIDTH from bytesperline, with the current
> >   value as the minimum
> > 
> > Does that sound ok?
> 
> That does sound reasonable, yes.
> 
> > A question on the DVP: the PX30 TRM (Part 2, 5.3) says raw data is
> > stored as 16 bits per pixel, even from an 8-bit source. This matches
> > the width * 2 in the driver. But for V4L2_PIX_FMT_S*8 (e.g.
> > V4L2_PIX_FMT_SRGGB8) bytesperline is the width, so the buffer is half
> > the size the hardware writes. Am I missing something?
> 
> I don't have any PX30 board, and actually it is the first time I hear
> about that. Maybe Mehdi can chime in?

Unfortunately I also don't have hw with DVP and the one time I did look
online, it is really not that easy to find.

The PX30 board I used to delevop the rkcif is a custom hw that I don't
have access to anymore.

--
Kind Regards
Mehdi Djait
