Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818F53C9EEB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108790; cv=none; b=jLpgtuVlFHBQe7KhTa5gCvPYfWCQYY61xXga+nFE3imC4VujLyvO0jZjed7x3f/ApVu6HMwhk4Zuyk7yOb3k+ZXp8ScMSYwvr+C5QqEKa/KN2KQbAq1+DywqH6syJNwlIMYtc3Z+Y274GvtP1WnL5C44UATvrQr9ZI9xaOeo3xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108790; c=relaxed/simple;
	bh=WwpZqfbf/F6TM+z4q+ki+eJkgf1qfTXXCqGJ1XJT1J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZD/iMWMP6N5gqRpEMsaFBnwT11DfCpqTDX9pIyEbke7HAj+ktEHlw7Sse7H95ygHUJ7z+JtP9VwN0Mg7YYPmQX+tY9+xFHCvjKqLmqiQlLUOJnOqIYUXk0vJ2bQmRcAfbRBaVxC0xLtdC56mttqp969ti+u3apwAVOjdmfi/Ujk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRlVSSxB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRlVSSxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13A91F000FF;
	Tue, 22 Sep 2026 20:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790108779;
	bh=Qev7RCi4iduGEyiHg4LbKwYia7tpP9Nzj1m0mH3cMCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dRlVSSxBhOcJv+KM4ez6wW1MFUjvobjNsQh0kBjhl5biqduifdIPp1RzPDMvuPMwv
	 y6gscSUjyh0aXQNkwUmTJjq/D24Wb6N6v+5SyFfctFg3GH5GoIgAN5+cTWsMmITzgb
	 8THCGEXyGv1PYYFXTXXzYfs5wZOtov1rXTdyrR/O/lC/+sqnA2xTaSSOn+sxjel484
	 agBEBKNWUsewNWZ6EFhEbe03E00kfAT3h5/e03lKlbetBcZrkrVE9CkKYh68mirgEd
	 tIcsyobm5VHchSRbnDTeRw/Q7eM2KPqAMSnGCIsVJU7kfHhep8/WF4Pbpu/eFGSzG4
	 kELYqS2tLTJKA==
Date: Tue, 22 Sep 2026 13:26:18 -0700
From: Drew Fustini <fustini@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, Dave.Martin@arm.com, babu.moger@amd.com,
	bp@alien8.de, dave.hansen@linux.intel.com, fenghuay@nvidia.com,
	james.morse@arm.com, linux-kernel@vger.kernel.org,
	peternewman@google.com, tglx@linutronix.de, tony.luck@intel.com,
	x86@kernel.org, yu.c.chen@intel.com
Subject: Re: [RFC PATCH 0/3] Suggestions for cache scalar controls
Message-ID: <arLkancaSfFbe1_B@gen8>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <20260921135702.2874931-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921135702.2874931-1-ben.horgan@arm.com>

On Mon, Sep 21, 2026 at 02:56:59PM +0100, Ben Horgan wrote:
> Hi Reinette,
> 
> I'm posting as a reply to your series to try and keep things together.
> These patches should just be taken as suggestions. The first two
> patches make the printing of the schema name simpler while keeping it
> out of the arch code. The last add support for scalar cache controls
> in the size file. I found these sufficient to add support for CMIN/CMAX
> on top of MPAM. I'll post these separately but if makes sense to you
> feel free to incorporate them in your PoC.

Thanks for posting as these help RISC-V too. CBQRI has minimum reserved
bandwidth and a shared bw weight but there is no throttle-based MB
control. This should fix the "Invalid MB value" for CBQRI.

I'll rebase the CBQRI support onto resctrl/controls_rfc_v2 and will try
these patches in Qemu. The CMIN/CMAX modelling on your branch is helpful
for CBQRI scalar controls.

Thanks,
Drew
