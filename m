Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83944E2F1A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651122; cv=none; b=jzosUKk4kWDjpbB/Kc6vQR0rP3e1VjEBeOf16Te8DgO2LkvnewXLtu1di+oiZZkUUyw5uwkj1JHxr7Uc8q8NICYIXIxJn/Et2A0FRFgPjVwQI5sOvCw+VpUbPuHvekdlP4KunbFxk+nStXzLbZ/9BD/oy3bPsZ4Ny49Hn2QZA00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651122; c=relaxed/simple;
	bh=JIdSHvL9oprg5aNzX7e1SVuXsPcrZDPL7qdxY/kXG6U=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=iyRR6N4qTC6goumCKI1rQU5A6RIVZCEEuCy6Bs6Q3am87qXdeoduOtHejPKU4y5jGEq9mZVn15EJ1YtFMwf3V0586VH+Tx3XSvbCU8A42aNPe0CiCObBmstumopvDkXhtW9jx62nlkGEpFAVgXIpO/zLAyrE9zGPmt2GQ4Soppw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpyQsR85; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpyQsR85"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fdc579daso8227885ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789651119; x=1790255919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZeESk94qNmJ1gRJ9w7jilQfXoVBP62w9Mug3Fo9w8SA=;
        b=kpyQsR85X70xovRJWnMVFumoR2brJ9iPOl8O+nW146mysSYAnisL5GG5p+UAQx602W
         JhujbWyKi7LuOm91ncpzt16cJn9ilHj8HOnsvhQjln2Xfagc6YicIO0/T0wiF6gowp5E
         dwSjkZUUvh5OBHjPdJAGgZ03W0j4i4PEBq9UoCk95hHvwa7yRl8s7WPZHgZk/G/sE1sN
         e/V02sHVgtCUFTd6jPhB/zYikswH0Xqhe6Fbs9BCKuFh6cqS5JR20W7gBR5SrVqOZ2Qa
         IzPNYsn7Krf/7iyN6JznuKGq+nBk8eAyyt5btFgGdOTGTj9q4N7Z43eGoDWUp6hOH0eb
         vM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651119; x=1790255919;
        h=content-transfer-encoding:content-type:in-reply-to:from:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeESk94qNmJ1gRJ9w7jilQfXoVBP62w9Mug3Fo9w8SA=;
        b=XmpZi43E1aq2wySumAlVWS3WEvblDCopTTLRpoCVikl6fSMpgNMS6YCmShgjjSZAM+
         K1P3fkg9BebP9EigmAjkeo5yTHy/U5iY3ngBn/IOQxbdcFmf7CSaC3egBhOmHjb+taBc
         qtPSscPbCWWypnKp5TjYJJyXkpa3yR3PlnJpZUcAA9Sd+oEZV5FKcB37UIe1+Up9R2LM
         v40urDtlREg+hRE6tEBLQkKu+Da2Vh//aeI1u4D9QUVaY5bYYmd0xRVlhBcY02a/2Qj8
         EdBGxN+b1YqcyGKtOT+SFP0Oue/rxVqoEl3gilDwZ1VzpCYbfxneMiEai30W77fbCZZB
         tIQw==
X-Forwarded-Encrypted: i=1; AKwUvBxbjobrp1RxNz+6giTaIu270rt7mT6eSGweyBW2EMnpCsDVIx8AVTOLQh288+mhPf9OnUaqLTC92XUWZ+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++ksXl+BzI+xLbvMWxyv5+AZzvN06rz5ku6sZSTCDOnA8TnRlHZ3
	AST2DBbey7u1TxtETBTOHaQmZb7T6IWhCzFbtnZWpl/Ors4NKR3bMYXS
