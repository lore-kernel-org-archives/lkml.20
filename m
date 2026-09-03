Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD23F44CE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417747; cv=none; b=guL/92JFn/BwIQW0vNOFUtlTbwNP4J6O8KtLLIx48tsXPqmudsgwqmdAKvjSCl6LmOJ+uVBtwootGOstyXNR+L3InHW1PqnV7C0ixMkKZWzKdEVi47jHox1V/RLSqORzmG1B3fmBV+vvv6QyC7gBRvIB6erMcmInJ//0MxIwQvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417747; c=relaxed/simple;
	bh=CGgEjsoKzFVj+GcGxAp4hHB8AFwDGB8jPl/K/LpFdz4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kdpxbJbDb2OgXPzQD0hZXdRg/dSeCem2iQcMjzB0Rif7KMzDwt8xMwH9+XLIcMxXUmlvPCApJFQLkezUMgvGxK/rgk9u5KAF4KWHxMn9G6U4gi+CObAQHI+udrdlZA7If+9tD1J5/KYzwElaTAxRa4FbttPrstBLqOzaLfIaMb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nm/CcY9O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nm/CcY9O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213B71F000E9;
	Thu,  3 Sep 2026 06:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417736;
	bh=SQS+yOKJydeR277npXj6PZ+MIa4NneM3XeRmFudAoJo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Nm/CcY9O5o1WIxmaSBn1ZsI4b/bzQ9eCH0tV5inuuCWGYBFcCNMuq9P9SvP1Gm4sB
	 xIjeU97m8q3t8hMBqXtHJirGsCBu7TetTRNGYeFaKls3S1LE1zlnZMWgbAUv5kVkRk
	 WbWDaE5krFFi6PO2lkwlGUA0HkOg4+H33McZOE03/WMkaOKQGzVrbDn2OLpXvsAUjJ
	 Hhu8PdaOL/BCeMtyXnCEnuCukX7WR9pofDfqGiZmowueQ8zFCnMZGOUoL2l/zVPuNb
	 Fp4BP9N9v5nuoUOasPXefBwwrXwR4F5ackFCTVc0eEm2jZIH5ErsOAQYZ9K5cnbOgO
	 X/3mjq3jX4O/w==
From: Thomas Gleixner <tglx@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Frederic Weisbecker
 <frederic@kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
 brauner@kernel.org, peterz@infradead.org, anna-maria@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] signal: Prevent exec() race
In-Reply-To: <apgwWTwG_oq3ij8n@redhat.com>
References: <87mru7h09e.fsf@email.froward.int.ebiederm.org>
 <87tsofdvf2.ffs@fw13> <871pbfeaiv.ffs@fw13>
 <87zey3fep2.fsf@email.froward.int.ebiederm.org> <87pkyyd39l.ffs@fw13>
 <87h5kad0mx.ffs@fw13> <87bjaie2gc.fsf@email.froward.int.ebiederm.org>
 <87wlt5aybr.ffs@fw13> <87qzjcdh06.fsf@email.froward.int.ebiederm.org>
 <87ecfcbyt1.ffs@fw13> <apgwWTwG_oq3ij8n@redhat.com>
Date: Thu, 03 Sep 2026 08:42:13 +0200
Message-ID: <8733vqbzui.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 02 2026 at 16:19, Oleg Nesterov wrote:
> This is subjective and mostly cosmetic, but what do you think
> about the alternative change below?
>
> I won't insist, but to me both the patch and resulting code look
> a bit simpler this way.

Yeah, though if we restructure the code then I rather prefer to get rid
of the gotos and also move the cgroup...end() part out of the sighand
lock held region to make that as short as possible.

void exit_signals(struct task_struct *tsk)
{
	LIST_HEAD(sigq_list);
	int group_stop = 0;

	/*
	 * @tsk is about to have PF_EXITING set - lock out users which
	 * expect a stable threadgroup.
	 */
	cgroup_threadgroup_change_begin(tsk);

	scoped_guard(spinlock_irq, &tsk->sighand->siglock) {
		tsk->flags |= PF_EXITING;

		sigqueue_dequeue_pending(&tsk->pending, &sigq_list);

		if (task_sigpending(tsk) && !thread_group_empty(tsk) &&
		    !(tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
			sigset_t unblocked = tsk->blocked;

			signotset(&unblocked);
			retarget_shared_pending(tsk, &unblocked);

			if (unlikely(tsk->jobctl & JOBCTL_STOP_PENDING) &&
			    task_participate_group_stop(tsk))
				group_stop = CLD_STOPPED;
		}
	}

	cgroup_threadgroup_change_end(tsk);

	flush_sigqueue_list(&sigq_list);

	/*
	 * If group stop has completed, deliver the notification.  This
	 * should always go to the real parent of the group leader.
	 */
	if (unlikely(group_stop)) {
		read_lock(&tasklist_lock);
		do_notify_parent_cldstop(tsk, false, group_stop);
		read_unlock(&tasklist_lock);
	}
}
