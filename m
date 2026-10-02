Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B363EF0AA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970028; cv=none; b=m0Rgrf1a6amiQdeIGXbc+N2xJaiPtMfZs/+Hl0NylIXdkzmWLuFupzRHPg6Q2IdAQwKkoCNKxz5jjvNlX7ggxYnvdf3VTYKUYvRcViCCD5ikMIIdhpksnseqEv5FyI/QRrO/NZ5FrE8OJ5HgIXphAiVxqGcX+t+52Cfr2+WteuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970028; c=relaxed/simple;
	bh=XdBqw55dqknzAzVoQjTguu9ow2UwUNSdoczNlNrWgao=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=IE9BWTL+LrCdKk8XjhicCkFZSbpSiwg5sxIVcjHhsYacBVen7gxf6DZrQk40r25gNseG8Ns9K5djjBmG4hbFZgC1m8FGpUw9eMAskcTBVgyn/0iqLYqBFhYbf9beX+ZxRSzq97TeMHuhNFFjVaspJEahFMD7nOihLszj8QaJk2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CevYgOuC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fO0CP2uF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CevYgOuC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fO0CP2uF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790970026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XdBqw55dqknzAzVoQjTguu9ow2UwUNSdoczNlNrWgao=;
	b=CevYgOuCWdqliW/MZAguSUMdmfoA93u3+r7J/DAPzllMHxpyKUvGh40o5B7aRfmSTPOBp9
	QajFep4wmi2coshlWrPqIjYryhU929nilqFSuZGtQWTtkh44rrUU16+fhXpHYz7ckUsUNS
	qIgxQzFs9xWYo33BO/QtCrLCuB7PeuE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-t-pGR13SOmm0rgU0MuED8Q-1; Fri, 02 Oct 2026 15:40:23 -0400
X-MC-Unique: t-pGR13SOmm0rgU0MuED8Q-1
X-Mimecast-MFC-AGG-ID: t-pGR13SOmm0rgU0MuED8Q_1790970022
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49fcc575709so1208465e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790970022; x=1791574822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XdBqw55dqknzAzVoQjTguu9ow2UwUNSdoczNlNrWgao=;
        b=fO0CP2uFe4UWGrA340y4tZz5ZCUp1V1hxNss9Ae8zlsoKng6yw6Cp8YRQHiG5WTf40
         M8DGlIQTN0jNxtPFcIKlDTLxRePw7e/eVbhqba5XmYSzV+ovY9s/CdpASOK1C5YKEs1r
         4Eg1j9pNhilm2snSpfBE+Snrg9iHIuv9xAfAT94H//bwIbDwz2EeRKsvF2y+Vqi9SFqP
         JcHPqwWDqTjguTA1f5TzkQoxVvKkH+ktrf54EpmFTM58vGwKRk/VJwBNnEfnq/oYkkf1
         lXnRXIM9gaXGT6CHrvmkNHnA1GinJ5kWCczBcc0ds9X9KzUU/u6HVIQq7BHkLH3kKL82
         MaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970022; x=1791574822;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdBqw55dqknzAzVoQjTguu9ow2UwUNSdoczNlNrWgao=;
        b=qOfpLrgAH9iaMyNIV+pTEehH8hZhvfD0YZaqbenMzjOaYUTQdeQRBWdqmnp+TuRLza
         micMm9868Wz1+1BvnnPw/7bxMBR/bxZjYCDW8gXsZFjsU7VHenSflwzr0XwpoFpcYP12
         RGM9z3EhD7+FVx20PO541qI4i5oEJD/4nX/nMbUWhEy3fAAJvbMnkHJXBMqrAAcLO4GP
         9AVJZVt8n6XXUSdAKGdyPNXk37sA2UOmMGL9KjLSgWJ54SCO4Bkl13Ieu5/I0AbVBesD
         Hs2bTJP+KwjinCk0cwZRL+6tMvZsxqN98wr/4sTWymvJUbmr3XZSeE0sL+9Ahwbp8DDI
         WLLA==
X-Gm-Message-State: AFuF++lvQSGNtKMBvT2DtZkvDO0ifSKPApqWGu2eOFYp8pcuUb+VWDgV
	tQu0ttCYKAmXi1x7ZdKIaLntb0Hlz4zEUt7zPBs699T5HqBQZIfYxmVe4ylJaxXciPUMXOGy9eE
	U8WAxGYiiqMLg0ty/FiIwWzZ6doUNmA3pLhPBXbMX7fUL75gDGyX/D4ruxSvYPGrD3A==
X-Gm-Gg: AYBFou0zz4w4JHHAynp79HXAVqtVUsiZs0uvT7swamQWMIgnUtGqCoJr3l01kEVrz81
	gl11gXUyEOVVeqq8deSRICb/z6SUOx9kLAllvweqIMT318vmO1WjAMmufEK9H70SlQwSLZR5En6
	s8KJd+NFnFKUKx+IxGEh0s2BImeZp4yfbjKO6mY4qcop/GVhrzbHxc48Q1pNb5F1H5cYJ7HPES5
	cIkeo71HaqPEJPHF02LQ/fltpc8ewNyWoZuNFKlvbz6KhNcdxS4uPLT+W87lEuYhMit/xMUyyVE
	S5Vy3gHbXMyKw8Ca+wqFwblQA5hzfR6pRVT4XR0ANOnWrutVAoh5V2ipwjnBl+FeVoXdLI0Rfts
	i2EDzAvUTzTTSkYOJ2jk5HcUw5ZDhinrCRw==
