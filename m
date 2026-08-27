Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD25351C02
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787806787; cv=none; b=jKQgAPcNA3nq0a9XIaq6FeOXCzhdHnTcWswcyUC+PaQjGvfOIc6nk27Lzq5S2NAV4ozxFB+UJuzfNHD/uuowFg5A1Rwsqb+lkXRw/P3/33fftsEF+ouXu9Wb9G5J5KXwnxePRyCDwi22jlvE37BHhr7qwVPByB2o4kyHO1oMUZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787806787; c=relaxed/simple;
	bh=FziruScaaOWq0LK3XVR61Ry9XJ7dEZG3+5BXszHYL04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hymx08DKo50bffoplkcdEOo+d+/unKMBuxfg/mgl/e3aFHqNSzu/cOXe9vhGmMrhI3nEbc/OoNjqCpB6ffSWyCZuJSwVyH1gdfaS9nSXl09w6sFaHoX1x400bd2jgjC4HWDP68bgS8xp+gBORfyJxYzMe3iBAdMzPjaKMGckumA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvQlK8zr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvQlK8zr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787806785; x=1819342785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FziruScaaOWq0LK3XVR61Ry9XJ7dEZG3+5BXszHYL04=;
  b=OvQlK8zrveMpAFnndvZ8i5JoSCLmq2mUr9gWmIHH1YAk2YZ3iYHTl1Ar
   itkIMWSbtIV8nXCKNGlNxviZKE38LysD10SxIRbQ+rp+4OqBiWAPd/Z6K
   6EV1utBKCpqjYvOWXP0tlCPwxIeWyUStqbV7Ru2pgOAd4388VKrf4Vsoh
   9jcEkdD7EM9eQs3bKjqBY/lc64AFIYEwbYw88O84MBhGFTCqj3oiIg6te
   WwnFEUV159gbZOKXhgWY5iBu9R5k2JEBw8g7eg1H4512yKz7b4VKuLgoR
   B7s4/AejpuBrWt5J/OnKMTtp83cdVjVWlauC7xyl8olF8w6kk/ZzgHNM7
   w==;
X-CSE-ConnectionGUID: 9dToMnufTC6u+K2AyVJWaw==
X-CSE-MsgGUID: VwoCI/BvSJ6bxtH2zunnng==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105674769"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="105674769"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 21:59:45 -0700
X-CSE-ConnectionGUID: Ag2r0dIUQYGFqptMmtY2VA==
X-CSE-MsgGUID: u3cUCjUGRGqwyhDBlEpjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271978406"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 21:59:45 -0700
Date: Wed, 26 Aug 2026 21:59:30 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Kim Phillips <kim.phillips@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Borislav Petkov <borislav.petkov@amd.com>, Borislav Petkov <bp@alien8.de>, Naveen Rao <naveen.rao@amd.com>, 
	David Kaplan <david.kaplan@amd.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Nathan Fontenot <nathan.fontenot@amd.com>, stable@kernel.org
Subject: Re: [PATCH] x86/bugs: Only log missing retpoline when it's actually
 the missing mitigation
Message-ID: <ccy6cxmro4hyvradyddbqubt5jlth3l7cwp3v4obz2lviazyry@2d4ixypnltll>
References: <20260826222228.3668418-1-kim.phillips@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826222228.3668418-1-kim.phillips@amd.com>

On Wed, Aug 26, 2026 at 05:22:28PM -0500, Kim Phillips wrote:
> spectre_v2_select_retpoline() unconditionally emits
> 
>   "Kernel not compiled with retpoline; no mitigation available!"
> 
> when the kernel lacks retpoline support, before returning SPECTRE_V2_NONE
> to its callers.  SPECTRE_V2_NONE is not the final answer, though:
> spectre_v2_update_mitigation() runs afterwards and can still upgrade the
> mitigation.
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
> Drop the pr_err from the helper and emit it once from
> spectre_v2_update_mitigation(), after the final mitigation is known, so it
> only fires when the system really is left unmitigated.  Guard it on
> !IS_ENABLED(CONFIG_MITIGATION_RETPOLINE) so it fires only when retpoline
> truly cannot be built in, and restrict it to the cases where retpoline was
> the implied choice: SPECTRE_V2_CMD_FORCE, or SPECTRE_V2_CMD_AUTO when
> should_mitigate_vuln(X86_BUG_SPECTRE_V2) indicates a mitigation was
> actually intended.
> 
> Fixes: 480e803dacf8 ("x86/bugs: Restructure spectre_v2 mitigation")
> Cc: stable@kernel.org
> Signed-off-by: Kim Phillips <kim.phillips@amd.com>
> Assisted-by: ClaudeCode:claude-opus-4-7
> ---
>  arch/x86/kernel/cpu/bugs.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 82436b3534fa..46c68feef339 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -1956,10 +1956,8 @@ early_param("spectre_v2", spectre_v2_parse_cmdline);
>  
>  static enum spectre_v2_mitigation __init spectre_v2_select_retpoline(void)
>  {
> -	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE)) {
> -		pr_err("Kernel not compiled with retpoline; no mitigation available!");

The claim "No mitigation available" is really the problem. And, it is
redundant here because the final mitigation state is anyways printed in
spectre_v2_update_mitigation().

How about just change the message to:

	pr_err("Kernel not compiled with retpoline");

It stays accurate here, telling retpoline mitigation was attempted.

> +	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE))
>  		return SPECTRE_V2_NONE;
> -	}
>  
>  	return SPECTRE_V2_RETPOLINE;
>  }
> @@ -2247,6 +2245,13 @@ static void __init spectre_v2_update_mitigation(void)
>  		}
>  	}
>  
> +	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE) &&
> +	    spectre_v2_enabled == SPECTRE_V2_NONE &&
> +	    (spectre_v2_cmd == SPECTRE_V2_CMD_FORCE ||
> +	     (spectre_v2_cmd == SPECTRE_V2_CMD_AUTO &&
> +	      should_mitigate_vuln(X86_BUG_SPECTRE_V2))))
> +		pr_err("Kernel not compiled with retpoline; no mitigation available!");
> +

With the above message tweak, this check can be dropped.

>  	if (boot_cpu_has_bug(X86_BUG_SPECTRE_V2))
>  		pr_info("%s\n", spectre_v2_strings[spectre_v2_enabled]);
>  }

