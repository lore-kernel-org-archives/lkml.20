Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232039;
	b=THm3ymjfwZBzw+C4jGiXYPmQdef8ANt5YDt0OdytnNcVM9FixordxZPeoVkSB4aznHrW
	 v5ExpDU25WKm4sFNJ1/ECgl+If9qvdI9/TMbAe6LWc+Wj72GwoU93suLJfHc3RsMbDJks
	 Cu/i5LYMdSypdUVMKZlJY5BWGj5y6l3Rxnedv3M2+4k5H+ZdCCLLKxUeQyeIgFE0XiXng
	 my0bB5WOp4oP0sTY/EpP8X4mwZ/jxAzfwZuAH4v9zaZqcVQjkDgr+Iii4x84QjSnixId1
	 xCT5G61Qs9MUKxkgt8auoXZ15aL6sLjOXvkycMd7pldu+OMF0qy270Umj3ODv1fAfLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gb/McRGatQGrBV1WsdACGQfyLm2d4GS+1O2sMOZ+oYM=;
	b=MFi2ZL7/vd+5heZgzWz+buUBhtVW5pnI8YrwIeIhmtH6Fj37LiEckp4K7Tj0/tjqSYsQ
	 C5jvk44w6cdsw3+HMjPeggNEoA/DegDbaaF9sAJG98yKg3wJtp08mTtXkIaNNRym6ricd
	 Lrxw7GaGtELQyF2zzCrsdfNtgpdUo1BcTAbEb/ogLu54mHf73CYMhoZMSv9B535/Kg5KX
	 hC6fmwlYBtYb96otMLiPGvar/0Tw/KCkUM7W8PAMF3paEeV9fc3a/T4OvWr6gsClQ+hpI
	 24g7tgqcPYSn62zbPfOM0vrM+zrwPFoEpesbpG1GXa2U5/5nABcy0EgYweBfY4Ou1eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e7ExUSm7;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F234A606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F234A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e7ExUSm7
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so1300683a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794232037; x=1794836837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gb/McRGatQGrBV1WsdACGQfyLm2d4GS+1O2sMOZ+oYM=;
        b=e7ExUSm76NkshYUOzc1Pz1ewL8FbwkfysLOZ2IVLp7+BcYeZHwd1Hbc2epgZ2NxJU/
         qg5fTY2cNrOtYUfv/yCoF5zPtvAPa54oK35FOF5oO/b6kkSQOk2Rc0eoirEn0Lp6GtDP
         R5QEQVumtcY+U0fvOxhIwqn9qHmDwt+6OMEgaBInjGgAxNd4ltHqVLN2/JihDpkhTCnV
         MZF9YoNYP49gWo8/rvAwvELWlEhg6hg3EiE7zbi1KdkMaW3OjPXKBlCwm5jJLaTs5yOQ
         01Cbtxl6zOdPpcaoXN5/IU8pooEV67WGfFmO9un89+nRNZiXwlaJSwraC5SE/Jnb60ia
         5c/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232037; x=1794836837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gb/McRGatQGrBV1WsdACGQfyLm2d4GS+1O2sMOZ+oYM=;
        b=SsVbUbDPamXW502taL/oIZTDlKz/5Xl/eXP/nGHdWN8GFVp85+9881KRVowuO/MQAq
         czCO5lwdXyWYCHc/nC1gCq64o8K77VZWqIVXHISJ7W0W7+jx3F3aOe3bfxo3bHIdu9LA
         xog/VXKz8NPKfPpdCVth3JrCQPthFv65Y4vp/yHBH7QMlx8wF3CiVbAtLK5DlLXiJyGP
         EPEc7OAhir8+j4X4i1gtYWnCBOyrNnYmr8oZiHVnYRuEort/+N8omJy1dzcpbPZaToMq
         8gCL/iqdHog5503df5XoGY+f0vPDlvCBczuLy2/l+2Ne42/ch5VcgdlUZUt6scSLtewy
         BWUA==
X-Forwarded-Encrypted: i=1; AL+hErFHDpmVDDEaF00KvSIYJIpfv8Gj4YvtOgYe2VcPNDw9hfo2B1/4zWJ/fk28zYFNE4v1aB9rKTmIOru5zVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z82KIcOvQ0KcpUhWhtMclmJUglI2x0ztHWyZiFnYk/RhVX5s0D4
	/Qd7VO9KwgWK8hLwrDSqEc2q746IMQl4VcfrZIKk4tNDSL6cxSk6NGRo
X-Gm-Gg: AYBFou2velW5KqmbblKUabFg8lw5WRlviiyXPv7E5q2z5UzPowfQrFiouJ5NKGC/TXg
	ucIwxyweJpO2Q++bUizyp0/oWHDeCQjYtQm1I1Z0NOIbNFsZmMbaGuuSVQ5+JqIfQjNST4wi8NZ
	ULkeYn5dVPUsecK4mHSPsH6Jpwdft3n+Beaxg63oRSdKCoR43tG/s5tx3AECulZwuva/m82VFZH
	4zobnXSiwPwVjt3HBHLjd9Qma9zG+1DzEnsPTwWI8OyLTKREasiW4uNx/d5CSwEh0jIzitcjhTR
	ynKh+OO7CP1awd4Pt5IHSQGOL2Hj4LbCmhCv85+PwNxiZ4zmkFikkgKN5o6tqxc4mhkNCVe5wqA
	diLMm2B3EnW+TS3Us6Z9gf9xet7Z43lIPFRYI2VJFkLkRIpX9qXnUvNLuGAPu4iY/Z3fCQHqW6S
	Bs09T/23i7L8W6XDoDqLOchDgG2LGEkjr/FbsReQ+7m9zFSp6IgXogFoooEHFDOO0MrPW4N7OKo
	nl7GMUDPsu9AkGNuCu7DEeDyS78FmHsW8lVTUHtg7cI5ww8vedV4xSnyz+6JT9T01VG5hQ6RznF
	CsKC80F1O6o0bg==
