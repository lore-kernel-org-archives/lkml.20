Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1556330B3F;
	Wed,  2 Sep 2026 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357775; cv=none; b=qSk21p4rqUq0MXPAA4dNa4wM4v5WQE2XAJLh0OtpZPHPdeg/eLwV9SrSgCPiQ/kCHeaU6jLDLkf2zniBJIEj1bkRJzeXsh651ho6mWcQxSlOkegvQqDeKRRnoAn98F2IPinsl0oQ7oqprgNUIZ3SoyslNGPMckDK1nmfFH5gGmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357775; c=relaxed/simple;
	bh=bQeZhuBtE7GIKGl/Nw50udRZElUfrWZ6myE69EVVgHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSzAx1wuX8Ho76iFCg5DJRyHyFaazLfELWSWbThRi5qXPXFhsmYvFHl5BPGjLdtCaTM2N505OZgd8D832Zx1dVUgayggUtmKGbqrilBAjRvFrFZ2b6r6S/0kX8AGTxxjpQygv79CoVOxuR1RBg6fp8I0jCHWCnrBr4JoZulMrkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wl4YHbko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wl4YHbko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFD51F000E9;
	Wed,  2 Sep 2026 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788357774;
	bh=HXQXNKItUfLT79ENmc5mJloa+uh6x0XULw7tLnY0UVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wl4YHbkot0kOdwuA7z9pgFJ0CmSBkW8Gdyb303MwRoU5yr8ykvefUZK96MgrI2QDc
	 mpiE87UQNY1dZicTHzT3/H9k35iZFwhoTYTfwDEecu+G/90SFAYBKHvwi42kc/mEOG
	 5rfi6oi78YOogpHcEESiDVTOzV8GzcJ9B5jv8cduC1gVsO/GDdjynRBDnI/vx45jNY
	 1DFPfpURyml8Cjgot1ogfESMt0J8Zjvm9+Loyv7L2ckpBz7TTIAqnxsMZ2I/Y9yGFK
	 yuykX3Mcto5IL5BfVtOdrJDwmy6B9VeWVgsmbcx+soUPFYwRs7eM7FsYlWiHmZ31ss
	 8MHRycVoMV/cA==
Date: Wed, 2 Sep 2026 16:02:51 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 0/2] doc: Rename dynticks-testing to cpunoise
Message-ID: <apgsi2GCHfOirYcG@localhost.localdomain>
References: <20260902092434.85096-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902092434.85096-1-marco.crivellari@suse.com>

Le Wed, Sep 02, 2026 at 11:24:23AM +0200, Marco Crivellari a écrit :
> Hi,
> 
> Currently the documentation still mention dynticks-testing.
> 
> Recently the repository name and the tool have been renamed to cpunoise,
> both the patches reflect this change.
> 
> The tool announcement can be found at:
> 
>   https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/
> 
> Thanks!
> 
> ---
> Changes in v3:
> - Use "https:" instead of "git:" for the repo URL
> 
> Link to v2: https://lore.kernel.org/all/20260831092118.124576-1-marco.crivellari@suse.com/
> 
> Changes in v2:
> - Link to the tool Announcement added in both the patches and cover letter
> 
> - Corrected another occurrence reported by Sebastian
> 
> Link to v1: https://lore.kernel.org/all/20260831081823.67972-1-marco.crivellari@suse.com/
> 
> Marco Crivellari (2):
>   doc: Change dynticks-testing repository name
>   Documentation/no_hz: Change dynticks-testing repository name
> 
>  Documentation/admin-guide/cpu-isolation.rst | 4 ++--
>  Documentation/timers/no_hz.rst              | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> -- 
> 2.55.0
>

Acked-by: Frederic Weisbecker <frederic@kernel.org>


-- 
Frederic Weisbecker
SUSE Labs
