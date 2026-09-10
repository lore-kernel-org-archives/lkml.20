Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BA03ACF1F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035207; cv=none; b=h6uWXOU23VWgj0r3dtDvHcy4WKICRXTBpAePV3nZ8pFefz/w730ftNnt3p75xljJoGL8noC8bOM4A2tx4OEcmQKSyFy1fTHwssJdYTyc3xY4DVjltYxJEKOE8z7eATHRL4Wjl5es7XEvQuF4StdFqxwbc5ZHYJ/7HCPmB4zs4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035207; c=relaxed/simple;
	bh=V7rBLZ4dapTkiVrMsMquHH4jyMZDmJrhheM19GX+Go0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbup+CKfHWlaSJiDEKYzaC/OAIkMjyQ9fjF7IN1jLuWzyjlOFEBb4IzKLfLoK71tAdIM6vltW7JZ7Zcv3BgCklomlhj2GztfjscW357CHH9MehXVhXZp3VdxD7wD4c3aTeFgT1DY+yzNoWKBrpocLepCHnCS1Qdf9JLAB0IUBJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ibnkZZmk; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ibnkZZmk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G4saUThZFqGpGWofsv4xwcUJYYbLPphE7AB+ZEKKEQM=; b=ibnkZZmkubtVX8lO8Fs5yYEu87
	x41r52ApNMtJ+SvwWD2fnu0lKZVDob/o46rY971g9/zEBAxhzAerb4miEq6SHg7OZerYpG4BbCDv/
	sZGiwgipY/tf2JpboJDMTEG+wx2+/IiOGag7K2rHzSdWhOgoHz/MxyXvphlbipi2eVuamoJ8RYqby
	IoMPXy7DGFH8VxA7sKSb7abSQRw/QFsH74mBLnmRSs0ocP5SaxRjfIMq1WDnKgybapriXEx6Yq+mx
	bOy3Pj3cGwh9sa7bkc795KfCAVTGAA0fKugV2vtK4t3QngeHxqigc23dAaKlQ+PQG+UrcNF+3sKMU
	z71v3YrA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4bmR-000R9m-28;
	Thu, 10 Sep 2026 10:13:20 +0000
Date: Thu, 10 Sep 2026 03:13:15 -0700
From: Breno Leitao <leitao@debian.org>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, 
	pmladek@suse.com, marco.crivellari@suse.com, gustavold@gmail.com, 
	david.dai@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH 4/5] workqueue: build percpu pwqs through the attrs path
Message-ID: <aqKCaEe5mcYjv6vB@gmail.com>
References: <20260819-wq_realsplit-v1-0-6ad3c3f48be8@debian.org>
 <20260819-wq_realsplit-v1-4-6ad3c3f48be8@debian.org>
 <144b3dc986135ebe34f671cdd02bd8aa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <144b3dc986135ebe34f671cdd02bd8aa@kernel.org>
X-Debian-User: leitao

On Mon, Aug 31, 2026 at 12:23:10PM -1000, Tejun Heo wrote:
> Hello,
> 
> On Wed, Aug 19, 2026 at 07:37:38AM -0700, Breno Leitao wrote:
> >  	if (!(wq->flags & WQ_UNBOUND)) {
> > -		ret = alloc_and_link_percpu_pwqs(wq);
> > +		ret = apply_workqueue_attrs_locked(wq, percpu_std_wq_attrs[highpri]);
> 
> Applied 4-5 to wq/for-7.4.
> 
> One note: if pwq allocation fails partway through
> apply_wqattrs_prepare(), the already allocated pwqs are released through
> pwq_release_worker, which isn't created until workqueue_init(). Percpu
> workqueues are created before that, so an allocation failure in that
> window now oopses instead of failing cleanly. An allocation failing that
> early is unrecoverable anyway, so this doesn't need handling, but it
> probably deserves a comment.

Sure. Would a if() in put_pwq() cause harm? This is what I came up with.
Any chance it would be acceptable?


Thanks,
--breno

--
Author: Breno Leitao <leitao@debian.org>
Date:   Thu Sep 10 02:39:06 2026 -0700

    workqueue: warn when a pwq is released before workqueue_init()
    
    put_pwq() bounces the release to pwq_release_worker to get out from under
    pool->lock. workqueue_init() creates that kthread_worker well after
    workqueue_init_early() has built the system workqueues, so a pwq
    allocation failing partway through apply_wqattrs_prepare() unwinds
    through apply_wqattrs_cleanup() and dereferences a NULL worker.
    
    Running the release inline is not an option, that is what the bounce
    exists for. Warn and leak the pwq instead. The one that can get here is
    not linked to its workqueue yet and holds nothing but a pool reference,
    and the failed allocation takes the workqueue creation down anyway.
    
    Fixes: 967b494e2fd1 ("workqueue: Use a kthread_worker to release pool_workqueues")
    Suggested-by: Tejun Heo <tj@kernel.org>
    Link: https://lore.kernel.org/all/144b3dc986135ebe34f671cdd02bd8aa@kernel.org/
    Signed-off-by: Breno Leitao <leitao@debian.org>

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index f868011e291f4b..47376593656a6b 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -1782,7 +1782,11 @@ static void put_pwq(struct pool_workqueue *pwq)
 	/*
 	 * @pwq can't be released under pool->lock, bounce to a dedicated
 	 * kthread_worker to avoid A-A deadlocks.
+	 * pwq_release_worker is created in workqueue_init(), and we might
+	 * get here before workqueue_init().
 	 */
+	if (WARN_ON_ONCE(!pwq_release_worker))
+		return;
 	kthread_queue_work(pwq_release_worker, &pwq->release_work);
 }
 
@@ -5930,6 +5934,10 @@ static int alloc_and_link_pwqs(struct workqueue_struct *wq)
 	if (!wq->cpu_pwq)
 		goto enomem;
 
+	/*
+	 * A pwq allocation failing before workqueue_init() leaks the pwqs
+	 * already allocated, see put_pwq().
+	 */
 	if (!(wq->flags & WQ_UNBOUND)) {
 		ret = apply_workqueue_attrs_locked(wq, percpu_std_wq_attrs[highpri]);
 	} else if (wq->flags & __WQ_ORDERED) {
