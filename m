Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880273A1E8C;
	Thu, 15 Oct 2026 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057208; cv=none; b=MKnVpWfm1crHRd+xnD0Nn4dZYzDeQ8UmTZ6M2tXBX50oiBFfvGKkqS8sLAC9/n9o7Bk/uw0HRNf7WnN9VYvTGhBQ8wdMXAfEaSDJki2EsBZiqGp6JQKq+nmD81cXS9qDXneHI8vgEk8KyIv3eWfjelRfXyS5UEbPpY7cCh/jlN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057208; c=relaxed/simple;
	bh=Vql5veIP2Vv8QX2vLg2g4Oe2L9kfE6flEO2O5KODlLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iypUC922KEEQe1sNuG19ULcKZl5ezRjC7KEGG5V1meud5TQHtStZNcX7pNAwJ0Jh+gZWIDi64f/4SEl9cuh+R6xUe5ySAGEJO0iTxqA1SZxYUkLOcP2i0fQqdidv6WL/OotF0AZ4jD8UyYjtNZi7K79PSD2fo55vOO5orOoUnvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibzkfLWa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibzkfLWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792057207; x=1823593207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vql5veIP2Vv8QX2vLg2g4Oe2L9kfE6flEO2O5KODlLk=;
  b=ibzkfLWacuVbxNxXuM4vB/4wov0J0bJDmfvn2gx7D6nGeIWdowgfACyf
   9RW4jtlbXD2tgA1WyFIGOdyPrH32id1B3VwdO8N8qA5qUyBMUfTJ9id0x
   ZGdmtr9hCw78jfbh4JcJa5j0MzltckGuuPiH2kVn9H8SIWu1c1K4qqZyh
   ZOuqoxwlGlX64QW1vEdo/dK1F+i9OLOCElIcBXbe0P8ViUH2se4hcuI5v
   rgVip4ovUfo0QuDFKAEeD1X9vgBHyMj5yKbRIv8yBuYhXQL4EShvnISfq
   Md2CqAM3+9p8kAnoDw2mZVyQsz/89COLgiTwuiOdaVtZMCEUx56BYP5DC
   g==;
X-CSE-ConnectionGUID: GxJJhOVfQI+Hw3iB+vsesw==
X-CSE-MsgGUID: B3J0kB0KS5qtthGd03mw9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="823648"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="823648"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 02:40:05 -0700
X-CSE-ConnectionGUID: zfAA5dSjQSeBjvaHUQdNFQ==
X-CSE-MsgGUID: QTnL6Mx3TMa+SyGS66T6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1582918"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 02:40:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6B7E4121BE6;
	Thu, 15 Oct 2026 12:40:07 +0300 (EEST)
Date: Thu, 15 Oct 2026 12:40:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dumitru Ceclan <dumitru.ceclan@analog.com>
Subject: Re: [PATCH] media: i2c: maxim-serdes: reduce
 max_des_update_streams() stack usage
Message-ID: <atCfd-drVomrTS5X@kekkonen.localdomain>
References: <20261014103201.859465-1-arnd@kernel.org>
 <as9okp5GgBgc5Hlp@kekkonen.localdomain>
 <5b26153a-768a-4b33-bda3-19d3dea88634@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b26153a-768a-4b33-bda3-19d3dea88634@app.fastmail.com>

Hi Arnd,

On Thu, Oct 15, 2026 at 08:45:26AM +0200, Arnd Bergmann wrote:
> On Wed, Oct 14, 2026, at 13:33, Sakari Ailus wrote:
> > On Wed, Oct 14, 2026 at 12:31:33PM +0200, Arnd Bergmann wrote:
> >>  			return ret;
> >> @@ -2450,18 +2453,21 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
> >>  				  u32 pad, u64 updated_streams_mask, bool enable)
> >>  {
> >>  	struct max_des_priv *priv = v4l2_get_subdevdata(sd);
> >> -	struct max_des_remap_context context = { 0 };
> >> +	struct max_des_remap_context *context __free(kfree) = kzalloc_obj(*context);
> >
> > max_des_update_streams() is used in implementing disable_streams()
> > sub-device pad op where meaningful error handling isn't possible.
> >
> > It seems there are other ways it can fail but this adds one more.
> 
> Right. I see there are more allocations in max_des_update_pipe_remaps(),
> and max_des_update_pipe_vc_remaps() called through max_des_update_links()
> that could fail as well, and may have the additional problem of
> leaking allocations every time a stream is enabled and disabled.
> 
> Can you tell if those should be fixed as well?

There seem to be devm_*alloc*() functions being used but that doesn't look
like a memory leak -- there's devm_kfree() use as well for the same
pointers.

> 
> > The bulk of the struct consists of the vc_ids_map unsigned int array, but
> > the maximum value VCs can have is 31. Also the size of unsigned long
> > depends on the architecture, so a fixed-size type would be probably a
> > better choice.
> >
> > Also using bit fields instead of bool would save space.
> 
> That would likely bring it under the warning limit, but I wonder
> if there is another way to avoid the stack allocation entirely.
> 
> Are ->enable_streams() and ->disable_streams() always serialized
> or can they be called concurrently on the same subdev? If there
> is only one of them at a time, the allocation could just be
> done ahead of time in max_des_allocate().

Access to sub-device state which these ops operate on is serialised using
the sub-device state mutex i.e. these aren't called concurrently (on the
same sub-device).

Also cc Dumitru.

-- 
Regards,

Sakari Ailus
