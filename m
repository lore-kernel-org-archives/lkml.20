Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1A249A3AC;
	Fri, 25 Sep 2026 11:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790336141; cv=none; b=AfAdtufOZB4PjiqcKflQ3oYO+ki28f2qjhWV40DtJqjUPATE907TrrM3tEl2R+0cdN00kIv9q736pha/WxZKnlHCdaJVD9fLPBZPQE1Mfjir12dGHiHpzfw72SBfGzRFTrYrgXl32iHQBmTnfskxzA5N05tXHm4f65kfOs8rlig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790336141; c=relaxed/simple;
	bh=dOTl64mPulpUd+JHeBSeQTJCazZF/ZdiNxdDKxwgN5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgmfGPLzwQd1oW7eknHiXQSVIzLPrfiIDadTK5CSNygmZyKCQWRCILCfQQ2Hkbu30QpY7oN0omNWn8HvyaZH+s22vdLPHMbksqIcXIfMAbf1yqpg35RKDYMfquDPmyMewh6G09wL4dRgK9WTiYAe5khroAeGM16Qjh6eOc5IxKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnWEzX9X; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnWEzX9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790336138; x=1821872138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dOTl64mPulpUd+JHeBSeQTJCazZF/ZdiNxdDKxwgN5E=;
  b=lnWEzX9XzAxSgKwgUNDxcMKFEn46Yw7OEt9vH7BVCdFWxSr9yvkHJtSr
   IdvRFVWTCVO1LfseKHbJfu+OzfBQS+aMqTD1vWrGmY6qvEOXdkMsmHLiu
   yr6FZOx6UaioqVPyMb+OMLUqzwzDotAC12+ul2eRLy8Id3/WZoBQncw1c
   U6UtyGZBmlUySlIO7tndazZYZya7lmJqkmF6KL9JlKaHWJzu2KVRr1rRz
   oda5N8e6xQ5tom4bAXIXwuabzTzK48IiUgJzQggiPXqfr89eBndjQdtyq
   NPnxMMhIgFwxGiZTAzaaAYIIe1f2aRsdTL4f42+/rxGJyxBOOzywzwPFO
   Q==;
X-CSE-ConnectionGUID: 9r8NrOBsSSC7sNrq/Cyjiw==
X-CSE-MsgGUID: 627pV65dRnWeESITOTgijw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89888855"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="89888855"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:35:37 -0700
X-CSE-ConnectionGUID: UNaS+ljQSIORkXdli1SorQ==
X-CSE-MsgGUID: V/rJlEeGSH6KW4HqwjYEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273545182"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.84])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:35:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3281C121182;
	Fri, 25 Sep 2026 14:35:36 +0300 (EEST)
Date: Fri, 25 Sep 2026 14:35:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hermes.Wu@ite.com.tw
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/21] media: i2c: it6625: use centrally managed active
 state
Message-ID: <arZciEXX5vJtlRcs@kekkonen.localdomain>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
 <20260918-upstream-it6625-follow-up-patch-v1-20-78d72d7886a5@ite.com.tw>
 <aq0RaLPX5o0HU_yC@kekkonen.localdomain>
 <69a3df11b37f466fbdca8be37a6cc378@ite.com.tw>
 <aq1Yps6g7m7TQJvd@kekkonen.localdomain>
 <f2c5479e4d0d4d89a030698f34a277e3@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2c5479e4d0d4d89a030698f34a277e3@ite.com.tw>

Hi Hermes,

On Mon, Sep 21, 2026 at 02:24:29AM +0000, Hermes.Wu@ite.com.tw wrote:
> Hi Sakari,
> 
> Thank you for the clarification.
> 
> > Is this AI-generated?
> 
> I used AI assistance to help understand this review comment and draft parts
> of patches 20/21 because I was not certain about the expected locking model.
> I reviewed the result before sending it, but my conclusion about the state
> lock was incorrect. I should have asked for clarification instead of making
> the claim about what most drivers do. Sorry about that.
> 
> > Please use the control handler's lock as the state lock, too. This is
> > what most modern drivers do, too.
> 
> Do you mean that I should leave the control handler using its own internal
> lock and assign that lock to the subdev state before calling
> v4l2_subdev_init_finalize(), as follows?
> 
> 	sd->state_lock = sd->ctrl_handler->lock;

Correct.

> 
> I am also still unsure about the separate it6625_lock. The chip's MCU
> processes one register-driven command at a time, and operations such as
> issuing a command followed by polling for completion must not be
> interleaved. This lock also serializes CEC, IRQ/polling, EDID and debugfs
> paths that do not run under the control/state lock.

I'm not asking for that, just that you'd use an existing lock instead of
adding one more.

> 
> Should it6625_lock therefore remain as a separate MCU transaction lock, with
> the control/state lock acquired first whenever both locks are needed?

Sounds good to me.

-- 
Regards,

Sakari Ailus
