Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792474189;
	b=YgBcGbThpWeYKZe80Xd5tfiE0u+b4g+r5t6UxabqYrAo/ZxVa+TrU65uGtU8BCrkCSwy
	 aOeMUTgDiik9Fyn02THthTAJcs0xHbN6CbwiI28dIGk3o82sEb4c4eppTot9HrYX6cnvd
	 GlGsjTfB+BMP3X31nIfNRA9m9n7iCn8apc6FEO62SAnlWN1Y2BHdpjyY2A+ko0CD7HIK4
	 /QQOSBCE7DMIR/d+qoXUptMU+9OJHNO6kSZS0gj80oGXFmHrdqyJkXbJfj970Rdbd+5Hi
	 DMLYJgBapSTigNu4pvhni8u3lI1poVKVLygti3pleIx4CGyupRe1D65cjqaTFuCm85A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tHAjKdka0IAEGQfm3qc8oW1fRsGpvdXl9O5QyjZFVAg=;
	b=OES64nwnZkkyMFv8BRA3+BQJE5dmFwJ/LUHbvfIbueium2+W4Rq53PEiztg73oQYb5c3
	 JYG/VpEwSLRhXkfp+RVJOezJH15msJ9zrY+UBo7o7te2Mqa2UJAXxOnthIHIgIVxL4OS6
	 zTx4zvM6MBLTucQ6D1FyjQqbgMHewYNT73glXde5G8rYgg1W5uAncelNcUwPvMR3aeB4x
	 l4eeTKqFxz0R6UYnZm6bJRv5Ok55rDsL9Olg4rYA1/cWX+/mFAVROcGXntvOKqIRsMGNO
	 HHqP1PUbXq6hjgFKO7RkaOo6S27+5cdzUqTVJxDzQyy00hTsGwFOnU0LyL8hscABSBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n5+kTXHa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF37606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF37606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n5+kTXHa
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f079a63b8so260688185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792474187; cv=none;
        d=google.com; s=arc-20260327;
        b=m4LSY8jsBoOPnsbyCRpCtClpKayeT2npWDvADoJXp7GyXu9+5BqnHkqhNlCOh2Z2RU
         BEztXdDK1zLjX6RQohXDTDmTYkuMdolQk4xYaM1BySLiBp5P2MOoVLtWYy+G+sFRo/HM
         JkzvW9GYpd5ykIQKcXG5QsWXn1FeuaVaovstNfpYE3qVKjULacAyn+/v1VGIKO00wpKe
         QqR7hDMOSfDMWFkMN2B2+ubueY8ffPqOvSCzGOIEHGdskJ5U2TeuLtWJKkHV8+unGlBG
         MsVj3Fj9rmmLlWjLxKWLjwtPa5L6x3bRLhSCInOWs5r42UvkjLkEzDk8FqMn3VrmlcT8
         YHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tHAjKdka0IAEGQfm3qc8oW1fRsGpvdXl9O5QyjZFVAg=;
        fh=rPwvCcqYzJTaoWGp1e5vu3OShr+1d2sAmvbICsH+jXM=;
        b=kWMg6/mASj8r747VhYpANyUaU8T/P0G3srsH6nXeZwdtjn03fbAXadnQyfAn9h5kAB
         TfsjKDkNhnRMrBMV/q/5zVai9DPPce8QVYeiIfJ59dPPdyn3vfD50Ni3ceDbbkczZVNr
         sCohb1Yv0sYCkRmNLPHFqPw0qmFQCOI3qtgyjuE05f2TJtlHKik/7qDnF4A+flF/RuvG
         2pdRzVy24ZlhgknAVa2gYr0StV4HOxUrAZrNZK1vo9a14HK4epTB/GGtaQGh8lUiuyx5
         Y27y9/Ro0JHF5IWHKdXHqCSIia9E+f5rWvrDlE/hQCNTd1SJMTSb8aUs5Y0/7lTOJPzJ
         KgYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474187; x=1793078987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHAjKdka0IAEGQfm3qc8oW1fRsGpvdXl9O5QyjZFVAg=;
        b=n5+kTXHasuicYviffMU8HhNzFbnSLJolY/w0BEX+uxjFA8ePrLtwQdWpizr6WVFfi8
         LrAUqDxcEqbkqllSHdwLmdrsIeN/YqHqeQL/dT5rcO5lHroYB9rjLnqdKteK8FM4Nw4J
         jtWtLrcNEHHhk+PZhLmWUhYLScXdnxAFoTVhBriwUkd8XBLMGdRHmSwBOAZ6GY2XXQbb
         vMuRoidzoU/Gd0jpucqoqETdJBcoRxdgiq75jbheoXtWZCAEOfmSaIiHvYzWJ0NflAvW
         CNcY3w3Xafer+Cp4BkAZxjqAs+pA74VpWOCc6zbmG72CMDCgzpfc86I++Wk7JoIoEg5e
         hvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474187; x=1793078987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHAjKdka0IAEGQfm3qc8oW1fRsGpvdXl9O5QyjZFVAg=;
        b=Gk3B22jec6ipMXUakvXTTmyilsLdEba4oHV+VbMHXthwBmiLjGl3Fo2vkrwUuICsd3
         53c6A2fowtmHy4mCbVuyhFnoY/UTbE5LAnRwMKExckaunMTA/Qgegyot6k8aekQ2TriZ
         +48W/HAh+6Z0nD0EgWfMP5nJPzpRJVRksk/3gcj/T8w1SDTQ+qvnNA0xcUCRpnNqfT2/
         MKenY4Aafu1IT1xgztCauxGL1qHpU+BCyXfuSeK0Ut678dwhD5arkYYhXk35c8xokK7Q
         1xPPsMPBdZqA97VVWbgzw/vk/GON3TIJ9xMdwr7gTy9YJEiF2xtbUX4UJKVSkBQNfBJM
         tb6Q==
