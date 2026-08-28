Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9AC376A05
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908291; cv=none; b=BGrNyKVRyQhv9JpQYe7C5dzDmfWc8h6sRTKzgqNDFTyFlDctjts+2PAw231RJeqrWB/e2wYyV/N2AfVQdTSIHfsAg011HGrK4GOHsGjL0+JSlOninGPphkzTGRWEIeVbPsafiPdTV0hLda2e21qBrx82RvOZN84By2nYGk0sk+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908291; c=relaxed/simple;
	bh=0NoGWYXkZtnvQVYWLeYjf5wTVZE3dJCS6dRqWg8Zm7E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qWT5I9SvahT8FGDMFmfi+OLiVCxQ4KYqearWs6IhJNN35bHGMvCKhgK5LRIkPiyxP7jc1H1cPPSvqsCUz/8yAvC6h/AJfFAYdETMtVGK2JDuz6VfsYMVXeCY6atmvJZmsRQ+m/FTRohMmX61F/IJqGYi2Wnz5UgG+AMwNzdv9+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cydVPdUW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hOFU9LrD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cydVPdUW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hOFU9LrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787908285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0aZFpNchYrZ7qGeMx+NpApsSK+QHS5XaUKDDTkM8vuM=;
	b=cydVPdUWRrwJhI6oN1LLATXLy7v5aB8S0zjCAjCluoFqAIteCSny0TeNT5/ANYDX5TbT2z
	uhWcQQpeHRhFRr5RT7CtHxpSoRuX4NZNviYjBypNS1NQJsIge0YHTwvDyvMunpt6VodiQS
	opb2Npz5uOUNkOhO4mgEpQlclXdE8kA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-M9pP2n0oMUaLEHcf_GHapg-1; Fri, 28 Aug 2026 05:11:23 -0400
X-MC-Unique: M9pP2n0oMUaLEHcf_GHapg-1
X-Mimecast-MFC-AGG-ID: M9pP2n0oMUaLEHcf_GHapg_1787908282
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c24ae1a510cso55953666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787908282; x=1788513082; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0aZFpNchYrZ7qGeMx+NpApsSK+QHS5XaUKDDTkM8vuM=;
        b=hOFU9LrDMefOH/jbkMCx2nxtWXfrt4WFfwnMu57xNAfvp/7iy1Au98HI+GE/6pyLcH
         gx6Fm1SizN6TqVJ8ea/MnPSJYYPVy1yHgUw0+q0PkAbpnkhVV4FZZe8wFA8fNVzCyKnm
         3zVGsh3Ty1e6tU7NxU2XpLp3wWu5Te4ho2o7afbJk3rp0+y7YbmD2FJtTRkxi1SAOghu
         M4rX/Ky7dKn3Pa2Eez+xuvaa/WCqoCwF7JA5GuuediYMS+Lh9jSNft7xc5GsBgjIiuAN
         OdQu2QN3MVIkw1Ez3ecFi0pJnvwRiUXfx3gi5Gnkab4gmKWwHjIc4pJRGO5NOr+FHUC6
         eztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908282; x=1788513082;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0aZFpNchYrZ7qGeMx+NpApsSK+QHS5XaUKDDTkM8vuM=;
        b=kme+mDA34CjO/uVWdJIkLTFuFzSuGWkxrRDJP9axFjrl5sKqF67/SY4cJcn9kFxcqe
         krxyGSIldDSDwley+kgGljv0lw00Te3XWs3Nzsnr5Kq/e5wPmnP1yEBMDy39xLmmFFcO
         4U/ZLxqADUictlBEzeEJa57WN+dt9CiTgOnNjTZ9sf4otjmlu3BdycFPO2QxfYhawYfj
         a5iSSRJVscby+AU0aKbnnjQIsR84Wy2kMZebXuPljqiLevv09nesevYJQ6M5cF7WyJV5
         jcEeKSRo8DkD+FA3W73Ng4zr07+0osE0dJEtVBVlTmKBF1vrf2avJv2dKFIpqz4EszKp
         aEZg==
X-Forwarded-Encrypted: i=1; AHgh+RpRFrJ/cmINK2+JmI1q0q49jey4WbleP7cM7xV/mnNG8sepWzI7UP+Qxm8EoyR9liKfbtvfeN8Iha85zrM=@vger.kernel.org
X-Gm-Message-State: AFuF++mq03MRA/fSuIGok5QbCprOmG6ixzv5/YQwO3Dn3ycOaG3yeuQ3
	8D/tfn8sL6oCiXqk1DDb5wTEqMUvYDYZi5ZPWgVWpK8ykBsr5U5xrRED4Z7Kg6lOpTaXCHbEBtz
	LSgpvrq0Js+OONLdPIE2rPGS+SdAafQyI6hmTyAXPGffQhDt3dWL+rgCT4X25wkoOsw==
