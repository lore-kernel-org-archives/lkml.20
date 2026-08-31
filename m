Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA82E3AE6F4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214286; cv=none; b=oGVLv7w8Eu7M2SKOVLxwwQCPzCvbjczwWhESK+MEFu6jXdTbc2np4EiN0kdQFQhT6UKmUkq4kcevZd8W3fs9PGh3cUil1NudO9YGPB5ijIPrCLqlaFKhNKF+vtk3uOmZbVvoOCiKB8DmZCqb8zj0i/oRmDpC2jxciwT9L1grBKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214286; c=relaxed/simple;
	bh=IwQrm+ccIwKEsKnbOLXOa6ygQToRJN9Xf71kRvd2n0c=;
	h=Date:Message-ID:From:Subject:In-Reply-To:References:To:Cc; b=Y/PnzI7HP0u/oZUH1mQKRFqUl1TI87urUTUV8XwaHkm7tFVZTJBvDhD35LCjPMJBfYLGH2dNI5U9cRJk6auPTCpY0QdOn99zJxP6kh8WuFA/PFgq52nYM10vKGnNTyD0esNmromNgnC23ReNKxfTzrx3TbRovgHjawyQSCt9yT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noQdBHeM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noQdBHeM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E941F00A3D;
	Mon, 31 Aug 2026 22:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788214284;
	bh=ZtMM4NfwW8ZyuOdif5uEqU9NpRe2k6kuR4J/kPJPTxs=;
	h=Date:From:Subject:In-Reply-To:References:To:Cc;
	b=noQdBHeMy8Xk0yrmABQHasPVeV6cPNTmcY8WWG++Tvc1KKJ6A7R7/4rMUkXNXIMpE
	 pqxkMHG9MVTjq7L1lzdjkEjHnYDvcXhVcp+g0qeIX7NLQlMs0x5BxJ2cQdTterukMU
	 kkiRANlZmWHD0FtL37W6YZvLnFctVQCExUqxdM9DR06F6+WRt3/gJ+uOaISF1SgPHM
	 XCeQ/dmmxFCPumUfF3Kqh+aw5ioMYvEOipQwXn17wPT7UIPGVus5NnSj1bAcANN/NA
	 sfVOsflG43J/k655q6K0Ba7+gbiAD5V41hkczGZoCBPYbPaP6+mfs+tLSafGl1SsYo
	 6HGsEeBAAHurA==
Date: Mon, 31 Aug 2026 12:11:23 -1000
Message-ID: <205d4b3743dc1cf7fe0abac104b2d0b5@kernel.org>
From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 0/5] workqueue: unify percpu and unbound pwq allocation
In-Reply-To: <20260819-wq_realsplit-v1-0-6ad3c3f48be8@debian.org>
References: <20260819-wq_realsplit-v1-0-6ad3c3f48be8@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org,
 pmladek@suse.com, marco.crivellari@suse.com, gustavold@gmail.com,
 david.dai@linux.dev, kernel-team@meta.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

On Wed, Aug 19, 2026 at 07:37:34AM -0700, Breno Leitao wrote:
> Breno Leitao (5):
>       workqueue: move the unbound-only attrs check to apply_workqueue_attrs()
>       workqueue: resolve the backing pool in alloc_pwq()
>       workqueue: make the default pwq optional
>       workqueue: build percpu pwqs through the attrs path
>       workqueue: rename the pwq slot helpers shared with percpu

Applied 1-3 to wq/for-7.4.

Thanks.

-- 
tejun
