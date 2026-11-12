Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495293;
	b=NWfvN6OXoJvXQGoRLseHxOhjTxlbbb4WVk0As/Fy/wXUKvwr4jK7eOXX4jQ3pIg7uouJ
	 D9i15r77KkJ4P1gNKeXhl9mXXrxvFcmU5qcbM8DJOO3k8f0hTo5m5KN3uaCofd3ilLsKm
	 1rpxrgaHTrg3dDPmKsgcKFlHaqxdSgjENVHxyQwQHtLMy55FGGVZFnAKSF+FSOTUIZqfo
	 liqN7a4URZiTQpQoGDwijLmNar4X0F+ZDmJHDsInMwHSIG0ZZswTfoJspfMwQkqGzjYj1
	 bXcbDAJ4AoXevwVeOkwEDOOrRoAevHQgYrCHFMR8GogJRlJoLEmp8MReQe9Z1Nu+2vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YJAKVSq5yqKYSt2NYDkWivS5DNZ0RRvFzcrDx4hLtrA=;
	b=HuZCWe0ASRkZ+A6fu4uxrjSLxS38ID5Qis0FvxzfCD4Ym32G7vhaWO91gdSWpgRzHb9k
	 mCqM12TiCe9yWoHoyN+1a9WmAJKmVZCG6wqhEHGi4dg0CA1vlNNbRMTqIPdcsL5cfvSZ+
	 7dCN9BzoqACWTamAV4GHceA/x7J3CbtyVL2t2fCGuoBoVC7lf0bAYuM9+boinjL2gn0SS
	 NCn1WP7qwGHqqYR+08TVuibwxnH8NalunaCqvIEaESaCD5xfEr+FWpe5N2jt3x8LAo6LD
	 KAQ+S6OmLQoXcfKeV9zSbDtXkTbMTpgkV16zVw/tUezjDKcHB5+T8vevSusBAO5RuNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBy7U8XD;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5129A606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5129A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBy7U8XD
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so37273165e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794495291; x=1795100091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJAKVSq5yqKYSt2NYDkWivS5DNZ0RRvFzcrDx4hLtrA=;
        b=pBy7U8XDNAWse1O6+/qfCw4GU6uCvmoQJcEU8Eub3ENzcDL0eTGFTS74o7FFODs09C
         zbIBeHzRirh+I6XYVUqC9yrksNitJoDLFqgSSiLWK+Sf0qm3W6NkASrPDHW37+V8Fj2H
         aPAhXHvj3RIcAB226+cT0eXq8JhUkU4OUeqN3v/lxVm+iemueF3ySxypZZpRHUWrcc9J
         wZuLPKLSY4SQ34DY6ZvHPHeYsUyQaBpN/MgsZg0+S+HwUNi3b4Nmm9h2BPdDRhs0x3ww
         C1skj5UNF8RchccJHGsgHimM/1cwLToxgTdMzuIyT2hAoO7ycEiJ+x2NpRF9JWp/uB40
         eufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495291; x=1795100091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJAKVSq5yqKYSt2NYDkWivS5DNZ0RRvFzcrDx4hLtrA=;
        b=Sf7F4SzU89tgkXyKWSOwCWlnqlSKHxEpv+mZb8+iP65SfiuupX67YpBwTi+9/0lvrf
         YjE14OcwLZv82Q9ulMXdiuAjhJlbnwpU9NRkB59K4Wfw94WV8rRkRaHTAJ6Vc32UDNPB
         zEA/qZ4uDYHzi8qrhYkZ0UyvW/KHbdw85/iStsN8EkgFsuZ4flhgVZ0pYxgNrp4o6TzZ
         Pki+nLxNEMZ5VIW0FqHkWITxi1EbCwL18CRsmlqn2espN2w1hMIzrNPACfDR3E/K2fOL
         MFUuqmw3mI93gruBN2iqUfaLw7i699odA+jkiiq5APT/PdRbgLllsdnPVsa5b13sgZMy
         XrQw==
X-Forwarded-Encrypted: i=1; AL+hErEplhCUffgIPGXpXDhYvTkPQW1znHGyZ8fVC3GY9otcR+nDLMqNw/97BYSN/PZ8kTtyOFCVLlueD3X3Bk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UVSv+T/wtJQd3RTVsiTdVR9QORavO6NeoBkCZooM6vFM5F9+5
	YC8hidK28ohY7DX8J93dKU5ZpwI6N3Lv42DXlpGcXDZZ7s5x2+zc+kPN
