Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D953F9F56
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542646; cv=none; b=rnb34b9yScmXihYWgRKcuZZvy+UKIAp1xftkgo/3wP5aD/85dsRu66i+GWKnBaB9OeyGMEbpHc++OgQxEVFua2wJd4ckZnTdJDGtT4xVgzboMMlq2eIAGFtwAf57YQXB/CwM3Ucd8Jc0yVS0EPLNp3w46F73uPZ+qrFzqBpoExQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542646; c=relaxed/simple;
	bh=f+3i3lbg/n6uZQv2D+wq+RV9XhNADGcYezGrIj9Du7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N11XuXfeIrjKzRYEAzkCpJFDl7pwHN3TQ3/X08eETVHn0AG5gNtW9eSNlxl36420bvuHhO8hBsWSu/rDWWlXud4xmKFFPy53nW6uh554sVwenJtaW795OPVtUUd87ouzsMryeIUxcWkMy5/jKLyv7gFp0IKDnw6ZkXfVBfmSxSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TY6urqTE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TY6urqTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789542641; x=1821078641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f+3i3lbg/n6uZQv2D+wq+RV9XhNADGcYezGrIj9Du7E=;
  b=TY6urqTElP0iNU93RldjRMbCfDFfWDgyDF9g0hCZnvxBjZ4A/CbOz6CH
   61cAoLzrWKPPXYKtSqcp1PHccxb4Rxj15ZJE8izL3NMGfgTc8EYSQimxb
   Or4sMgEEvQdidbtHniKRKWxIu/4pQWbQmsxY53bn80D2CcCeVnxtAX5Wf
   ZC4lGp/Z10uSoaIKn1mLBQeNm2KzCMaddJD51liycK9jSuEW+z7wcfdO6
   qo2ayjMPna/cVo6qMQyglLafJhsPoJY+HNjRvZ2U66JpidjOF10q7cv66
   8j3d0AhhQ/WtsW2oo+be8N5vJfLu4PVAsRTqJBSu6UBDKDdjwgO2wEBtZ
   Q==;
X-CSE-ConnectionGUID: vOQJE36wTZKjL+cglWinBg==
X-CSE-MsgGUID: XdkyUY9tQZSPgi8VYtKiwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107283258"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107283258"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:10:36 -0700
X-CSE-ConnectionGUID: q9joBhM2Twa/Bt/Qr/hTlA==
X-CSE-MsgGUID: 2bGN/stlSFeeSTfpBr7gVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269979704"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:10:33 -0700
Date: Wed, 16 Sep 2026 10:10:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, andy@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] resource: Replace open coded resource_overlaps()
Message-ID: <aqpA50d24xu8NyGS@ashevche-desk.local>
References: <20260915085353.3518153-1-andriy.shevchenko@linux.intel.com>
 <0D81679D-B746-405C-8333-CF0FF69E094E@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0D81679D-B746-405C-8333-CF0FF69E094E@mainlining.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 15, 2026 at 07:25:33PM +0100, Bradley Morgan wrote:
> On 15 September 2026 09:53:53 BST, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> >+		pr_debug("resource sanity check: requesting %pR, which spans more than %s %pR\n",
> >+			 &mem, p->name, p);
> 
> This swap is not mentioned in the changelog and it does change the
> output a bit: %pa prints 0x1000, %pR pads the numbers to 10 hex digits,
> so the debug line gains a bunch of zeros. Debug only, so I don't care
> much, but a line in the changelog saying the print changed with it
> would be good?

Sure, Will do in v2.

> Other than that, LGTM
> 
> Reviewed-by: Bradley Morgan <brads@mainlining.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


