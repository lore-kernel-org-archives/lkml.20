Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8A7381B1A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460964; cv=none; b=SRImuHeUJ0RETeu3/4KQEXQdvh3dQC8aiYH9XRCPRidjx9y9eK4QJneB7D13mnZ3pmiWZnL38FhjwrXGRMRHdnv5UKhXT8/bMsXIcQAqcY/u5f3CScd98AufPFgdWnVx8dw+3v3hMnwFQJ+NMdVByOZDiEDHBT7iTyyYK8PTxOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460964; c=relaxed/simple;
	bh=ydILn2tH86ABgtZGZW5BVnzCB8twiQzVH3NV54IP/AE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=nbZPqFzveYppiX0IIUOPWTTZoqfjwU941gKir/gZ65O6qsQEFO+lYOawTcqJU27uVyc15tRa6iBj0KZ5Dv77G6pfnC9nQZ614lFOzs+kY6o9TWIam5KDbjzL9bJJWdO31+TDJ6iLRUK/5pypkHxFMLTcVL9dDWusEtG4vKepQg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXDf8L9R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXDf8L9R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF9D1F000E9;
	Thu,  3 Sep 2026 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788460962;
	bh=nbldedxtnDAVHRfmn4fqo5vEq9ymjuTTfNdltkP/+ds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GXDf8L9RSgpvkZMb0t+14L5oXmmto92EqyruVh9+DJrFPe3/G3INEoGJdIum53oZ7
	 5lhgD/q4hXIT9WZeAf4HSyrBqHdTEk5G5vOldlMfepohyPkp7+Pcj1rvbPs5yZJO0w
	 4QeJhQXiCdXeGsyzwgJIN33UhCwrgGv9kZPUu9v7qGc2V8LsRq4xMFsVeh7nDOA4qM
	 EfZYDTmO+eTvgLWGa09g/0zDzcjR7Xcki4VCADrS00EVSDKXLi2v3jth9Xj2kskiXr
	 YwaG8L8Dpmz+bUgSWPP6Gjf3vqIBfDJcXrHPfAdU4g/Rpjnfv5SL04/9jIQWeM74UQ
	 MWszKnU6+bzBw==
Date: Thu, 03 Sep 2026 08:42:41 -1000
Message-ID: <c02681b23c71737d9a84dea194b24691@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v2 1/2] workqueue: Make alloc_workqueue() unbound by
 default
In-Reply-To: <20260903165251.481362-2-marco.crivellari@suse.com>
References: <20260903165251.481362-1-marco.crivellari@suse.com>
 <20260903165251.481362-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello, Marco.

On Thu, Sep 03, 2026 at 06:52:50PM +0200, Marco Crivellari wrote:
> +	if (unlikely(!(flags & (WQ_UNBOUND | WQ_PERCPU)))) {
> +		flags |= WQ_UNBOUND;
> +		wq_unbound_by_default = true;

WQ_BH without WQ_PERCPU passes the __WQ_BH_ALLOWS check above and then gets
WQ_UNBOUND here, putting a BH workqueue on an unbound pool. WQ_BH should
imply WQ_PERCPU.

Thanks.

-- 
tejun
