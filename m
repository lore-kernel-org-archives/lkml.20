Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8924E50B8;
	Thu, 17 Sep 2026 19:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675153; cv=none; b=dvcsd/umkXjbDXOGRJyYtZrSXACCQJ+oL90xssemNIjAU2+gGsmLqmGB+zk/LRtRgTg3qjiyQbtpc9M6/t20BKuJ55zeXA0j9lh4v/BeDHbUR+PRnpE3EUXO8HWxt7p8/gZX26WcEbHhgS6Yv1qosQ4NZEzEntSP2F33IW9wcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675153; c=relaxed/simple;
	bh=ixPq942LJ/WGAqwSu3qpkj0GJk54Uhh5w7F5WkB0sHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNI4duwCdl8MatAVysdlrZPH/NMu5VxWZjfmVZkBy9WFRqV6/LHQs/ihTkad4oHsLikd5ny7GLw3ffsqQanZ+zHkCsuys/BFdC9hdGsUwB4IdMA6srQNcVTerO2REF3dGnE+jPY/Bd3zPdTQAiENB5+sEm8JYCwzU6fWzOMrAE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0eVvy+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0eVvy+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626FC1F000FF;
	Thu, 17 Sep 2026 19:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789675151;
	bh=Rm9+vd+pl+ynAYoyabNq6vDDpUHMo6kqP+gIWl7nZkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L0eVvy+mH1eenfGVjEfEaybB8BJ59de+ZscjhT6IHlLDcV7dxvtUmwF9EpODkRfRD
	 2+5ph5YD6WQ+aNsRXJ1bz1nlQg01GD8VGgjnGeYbkCKwzGwzHsytcU99CNLCpVnakb
	 b/H4GOC2BHFvRnscJrBCpo/FwBvl1J/cafoTSqDpWSX3PAhUWW1Nl9ptfmaznGL7AT
	 gcYiIx+ZNQF7bUA5oHIbZ1zOxLZPd73RKRpxIIh2BiWVUNIvKAm0Pnw0LEtM6Ni9CZ
	 dAjRk0FmOZDCURrbguTaX+RhRqEDocnXTWZR12NYkgAhoxkrEB9uTyfigTmIAn3N5z
	 uo4U8RP+N5OSg==
Date: Thu, 17 Sep 2026 12:59:10 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <aqxGjrK1dIpZs7ln@thelio>
References: <20260917-dfustini-atl-sc-cbqri-dt-v8-0-7964e8d73fe8@kernel.org>
 <20260917-dfustini-atl-sc-cbqri-dt-v8-2-7964e8d73fe8@kernel.org>
 <20260917165743.390201F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917165743.390201F000FF@smtp.kernel.org>

On Thu, Sep 17, 2026 at 04:57:42PM +0000, sashiko-bot@kernel.org wrote:
> > +		d = cbqri_create_ctrl_domain(ctrl, &hw_res->resctrl_res, cpu,
> > +					     ci->id);
> 
> [Severity: Medium]
> Does this bypass the capability agreement check for dynamically registered
> controllers?

This is a valid point. cbqri_resctrl_pick_caches() only compares the
controllers present at late_initcall, and riscv_cbqri_register_cc_dt()
does not refuse a later registration. The scope is limited as this
driver is built-in, and DT overlay is not likely for a cache controller.

> Could this cause capacity configuration operations to fail gracefully with
> -EIO when hardware limits are exceeded, or otherwise abort CPU hotplug?

It depends on the mismatch:
- If the late controller has fewer capacity blocks the read-back check
  in cbqri_apply_cache_config() fails with -EIO, the domain is not
  created and the CPU online is rolled back.
- If it has more blocks the domain comes up and only the upper blocks
  stay unused.

I will add the cbqri_cc_caps_agree() check to
cbqri_attach_cpu_to_all_ctrls() to eliminate the above issues.

Drew
