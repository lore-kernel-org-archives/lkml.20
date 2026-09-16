Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B41E4A689C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550512; cv=none; b=If8PL2LhAgVEMliqxRNck817295KUZOca6JNuqHMj0N1KTvku0iYKecGIbTpBJr+2HNUmPfizXv0Y3OAZDpjuTh21ayD/VpmiN8StNj/J3GmX4jq6X67W67yDwefRfcBxqfWShEEBupTyLMR9GzfgVoZCK8obIi1bBG6A8OBqHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550512; c=relaxed/simple;
	bh=K0uH61lw+oZIPpoiIrm3S1A78r/kWLB/mXnYOehDefA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2ibVM19Lf1uYByC6RDzskraKYiNG/J451EEM4LLJh8JK9eFD7CNNbAiOzpSJXuQp5lgq6Vf1twwU6wCDUEK65iuDiKTX5WOjYyp4rw4F4Afp2H6tyqPXfz9XTIxFcKsZWX5dg/RjnAA+E7RbW9Cb9KT/v/erGD8k+rLIvHx9Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKj9yKWq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKj9yKWq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8C91F000FF;
	Wed, 16 Sep 2026 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789550486;
	bh=2SvvLiHnsXWprFsLpaCyuZ2657b3nrzkaLsovBU0I9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VKj9yKWqyoH4DhxCbywddVdoLjoFucu1E8mkwj00FULlSqeR/EyhTKU+DNZVVK+gv
	 uwql+erzrxO4iRbtXWG9O9frRQ9Iarw+ffSnmbiwPKOrLWiRpR+K63FDVCHvpEpM+K
	 btK0OSCpPHoJGYF9uTWcr2nOqsJCnN2ckNuCtrG5StzzaWan1nid4c7craH4neOEzU
	 80v1oeP9dmw1fQnEaAyHnr7HZB/KzvhzWYVBAd6zzTD4JJFHYfz0xWi34oAEPf/izM
	 q95GR+83tf1oJk01af6RfYMgmAQrxtM4eCoYMySlvQpku7XVG56kAeuwbaPqzAwiEv
	 yj1unO9Ioee/Q==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1x6lpU-00000005xYJ-07ND;
	Wed, 16 Sep 2026 11:21:24 +0200
Date: Wed, 16 Sep 2026 11:21:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
	cocci@inria.fr
Subject: Re: [PATCH v2] coccinelle: api: add a checker for
 pm_runtime_use_autosuspend() usage
Message-ID: <aqpflCAorrufh1i0@hovoldconsulting.com>
References: <20260915064327.1377-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915064327.1377-1-joshua.crofts1@gmail.com>

On Tue, Sep 15, 2026 at 06:43:27AM +0000, Joshua Crofts wrote:
> Add a checker for ensuring that pm_runtime_dont_use_autosuspend() is
> called in a file if pm_runtime_use_autosuspend() is called and its
> devm_* counterpart isn't present.
> 
> Without _dont_use_autosuspend(), removing devices causes resource leaks.

No, as I've explained repeatedly elsewhere, it does not cause any
resource leaks. [1][2]

The autosuspend setting leaks if you will, but that only matters in the
theoretical corner case of someone rebinding a different driver (which
will soon also taint the kernel).

So don't exaggerate the impact, this is essentially just a cleanup,
which is fine in itself.

> Assisted-by: LLM
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Johan

[1] https://lore.kernel.org/all/aqpd3viN1UoZBkgL@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-iio/aow51Nk-cet9qaUQ@hovoldconsulting.com/
