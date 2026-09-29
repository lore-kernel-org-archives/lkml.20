Received: from mta1.migadu.com (out-222.mta1.migadu.com [95.215.58.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83243812D1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694216; cv=none; b=j/JphPzKbxbXfFIBE/yzLgvwhlHk3giGWWsCOM2ar4I+3uFC3ZjT5DVYaA3pWj/s2bA5PmcnAybsEa2klGOs7gByvY827p1A/FZ/pgZiEOxisIGahmNic8JX0sha/jhYNr4rq3L9uPIzHeWAaQFG8SFVZTN0uoFIvJuqXfD/guY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694216; c=relaxed/simple;
	bh=sVu4FJuVOqdTN3UtOwSzlTggzp5QjPZAogLVPYYo/6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CH2586mkDodyhWnqR+wgapdomlgscq8rbVV9TyM4Noh7ykMbAoEq9ZplAJIa9k1XfNPjgv6nb+6bOwHktSiYtVVHhv+mA+gVF/LjHYXgJ3g//+Dcl3haXmrji6SIPdchJvlBD0XABdvmuGpOfYE2kPegj7orcW7I/HVB6Xx/54Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ws8XtXad; arc=none smtp.client-ip=95.215.58.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ws8XtXad"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sVu4FJuVOqdTN3UtOwSzlTggzp5QjPZAogLVPYYo/6M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790694193; v=1; x=1791298993;
 b=ws8XtXadbfIibZpSFlqZjFwX934wA7T9Lhm8hL+VwnOPLYo1TvwBDyNego1Axg156dE+SgT5
 ZB2coRwjf/gZLooRbUyVWBgHV4TqIwjTSj2lioEJrcg30Yru1t0UB0KQOgYI8s5SiN8MybGM/QC
 Ok1j2UsnJNHgJ9cJj7A3NS6A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a7b642ba91fd03ea;
	Tue, 29 Sep 2026 15:03:13 +0000
X-Mizu-Trace-ID: a7b642ba91fd03ea
X-Migadu-Flow: FLOW_OUT
Date: Tue, 29 Sep 2026 23:03:27 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Chen Yu <yu.c.chen@intel.com>, tony.luck@intel.com, tglx@kernel.org,
	bp@alien8.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	hpa@zytor.com, fenghuay@nvidia.com, babu.moger@amd.com,
	hongyu.ning@intel.com, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/9] x86/resctrl: Require 64-bit x86 for resctrl
 support
Message-ID: <arvTP1jWxuCa-CkX@three-body>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <711a7976e0a33cd6fa2872ff10898b66d34fcd70.1789705667.git.yu.c.chen@intel.com>
 <71826bc0-df95-4f07-bd2f-dd8b4775802e@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71826bc0-df95-4f07-bd2f-dd8b4775802e@intel.com>

Hi Reinette,

On Mon, Sep 28, 2026 at 02:21:40PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 9/17/26 9:48 PM, Chen Yu wrote:
> > From: Tony Luck <tony.luck@intel.com>
> > 
> > Intel Application Energy Telemetry (AET) provides event counts in 64-bit
> > registers in MMIO space. For accurate results these should be read with a
> > single 64-bit load operation from the CPU.
> > 
> > In preparation for the removal of the separate CONFIG_X86_CPU_RESCTRL_INTEL_AET
> > configuration option, move the X86_64 dependency to X86_CPU_RESCTRL.
> > 
> > This in line with Dave Hansen's proposal[1] for an addition to Linux
> > documentation that details the state of 32-bit x86 support.
> > 
> > Signed-off-by: Tony Luck <tony.luck@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > Link: https://lore.kernel.org/all/c6ab0c24-8931-4f0d-9be6-23498ab4c38b@intel.com/ # [1]
> > ---
> 
> This patch is being submitted as part of two different series. That is ok
> but the versions need to be consistent. To help with this I'll not add any
> comments here but instead just point to most recent review:
> 
> https://lore.kernel.org/lkml/15de2e2f-fc2e-4d06-9179-100398865624@intel.com/
>

OK, I'll pick up the latest one from Tony in the next version.

Thanks,
Chenyu 