X-Received: by 2002:a05:6402:1d4e:b0:6b7:6c8:70d7 with SMTP id 4fb4d7f45d1cf-6b7223c22e5mr2357975a12.1.1794232037247;
        Mon, 09 Nov 2026 05:47:17 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721eedd40sm1643775a12.32.2026.11.09.05.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:47:16 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 9 Nov 2026 14:47:14 +0100
To: Harry Yoo <harry@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>, vbabka@kernel.org,
	paulmck@kernel.org, qiang.zhang@linux.dev,
	akpm@linux-foundation.org, hao.li@linux.dev, cl@gentwo.org,
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org,
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH 2/2] mm/slab: don't queue the page cache work under
 krcp->lock
Message-ID: <avHO4rQ-gKrxW2Nf@milan>
References: <20261028134647.3176080-1-zhanxusheng1024@gmail.com>
 <20261028134647.3176080-2-zhanxusheng1024@gmail.com>
 <au2fUYzBLv3uvj_2@milan>
 <au3ELzm_s9vhs7UO@thinkstation>
 <avGzD8CAgg9Hif__@milan>
 <avG1Yr9sjswFoJ9E@thinkstation>
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
In-Reply-To: <avG1Yr9sjswFoJ9E@thinkstation>

On Mon, Nov 09, 2026 at 01:13:46PM +0000, Harry Yoo wrote:
> On Mon, Nov 09, 2026 at 12:48:31PM +0100, Uladzislau Rezki wrote:
> > On Fri, Nov 06, 2026 at 12:21:28PM +0000, Harry Yoo wrote:
> > > On Fri, Nov 06, 2026 at 10:35:13AM +0100, Uladzislau Rezki wrote:
> > > > On Wed, Oct 28, 2026 at 09:46:47PM +0800, Zhan Xusheng wrote:
> > > > > From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> > > > > 
> > > > > run_page_cache_worker() runs under krcp->lock, from kvfree_call_rcu()
> > > > > callers that may hold more, such as set_cpus_allowed_force() under
> > > > > pi_lock, so it kicks the refill work from an hrtimer.  Under memory
> > > > > pressure it instead queues the work with a delay of
> > > > > rcutree.rcu_delay_page_cache_fill_msec, which may be 0, and a zero delay
> > > > > queues it at once, taking pool->lock under krcp->lock.
> > > > > 
> > > > > With the delay set to 0, calling kvfree_rcu() on vmalloc memory under
> > > > > pi_lock after a drop_caches makes lockdep report:
> > > > > 
> > > > >   Chain exists of:
> > > > >     &pool->lock --> &p->pi_lock --> krc.lock
> > > > > 
> > > > > Use the hrtimer when the delay is 0.
> > > > > 
> > > > > Fixes: d0bfa8b3c411 ("kvfree_rcu: Release a page cache under memory pressure")
> > > > > Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> > > > > ---
> > > > >  mm/slab_common.c | 8 +++++++-
> > > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > > > > index 3729aa7a6156..ef5ff0a20249 100644
> > > > > --- a/mm/slab_common.c
> > > > > +++ b/mm/slab_common.c
> > > > > @@ -1987,7 +1987,13 @@ run_page_cache_worker(struct kfree_rcu_cpu *krcp)
> > > > >  
> > > > >  	if (rcu_scheduler_active == RCU_SCHEDULER_RUNNING &&
> > > > >  			!atomic_xchg(&krcp->work_in_progress, 1)) {
> > > > > -		if (atomic_read(&krcp->backoff_page_cache_fill)) {
> > > > > +		/*
> > > > > +		 * A zero delay would queue the work right here, under
> > > > > +		 * krcp->lock and possibly the caller's pi_lock, so let the
> > > > > +		 * hrtimer do it.
> > > > > +		 */
> > > > > +		if (atomic_read(&krcp->backoff_page_cache_fill) &&
> > > > > +		    rcu_delay_page_cache_fill_msec) {
> > > > >  			queue_delayed_work(rcu_reclaim_wq,
> > > > >  				&krcp->page_cache_work,
> > > > >  					msecs_to_jiffies(rcu_delay_page_cache_fill_msec));
> > > > > -- 
> > > > > 2.43.0
> > > > > 
> > > > > 
> > > > Can we just clamp this to 1 - 100 seconds interval?
> > > 
> > > You mean clamp to [1:100,000] milliseconds interval?
> > > 
> > Yes. It is now in milliseconds.
> 
> Thanks for clarifying.
> 
> > So starting with 1 - means that it can be configured at least from 1 msec
> > whereas 0 is forbidden. Also we can drop the extra "if condition" proposed
> > in the patch as it never can be zero.
> 
> But can we explain why forbiding 0 msec can be justified (when there's
> an alternative approach to fix it?)
> 
I mean it is better to fix the threshold instead of adding checks.

--
Uladzislau Rezki
