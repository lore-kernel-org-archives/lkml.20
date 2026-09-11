Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E463542F8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138360; cv=none; b=L/LAhDXWCjeuiIlZfQsi5og+c+UMtnGJNnlIsXxT+40O4R2gkJqdM3p+q/bc6g0BJvDgd7VZcHeR4snm2IqgvngH2MpvAyxVRzNfh+uWGWH58amG4sAuUlOhq8eLXJz6rZJuA3/yEI+N8kf6mByrRCum/0fn5Uii858z8ePJSg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138360; c=relaxed/simple;
	bh=VnDA+HtlDN5W62WGfmM71lMrSGjDZrKjgyu+mzQDaWM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=iccdZFnY4FiQcvpWIKoQ93ZAFEDC0qFnQPKHQmrr3cWSVHPuCi0MW4h82ewY3rpgtNleY7FEwuQYdqgeb6IF4KD228CB7Xu3hX2eYz5hNRLBdXfBWeOxC9qRAUDhRZqu/E3vJM8YMXVXSlDBo3QDpQiBSKfVrALbGijoLs31zT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiFCG4BS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiFCG4BS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6483A1F000FF;
	Fri, 11 Sep 2026 14:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789138359;
	bh=RxygCVIXu5CteFIzIENMgM6Mh7bbtXJGcW6HzFUcpm0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BiFCG4BSohZpt8OG4YK67TMpOaz3OYpJ2KRJe4Pa350kMnYfr5lBMe9JRg4CKZeYM
	 3NFQPUOG6QvUJwS5Pa5AQJ7ZuJj8cLKS5tLkNXHF16JVOKX1MxDLtHWf1jp2/WkNba
	 BkGJO4JVCSVyx+6WgV2SmjWbzyootghL6eOGS5h12nu8UEHSMrhtZjXd+gPUmJktGa
	 ROdPjX2H+qJDbgBAJpVeRPVTiWXbCHsksqdcmp/6Emk+JXYQ76L6d4c5S0K67PWhFI
	 oTn1zwIo161vj73LTrHNiuq7I9DwY1L0wzlz+0UYp2lQEvZ1RKwYLLejIclcJRJfeE
	 PlQjrtIA9BwbQ==
Date: Fri, 11 Sep 2026 04:52:38 -1000
Message-ID: <5e201f71b1acb9f73d43199566c977e4@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH wq/for-7.4] workqueue: BUG_ON() a pwq release before
 workqueue_init()
In-Reply-To: <20260911-tejun_bug_on-v1-1-8ee9083f7a7e@debian.org>
References: <20260911-tejun_bug_on-v1-1-8ee9083f7a7e@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

Applied to wq/for-7.4.

Thanks.

-- 
tejun
