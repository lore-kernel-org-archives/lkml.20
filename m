Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBFA4854EC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282074; cv=none; b=JOL+VK+EGkaF2EXZTehH07sGSt5C1dl4yvZJ7k2v3pRDLKtVGd7v0TBylPMkxajUwjT6P9Je8X9/OVWxhA0LcbGUVDO3kvvclClLxuiIe/m/e+EJsAfRbwxtDaewoxjrv6KDYvlcOUCPkVHC4UwEZIupH/r/YC316PsX3W9pBqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282074; c=relaxed/simple;
	bh=EMdcL0zSeCYumVUIXEyGOkt8o2r4M/DhnNAQnHhJ7lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ypot73w8UKXyQQ44QPe4Y4E6krf6Z0tbAwqz7vQv2cNTyQKOcAMIo2A4CjMjtzoHQAYr+OfgcnLoNEJPEyD7z+DPDu50RpwKu2mToxQx7UGm81QZNPWyOV+aA5TNV2hUtyhztRQgKjS6mDe+yN3Agloa9mTT8FTsD/1jo2kj2dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZU52FRZo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZU52FRZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788282072; x=1819818072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EMdcL0zSeCYumVUIXEyGOkt8o2r4M/DhnNAQnHhJ7lQ=;
  b=ZU52FRZon0ktO4X/GIZWmXwpdob9XxMv+sX0drLCz/cXMOlLqvYDVYIC
   C+bJT57FKG0UveWjpDhPulXWszBO+kUAKitid3xH4+wm/64NFsY4rhJAq
   kw59zQhA8eOHDBZP9nPCyhWlYfxOeOg1vars8P9HNiMPHdVyYYnUehUSr
   jjlWnlUpDOaNlzrKAnZqJe5lBtxRX+uJzodloppET1Wa8gAoNy85VIfHY
   we9kURffYHkXb43PtXNp85Q7+fea8wErI/vTJbqb7fraNb5qnAh8yt0wK
   aVehw7fAhvAGqyW/z2QRUcja+d+xpoLDpzBEkneF/ZDY8q1XPR40bROTB
   A==;
X-CSE-ConnectionGUID: 2qJ+hfw4SP2qnL9pNaH2bg==
X-CSE-MsgGUID: MAMDkTOlQkqm/7HtOG11qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88571962"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88571962"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 10:01:11 -0700
X-CSE-ConnectionGUID: wV4Z58raSy2kcgd8X45lbg==
X-CSE-MsgGUID: lrXuDDYNTg6AjVyfJCoouQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="267848219"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 10:01:10 -0700
Date: Tue, 1 Sep 2026 10:01:03 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Kim Phillips <kim.phillips@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Borislav Petkov <borislav.petkov@amd.com>, Borislav Petkov <bp@alien8.de>, Naveen Rao <naveen.rao@amd.com>, 
	David Kaplan <david.kaplan@amd.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Nathan Fontenot <nathan.fontenot@amd.com>, stable@kernel.org
Subject: Re: [PATCH v2] x86/bugs: Don't say no mitigation available if kernel
 not compiled with retpoline
Message-ID: <xt7q2afly3l2ajlxkn2wi5rny6ka3nlmdq2642fc5hy2bkhljn@dtk7k54iwky4>
References: <20260831210916.987152-1-kim.phillips@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831210916.987152-1-kim.phillips@amd.com>

On Mon, Aug 31, 2026 at 04:09:16PM -0500, Kim Phillips wrote:
> When the kernel lacks retpoline support, spectre_v2_select_retpoline()
> emits
> 
>   "Kernel not compiled with retpoline; no mitigation available!"
> 
> before returning SPECTRE_V2_NONE to its callers.  SPECTRE_V2_NONE is not
> the final answer, though: spectre_v2_update_mitigation() runs afterwards
> and can still upgrade the mitigation.
> 
> On an Intel CPU affected by RETBleed, built with
> CONFIG_MITIGATION_IBRS_ENTRY=y and CONFIG_MITIGATION_RETPOLINE=n, and
> booted with spectre_v2=auto, retbleed_select_mitigation() picks
> RETBLEED_MITIGATION_IBRS, and spectre_v2_update_mitigation() then promotes
> SPECTRE_V2_NONE to SPECTRE_V2_IBRS.  The boot log claims no mitigation is
> available immediately before reporting "Spectre V2 : Mitigation: IBRS",
> and sysfs reports the machine as mitigated.  The message is alarming and
> simply wrong.
> 
> Drop "no mitigation available!" because the final mitigation state is
> printed afterwards in spectre_v2_update_mitigation() anyway.
> 
> Suggested-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Fixes: 480e803dacf8 ("x86/bugs: Restructure spectre_v2 mitigation")
> Cc: stable@kernel.org
> Signed-off-by: Kim Phillips <kim.phillips@amd.com>

Reviewed-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
