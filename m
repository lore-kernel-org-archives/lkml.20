Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793328049;
	b=472299Geccc5zmObAGbRF9cjrZ9czxBWkOiptFgYKlBXXPb4KPxKySip/0aZeJ6Uxf+A
	 SGs+74DViXppE7FwDmEeZxYr4nA9cB1VSfXyKoIIeBBddFPDuhjY8B1qU96yrnrZaSRhx
	 Q1UI+NT9/ntD8ZL02rmJO1VKq66qJTAlQvYdky7RmAF7To9UEeq9Ptyj4psv8Dm+1Kl64
	 fY1i2ISVc7a/nt/W6k5bEGD5PU+nHjpGS80IgRIF3UJLc/LMVHdZQDkbz+Imu1UhSK/qy
	 f9RKRY5d4LR7OZbNxlS5aM8FMiEhGZbz6Ero2lRDtFhbns1y36AL9DOTPjKT9Jzsjug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793328049;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VaghlxoTkY6+PDm7BEV7DT23eF5DgKXQ6aJ5vhgJ1Yc=;
	b=4jneUFdwn7jclS2JolBpmR6GfaAQNRoFoJjkNTgc4LBCtlnzwk7hC3/MIc/3aODxMi+Q
	 iME/Uxz6fQkUmDcdY+wpflKimYZ38oqc+u9/88SbhfDFUwMFTGX1ot6MJxuUkW2AQMcB4
	 zprsriMrmPqo2Vwn5lbA6mjfsKIX27hcupXV5a1o/e/ajidiwO/qF6TXxpadepzD+TyQ1
	 MqaTr/wJO8xdkDnflmAAvlZziarTTb+xStsZb4jYp+xyft8BUr+VFtjUCNa/qN+PaOJ35
	 FSEaAQz/xnymu937ThBqDcra4IcwdnGFaERm3y2TU5fbFiiltIGN7Z9P7RFkbVexVMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=pIoYSvEV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B7606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=pIoYSvEV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD72C1F000C1;
	Fri, 30 Oct 2026 02:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793328049;
	bh=VaghlxoTkY6+PDm7BEV7DT23eF5DgKXQ6aJ5vhgJ1Yc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=pIoYSvEVIeOMDbQ4GehnLZvj7LFdvId11l7/cvBaxDFHOF9uXwxpzYqZ8gZbCFmAe
	 CiqdK53NTq9EHRe2o5AdD+W9XyXYSPfFM/7eJQE4FJHC0vm0UF05cP2LDYnviodZ7+
	 yPCv9v/jzHz6mALlrO2/R2m4QUdrLu5PFKY7K5BM=
Date: Thu, 29 Oct 2026 19:40:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "M. Grove" <mgrove@airmail.cc>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Matthew Wilcox
 <willy@infradead.org>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] mm/filemap: queue non-exclusive folio waiters ahead of
 exclusive
Message-Id: <20261029194048.5faf664d805bff08d3001e29@linux-foundation.org>
In-Reply-To: <179296822701.680532.8543194155713536453@airmail.cc>
References: <179296822701.680532.8543194155713536453@airmail.cc>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

(cc filemap.c maintainers)

On Sun, 25 Oct 2026 22:43:47 -0000 "M. Grove" <mgrove@airmail.cc> wrote:

> A folio waiter queued behind an exclusive folio_lock() waiter on the same
> folio is skipped by folio_wake_bit()'s nr_exclusive=1 walk: a shared/DROP
> sleeper (folio_put_wait_locked from do_read_cache_folio) never receives
> WQ_FLAG_WOKEN even though its wake ran.  Readers then hang D-state in
> folio_wait_bit_common while fresh reads of the same page answer instantly,
> and the sleeper wakes only with each later lock/unlock of that address, one
> page at a time.
> 
> Same symptom as syzbot's "INFO: task hung in read_cache_folio (6)"
> (extid 9db0864859224b833108).

https://syzkaller.appspot.com/bug?extid=9db0864859224b833108

So are you saying that this patch will fix that sysbot report?

If so, a Reported-by: and its Closes: would be helpful.

Some description of *why* that sysbot hang occurred would also be
helpful.

You can do an emailed reply "#sys test" to the sysbot report.  Than
paste in the patch and it'll rerun the test for you, if it has a
reproducer.

Plese reconcile this with
https://lists.openwall.net/linux-kernel/2026/10/26/2932?utm_source=chatgpt.com

Did Josef already fix this?

> The change only reorders the enqueue side: non-exclusive waiters use wait.h's
> default head-side insert, exclusive folio_lock waiters keep the tail, so
> wake-one fairness for lockers is unchanged.  Built on mm-stable
> 183895979c44; mm/filemap.o also builds on v7.2.6.
> 
> Queue-walk instrument (read-only, counts non-exclusive entries left
> unvisited when folio_wake_bit() returns): 363 skipped waiters per 10-minute
> run before the change, 1 after the folio_wait_bit_common site, 0 after the
> softleaf_entry_wait_on_locked site as well.  Reproducer shape: threads pread
> a file while others block in folio_lock on the same pages (hole punch,
> truncate or mmap faults) under reclaim churn.  Harness, traces or configs on
> request.

Sorry, this is all quite unclear (to me, at least).  What is the actual
bug, how is it triggered and observed, etc.  

> Signed-off-by: M. Grove <mgrove@airmail.cc>
> ---
>  mm/filemap.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index b74bc1e5015c..35869d19d17a 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -1293,8 +1293,18 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
>  	 */
>  	spin_lock_irq(&q->lock);
>  	folio_set_waiters(folio);
> -	if (!folio_trylock_flag(folio, bit_nr, wait))
> -		__add_wait_queue_entry_tail(q, wait);
> +	if (!folio_trylock_flag(folio, bit_nr, wait)) {
> +		/*
> +		 * A non-exclusive (shared/DROP) waiter must queue ahead of
> +		 * exclusive folio_lock waiters: the nr_exclusive=1 wake walk
> +		 * stops at the first exclusive match, so a non-exclusive
> +		 * waiter behind one is never visited and never woken.
> +		 */
> +		if (behavior == EXCLUSIVE)
> +			__add_wait_queue_entry_tail(q, wait);
> +		else
> +			__add_wait_queue(q, wait);
> +	}
>  	spin_unlock_irq(&q->lock);
>  
>  	/*
> @@ -1428,7 +1438,7 @@ void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
>  	spin_lock_irq(&q->lock);
>  	folio_set_waiters(folio);
>  	if (!folio_trylock_flag(folio, PG_locked, wait))
> -		__add_wait_queue_entry_tail(q, wait);
> +		__add_wait_queue(q, wait);
>  	spin_unlock_irq(&q->lock);
>  
>  	/*
> -- 
> 2.56.0
