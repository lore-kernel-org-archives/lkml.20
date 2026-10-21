Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792613376;
	b=2AAEVkpXJMtVLF9dQoExr08nYIZ6ajQgExMy6cPhmIseinDxVIecqhjPCkf+NFmp+OLL
	 xWboLLRVtxzhUVCOk9BLS7mRIocTRtgfljjxJL731H+mzkY8vOlX7igOYv0hZmqqUr+Xb
	 6hWk7Hi90wxao8fKFHNBSbh0KrxZYOpnOZ2XVAW+L9odzI43BYo8YCQQxquG7cRb3mLGR
	 ook0Wwq5xLQxZT7I6f/rpld+ExMHN91vMacLIoVrX4ZlkEkbY3+OQJG6t8aRkj+krDlnD
	 MtoL8YngFOd4rW3N8x55ri5NJBYshiYsQItwYMCKUO4ueaU8HC4FBnw0JRW6INabDJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O50guI93Ux45airAtD4JA+pFiEJi1Sk5OR1DxFRtE5o=;
	b=GQyIUdzAdm6dGRU9OJpky2yn5uk6IsaF0vw0VUpyNUAxs5LIuARkOCetP48DbR0QIN1O
	 JpMw7vBvoWYr6kI/bpQO6kgsbbuU/RN75zaE4mXttsRb0yt9s4oJhm5FYMmuFCf2JWNRb
	 HqDXeem/VecSECn4jxwsIP+vN+ypXfjWRXCmUjLA/fUWcRhvmLYRXS3keCmC+5vKvqUEA
	 hPGmKvATSviM1tKeioMRp723gn8Nm0dAXfWl/0XzeoXhdPsWWgyDpHHy7bA9mzHlB2PbQ
	 s5+z6lntdZ8FPjYfDOhua7pf67ryQR5iUmIsbxF8Qf/pClF8a5w/qAg66D7Xx7IKHCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KlRfFiLa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6BF606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D6BF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KlRfFiLa
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20edd106so795190f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792613375; cv=none;
        d=google.com; s=arc-20260327;
        b=mouB8TzdPMuJCBEpm6gNBES2mROmkk+nPcmpEecdE1KWjfDmhYzK3XuaXmFGfTHDk/
         3bdL91M+uEhvN0LCJZj9r2ugmaL+zUgz7d/FaUGByhRhaCjW4gbcoEX5PLG1FBNlT/Vo
         86JKzgUpxjbnCOfyV+eXqiWHBb6KmXotgYD4MdOPNkPmrjYNFDdxze82aBAJLcq0U+fV
         u4nF6IV7Cpy4A7ykXy/cKUVlHvkGHxZDmf1GyaFbhp4MkO52ntFlvKWIzgVAmTZC8HVK
         DSNIknPe1SPLOeHEE35z2FlDScyTJ+zyzkbbyDxol0oIHIl7xMYULMbrzDv2iHw53MgN
         GEiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O50guI93Ux45airAtD4JA+pFiEJi1Sk5OR1DxFRtE5o=;
        fh=v06NYWb6TkUSlrdo5A+vrHcQHiUubXAzpYXdOElHCNg=;
        b=eojX1T6MQGUjZvyp1Y47mXfUzPedX6kFNNVVg4O6DlhWaO2Dy9GQrJCGYThSRdjQ0l
         UofwKFDbS+CI1ZrcxH5I9nk3ZhFg2Uv1ToCYMgbpf3SP/sLpIiONslbrS3JoF3ON17IW
         +5YRJv3iQ0rpZxVOvq5W3Uf3t9IVOhcnpRA5QpHqOFVFwLNbC5WpPw7k8Q6h7U9kakIk
         aU/epa5ZJv+BLZzGKfFbsJZ6dXH0x7zsg03T8lACicR6lZr8gwRxcjMZLMGqNG4D2BQ4
         rxieSBtsx/3EM2w1ILoEPZ2RLJYhuRVDQ7mX3LuMgbcoMspFJ3IEYGBHyUareIOxKUre
         w4Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792613375; x=1793218175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O50guI93Ux45airAtD4JA+pFiEJi1Sk5OR1DxFRtE5o=;
        b=KlRfFiLa3b2BA/24+xsVVRbd37pDWiqeXFkte91HSpj42216TX9ShMlKnjG0g96LSW
         O8mZF0/s0o8AnmzwtITzktd6OrJO7CXSwXf1i2r0W5Gny2KblOB15kfe+Zi2egCfgYSq
         n23BazXI8+nLbp/vRRM7RtRnJc/Qx2OTUcleF9q7oIxBOy6zsEKglfMZi+ZpWaSareKF
         zdZ05gkhNx662Qb/DUAmX+Pmb/bH6WkBO2f6Oo4DYywqzeBu+IK2LLcw5J1y06GQbD+Z
         ijSc+pDMgRLzmTdXmiDbACcSh29w1CRAdA4Os0I2n35g18jm83SDa+ZuanQZf9GNG1dd
         cUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792613375; x=1793218175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O50guI93Ux45airAtD4JA+pFiEJi1Sk5OR1DxFRtE5o=;
        b=hTNHvOA0wBII0cj5g8SZN8tJPA57jQC2VOEEENfadCskMjtmvgLBNdnA9WCjm6wIc8
         f7xXI0zDld91DNgdbdgHrZUtGc4KWUU3Uagl3Hz9ww2YuTP8uggWNeLMKMzGr/1MeBlh
         b6E6sWaHX+kfloI+D27GbEt9S5413bNf3xLUYL7dWRtfCd7DLclJs53BSQsFbFJACN3n
         dcP8/TdPX5mSKmqxHpe5MAouLlfbwLYUJJllAGpgGdBQ6LLqD7WCAU91umC5L10cgW3T
         tn929sWghi0x4fJqb5tm6n6r5B3gNQdPLjJkFrR4SOlhVLl0Iq2wxhcenWxqY6+jE+C4
         6OZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+XzPrN/cUH2A4xcJEZ6ZQFSUndAH46/VHyA7M1DOerY1l+Rbl48tzeTFEpEHEkidzZYwaOtQLCN4tuMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHMypuqK56uBoW5EL/lxdshQrcsjkvc/q36KAG/0sIzbIRYD2x
	mEFCO21P+S9n5UDl71a47Ovk9qdbA1dFYutmiv71RLaxm9Uc+VkyUYu9ub4gvkLNLyOGMaTEvfw
	wj26EkX98Qce2CB0qb/zMG5b+VH7DKnlhVrGwt50=
