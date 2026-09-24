Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795E72E2665;
	Thu, 24 Sep 2026 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254654; cv=none; b=qV6ewG+UbmajF3pN6XmmAVeMxRZU+xj3C0JjnhA9mfdYbOfBOnm6zmudus8vSmW0moqn24Eqlq50sxIFsg/RQaIqxJRe7gD0zfIpSk6TQFVjVMEWjNFFfov5f16Lbf/MYmrY2GSaT3exv3OMPdUUA6jPM+TvLeFRQABbh4aEKg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254654; c=relaxed/simple;
	bh=cW8vRK1hmQWqiQ8EquMxm2xuDMxuWNb4wxnC0uRM1nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ak9+iosNNgSKd8gEhqsQ+ld1gjiW//DLDHAzImk79sMvvY+EQLmjE0Qfavv/qP8pmz216M5crIXjFU1ljbJjT7RFmyREL7RG+cpmC+avziyBR55d1UZBBQxhZrqeUu+6ZMhJzBQR1lYNBrZ6bo6LidqCvTrVqMaOdVnjy3tw9jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkgLac5X; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkgLac5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790254653; x=1821790653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cW8vRK1hmQWqiQ8EquMxm2xuDMxuWNb4wxnC0uRM1nY=;
  b=DkgLac5XhE/UMRwtvc/xRq2lh3bGXd9QL2nqALCraHJ8+sZ00H4njt96
   +KbI+d/0Z6+Uzi8edMhrlid+JZTBje8C6hB9SKtlFciWl23C1E6K3A4PQ
   My6TKouRp0nB2HXc0KtK2jaFMg/Ps1tSYFpS7o2XAYbNPZjiakBjJfHmA
   5OEigPtJ9zYrWuPzXEpFN4Z+F3yYJJBR1/1gDMudrRVOigH1dD4MbWdea
   UIxzWP7efN2/wDsbB25ntufaXlEvzDoWoCPtjErhuQ7F34reeqOW1Ar9t
   OPXiQNPmM0+oKAxS1dVo/Xqf2tpSCupJ38CeBCz4bxI4C+yRuuq2XOEdX
   A==;
X-CSE-ConnectionGUID: LMt9OhlmQK+pACP/xLH/Ag==
X-CSE-MsgGUID: Y9lDP4KOQVKnAlSB/sPDuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="107409437"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="107409437"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 05:57:32 -0700
X-CSE-ConnectionGUID: 9f9B2BYuT4elZ4SuR6kqFQ==
X-CSE-MsgGUID: LVv7J+8DTDeD/tMVD7tJdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="300287902"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2026 05:57:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6024599; Thu, 24 Sep 2026 14:57:29 +0200 (CEST)
Date: Thu, 24 Sep 2026 14:57:29 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kurt Lieber <kurt@lieber.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Message-ID: <20260924125729.GP106095@black.igk.intel.com>
References: <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924073514.GM106095@black.igk.intel.com>
 <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924101046.GN106095@black.igk.intel.com>
 <SJ0PR15MB46960A6F15BCA58C0726C908A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ0PR15MB46960A6F15BCA58C0726C908A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>

Hi,

On Thu, Sep 24, 2026 at 12:26:37PM +0000, Kurt Lieber wrote:
> The Anker Prime TB5 dock identifies itself in the DROM as 01ea:83b5.
> Its router config space is an Intel Barlow Ridge 80G hub (8087:5786).
> The upstream lane adapter advertises CL0s, CL1, and CL2. With CLx left
> enabled, TMU uni-directional LowRes setup fails with -ENOTCONN, the USB3
> and DisplayPort tunnels are aborted, and the router reconnects in a loop.
> Loading thunderbolt with clx=0 keeps the link up on this machine.

Hmm, I missed that it's Barlow Ridge. That should definitely support CL
states. I have one here and it for sure works. 

What's the NVM version can you check? It could be that some older ones have
issues.

> Match the DROM id together with the Barlow Ridge hub id and disable CL
> states for this dock only. QUIRK_NO_CLX takes the same early-out as the
> module parameter, without disabling CLx for every other router.
> 
> Assisted-by: LLM
> Signed-off-by: Kurt Lieber <kurt@lieber.org>
> ---
> Runtime-tested on linux-omarchy 7.2.5-3 (LG Gram 17Z90S, Meteor Lake).
> Booted with thunderbolt.clx left at the default (Y). The dock came up
> once, CL0s/CL1/CL2 Enable stayed 0 while the support bits stayed 1, the
> link stayed in CL0 at 40 Gb/s, and the TMU uni-directional reconnect
> loop did not occur.
> 
>  drivers/thunderbolt/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
> --- a/drivers/thunderbolt/quirks.c
> +++ b/drivers/thunderbolt/quirks.c
> @@ -116,2 +116,5 @@
>  	{ 0x0438, 0x020b, 0x0000, 0x0000, quirk_clx_disable },
> +	/* CLx is unstable on the Anker Prime TB5 dock (DROM 01ea:83b5). */
> +	{ 0x8087, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HUB_80G_BRIDGE, 0x01ea, 0x83b5,
> +		  quirk_clx_disable },
>  };
