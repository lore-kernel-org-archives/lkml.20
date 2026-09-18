Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427753B8D76
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722192; cv=pass; b=F+x/DHzt9i2xuTF3/E6cod3hZzfYJXg8UTG119zKNf/fC/Sl9B0DipUzrZkxlcfNkMKPFZgeAe63IgxOjFgLLV9jfU0iq9u+xAZAXLynlcZ2kg9sJYBvM9zo50PDfzIrQoHB5NaqJK2UWVFaIHYSiFui2jSSvTFEzClOlQHUSrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722192; c=relaxed/simple;
	bh=6TlD8wuSjPaN9GyN5XboLKvnCQX2Mh3eITva9cDh0w4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mArdgXUYQSRfcb03G0xzJi4prVSXcbc+u8zKpsILp5dhlp0ozHqXA3g6RpTb9/zlL4mmwTGhOXDsKBucC8mpM3qkvJIH1YCV+Xl3RXpbmIjVBSmCWJw9IHbmDxWIxeRipsGCqfbKSkbz10e/2YUlI2hdhbvne3bDTmpijrja9Tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ackwVSn4; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ackwVSn4"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso64026166b.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789722189; cv=none;
        d=google.com; s=arc-20260327;
        b=LOevN1S8mgQqWViXlVt+9H6Bt+sRW/cSBeEnRDdiUJZpKAZ8tQb7YR/WfcTLQKF5Ik
         u1P4aWZ13zktU7Dx9Qz79IbZ8z8SxezPpCVvTq8OhiQH9rW1bz7eZ19vOQ80pFBorthr
         15fnNuXRWUTShmncZUmBzmjsJybgnwQEgllTynd55bJjs8LVLVBdEwS9mLuHvB372veU
         KWqq8D1qiBX5aBjk2JnjOBQhvj1xOD7Qv0euMW7cH5FYGPXk5dAiPtP1X9US+giIvrsA
         rosrWl0x2IlJhSiNEWQMb5WMnXnsXVVDDAoLsIwBMXpSZvsAnvW1W2RKA4UNYtoCEuYv
         T9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZjnOddhe/+6nZrX2o26xcB2cmch/7OUqQ9vJUDa25zA=;
        fh=9RUoM5+qV3WABHFSS42DU76U0idv70zMJ+3CoMt87U0=;
        b=KmmdGrdA9bt9AOuTzoMz2wsuktIpDMQRn8SZ7ibqU1KIxSFRyqnJiMBiGQafDWQkVE
         TTEHTz4mKB+shbwVdiCvUedGRzXJs/KVlvio7dL+8agZ0eJgHjB8D7aTnGmTux01oJtW
         phAIIJd7tWfGHkmhbNMaKw8UR0K6H1v3VAiMaLsOn5Bu9lSMgFfMriJgj21wH0bBqGvr
         0ntjvdUrhodsO0bhWnQBMH0a03tBKxz22PKA5kE0a89/Myjg0TcnWgFdXQqazt/ixySa
         Zu9hhBo37RXm1x7NycR/Zs14mmYS6+B4ncOGj8yBi407+AhZBPOhDbeqO+/smy62E2aA
         xh+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789722189; x=1790326989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZjnOddhe/+6nZrX2o26xcB2cmch/7OUqQ9vJUDa25zA=;
        b=ackwVSn4WI8VtLcF8lb6kw/3eknAzvMlsGX8QlMCkh5ItgPC433rOEkyPO/tQmB2Gs
         30PaneC2jERsDSLcheLSKZ1z/bg/5OgFTiJF85byv/UA9h4i2IOHcmO+KCQO5sEoNH39
         5WdlsIsJBgxYJmDUHE6oKbRYWxI9RoKXJaVI0CuYJ4OgYdJhZuD2izy8QVvYy69yBcAj
         r2K/O28kNQi9G9Ynrv3LIhRHefXhUL7mf/XhfruFxgd2MpqMG0UUfPVxg6RCI/Mo4wki
         TuNothWQYZKYjA2l7vap2cXx7lyQQQiNbtqCztu4P9MbZkduKYa11C6jUhctNmBAuqXq
         u1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722189; x=1790326989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjnOddhe/+6nZrX2o26xcB2cmch/7OUqQ9vJUDa25zA=;
        b=2hWzG0BceoYXu38JOKoTj+RztAac9AmrOQFyOxH78Ez+0WnguMPhYYBoDif6apmKyE
         odOD/8cBdd3c6em/oApCfEKYjwP4ZV9jBVbRX8YI3hv85kWBmlZya1Vo0eCPZ84gGeMi
         Tu8yN/WW224pXaIOyQmbzjQ6D9z3Scd7ysjUN0MDgQjQad7rvy+900aEq3uFtbFIXpM4
         84LNDkJ0lVgW5cUEFl231gE04z/XXKLFT7op7XT8gs+/MXgFzaeCHhqnXPBq/YCqRAoD
         lxSfF88GcGQ6WHMVx/zDCr9ZUOdUbJ7mxoS8uwXHm2vFWsnxPgE5cwXm4+iispxz2oX5
         TqGw==
