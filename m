Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1D41DDFF
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942155; cv=none; b=q7pP8Sf9LTMh3kQQHiE8LZAl6CuuFaCIokTan57xDRI96KJKppTvLjSGAuvp0jzk4LuVlu6YEsXSuh6m7bN2hLHtqZ3eTkWCuJ1Ei6Tfiv01qOlELxhBKsZ+vrp/zwEtW1mINU7lerDPOd1BIwF9dC14wSQJSEtwskppAxU6Bso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942155; c=relaxed/simple;
	bh=pXKyCSM9FZhLXmXKCC5/hagyDn8EQ5lF9xqVMMSFVIc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lXMNOq7OWJOXvYBF0Hg21cHpHMUKDsCiN5WcF30EsE4PnZNw4gwi5+i8VjuqJcyW350eksbjFJgV5TWTlVqSe5ERaplKX50JrZwT2Xb9zxkhvpbAOJQ64ibbI7CEJGRFJg7GwWPtIdtmzO2mc4Mx8bSMkY9PCkjZ4sKEI+PVQ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GDEdslbd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Siwxu5MY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GDEdslbd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Siwxu5MY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790942152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pXKyCSM9FZhLXmXKCC5/hagyDn8EQ5lF9xqVMMSFVIc=;
	b=GDEdslbdqLTWxgeYrJx+CpbNg/hQhgxjfD/CdXdnSwPeJLFWTbZmmSe374XH1exFPbYFNG
	ttcrNRLxiBA/xwr6Otso42NtQsfWJhyL0fG62q6Cc9/gs0gbFfkHnjyKQoeG3HU67Q57AJ
	vwOFRxDjF+pVXlZdKjgv8AKcisa6PRU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-xz9q92N3PaWeuEXEkBzavA-1; Fri, 02 Oct 2026 07:55:51 -0400
X-MC-Unique: xz9q92N3PaWeuEXEkBzavA-1
X-Mimecast-MFC-AGG-ID: xz9q92N3PaWeuEXEkBzavA_1790942150
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e7631c43aso71972415e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790942150; x=1791546950; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pXKyCSM9FZhLXmXKCC5/hagyDn8EQ5lF9xqVMMSFVIc=;
        b=Siwxu5MY7H7hXsJA3PcvpP9FgbuEkazdWt3BfEjNKclADbd6mtI+bn24AvhYrm/Y7k
         dmT70cDSqp5p7siZCJjuQvXOvM7mQSzpXV9PxSnmpbRIkC+6OWUDK7BoxEPD2K9rF26j
         kxfRuViZYUG8jTNYtyFDhWf4yGSqxgFZ+/e+R2+z+M7jKEADwpiDY63HUz9zWfQndByc
         hY/ds3Dg/rv77pjtUbq46vbqVHFlCWHjL6XZLOgUgRSyeL/5PUQwHxObbVBpsH4V4gHY
         TMSN0RTv2jE8/Pbrmh+KxxOk7jhzcVXYQggVPZqy9hdMNEeOunfbi4CWPSNytKBTMCDT
         RTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942150; x=1791546950;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pXKyCSM9FZhLXmXKCC5/hagyDn8EQ5lF9xqVMMSFVIc=;
        b=gXwng46NKyVYztYDGNjX1pmzkLvm/TNqMt8mgOh7NzQvCTJI5uj/Xa06UJhKXXNtKi
         GR7OIQB/x2CBzvhzbycyMugbRPm5IvZpohjkxvK9nDgCcxVvBjDMdE4Y6JQ/DRYMJ1vD
         QEs0pR2J8EPFEJMB2ek9pbtxf02R20J9miT4t+nWnMtVWQPb2wb5wcW+jTvlrUbtvi0L
         e2epv9iv2Au5bHzyv4MBOizZmbxjsBtm0RYUOvkSMjVZpn13nmGlcjnW8YtswYR7Gs2d
         TBGYGcLwc767DVBUmbY6NxKIjbyAdjD11pMJq4idoLZVYF2gjHrYarp+fP/svjVqpR/6
         WujQ==
X-Gm-Message-State: AFuF++nU8Ctp/6b1u3FLRwdWaq5iKvMV0wLqusNe48gZubouBWZObe0z
	qRhLuKas6UH4W+1JNXaTPuAY2fJD9x5/w9YBpqnct1/yqSeP3q86tAMaPD2lGltL2ICC9jxAjj8
	wMfPXMwMNwyWDlQUO0gcEsOuHqTJDrfjGObJp/R4oGA8eAkkqq7J+lUFjTNpDtUzauA==
