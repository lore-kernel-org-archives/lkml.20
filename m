Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E88D548579
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897441; cv=none; b=o7LlPcNgJGZM+yIkcqQ0sLbUm7LmYQcYKfj7B6Q4clMyykVYqaMi/bsgKHqU4ZjK8qD3N2kj5SW4jhn6G4jGZc67xr3ka5acZpl6CZM4jzI6QCFOECiq0IbZ38UD5Y195pSomxt0NlzSWJErvP6MlQMaVF8s61unGFCgplQW8w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897441; c=relaxed/simple;
	bh=lhcpeRs/+2qtyHnD12XDTTqDOf2wYL5F38tSgnrV5Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilmRxwV0RqIfjwBBQKS4/TO9DBUeQYSLqAJE/db+g2LpcRg2SP1CsFzlv7MOf/Ysqmnp1ZBMaEfEPzIxsmKZPbDugKd5wcra3Q0CQ087vJKgTYMZLQHF194izc2J7Oan8v1mS+6UYP0i3mTy/2QgDyv5jAnsNtOdhWVFr0hnAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNHmohf1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNHmohf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB6B1F00A3A;
	Tue,  8 Sep 2026 19:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788897439;
	bh=Ou5xEo7iAzlKd3AVMCKn53kWM87UjDDrbXoKJa4e2ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GNHmohf1u7VomUt1hIYokXhiRrcZQLjlVnOa3qigQ9rBF3uPcA6LcfFSN74luKoPS
	 j5I2D7S1M6qu81n9pq3lh9kJ8gMODoJgAXnsLiBRaaNHzXkZQFH8MjTPd6BVr5bO0W
	 n2FGrM+/J6XeDHxNvu+6WsPXxnGJ1kXIU4nciB7A24ETB6TzaS6A73IA3qnTflf3C1
	 bZaq1XchaMqH5V7cdg+yGIx8yw4rczQB7GHXb6QE9JkBlXnK4Fn1myuUt6FprNOqpA
	 R5t40vIoISnOWc20xwfvLiFpyJFQ/T+mIrePbAIdmFQQiTX1xKFleE5R9oNXsqhuE9
	 0AHenQNI6puXg==
Date: Tue, 8 Sep 2026 13:57:17 -0600
From: Keith Busch <kbusch@kernel.org>
To: pavankumaryalagada@gmail.com
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	syzbot+6c46a179b56c651c4c96@syzkaller.appspotmail.com
Subject: Re: [PATCH] nvmet: validate device_path before enabling namespace
Message-ID: <aqBonYN7WeEn26JZ@kbusch-mbp>
References: <20260908193452.53347-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908193452.53347-1-pavankumaryalagada@gmail.com>

On Wed, Sep 09, 2026 at 01:04:52AM +0530, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> When buffered_io is enabled, nvmet_bdev_ns_enable() returns -ENOTBLK
> without checking whether device_path is configured. nvmet_ns_enable()
> then falls back to nvmet_file_ns_enable(), which passes the NULL
> device_path to filp_open() and causes a NULL pointer dereference.
> 
> Validate device_path before attempting to enable to namespace and
> return -EINVAL when it has not been configured.

This was alraedy closed:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=09d0c07bd9ce3b2f2d993f672698d32a17543c32
