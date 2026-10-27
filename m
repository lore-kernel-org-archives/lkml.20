Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116914;
	b=u5q4BxKcwkiw+xNs/Sqd+JaQcz7EIuRR2Ym2WY65XTMgavI4KqNOp82KKP3DNMRWVvun
	 wpwQjmGCpoYGACXlCQjb2dPyv4Y4SH2hl5W89fL4NiDrPRTwGdeNaGb+EfTixcxSi3lFO
	 FfcQZabwBnQKgy8tp3zyidYf7vfzFyTlYTTrOgB5jXaRipiuL2QC+IJGGL26edf8/n0fJ
	 WLgkDOk6DDaNvyk/JhjpJo9XNyscnm9MMoUVyi0Ws919MH0jv3qsP+g82UBoYDlRhaE+O
	 OLw1VlN4CPDP/8MePlOEJN9i+evT1UAxtn/ehvv3bain3Quj1NtchRkDnnvv3uk9aKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116914;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=rbjDumVzw7xNkmXKnm+ohA4f2QmfXRUEd+Vlq04uO3w=;
	b=fZPy8cBMoej0n++AiL5Sj8NluZgAuB1EkHN6F2CgaCwHk2DPQCL07J8tfdN/3jGg2p6F
	 QDd0GPE9T5EnsRbMTLyyHavNEv6izwz6PkZWHw0lkGYUurov3vqjEHSbMJjxH8q6wAlcE
	 9i2UugRYyX/Q5cWe+28Oz8q7R8t8Xokxn/+GF6Z60bL+svAyXsYTPEA2bR2T0hL58EjiM
	 nGlZqAg2/K9jHMaTkQ6LBD9FZ1qoeA2FULBGCSER7BWYLZ1NLbFiVs0Dah2XQvNI94n4F
	 YFvCrq67Q7I7UZIbwW+AQ//ComHybF5hmTPkvdDtF6wanC4dbzptjiw4jjkGtQDIplA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FHcQKrf6;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D991606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D991606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FHcQKrf6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793116913; x=1824652913;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=cnKGQub8k6I5KbpY3IhTo61JJaGvGhoQaELSxpRDWkQ=;
  b=FHcQKrf6MXDaBnyDgaewFkJiiElN/gcnzU0LJzAEQTYsQUzEWbwZVDdu
   CM8Ets65ZziOwgHvU9Yui3qSJFILvgpiTzoq0SGuPtVNBz2Ow2gsQYGPz
   BfIvLhNjC+lLvXF8qhKdfvfet/tlnYev2ITRQ6OHSmuHbSbIQuLV7iy13
   XQw/88xrt/iRzz/Pgjko/yxzLzur9h3XJnyO0Ejo/lG4Qju1mbmc6PZLy
   0eSY3iuovP+/9jKavS9xQqV1L/rjuf8SnxHg9/Bj+QAWRdlFSO7ZMRpKt
   ie+XA7Ws7Cci8S4juD2k/vLS3cbCHtHM4KFy/PNuuu56IpjIeBYOQjojK
   Q==;
X-CSE-ConnectionGUID: erwJSKPhQK+f+k/1vJV91A==
X-CSE-MsgGUID: wxo+btO7Qn2oBxm78Gzheg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1821138"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1821138"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:01:50 -0700
X-CSE-ConnectionGUID: a9rsPqPHQAS3LLJ+C67jpg==
X-CSE-MsgGUID: MTt3iYasReqK6Fb5N0Z01A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6340335"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:01:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: George Karagounis <taterraster@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mail@taterr.org
Subject: Re: [PATCH] drm/i915/dp: Remove redundant link capabilities reset
In-Reply-To: <20261025113200.25097-1-mail@taterr.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261025113200.25097-1-mail@taterr.org>
Date: Tue, 27 Oct 2026 18:01:44 +0200
Message-ID: <5d85c3ed4cf4b8b5e218cc2d1f49b8f44675e18d@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 25 Oct 2026, George Karagounis <taterraster@gmail.com> wrote:
> intel_dp_link_caps_update(reset=true) is already called prior to intel_dp_reset_link_params(), making the explicit call to intel_dp_link_caps_reset() redundant. Remove it as requested by the existing TODO comment to clean up the link parameter reset flow.

Are you testing your changes or is this just using LLM to address TODO
comments in the code?

>
> Signed-off-by: George Karagounis <mail@taterr.org>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index d8c0d9381471..0e753824bc28 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3674,17 +3674,10 @@ void intel_dp_set_link_params(struct intel_dp *intel_dp,
>  
>  void intel_dp_reset_link_params(struct intel_dp *intel_dp)
>  {
> -	/*
> -	 * TODO: Remove the following reset of link capabilities, as
> -	 * this isn't needed after intel_dp_link_caps_update(reset=true)
> -	 * was called.
> -	 */
> -	intel_dp_link_caps_reset(intel_dp->link.caps);
> -	intel_dp_tunnel_uhbr_lanes_wa_apply(intel_dp);
> -
> -	intel_dp->link.mst_probed_lane_count = 0;
> -	intel_dp->link.mst_probed_rate = 0;
> -	intel_dp_link_training_reset(intel_dp->link.training);
> +       intel_dp_tunnel_uhbr_lanes_wa_apply(intel_dp);
> +       intel_dp->link.mst_probed_lane_count = 0;
> +       intel_dp->link.mst_probed_rate = 0;
> +       intel_dp_link_training_reset(intel_dp->link.training);

Please use checkpatch.

>  }
>  
>  /* Enable backlight PWM and backlight PP control. */

-- 
Jani Nikula, Intel
