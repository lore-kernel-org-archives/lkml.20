Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540957;
	b=ZO/LznGseY+Gs7oYaPQ140QJcXmN7q6wJCERvbB3BOZOlXXj0lWkkMqi31ax5sByXSNl
	 donMPvcuz28DnWR1iAvcTyl5RaMBFiEl3xQUON3Mh8PJS09+gCNCK3+AcvddZ2vh+FFZr
	 PueJrwLs2d3dMXso0MAUmI/ugSJu+rxkYDFhQrMLstjmJKtmkI0ORNzHJBDsoxoc9jYb8
	 Va7cWRmsQZ4ZP/MmDJ+fURTeco+C3oJT12/PHVHKlyqv8emKGnGIA/SlJ+Ynowk5qXpjA
	 8gs/M7oXrx4g3erK+ZHwM6hhtYphiB0BjtIt97lG01JGMLD25ralrAxjn7tOWET8Bug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=hZI2ljhmwoJ1V0BWfNbx3ZiTpuPjJL0odwQu02UU2Cg=;
	b=xtv1pKOzUoJsTnjnavOOyL1+1LGTt0GGFYJpX8acvIJU9Urh318vCQJ4yZX4o9BUoCYe
	 GAuHhZ02+v9sKyzpuxq/j6BUFY+JeThgECAlgJpaL+NecVAIrCFbkrejDB/dmv1n7gS7z
	 fzEt5MtlwObJKXAwENIEHl9YejP7PN/il95PbM0iUm38B08RZj6nl6Sy0PY7eljz2OROK
	 mG7WrPV0r+a18t7W29MB+19WQonqyd0Ke3zCchek/wiOhlO6fZrXMtcGTeQ4vqibfO/nk
	 MEiASqd7MUtROo/dBUdTOmHkycKzsDs+0prqaTXKSNk9eBvvWF2VL2kKcvNPmSyQCwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s6j2cGoj;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06602606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06602606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s6j2cGoj
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso126689a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540956; x=1793145756; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZI2ljhmwoJ1V0BWfNbx3ZiTpuPjJL0odwQu02UU2Cg=;
        b=s6j2cGojYGSaduWgRZnY74y1Mj7EaQAS2MUqAPbrCO81gc8UTnFk6EjOfGEN3H7r3Z
         4TwnXQqIrX4MlWzuOxgktI19j8uLAvX5Uxrww16C44hZHTkikR81UVcRGXtjjYUf71/l
         CMigxG0Rx0SlEjMYji7Ka/Iu3IKAzLsXV6YHrXZ0oGnl2mm+pMELJr8ENEIKM1TpEquJ
         1Ug4O3bKF5amZKyggPnan6da/B7WSHi+GpXzLLZL6dHTOSCf7llHmJXrcKlfHZsOpLrS
         IUA1yQqWtE5Vz+w5FvQhPq2oVS9DK1rI3IEZyOp8tIUbPc9bYvkW7uSvJ29zHKfE/NG9
         cidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540956; x=1793145756;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZI2ljhmwoJ1V0BWfNbx3ZiTpuPjJL0odwQu02UU2Cg=;
        b=pLH6Bc76VKl8CrSwG2YHCYI7nBM+9BkETLcIiT1yt88tD2+uoR9bJz88grICekWzF9
         IjaF6tDCUSfb0XFggGgoJLfWlQf7rAgtRiIGSOLOsl1i7/lo8TWw+WrkS70I3d8F66m1
         pB2Hg/JW2oNVQy4ewzgz55od7yCHm6/0cWajTmtWONW/xK0v7i6jMU1Aqwz+DHTF0HwS
         ELH5LgRwTkZoWqzoQtqiNHIETLFXmhRtaNnuX+dEa0UcE5g1ADEuATkxqAWT6f2n7Jj2
         9ooajxk/0ZoxZgfgOE5uFig/+ElqQn+TFSXlD0lmM4veFtEqoVr6IeGXeJtBoBuR5MKy
         QtJg==
