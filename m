Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4093444781A;
	Tue, 22 Sep 2026 08:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066133; cv=none; b=J7r/EgriI7XsYYDNIc0rxJ//sLLI3MEe6XonCSZ9T73coE+tdCSm0OUSIPOs95HFPAZk01WBfPBPTzt4wyXw6YBIaJubpjjbLZ58Lcw1JjqxaznzyCAO08w9XYK/IGgqa8lKQp/vqXviHRc5jqW/iwP32O6sTfh9icv/Mv+yatE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066133; c=relaxed/simple;
	bh=PFJ5cbvBhuGbsuvIYuwyIRmkF4QP1dZIQIUdAft9dTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUTAqU40fwiePNRRhbI2KiTuhE7QbKRXnMxAM676oCOVg76ksyQm8cCNk0HAkVdalf3qG2KseSROQC+XF7ROQCYSMeTgOf8abPeCQqICbYmjdx5qUCNDkPyI+J/Xj7u0us9ZLokyVT6iEZGjQB9zJ2fndBL5fkaOGWLLmfpMFG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COl+MM23; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COl+MM23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790066131; x=1821602131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PFJ5cbvBhuGbsuvIYuwyIRmkF4QP1dZIQIUdAft9dTc=;
  b=COl+MM23YwsG4rL8tLclADRaTBDfZ134VaXlxKgfTiLyyNl1YJvzoSs8
   V51pdBKMN4zCXfl4id3maHp+BjI0fVhEVeACe8OUmsyYoHmTaykJDz9Mk
   AyIZGcIGQ1+4jjaFI/sFr+0Lda13h5xDNmJ2yIBCjXntYUeB9zYCZwvlW
   fyjIg6AvI4h69zceaygajO/F8/YQsvDsSHUS/Ya7d7hHccbPw05h+LohE
   CCfJen7wuD/aTtlCIribVArZdg1rHTFtBTnzc0wC9by3c3dO0i38CmaeH
   vNQHcZccWSV2868WKRwToMlVbAsz2MI5xEMmRJAJs/vxQjzGZZGJK+v7+
   w==;
X-CSE-ConnectionGUID: Db9l3tI/S/qU7hoaQd1kdA==
X-CSE-MsgGUID: mBOzyx42SsSOh6nGXq4H9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="94479754"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="94479754"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 01:35:30 -0700
X-CSE-ConnectionGUID: dJFIMR0nRIyf76s2CH9EyA==
X-CSE-MsgGUID: XIQgx+JzTmuPswixge7KWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="271580943"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 01:35:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 64336121B9F;
	Tue, 22 Sep 2026 11:35:28 +0300 (EEST)
Date: Tue, 22 Sep 2026 11:35:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, david@ixit.cz,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: imx355: reuse existing CCS defines
Message-ID: <arI90AxJJ2zHK3AT@kekkonen.localdomain>
References: <20260827-imx355-ccsify-v2-1-3a97bc708315@ixit.cz>
 <178847463591.4073535.11299899376239571707@ping.linuxembedded.co.uk>
 <178850538534.11722.13162391406704193341@freya>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178850538534.11722.13162391406704193341@freya>

Hi Jai,

On Fri, Sep 04, 2026 at 12:33:05PM +0530, Jai Luthra wrote:

> the datasheet's recommendations at more than one occasion.
> 
> Do note that IMX708 and I assume this one too is not *actually*
> CCS-compliant, just similar enough. The CCS_R_MIPI_CCS_VERSION register
> reads 0x0. So we should take other limit registers with a grain of salt.

Indeed. As I wrote to David, the limit and capability registers are often
where the errors are and this is one of the primary reasons why we have CCS
static data: it avoids having to put the information to registers, which
cost time and (€ || $ || £ || ¤). (The last one is obviously a squirrel
skin, which was used as a currency in Finland in historic times. It's very
nice we have a character for it in ASCII.)

> 
> > >  
> > > -#define IMX355_REG_LLP                 CCI_REG16(0x0342)
> > >  #define IMX355_LLP_MAX                 0xffff
> > >  
> > > -#define IMX355_REG_X_ADD_START         CCI_REG16(0x0344)
> > > -#define IMX355_REG_Y_ADD_START         CCI_REG16(0x0346)
> > > -#define IMX355_REG_X_ADD_END           CCI_REG16(0x0348)
> > > -#define IMX355_REG_Y_ADD_END           CCI_REG16(0x034a)
> > > -#define IMX355_REG_X_OUT_SIZE          CCI_REG16(0x034c)
> > > -#define IMX355_REG_Y_OUT_SIZE          CCI_REG16(0x034e)
> > > -
> > 
> > But when a whole block comes out like this - that makes me think perhaps
> > the crop control or fmts might just be a common function ?
> > 
> 
> Indeed common helpers should be possible for typical ops for crop, formats,
> bit depth etc. I've already started working on something like this for the
> common raw sensor framework, but it should be possible to also handle the
> register writes for a whole "class" of sensors like CCS, Sony-CCS-similar
> (like this one, IMX708, IMX576, IMX519, IMX219?) and Starvis series etc.

The imx519 can be controlled using the CCS driver, probably quite a few
others, too. If you need dynamic control of something that doesn't exist in
CCS (I'm talking about semantics, not register address), then that possibly
requires quirks in CCS driver.

-- 
Regards,

Sakari Ailus