X-Gm-Gg: AYBFou2jjptcYujT+a7Q29uF4/P26MygIJ76bkzMyy8rcmC7dOOY9NVFO2yXkWzYzd+
	hHkIOKZPda6Xr3tzH49MNj7FJkaO/WGhnwlvUgZpJSiW3JVC74g+qs5oDZlc/Ds7dzcCB+cYORp
	6LRqrvp4gLdE5jAF83axJtACifma6G5c4xSaQI7BgdhHmLcCwRCD2ciUrtPOppZy6LCfDNWR6Ak
	JU8bunYIHloKsTrDb3O/gKqMjnHFoGqh2GeMOox0/KDkZZ0i6UbU7ttHDoC8wRWwwIFzliL0Dpv
	26975I+W/bHr4tvAvtLyvchID61PxjYZzx9IMUX6qU4rjHZGGsVUQu0mJ8xV8EGiWK9N+OKXNa7
	K9m3W+3j0tdm/2OF5B/CQBhCHSIW5JBVOfegKiWuvL6l9CkXl2hQU5JEyRKvlP+lMcnYRUE4Pia
	YkjkHhtP61t1FqzlkJ331T3/GR0vWzjtqcvFoar56nifPdep0gAE6Qpi0PAbWXs18YnxCJfEBir
	5oIUZK7aQ0Cl5tN9yPkEA5UiKhZhWtcmWhURiUvGkNjg+0+zes8eQ==
