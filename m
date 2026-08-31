Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D53D9DD8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180285; cv=none; b=c6qFYxDZJgX+OL2T1Z14YP6dKNBmGsMT9e3jx6MTE/MziuP9W176tAyX1S1NcdGiMj9eHUDFcrfEXJergkNnnyvsqfURuDcfh2EtKQFCuEpaYOV/PEJl02q+18FJLxt1qTmIU4VD0m7fnTnPqEqOP2Yizsv/TlHByAURVanyVzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180285; c=relaxed/simple;
	bh=htHKVAtb0b8eDVvvXoNzgmblAmbeGK2UW7XfQk7NANI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBa6iVJ5o031phujepdGkg3tJEjpa5OLJfdiYK+E358IyknKpWJfLDGwnVKDSOFDgyW1tGUbPawksMLQ+wXQ4THRWBg7NgncehtJuzi3wJe3FVYCX/edcxPUajyjZnO0qBWgMvzrDslh53HHkMmn2gU47eWCMsv/gSn+r623GWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W1AqXB7G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W1AqXB7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788180278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EaFUd1/pryQMweOJ2A0yLEzYqIErFE4KkSUooGLz2zA=;
	b=W1AqXB7GLXELuUNj9byW8jc/azzU9FAGy3Su7XtPjELCEV5qvt/eYYHTVB1BVVFVpj5qPf
	NEP9FweSrcGUouB3A/K47ZX44TJTuaQ41ZXodmxLn18cEHtI4Iiw4dWcxsfJIiXX/Hl+rJ
	KJdWuftAEML2dDEuRNk6tkG93UNYXwg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-IWgwbeHFNHGJCON9LxqoJw-1; Mon,
 31 Aug 2026 08:44:35 -0400
X-MC-Unique: IWgwbeHFNHGJCON9LxqoJw-1
X-Mimecast-MFC-AGG-ID: IWgwbeHFNHGJCON9LxqoJw_1788180273
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 16E9A1935329;
	Mon, 31 Aug 2026 12:44:33 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 96B2F40E;
	Mon, 31 Aug 2026 12:44:30 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 31 Aug 2026 14:44:32 +0200 (CEST)
Date: Mon, 31 Aug 2026 14:44:29 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Hyunwoo Kim <imv4bel@gmail.com>, brauner@kernel.org,
	peterz@infradead.org, anna-maria@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Prevent exec() race
Message-ID: <apV3La9JXa1gIfId@redhat.com>
References: <87zey8g05g.ffs@fw13>
 <ao8_NUo0ACPAA4QB@redhat.com>
 <87ecfki6l5.fsf@email.froward.int.ebiederm.org>
 <87se3zgb3m.ffs@fw13>
 <87mru7h09e.fsf@email.froward.int.ebiederm.org>
 <87tsofdvf2.ffs@fw13>
 <871pbfeaiv.ffs@fw13>
 <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13>
 <87h5kad0mx.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5kad0mx.ffs@fw13>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 08/31, Thomas Gleixner wrote:
>
> +static inline void flush_pending_unlocked(struct task_struct *tsk)
> +{
> +	flush_sigqueue(&tsk->pending);
> +}
> +
>  void exit_signals(struct task_struct *tsk)
>  {
>  	int group_stop = 0;
> @@ -3130,8 +3147,10 @@ void exit_signals(struct task_struct *ts
>  	cgroup_threadgroup_change_begin(tsk);
>
>  	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
> -		tsk->flags |= PF_EXITING;
> +		scoped_guard(spinlock_irq, &tsk->sighand->siglock)
> +			tsk->flags |= PF_EXITING;
>  		cgroup_threadgroup_change_end(tsk);
> +		flush_pending_unlocked(tsk);

Hmm... the exiting thread is still visible to for_each_thread().
Can't this flush_pending_unlocked() race with (say) do_sigaction() ?

Oleg.

