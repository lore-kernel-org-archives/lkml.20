Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08495452A9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954066; cv=none; b=IAg43P/achP5T5E7yzTn+1JvPFCWdAkAdB+enXwBFy60+izTFYZrLls37yJ4odsEGrN8VZETDzfhrCIMmxWXEb9BEU8Y0RlP7YZJ5vnQ+3tUH1FcoP7PIjLDbSToXXzljSCiHo1r2E4sD77vhBomqcE6uwQuXDGhy1+vPQUA0YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954066; c=relaxed/simple;
	bh=e9ExvXDQMXNe+616wGZaaLMbRPHN48sBHY0YhmonTxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7mW9DBfKSeRAqCVHLzaFbaumIAgOBL4v3GTFCMMkn+WQdlSSCJRK4ndAqxZDzT4pa1ney/Uaq8udCdbyZ9foSaR3IHAXxH3t+GrAnIjT6kNVYlwSCe9AXsiJJxiPOGPdoUE5Aauw2owDAfhDSasXzZY5Km35pUQilLtScOWh8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=cwiuqOOL; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="cwiuqOOL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=APhIsKG8uaFL7Tkmv3ZRHFEJhpD8SYvsSJmVXZnle+Q=; b=cwiuqOOLgCMllzNlIJlOKDsPnV
	zMT00q1jxPmcXyXcoC014KdxCGdPJcMs4OrvDn+GQRICgRlEM45oUj7g5IC5DFdW9BNDha6Pnci9R
	tLiAvrucNEsShNULhlxkGFw+wNtx+TI81MjFCgAcTMYO6s7y//IDfTmAs2Sfc37jT9Wv7DPmKjesH
	J9eZ4neHHLYvi2cui9Gph4feHICUakYjB57OEHe5iKyL+CE+FHyCzutexuTxgLvR1o4vqERx/aCTn
	AxH8ZO1IrruFrwr5SaNodwJUjQZw5+cxZ7E/X9JH4VYLdSzGYiBOIH+Nk/VqNo12ltsrCOZR8ux2I
	BKdVjdig==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4Gfj-0031j8-2f;
	Wed, 09 Sep 2026 11:41:00 +0000
Date: Wed, 9 Sep 2026 04:40:55 -0700
From: Breno Leitao <leitao@debian.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Yao Kai <yaokai34@huawei.com>, liuyongqiang <liuyongqiang13@huawei.com>
Subject: Re: [PATCH 2/3] workqueue: Maintain pwq->total_in_flight
Message-ID: <aqFEOlDD8PfMfnqz@gmail.com>
References: <20260901210929.3092513-1-tj@kernel.org>
 <20260901210929.3092513-3-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901210929.3092513-3-tj@kernel.org>
X-Debian-User: leitao

On Tue, Sep 01, 2026 at 11:09:28AM -1000, Tejun Heo wrote:
> pwq_busy() scans all of pwq->nr_in_flight[] to tell whether anything is in
> flight. Maintain the sum in pwq->total_in_flight, which fits in existing
> padding, and test that instead.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>

I've found that the color is either used as 'unsigned int', and
sometimes as 'int'.

The color is 'int' in get_work_color(), work_color_to_flags(),
work_next_color(), in the work_color/flush_color fields of
pool_workqueue, workqueue_struct and wq_flusher, and in the
flush_workqueue_prep_pwqs() parameters - but it is 'unsigned int' in
worker->current_color and in insert_wq_barrier()'s local, which is one
of the two callers you're converting.

It's not a big deal: the value wraps at WORK_NR_COLORS, so it is always
[0, 15] and everything round-trips. It does leave oddities like

        worker->current_color = INT_MAX;

storing INT_MAX into an unsigned int. I may send a patch later to make
them all the same type - it would have to be 'int', since -1 is a live
sentinel for flush_color and flush_workqueue_prep_pwqs() documents "<
0 for no-op".
