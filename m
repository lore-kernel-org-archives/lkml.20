Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57B03E3D9E;
	Thu, 15 Oct 2026 19:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792091253; cv=none; b=eNwSsb9dYIosiob2ql83Z8/FXt+ieqUfF1vE1Lo1C9fTquTQ+UCSup0vQJ0oAscqwiVdrBylqakZEpf/aFzRLQurFNjDI1o0mGGMBpFkRYDNpoPAzr8yNZuxxOvhpXsHVnTeLQXEOaXD7+brzWp6lHVsyE5Dt6kO8jty2k6XGWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792091253; c=relaxed/simple;
	bh=/hB2yFo72mINFrziF0khq8oQoZAxWzMryyi7T0djCas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtkwjInfCMRpaSVJW6wpMhGQmSBbaxzC+nzDsB4kEspaGiA/pg94Y1T02zNw60mdWMfGKxzWzUUQeGg4YqLNmoPiS0PXwyny3AMI+des6FcrMx5dLI9r7UWm1O68hsEqCmd8S4pyFjz8yHElVBM4Jm9iiXPgPmonfQUe7meEoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyerSYqK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyerSYqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792091252; x=1823627252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/hB2yFo72mINFrziF0khq8oQoZAxWzMryyi7T0djCas=;
  b=kyerSYqKsFPxtqRjR7YJXX7mov8SysxrcG2aE6G54I7h0TaRl2F/d5Rp
   azxr9Hy5e1NcMS9CWj4GuVGuX5LOrPRpOdmU6DY7ALGypvGqVGAB5boFt
   4xtR/PBVgdsocEfcxOyQWdUrkILAMkG8EZ92tLCKqaaPQGgHHDarJCn7t
   nV8twCBcDNdfnHlcFRay+jozQ5FRjcm7vYiXBkp3SX0EBYCjfacy15aPN
   po3t8LUworYwEKKexlNRVpaL1G4gmTjs6IKiyOgO4fa+up2mHA6P68YXf
   aIcYGAVoIWrDHtSOTVuW4qRhlhbklPmHKFmxVhiacutV8rV9gSD+vd4Tx
   g==;
X-CSE-ConnectionGUID: 3sA5HHTvThCHRav1NFY4og==
X-CSE-MsgGUID: T1n+WgYtTV61VJ0JA45I0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="883244"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="883244"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 12:07:32 -0700
X-CSE-ConnectionGUID: BdlBH7qKRWm3gk2OiuTV4Q==
X-CSE-MsgGUID: JfEAlRDkQnSmQmRakWnzxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3548324"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 12:07:28 -0700
Date: Thu, 15 Oct 2026 22:07:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: John Singleton <johnsingleton@google.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: media: atomisp: Fix parameter indentation
 and block comments
Message-ID: <atEkbryDswpLe-iT@ashevche-desk.local>
References: <20261012161322.930099-1-johnsingleton@google.com>
 <20261012161322.930099-3-johnsingleton@google.com>
 <CAHp75VdjeG2kNzfRRAmHZp=++gOz48ifnKMCu0oPK=nZBewHPA@mail.gmail.com>
 <CAJEVk_GXoHRr-dEZZu2xz8Jk-vVyowJfmqbuGk3fcdQ05TWjag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJEVk_GXoHRr-dEZZu2xz8Jk-vVyowJfmqbuGk3fcdQ05TWjag@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 14, 2026 at 09:20:59AM -0500, John Singleton wrote:
> Thank you, Andy. Just to confirm from my examination, I think the key
> issues are:
> 1) There should be separate patches for the comment-cleanup and the
> function-header cleanup and
> 2) The preference is to do this for all files in a directory, rather than a
> subset.
> 
> Is that a fair summary of the concerns?

Do not top-post!

Not only, the similar patches were sent many times, you need to collect
preliminary work and come up with the best solution out of all.

> On Mon, Oct 12, 2026 at 2:05 PM Andy Shevchenko <andy.shevchenko@gmail.com>
> wrote:
> 
> > On Mon, Oct 12, 2026 at 7:13 PM John Singleton <johnsingleton@google.com>
> > wrote:
> > >
> > > Replace leading spaces with tabs in function parameter lists and
> > > format multi-line comments according to kernel coding style.
> >
> > Please, read the mail archive to understand why this patch is no-go.

-- 
With Best Regards,
Andy Shevchenko