X-Gm-Gg: AR+sD10A/x5w8LRom86mdJAGzeN/1Wmqjbe6N5mfR8N7//5YSTVmkkdnQd1teuQhqP5
	gnHAZwBKG3ogmyNrybnZfJsul/0OXFC2CKug1iWnL/VfkAD2h4yYzrkMNafKtUMfD/+5kHX52ZL
	DfnE8L946mQclzIV6eVzUNn3mqgreTSEppooIyee1wD9/F7S7TTMDD1SWR8bsNi1+l530LeoPYN
	ucJnuXcuXFx85a1BMw6+4NysdR2deq1ShGd1k5oiFzRgIrvFG9i8LBxL90u9vaLDV7d0Ca/A57W
	j1YFhd58Jut/Bhll3hilC7n6nt4bMbjUrK4p49MHD9Gsl+9nGGzZki2wZGZClygxair7FpKM6KF
	7tp72uykCeOEkRyWoui3CJypsAUZHM2T53F24NIjM5nyo0SPjVl3HJWZkVcuWEDn+EfQIzw==
X-Received: by 2002:a17:907:3cd3:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c25571814b2mr394183266b.11.1787908281853;
        Fri, 28 Aug 2026 02:11:21 -0700 (PDT)
X-Received: by 2002:a17:907:3cd3:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c25571814b2mr394151866b.11.1787908279114;
        Fri, 28 Aug 2026 02:11:19 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee285b9sm57943666b.24.2026.08.28.02.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:11:18 -0700 (PDT)
Message-ID: <3783236cfa6496939c10555977e904daeeb774ff.camel@redhat.com>
Subject: Re: [PATCH v6 6/9] rv: Add tlob hybrid automaton monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 28 Aug 2026 11:11:17 +0200
In-Reply-To: <d8eb57e037881da2187c84fb9c8499f3acf04fb3.1787243842.git.wen.yang@linux.dev>
References: <cover.1787243842.git.wen.yang@linux.dev>
	 <d8eb57e037881da2187c84fb9c8499f3acf04fb3.1787243842.git.wen.yang@linux.dev>
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
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-21 at 00:45 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
>=20
> +
> +Description
> +-----------
> +
> +The tlob monitor tracks per-task elapsed wall-clock time (CLOCK_MONOTONI=
C,
> +spanning running, waiting, and sleeping states) and reports a violation =
when
> +the monitored task exceeds a configurable per-invocation budget threshol=
d.
> +
> +The monitor implements a four-state hybrid automaton with a single clock
> +environment variable ``clk_elapsed``.=C2=A0 The clock invariant
> +``clk_elapsed < BUDGET_NS()`` is active in the ``running``, ``waiting``,=
 and
> +``sleeping`` states (``stopped`` has no invariant, hence no timer); when=
 it
> +is violated the HA timer fires and the framework emits ``error_env_tlob`=
`
> +then calls ``da_monitor_reset()`` automatically::
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | (initial)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +----------=
----+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +--------=
--+
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 running=C2=A0=C2=A0=C2=A0 | --------> |=C2=A0 stopped |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |->+--------------+ <--------=
 +----------+
> +=C2=A0=C2=A0 switch_in=C2=A0 preempt=C2=A0 sleep

This triggered my OCD ;)
Please fix the arrow waiting -> running:

+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +------------=
--+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +----------=
+
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+->|=C2=A0=C2=A0 running=
=C2=A0=C2=A0=C2=A0 | --------> |=C2=A0 stopped |
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |  +--------------+ <-------- +=
----------+
+=C2=A0=C2=A0 switch_in=C2=A0 preempt=C2=A0 sleep

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 v=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---------+=C2=A0 +---------+
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | waiting |=C2=A0 | sleeping|
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +---------+=C2=A0 +---------+
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 wakeup=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +------------+
> +
> +=C2=A0 A fourth state, ``stopped``, has no clock invariant (hence no tim=
er).
> +=C2=A0 ``running`` reaches it on ``stop`` (``tlob_stop_task()``, window =
ended,
> +=C2=A0 per-task state parked rather than freed) and returns to ``running=
`` on
> +=C2=A0 ``start`` (``tlob_start_task()`` restarting the same task's parke=
d
> +=C2=A0 window).

So you define a pseudo-state "parked" that is essentially stopped but
after monitoring started (we allocated) and before the task exits (we
deallocate), is that right?
It looks kind of like an implementation detail rather than something
related to your model: there isn't any parked state in the model and you
don't need one.
If you really want the concept of parked to explain how you handle
allocation, perhaps you could make it clear in the code only.
For instance (if I got it right) when describing the
tlob_task_state->stopping you could say: tasks with this flag set are
"parked" until deallocation.