X-Forwarded-Encrypted: i=1; AKwUvByjknovDWzZj1hK6STTxhHNGj65l0bxfKsL1C8SDFUceigOBU37hk1Bdz7nXxNIZQuCoM1IRBv2zcSOOuA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaAvYYGWDldyK3oSFMKsrQ2Hr/tb0P77sIKenneBYAAKEjlHBS
	oMQ4Dooq6dj8qGM1DDqyJzlYRYSmmjUOe1kZcs35xunBjRMOUdB+b0M6uibYfE64CMsIM2FigEh
	uKQBybrlGj6VoE6LPA6ql8R7BGc/MC+4=
X-Gm-Gg: AYBFou1uJelvx0oZg9DH9IjLWv1FzavTeU5e9Wf48KSo/rdQ7lSfmt6hWD53DyccbcJ
	84LztBUbzTGqbKCYmkPFS1R8hCF/BQkoRw4RUxV0Jyx+kOAezLDtM4k38txT94ZqGq6Dbrx8Qgd
	BhauxZaKn01YrwhYMrlvARuc+gbXMfgrxItBRvk8w1s6/NgtYgVVO3slhYYovXkbM7Z3UA+6vEf
	CzZr1fqPhyAqwuwXF5oAm45hUAxPHwIHcIyr2zvG4JItsFzM+RRtoimFSlcrgYVW15VhOtGYwKl
	ZzFM+OiHTXhcU90Obj3LXhBjly4FxgVGg0iPoZj2N0AuA9B31cWs62ysEX4dVOeAB0B1YE4ukRh
	W9nBt0hgKaaPUdiTJlplL4W5794ejNsq4j105Ig1lEYXlCKLzPLwn+E91yo+xVZGK/hG1s34A95
	p0QVWK0/vJ4aA=
X-Received: by 2002:a05:620a:3950:b0:93f:2463:f78f with SMTP id
 af79cd13be357-93f29d81cb5mr1631822685a.62.1792474187518; Mon, 19 Oct 2026
 22:29:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019231243.802569-1-austin.linux@gmail.com> <6bc4e237-353b-462f-b388-3844821dd67f@kernel.dk>
In-Reply-To: <6bc4e237-353b-462f-b388-3844821dd67f@kernel.dk>
From: Austin Schuh <austin.linux@gmail.com>
Date: Mon, 19 Oct 2026 22:29:36 -0700
X-Gm-Features: AclHuK-3C03Y2foM4nH1_Fagl2dH4K7q2dr8npdWhOWTe2qyEiaSppZtHzBVMF8
Message-ID: <CABsbf=Gnw0+u80oebHZf24m94YSHDxFtYY2-Bq_=bMfvqUUvkg@mail.gmail.com>
Subject: Re: [PATCH] io_uring/futex: return a wait's data to the cache when it
 fails to arm
