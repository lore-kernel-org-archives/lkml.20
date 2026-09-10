Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C5D3C3BEF;
	Thu, 10 Sep 2026 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026751; cv=none; b=Stf83jWTqlsNYGlbGot5Oh00EhguYFSooXS7Er++MjnrIKRBQutP8w5nZZXPT6pLKUqOe1+FhuPFoUOdZ7ettawqaWeQlnf+2y/zgOI7rEmcB4XNYJlbO4glV+Gt4Yp1O2nCwANWbToxX1gv0c/x3JFPonOyQi05Tajq7YfbCqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026751; c=relaxed/simple;
	bh=6ig+RJmKSMuX0TfDCJpsTg1D51WNwnSPX3LkICPhen4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+umHNOqKspTdL47jaVmVOgcLAKXQuctr3a1KfWco0ElEF4TnqKsFoVdjcxnl6rX/tyKEXFMQ2ETbQhMZtx+wb4ODcohR7T7pKyMrJo4erlxmPDKYLsB1Jjs8/ovrTFYf+dg2B/0wQ4AQD4jhbWEOQ/ZJL+3GiTrTaXdCwYHwRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GleWu5xC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GleWu5xC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789026749; x=1820562749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ig+RJmKSMuX0TfDCJpsTg1D51WNwnSPX3LkICPhen4=;
  b=GleWu5xCrBNUS29R2S3njp77jTD130AyPeGVMvBXUbuDcsh0cLYEleZh
   0r04DYddDk0u7dB9matSQQJ4YkWCgPgkwI+yy5+WLYptAYNit1j5zBNWJ
   cd2NxR4hLHEDkCiN+lSBbwzhRSvm8jHesyuKjBO8B4BpIRoWFSgx5A6O+
   ArFM1HO2IDA2RBdlAHVVgZcnp8OB65+xp+XgGt/7KqMagopn0g1bgvajA
   UEO4DNgzooTRFnmdA1qZ2ibff5F+FvCVifPDQ4ywaNIHbgaYq5nv0uV0Y
   5bwVvQSZEh8ehq7B6jHE+RJbEdfiCbl2sFKxFYU1Z99khVFUWCcINo/XT
   g==;
X-CSE-ConnectionGUID: KqO9uUMPT4em4iWyyYdwdA==
X-CSE-MsgGUID: xVFZyQpQQ6GnkN4YnYL+3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106983914"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="106983914"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 00:52:27 -0700
X-CSE-ConnectionGUID: EBGVsO5xTXm0kTZ9gTA2jQ==
X-CSE-MsgGUID: c+PoCrP9TDaaX+c80dQgGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="301454439"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.189])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 00:52:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4683F121BE3;
	Thu, 10 Sep 2026 10:52:28 +0300 (EEST)
Date: Thu, 10 Sep 2026 10:52:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Su, Jimmy" <jimmy.su@intel.com>
Cc: "Zhang, Qingwu" <qingwu.zhang@intel.com>,
	Pierre Pinon <pierre@pinon1.fr>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Vadillo, Miguel" <miguel.vadillo@intel.com>,
	"Yeh, Serin" <serin.yeh@intel.com>
Subject: Re: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken
 1928x1088 binned mode
Message-ID: <aqJhvLZ_1Ld5QHYf@kekkonen.localdomain>
References: <20260904134604.595685-1-pierre@pinon1.fr>
 <ap_YYNDTG7Va4MD8@kekkonen.localdomain>
 <PH3PPF7708D4D9D95D62B6929DEB21637B888B02@PH3PPF7708D4D9D.namprd11.prod.outlook.com>
 <DM4SPRMB0091FCB6C62990275CABC68F9DBF2@DM4SPRMB0091.namprd11.prod.outlook.com>
 <aqJXC9SbhJCz2KFJ@kekkonen.localdomain>
 <DM4SPRMB009141D91C6DCF0987A28C5A9DBF2@DM4SPRMB0091.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4SPRMB009141D91C6DCF0987A28C5A9DBF2@DM4SPRMB0091.namprd11.prod.outlook.com>

Hi Jimmy,

On Thu, Sep 10, 2026 at 07:33:22AM +0000, Su, Jimmy wrote:
> Hi Sakari,
> 
> According to CVS vendor, only the following two resolutions are supported:
> 
> 3856x2176@ linear mode
> 
> 1928x1088@ sHDR mode
> 
> 
> 
> Their CVFW decodes sensor MIPI data and then re-encodes/re-packs MIPI data before sending it to our IPU.
> 
> As I know, it is not feasible to modify any parameters, like the resolution, data rate etc.
> 
> 
> 
> BTW, I am not sure whether libcamera support CVS?
> 
> CVS requires specific drivers (upstream or downstream usbio & vision drivers) and CVS configuration etc.
> 
> Therefore, I assume libcamera will not work with CVS-MIPI base projects.

It currently works with the simple pipeline handler.

The CVS driver should then reject other sizes than the above on that
device.

-- 
Regards,

Sakari Ailus