> +
> +=C2=A0 Key transitions:
> +=C2=A0=C2=A0=C2=A0 running=C2=A0 --(sleep)------> sleeping=C2=A0=C2=A0 (=
task blocks waiting for a resource)
> +=C2=A0=C2=A0=C2=A0 running=C2=A0 --(preempt)----> waiting=C2=A0=C2=A0=C2=
=A0 (task preempted, back in runqueue)
> +=C2=A0=C2=A0=C2=A0 sleeping --(wakeup)-----> waiting=C2=A0=C2=A0=C2=A0 (=
resource available, enters
> runqueue)
> +=C2=A0=C2=A0=C2=A0 waiting=C2=A0 --(switch_in)--> running=C2=A0=C2=A0=C2=
=A0 (scheduler picks task, back on CPU)
> +=C2=A0=C2=A0=C2=A0 running=C2=A0 --(stop)-------> stopped=C2=A0=C2=A0=C2=
=A0 (tlob_stop_task(): window ended,
> parked)
> +=C2=A0=C2=A0=C2=A0 stopped=C2=A0 --(start)------> running=C2=A0=C2=A0=C2=
=A0 (tlob_start_task(): window
> restarted)
> +
> +=C2=A0 ``tlob_start_task()`` calls ``da_handle_start_run_event(task->pid=
, ws,
> start_tlob)``.
> +=C2=A0 The ``start_tlob`` edge goes ``stopped`` -> ``running`` for both =
a fresh
> +=C2=A0 allocation (the initial state is ``stopped``) and a parked window=
's
> restart;
> +=C2=A0 there is no ``start`` self-loop on ``running`` (a running task's =
START is
> +=C2=A0 rejected with ``-EALREADY``).=C2=A0 The transition triggers
> ``ha_setup_invariants()``,
> +=C2=A0 which anchors ``clk_elapsed`` and arms the budget timer automatic=
ally.
> +=C2=A0 ``tlob_stop_task()`` cancels the HA timer synchronously
> +=C2=A0 via ``ha_cancel_timer_sync()``, then dispatches the ``stop_tlob``=
 event
> +=C2=A0 (running -> stopped) instead of resetting the monitor: the per-ta=
sk state
> +=C2=A0 is parked, not freed, so a later ``tlob_start_task()`` call for t=
he same
> +=C2=A0 task can restart it without reallocating.=C2=A0 Final teardown (t=
ask exit,
> +=C2=A0 uprobe unbind, or monitor disable) is what actually calls
> +=C2=A0 ``da_monitor_reset()`` and frees the state.

All allocation or broadly implementation details don't belong here. I
believe it's already clear from the model, but you may still stress that a
task can start another measuring window after the previous was stopped.

Being general about implementation in your documentation saves you some
headache while keeping that in sync (and I believe AIs make this problem
worse, by the way).

...
> +Kernel API
> +----------
> +
> +``tlob_start_task`` and ``tlob_stop_task`` are the implementation-level
> +functions called by the uprobe entry/exit handlers; the interface is
> +driven from userspace.
> +
> +.. kernel-doc:: kernel/trace/rv/monitors/tlob/tlob.c
> +=C2=A0=C2=A0 :functions: tlob_start_task tlob_stop_task

I remember mentioning this, there's no real kernel API, those functions
aren't exported nor meant to be called by anyone besides the model. I
would remove this section altogether.

...
> +++ b/kernel/trace/rv/monitors/tlob/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +config RV_MON_TLOB
> +	bool "tlob monitor"
> +	depends on RV && UPROBES && HIGH_RES_TIMERS
> +	select HA_MON_EVENTS_ID
> +	select RV_UPROBE
> +	help
> +	=C2=A0 Enable the tlob (task latency over budget) hybrid-automaton RV
> +	=C2=A0 monitor.=C2=A0 tlob tracks per-task elapsed wall-clock time acro=
ss a
> +	=C2=A0 user-delimited code section and emits error_env_tlob when the

emits a violation when...

