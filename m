Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657431;
	b=rEVTxa1fETZ2jPIpXEPhfbMlsN+Y1/ySTekj7kRF0OItZ0cKH+4Y/y/8I+GfqfuAz3zK
	 YmbY+0kiY5Be8hxZGnYX00s6aGauJ9RcWp6CwSJD9BCPBBO9XKitC5vq5tsZ121VLRZ79
	 om8q8sqUEZpsbewMdCR7qjuZxutIgY+iA6/5QgNVobmvJOPrwWRbfyu2Wd2WlGVO3VJGO
	 Iwu8fAdrAt4ZbenwesLZX3b9MeGP0u8jyH12RTO9ObnhW2w2DvYg/QmgWLlSsm2Lb3l6t
	 GNF+9kbGRopMfyA/cjT9eZRJej4KRZgSYA7AizGn8HGvmW2zKz4uJe0p8bA9IWrscQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657431;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OpCHeT+ItKv8nHJPT/Wkk6sG+p0mmdo47Mm35DWfsss=;
	b=AyN//PUUfZLJveCIy4HF+0HcoP53yyY6vdESuaQ8pPyNfV5CWXgyV34ZGQ2tSgV8dxTh
	 z1k2sOaDIbtm76E+cDjLf5D6gQtwo+onyrRHrt2cqSo+8rFPgd5GkEfVdaiF2thdfji2i
	 hOrKM5c38hr+VKMc+x9eWMQu9lvdiFYkQTq1KhJjsl1pxQvszAD/cNyi2iaixqp70Pjnj
	 2dW/XtWlRH/ARI1UWnOON2KGmNbrN14RkUOwFS2YOYD26qAMUdtC96wGEIEoPp0M9romF
	 27Oqh8wIlVnAPFSg6VXcZID+psfP4YCFudmF/8GHuwZ09qCmE9wk43e7xMloJc51CqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WrdbIvVr;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB772606A31A;
	Thu, 22 Oct 2026 08:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB772606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WrdbIvVr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792657431; x=1824193431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZIMvMdbRto9Du0/f4ZPVVv9EYhNM7Ia3Zy1EH0bmMjo=;
  b=WrdbIvVrvyNA5S14B9o/6hnA5F8e/iQw/V40x40M7XPdKjgmt2hUZffA
   XUkQZLUZOxgU6yEfyo4nrLCVXcmLRmPj8plitFCsICTq7ALLpR8pIzNov
   mRlg2IOTCA4bMf/hC+WtNOE190vTRH1UGVM6quY0963ggqXucXUG8SXhy
   yJTm4zYBruCnKjaceuFulakXlldMEtBYdP+R6cGTcW5Mcmtfuczk7WUQ+
   wrTC7fGh1Q3/lViyfld3sTc4t0x3xSVPlwRBHjBjBrcFfcDQiMHbb+KJ3
   e5SBqAo+XVwBBIEBuDroP+y3KqjpJ5gJtPGsPYwYsEuqSzOW4WedgFyHX
   A==;
X-CSE-ConnectionGUID: sekE5jLdSBaIQrMP2dkRuQ==
X-CSE-MsgGUID: +htILlBSTsWKOQt7M08x2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1300282"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1300282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 01:23:48 -0700
X-CSE-ConnectionGUID: SrynGbDCRLOq4cnYO1pLrQ==
X-CSE-MsgGUID: RPPb7y7MRvCubn1VDJQ4Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3380062"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.230])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 01:23:45 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 10C39121B7D;
	Thu, 22 Oct 2026 11:23:44 +0300 (EEST)
Date: Thu, 22 Oct 2026 11:23:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 04/16] media: sony-starvis2: Parameterise the
 configuration to allow for other models
Message-ID: <atnIEKiroIEUlPe8@kekkonen.localdomain>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-4-75fcdb4163f3@raspberrypi.com>
 <atc1us1fj6MN6UfF@kekkonen.localdomain>
 <CAPY8ntC1dU9r7Ku890b5cqpH5LtQkRFS68dVkYbe0FtVXG7GiA@mail.gmail.com>
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
In-Reply-To: <CAPY8ntC1dU9r7Ku890b5cqpH5LtQkRFS68dVkYbe0FtVXG7GiA@mail.gmail.com>

Hi Dave,

On Wed, Oct 21, 2026 at 02:59:16PM +0100, Dave Stevenson wrote:
> > >       starvis2->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
> > >                                            V4L2_CID_HBLANK, hblank, max_hblank,
> > > -                                          IMX678_PIX_PER_CLK, hblank);
> > > +                                          starvis2->variant->pix_per_clk,
> 
> And that IMX678_PIX_PER_CLK (8) is changed to
> starvis2->variant->pix_per_clk, which matches the change above.
> 
> v4l2-ctl --list-ctrls-menu with imx585 is giving me
>             horizontal_blanking 0x009e0902 (int)    : min=544
> max=520424 step=8 default=544 value=544 flags=has-min-max
> and with imx662 gives me
>             horizontal_blanking 0x009e0902 (int)    : min=1034
> max=194669 step=3 default=1034 value=1034 flags=has-min-max
> 
> Are you seeing somewhere else where the step is set incorrectly?

I guess that must have been somewhere else indeed. You're right, there's no
bug here. But probably somewhere else there is one. There are too many
sensor drivers. :-(

-- 
Regards,

Sakari Ailus