To: Jens Axboe <axboe@kernel.dk>
Cc: peterz@infradead.org, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:54=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
> Patches like this have been posted before, and my question is
> always "is this a common case?"? Reading this:
>
> > Notes:
> >     Based on for-7.4/io_uring (5b01d5955ac2).  Built for arm64 with
> >     PREEMPT_RT, W=3D1, no new warnings.  The numbers are from an equiva=
lent
> >     change on 6.18.39-rt on a Jetson Orin Nano, counting kmem:kmalloc/k=
free
> >     by call site with bpftrace while a test loops on IORING_OP_FUTEX_WA=
IT
> >     with a value the futex word doesn't hold.  Happy to turn that into
> >     a liburing test if it's useful.
>
> makes me very much think "nope, not at all", as it's a deliberately
> failing test case. And yes if you keep issuing failing waits,
> then it'll drain the cache. The cache is for the hot FAST path,
> which is not an error path.

Fair on the test case, it only showed the mechanism.  But for an event
loop, -EAGAIN from a futex wait isn't an error path.  Right before
io_uring_enter() re-arms the wait that just fired, the event loop loads
its futex word.  If the word has already changed, it handles the
new message and re-arms with the new value instead.  A message published
between that load and futex_wait_setup() checking the word makes the
wait return -EAGAIN, and that is how the loop learns there is more to
do.  The window can be shrunk, but not removed; nearly all of what is
left is inside io_uring_enter().

Here's how often that happens, measured on a Jetson Orin Nano running
for-7.4/io_uring with PREEMPT_RT.  The event loops are AOS (a robotics
framework).  Each one keeps one IORING_OP_FUTEX_WAIT armed per channel,
on the channel's queue index, and re-arms it after every wake.  One
channel: a SCHED_FIFO 40 publisher at 2 kHz with a SCHED_FIFO 40
subscriber, then low-priority processes publishing and subscribing on
the same channel as well, then interrupt and system load on top.
bpftrace on fexit:io_futex_wait counted, per process, the waits armed
(IORING_OP_FUTEX_WAIT issued) and how many of them returned -EAGAIN
instead of sleeping.  Two minutes each:

                             real-time subscriber    low-priority procs
                 messages/s  arms/s  -EAGAIN  rate   arms/s  -EAGAIN  rate
  pair only           2,000   2,000        0    0%        -        -     -
  + low-priority     12,200  11,020    1,292   12%   14,760    1,229    8%
  + load             12,200   9,830    2,797   28%    4,120      377    9%

(messages/s is everything published on the channel, arms/s and
-EAGAIN are per second.  A subscriber arms fewer times than messages
arrive because one wake can cover several messages.  Under load the
low-priority processes arm less often because the load takes their CPUs.)

In all, 2,520 and 3,170 arms a second failed in the last two runs.
bpftrace also read the futex word as each failed arm returned.  Of the
683,303 failures across both runs, 88% found the word exactly one
message past the value the wait was armed with.  So the arm raced a
single publish, not a backlog.  Load makes it more likely because the
stretch between that load and the kernel's check gets longer.

Timed from syscall entry to io_futex_wait() returning, 74% of the
real-time subscriber's failures came within 6 us.  For the low-priority
processes, which can be preempted in there, a third took more than
40 us.

Without the patch, each of those failures is a kfree() and then a
kmalloc() on the next arm: about 3,000 a second here, from a slab cache
shared system-wide, and more the busier the system gets.  On PREEMPT_RT
the slab slow path's list_lock is a sleeping lock, which is where this
started for us.  The patch doesn't change the armed path at all; it
only stops the cache from draining.

I can send a v2 with these numbers and this explanation in the commit
message, in place of the synthetic test.

What I'm after is a futex wait an event loop can reliably re-arm without
latency spikes.  Is there a better way to avoid the allocation here?  If
you'd rather not have every failure refill the cache, I can limit it to
-EAGAIN, the one failure an event loop hits in normal operation, and
keep the kfree() for the rest.

Thanks for the prompt reply!
  Austin