X-Gm-Gg: AYBFou1AvHgbCTuFaIguIVh1ERDkS6k5dFr+64h4yV2Zybm00URNZ/Dlye/8HaBHRdW
	K7oxzDwYOZZGBRBNnk4yYRINUVd1An3bqbj6SoywmeCeaXEO8lHZP4bq3q0RD/3eg/WalO5TUIu
	P8inogLo2wTSCEfO85grtp7P3lBsltSmDQs8VGMXxTFfhLdmWT+1UgOYsWDd2bphuqRuq/kFxlI
	AWIcbhemy0eUtTdgqgPe/8LcLU+dB/RykUbyonZbDb+4tzdDk/7wN2y/wLyel6vhnl+SiCGwJnr
	tfXrTK8HuJijKYrX6alpaAl3+kQXuG/ZFZsG4H4WDHLHt7btg3ZdaygVT8JRpsixHlmEVgmVnyf
	/CRKhvHA3VOgoVyUPtZgVM+dlgRM=
X-Received: by 2002:a05:600c:4e13:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a02757999cmr45042575e9.16.1790942150034;
        Fri, 02 Oct 2026 04:55:50 -0700 (PDT)
X-Received: by 2002:a05:600c:4e13:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a02757999cmr45042315e9.16.1790942149646;
        Fri, 02 Oct 2026 04:55:49 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff2280csm44473765e9.4.2026.10.02.04.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:55:49 -0700 (PDT)
Message-ID: <56972260b9221128d7aaf5bb60f90611ec9d7235.camel@redhat.com>
Subject: Re: [PATCH v2 01/15] sched: Add task enqueue/dequeue trace points
From: Gabriele Monaco <gmonaco@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
	 <mhiramat@kernel.org>, Ingo Molnar <mingo@redhat.com>, Nam Cao	
 <namcao@linutronix.de>, K Prateek Nayak <kprateek.nayak@amd.com>, Alexei
 Starovoitov <alexei.starovoitov@gmail.com>, Wen Yang <wen.yang@linux.dev>,
 Tobias Schaffner	 <tobias.schaffner@siemens.com>, Viktor Malik
 <vmalik@redhat.com>
Date: Fri, 02 Oct 2026 13:55:48 +0200
In-Reply-To: <20261002102939.GB2823843@noisy.programming.kicks-ass.net>
References: <20261001152042.124445-1-gmonaco@redhat.com>
	 <20261001152042.124445-2-gmonaco@redhat.com>
	 <20261001154934.GT88198@noisy.programming.kicks-ass.net>
	 <d75888885e2c94c1bc717faa864f609c43db874f.camel@redhat.com>
	 <20261002102939.GB2823843@noisy.programming.kicks-ass.net>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-02 at 12:29 +0200, Peter Zijlstra wrote:
> So mostly I flat out out ignore partial series. It means I have to go
> dig around to figure out the whole picture, and anything that requires
> extra effort goes on the 'later' pile, and you know where that lives.

Alright, I guess I'm going to have to fix my to_cmd script.

> Now, as to 3,4; I'm confused. If I search 'enqueue' I see there is a
> tracepoint attach thingy in the .c file, but I don't see the
> corresponding bits in the .dot file. And per my understanding the .c
> thing is an artifact of the .dot file.

Yes but only partially. There isn't always a 1-1 mapping with model events =
and
tracepoints.

Throttle uses handle_sched_enqueue() for one case of dl_defer_arm, represen=
ting
a fair task running not boosted, in the enqueue case, because it was runnin=
g
with another scheduler.
Boost uses handle_sched_dequeue() in a similar fashion to describe fair tas=
ks
that stop running on the fair runqueue (but may continue on another runqueu=
e).

In both cases I'm reusing an event that can be triggered from other tracepo=
ints
too, ideally to keep the model simpler.

Then it uses handle_sched_enqueue() for dl_server_resume[_throttled]. They =
are
both plain enqueues, in fact, so I could rename them to show what they are.

> Also, IMO it would be *much* preferred if the .rst file would not exist.
> Just have the graph-easy and the description as a comment in the .dot
> file. Then you have the whole thing in one *readable* place.

Well, you make a fair point, I like to have it appear in the html docs, but
obviously no one is going to build the docs to review a patch.
I may look into ways to get both birds with a stone.

Thanks,
Gabriele

