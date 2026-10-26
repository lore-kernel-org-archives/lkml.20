Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004507;
	b=LspttDCEHS8LeedwUyzu0TCS06ybYAe4Po/uD45pVDbiapPVxTdwqkjZBRZr8TQK7Xl/
	 fOztg1bcGEQZ1qBJkibKsXJYhu3s4bDLBN6NRE6CaW+ZqnHdb9aD2KES3WVfgSbQr2LCU
	 6tN0gaxtQ7GqiwKh16mn8d45AWZZv1DeDctQMWHToS1AKT3YSyvzP23FHhl8C0mk3JYv2
	 ucbAwuDIfWBJReqPYWWGmVZrozhcLORWVwzmMUOcUydvgecuiDRZuF2HabBvwYvpwzUmZ
	 lILoigBOJ6R97fmu8A+jiToJWwBdbnlPjFpxiitaCR8IKKRH3bPAShBQ7wM35CkPErg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GJIdHUDURKARMVE++829HGtEZJc3Rwdb7GbNiy4iZIE=;
	b=g9uBbC5++XHukLApvEToe64mfJ4Ix2zaYn1ZOS03zW3kCv9TPFD/TWDZOlVcHZeovyAw
	 Khn5h3zPlbbeVRoyHJvpxzy+GN5b1JcYYWrZM5Ipk6RhfyJNabxTqJTp5F+E04fPjNWM8
	 Bu5y6ASro5OcxV+onKPxPyP24vLuTOlIMAHtGUQq4pXfe9OvQz3TrBhJ68TNPICBTf2T2
	 WYPx25LfwhfP2xV55fem/9Po3wB/HdVtpt5u0Psc7qv048e5HN7RVOoD+JGTwf16p0bnk
	 NY0e2Zo4t6y1lt9SzEwtLPi+ktj0RIQUkSfVhJl78d6Ihd0cltqfIwxEqpbKdFM6dag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nnG8nTNJ;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165E6606A31D;
	Mon, 26 Oct 2026 08:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 165E6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nnG8nTNJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793004506; x=1824540506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B4JrJS+LcP/FV0QEPGWYpAcyBST1tsHu+12sGaLYHxM=;
  b=nnG8nTNJM8HcVVkDoFdRmrPcS1MHoleyXNWTp0QEFpLcbqgi2/GtrA6F
   8kk/vDjNVYuaaaxVrKElgCmt/p6ux9bRqR+qtd6ljuj5RMWxmwpoaMmaz
   qTvv2Ab+PjVnQhrTt9lfA6NPiE6YLOo1uLYoJr57FKhOI6O46VSQVXcAh
   V5dDEpPDLfc/cJyMpL0QOkCpD2HKv7lX/0d3AABThHswcT3Y6xQ1/R0ZA
   wiPlRG/+cnIJow022fKaBNjQwzBzRTJMfF5fW2Ttu6eLMJnyCn1+X0PBM
   8StbFEelcTndCiVHQ8tbEnIc40WsSXwMChEF0euGDE/eSDn84X67hq5M7
   w==;
X-CSE-ConnectionGUID: G4a7SrKuRESWyOjKYwJt9w==
X-CSE-MsgGUID: dCBeCYiaT9W9HtAsdc1/jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1549358"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1549358"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 01:48:25 -0700
X-CSE-ConnectionGUID: QxhVh/rjS3iQ9Ac4qObP6Q==
X-CSE-MsgGUID: EAChRZzTSaeF0/CQk7so9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6037876"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 01:48:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BCB34121C55;
	Mon, 26 Oct 2026 10:48:25 +0200 (EET)
Date: Mon, 26 Oct 2026 10:48:25 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ceclan Dumitru <dumitru.ceclan@analog.com>
Subject: Re: [PATCH] media: i2c: maxim-serdes: reduce
 max_des_update_streams() stack usage
Message-ID: <at8T2QchGh_YGegL@kekkonen.localdomain>
References: <20261014103201.859465-1-arnd@kernel.org>
 <as9okp5GgBgc5Hlp@kekkonen.localdomain>
 <5b26153a-768a-4b33-bda3-19d3dea88634@app.fastmail.com>
 <atCfd-drVomrTS5X@kekkonen.localdomain>
 <901b5203-7095-4c8f-8644-bef6847a8bf7@app.fastmail.com>
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
In-Reply-To: <901b5203-7095-4c8f-8644-bef6847a8bf7@app.fastmail.com>

Hi Arnd,

On Thu, Oct 15, 2026 at 12:06:28PM +0200, Arnd Bergmann wrote:
> On Thu, Oct 15, 2026, at 11:40, Sakari Ailus wrote:
> > On Thu, Oct 15, 2026 at 08:45:26AM +0200, Arnd Bergmann wrote:
> >> On Wed, Oct 14, 2026, at 13:33, Sakari Ailus wrote:
> >> > On Wed, Oct 14, 2026 at 12:31:33PM +0200, Arnd Bergmann wrote:
> >> Right. I see there are more allocations in max_des_update_pipe_remaps(),
> >> and max_des_update_pipe_vc_remaps() called through max_des_update_links()
> >> that could fail as well, and may have the additional problem of
> >> leaking allocations every time a stream is enabled and disabled.
> >> 
> >> Can you tell if those should be fixed as well?
> >
> > There seem to be devm_*alloc*() functions being used but that doesn't look
> > like a memory leak -- there's devm_kfree() use as well for the same
> > pointers.
> 
> I see. Yes, that is a bit unusual but not a bug.
> 
> Seeing that the max_serdes_vc_remap array is only eight bytes long, the
> devm_kzalloc() does seem like a very heavyweight operation here, that one
> can just go on the stack and into struct max_des_pipe in place of
> the pointer ;-)

Indeed.

> 
> >> Are ->enable_streams() and ->disable_streams() always serialized
> >> or can they be called concurrently on the same subdev? If there
> >> is only one of them at a time, the allocation could just be
> >> done ahead of time in max_des_allocate().
> >
> > Access to sub-device state which these ops operate on is serialised using
> > the sub-device state mutex i.e. these aren't called concurrently (on the
> > same sub-device).
> >
> > Also cc Dumitru.
> 
> Ok, so maybe the easiest way would be to just put everything into 
> max_des_priv, including all the currently dynamically allocated
> arrays. Since all the maximum sizes are 4 or 8 in the driver
> and most of the structures are short, using fixed-length arrays
> will make it use less memory than the minimum of two cache lines
> per devres object.

We're also trying to remove state outside sub-device state. I guess this is
still driver internal and not visible in the try states so it's not
strictly mandatory yet but still preferred.

I haven't fully read the code so I don't know if it'd be feasible to use
the information gathered directly rather than through an intermediate data
structure that is now the case.

I'd try smaller types now to see if the data structure would fit nicely
into the stack and leave the rest for later.

-- 
Regards,

Sakari Ailus
