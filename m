Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3D74AC173
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368928; cv=none; b=PCqFQL/BIkfNYD7MFDgZyItyOjjEGUvvOH9D5HpjQl1yv2yrLy7geBPPrEZuu8w+qnl+mNsUjebpvtsOFhb3QfKEYgYyxEOdukDd1iGVW4jilxZRulejMy7Itf6W7NzKBkhaA3T4oLOLeumyXuG0fsEE2ZERAEnaaqu2Clt5J3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368928; c=relaxed/simple;
	bh=GFgaS8p99+FK6Ixz0mNR+kZTu9TX/8xLADkIp3YEGOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YryYTB4nSZNMT7hamJKqP/2gC49Tiaea+NAqzmudAtvpnOf7+ncQzTjC72Ijh0xc2rCt3+1+jQtOxyygr3DPN4DBeXdQQksdhUSSk1v8qAQP1y98yYIzL56nWp8ke24dXxpw6p305ltUW+f8hqWsxmP4XA2uSIfcMoY4eTQovfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XLu1BD0b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XLu1BD0b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788368925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7OUvCq36agQZQ8gcvBtI8CSi7iha84lLF/KmcyWewtE=;
	b=XLu1BD0bR6mkGJiAF+MIIgmmGLmUHgfIUMgDvcoQDe4/oaeIwoWloE0ri9zjECLogNjCT3
	lXKYp3YjrSlcgS1/0O2w5HSrUA8i8fxqJC//tjcvR5NqV73fAukwlWQdBCHCTCxssYUld5
	h7ct2fzOynRFZxjYJ7bFJSBvyDmSNMU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-313-TYI_zGR5PTiFSZ8lpaNw6g-1; Wed,
 02 Sep 2026 13:08:43 -0400
X-MC-Unique: TYI_zGR5PTiFSZ8lpaNw6g-1
X-Mimecast-MFC-AGG-ID: TYI_zGR5PTiFSZ8lpaNw6g_1788368922
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D2FC718453F7;
	Wed,  2 Sep 2026 17:08:41 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 438C91800765;
	Wed,  2 Sep 2026 17:08:39 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  2 Sep 2026 19:08:41 +0200 (CEST)
Date: Wed, 2 Sep 2026 19:08:37 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Hyunwoo Kim <imv4bel@gmail.com>, brauner@kernel.org,
	peterz@infradead.org, anna-maria@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] signal: Prevent exec() race
Message-ID: <aphYFSOubnLlR_tX@redhat.com>
References: <871pbfeaiv.ffs@fw13>
 <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13>
 <87h5kad0mx.ffs@fw13>
 <87bjaie2gc.fsf@email.froward.int.ebiederm.org>
 <87wlt5aybr.ffs@fw13>
 <87qzjcdh06.fsf@email.froward.int.ebiederm.org>
 <87ecfcbyt1.ffs@fw13>
 <apgwWTwG_oq3ij8n@redhat.com>
 <87ecfbd5nf.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecfbd5nf.fsf@email.froward.int.ebiederm.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 09/02, Eric W. Biederman wrote:
>
> Oleg Nesterov <oleg@redhat.com> writes:
>
> > I won't insist, but to me both the patch and resulting code look
> > a bit simpler this way.
>
> I agree that simply removing the special case that could skip grabbing
> siglock is more maintainable.  Just one last thing to think about.

Well, but the patch from Thomas adds

		scoped_guard(spinlock_irq, &tsk->sighand->siglock) {
			tsk->flags |= PF_EXITING;
			sigqueue_dequeue_pending(&tsk->pending, &sigq_list);
		}

into the fast-path, so either way exit_signals() can no longer skip
grabbing siglock.

Or I missed something again?

> Oleg it appears you were the one who added the special case to skip
> taking siglock.  So if you aren't worried about us removing it then
> I am happy to see it go.

I am worried. But see above. We need to fix the bug first. Then perhaps
we can add some other optimizations.

Oleg.

