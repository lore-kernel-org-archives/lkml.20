Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427469;
	b=lqiXBCYWk9wa/vvOEvHHx9xUgIKGC4R65Jil7ZZAhHHaFLv1cU0m5TL7n3s8/zOh14KQ
	 t8iR9I+lRxmEieEevb6CTe4DU4sih4fAHq2dfV7ZKi8qY4whgSQqkhqP8lIOuDU3IpNNX
	 6R5LVyImX2DR7XO0rE90zZTSEDr2/WrmU/hA9zX0/gMKhabBvqyfGeUgqc1/UFAUUpHVx
	 19Zee6Uz//+hyPiz39DaYaidYp8g6oOCHewAMF7N2Jg5I2Ae9uJ7MIUtqkrKmREeLxWAH
	 d0wrlxYCvsdp306gGTxdjXlU8M8tqfKrpz8Tgse+S8yJ0mcyblXpyRXBh9ck9QU4bpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427469;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Scanned-By;
	bh=7vGFlsnjZ5TUMr/EjNcJOClHWlRBtcNRQf4NXslTfyM=;
	b=xEYeFeAE9As+rcfszzlUSIuFjO1fXZDZeMCED6/E6wiQIgGh7w+95bic9HwwCkqgGjX5
	 CQBUSJ6VQacxMN5LCn5mICo8Bg58q3o5+fJkRFBaRPuntyI6e5K1e5vXmxtjt9tUit8vW
	 +x2KikMyS71rSi4r/Tujz3wJ5rsvG8WOeXFAAVUUtuOHzBo22qWqVmvb2UAGWhdkRzu4n
	 EYht+fV8B42p8ij3GnZilSiLfPI+JVVCEd9LTcLTRaMji263H9hKmi0TyBvl1VbhtagoV
	 e9y0h33p6Z5vvndIXuvgJMgBL/Mk9L9Gt+VWNL290niG9mdWSEg8hh4XbHNmLd0UfjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TD+fKMNs;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D1B606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D1B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TD+fKMNs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792427468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vGFlsnjZ5TUMr/EjNcJOClHWlRBtcNRQf4NXslTfyM=;
	b=TD+fKMNsK0fosoAX2pbCBih0qV88/JuzgijcjA7REmxm5oEJ2/TXtpuAeSQaCVXD9rUbGp
	n2q/fUA4ZArJYXUV4s7k4UcRS20G9zwaVuXtOUmnBWyjB+vCSPyA9HbuZD0DvH4edHXrJE
	/5gv+CYlpl65LtIKDmA/0F8WHKqwJpA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-240-Rx91e-ptPqaFVRcYxJHLXA-1; Mon,
 19 Oct 2026 16:31:02 +0000
X-MC-Unique: Rx91e-ptPqaFVRcYxJHLXA-1
X-Mimecast-MFC-AGG-ID: Rx91e-ptPqaFVRcYxJHLXA_1792427460
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9488C1800EF5;
	Mon, 19 Oct 2026 16:30:59 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 9F5241803A40;
	Mon, 19 Oct 2026 16:30:54 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon, 19 Oct 2026 18:30:59 +0200 (CEST)
Date: Mon, 19 Oct 2026 18:30:53 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Binbin Deng <18983559317@163.com>, mhiramat@kernel.org,
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
	andrii@kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] uprobe: Assign session ID before publishing consumer
Message-ID: <atZFvTrDIyBtzWbo@redhat.com>
References: <20261019080709.477548-1-18983559317@163.com>
 <atX2FsqHIkOvhrLy@redhat.com>
 <CAEf4BzbX7vmpd2da4eKphX1r8=QXGey_1m32-KP=-8FOkFk15Q@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4BzbX7vmpd2da4eKphX1r8=QXGey_1m32-KP=-8FOkFk15Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 10/19, Andrii Nakryiko wrote:
>
> On Mon, Oct 19, 2026 at 3:51 AM Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > On 10/19, Binbin Deng wrote:
> > >
> > > consumer_add() publishes a consumer on uprobe->consumers
> > > before assigning its session ID.  handler_chain() traverses the consumer
> > > list under the trace RCU read-side critical section and can therefore
> > > observe the new consumer while uc->id still contains its initial value.
> > >
> > > The race is reachable when an uprobe at the same inode:offset is already
> > > active and a task hits its entry breakpoint while another CPU registers a
> > > second session consumer.  handler_chain() may store the stale ID in the
> > > return_instance consumer array.  By the time the function returns,
> > > uc->id has been assigned a nonzero value, so return_consumer_find() fails
> > > to match the saved ID and the session ret_handler is incorrectly skipped.
> >
> > I guess we don't really care, this doesn't differ from the case when
> > consumer_add() is called right after list_for_each_entry_rcu() in
> > handler_chain().
>
> that uc->id is important for "uprobe session" semantics,

Yes, but

> which seems a
> bit different situation compared to barely missing consumer_add() in
> handler_chain(),

I must have missed something... If handler_chain() misses consumer_add()
then push_consumer(uc->id) won't be called.  This means that then later
handle_uretprobe_chain() -> return_consumer_find(uc->id) will equally fail?

> but regardless, the fix looks good, we should apply it
>
> Acked-by: Andrii Nakryiko <andrii@kernel.org>

Agreed, I have acked it too.

Oleg.