> +	=C2=A0 elapsed time exceeds a configurable per-invocation budget.
> diff --git a/kernel/trace/rv/monitors/tlob/tlob.c
> b/kernel/trace/rv/monitors/tlob/tlob.c
> new file mode 100644
> index 000000000000..08b1bee884cc
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/tlob/tlob.c
...
> +struct tlob_task_state {
> +	struct task_struct	*task;		/* via get_task_struct */
> +	u64			threshold_ns;	/* budget in nanoseconds */
> +
> +	/*
> +	 * Per-window: 1 =3D this window ended (stop or timer expiry).=C2=A0 Bl=
ocks
> +	 * timer re-arm in ha_setup_invariants(); cleared on restart.
> +	 */
> +	atomic_t		stopping;
> +
> +	/*
> +	 * Per-task, one-shot: final teardown has claimed this slot; never
> +	 * reset (a window can end and restart, the task cannot).=C2=A0 atomic_=
t
> +	 * so cmpxchg is well-defined on every arch.
> +	 */
> +	atomic_t		destroying;
> +
> +	bool			budget_exceeded;
> +
> +	/*
> +	 * Opaque owner: the binding that started this task.=C2=A0 Set once on
> +	 * fresh allocation (NULL for callers with no binding), cleared by
> +	 * tlob_unbind_reap() for an active task whose binding is removed.
> +	 * Immutable elsewhere.=C2=A0 Protected by tlob_ws_lock.
> +	 */
> +	void			*binding;

Does this really need to be opaque? You're casting it anyway so I don't
see why it can't be a struct tlob_uprobe_binding * to begin with.

> +	/*
> +	 * Linked into binding->started_list for the whole lifetime (not just
> +	 * while parked) so unbind reaping finds parked and active tasks.
> +	 * Protected by tlob_ws_lock.
> +	 */
> +	struct list_head	started_node;
> +
> +	/* Serialises accs_ns[]; held briefly (hardirq-safe). */
> +	raw_spinlock_t		entry_lock;
> +	u64			accs_ns[TLOB_ACC_MAX]; /* per-state elapsed
> ns */
> +	ktime_t			last_ts;
> +
> +	struct rcu_head		rcu;
> +};
...
> +
> +/*
> + * Unlink ws from its binding's started_list before returning it to the =
pool.
> + * ws->binding is left stale: the next tlob_ws_alloc() memsets it, and t=
he
> + * restart path checks destroying first.=C2=A0 Idempotent (list_del_init=
 no-op).
> + */
> +static inline void tlob_detach_from_binding(struct tlob_task_state *ws)
> +{
> +	if (!ws->binding)
> +		return;

Should you access also the binding field under the lock?
And perhaps be set to NULL also here?

> +	guard(spinlock)(&tlob_ws_lock);
> +	list_del_init(&ws->started_node);
> +}
...
> +
> +/**
> + * tlob_start_task - begin monitoring @task with budget @threshold_ns ns=
.
> + * @task:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Task to monito=
r; may be current or another task.
> + * @threshold_ns: Budget in ns, in [1000, TLOB_MAX_THRESHOLD_NS].
> + * @binding:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Opaque owner, recorded on fre=
sh allocation and checked for
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 an exact match on restart; NULL for callers that neve=
r
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 restart a parked window.
> + *
> + * Allocates a fresh entry if @task has none, or restarts a parked entry=
 in
> + * place when @binding matches (see tlob.dot: "start" fires from both
> + * running and stopped).
> + *
> + * Returns 0, -ENODEV, -ERANGE, -EALREADY, -ESRCH, or -ENOSPC (fresh sta=
rt
> + * past pool capacity).
> + */
> +static int tlob_start_task(struct task_struct *task, u64 threshold_ns, v=
oid
> *binding)
> +{
> +	struct tlob_task_state *ws;
> +
> +	if (!da_monitor_enabled())
> +		return -ENODEV;
> +
> +	if (threshold_ns < TLOB_MIN_THRESHOLD_NS ||
> +	=C2=A0=C2=A0=C2=A0 threshold_ns > TLOB_MAX_THRESHOLD_NS)
> +		return -ERANGE;
> +
> +	/* Serialise duplicate-check + pool-slot claim; see tlob_ws_lock. */
> +	guard(spinlock)(&tlob_ws_lock);
> +
> +	/*
> +	 * da_get_target_by_id() uses hash_for_each_possible_rcu(), which
> +	 * requires an RCU read-side critical section.
> +	 */
> +	scoped_guard(rcu) {
> +		ws =3D da_get_target_by_id(task->pid);
> +		if (ws) {
> +			if (!atomic_read(&ws->stopping))
> +				return -EALREADY;
> +			if (atomic_read(&ws->destroying))
> +				return -ESRCH;
> +			/*
> +			 * Exact match only.=C2=A0 An orphaned parked ws (binding
> +			 * cleared while active, then parked) is not adopted:
> +			 * that would need re-linking into the new binding's
> +			 * started_list.=C2=A0 Accepted gap; the slot is reclaimed
> +			 * at task exit.
> +			 */
> +			if (ws->binding !=3D binding)
> +				return -EALREADY;
> +
> +			/* Restart in place: same slot, hash entry, task ref,
> list node. */
> +			ws->threshold_ns =3D threshold_ns;
> +			WRITE_ONCE(ws->budget_exceeded, false);
> +			memset(ws->accs_ns, 0, sizeof(ws->accs_ns));
> +			ws->last_ts =3D ktime_get();
> +
> +			/*
> +			 * Keep stopping set: __tlob_acc() gates out sched
> +			 * events until ha_setup_invariants() clears it after
> +			 * the state is running_tlob.=C2=A0 Clearing here would
> let
> +			 * events hit stopped_tlob (INVALID transitions).
> +			 */
> +
> +			/* Only failure here: monitor disabled since the
> check above. */
> +			if (!da_handle_start_run_event(task->pid, ws,
> start_tlob))
> +				return -ENODEV;
> +			return 0;
> +		}
> +	}
> +
> +	ws =3D tlob_ws_alloc();
> +	if (!ws)
> +		return -ENOSPC;
> +
> +	ws->task =3D task;
> +	get_task_struct(task);
> +	ws->threshold_ns =3D threshold_ns;
> +	ws->last_ts =3D ktime_get();
> +	raw_spin_lock_init(&ws->entry_lock);
> +	ws->binding =3D binding;
> +	if (binding)
> +		list_add_tail(&ws->started_node,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &((struct tlob_uprobe_binding *)bindin=
g)-
> >started_list);

Why do you add to the list and then remove if start failed? Is the
binding needed when the model does it's job?
Cannot you just do all that after only if the start passed?

Also, can binding really be NULL ?

> +
> +	/* Dispatch failed (pool exhausted or monitor disabled): unwind the
> slot. */
> +	if (!da_handle_start_run_event(task->pid, ws, start_tlob)) {
> +		if (binding)
> +			list_del_init(&ws->started_node);
> +		/* stopping=3D1 short-circuits the reset hook; destroy before
> freeing ws. */
> +		atomic_set(&ws->stopping, 1);
> +		da_destroy_storage(task->pid);
> +		put_task_struct(task);
> +		tlob_ws_direct_return(ws);
> +		return -ENOSPC;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * tlob_stop_task - end the current monitoring window for @task.
> + * @task: Task to stop.
> + * @binding: Opaque owner; must match ws->binding to end a normal (uprob=
e)
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 window.=
=C2=A0 NULL (task exit) skips the check.
> + *
> + * Ends the window (dispatches "stop") but does NOT free the entry: it s=
tays
> + * parked so a later tlob_start_task() can restart it.=C2=A0 Call
> + * tlob_destroy_task() once @task will never restart.
> + *
> + * cmpxchg on stopping (0->1) under RCU claims ownership; the winner can=
cels
> + * the timer synchronously.
> + *
> + * Returns 0, -EOVERFLOW (budget exceeded), -ESRCH (not monitored),
> + * -EAGAIN (window already ended), or -EALREADY (owned by another bindin=
g).
> + */
> +static int tlob_stop_task(struct task_struct *task, void *binding)
> +{
> +	struct ha_monitor *ha_mon;
> +	struct tlob_task_state *ws;
> +	bool budget_exceeded;
> +
> +	scoped_guard(rcu) {
> +		ha_mon =3D ha_get_monitor(task->pid, NULL);
> +		if (!ha_mon)
> +			return -ESRCH;
> +
> +		ws =3D ha_get_target(ha_mon);
> +		if (WARN_ON_ONCE(!ws))
> +			return -ESRCH;
> +
> +		/* Only the binding that opened the window may end it; NULL
> +		 * (task exit) skips the check.=C2=A0 Symmetric with the restart
> +		 * check in tlob_start_task(). */

The format of this comment is wrong (break the line after /* on
multi-line comments).

> +		if (binding && ws->binding !=3D binding)
> +			return -EALREADY;
> +
> +		/* cmpxchg (0->1) claims the window under RCU; _release pairs
> +		 * with the acquire in ha_setup_invariants(). */

Same here and probably somewhere else, please check around.

> +		if (atomic_cmpxchg_release(&ws->stopping, 0, 1) !=3D 0)
> +			return -EAGAIN;
> +
> +		/*
> +		 * ws may be destroyed concurrently (unbind -> call_rcu), so
> +		 * keep its access under RCU; dispatch re-looks-up under RCU.
> +		 */

This is the correct format.
Although I wonder: if we need a multi-line comment on each line, aren't
we perhaps overdoing it? cmpxchg (0->1) is documented at the function
level, it's probably enough to leave it there.

Also this specific comment has little to do with the lines that come
after. Prefer function level documentation where possible.
If a function is very large (and you're convinced that's fine),
you can document some non-trivial steps as brief as possible.

> +		ha_cancel_timer_sync(ha_mon);
> +		budget_exceeded =3D READ_ONCE(ws->budget_exceeded);
> +	}
> +
> +	/* running -> stopped: no reset or destroy, the entry stays parked.
> */
> +	da_handle_event(task->pid, NULL, stop_tlob);
> +
> +	return budget_exceeded ? -EOVERFLOW : 0;
> +}
> +
> +/*
> + * tlob_destroy_task - final teardown for @task's entry: frees the pool =
slot,

Double line break after the : and continue with the long description.
It's fine not writing a full-blown kernel-doc, but you can do better
here (exactly like you do in tlob_unbind_reap).

> + * drops the task_struct ref, removes the hash entry, whether active or
> parked.
> + * Idempotent via the destroying cmpxchg (same pattern as
> tlob_extra_cleanup()).
> + * Callers must end the window first (see handle_sched_process_exit()).
> + */
> +static void tlob_destroy_task(struct task_struct *task)
> +{
> +	struct ha_monitor *ha_mon;
> +	struct tlob_task_state *ws;
> +
> +	scoped_guard(rcu) {
> +		ha_mon =3D ha_get_monitor(task->pid, NULL);
> +		if (!ha_mon)
> +			return;
> +		ws =3D ha_get_target(ha_mon);
> +		if (WARN_ON_ONCE(!ws))
> +			return;
> +		if (atomic_cmpxchg_release(&ws->destroying, 0, 1) !=3D 0)
> +			return;
> +	}
> +
> +	tlob_detach_from_binding(ws);
> +
> +	/* Force the window ended: @task may never have reached STOP or a
> timer. */
> +	atomic_set(&ws->stopping, 1);
> +	ha_cancel_timer_sync(ha_mon);
> +
> +	scoped_guard(rcu) {
> +		da_monitor_reset(&ha_mon->da_mon);
> +	}
> +	da_destroy_storage(task->pid);
> +
> +	put_task_struct(ws->task);
> +	call_rcu(&ws->rcu, tlob_ws_return_cb);
> +}
> +
> +static int tlob_uprobe_entry_handler(struct uprobe_consumer *self,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct pt_regs *regs, __u64 *data)
> +{
> +	struct tlob_uprobe_binding *b =3D
> +		container_of(self, struct tlob_uprobe_binding,
> start_probe.uc);
> +
> +	tlob_start_task(current, b->threshold_ns, b);
> +	return 0;
> +}
> +
> +static int tlob_uprobe_stop_handler(struct uprobe_consumer *self,
> +				=C2=A0=C2=A0=C2=A0 struct pt_regs *regs, __u64 *data)
> +{
> +	struct tlob_uprobe_binding *b =3D
> +		container_of(self, struct tlob_uprobe_binding,
> stop_probe.uc);
> +
> +	tlob_stop_task(current, b);
> +	return 0;
> +}
> +
> +/*
> + * Register start + stop entry uprobes for a binding.
> + * Called with tlob_uprobe_mutex held.
> + */
> +static int tlob_add_uprobe(u64 threshold_ns, const char *binpath,
> +			=C2=A0=C2=A0 loff_t offset_start, loff_t offset_stop)
> +{
> +	struct tlob_uprobe_binding *tmp_b;
> +	char pathbuf[TLOB_MAX_PATH];
> +	struct inode *inode;
> +	struct path path __free(path_put) =3D {};
> +	char *canon;
> +	int ret;
> +
> +	if (binpath[0] !=3D '/')
> +		return -EINVAL;
> +
> +	struct tlob_uprobe_binding *b __free(kfree) =3D kzalloc_obj(*b,
> GFP_KERNEL);
> +	if (!b)
> +		return -ENOMEM;
> +
> +	b->threshold_ns =3D threshold_ns;
> +	b->offset_start =3D offset_start;
> +	b->offset_stop=C2=A0 =3D offset_stop;
> +	INIT_LIST_HEAD(&b->started_list);
> +
> +	ret =3D kern_path(binpath, LOOKUP_FOLLOW, &path);
> +	if (ret)
> +		return ret;
> +
> +	if (!d_is_reg(path.dentry))
> +		return -EINVAL;
> +
> +	inode =3D d_real_inode(path.dentry);
> +
> +	/* Reject duplicate start offset for the same binary inode. */
> +	list_for_each_entry(tmp_b, &tlob_uprobe_list, list) {
> +		if (tmp_b->offset_start =3D=3D offset_start &&
> +		=C2=A0=C2=A0=C2=A0 rv_uprobe_is_registered(&tmp_b->start_probe) &&
> +		=C2=A0=C2=A0=C2=A0 d_real_inode(tmp_b->start_probe.path.dentry) =3D=3D=
 inode)
> +			return -EEXIST;
> +	}
> +
> +	canon =3D d_path(&path, pathbuf, sizeof(pathbuf));
> +	if (IS_ERR(canon))
> +		return PTR_ERR(canon);
> +	strscpy(b->binpath, canon, sizeof(b->binpath));
> +
> +	b->start_probe.uc.handler =3D tlob_uprobe_entry_handler;
> +	ret =3D rv_uprobe_register(b->binpath, offset_start, &b->start_probe);
> +	if (ret)
> +		return ret;
> +
> +	b->stop_probe.uc.handler =3D tlob_uprobe_stop_handler;
> +	ret =3D rv_uprobe_register(b->binpath, offset_stop, &b->stop_probe);
> +	if (ret) {
> +		rv_uprobe_unregister(&b->start_probe);
> +		return ret;
> +	}
> +
> +	/* NOT "b =3D no_free_ptr(b)": the re-assignment would free the live
> node. */

This comment feels like an AI tried the wrong way to use no_free_ptr and
left it not to make the same mistake again, we don't need it.

> +	list_add_tail(&no_free_ptr(b)->list, &tlob_uprobe_list);
> +	return 0;
> +}
> +
> +/*
> + * tlob_unbind_reap - detach every task @b started, destroy the parked o=
nes.
> + *
> + * Caller must have unregistered @b's uprobes and called rv_uprobe_sync(=
):
> + * no start/stop can then be in flight for @b, so started_list is safe t=
o
> + * walk.=C2=A0 Active tasks are detached (binding cleared) and left runn=
ing,
> + * matching unbind behaviour today; parked tasks are destroyed, or their
> + * pool slot leaks until the task next exits.
> + */
> +static void tlob_unbind_reap(struct tlob_uprobe_binding *b)
> +{
> +	struct tlob_task_state *ws, *tmp;
> +	LIST_HEAD(to_destroy);
> +
> +	scoped_guard(spinlock, &tlob_ws_lock) {
> +		list_for_each_entry_safe(ws, tmp, &b->started_list,
> started_node) {
> +			list_del_init(&ws->started_node);
> +			ws->binding =3D NULL;
> +			if (atomic_read(&ws->stopping))
> +				list_add_tail(&ws->started_node,
> &to_destroy);
> +		}
> +	}
> +
> +	list_for_each_entry_safe(ws, tmp, &to_destroy, started_node) {
> +		list_del_init(&ws->started_node);
> +		tlob_destroy_task(ws->task);
> +	}
> +}
> +
> +static int tlob_remove_uprobe_by_key(loff_t offset_start, const char
> *binpath)
> +{
> +	struct tlob_uprobe_binding *b, *tmp;
> +	struct path remove_path;
> +	struct inode *inode;
> +	int ret;
> +
> +	ret =3D kern_path(binpath, LOOKUP_FOLLOW, &remove_path);
> +	if (ret)
> +		return ret;
> +
> +	inode =3D d_real_inode(remove_path.dentry);
> +
> +	ret =3D -ENOENT;
> +	list_for_each_entry_safe(b, tmp, &tlob_uprobe_list, list) {
> +		if (b->offset_start !=3D offset_start)
> +			continue;
> +		if (d_real_inode(b->start_probe.path.dentry) !=3D inode)
> +			continue;
> +		list_del(&b->list);
> +		/*
> +		 * rv_uprobe_sync() may sleep; list_del() already made the
> +		 * binding invisible to new readers.
> +		 */
> +		rv_uprobe_unregister_nosync(&b->start_probe);
> +		rv_uprobe_unregister_nosync(&b->stop_probe);
> +		rv_uprobe_sync();
> +		tlob_unbind_reap(b);
> +		path_put(&b->start_probe.path);
> +		path_put(&b->stop_probe.path);
> +		kfree(b);
> +		ret =3D 0;
> +		break;
> +	}
> +
> +	path_put(&remove_path);

Just for consistency I would use __free(path_put) also for this. But you
don't have to if you prefer this way.

> +	return ret;
> +}
...
> +/*
> + * Parse "p PATH:OFFSET_START OFFSET_STOP threshold=3DNS".
> + * PATH may contain ':'; the last ':' separates path from offset.
> + * Returns 0, -EINVAL, or -ERANGE.
> + */
> +VISIBLE_IF_KUNIT int tlob_parse_uprobe_line(char *buf, u64 *thr_out,
> +					=C2=A0=C2=A0=C2=A0 char **path_out,
> +					=C2=A0=C2=A0=C2=A0 loff_t *start_out, loff_t
> *stop_out)

These VISIBLE_IF_KUNIT stuff are left from the previous implementation
and removed from the KUnit patch, they shouldn't be here.

> +{
> +	unsigned long long thr =3D 0, stop_val =3D 0;
> +	long long start_val;
> +	char *p, *path_token, *token, *colon;
> +	bool got_stop =3D false, got_thr =3D false;
> +	int n;
> +
> +	/* Must start with "p " */
> +	if (buf[0] !=3D 'p' || buf[1] !=3D ' ')
> +		return -EINVAL;
> +
> +	p =3D buf + 2;
> +	while (*p =3D=3D ' ')
> +		p++;
> +
> +	/* First space-delimited token is PATH:OFFSET_START */
> +	path_token =3D strsep(&p, " \t");
> +	if (!path_token || !*path_token)
> +		return -EINVAL;
> +
> +	/* Split at last ':' to handle paths that contain ':'. */
> +	colon =3D strrchr(path_token, ':');
> +	if (!colon || colon - path_token < 2)
> +		return -EINVAL;
> +	*colon =3D '\0';
> +
> +	if (path_token[0] !=3D '/')
> +		return -EINVAL;
> +
> +	n =3D 0;
> +	if (sscanf(colon + 1, "%lli%n", &start_val, &n) !=3D 1 || n =3D=3D 0)
> +		return -EINVAL;
> +	if (start_val < 0)
> +		return -EINVAL;
> +
> +	/* Remaining tokens: OFFSET_STOP threshold=3DNS */
> +	while (p && (token =3D strsep(&p, " \t")) !=3D NULL) {
> +		if (!*token)
> +			continue;
> +		if (strncmp(token, "threshold=3D", 10) =3D=3D 0) {
> +			if (kstrtoull(token + 10, 0, &thr))
> +				return -EINVAL;
> +			if (thr < TLOB_MIN_THRESHOLD_NS || thr >
> TLOB_MAX_THRESHOLD_NS)
> +				return -ERANGE;
> +			got_thr =3D true;
> +		} else if (!got_stop) {
> +			long long sv;
> +
> +			n =3D 0;
> +			if (sscanf(token, "%lli%n", &sv, &n) !=3D 1 || n =3D=3D 0)
> +				return -EINVAL;
> +			if (sv < 0)
> +				return -EINVAL;
> +			stop_val =3D (unsigned long long)sv;
> +			got_stop =3D true;
> +		} else {
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (!got_stop || !got_thr)
> +		return -EINVAL;
> +	if (start_val =3D=3D (long long)stop_val)
> +		return -EINVAL;
> +
> +	*thr_out=C2=A0=C2=A0 =3D thr;
> +	*path_out=C2=A0 =3D path_token;
> +	*start_out =3D (loff_t)start_val;
> +	*stop_out=C2=A0 =3D (loff_t)stop_val;
> +	return 0;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(tlob_parse_uprobe_line);

Same with these.

> +
> +/*
> + * Parse "-PATH:OFFSET_START" (ftrace uprobe_events removal convention).
> + */
> +VISIBLE_IF_KUNIT int tlob_parse_remove_line(char *buf, char **path_out,
> +					=C2=A0=C2=A0=C2=A0 loff_t *start_out)

And here.

> +{
> +	char *binpath, *colon;
> +	long long off;
> +	int n =3D 0;
> +
> +	if (buf[0] !=3D '-')
> +		return -EINVAL;
> +	binpath =3D buf + 1;
> +	if (binpath[0] !=3D '/')
> +		return -EINVAL;
> +	colon =3D strrchr(binpath, ':');
> +	if (!colon || colon - binpath < 2)
> +		return -EINVAL;
> +	*colon =3D '\0';
> +	if (sscanf(colon + 1, "%lli%n", &off, &n) !=3D 1 || n =3D=3D 0)
> +		return -EINVAL;
> +	if (off < 0)
> +		return -EINVAL;
> +	*path_out=C2=A0 =3D binpath;
> +	*start_out =3D (loff_t)off;
> +	return 0;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(tlob_parse_remove_line);

And here.

> +
> +static int tlob_create_or_delete_uprobe(char *buf)
> +{
> +	loff_t offset_start, offset_stop;
> +	u64 threshold_ns;
> +	char *binpath;
> +	int ret;
> +
> +	if (buf[0] =3D=3D '-') {
> +		ret =3D tlob_parse_remove_line(buf, &binpath, &offset_start);
> +		if (ret)
> +			return ret;
> +		mutex_lock(&tlob_uprobe_mutex);
> +		ret =3D tlob_remove_uprobe_by_key(offset_start, binpath);
> +		mutex_unlock(&tlob_uprobe_mutex);

It's probably more readable if you take this locks inside the functions.

I'd just put a guard (not scoped) from the first point where it seems
needed and let it be (e.g. just before list_for_each_entry_safe).
You don't need to be overly precise at the cost of readability since
this isn't a hot path.

> +		return ret;
> +	}
> +	ret =3D tlob_parse_uprobe_line(buf, &threshold_ns, &binpath,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 &offset_start, &offset_stop);
> +	if (ret)
> +		return ret;
> +	mutex_lock(&tlob_uprobe_mutex);
> +	ret =3D tlob_add_uprobe(threshold_ns, binpath, offset_start,
> offset_stop);
> +	mutex_unlock(&tlob_uprobe_mutex);

Same here, you can guard-lock before list_for_each_entry.

> +	return ret;
> +}

Implementation looks good otherwise and seems to work as far as I could
test.

Thanks,
Gabriele

