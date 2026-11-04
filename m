Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810114;
	b=NDvbFUaRFLs8nNyNUBmlyAsM6DX+w0bWkSZQtc326b58er2yCudBQtFbLkHkv7bxlELt
	 6HZKzp7TgglkABOty9WYpZDvKINmd7/Z65ayhjqUu0+T3+ttwuHV/epXvpX093pHIJd3W
	 USOWXXeIx8A7wKPJ9vAEybcqaZVRmc1W7jiHrAwsWoznol0TTUWLaWkIYaoGcIqEzllgz
	 SzTqv5imLRy7ujueizk4nXTh8kBEk3qmzv73/IDOfikwN58I7umLpq6xa8OrxqpaRPiRC
	 8RRAGooQm+xNJVqKa9GsnxY61ws5efDn8Y0dvImqWQi1QEwgWr4Nqzx+9MJYGzIRMYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810114;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8bvMUN4Wk0BgGgF1RgcQrwazIY2aEPvQvSEkNPHOui0=;
	b=1w7xhQPbEIshvjd/IOzC93cvgZVXexBGBKsP3pu9qVhJLeptphFb84lt/FmYtvPuQeU9
	 hf7tvemNBPZN0qa/EQLKSb5uBjic8w5Z2ZicrohVFoJZGaI3qYoUCJAiXczBjh+NJ/9fF
	 buTmiJwZA/L3V/Z7Cm9RcvGFfvm9Oyaoj4pI7thlsdHns5VcFZdj1Cx0c4sXx8m+bv2cK
	 XAWjj7EDXnAv96nUvjLbVKpvB62qRHfO6u7V/h8vlwsS/l9T3CNYhXcjnMOT/9nseA2Q1
	 PpS3UEBh6Rb1SBvyduf2ltU9YKwPPIvTDFR8BWSAgxvbw1BSBY3+rdW7h4dWmvNLrCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3upLpGT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB92C606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3upLpGT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD641F00919;
	Wed,  4 Nov 2026 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810113;
	bh=8bvMUN4Wk0BgGgF1RgcQrwazIY2aEPvQvSEkNPHOui0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H3upLpGTA18T3EdPjgIqGURFX6ukYjVdk4P/01EFshF+ivtLq6qY+nk8M3sk4aLzX
	 RwE0YkeINt8rYueavFNh4X2mLUVn8+ivmbEw/uJO9w/YzViENqud/DUFDZeR+K7R1P
	 wkpSKRc2AkIPhOMpRoRXp52AtCwpEAh84KRCtdtv57fqIdLVNVX5M9H8Nu0oc48qFs
	 3ausvv+JRE2zdKjXBOzLhOoTiZLf8xFgz7PII8xS4EztgpfilaJPScx7V7z+Sd3wC4
	 23/b4UnjLbBkyZ0bDViGXjRdJMy6NPkJZcxKu7rp4pP9NhfSsN2XEDUwwOCPvNlND7
	 2QVWrBW8ijxbQ==
Date: Wed, 4 Nov 2026 09:35:11 -0700
From: Keith Busch <kbusch@kernel.org>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvmet: drop the extra RCU grace period in
 nvmet_ns_disable()
Message-ID: <autev0xlCzBMz7SC@kbusch-mbp>
References: <20261104-bug-nvmet-ns-disable-rcu-v2-1-b158a59318ad@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261104-bug-nvmet-ns-disable-rcu-v2-1-b158a59318ad@gmail.com>

On Wed, Nov 04, 2026 at 01:31:28AM -0500, Qiliang Yuan wrote:
> nvmet_ns_disable() kills the namespace's percpu ref, waits in
> synchronize_rcu() for anyone looking the namespace up under
> rcu_read_lock(), and then waits for the ref to drop to zero.
> 
> Killing a percpu ref that is still in percpu mode, as the namespace
> ref always is until then, switches it to atomic mode from an RCU
> callback, so the ref can't drop to zero before a grace period has
> passed since the kill. synchronize_rcu() thus adds a second grace
> period in a row, about 4 ms here, and disabling the namespaces of a
> subsystem one by one takes about 9 ms each.
> 
> Drop synchronize_rcu() and rely on the wait for the ref to cover the
> RCU readers as well.

Thanks, applied to nvme-7.4.
