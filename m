Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911233CA4B6;
	Fri,  4 Sep 2026 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509144; cv=none; b=lkwXi1PaU6WGjMa5TvvpOLEvTcV/hjbXtvLRmrz7ia8KEhjabjCu1pON9jjU8z9qwbdhdNzC5q5EhBGDL0EN9fqiiFw7nT2vWYleroebzU7PQcELg8o4nlS9N3EOX/CQ70MOEfZnNLymUy4Kg4FOODlDIQx2ghpoOLD0WtZnGwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509144; c=relaxed/simple;
	bh=CBwpWqLivix064+GNpY0w7aPysbjHZNAwnSdifxjcRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnyIOjZiVFPKafOGEsORdjSwHsyGdwfySunKdrvw5EOLT65ecXuG5v0kZ+VFIYMzg997Z+xizDHbquNmdjH5sVPSnX93eSGu5o+JFKsIDn4kc6JhZq5hhqTUJ+NNlQPltDsNz/ZEJr/gU1bloebRGajJCzi4zIZwGeZDt2XRYrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qw5xNvcM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qw5xNvcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788509143; x=1820045143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CBwpWqLivix064+GNpY0w7aPysbjHZNAwnSdifxjcRs=;
  b=Qw5xNvcMrPXUhnGg8Bk4zc4UO7iBR719/rJVhNshA1UYqfpTyZjDfMn0
   2bhFn+hmeFHbY9EtGGtu44p6gPkz0x29HlI+RfuU9doF4LupiObvDOPUj
   NV3E2x/dpE2Bk2K01kPxHlXGlAMGuf504OwnyA9XtwGPatnhkw4YOIpZW
   Pd+BeLcSUkk+NM57gNNJVKjFZz4OWvBKho+QsGFrInsd381OT7AbVskpJ
   2KfOVxau8hS+PUDdEvnf4znRO43YJADvcepIMyos/rjoW14B6pkP/5irU
   jKobMIPOVQwvzW//5gWLvspqfEiaKYt8+GXENevvJEaFVoZ7tLJK3Czhn
   A==;
X-CSE-ConnectionGUID: Q4BQr4DFRb6V1GuwsbSvtQ==
X-CSE-MsgGUID: 4Trcg4ndQXqDWErnT5O1Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99336449"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99336449"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 01:05:43 -0700
X-CSE-ConnectionGUID: oWqjqV1ZTNyid1s+PRo0yQ==
X-CSE-MsgGUID: 3nG/R/o6TpafVfXgTxYZRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="270511654"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.250])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 01:05:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8BEB61201A2;
	Fri, 04 Sep 2026 11:05:38 +0300 (EEST)
Date: Fri, 4 Sep 2026 11:05:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/4] staging: media: ipu7: abi headers cleanup
Message-ID: <app70tRo2PAELBGg@kekkonen.localdomain>
References: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>

Hi Nikolay,

On Wed, Aug 05, 2026 at 09:23:04PM +0300, Nikolay Kulikov wrote:
> This series cleans up unused definitions of structures, enums, and
> macros. Each one was identified and verified using 'git grep' across the
> entire driver.
> Verified by compilation.
> 
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>

Thanks for the series. As such it's nice to clean things up but a this
point we're going to do it by removing the entire driver within some small
number of kernel releases. I've sent a patch to update the TODO file, too.

-- 
Kind regards,

Sakari Ailus