X-Forwarded-Encrypted: i=1; AKwUvBxzHteYW2Xr8Db24v+s7B1Nt0bxyZcaNcUQTtlbW054QarfKs27fpGowjXNPcbsnWTk8enAoK2YUl8hchs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoH8/8lQEApmKSdno/34zCYe31hkE9cnRWW6LhC037YEFlfb42
	lnEiE4lmWvVmlx3ynLHgrUYYltZHn9I564ZV8JNPqueJ00jjhCrKu8m5
X-Gm-Gg: AYBFou3P8qRF+HFK+2tI3OBDal62/vl9AkKzJ4sDktoD0NA5hhbN4TVpMCNLaTOIJ2N
	HEAlWR940La6ZTbvkVI/Q7tz8E9tE1qWVVvQCuO7upcNA9xZNgAEePUfYi+UxhkDGn6X9fN/uSG
	uxe3jhmeeY1NJnaduH8eQoCD94RKcNSJeM4Qxo3r0fuLliKNNVNzst+pneLKe12RSWC1Upr/KmD
	fcQfjb6m78OVBMmybq8KBmaBpa5R8+S42EdokeaWJ/mvp+wRjYggKFUIwIVTrX1aaDVPu953txM
	ousOa29Z1/raykGRJLy443376uIO/zOpsMuw5hJSpwN7lsPTEpuhW4EnUdFUKrLLKtfQjILP3/h
	+gq4DN1TN/zUMu2uJpTtgJJsgcuPI0cNSxQaXQeuvi3iWLoE21gf7h4cZJbWRtCYQve1XrF9Ji3
	XZCIwslklRzmuXnxzbaIMwxe/QzgS1UQaZxv713t8pTzYyEPubDNwV9ALG9IbOY5v+yxrteVel5
	FEdxxJliNzgptPXfr7u4D+Ki9DEwkT2CMxC8r0cz4ey6WYFS+DDykO/90bLX6RdUB0ezspWvYHV
	fUA3
X-Received: by 2002:a17:90b:4b03:b0:3ab:be66:ddb6 with SMTP id 98e67ed59e1d1-3ad86e97e7cmr305334a91.20.1792540956165;
        Tue, 20 Oct 2026 17:02:36 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm1388667a91.15.2026.10.20.17.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:02:31 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:02:27 +0000
Message-Id: <DMA2QEUR2QCK.TYMC6ONTPOZB@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Drop the on_enter recursion
 check of task_local_storage
In-Reply-To: <20261009-selftests-bpf-task-ls-recursion-v1-1-c3a3e3c41f8c@gmail.com>
References: <20261009-selftests-bpf-task-ls-recursion-v1-1-c3a3e3c41f8c@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Oct 08, 2026 at 06:49 PM Qiliang Yuan <odys.yuan@gmail.com> wrote:
> other tasks. On a preemptible kernel, a task can be preempted while it
> runs on_enter, and a task entering a syscall on the same CPU then misses
> the program. With other tests running in parallel, on_enter ends up
> with recursion misses that have nothing to do with the test task, and
> the check expecting none fails.

Show the log of the failed run.
How many workers and how often does it fail?

> Drop the check. map_a holding 200, which only on_enter of the test task
> writes, already shows that on_enter ran for it.

The race works the other way too.
When another task is preempted inside on_enter and the test task calls
sys_gettid() on that cpu it's the test task that misses on_enter.
Nothing is created and "lookup map_a" fails with ENOENT.
enter_cnt == 2 in test_sys_enter_exit() has the same problem.

sys_enter is only a trigger here.
Make on_enter SEC("raw_tp") and run it with bpf_prog_test_run_opts()
like you did in enable_stats ?
Then no other task runs it and the check can stay.

> Fixes: 387b532138ee ("selftests/bpf: Tracing prog can still do lookup under busy lock")

Wrong tag. In 2022 the check was fine.
Progs attached to sys_enter were running with preemption disabled until
commit 439ebd5b5708 ("bpf: Add sleepable support for raw tracepoint programs").
Say that in the commit log.

pw-bot: cr
