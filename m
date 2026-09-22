Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03B83BCD14;
	Tue, 22 Sep 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064340; cv=none; b=FjHylTBu7Ofr4he7d2rhMcFgHc71FayvfvYwmn5g8jrI05hRKvmpx2ObABzZQD5sTiq8z0UbfLnLuYWK3G7HKg99YJL5urSqt5ZiGjSogyvQXMSXXEZujgJmC3O47cicl0iucBIcBlsrkj2pHv7+e1gZTFtX3e7nAb7QrLMS6z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064340; c=relaxed/simple;
	bh=0QwTIdmwCAxvjrZEHrfWv1cVOZ8G4PCuA+3ZQIX9KSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7ezQK2kmJkfabHZaCUXBEJD5p+ne77fUPbtVF/jdAocaGWsNE8DAWbD2zComgvnbTu4trNueCDKjok4Q0/J7DuPFcSFt2F1nikhaeXO5StZ124IZR5t4cKaZ0DypOJpPaBR7aCPFA8Gc6pVpv9beyfaNlfOvIm4Ywrtw9Yp4mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iC7CqQ4N; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iC7CqQ4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790064336; x=1821600336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0QwTIdmwCAxvjrZEHrfWv1cVOZ8G4PCuA+3ZQIX9KSQ=;
  b=iC7CqQ4NBGbaWjFBI85ISESFPhSEYkRhXhSVOLNpaKxTtDzZZdJnxkZz
   i+yjPflWKppgjr3KiLebYf8uATc8PYSwH6okOep/r98sPznlyt03nbqYZ
   M9+KIzlEKxG6fQHiAxWL/zSrm8dxkl0OB5+KIPqBZxUEo01LZNa/V12jw
   kpDPhXWu+jMwxWFoLiVADUSDxEf17unelvC2Cfv0za3XD3pjrNvNYsVBe
   XeZuLtZ6d5sXwWQrTv175sV5w3dg5BfxjK5ilDoX78/CxrVSBapVmBbmu
   wrH65zmKJ79J5SfrgzqpholvK/mGd3PMo4R5xOVtDoeX3kyIoDHv/TvNc
   Q==;
X-CSE-ConnectionGUID: L+dlR9VBR2iyo11B4kf4/A==
X-CSE-MsgGUID: ne3JFkstQwyvBA287ptbXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1147823"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1147823"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 01:05:31 -0700
X-CSE-ConnectionGUID: ihG1UuFzTt6RZGn+QptutQ==
X-CSE-MsgGUID: Lf3IxN49Sy2777xOVRpMZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="272228362"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 01:05:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5719C121B9F;
	Tue, 22 Sep 2026 11:05:28 +0300 (EEST)
Date: Tue, 22 Sep 2026 11:05:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bradford Love <brad@nextdimension.cc>, Kees Cook <kees@kernel.org>,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: ts2020: put regmap_config on the stack
Message-ID: <arI2yHgu5S6GFJb2@kekkonen.localdomain>
References: <20260804114625.2314430-1-linkmauve@linkmauve.fr>
 <20260804114625.2314430-4-linkmauve@linkmauve.fr>
 <arA3TaFiFOx7ubjj@monoceros>
 <arFixwvATR2hkp68@desktop>
 <arF61V7vW3EWZxG8@monoceros>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arF61V7vW3EWZxG8@monoceros>

On Mon, Sep 21, 2026 at 08:45:49PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Sep 21, 2026 at 07:00:55PM +0200, Link Mauve wrote:
> > On Sun, Sep 20, 2026 at 09:46:42PM +0200, Uwe Kleine-König wrote:
> > > If desired you can keep all the assignments here using:
> > > 
> > > 	regmap_config = (typeof(regmap_config)){
> > > 		.reg_bits = 8,
> > > 		.val_bits = 8,
> > > 		.lock = ts2020_regmap_lock,
> > > 		.unlock = ts2020_regmap_unlock,
> > > 		.lock_arg = dev,
> > > 	};
> > > 
> > > > +	dev->regmap = regmap_init_i2c(client, &regmap_config);
> > 
> > I think I still prefer my approach, there is very little usage of the
> > typeof() pattern in the kernel, the only benefit would be to keep
> > lock_arg in the same location as the rest of the initial values.
> 
> If it's just the typeof you don't like, you can also use:
> 
> 	regmap_config = (struct regmap_config){
> 		.reg_bits = 8,
> 		...
> 	};
> 

It's also possible to declare it here and so avoid the cast. The current
patch seems fine though, albeit the variable declarations don't remotely
look like a reverse Christmas tree (not that they did before it).

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