X-Received: by 2002:a5d:55c6:0:b0:48d:cb76:548f with SMTP id
 ffacd0b85a97d-48e264cb80fmr5105070f8f.38.1792613374247; Wed, 21 Oct 2026
 13:09:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-remote-tick-proxy-v2-1-07890601a71e@gentwo.org>
In-Reply-To: <20261021-remote-tick-proxy-v2-1-07890601a71e@gentwo.org>
From: John Stultz <jstultz@google.com>
Date: Wed, 21 Oct 2026 13:09:21 -0700
X-Gm-Features: AclHuK86LAvoxNeyDpbI0M36BqydSzyt0jcF7Bg0qfNtG5N7g-00JeFmid7kg5c
Message-ID: <CANDhNCptx=Sqyb82XG6c5fQ-nW4V7LA6GxTMQqzfwoE-+q_9Dg@mail.gmail.com>
Subject: Re: [PATCH v2] sched/core: Use the scheduling context for remote ticks
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	"Connor O'Brien" <connoro@google.com>, Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
	"Christoph Lameter (Ampere)" <cl@gentwo.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:15=E2=80=AFAM Shubhang Kaushik (Ampere)
<sh@gentwo.org> wrote:
>
> sched_tick_remote() invokes task_tick() for rq->curr. With proxy
> execution, rq->curr is the mutex-owner execution context while
> rq->donor is the blocked task that supplies the scheduling context.
>
> A mutex-blocked task remains queued for proxy execution. If that task
> is SCHED_FIFO, or the only SCHED_RR task, sched_can_stop_tick() permits
> the full-nohz tick to stop. find_proxy_task() can then select its mutex
> owner as rq->curr while retaining the blocked task as rq->donor.
>
> sched_tick() and hrtick() already invoke task_tick() for rq->donor.
> Like task_tick(), the remote tick's full-nohz interval sanity check
> currently uses rq->curr. The proxy owner in rq->curr can have a stale
> se.exec_start before the accounting path updates it.
>
> Make sched_tick_remote() use rq->donor for both the class tick and the
> full-nohz tick-interval sanity check.

Hey! Thanks for chasing this down!

Apologies, as full nohz is a bit of a blind spot for me, but it seems
the commit message gets a little lost focusing on the proxy details,
which makes it a bit harder to understand how the underlying
assumption was broken.

Maybe can I suggest reworking it to something like:
---
In sched_tick_remote(), when adding proxy-exec support, an assumption
was made, which was: we're in full dynticks mode, so there can be only
one task on the rq.  With only one task, we can assume rq->donor =3D=3D
rq->curr.  So there wasn't a need to switch rq->curr reference to
rq->donor when proxy logic was added.

However, the full nohz rules are more complex. If a SCHED_FIFO task is
running, even if there are multiple tasks on the rq,
sched_can_stop_tick() allows the tick to stop since there is no forced
preemption of SCHED_FIFO. Similarly if there is only one SCHED_RR task
the tick can be stopped even if there are other lower-sched-class
tasks on the RQ.

This means in sched_tick_remote(), there may be more tasks on the
runqueue, which means we could be proxying (if a SCHED_FIFO task is
blocked on a SCHED_NORMAL task) and and rq->donor may not equal
rq->curr.  This earlier assumption doesn't hold, and the references do
need to be switched to use rq->donor so the accounting is handled
properly, and to make it more consistent with rq->donor useage
elsewhere in the scheduler.
---

Also looking I see the comment at the top of the sched_tick_remote()
function "The [full dynticks mode] check is racy by nature" which
makes me wonder if that might also be involved here, and worth
mentioning?

The code change itself looks good to me though, so after tweaking the
commit message, feel free to add:
Acked-by: John Stultz <jstultz@google.com>
