Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081D44189DE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247528; cv=none; b=nWbQuJ531/ZNHNDVGATTU/3iYavpJq2sxBtm4uwl+RErp+Hi8PA3R1L0bUuPRKxT4WKPgyecuSMwTCqiTowoq20Z6YSaEK6ldGGRutU9DVwFIu+YnAhisG3ga1FxF/eIEVqWA0r/rapNl/S3Pv2vxqG6PbY7/jzOTua3/4saCKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247528; c=relaxed/simple;
	bh=BMsAggu2rIv/S9UwZErhUH/2X7ypE8hVQbP39DVTloA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwN185SMkgdbIoGvkVQ6HVGVD9adApSEJFIr8bIqL7GJvqswHbbSp7KqBZsBys6pCsSUJ1ESq4bsepqW6mdkkL/Dw28ghKdyIapJO5oO1abUk1uz6j3V8Wk2ieN8Weg0/QO2d0hgiU3r0C9FX9Xrwws+vBKNDYjkzNYGnC6CiuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgXgMlzw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgXgMlzw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7268A1F000E9;
	Tue,  1 Sep 2026 07:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788247526;
	bh=f70YFxG4GjiGHCz68aNtXwJu84EKm6ZQbGp795Xnei4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HgXgMlzwXRpSxTj9gGLIzfOzyFzqGVc0vugvXQST154BMTRRgX4fujRkNPMGQVZmX
	 5qEBoZad4CF4C1xjAFa9PvxqsmXPNPTCgpDyaxIC1YpqugTvwN4XjQBhOPm6vTEqB2
	 ZESAIlELQ3Cc1hrjYGA0uOf2solHq0b64DfMW/ouHxkB+j9AvpRY4fqxtCRQlfJxLt
	 VxEx16F71tVPhajKTy7fur8gZ7FECLzPS19ZTwSzC0Rb7uawBdkVOjNYWBV139PDxh
	 35giSripBpKiqjjJbgtE8gQEK0OCPOESzRaV/NuZXUJzuKB+Zu2KWzOATNOf9LzQxU
	 BDdZehOGXbisA==
Date: Tue, 1 Sep 2026 08:25:23 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Maxi Saparov <maxi.saparov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Seth Forshee <sforshee@nvidia.com>,
	Serapheim Dimitropoulos <sdimitropoulos@coreweave.com>,
	Maxi Saparov <masaparov@coreweave.com>
Subject: Re: [PATCH] firmware: arm_ffa: Unmap RxTx buffers on device shutdown
Message-ID: <20260901-wild-parrot-from-uranus-e0c9ee@sudeepholla>
References: <20260826222337.73480-1-maxi.saparov@gmail.com>
 <ao9sWrszkXwj5-PK@CW-D0XG2Q16P7-L>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao9sWrszkXwj5-PK@CW-D0XG2Q16P7-L>

On Wed, Aug 26, 2026 at 06:47:11PM -0400, Maxi Saparov wrote:
> Apologies, I failed to spot Carol's earlier patch for the same
> problem before sending this:
> 
>   https://lore.kernel.org/all/20260818224404.3694580-1-csoto@nvidia.com/
> 
> Please disregard my patch in favor of that one. It covers more than
> mine does.
> 
> Some corroborating data from our side, in case it helps that patch
> along. We hit this on NVIDIA GB200 systems in production diagnostics:
> after a kexec from a kernel with FF-A active, the next kernel's
> FFA_RXTX_MAP is denied and the driver fails to probe until a full
> system reset. I can also confirm Carol's observation that unmapping
> the buffers alone is not enough. The notification bitmap is retained
> by the SPMC in the same way, so the cleanup has to cover both.
> 
> Happy to provide Tested-by on the next revision of Carol's patch.
> 

I had replied to Carol with reference to [1]. I prefer that approach, see if
that helps.

-- 
Regards,
Sudeep


[1] https://lore.kernel.org/all/20260729-nostalgic-accurate-raccoon-ab7d7e@sudeepholla/
