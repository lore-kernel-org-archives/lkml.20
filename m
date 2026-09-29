Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3FA2459E1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689879; cv=none; b=az1IXqkZgOBKJkijh95Ai/BBCj+YuS0wUEdWYezzma6GGs0guR5QoOEn6HOkkyA5fJFPqcemuSNtsGCawKFu8ftqLnppxfHW4fBnXxy3Z70FoeUuSl1GbHOB5VHyW2nblkKymD7AyWcQjVCXeCIuD8fvOlN+9M/kWp1UqJ/lvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689879; c=relaxed/simple;
	bh=TYF29B8WG+iQvzzIrANYNP3KFNzNJZq/Q0IdpOUlnts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxRgQyHhsPQ04tI5ctGOvyMLfu8UVzMJ8qtWsn5hkvB5qbFBz+numDDFeINUHcU1LZNjvL/0t3TjiEYlgRUxcKFKZqwhhi5tdN2M4vh9FixWWAQteX0ZxKsPIzI/GKriBjS2XF5/MZUYunUs0kaFnvh7rjtyTMwUk/+NKv68erE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=aGLFW+Mp; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="aGLFW+Mp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zFuTF/YqpoHkqpDwBGXiRlU4Ww8ZRrUwfgBzvlLnBEY=; b=aGLFW+Mpk9muBwNh+BGdSwObeZ
	8/eDBDvf31XQ4dXmKNxpSP4A30wYSz93OcsmK78OtLFxixEO0/DuKqEIVJ53XlrXAJ8VGILSMwqGu
	IfX/Yq4LGsXrepS7XbBRP67Z4+uM5NhGqmPX4MJAXkZ5RWFYJbFEfbh0flPOMcJFd2wq+ylQNz8aj
	ivRlRPfNExkzQUQcGRqXtqphQr/5PV1mZvvpTG/ir3bSQjnNG451f+VhsYTugW9o6t4isQ34KaehV
	7d2kr2Bmrjarvdkfuity+15oxTgCuDtIOxQjzdY2LyAhqnpkKEyUrNqjK0UquN5GqW9/ZIgQVjFqh
	c/qvnRMg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xBYEi-008SFT-0J;
	Tue, 29 Sep 2026 13:51:12 +0000
Date: Tue, 29 Sep 2026 06:51:07 -0700
From: Breno Leitao <leitao@debian.org>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.4 v2 3/3] workqueue: add a
 percpu_concurrency_managed workqueue attribute
Message-ID: <arusuF5mAEukjuJ0@gmail.com>
References: <20260925-wq_final-v2-0-860ee052169e@debian.org>
 <20260925-wq_final-v2-3-860ee052169e@debian.org>
 <1bcd7a71f382de147d7e26ee14f00ac7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bcd7a71f382de147d7e26ee14f00ac7@kernel.org>
X-Debian-User: leitao

Hello Tejun,

On Mon, Sep 28, 2026 at 11:31:11AM -1000, Tejun Heo wrote:
> On Fri, Sep 25, 2026 at 06:09:52AM -0700, Breno Leitao wrote:
> > Introduce percpu_concurrency_managed, similar to the discussion in [1],
> > and use it when deciding to do concurrency management, instead of
> > relying on WQ_PERCPU (the only WQ type that does CM as of now).
> 
> Once PERCPU is its own scope, the scope picks the backend, and concurrency
> management and the per-cpu max_active follow from that. Opting out of
> concurrency management on the per-cpu pools is what WQ_CPU_INTENSIVE already
> does, and I don't see a need to change that at runtime. How about dropping
> this patch for now?

Ack, I will continue to decide about concurrency management by looking
at the affinity scope other than a new knob.

Thanks for the review,
--breno
