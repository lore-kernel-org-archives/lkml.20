Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793331949;
	b=DN/S2hbJ4+IXi7xgSyuW4AuT777W4aoEjeccvsI9DX93NH39OqJcp6D/VyBVBCXaYAmB
	 vOg0UXH/ZDOuZ3KHsHU+x0aFALWMTkz8WnfM0Ga5aY8An7enaDNktmyAFpDEHdVPSNUyA
	 M8CDAZcZqjLrTYfzPoIil7S44ZAH62AV+1rSYp0RLQYvzp9zapIjzQB+toOBnGaU1xWRO
	 54BSwZ+SqXD0JtNy3HH3CjNH7M2eVYESrVyPCRBV6Gi6mESB13pgcnKNxWwkODqWrZEzc
	 3z+bjxXIGUxK3dipo1W/8HmgedPQdWhopDrHeGrSSrhKZ7cXqEk49T+Mb+UjqGZ3oHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793331949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qgQm7ashLUnSOdoquZ1ErioZR99PXf0f4V9MA38eZSA=;
	b=E6oX6dmDxFfpCypJ5t+BNWT4rpAu442LB0m6krF+WpAuKgeizSpz6m7XGuO6FhlQk4M2
	 oN+UUoSm7RvWVmPArMP5inuo8Ca1017uWvp0hfWcch18R7JKg6lCZ3ox8/IqSyQb23gmD
	 G8oEA6jDYWNDuRo//yrnNlfK7vJ4uqhJ6hk03lB7Wlp6aNXDep7vvjjduaRPFps9mnMtO
	 L+bIOZ8RRWUXabpwJ4Mqamb7vetYJLg3f/Sc2wTWw7Il2V3RqNlPgZEWRFwu3YRdymQ3U
	 SocLrI4Uo/i763m73kAnJBuUGGgsUuKuBYVwxR6WGLjzBUhH5hxnTwUCzO3Go7BSF1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VuzlyWyo;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6495C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6495C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VuzlyWyo
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc502d509c0so63778a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793331949; x=1793936749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qgQm7ashLUnSOdoquZ1ErioZR99PXf0f4V9MA38eZSA=;
        b=VuzlyWyocAndgzMv8w2hgWlLmtgAvOiB08ElchtFaAuKPnZL4GK6rfeUqmtRgOceEk
         2gHVhop/QldRJJ96sp48wm0/rJA2LAqhGgT8z2c+wehjCH5DBjRhxFms5ZjGDGcvASTE
         FELTMTcPyVgR/6TWhkkpx34XDGrYDkliM3eePdK/M5vAELqp5B3/rUHD/JqNVkmUBVaw
         y0hmNtuI4+roiIhczLEsK67GfInFP22t/cO0qHP5r9dQpU9NlB3TiGgnwbAfjkbSC8Um
         XbpTtap0uvQebRPyp5hGiXUiRbPhVib9DtOzJPRU3o6DajrS9LQULbHCfvK/I0gVHE4k
         +/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793331949; x=1793936749;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgQm7ashLUnSOdoquZ1ErioZR99PXf0f4V9MA38eZSA=;
        b=nQMTFMIgjP2Jp4lZrqxU/kHBSgUfeQ69EBw1DYXVigZnwk72zz0aFsuFhuHFnD5zbg
         KJ/BZ+kBqzTk6zwaFdb5FA1hsjYoWIbE4v9oqcTzbFZKKUJfGcWZO7PMuUuMN1Yczdeg
         oKnEuYOp9qPPWJDKyUjAV36ZRPh1oXOfJllJXe3MMYGRguvu5M/cMnnzOzHpM2WWeErN
         5NKTkpZdGJuTfvqIb2oKN/+jLUdbI0P+D5AAqO2u2Kt5L07HGUp9YKiP2AfMtxAvlR0l
         GaX0xojnPrL8nlahChxgtj+PLO5tOiwsQp/GsApv5KGg0s9Iv9bDQYmoPYgbRYfVmFGA
         0NjQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0IwXwVrcqHI6RiOyp2UDY21Af6gcIZrrchg+ZhbhVFuXuincRn/U0afAZ6IxPZmpb8UkE27WfwVt1V1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh2ork5xcySzF5MTcvPyNxGMljUHpMu6mSqOO5b8RCLJu4bSKX
	XP71x8GVz74RU5pfleu90025GYJl8xsx05NxYjYdUvAqkyuDiQcopnUe