X-Received: by 2002:a05:600c:c10f:b0:4a0:1fe2:d4c8 with SMTP id 5b1f17b1804b1-4a1680dd3f4mr4347015e9.5.1790970022134;
        Fri, 02 Oct 2026 12:40:22 -0700 (PDT)
X-Received: by 2002:a05:600c:c10f:b0:4a0:1fe2:d4c8 with SMTP id 5b1f17b1804b1-4a1680dd3f4mr4346845e9.5.1790970021765;
        Fri, 02 Oct 2026 12:40:21 -0700 (PDT)
Received: from ehlo.thunderbird.net (mob-5-90-98-35.net.vodafone.it. [5.90.98.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm8640050f8f.13.2026.10.02.12.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 12:40:21 -0700 (PDT)
Date: Fri, 02 Oct 2026 19:40:19 +0000
From: Gabriele Monaco <gmonaco@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 bpf@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Nam Cao <namcao@linutronix.de>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Wen Yang <wen.yang@linux.dev>,
 Tobias Schaffner <tobias.schaffner@siemens.com>,
 Viktor Malik <vmalik@redhat.com>
Subject: Re: [PATCH v2 01/15] sched: Add task enqueue/dequeue trace points
In-Reply-To: <20261002191842.GA1259248@noisy.programming.kicks-ass.net>
References: <20261001152042.124445-1-gmonaco@redhat.com> <20261001152042.124445-2-gmonaco@redhat.com> <20261001154934.GT88198@noisy.programming.kicks-ass.net> <d75888885e2c94c1bc717faa864f609c43db874f.camel@redhat.com> <20261002102939.GB2823843@noisy.programming.kicks-ass.net> <56972260b9221128d7aaf5bb60f90611ec9d7235.camel@redhat.com> <20261002191842.GA1259248@noisy.programming.kicks-ass.net>
Message-ID: <6BEABF91-8CA6-4859-A426-D65F3CC6E13B@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Il 2 ottobre 2026 19:18:42 UTC, Peter Zijlstra <peterz@infradead=2Eorg> ha=
 scritto:
>On Fri, Oct 02, 2026 at 01:55:48PM +0200, Gabriele Monaco wrote:
>> On Fri, 2026-10-02 at 12:29 +0200, Peter Zijlstra wrote:
>> > So mostly I flat out out ignore partial series=2E It means I have to =
go
>> > dig around to figure out the whole picture, and anything that require=
s
>> > extra effort goes on the 'later' pile, and you know where that lives=
=2E
>>=20
>> Alright, I guess I'm going to have to fix my to_cmd script=2E
>>=20
>> > Now, as to 3,4; I'm confused=2E If I search 'enqueue' I see there is =
a
>> > tracepoint attach thingy in the =2Ec file, but I don't see the
>> > corresponding bits in the =2Edot file=2E And per my understanding the=
 =2Ec
>> > thing is an artifact of the =2Edot file=2E
>>=20
>> Yes but only partially=2E There isn't always a 1-1 mapping with model e=
vents and
>> tracepoints=2E
>
>So the =2Ec files are no longer an artifact? That seems unfortunate=2E I
>thought the =2Edot file was fully descriptive and the =2Ec file was fully
>generated by dot2c=2E
>
>If we cannot fully express the automaton in =2Edot, we should look at
>extending the 'format' and teach dot2c new tricks=2E

The linking between events and tracepoint has always been manual, but yeah=
, it would be nice to describe the whole thing in the specification=2E

Though that would require quite a bit of work, deadline and LTL monitors h=
ave some more complicated mapping=2E

>
>> Throttle uses handle_sched_enqueue() for one case of dl_defer_arm, repr=
esenting
>> a fair task running not boosted, in the enqueue case, because it was ru=
nning
>> with another scheduler=2E
>> Boost uses handle_sched_dequeue() in a similar fashion to describe fair=
 tasks
>> that stop running on the fair runqueue (but may continue on another run=
queue)=2E
>>=20
>> In both cases I'm reusing an event that can be triggered from other tra=
cepoints
>> too, ideally to keep the model simpler=2E
>>=20
>> Then it uses handle_sched_enqueue() for dl_server_resume[_throttled]=2E=
 They are
>> both plain enqueues, in fact, so I could rename them to show what they =
are=2E
>
>I'm not sure I'm following=2E Will you be in Prague next week?
>

Yes I'll be there=2E We can definitely discuss this better=2E

Thanks,
Gabriele



>> > Also, IMO it would be *much* preferred if the =2Erst file would not e=
xist=2E
>> > Just have the graph-easy and the description as a comment in the =2Ed=
ot
>> > file=2E Then you have the whole thing in one *readable* place=2E
>>=20
>> Well, you make a fair point, I like to have it appear in the html docs,=
 but
>> obviously no one is going to build the docs to review a patch=2E
>> I may look into ways to get both birds with a stone=2E
>
>So personally I have 0 interest or use for html=2E Mail is text, code is
>text, we use a text editor (neovim is my current poison of choice)=2E
>Nowhere is there html=2E So then having to look at rst is just crap=2E rs=
t
>gets in the way of actually reading the thing=2E All down-sides, no
>up-sides=2E
>

