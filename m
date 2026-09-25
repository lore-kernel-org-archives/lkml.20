Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA8A44062F;
	Fri, 25 Sep 2026 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334108; cv=none; b=KQUfl2I03ybj4kKWgSwaCRqugMYzXD7w1qlzmRhAfrE8So0S+8OZohQznjGMf2teyRt1MrPuoW4zOSe1BcZ55iDGsHrKCPiahfofBs6Btm7xHhwqw/F2ugX2/3YWDubhsqvfYdUPxBWofy6P/7Ku3zdp3BVYRA23o4d6bTSkeXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334108; c=relaxed/simple;
	bh=U2NW6+6rMBKtAViC0vcsVHJyw7UjYvFnlrO/aBdcUf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyUVw/yCVkZHVez790rSclM4X6wMSAuzBaNRiB0Ak3Km++1Wy3ef1iu/RNi6+56dDGfpXASaey2Q1ruNaYDOEjQ/Z4HHBD8r98OHyeEi9xTKcPDuGDf2NEuIB4ECRyn17uWRb5lzGflubpD0psApuyhcrRjJ6+3S3l92VgUpDOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGKlod2r; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGKlod2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790334101; x=1821870101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U2NW6+6rMBKtAViC0vcsVHJyw7UjYvFnlrO/aBdcUf4=;
  b=JGKlod2rLEjShtdxQAyDdJaytcOJwi/DHGimn5COcR2PXrG+IJBivF/R
   XKLj8sBhSQNookYUmVPtVxQtCUo3R+B2sqpwlMmSGuILI5h+qQVI3uWbE
   cdXCmqv5gnuC90olvg9Stuh1VrLH74jsDlfVyejsrKBCmU5JBraZNQOfv
   0hSzaJGTMMiyNta1mgx6waVDySIKmGQhDCtSpkMvK1MyWSP7AGN9kj6lC
   GAgBXLWaaY7AJmEz1ni0+2R1YmT5VneHesJSixo7kv/3ZEjoH1HqT/xWw
   fZWj5+7tVM1nj8nVKnjJi1j5u/6mr8TgYgxbz/rRTju8kgqI2c5ZjFa+n
   Q==;
X-CSE-ConnectionGUID: Ntjtkv8PRsWv020TU3eozA==
X-CSE-MsgGUID: wmniU+AYTmyqlW6JdJljuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93613830"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93613830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:01:34 -0700
X-CSE-ConnectionGUID: mR3ksB0vTmu/dmSpubYufg==
X-CSE-MsgGUID: Xw8t09+mSaCjEL3Z/aa70w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273540301"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.84])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:01:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 15E6B121BA9;
	Fri, 25 Sep 2026 14:01:33 +0300 (EEST)
Date: Fri, 25 Sep 2026 14:01:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ginger Li <ginger.jzllee@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5648: Fix a data race on state->streaming
Message-ID: <arZUjd5QIs85m_Wh@kekkonen.localdomain>
References: <20260923015631.44973-1-ginger.jzllee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923015631.44973-1-ginger.jzllee@gmail.com>

Hi Ginger,

On Wed, Sep 23, 2026 at 09:56:31AM +0800, Ginger Li wrote:
> ov5648_s_stream() updates state->streaming after it has released
> sensor->mutex, while ov5648_resume() reads that field with sensor->mutex
> held.  A concurrent resume can therefore observe a stale streaming state and
> leave the sensor in standby while the software believes that it is streaming,
> or the other way around.

Please wrap at 75 characters next time, I've fixed it this time.

-- 
Sakari Ailus
