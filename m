Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627357;
	b=5a6hsCTH0FKdLmTsjG363nirdS4LDHrUKGu8lIRzbpqdXkuArzJpEGH3b/GZNtjEG7Mr
	 wo8a9p6QOX+mrqsEUMIwPcye+PfWedKTihMkri4qSLbeDTCacfrPoxc0CP0jqx0bPdyDY
	 KawE37RbGoGWaA8dLj7SICTcjTMQq2QAUTGt3G4Lr8tCEfqonDwDVlWISKJBPTCgO5Emm
	 wDGQKeHa5iCCXCpcoF404O7YNzZjnmHupz1xRA9oPSNsRGnCTzfF4LmGRyrA+ZWBYDvDp
	 0VAq+qoj5x9kYcglY2kKyHtugr9UTzXqE/desnZtJZzL1D6G8aT3eRDgdnlZppRjONg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627357;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ddZdd9Lnc6kmOH5nhdihlv1Hxg55WS0ci8Cr1qUkBv4=;
	b=P1xbENH5fCLMcQjrzPkf0I4wjA8HksIBEL+dv+tx7+bOtvhoZ9fWL4pWvKi5rLrWJL2O
	 N8DNBUmdrZ/NicMLA7flSZppMY9inmjz9wPP1ufF7Dn2+1EHbeZdvtST9aLeVDx99qaBF
	 fZH5vZ+qSRBAFmHMPqySPwvGTzr3WKQKXMa47tTap5jOpXnWl5s5QGa10mb75dROXyrzQ
	 +wVdxyZUbnSgKGXEenKhTr7MqY7rAV6417/qsf0mT0KOMUqgeXtO+PQ/b0kELtQGct0Hf
	 /LiTVMJuI/+ZI9f9RqAY74SRlGrvdyKJttcM2PTuv5iMXuhVLDGC332kyndYdu0aXHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VTMNgmxw;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JJ7N9h9J;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3145E606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3145E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VTMNgmxw;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JJ7N9h9J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793627356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ddZdd9Lnc6kmOH5nhdihlv1Hxg55WS0ci8Cr1qUkBv4=;
	b=VTMNgmxwX0uwlIrmNw0aKLtNXhtco+VzX3j+t+1mg50Jv+2Vh+AI5gzYrchzofoLnTEUOT
	dFoFsviCPm4KdWqnbCWYpvjzbNb+UySpQLdL/1eioV8EAHcHrgnL2mfiDx4RbfjBLB50+g
	SG3ofgdni08Ls+ohUpnrKxu1XsxJF/A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-gqv4ZGJCPmSWenwwyijw_Q-1; Mon, 02 Nov 2026 08:49:15 -0500
X-MC-Unique: gqv4ZGJCPmSWenwwyijw_Q-1
X-Mimecast-MFC-AGG-ID: gqv4ZGJCPmSWenwwyijw_Q_1793627354
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c46582442so1842007f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793627354; x=1794232154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ddZdd9Lnc6kmOH5nhdihlv1Hxg55WS0ci8Cr1qUkBv4=;
        b=JJ7N9h9JqVhYv6Q7qwrdrRfoc58CWYcBqNn+SQayD15ziOcmYOUKhKUOQg4/cS+vXh
         ObI81lq9ZflJWD3KXWaQp2g1yOweWNq0tiExCeYTLcKJj/MxIFc1aLL0FJECbm28HThU
         4FCCVkhxvWEz83cmRp9neyiePJKH5p5hoJegOLXkMyFmKUtEeV1XQnBxyzJf6bhAfkA+
         Atk6mDn6Mn9hJSv3gPEclnKPltC01hihxOCM7dexxRLBBmkdmsnTBHmSPA6mHZqVXt8c
         DPA86UQABCyBO7HYyRekA+YnI1eaJkgYWbEgZll6MhpI+rPijWGF7dxarOhWav/9qsW9
         UEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627354; x=1794232154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddZdd9Lnc6kmOH5nhdihlv1Hxg55WS0ci8Cr1qUkBv4=;
        b=xNexHVCIMPRIz5Em/nu8pwgh8W3FzbK2Ip0ad/NSWzsfpA6gApkiprgUTV1fVAwQLu
         tnacUZVM8Qo2XG7gin7WLJNctWzU3bEaWqTRDQU6A8DN+XreYIPdIQFHywDnmQvRiemF
         btoJShg/2r9oMG4/5KYLKAROlZtxNSMXS3ZQWkYWlnXJtYTJLNOgWILDDi/1HBMfDbgQ
         XgKIx/WYR66nyKagp5nrtgAfv+/iCe5+fcjikI+/Ce+c4U+AUvTe+juTzEo3qJOG3F5K
         25OchPQ7kctsBCXG2iQcutLewdLXdErjj3Qczi2TOejCicUd++nelfzDJuxp7DKj5By5
         BZ4w==
