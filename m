Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C3549C4B8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358762; cv=none; b=IIT5SG3Xu2/6h9UsGZ1AZVXoeu2vfJUss6sm5JhY8/OZ0bLJNbnSDLCo0U920IZnzfgIeZTzrjpt4OO3MbPV9uCvQeXL5uI+Tyx5TzygvGCXbXaWYZN7hrfCrPToZot3IYekilPsNZUebuCMTblM5/ftpbw3XpHzWSZayYQs6to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358762; c=relaxed/simple;
	bh=HiLySgb/Lnt1iMdvdhCAKq6Hxg06FzofrsjFPqyWo6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yl+vw+J75j2VgvB4jjIQ3MSabnyRSOag1TwY1ccHSQOAvCd3uU+Cb8lbnTjQtOMQNljI5Gom+FoDD+uqNNn9pEMmkYIaf8bWyDqBeJ+nW59LRNeb9BbACH0cjsNZ0N2racROCa334TmLR0ftZGYXCg+oistyUYZrFx2zhA+v1uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FZ5ZGMug; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FZ5ZGMug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788358759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LGL84VaJfLuJYcKZTpUzHNnSsroB1Fz42NKTcn7bfjE=;
	b=FZ5ZGMugs6DM3hkagVUDyD8ml6fCIrtn15bhwthO5gXYOG8wl3SirKE0PfDwLdyHckxzEP
	66FCFpQOmq8tYFq7t5xAzEkNzGet2HyP5QbLFHbJKUQ8gDsGPzxl7/Kfk74u1ra+0koRZE
	J0+wpiNYRysyRWZjClbkRms2lUhMUAM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-680-pACJo-bnPhC8lCVtHPz4ug-1; Wed,
 02 Sep 2026 10:19:12 -0400
X-MC-Unique: pACJo-bnPhC8lCVtHPz4ug-1
X-Mimecast-MFC-AGG-ID: pACJo-bnPhC8lCVtHPz4ug_1788358751
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 315DB19114BF;
	Wed,  2 Sep 2026 14:19:10 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id B010D30002F4;
	Wed,  2 Sep 2026 14:19:06 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  2 Sep 2026 16:19:09 +0200 (CEST)
Date: Wed, 2 Sep 2026 16:19:05 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Hyunwoo Kim <imv4bel@gmail.com>, brauner@kernel.org,
	peterz@infradead.org, anna-maria@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] signal: Prevent exec() race
Message-ID: <apgwWTwG_oq3ij8n@redhat.com>
References: <87mru7h09e.fsf@email.froward.int.ebiederm.org>
 <87tsofdvf2.ffs@fw13>
 <871pbfeaiv.ffs@fw13>
 <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13>
 <87h5kad0mx.ffs@fw13>
 <87bjaie2gc.fsf@email.froward.int.ebiederm.org>
 <87wlt5aybr.ffs@fw13>
 <87qzjcdh06.fsf@email.froward.int.ebiederm.org>
 <87ecfcbyt1.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecfcbyt1.ffs@fw13>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

as for the change on exit_signal,

On 09/01, Thomas Gleixner wrote:
>
> @@ -3120,6 +3137,7 @@ static void retarget_shared_pending(stru
>
>  void exit_signals(struct task_struct *tsk)
>  {
> +	LIST_HEAD(sigq_list);
>  	int group_stop = 0;
>  	sigset_t unblocked;
>
> @@ -3130,8 +3148,12 @@ void exit_signals(struct task_struct *ts
>  	cgroup_threadgroup_change_begin(tsk);
>
>  	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
> -		tsk->flags |= PF_EXITING;
> +		scoped_guard(spinlock_irq, &tsk->sighand->siglock) {
> +			tsk->flags |= PF_EXITING;
> +			sigqueue_dequeue_pending(&tsk->pending, &sigq_list);
> +		}
>  		cgroup_threadgroup_change_end(tsk);
> +		flush_sigqueue_list(&sigq_list);
>  		return;
>  	}
>
> @@ -3141,6 +3163,7 @@ void exit_signals(struct task_struct *ts
>  	 * see wants_signal(), do_signal_stop().
>  	 */
>  	tsk->flags |= PF_EXITING;
> +	sigqueue_dequeue_pending(&tsk->pending, &sigq_list);
>
>  	cgroup_threadgroup_change_end(tsk);
>
> @@ -3157,6 +3180,8 @@ void exit_signals(struct task_struct *ts
>  out:
>  	spin_unlock_irq(&tsk->sighand->siglock);
>
> +	flush_sigqueue_list(&sigq_list);
> +
>  	/*
>  	 * If group stop has completed, deliver the notification.  This
>  	 * should always go to the real parent of the group leader.

This is subjective and mostly cosmetic, but what do you think
about the alternative change below?

I won't insist, but to me both the patch and resulting code look
a bit simpler this way.

Oleg.
---

--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3120,6 +3120,7 @@ static void retarget_shared_pending(struct task_struct *tsk, sigset_t *which)
 
 void exit_signals(struct task_struct *tsk)
 {
+	LIST_HEAD(sigq_list);
 	int group_stop = 0;
 	sigset_t unblocked;
 
@@ -3129,21 +3130,18 @@ void exit_signals(struct task_struct *tsk)
 	 */
 	cgroup_threadgroup_change_begin(tsk);
 
-	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
-		tsk->flags |= PF_EXITING;
-		cgroup_threadgroup_change_end(tsk);
-		return;
-	}
-
 	spin_lock_irq(&tsk->sighand->siglock);
 	/*
 	 * From now this task is not visible for group-wide signals,
 	 * see wants_signal(), do_signal_stop().
 	 */
 	tsk->flags |= PF_EXITING;
+	sigqueue_dequeue_pending(&tsk->pending, &sigq_list);
 
 	cgroup_threadgroup_change_end(tsk);
 
+	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT))
+		goto out;
 	if (!task_sigpending(tsk))
 		goto out;
 
@@ -3157,6 +3155,7 @@ void exit_signals(struct task_struct *tsk)
 out:
 	spin_unlock_irq(&tsk->sighand->siglock);
 
+	flush_sigqueue_list(&sigq_list);
 	/*
 	 * If group stop has completed, deliver the notification.  This
 	 * should always go to the real parent of the group leader.

