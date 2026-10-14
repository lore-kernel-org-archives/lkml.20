Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B342F3C07
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960380; cv=none; b=SMxrFJAAjM9rESlvcW+iCcjrP9hL9YOeJDU9uqjBmY9TzhX/aa51iRpX28+pd80bPXoHeQH/iOiYTWFVLOLPxGM+rhPyfjpqIUbGJSSAjmoquHy9P4seQa3d/ojeRfRaY4iuKGLqaQu4b7/ebjAIuB1tKUgyKXETpIzGmQYVRBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960380; c=relaxed/simple;
	bh=ujE/VjnEfJZJodz3PkvN05chJRsA+cLEWkfETzLKE08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdFhq7ulJ+c1+PWOpLSg5jSu0XIUUVRoLFxh9V5Iaeztgz3jc4IxjiX+xIXllb8M0JQwRMEjkDE5KObngQuoJzkpHxwJMV2Ye5HLftqGg93xGtpbbJJNMiy7HMRRRm9FNsZgmZWNkV1JlxKDCfg16fkponvwTbP1A2YFSKFAb+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QujnKgkh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QujnKgkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791960376; x=1823496376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ujE/VjnEfJZJodz3PkvN05chJRsA+cLEWkfETzLKE08=;
  b=QujnKgkhQwUxhgZv8Ejnj1PYqVp4ycMughgjyKGzc6zeZ9Qgo8h9T3Ej
   0srNTAoT0SN14w1QhnNAZaittEI8ijGwdQfgYPHqVJ5JJxnSMQG7kMYfA
   AdZ+O6qjA8wk0jOPeX2+7MKmOLzJHSuMvG+lVsW7ECWoomq280cmoRY9W
   bkCuCTjUo6g4zRnXESjT3G/zwPEb2XLrhTyzLd11v9HVbTwURmcXqhsd9
   Gt1islz26t6Bzxc4avA1uBwA+QcVFDKPl4LdAkRIo0igGRACl3BI4qQtW
   kdIWt3rlbY1LEQykpUNJwrkjRQgVl+b2SBYg/6zGCIwvgZRy23bEcDNDn
   A==;
X-CSE-ConnectionGUID: pxcKxFspSMS+m3rOQaoMPg==
X-CSE-MsgGUID: AWALPjcwRLahFlLA9rt/zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="802102"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="802102"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 23:46:15 -0700
X-CSE-ConnectionGUID: UcK3nuVvTYqn60l1x7yHJw==
X-CSE-MsgGUID: UkEQAmGjTFiE6DMgFkWk5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1251767"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 23:46:14 -0700
Date: Tue, 13 Oct 2026 23:46:13 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: secureblueadmin@proton.me
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Kaplan <david.kaplan@amd.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/bugs: Restore RETBleed IBRS selection for
 spectre_v2=on
Message-ID: <nyzf45exh2pibvaehskdspxbjsuxggwansucijwweylmmvqg6n@tubvb5f4k7b5>
References: <20261013-x86-bugs-spectre-v2-on-retbleed-v1-1-e75a142da73e@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-x86-bugs-spectre-v2-on-retbleed-v1-1-e75a142da73e@proton.me>

On Tue, Oct 13, 2026 at 11:01:43PM +0000, RoyalOughtness via B4 Relay wrote:
> From: RoyalOughtness <secureblueadmin@proton.me>
> 
> On Intel CPUs which are affected by RETBleed and support IBRS but not
> eIBRS, the Spectre v2 mitigation is switched from retpoline to IBRS,
> because IBRS also mitigates RETBleed on these CPUs. Up to v6.15, the
> default (SPECTRE_V2_CMD_AUTO) and spectre_v2=on (SPECTRE_V2_CMD_FORCE)
> shared this selection.
> 
> The restructuring of the spectre_v2 mitigation moved the switch to IBRS
> into spectre_v2_update_mitigation() and made it depend on
> SPECTRE_V2_CMD_AUTO only. With spectre_v2=on these CPUs now stay on
> retpoline, and retbleed_update_mitigation() then sets the RETBleed
> mitigation to none:
> 
>   RETBleed: WARNING: Spectre v2 mitigation leaves CPU vulnerable to RETBleed attacks, data leaks possible!
>   /sys/devices/system/cpu/vulnerabilities/retbleed:Vulnerable
> 
> The same system booted with spectre_v2=auto reports "Mitigation: IBRS".
> So requesting the mitigation to be unconditionally enabled results in
> weaker protection than the default, which contradicts the documented
> meaning of spectre_v2=on.
> 
> Select IBRS for SPECTRE_V2_CMD_FORCE as well, as was done before the
> restructuring.
> 
> Fixes: 480e803dacf8 ("x86/bugs: Restructure spectre_v2 mitigation")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: RoyalOughtness <secureblueadmin@proton.me>

(Not sure if this is an acceptable sign-off)

> ---
> How this was found: secureblue, a distribution built on top of Fedora
> Atomic, puts spectre_v2=on on the kernel command line. While auditing it

The change looks correct to me. I believe the intent with spectre_v2=on is
to get the forced-on IBPB for userspace? If so, spectre_v2_user=on would be
more appropriate, also it works around the bug this patch fixes.