X-Forwarded-Encrypted: i=1; AKwUvBx+z6Dw9DRe5BPKFjG6ubb6s/meZA2V+HPptc5UCZ+Ov8p6R/ieX65BFaMb8vsODo41/bAqW1qSf6fBGiA=@vger.kernel.org
X-Gm-Message-State: AFuF++n1bGY9UIQQVC+yQ/n3P9H3dRxM0xwoqVGbSZOIP8Tf+xCNdDls
	1mYdv9xLbwZRuz/xGZPZd0KXUdwKQLK1XHUyyNIS1nOwjvRDPi4jKHR9OD8yPAEQcYVg0Xu9WRd
	+9EA+9Ii5btWC7LLQcOSz/LtfV717KLuddEI0nQIVcySwW8XPzHz0bImF
X-Gm-Gg: AYBFou0adZsbDorOhob1yU8/xhKrEB7BLbXJrpEtUEWdevf9WJ52j+T9B8wI1WwyXVK
	ZS1RDrUWK/K9OzK5uYUSvvcn/w2+c1bTC7JGNH6dcYcBXVAX8ueM/nq2oMC2LlTNUobW+FZ/sJ0
	UWifoWH+vGUU0WBqf0mPPhWsA3zhhMHlkrxbAXitDaz2Ae9Jwqm6Q6Up4r8DLHZuNTQn148/ev6
	SbWNMSD2vXPWFB37yUcz2nQifVGGvGhnm7yVWnC+1BHHi3p4BvVu74sfapWZ4A52qY6AQUrNi07
	lsNkMUVjmdxCSQ4v0sHC+gF4/nlf2DoH7h36EkXqdwSE/SL+7YS5Wx8OfU0i9eej7LGUmS6Za8B
	NrIuw5OMKb8pxhUw0Hf3IfCXNdeJultBZLsephaYRgc/mrobYcZ07iJA=
X-Received: by 2002:a17:907:9345:b0:c25:5a7:87f with SMTP id
 a640c23a62f3a-c2a1547f75cmr189032966b.0.1789722187933; Fri, 18 Sep 2026
 02:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416033443.1492483-1-luogengkun2@huawei.com> <CAP-5=fW3yFPj2HuSZHntUNgze3UdY3eSsMditKMw4yWRCfg_CA@mail.gmail.com>
In-Reply-To: <CAP-5=fW3yFPj2HuSZHntUNgze3UdY3eSsMditKMw4yWRCfg_CA@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 18 Sep 2026 11:02:56 +0200
X-Gm-Features: AcwNN1Vl1kt_vkzCVFaTRtgcR8ATogeMjqtrHtAJDnxMsot94AuLZrOqOXFlq0M
Message-ID: <CACT4Y+YXrH3_7Je2+8r9-VV-4Dc4WekRrz-9_Pe-Qj1tfFDtDg@mail.gmail.com>
Subject: Re: [PATCH] perf/core: Fix race between perf_event_exit_task and perf_pending_task
To: Ian Rogers <irogers@google.com>, elver@google.com
Cc: Luo Gengkun <luogengkun2@huawei.com>, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org, mingo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Sept 2026 at 23:35, Ian Rogers <irogers@google.com> wrote:
>
> On Wed, Apr 15, 2026 at 8:08=E2=80=AFPM Luo Gengkun <luogengkun2@huawei.c=
om> wrote:
> >
> > A race condition exists between perf_event_exit_task() and perf_pending=
_task().
> >
> > During begin_new_exec(), perf_event_exit_task() may be called, and the
> > PF_EXITING flag is not set on task. so perf_sigtrap() continues to exec=
ute
> > and triggers WARN_ON_ONCE(event->ctx->task !=3D current).
> >
> > To fix this problem, also check if the event->ctx->task is TASK_TOMBSTO=
NE.
> >
> > Fixes: 97ba62b27867 ("perf: Add support for SIGTRAP on perf events")
> > Signed-off-by: Luo Gengkun <luogengkun2@huawei.com>
>
> Dmitry, the description and patch look sensible. Could you take a look?

Marco, please take a look.

I paged out all context long time ago... The code is too tricky to say
if it's possible/not possible/fixed by the patch/not fixed by the
patch looking at the diff.
A test would be helpful. Will also prevent regression in the next release.



> Thanks,
> Ian
>
> > ---
> >  kernel/events/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index 1f5699b339ec..3422900263fa 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -7543,7 +7543,7 @@ static void perf_sigtrap(struct perf_event *event=
)
> >          * Both perf_pending_task() and perf_pending_irq() can race wit=
h the
> >          * task exiting.
> >          */
> > -       if (current->flags & PF_EXITING)
> > +       if (current->flags & PF_EXITING || event->ctx->task =3D=3D TASK=
_TOMBSTONE)
> >                 return;
> >
> >         /*
> > --
> > 2.34.1
> >
