Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962478;
	b=BTHaNp99EzKUhpizoBxzpvH4Ab6aLPX25KRgyanspv1CNt3P+q+4KraJ0TyBEMMacJDr
	 5bumxs9M2lBOvJS/ypY1AS1l8346OHaUPAuzgxdasptAh6fV5aJRO+tPP8S9iy3At96ox
	 T1dtmNDVwRaOm1qw2tWesLxOVSa1eh0BH3/RnuUN7bbU8XQCuZTKL/zDIxcBg6WOFTvdy
	 Rl0txXjf2ITdFZpy3UPJgID6oAmtZ87u8hQZ9MawxsTU21rhEU0OAj+yEjI2J3269jD91
	 otDVsWP8qYj91x+FeLFmQelQVg1WMTnlaOvP7Y32pQUKWxOm8KxhtJ9Gc9Ujx0SHuxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962478;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=le5Sy5w5pera8NhNCpSZ7/jVTZr08rgUs1TNqJVm1nY=;
	b=o0U+urDXEqpjoH85HJ1XrQUk1DtpJL4DNdY7T9NqsDnsnCxmLdbgWPj9mAvVK9UbLLWh
	 16GrSETulhSZnK+wjg1SWL/9Vedvd2YbjT80m6DxSWFeNX3DqOUlH2EPeU+F+5egJVBqZ
	 Y9Yfs/IjpL+v8zmqhABc942gc9VbK6DoSeWJEtDhAExXorjyDIvm6nJgfzuChU4A3sVTb
	 bTmcpsm7Khdu0LyG1eK7XQBCujaT7CedG2bMjt+g6g8iSgaklhVqyKMUNur0QABrQnjgJ
	 UrPmyz/268S8F4STxpAIXLJ/OydTT7Uvr6CEur7j67Z5Cz5Sk16FzTmumG8NVdxSDtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59458606A33E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59458606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2052668BEB; Fri,  6 Nov 2026 11:54:35 +0100 (CET)
Date: Fri, 6 Nov 2026 11:54:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: Liao Xuan <liaoxuan@open-hieco.net>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-pci: Fix performance regression with completion
 batching for Hygon processors
Message-ID: <20261106105434.GB5905@lst.de>
References: <20261103063249.3212198-1-liaoxuan@open-hieco.net>
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
In-Reply-To: <20261103063249.3212198-1-liaoxuan@open-hieco.net>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Nov 03, 2026 at 02:32:49PM +0800, Liao Xuan wrote:
> Commit 4f5022453acd ("nvme: wire up completion batching for the IRQ path")
> introduced completion batching to the NVMe IRQ handling path. While this
> change brings performance gains on mainstream platforms, it causes a
> severe random read performance regression on Hygon platforms.
> 
> The batching logic defers CQE processing until after the doorbell is
> written. On Hygon microarchitectures, this specific execution order
> accelerates the NVMe controller's interrupt generation. This leads to an

Why?

> Instead of hardcoding a permanent revert, introduce a flag 'use_comp_batch'
> and disable IRQ completion batching if running on a Hygon CPU. This
> preserves the performance benefits for platforms that favor batching
> while restoring the optimal single-completion fast path for Hygon, and
> provides a scalable mechanism to disable it on other affected platforms
> in the future.

No, these kinds of platform specific hacks do not belong into the
nvme driver.

