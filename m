Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD7457C70B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969482; cv=none; b=sPY9B5gp4NdOXN/7VDNzjMMX8IxR10+sQgiTecaaXEFOdgzWTdvA+YwQw2T6HL18HygR/5DQ07nPHo2Ez4+RrJWs5exOrtacLGrDCVrRnX2GFcgAk8zTZQI+mdAwEl/AKcXzxslO5e7xUWSNeP3bm7T9PFfOqv67j/IVPcvxQig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969482; c=relaxed/simple;
	bh=cbDBndLD0r2payapstoz7DgAfghRCbvI5tIkdP+SShA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MDuxw0OQMRShe/sEKQ4ml3eqikYARxx8OSuJZxVVdE6ZK133U7QY4g6kfP6QtwzHjGCKtDJLpwUgZQRlg6tpkWOnwUKBsTFy0y/9Xqryb4+g8PpAqgHIW0A9U+iUKxiSKEve9lKQNq6GRmhqnrM+zsI2TZROJ7JKBZMxrPHaWQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8BabzuM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8BabzuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788969481; x=1820505481;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=cbDBndLD0r2payapstoz7DgAfghRCbvI5tIkdP+SShA=;
  b=N8BabzuMWHm+KQkL21xijUYylik9ux4+fRc11j1MqRrF/jHFEOPfX7o1
   9JV0QtlB5ZkgfIMq4bLvhcHZYpr463QuoZuVviBhQbNxrbAnzvjdRRqCj
   sJ7Z6p9VoEK2OUmwDoQyRxCOAuC5sJUN6MfYhtnHzrgy8nR/t7ZO91oFQ
   oD46K5ZFkzyN9CU9xfU4nLfsTqNfsJHDc5FLFoL/ypyrFFpKzrlXUfWdk
   wN0UEhMs2Le05XdIL5ot0/aEPDjI99VW59vT/lxaIxCuwgp0MAI37EuRg
   E7TEvbKqIHe3NPBdP97O0dWy6DvIhKnNfWV8pCjqRS3logp3QHTycR+XB
   w==;
X-CSE-ConnectionGUID: zq9a6zt4RreYiB9vBQVMlA==
X-CSE-MsgGUID: bg9bAB7OTn+l8wY2iNalPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89328951"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89328951"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:57:55 -0700
X-CSE-ConnectionGUID: +E3rG8htRSigs3yfiJASpg==
X-CSE-MsgGUID: Mzw9OwFmSaeEBMIdxI7oug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="301240656"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.20])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:57:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jessica
 Zhang <jesszhan0024@gmail.com>, Linus Walleij <linusw@kernel.org>, Inki
 Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Albert Esteve <aesteve@redhat.com>,
 Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Hui Pu <Hui.Pu@gehealthcare.com>, Ian
 Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH RFC v2 05/19] drm/panel: embed a drm_bridge into every
 drm_panel
In-Reply-To: <aqFsTzyf1YbQkh6W@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
 <20260903-drm-bridge-every-panel-v2-5-2ab8ee24538e@bootlin.com>
 <678ddef7e56703d9adffff5c490d4857af515343@intel.com>
 <aqEqx0zBQgmUgwqL@houat>
 <3efb06a30baae6ba1bfcf2be449bf207a30f674d@intel.com>
 <aqFsTzyf1YbQkh6W@houat>
Date: Wed, 09 Sep 2026 18:57:44 +0300
Message-ID: <f098a1ca30e3ca400b08c909d476a5752c70a6cb@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 09 Sep 2026, Maxime Ripard <mripard@kernel.org> wrote:
> On Wed, Sep 09, 2026 at 05:02:58PM +0300, Jani Nikula wrote:
>> On Wed, 09 Sep 2026, Maxime Ripard <mripard@kernel.org> wrote:
>> > I really wish i915 was at least *trying* to fit within the larger model
>> > basically everybody else uses. I understand that it's a large
>> > undertaking and regression prone and everything, but I'm also concerned
>> > about having the "we can't because of i915" or "supported by everybody
>> > else but i915" on a regular basis now.
>> 
>> Okay, let's hear it, please name a few things where i915 is alone in
>> doing something bonkers that amd, radeon, nouveau also don't do, and
>> what would be the changes that would bring i915 closer to everybody
>> else?
>
> Where did I say "bonkers"?
>
> But since you're asking, because it doesn't implement .reset, we had that
> conversation this week for
>
> https://lore.kernel.org/r/20260908-drm-reset-state-flag-v3-0-905570f387a4@kernel.org

You mean struct drm_crtc_funcs .reset?

-- 
Jani Nikula, Intel
