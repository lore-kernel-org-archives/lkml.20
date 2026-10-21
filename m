Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618063;
	b=G8Q0Ex03hnFU3VrtYpNZY+d3vdL9VMfaIT7katiS/1UAbobqderJTszauMMqNN+GcLiH
	 q/jGwMIYupW7jJikUVvMVfVUEw36ls1zELfXphOGHeRF7i3jVulxAA1bNy958nBil6RQf
	 r+/SfqQMAMwRjNkkK9aRDVFvLpKFtmoNcFEowDLq7/Xk3JxEXiKAoinN2Nx0iM5Wp+04s
	 ggZx6dyI8QcPC6sSpQw78ChVZhVJvCbtsXB1xPzmRaQYDZOKqSrI/35gGx3WtcZcDsHv/
	 Pa3i14uPX+zy79aXX7AmNHDa3G+FVm3N1JdNN1esXugdlLdnqGADOzSt6b97uzz822A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618063;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9Q79igMfokPbIn4EF3OHWsP3g9W63ebKo434jeW1LzM=;
	b=pTFkezw+9/OinRSS1kqeeIFze5wz7CRNjhuauqJ9IIkBIVLr3dtWJV4KmxowgLlbbeKe
	 nz4aFjJOamOa8l5wBWyIMI7XB9gHEf02aM+PSEKCQ4Qj6LGwgU3fzTB7cyEWNwbF8eLAt
	 k1x0G6+tvygGGSnrwZyM/DYTCuf4qdV0iMFlEjRIddd95W8XrMN+P3dE24TzAt8PHV0sG
	 YMB54CCXtoka8RwZDJ97gC4CbY/FCYQboF/SSCBRGfUMTWdL2sjUMiJKbYLvodaQ5mE45
	 bmNlgXdTdjt/d5zsssZMq9EcfkcMfVqss3ccZW2roa66ShOJIu1AoXcLhWNL3Hin5Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYcBbpX2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DF6606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYcBbpX2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30951F000C8;
	Wed, 21 Oct 2026 21:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792618063;
	bh=9Q79igMfokPbIn4EF3OHWsP3g9W63ebKo434jeW1LzM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AYcBbpX2rk/d4fk4EfwD0tkZh3GQXUshFjLTTvFKk3ztvwgG/jtwWEXreKIiWiB7e
	 7K9SLcHWjszHxDrCfvCK/IGOVVmH+eaF+G8Vqws8zJEiGUcZr0gXZys55GP0S0LRbk
	 FdYgVOHil5ybD+tcXBf0tqYRuykk1CfZEGrwrADfAuMIOVNDGGgL9p66CcYeZWPflI
	 enswrK01qoHMxdvVzOoMJ45Z1++TGc6c2xrkBQIEj87sfdUQYTg0UgQD2qJtIOhVZr
	 cse3InQfCYfHiOnsInKA2TjYoUmqPk/U1EMTeMH/tjUrQ0HPS6/wBM8N4g7rOSqtz2
	 okiW3/nJDc0hA==
Date: Wed, 21 Oct 2026 11:27:41 -1000
Message-ID: <c46ebed464535b07694a449976cdd27a@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [RFC v6.1 2/3] workqueue: Add support for real-time workers
In-Reply-To: <bd59f9aa-b0d3-474f-8c95-f3763e320638@igalia.com>
References: <20261001160711.59888-3-tvrtko.ursulin@igalia.com>
 <20261001184848.61776-1-tvrtko.ursulin@igalia.com>
 <3a139a32135c149f51bac4f2bd58ad56@kernel.org>
 <9bb46cf4-7982-463b-8289-06bbc319bba9@igalia.com>
 <cb60b6a0f8f35957d64c9abf240c2dbd@kernel.org>
 <bd59f9aa-b0d3-474f-8c95-f3763e320638@igalia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, Tvrtko.

On Wed, Oct 21, 2026 at 01:53:01PM +0100, Tvrtko Ursulin wrote:
> +static void
> +sanitize_workqueue_attrs(struct workqueue_struct *wq,
> +                        struct workqueue_attrs *attrs)
> +{
> +       if (wq->flags & WQ_HIGHPRI)
> +               attrs->nice = HIGHPRI_NICE_LEVEL;

WQ_HIGHPRI only sets the initial nice level, which can be changed
afterwards, e.g. through sysfs. Forcing it here would silently override such
changes. Maybe keep setting it at allocation instead?

> Could you please confirm (or deny :)) this is what you had in mind?

The rest sounds sane to me, but it's difficult to evaluate without looking
at the patches. Can you please post them?

Thanks.

--
tejun
