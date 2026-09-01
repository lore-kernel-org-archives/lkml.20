Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFE037E5D8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266989; cv=none; b=UokNftaTTVla02/TLBPzEHIavvvjTjV6ysTdGWo1gowf4MPpW8MAML2G13mFVPrUh6AHcAcJLQQyY1doJttWiGpukPtSXSwfm7hDMSBsG07PxXSJTDgyFW4syJFGKbtxlrtEEKQdLtF9WC7Kne6kiBbv2X13Alngrw0DThqfBIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266989; c=relaxed/simple;
	bh=clHGUpuJO0vbxdF5kusajkddfWzuApzvgqTjrvV/8Fk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=seDHpdN6+ZWMNGSMtKgoWSLN0Sk0P4b0j2f7clXtYZ4MaQMp8AOP7R819ihDHkcE9k/AY15Q3Vf0tqRNB6tgyTEpjE9zaLVUPv2E2Hc1Sawdruntg1rWdivyFU0chIjqJPhkpTNamyrgS/B6QIxKGcPL1mIhpXqrwF5rbpdLu/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbVgneAm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbVgneAm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7C41F00A3D;
	Tue,  1 Sep 2026 12:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788266988;
	bh=Q83LZ/T9yGcXGoeux5Zo9WYmhE2+WftT7AfhpEqzGjg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fbVgneAm/1N+4lB6I74B3rV0Cvr71dOSxjDgt49qnG5dZVhAKbTWrRJMWLQRByawM
	 wXethxT7qw1tltIJuHLTHjcuO6GYv95f4JaKdGgNy3TvDp3XX9639bm/yM67L2uPwC
	 JQgJIP1Jwb/hsSUrpd/7tl+k9ru+E7JRleo6IQUlPRcYpOoCrKCUv6HPy4KLoR+TeG
	 TtSoHZNpcNlj3ctEHPcS1LeFxJcFqabVFjTKt5Wx/VKbtgXIFb2U5VHbyteHS7aqc3
	 A/HaFAg9S4gfsKJin9Idvz5wM9awCHA4SBlITgUDcg65TkV7K8ppTt+lJdsDoH/F43
	 B3TIr3f6hVvng==
From: Thomas Gleixner <tglx@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Frederic Weisbecker
 <frederic@kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
 brauner@kernel.org, peterz@infradead.org, anna-maria@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Prevent exec() race
In-Reply-To: <apV3La9JXa1gIfId@redhat.com>
References: <87zey8g05g.ffs@fw13> <ao8_NUo0ACPAA4QB@redhat.com>
 <87ecfki6l5.fsf@email.froward.int.ebiederm.org> <87se3zgb3m.ffs@fw13>
 <87mru7h09e.fsf@email.froward.int.ebiederm.org> <87tsofdvf2.ffs@fw13>
 <871pbfeaiv.ffs@fw13> <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13> <87h5kad0mx.ffs@fw13> <apV3La9JXa1gIfId@redhat.com>
Date: Tue, 01 Sep 2026 14:49:44 +0200
Message-ID: <8733vtcf13.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Aug 31 2026 at 14:44, Oleg Nesterov wrote:
> On 08/31, Thomas Gleixner wrote:
>>
>> +static inline void flush_pending_unlocked(struct task_struct *tsk)
>> +{
>> +	flush_sigqueue(&tsk->pending);
>> +}
>> +
>>  void exit_signals(struct task_struct *tsk)
>>  {
>>  	int group_stop = 0;
>> @@ -3130,8 +3147,10 @@ void exit_signals(struct task_struct *ts
>>  	cgroup_threadgroup_change_begin(tsk);
>>
>>  	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
>> -		tsk->flags |= PF_EXITING;
>> +		scoped_guard(spinlock_irq, &tsk->sighand->siglock)
>> +			tsk->flags |= PF_EXITING;
>>  		cgroup_threadgroup_change_end(tsk);
>> +		flush_pending_unlocked(tsk);
>
> Hmm... the exiting thread is still visible to for_each_thread().
> Can't this flush_pending_unlocked() race with (say) do_sigaction() ?

Bah. Yes.
