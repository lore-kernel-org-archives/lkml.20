Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67CC563FA7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171267; cv=none; b=N9HbFWI4SpoiX4HACdu7TSEKJPQMB+1Vqk67QRp5ddNF+QdIl7HOqEKauKZY/BlMyRXTWqNWnA7HUtyaS1wSSoniCF8xP7ilM1RIFpoGpYqn4wgQZOxwEHUjLi/2O6b5T//jvYWd7TEMNB+3OMY85Syu9U1k2fpLxlTVPU3Bvdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171267; c=relaxed/simple;
	bh=GQy1nV0Om9AWLzo8Lhumgr/WQ3S3ogpC3jGrJQvU2SQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kOev56/PPMaDXvz+yu5o/KP/DoqVjFsWFq7T9WGGmXXXjxfyfWDX8cmr7dQ5e7u6LeJElG5mR5XPaa8QuWSqoyhymwe3CwdRXHPq0X6173G2nsSxDJMgK0W7VcTtus8uUCdkfbGL+p+SIzVHDz8jD46h6GbBO3oHSccGB5BupLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIrvJ4B3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIrvJ4B3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F68B1F000C6;
	Fri, 16 Oct 2026 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171266;
	bh=3DPGvzzSBAA3Cq1qjnMwdGIcJS2iIX39f0K0fXwP5YI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XIrvJ4B3PTnp5qE9Hf94NgZ7ubKgicJAksrG3TOKlkqSKMBPvES0Gj57MEQZsvuDQ
	 wUDevxP1P9MCb9E1UjsxPmwKJXR3qrGkNkfcZ28hkvm9mCIg4pHstkTz1i2SJa5yKE
	 cxBASCXGzOyZGIg92GgvUo5Cs3oblwNNYe4PfWlzdT5Rc2XjrA6/jo18hBMeeGx/KP
	 yNwZMxFZAO4y5rjtO68xREXZSKB/uqGaow+vuimBEXDeMFY2Qu3OsFHvD9cZyTRE/j
	 hpsD1z+fhHsiE0Jp8ieXeBlb/oRWC9a8gnLo9fgPFMr7f84hNTu+Oy80r3t8wt77lh
	 0pav0AT4EFP0w==
Date: Fri, 16 Oct 2026 07:21:05 -1000
Message-ID: <83ad009e5a67b25fd8fc495c046d7f2d@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.4 v3 1/3] workqueue: Move the initial max_active setup into a helper
In-Reply-To: <20261009-wq_final-v3-1-eb0b095b9de3@debian.org>
References: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
 <20261009-wq_final-v3-1-eb0b095b9de3@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello, Breno.

The following is a Claude-generated review.

On Fri, Oct 09, 2026 at 05:18:34AM -0700, Breno Leitao wrote:
> PS: Eventually, wq_init_max_active() and wq_adjust_max_active() can share
> some code, but, keep this as a simple code movement for now, and then we
> can come back to it.

Maybe move this below the "---" so that it stays out of the commit log?

Thanks.

-- 
tejun