X-Gm-Gg: AYBFou2S/kLlx7WLSyRD1I6Z4BjFef5kX5+EO9ihsrXKnfkTIb9SHLCC9OuFtHp4a8e
	5V/vPhT5IqI1oVUffb+mkadlP7YIzCiuIuNKcHxZzK75eXGkeoap2Q1lQJekp/DJ3Dq9IJcxKkq
	xBMemqrCh4XboPoIXrgwY/AEAgBvwY5DkQzsgUdiXIBQjYBsUR0Lp/09AyjVAMR9Ijl0a29cDVC
	csi9mDSc4HU6K02qzpDI2VS0AEhJH2eL/NFJ7aZuWTWtDg4aQC0AsWVjVHD3D6c+qMAnxgbsx82
	+OKe741ZqQasANJnUmIIwKjbQCtcp/7Wl4K2ow90gskEOBPtsCFoWjjwq86JnTHrkrWuEFUUIow
	tb4WbreyhP5swRVwrRax/EaKN3BnVTxhjSvLuQZlUEqe++I16TqOOcajEZzzySC+YZWtJa9S5Ed
	wiJ4lPRFKYL2vUXtadEMHOgysL2c3nQClS1/yZIcxjZF1OMgE36vRnKxpS8N3ReIeSRHdX+U0=
X-Received: by 2002:a17:903:22cb:b0:2d7:1cee:3682 with SMTP id d9443c01a7336-2dd8dbf3be9mr141300615ad.5.1789651118937;
        Thu, 17 Sep 2026 06:18:38 -0700 (PDT)
Received: from [127.0.0.1] ([103.152.226.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fe00sm26670345ad.12.2026.09.17.06.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:18:38 -0700 (PDT)
Message-ID: <887eff66-35f3-4703-8ff7-c0c959621b69@gmail.com>
Date: Thu, 17 Sep 2026 21:18:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
To: suleiman@google.com
Cc: andrealmeid@igalia.com, bsegall@google.com, dave@stgolabs.net,
 dietmar.eggemann@arm.com, dvhart@infradead.org, jstultz@google.com,
 juri.lelli@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
 mgorman@suse.de, mingo@redhat.com, peterz@infradead.org, qyousef@google.com,
 rostedt@goodmis.org, soolaugust@gmail.com, ssouhlal@FreeBSD.org,
 tglx@kernel.org, vincent.guittot@linaro.org, vschneid@redhat.com
References: <20260917043339.2093426-8-suleiman@google.com>
Subject: Re: [RFC PATCH 07/12] futex: Make FUTEX_*_PING use Proxy Execution.
From: Jihan LIN <linjh22s@gmail.com>
In-Reply-To: <20260917043339.2093426-8-suleiman@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Suleiman,

Thanks for your RFC series.

> diff --git a/kernel/futex/ping.c b/kernel/futex/ping.c
> index ebcd3c4a7793..689f149f7150 100644
> --- a/kernel/futex/ping.c
> +++ b/kernel/futex/ping.c
> @@ -370,6 +370,9 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
>  
>  		queued = false;
>  		while (1) {
> +			set_task_blocked_on(current, &q.ping_state->ping_mutex,
> +					    BO_T_PING_FUTEX);
> +
>  			set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
>  			if (!queued) {
> 

A userspace deadlock seems to turn into a kernel lockup.
Consider threads A and B on CPU0, unlocked PING futexes F1 and F2, with
the following ordering:

  A: CAS(F1, gettid(A))
  B: CAS(F2, gettid(B))
  A: futex(&F2, FUTEX_LOCK_PING) <-- T1
  B: futex(&F1, FUTEX_LOCK_PING) <-- T2

Since futex_lock_ping_atomic() only checks self-lock, both tasks end
up blocked on each other after T2. And task_is_blocked() is true for both
tasks, try_to_block_task() would keep them on runqueue with
tsk->is_blocked set.  So if pick_next_task() picks A or B,
find_proxy_task() will stuck walking on A -> B -> A -> ... with rq->lock.

Could we handle cycles in find_proxy_task(), or add a chain walk for
deadlock detection for FUTEX_LOCK_PING like rtmutex?

Best regards,
Jihan
