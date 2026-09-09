Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F9552B1D4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951712; cv=none; b=TLflbza2z70g0NYaOmEuxKrqhPAn4odTnLZrzXPB+0nZ5DQT6nAwO7/uN9fmMT99lKRN1SnTbayg6MK4WxQfbyGcA/wmLgR092V5RGSM1o7fai2o/afHQ+95iDFBtckA+uA031scy/1QTpdp9VvFxEqHGmxcXe1sd8qHvztX2Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951712; c=relaxed/simple;
	bh=nRNsNgLbY+iGz1VaxHrwrHBh0r2xnP7DJ3LrEL8BoUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnkgMo3+NIWF+M0tJuvx/yWtGpLIlShlNvOXKsJKxTR9RwqkEFfJbiT5Qaxb1NcAdfZWBmx7PDY97lVNhIapplPNbIsmUWdV1Fb9RhCfawbeKtlp+WNmWHhoYFbxaI2XiKYln9xKNH7AZ+5p9SOFgyUOltKvTNCcfC4zTYOgEH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=O/UWhv8v; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="O/UWhv8v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nRNsNgLbY+iGz1VaxHrwrHBh0r2xnP7DJ3LrEL8BoUQ=; b=O/UWhv8vP4S/CpcCSexc+CkLdk
	mkDPKAWhevP214us3nYLeCr+h+k4AGCL12S8kZzUzyI1vG1Ru9oc3BS2ribwjGqWmqdj7Mf3ydyaa
	Dt+XgOigvXlhZuyNZ8y0POrZu55Mxu/7KMIjZWTvyDuuLds/Yy5IFdEWqGzkgUrjEb54yXJ+GAsSj
	CtxoVsvOUSk00O8F7ba5KfCNdz7nGJ99npxwtHCAlcow5xUNfhZkSeKhz4UGghWcMUSJ8HTJfc5TU
	3U5XpoG2ybrXvTTp85M2ZeA69wU3BJMXlMNqtB8DZmPq4EiDXQ6RVeJ6xqmNRMfllR84xMcacftQp
	p96+0Mtg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4G3d-0030Ut-1S;
	Wed, 09 Sep 2026 11:01:37 +0000
Date: Wed, 9 Sep 2026 04:01:33 -0700
From: Breno Leitao <leitao@debian.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Yao Kai <yaokai34@huawei.com>, liuyongqiang <liuyongqiang13@huawei.com>
Subject: Re: [PATCH 1/3] workqueue: Add for_each_node_with_fallback()
Message-ID: <aqE8WzDqiShwshMX@gmail.com>
References: <20260901210929.3092513-1-tj@kernel.org>
 <20260901210929.3092513-2-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901210929.3092513-2-tj@kernel.org>
X-Debian-User: leitao

On Tue, Sep 01, 2026 at 11:09:27AM -1000, Tejun Heo wrote:
> Per-node arrays in workqueue carry an extra slot at nr_node_ids for
> NUMA_NO_NODE, and iterating them open-codes for_each_node() plus separate
> handling of that slot. Add for_each_node_with_fallback() and convert
> alloc/free_node_nr_active().

Yea, that makes the code easier to read and reason about.

> Signed-off-by: Tejun Heo <tj@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>
