Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197551;
	b=PAStFobb+Y3oklo7vMKq+GE+rqflxTRqUWk1+O7/XHRNv/pXvTgIOBKaigBAM9NUHzf/
	 dnqo2nJ6B+N52B/5ro3tjosJlh1zoCC9A+bJTcPBZf6uLOyEcUgnrnpHr6s2RHCmvL5wv
	 637yLYLVJjsTjk8t6BZ2clQYSEIqP1xxAH70/uRjvHlwlaSv8wkOa6yNA+6If/+lxKJ8K
	 ZVNriKzN9qT7HIKbMR3W/egODILVcOkjmBjQTcFhALI+T2oVamFWC6tyKu/vglNrpJixq
	 hTgEnuUwmmxxxs4rJJFxAvXUelOW9t5SyI6l9PiGaGSDFoc2hDlPeWlKvcy7mIDzfhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197551;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=NVM8CpqGDLxv/mUkLXkafOv0WqcPzTuZcNmRYnoSUZU=;
	b=KbstnlbmDxUhz37uNK19u2VZkeZjPanI01F1OZMNDCQkxLWXKI3lfPPqt0biL72AchMr
	 +I8v/vdhsu3f+ym3sbYb05XjzYo/sFaUa1O44xThbP1vZg0sSOjdZGhQp0Z04M9lNftgT
	 8s6sryBsT29NOicBVgPTSWTPeLJ3SN3Q5SDIj4YfRer18MEnjwNLJ+FcuPxKnXpsNQI55
	 zba5AbG5v2Yz223fIiR48NsMJPNNlMIjDBeNELBNIgDyFskM+nc2KOz9xA7ZQf95ghkRB
	 +RIt2bqwv1jFPz+Q+ihZmsbbmAsH+1S6GE8Lb3T8Vawmp9TUbawhekE2AZMQY1Eu9Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a65LlQkj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEB6606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a65LlQkj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DE01F01825;
	Wed, 28 Oct 2026 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793197550;
	bh=NVM8CpqGDLxv/mUkLXkafOv0WqcPzTuZcNmRYnoSUZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a65LlQkj2P8xTwtWiRtm+WR+jmJBapt8JWD9Yfpgzkl0FEni6vuJjmOTls5VgXtod
	 mkPW/6HOfnsxvnVIinBaww35JBAsrJvw3BUyHSNmhj9Y1+wv+BLYfXrCt5qPBqba2A
	 BuJHbiGnxiils8gTNWH2nVzTlN9Tau1yw+lB+Sbw007Rc2BByYDxin5rteuFjiHo/U
	 Q6x+jOHW70b0X1EoJRAGkLrd/hA3X/FcouzWoFwbz6xTAFJz12oqcA1KyOe7z3R0n6
	 t9lvYlTe2akNIAaF21vxN0v3HYEU2HpB4h8cwYPNhUYgp+gPPOeaQsFJhT/LrYnMh2
	 07rVbD5h2mIgQ==
Date: Wed, 28 Oct 2026 15:25:47 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: fangsz <315539811@qq.com>
Cc: tglx@linutronix.de, anna-maria@linutronix.de,
	linux-kernel@vger.kernel.org, richardcochran@gmail.com
Subject: Re: [PATCH] posix-clock: bind the device before the cdev is published
Message-ID: <auIF60_KImH9XCfb@localhost.localdomain>
References: <tencent_D7A5991BA49FFDC9706385B0D2BED254EF06@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_D7A5991BA49FFDC9706385B0D2BED254EF06@qq.com>

Le Tue, Oct 27, 2026 at 01:18:32AM +0800, fangsz a écrit :
> posix_clock_register() adds the character device and only afterwards
> stores the device pointer:
> 
> 	cdev_init(&clk->cdev, &posix_clock_file_operations);
> 	err = cdev_device_add(&clk->cdev, dev);
> 	if (err)
> 		...
> 	clk->dev = dev;
> 
> device_add() publishes the /dev/ptpN node through devtmpfs_create_node()
> before it returns, so a concurrent open() can reach posix_clock_open()
> while clk->dev is still NULL. get_device(NULL) is a no-op, so such a file
> does not hold the reference it is supposed to hold, while
> posix_clock_release() unconditionally calls put_device(clk->dev) and thus
> drops a reference that was never taken.
> 
> That stray put frees the parent device early. When the character device
> is released later, cdev_default_release() calls kobject_put() on the
> already freed device and the refcount saturates:
> 
>   refcount_t: underflow; use-after-free.
>   WARNING: CPU: 6 PID: 4270 at lib/refcount.c:28 refcount_warn_saturate+0xec/0x140
>   ...
>   Call trace:
>    refcount_warn_saturate+0xec/0x140
>    kobject_put+0x160/0x208
>    cdev_default_release+0x78/0x90
>    kobject_put+0xa8/0x208
>    cdev_put+0x20/0x40
>    __fput+0x2cc/0x2e8
>    __arm64_sys_close+0x3c/0x88
> 
> The window is small, but it is hit in practice once a driver registers
> and unregisters the PTP clock repeatedly, for example on every link up
> and down, while ptp4l keeps reopening the node:
> 
>   [   50.048138] eth0: registered PTP clock
>   [   50.767426] ptp4l: refcount_t: underflow; use-after-free.
>   [   55.735110] eth0: Link is Down
>   [   55.816736] eth0: registered PTP clock
> 
> The ordering was introduced by a33121e5487b, which added the
> get_device()/put_device() pair around clk->dev but left the assignment
> at the end of posix_clock_register(). Bind clk->dev before the character
> device is published and clear it again when cdev_device_add() fails, so
> that an open() racing with the registration always finds a valid device
> to take a reference on.
> 
> Fixes: a33121e5487b ("ptp: fix the race between the release of ptp_clock and cdev")
> Cc: stable@vger.kernel.org
> Signed-off-by: fangsz <315539811@qq.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
