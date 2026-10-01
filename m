Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EFB49B444;
	Thu,  1 Oct 2026 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790885172; cv=none; b=tDTyNTA5A0uOuiAi21511yynPYFm1q17AjElrrHSwn1gV9Sa7ko3KaeVloxJFSLtjSRmVCBL9IJ+CLJ6BmzIi2ebiuzoyNXlFB5Y/PFRwiSr8spjA00yxNy6YU83a+YdR+B4H9Pw4Zd1DuY6vEmh12L1WLsjYhLpiz4qyaGk3xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790885172; c=relaxed/simple;
	bh=0mQP3oJ5odwBNoeOjz8xTc2FYERScVE7Hi1gTnklx0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXWp0ZcnIAbvAiwHzy9lZRkka6zO6aNNXvvRHqTylKt+4ePFWajG05BT52bNH2QjMY6YsH5EkADWpF3HJR1GeNBNDoIDtSMCvY1hivIAUAfZVRCV9wbZJfwxMEo4KTnIV9iDmYXx0C/83MDBgOjoG3liU1CEcXIw/e9VvKBmjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYQyqrF1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYQyqrF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790885169; x=1822421169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0mQP3oJ5odwBNoeOjz8xTc2FYERScVE7Hi1gTnklx0o=;
  b=gYQyqrF1ErbeKJ0cXpiX7Q2c0Bs41CRxkcc+MQlfLKmd/KrK4ILCvlal
   0cKxI/66+mMBIXihVBEGVspLa2NP/b6irJUwvdQr6g/hjdtcH0L3wdpUs
   WlWnmBQJMHvUUcOSTluL6iPIFuHEHuSaLaMGHKmL1V/tWqQWoZs3DJ35E
   VuYajtzD+tjVleTS2nnBIcIUuz2XlQKQle5l0dYCRALLkh2xaoEaUcWbi
   zHaQur+tsoe9R/4seQ3BA0rPkT0OS1FfhMINg9SuDDh8Zzw7/Ijmq/nAw
   EBs8QBkMQYXWzLObcp8IV7jXGtezcFfsr7Zq5r6l6rCoJe09V9+Vw9lN5
   A==;
X-CSE-ConnectionGUID: EZ+8mMCRShu0/VcMoW5tTQ==
X-CSE-MsgGUID: cYm3NbFKSDamX00PakecfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="95465663"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="95465663"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 13:06:08 -0700
X-CSE-ConnectionGUID: rO0rSMTPRHWS+ErR+KzkEg==
X-CSE-MsgGUID: lIbZtm4cQP+Rbwb4OeqQvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="279378810"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.154])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 13:06:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A092C11F925;
	Thu, 01 Oct 2026 23:06:03 +0300 (EEST)
Date: Thu, 1 Oct 2026 23:06:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, andriy.shevchenko@intel.com, hansg@kernel.org,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 12/16] media: ov2740: release group hold after gain
 write errors
Message-ID: <ar69K8mZVNmDqINI@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <34f5f77ec2ddc7ff7a000603b120380c80bb73d4.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34f5f77ec2ddc7ff7a000603b120380c80bb73d4.1788360629.git.mauriziocasciano7@gmail.com>

Hi Maurizio,

On Wed, Sep 02, 2026 at 04:53:41PM +0200, Maurizio Casciano wrote:
> Digital-gain updates start a register group before writing the red,
> green and blue gains. The current error paths return immediately when
> one of those writes fails, leaving the group open and never issuing its
> end and launch commands. Later control updates can then be accumulated
> in an unfinished group instead of taking effect.
> 
> Once group hold has started, always attempt both commands needed to end
> and launch the group. Preserve the first gain-write error; report an end
> or launch error only when all gain writes succeeded.
> 
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: LLM sparse

Can you provide a Fixes: tag for this? It should be cc'd to stable, too.

-- 
Regards,

Sakari Ailus
