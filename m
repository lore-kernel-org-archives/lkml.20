Received: from sender5-pp-o92.zoho.com (sender5-pp-o92.zoho.com [165.173.182.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2973B446055
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790835; cv=pass; b=GhfJ0safMSTdL5XkrjjrYFSuVp4AsiHT8PgNpqiFuBi6BdYTeEF/m1E27AnD/lCn4mWLiy+UjVgH9P5hjLqsA3N3oSKJNaKapnQcs4wVrXVaJVFJQ6jgAUp5KwxfnUJHgeaRrCxUFlqNvRSGc7s67FjpXWaLtqp668NposLo+xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790835; c=relaxed/simple;
	bh=Em431KZKIyUguDgoU6tABxbSS/03xAP4B0H3SSmipEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7oHqJd4lPXTn39RBLDTqMCv6TDmKRlftI7UWCXIj9bU+PzwdIvWQ9SBFXfunD5UsmzkS4odnY4XLX9YKDsYFSt+eP0HG2EIaKQgP1eXZdin5+7OtzsNof6mR8TexoZZjOUIRXBh5KD+0jGyF4TMubJjp4eXU3LOt0atqVIkMLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=YY4NnPjB; arc=pass smtp.client-ip=165.173.182.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="YY4NnPjB"
ARC-Seal: i=1; a=rsa-sha256; t=1791790779; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N4Ssq8c4AIjIlUI3PHD4pXrx8aBH1uBEvpmMjAS7r3o6O5ZkddnmXBIs4n86kZGfJrwsnzs+no+BaGarepiia1Zk2IEj4QMzLegNhJ+H9ZRwl9XYYDNO6crsVwo3s+zY7rp6XnmC6uQZzPV6cbBUcjASty0pfEOsnDz2NmSHhWE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791790779; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XY4Ndrc0fbe09LRrSk0lmN1tCiIb1TmzGOGWJedUEQ0=; 
	b=BdkcHTfVfLc2FmjKyBKAKgaCvvGtK0oIxzXaFIEXOsiriSpO4HGN8sv4/h84OJbGHOVWy6cbdA9vGCcKizUn/3TdCP09Li5A/ICC9g/c5yOBs58wvFq+MDcdj9vZks1tGCBDpJEfgD59I6VEC9mXnYA/lOVTWF4edGObz2uYybs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791790779;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=XY4Ndrc0fbe09LRrSk0lmN1tCiIb1TmzGOGWJedUEQ0=;
	b=YY4NnPjB37IXA3O2indz0rCpskKKLSB3KhffbyPPzORGGTWMsCYBcXUNwpkpc5kK
	wDlCO+OoEZpwnk1tDcx/EkoexuYVvS9F9p1EevytzLEK+jk3D9fEILC3oJVdhO3HU0h
	CayUmGB1S8GJMbIWaxPkCfwM9+HGatuFQ+pG2PPA=
Received: by smtp.zohomail.com with SMTPS id 1791790776043166.97926401498376;
	Mon, 12 Oct 2026 00:39:36 -0700 (PDT)
Message-ID: <d5cb66ce-9d96-45f7-a07d-5dc3ac70e8d2@zohomail.com>
Date: Mon, 12 Oct 2026 15:39:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3] sched/proxy: Defer donor commit until after proxy
 resolution
To: K Prateek Nayak <kprateek.nayak@amd.com>, Ingo Molnar <mingo@redhat.com>,
 John Stultz <jstultz@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Andrea Righi <arighi@nvidia.com>
Cc: linux-kernel@vger.kernel.org
References: <20260827-sched-proxy-v3-1-1af63ac5ae56@zohomail.com>
 <0fe8a0fe-68f5-467b-be82-cf631e00fd87@zohomail.com>
 <832e9395-49e9-40dd-a4db-1c1bf9753100@amd.com>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <832e9395-49e9-40dd-a4db-1c1bf9753100@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: zu08011227bfd58343b9b6ea08a91b4df900001f68f9a522b1a5fbf80d6d27cf62f849f3b2b0be792de311b9:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External


On 2026/10/12 12:05, K Prateek Nayak wrote:
> On 8/27/2026 2:48 PM, Xukai Wang wrote:
>> @@ -7143,45 +7159,49 @@ static void __sched notrace __schedule(int sched_mode)
>>  
>>  pick_again:
>>  	assert_balance_callbacks_empty(rq);
>> -	next = pick_next_task(rq, &rf);
>> -	rq->next_class = next->sched_class;
>> +	donor = pick_next_task(rq, &rf);
>> +	rq->next_class = donor->sched_class;
>> +	next = donor;
>>  	if (sched_proxy_exec()) {
>> -		struct task_struct *prev_donor = rq->donor;
>> -
>> -		rq_set_donor(rq, next);
>> -		next->blocked_donor = NULL;
>> -		if (unlikely(next->is_blocked)) {
>> -			next = find_proxy_task(rq, next, &rf);
>> -			if (!next) {
>> -				zap_balance_callbacks(rq);
>> +		donor->blocked_donor = NULL;
>> +		if (unlikely(donor->is_blocked)) {
>> +			struct sched_dl_entity *donor_dl_server = rq->dl_server;
>> +
>> +			rq->dl_server = NULL;
> I'm not able to understand this special dl_server handling.
>
> In case of "pick_again", pick_next_task() will clear the rq->dl_server
> before the pick and for "keep_resched" with idle task, I don't think the
> dl_server from pick makes any difference since we'll come back into
> schedule right after the switch.
>
> For rest of find_proxy_task() we don't really care about dl_server afaict
> unless I'm missing something. did you trip something that required this
> change?
>
>> +
>> +			next = find_proxy_task(rq, donor, &rf);
>> +			if (!next)
>>  				goto pick_again;
>> -			}
>> -			if (next == rq->idle) {
>> -				zap_balance_callbacks(rq);
>> +			if (next == rq->idle)
>>  				goto keep_resched;
>> -			}
>> -		}
>> -		if (rq->donor == prev_donor && prev != next) {
>> -			struct task_struct *donor = rq->donor;
>> -			/*
>> -			 * When transitioning like:
>> -			 *
>> -			 *         prev         next
>> -			 * donor:    B            B
>> -			 * curr:     A          B or C
>> -			 *
>> -			 * then put_prev_set_next_task() will not have done
>> -			 * anything, since B == B. However, A might have
>> -			 * missed a RT/DL balance opportunity due to being
>> -			 * on_cpu.
>> -			 */
>> -			donor->sched_class->put_prev_task(rq, donor, donor);
>> -			donor->sched_class->set_next_task(rq, donor, true);
>> +
>> +			rq->dl_server = donor_dl_server;
>>  		}
>> -	} else {
>> -		rq_set_donor(rq, next);
>> +
>>  	}
>>  
>> +	put_prev_set_next_task(rq, rq->donor, donor);
>> +
>> +	if (sched_proxy_exec() &&
>> +	    donor == rq->donor && prev != next) {

Hi Prateek,

The case I had in mind is when pick_next_task() selects the candidate
through a DL server, and find_proxy_task() later goes through
proxy_resched_idle().

1. Before this patch, the sequence is effectively:

|-> pick_next_task()

|---|-> rq->dl_server = server;

|---|-> put_prev_set_next_task(rq, rq->donor, donor);

|---|---|-> donor->dl_server = rq->dl_server;

|---|---|-> rq->dl_server = NULL;

|-> find_proxy_task(...)

|---|-> proxy_resched_idle(rq);

|---|---|->put_prev_set_next_task(rq, rq->donor, rq->idle);

|---|---|---|-> rq->idle->dl_server = rq->dl_server; /* NULL */

|---|---|---|-> rq->dl_server = NULL;


So find_proxy_task() is entered with rq->dl_server already consumed by
the donor commit, i.e. rq->dl_server == NULL.

2. After deferring put_prev_set_next_task(), without the save/clear, the
sequence can instead become:

|-> pick_next_task()

|---|-> rq->dl_server = server;

|-> next = find_proxy_task(...)

|---|-> proxy_resched_idle(rq);

|---|---|->put_prev_set_next_task(rq, rq->donor, rq->idle);

|---|---|---|-> rq->idle->dl_server = rq->dl_server; /* server */

|---|---|---|-> rq->dl_server = NULL;

|->if (next == rq->idle) goto keep_resched;

...


In that case the DL server selected for the uncommitted donor gets
attached to rq->idle.

The next pick clearing rq->dl_server does not undo that assignment,
since the pointer has already moved to rq->idle->dl_server. It is only
cleared later when idle becomes the prev task of another
put_prev_set_next_task() transition.

3. That is what the save/clear/restore in v3 was intended to avoid:

pick_again:

|-> pick_next_task()

|---|-> rq->dl_server = server;

|->donor_dl_server = rq->dl_server;

|-> rq->dl_server = NULL;

|-> next = find_proxy_task(...)

|---|-> proxy_resched_idle(rq);

|---|---|->put_prev_set_next_task(rq, rq->donor, rq->idle);

|---|---|---|-> rq->idle->dl_server = rq->dl_server; /* NULL */

|---|---|---|-> rq->dl_server = NULL;

|-> if (!next) goto pick_again;

|-> if (next == rq->idle) goto keep_resched;

|-> rq->dl_server = donor_dl_server;

...

|-> put_prev_set_next_task(rq, rq->donor, donor);


If proxy resolution returns NULL or idle, the saved value is not
restored into rq->dl_server for a donor commit that will not happen.

So the intent is to keep the DL-server selection made for the candidate
out of rq->dl_server while proxy resolution is in progress, and restore
it only if that donor is actually going to be committed, while keeping
the state seen by find_proxy_task() consistent with the pre-patch path.

Do you think rq->idle->dl_server being set in the second sequence above
is harmless, or is keeping the save/clear/restore the right way to avoid
that state?

I’ll look at the sched-ext interaction and the __schedule() structure
separately while rebasing onto current tip.

-- 
Best regards,
Xukai

