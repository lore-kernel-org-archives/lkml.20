Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD53648E0CC;
	Mon, 28 Sep 2026 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588190; cv=none; b=oPEToo0HOitsdmqtcmKLQgB4ftxiT8asgXZ9qIbdqIyE8HYmh+sNhflLDETxm8Ju/q7O/WyY/Zzs8oFiy27tc5kStFOs8AulMpjBc58hFWua75zCnlrMnLh1aLpMRQ0qMpFOm/4yrxYMmvz9mGlwVF+K/coJLgsVN+Tz2src2ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588190; c=relaxed/simple;
	bh=AOhkVa0Og41qwG8lwB6Mwwjaw0pjLaOKIwdS9efIhWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLal6exBHBkJ4u22VZul/NCQA5YXYP7PBG1LLc+Jx6G0B07EPUbFWS2hCM1feKA+wzGL/fzaIHxLcVDa1c/hYXYyNWXRWpVINnlIsN3hYv7bTKaabl9NlUs70jPvLif7xXJPc50ERl1HXUNAKgYu2BBh6hKg85AJB3x6+0Dr2Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9NxZehV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9NxZehV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790588189; x=1822124189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AOhkVa0Og41qwG8lwB6Mwwjaw0pjLaOKIwdS9efIhWQ=;
  b=O9NxZehVGpbGESFmk5aNNa70B6RKfeJs4Df1rZf6JuT4vvdrez+JUb7S
   YgqE0KALLCpXI7Z4SLRwDfFhboEddwmXNZAmbHmqNLMlNxnzRZpKLwPtO
   gGJbfnrqjQ7tlBrgvXfhSjevOK1TdMq1uqNfsydRprd062gQn6TkpJros
   QEc7rnM5lhD6UbQZ+VBaaP+Nb87dU9KLnVoAmxpdsL/vtxERV2dmF0kSv
   1WqXdZG9kUFkWWtbAL4XDOITCtaxZOztqCTvg0Qcpkhiig6IH0TWzvfTE
   a/tkEuo1pUiSE4bVUfDSBAAUKaeU0MAlTVdc5PRlhR9pqp+X28VDj49+B
   A==;
X-CSE-ConnectionGUID: LBKYg4H9QqGa1u4WbZtlhg==
X-CSE-MsgGUID: uEQjk5rNR2mrm/5IcDmZWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="91146082"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="91146082"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 02:36:28 -0700
X-CSE-ConnectionGUID: mUIOIFrWSNSoEecmAlzw1g==
X-CSE-MsgGUID: cDWx5x1/SWuFNCxgPCG6MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="312916959"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 28 Sep 2026 02:36:26 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1D52999; Mon, 28 Sep 2026 11:36:25 +0200 (CEST)
Date: Mon, 28 Sep 2026 11:36:25 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kurt Lieber <kurt@lieber.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Message-ID: <20260928093625.GF106095@black.igk.intel.com>
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

On Thu, Sep 24, 2026 at 12:26:37PM +0000, Kurt Lieber wrote:
> The Anker Prime TB5 dock identifies itself in the DROM as 01ea:83b5.
> Its router config space is an Intel Barlow Ridge 80G hub (8087:5786).
> The upstream lane adapter advertises CL0s, CL1, and CL2. With CLx left
> enabled, TMU uni-directional LowRes setup fails with -ENOTCONN, the USB3
> and DisplayPort tunnels are aborted, and the router reconnects in a loop.
> Loading thunderbolt with clx=0 keeps the link up on this machine.
> 
> Match the DROM id together with the Barlow Ridge hub id and disable CL
> states for this dock only. QUIRK_NO_CLX takes the same early-out as the
> module parameter, without disabling CLx for every other router.
> 
> Assisted-by: LLM
> Signed-off-by: Kurt Lieber <kurt@lieber.org>

Applied to thunderbolt.git/fixes with stable tag, thanks!
