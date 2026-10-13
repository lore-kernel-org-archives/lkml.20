Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66C0551986
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905589; cv=none; b=AEm+5KWtuGr6ww6Hx4A2yZ02EpDVP9rsEhIjXbg7gzVO7BS0K4bG/HVyRSy1ugiC+HnUroY9fsMi/LD8sO0VSmydkAbUHvE2g0MHOB5gd7ij41LljdWXhXo6HpJUXgKTAyFCCGRJPyNqQ2KdZauaJh/cbccknoueimLMfZqfpSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905589; c=relaxed/simple;
	bh=qzIeqIoLTjxP8IU+fE3kHSt7SShGrM0zkXbmKZFCCos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TByKSQRhjsVC1eJbgyfuPaOhGb5TF31GH/Uu918bGPHekQQaLJvSXahp2jY4rWagQXMR17ROiPpmwifgThI39QCa0BOy9Yf5uC8e7vCpnj4qgFCC4cJSJ+1SQzv2nlKcQyiZUhjSMKFKPHGDyI5VLIzKnnMZo0CzNa+BzUFE+Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7Iac00V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7Iac00V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A5B1F000FF;
	Tue, 13 Oct 2026 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905588;
	bh=E63mUwFjemiDxyzubiYvAzEQKx406mWvj0GrGEZFzz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O7Iac00VgukUmNt11Uv5RXPVpRARxbnIWbBhWKNvcyzszewbursSp2KErQQteW5fG
	 QLW7a26/qgb8tWmcIqpm12RHCvtUAE+MieA3ghmhiAeN4tkA5jZdHmifT+tqbuY/A3
	 uXsuWM9FWx7okZLUzNMyfBfUouQh9T2nzpUZx2PdZFKclceE1l/VAlHuxD85v+uZhn
	 YpuKYYEW5PV89KWpvh0mCTPbdVihPIRniqMxFMSt2+GxhCgx5Ei0CmdhldCeS4KAWJ
	 blVYiQDk4ZRv+gdx9QLqTdI2yBlpmDVnGzEPYiDwNLorXXEXopx35TExowJ0hjno5Z
	 9e78xy87KHdwA==
Date: Tue, 13 Oct 2026 09:33:06 -0600
From: Keith Busch <kbusch@kernel.org>
To: Surabhi Gogte <sgogte@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, mkhalfella@purestorage.com,
	randyj@purestorage.com, adailey@purestorage.com
Subject: Re: [PATCH v4 0/3] nvme-tcp: parallelize I/O setup queue in connect
Message-ID: <as5PMuAUcVRDgwUr@kbusch-mbp>
References: <20260922200718.3941465-1-sgogte@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922200718.3941465-1-sgogte@purestorage.com>

On Tue, Sep 22, 2026 at 02:07:15PM -0600, Surabhi Gogte wrote:
> Similar to commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue
> allocation and startup"), I/O queue allocation and start steps
> (including authentication) can be parallelized for nvme-tcp as well.
> 
> Patch 1 fixes a pre-existing bug: nvme_tcp_alloc_queue() used
> current->nsproxy->net_ns to create sockets during initial connect
> while it used kernel's init_net for reconnect and error recovery
> paths. The fix captures the caller's network namespace at controller
> allocation time.
> 
> Patch 2 is a preparatory refactor: it splits the queue-count
> negotiation and TLS PSK checks into helpers so that the individual
> steps can be called directly from nvme_tcp_configure_io_queues(). No
> functional change.
> 
> Patch 3 has the async implementation: it fans the per-queue alloc and
> start out over an async domain, serializes the per-cpu queue-count in
> nvme_tcp_set_queue_io_cpu() that can now run concurrently, and uses
> ctrl->net for all socket creation.
> 
> Testing on a 64-core host with 64 IO-queues shows nvme-tcp connection
> time reduced from 61ms to 11ms.

Thanks, applied to nvme-7.4.