X-Gm-Gg: AYBFou1V8BNql1PSCuJibwtVh0vmQOroIK+gORGW4bDKQDUpmEi7Adt6AoV8PwHNKxs
	F7JYZuB70Q0l0SKYTEULgHbZYEyvuR4qqWsxF8zbDriNJhOMVTuk/nce+FpchPsJuVuii7HgsE4
	3lsQiIspdN5W3OlbrPoL8zYROjoHgIkDBZMERrSxNgBco2V8SGMm3osrv6juAUgNvFSUAb0Ntjw
	G+h2+oCVL1zuv7Vf781QQTsseWYCbV8YR5/xaNPKRwXXz3eavMDFN/dLK09Z1r3piYx1s8Ie4mr
	5tn4c5IxbDj5SAgJVSxJqsnM0qx+mBU1iu72N56A064VLYUrqVZcNf1VJp7Ta9f9nkgaE4cnLAs
	U+IHDgUJ2j6RzGrm8avDn4eS0rcWYMVvl1vZ6+RszKf05Oy/uQM0pUKvNMXNUxezwCbTsGV4reZ
	rOImDZ/whRQP304q8mowRA7NRssNXB1R4CMdNHrtXXJWtYtIk2zj0J1SoOdAvbIhN1XR/bH7+xq
	5+XfBRUtQMOQm0GrM67DEAL3a/HWv6v4l5kMUBzFb3TZk5dRuIiaSR9ae67pa9gB4wuCS900zSj
	O5nar+dxd5a+RtIhtzZp4Mqw8H+GSaPXgjM=
X-Received: by 2002:a05:600c:3152:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4ba09395149mr112085775e9.19.1794495291269;
        Thu, 12 Nov 2026 06:54:51 -0800 (PST)
Received: from build-server.. ([62.96.37.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm13956621f8f.32.2026.11.12.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:54:50 -0800 (PST)
From: Mikhail Malyshev <mike.malyshev@gmail.com>
To: "Moessbauer, Felix" <felix.moessbauer@siemens.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	io-uring@vger.kernel.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] io_uring/io-wq: apply the current cpuset to new workers
Date: Thu, 12 Nov 2026 14:54:49 +0000
Message-ID: <20261112145449.1570302-1-mike.malyshev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b95051ac2caf63d3266bd02b326d0e0166a138b6.camel@siemens.com>
References: <20261111162705.1150983-1-mike.malyshev@gmail.com> <b95051ac2caf63d3266bd02b326d0e0166a138b6.camel@siemens.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2026-11-12 at 07:52 +0000, Moessbauer, Felix wrote:
> that's a valid finding.

Thanks for looking at it.

>> Keep wq->cpu_mask for the affinity of the io-wq itself, all CPUs or the
>> mask set with IORING_REGISTER_IOWQ_AFF, and intersect it with the cpuset
>> of the worker when the worker starts, falling back to the cpuset if the
>> two do not intersect, as __set_cpus_allowed_ptr() does.
>
> Why not simply fail the worker creation if the intersection is empty?
> Just falling back means that the worker threads run on CPUs where they
> - intentionally - should not run.

This only matters for an application that registered a mask with
IORING_REGISTER_IOWQ_AFF and does not register a new one after its
cpuset changes. Nothing tells it about the change, so it may never do
that. When none of the registered CPUs are left in the cpuset, new
workers can either fail, or make a best effort: run on the cpuset, and
on the registered CPUs again once the cpuset includes any of them.
That is the open question; when some registered CPUs are left, new
workers get those either way.

The patch makes the best effort. It never takes a worker out of its
cpuset, it only ignores the registered mask while the mask does not
fit. That is what the scheduler does with a task's sched_setaffinity()
mask when a cpuset change leaves none of its CPUs, since da019032819a
("sched: Enforce user requested affinity"). I preferred it to failing
for two reasons:

- The workers that already exist get the new cpuset whatever we do
  here: cpuset_update_tasks_cpumask() calls set_cpus_allowed_ptr() on
  them with the whole cpuset, and the scheduler does not know the
  registered mask. In the test from my notes, a worker started with
  2-3 registered had 3-6 once the cpuset changed to 3-6, with or
  without the patch. Failing to start new workers would not keep the
  ring's work off those CPUs, the existing workers would go on running
  it there.

- Nothing reports the failure to the application. When no worker exists
  and none can be started, io_wq_enqueue() cancels the work, so the
  requests that go async would complete with -ECANCELED until the
  cpuset or the registered mask changes. A mask outside the cpuset is
  refused with -EINVAL when it is registered, where the caller can act
  on it; here the cause would be a cpuset write by someone else, and the
  error would land on unrelated I/O.

If you and Jens still prefer failing, I can do that in a v2.

> This test program should be added to the liburing testsuite, shouldn't
> it?

It is, posted separately: the cpuset change and the move to another
cgroup.

https://lore.kernel.org/io-uring/20261111162716.1151068-1-mike.malyshev@gmail.com/

I can add the IORING_REGISTER_IOWQ_AFF case to it once we agree on what
an empty intersection should do.

> Shouldn't that also apply to 6.12 (it technically does not apply but
> semantically it should)?

Yes, 6.12.y has 84eacf177faa and the same bug. The patch needs only
context changes there (no io_worker_retire(), io_init_new_worker()
without the acct argument, wq->lock), and I will send a 6.12.y backport
once this is applied.

Thanks,
Mikhail
