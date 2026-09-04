Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4814CA764
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541302; cv=none; b=ZB+ddVaQyFM+2R2ch3wtJ9E44FbwUHPtojDDEAUG46D7Ag2PdR4GPQ/UJyH2iWHWwMP+S7LusRwNX/XlpWxf0079kbXsS/tFdZLcDvK9RFNymRE3IPnONNHCv+64F4hhBbesPkbm0wfe1fvFDMQxiAe+YfrcV/PnoTwh93Ozbo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541302; c=relaxed/simple;
	bh=XZjZgC9Ywt7P0dmsX+yJ+OJCyjLckx/kciPXVFJNT60=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=gXkSBsBRaoHOKHgy7zWvCODEqVdtf8XZ3FPcZT3c82zM01GdUE8EEVQ92pEtplZi1F7rmBznICSTD5uWCApHcJMX0WMo8tM6iqzjR3dX7HsAiGcyOx9sfzsi7j26BN0nyQa2qDDYk3s7o3mlHZzxJPd5JfYy28w9JWO/Zz+WiaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QeINAo77; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QeINAo77"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589301F00A3D;
	Fri,  4 Sep 2026 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788541301;
	bh=P4jFdkzUXcRdOd84e4NLl4acjCKi0OO7YH2+9CvPh3I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QeINAo77wXOKZL8NbBLsXaAlPhEV38o5DJA+qF2mRo1ueLb7MjMqAPeC0pqtfH/bN
	 /hToMTTEw74ppUSW+Tv/ShILRjfg3LShikXjPbY1n/Z/4rviIU+YY3JV/RaIGjM95h
	 oxiymCTgaUVjmXxKiuNK7yzzTGUNztxLB0MXRw+wJ5W3Ok+8Vw2JejeQL6T5XHeN2h
	 id9du1t9d3lHLlX5zBJySD/qFvaiiUpiR89hwpzplwNR3QCwMJ4VqiHKFTY4iQ0mmv
	 cMvgn0yrDTUD5Kj4G5874f69BJZ3wwvLS48ONo3N4FHZMPvOZn4b45H1zJOqDNVohI
	 218lSyRzt8qsA==
Date: Fri, 04 Sep 2026 07:01:40 -1000
Message-ID: <d0f2a6dd88101fc30b41f7dfdcb46f8d@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 1/2] workqueue: Make alloc_workqueue() unbound by default
In-Reply-To: <20260904141421.287647-2-marco.crivellari@suse.com>
References: <20260904141421.287647-1-marco.crivellari@suse.com>
	<20260904141421.287647-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello, Marco.

On Fri, Sep 04, 2026 at 04:14:20PM +0200, Marco Crivellari wrote:
> Currently alloc_workqueue() ensure that one among WQ_PERCPU or WQ_UNBOUND
> is present. Now every user has one among these two flags.

rvu_afpf_flr in drivers/net/ethernet/marvell/octeontx2/af/rvu.c got missed
and still has neither.

> +		flags |= WQ_PERCPU;

This isn't mentioned in the description or the documentation. Patch 2 says
workqueues without WQ_PERCPU are unbound, which is now false for WQ_BH, and
the WQ_BH section still says WQ_HIGHPRI is the only allowed additional flag.
Please update both.

Thanks.

-- 
tejun
