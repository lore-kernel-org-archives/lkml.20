Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394966;
	b=PC+lmyY97rj0AJGWuaY6O95Y4jjB8er/RURpj1s5r9k55uLTHxHYWRywu1Ibf8W+rXDF
	 kkyveqwC94j7HXc1JyVlZYqHi5XmFNHjH3iguRYTaFtqXJF/990375vtKhaWc55atBKcp
	 hQrNS1sJQ1zemBmb1kAWFK/vrZQPPky56xIuisvy4S/PSf//aoIyXEKmf2JvGQGysQLaU
	 RNMkXpXKGfv5lhBabril7KbnwCAYajmkRQP5HuD8xhsZ1b731H7plxk/QGSRGFN5B8g7s
	 Y0+zC8Y8g9ssXNJ8Oxn8Fh+HozTE4qF75u+oQpoT6EwVHe0SxsKbbJ2TuiSPrStKCoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394966;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=J8DcLLk0yecruZyM6mmveWFHl3ELR7PbtrNX9j1NimI=;
	b=U2Bw9dqn4Lx+Kl1T57htW51Aqdnx9KNFWvPC4RwEce06IcEfXUypNf6IGyIPoecVT/Kg
	 NFUzff9oYYcnGRlcrPeShZXfhc6AIjxC3elHdhW9VWGVZwTQ/g568AzRkpD/IwgO/JnpX
	 jXckCVAvekpoJ0kc1BqDgtGnDkdsEAM7HSahLzWnCdDLM2Z+l1OGL1f1S3g+uZDIxFqeW
	 yxvrhrWEm8iqJG8cPBqJx0x9GAxl/4ttlmnW93KfAS065ydEQoxigkIPMpWWGsXBO6bYK
	 dAYIiNggtVTkt6k8SVfBGQKjeBkOfhzZVkHDQHQCdz9MVhP1xrjEfsa6hKNIi6xOA/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0tsw3e9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0tsw3e9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14F81F00A07;
	Wed, 11 Nov 2026 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794394966;
	bh=J8DcLLk0yecruZyM6mmveWFHl3ELR7PbtrNX9j1NimI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=I0tsw3e9R8OVBuOy4zo3ra09ZpD5qpPfdAYrsXrPn2xAfobeexvZGmCEmoJ1yn6v5
	 GqixfPtDJ/Q88LvY1q1aM5AG1zUqX8wbirKwS3qil9yVry6S84xlRNarFZ7lm7NdOi
	 Z822E72pra07GtbvLiwLmRuLCGMFUL84Fu+DYYCQv6pNw+uYem/pnaMWaKrYhB13XY
	 ELIXeXv1niJ259y9B5w5fRBwZ9jCoaZLC8xaa7v5hogcVLhpOsE5TzAISV0neLJLOU
	 AWHFcnRsqEquRdHnqO7lGPds4aY6K9I7thE5m33/B/8L+f0rftsPDXgx/mt8TurcRb
	 3gFJhGuOKI5qg==
Date: Wed, 11 Nov 2026 01:02:45 -1000
Message-ID: <35385d363689d515faa172d876170417@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 10/12] sched/fair: Reflow pick_task_fair() / newidle
In-Reply-To: <20261107120207.891592828@infradead.org>
References: <20261107115913.261163891@infradead.org> <20261107120207.891592828@infradead.org>
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
Content-Transfer-Encoding: 7bit

Hello,

On Sat, Nov 07, 2026 at 12:59:23PM +0100, Peter Zijlstra wrote:
>  again:
> -	if (!cfs_rq->h_nr_queued)
> -		goto idle;
> +	if (unlikely(!cfs_rq->h_nr_queued)) {
> +		rq_modified_begin(rq, &fair_sched_class);
> +		sched_balance_newidle(rq, rf);

pick_next_task() clears rq->core->core_cookie at restart: and sets it
again only after all the siblings are picked. As newidle can now drop
the core lock in between, another sibling can see the temporary zero
and take the !need_sync fast path while a cookied task is still running
on the core. This is another SMT>2 problem:

  CPU3 is running Y, core_cookie == Y's cookie
  CPU0 pick_next_task(), core_cookie = 0
       pick_task(rq_i), newidle drops the core lock
  CPU1 pick_next_task(), core_cookie == 0 so !need_sync
       picks uncookied Z and switches to it
  CPU0 relocks and restarts as core_task_seq moved

Z and Y share the core until CPU0's selection completes and its IPIs
land. On an SMT4 VM, this triggers a couple of times per second under
core-sched churn. Maybe core_cookie can be left alone at restart: so
that it keeps its previous value until the new one is set after the
loop?

Also, core-sched churn now triggers assert_clock_updated() from
__schedule(), set_next_task_fair(), update_load_avg() and so on. While
the lock is dropped for newidle, another CPU's double_lock_balance() or
double_rq_lock() on one of the core's rqs goes through
double_rq_clock_clear_update(), which clears RQCF_UPDATED regardless of
core_pick_in_flight. If the selection doesn't restart, it goes on with
an rq which it already updated now marked as not updated. Maybe
double_rq_clock_clear_update() should follow __rq_clock_clear()?

Thanks.

--
tejun