X-Gm-Gg: AYBFou3TsqDJCFt79Edblhxm5fuITTGaY9w4JXwefVRkEJ4fXnHLS8TpxqDVc63Vb+d
	6FGWYU7uuFw4o793hn1WT5TWGFHVG4EmvOuk+MOlG7hE5lL4aEm8bQGPoXEG9XI/WjC/i6dPTD/
	V8ukDGtgOrWxdHa+BOuosKcS3UDY5gtLpXWQ3ZusthrEJWQ3iN3VY96/YW/bUtlbiST3HoQchgt
	DfzSUzlpVDbznDz2kvhS7UqiwBRKvjgODfxYOL1OT0plywuUfp3pw1wqI2xObyxg40yePjSWzFQ
	aGdagMaN3V1VktnYCrCN88sCW5THU2+4pNJyNsGJeXph8yOR7xkTNe8fEc33KVNFJl0mwQ0UICV
	r374wdxFJMPxVGQ9wH4QeVSN0W55jRo/QdcjnP6X/Wyq7xuSdmbTadm+D4EzHhguszCaYHOspRu
	dC4MC4cZadRUAV2FCSEmIitss5ENbcMSueoklTiKEO3RkI0AGPKlPHogkuYIjvwwNjs3plESUYU
	wzno+rivdyj6G3N8WuWuM5PNj3wt5wo2l7HLaWQXIyPZcbGpSIqvnZP7eQRHhXEWgQ6fdDFXYbm
	cIl2UXk9MIHKN7El8CsQmObM64jlq3FJfXCS1pMkwuw=
X-Received: by 2002:a17:90b:1d05:b0:3ac:80dc:f40b with SMTP id 98e67ed59e1d1-3ae897f55cfmr690403a91.33.1793331948698;
        Thu, 29 Oct 2026 20:45:48 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845e71a7sm2023216a91.15.2026.10.29.20.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:45:48 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/autogroup: Fix task_group UAF during thread creation
Date: Fri, 30 Oct 2026 12:45:34 +0900
Message-ID: <20261030034540.2074077-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026115707.GF2668200@noisy.programming.kicks-ass.net>
References: <20261023013631.881730-1-4ncienth@gmail.com> <20261026115707.GF2668200@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026 at 12:57:07PM +0100, Peter Zijlstra wrote:
> I'm not sure this works; afaict this will result in a NULL deref
> instead.

Thanks for taking a look.

The NULL previous cfs_rq should be handled by the existing set_task_rq()
contract. __sched_fork() initializes p->se.cfs_rq to NULL, and the normal
sched_cgroup_fork() path reaches set_task_rq() through __set_task_cpu().
set_task_rq_fair() returns when prev is NULL, before
cfs_rq_last_update_time(prev), and set_task_rq() then installs the new
cfs_rq, parent, and depth.

> Can't we make ksys_setsid() more complicated instead? Have it create the
> autogroup in advance, move under the tasklist_lock and destroy on
> failure or something?

I don't think moving the autogroup move under tasklist_lock alone closes
the window, because sched_cgroup_fork() runs before copy_process() takes
tasklist_lock:

  clone(CLONE_THREAD)              setsid()
  -------------------              --------
  sched_cgroup_fork() -> old tg
                                    create new autogroup
                                    lock(tasklist_lock)
                                    move listed threads; child is absent
                                    unlock(tasklist_lock)
                                    drop old autogroup reference
  lock(tasklist_lock)
  publish child with old tg

The ordering trace hit this pre-publication sequence seven times. The
final revalidation is intended to cover precisely this interval.

Am I missing another ordering which excludes this interleaving?
