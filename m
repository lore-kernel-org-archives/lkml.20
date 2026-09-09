Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D8F48EBD4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949933; cv=none; b=Kimd+0y4dPpAGaodULcQtZGMGQHG5G52PzjswkaEZY9s1uWEas+FBmaQIX0duuMPxx4pDqMFnTOObjJ7QOUmfE5ZW4K9ZEWtKfk3GR7aDwwvwIE4o+gEghR+XJOSmFQTUitJ53fZeaqYq23u+FEaagWKdZO5K8NJdj4ecFSXR4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949933; c=relaxed/simple;
	bh=KsRRUV4hPCthpm2sK6eRlhJv5R9jzUy87FAy/t+8Pps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7vec2KGD6B0laoLrvNQ1xKKJf0KF63LBWYXqrbVpzdzEjCgrEyvM1DnL3+zJaUC/QKEjBXtwepo3K6PJRVUq9G1kZ3SyjkixAcPyo9Em+awqQPmO/1fYq0z7vf6W5QD4ACe4SDHLFnw7K4NEU0jcp3+CsyOImihW6GUGdYMGis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=XjAoyiAE; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="XjAoyiAE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qc+NSVKSoB6ikvDunrhfKQUo9qm4fSz3IgFCTqMO8do=; b=XjAoyiAE4LovU5puHCK/jucc14
	ce4pzB7KUzSaBI/7IRnUa9iXSIdFbxMZz1AYVvGpBz6PooS3Mjg6Tt0Mepwpl0YSbVgN347/7F7jC
	J0SbCT/kUDnLPnAwdS77c1xix3meiy8R6UVGleqxO7vnHXVSwEhEsNXT+B/VG9ytOq6JuiKw0xRs3
	e2aIc3sowrmZbu2tJPvCKUqTsjB5i5zSvOeJnzI0bfmtcEaShigBhjmDNkVT20M9Ubr0Rt/AuRzf6
	7uSRVGXA7oAyXVp4TCix8NPtuoiZ7NqYWw7ytjHX4dOkAEwxisuXD/wAv5CUGuhknNhBEl+DvUQk7
	8sbZsuUw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4Fb4-002zVi-2o;
	Wed, 09 Sep 2026 10:32:07 +0000
Date: Wed, 9 Sep 2026 03:32:02 -0700
From: Breno Leitao <leitao@debian.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Yao Kai <yaokai34@huawei.com>, liuyongqiang <liuyongqiang13@huawei.com>
Subject: Re: [PATCHSET wq/for-7.4] workqueue: Make flush_workqueue() cost
 scale with active pwqs
Message-ID: <aqEznXGW0eKJ0k0T@gmail.com>
References: <20260901210929.3092513-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901210929.3092513-1-tj@kernel.org>
X-Debian-User: leitao

On Tue, Sep 01, 2026 at 11:09:26AM -1000, Tejun Heo wrote:
> Hello,
> 
> Since 636b927eba5b ("workqueue: Make unbound workqueues to use per-cpu
> pool_workqueues"), flush_workqueue() walks one pwq per possible CPU, cycling
> each pool lock, even when the workqueue is idle. Yao Kai reported the XFS
> CIL workqueue, flushed on every log force, spending up to 64us per flush in
> that walk on a 128-CPU machine.

The problem seems clear to me. Flushing a PER_CPU workqueue, mean we
__flush_workqueue() -> flush_workqueue_prep_pwqs(), and then it cycle
through every pwq (one per possible CPU). This is all done with
wq->mutex.

Then, with the lock, we update the new color for the pool.

So, the locking context here is:

	mutex_lock(wq->mutex)
	for_each_pwq(pwq, wq) {
		raw_spin_lock_irq(&current_pool->lock);
		pwq->work_color = work_color;
		raw_spin_unlock_irq(&current_pool->lock);
	}

This all makes sense. I understand that, we need(ed) to do it, in order
to keep the work_color up-to-date. Let me read the patch now and see how
you've addressed that.

Thanks for copying me,
--breno
