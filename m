Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152087;
	b=vQ94CNV0fZsqrUXHaMFQo4DGGMfE6ihCBoTgZDLHqfLwwDPAreZiFxKJt7L8VUu6vt1x
	 1ZmZM8zFpMXHuo0qlMg+BxGUifuhT41wUZ2dJjrkeFsXt8cLimaNgqjFdL+zDxOaBENI8
	 cJemKCs2fQlxRLOuTGdtNoXMIJDY6gXn/J5d0iDIGCilKBMrv5cONRAUQMV79PojNz78u
	 7P80lkgwaAHxd7opnmUabGPZro0mp9+J4PJstq6Wpdwa5wntPslmDNb8XYmB49AH9oYtL
	 dYcahnXj27JxIPGQp6TCVu9FNyQaYtpy0LE8vLYBV5KEJ80zyLrBx+LdKL4qfKOgEuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152087;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=W3lroRbnqIXSNHCrTJQtlhuCGTKiM9QEtQ4RkVSjLYE=;
	b=ABWN8s40MZRyu0xc3HI2+17Gi9dLCJV2iGrEb88Vf8MDyYUdH2vVYt8FbGfpEzFLeATa
	 EOXjr/hL82+/3ssJuuI+hkGOzKPrxiTEDh9BtSTqA8M9doGay+UpWPbiCOG829PLFTL8b
	 mtZVkcV1uf5COCW8J15FjQHsrMBmaU0MtvWjfeWthtOfUcT/2VtmbtYgL2vzThneHkqLS
	 WShQe7Y0ZuQxqj/+10g96zjGpH3mjhevkDaT1d/0LGNG97cQfuSF7rqRifjXzJiUkvdyu
	 w3UOG9NgtRnmcu0+vObRnwb0TklOfFt79edsYQUyzupMw7BcLLoPNQbQjJ/161NH0ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LX2ypuCH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B1606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LX2ypuCH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71331F01825;
	Wed, 28 Oct 2026 01:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793152087;
	bh=W3lroRbnqIXSNHCrTJQtlhuCGTKiM9QEtQ4RkVSjLYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LX2ypuCHqV2uGMH8qOVhqcBnhXQaDfo8s4cpETl26rPtNIMdjFgLkSEng0ur4gevd
	 qys/fBtgxedOw9n4flTdHsGtShbLOj1FcLR6OaLZis5jXAvKAUyMYLJW2KD4rAUy1f
	 MNhUOaC/039WMqpS1xhvjrgRwkz8+vHngpy9Pu1f0CF3r7pLIY8pgn5eSAsH61Rz2Z
	 T4HTBJuuO0e31+Eaz6JzwxEBMzpm99efAj0I0HagcQ0CXEad2w6cS314P0HL80qIWg
	 uR8Yt/Ig0WC5ZpBEXHp/uEExzQ2QGBVIM5u1ErGJtYRS4M9mr/uMfk0ygSMeBCOr61
	 eShVkUOQKCahQ==
Date: Tue, 27 Oct 2026 19:48:05 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Cc: linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de,
	sagi@grimberg.me, hare@kernel.org, sgogte@purestorage.com,
	wagi@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-tcp: fix NULL queue->ctrl dereference on reconnect
Message-ID: <auFUVXscufZffXyK@kbusch-mbp>
References: <20261028002654.1077190-1-christian.aurichzm@gmail.com>
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
In-Reply-To: <20261028002654.1077190-1-christian.aurichzm@gmail.com>

On Tue, Oct 27, 2026 at 09:26:54PM -0300, Christian Aurich Zanettini Martins wrote:
> +static void nvme_tcp_init_queue(struct nvme_tcp_ctrl *ctrl, int qid)
> +{
> +	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
> +
> +	queue->ctrl = ctrl;
> +	mutex_init(&queue->pf_cache_lock);
> +	queue->hdr_digest = ctrl->ctrl.opts->hdr_digest;
> +	queue->data_digest = ctrl->ctrl.opts->data_digest;

It's a good start, but if we're introducing an init helper, let's take
it all the way! The queue_lock at least is something Guixin has in a
conflicting patch here:

https://lore.kernel.org/linux-nvme/20261027123950.3122316-1-kanie@linux.alibaba.com/

Other fields including io_work and send_mutex look safe to move here too.