X-Forwarded-Encrypted: i=1; AKwUvBxCJwd1IDR8/vh2ZTO6sjLHIojWg+0T9TqHVmoSdfqOxMyWNVryI9nRZsUcjMqLbwVhWfgMWOpHHV582oM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i0qw3kSqPhCywHDuBySN6AHJseMPUtUOr6ptImW0/++od5tdw
	aen5wc5in4OKe6YHxQW7nM5LHtrm1jl7FNCBaEFOoYPJi9GUh/5JeGCP/NXtnvhbWTWPTq7t8aN
	Y9KX19eoyf+dmgpwraLmbXXhkJUAZjcr+8yYxtcbUDZzpHlOAN7Xy1XC/Yym3yhvNVQ==
X-Gm-Gg: AYBFou3R5os6vIBXWtM2q3IepM2d3uCv7KoQJ1BP8GQhzRDH6gVcrRTXl/EV2y8eTU1
	xgtTpXS38x37YM67pT8CSU70IOtyKIc4MgoLy17WndfYZz6fQ7QVcj8j2DzP1UMnK1COuppnv9W
	yGCvCUMfB+61n8h71G20GigmNr3OdFAZJnY7OjA8eWO6VA1ZN/4CuM1AZ4qhjwj6aRE9AN72m/A
	n5Ih4LL+LIrF/mtNuqWI22pOMPVEepp/zCcVEk3sSdZEP9hYf1V5uH+t657PPEnVzo/NLpSbKbc
	l5KKhj9gvFLmPBNX+itHctR+fNAACBSwDmC/+v/q04KOwqdYvEZ7nPM6mlql0/Qldal4TChNia/
	fFjEOa6X8JgXKtthsvxt17iA+ZrzlC5plq+DrUSESXUK+D9WL9aQImapm5Evh3b7stVZZZsuNhv
	+Mlg==
X-Received: by 2002:a5d:5e8c:0:b0:48e:679a:4b03 with SMTP id ffacd0b85a97d-48e6e4f8bbamr24526645f8f.45.1793627353812;
        Mon, 02 Nov 2026 05:49:13 -0800 (PST)
X-Received: by 2002:a5d:5e8c:0:b0:48e:679a:4b03 with SMTP id ffacd0b85a97d-48e6e4f8bbamr24526577f8f.45.1793627353329;
        Mon, 02 Nov 2026 05:49:13 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm19979575f8f.23.2026.11.02.05.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:49:12 -0800 (PST)
Date: Mon, 2 Nov 2026 14:49:10 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched/urgent] sched/deadline: Fix stale rq->dl_server
 after a server pick returns RETRY_TASK
Message-ID: <auiU1kk009NDsT0L@jlelli-thinkpadt14gen4.remote.csb>
References: <20261030221842.4071610-1-tj@kernel.org>
 <auUuuJnEI3HWkwYA@slm.duckdns.org>
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
In-Reply-To: <auUuuJnEI3HWkwYA@slm.duckdns.org>

On 30/10/26 13:56, Tejun Heo wrote:
> On Fri, Oct 30, 2026 at 12:18:42PM -1000, Tejun Heo wrote:
> > __pick_task_dl() records the server in rq->dl_server whenever the server's
> > pick returns non-NULL, RETRY_TASK included. __pick_next_task() clears
> > rq->dl_server at its top, but a RETRY_TASK restarts the pick below that
> > clear. put_prev_set_next_task() then hands the stale server to whatever the
> > restarted pick takes.
> > 
> > Since b3a2dfa8b42e ("sched/fair: Add newidle balance to pick_task_fair()"),
> > fair_server_pick_task() returns RETRY_TASK when the newidle balance released
> > the rq lock and a higher class task was enqueued meanwhile.
> > 
> > That task, an RT task for example, then carries the fair server in
> > p->dl_server until it is next put. The RV deadline monitors see the fair
> > server switch in with it, and core scheduling, if enabled meanwhile, treats
> > the task as deadline priority.
> > 
> > Don't record the server when its pick returns RETRY_TASK. The restarted pick
> > records whichever server it goes through, if any.
> > 
> > Verified with a synthetic reproducer.
> > 
> > Fixes: b3a2dfa8b42e ("sched/fair: Add newidle balance to pick_task_fair()")
> > Signed-off-by: Tejun Heo <tj@kernel.org>
> 
> Ugh, please ignore this one. Sent out the wrong patch. I'll test Juri's.

uhu, don't think any of my recently shared patches deal with this case?
:)

Thanks,
Juri

