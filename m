Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118157;
	b=EH8bxoXTz9lgzO/jEtPsgMbYuQWdC6o57hHEU5HjIAjE7WOlKpTdQvufRkRSuibCf7/Y
	 Tzvea56ZTbUY8btg2744Q80mB7icOoHbFrLxF7IRqcFviu/M+NAZZGyRsIWtJcmrNz2YV
	 oeuoMmiN74mmFJSJuiNFBpJtqFfuJa07IYDUTZyJccGdSBYRNO2tEKAdvnqwAd86fVUyt
	 M9rOp5Wh3lkHNlZG4ew0cZYSFaMjDMXkQCH4ozlH+8g9ggLvXZf2fEfhuMQ3J4ypDn7Ns
	 XHh95R/GEHL5kaw+i10ujP/OhdJBk3kauaNOuqcs2o55VxHvoF/4I/Vu4Ro6N33KeLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118157;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZFNrAqpRj5/hQtzzxfb58+4BY6vTIZ+FW4O/6YIk5uI=;
	b=TL6OJcsy7TmcNukcLNI0+2yvACmaRZFUUp35DWZLto3WTxHXdzpBAN/b83eFhbej2fI9
	 GHixvjp77Zobd9/noPXWLLppJfjZ0OOjXupby5J1BPpLVXGEZfny3dKTlHM4cCyJtN+tX
	 EZxRBg3Aerq7zH9G+uExPqsCDZJDDUFOJHG64O5fa7emNu8X3ETTR0/LFEv883QYxwf1T
	 GdskI7NwirUNvuTLX98khWEt6IdpW96LpxdvAZ7Z2IlmcN9CjOh8hu2qezYN+2RNyzrDs
	 sUe5pKs8Y/x8qGa2jUYD2TgwAcICyLTe2Xk0dDHppJDZzApYRgC1YfZvwo77rUb9Tlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ENlqbxNt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lyqFUuB6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C4F606A335
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C4F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ENlqbxNt;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lyqFUuB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793118156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFNrAqpRj5/hQtzzxfb58+4BY6vTIZ+FW4O/6YIk5uI=;
	b=ENlqbxNtXxFuqazrnNKH5RilrxSTa9QVHQ4q6dUXsomyzLYOIc/Btq5kWEbciPZQYc28c6
	iZEehN+pDNCWnBK9nqtSaBkzhrN39SWLA/v+vszjGkbO6gnGs2cDHTaXEJj9CouxgNGIhD
	d36ycUJZR8f1iKGhbtxc4zZVTB1or0g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-2h6WDb5KPXqYYoCyRP5Qeg-1; Tue, 27 Oct 2026 12:22:34 -0400
X-MC-Unique: 2h6WDb5KPXqYYoCyRP5Qeg-1
X-Mimecast-MFC-AGG-ID: 2h6WDb5KPXqYYoCyRP5Qeg_1793118153
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso61315e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793118153; x=1793722953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZFNrAqpRj5/hQtzzxfb58+4BY6vTIZ+FW4O/6YIk5uI=;
        b=lyqFUuB6UR51JP1gaMWzNPcaTr6Ln1s6YMolPbuFQWDWWHM+UnnwBM+TCPeaA/Q4HT
         88xfmRHzxVRoRtWgh5W0MeBTF4qjFRTqj7qdMy6MqIf+aqjD/QEX8gyC3Aa1ChrHfw5X
         okcaxPwzJ1Nk6gmHjGfspuoh525l3ZNgoCwziT1snnZtVmjs2qmK80AOZxCn3u0vVpI1
         yHbixgxYFRpzQ3oQUuTfvkAxnT3Xb4R0+U7TkrenNuNrYn9dKC95y9hZIbJjqwc00ZGw
         qzM1lPcFE31NVa0bDR/sb3hEsMYgfGlf5sSFsxykTRlQ1BfpHlckQoTX5pCmGjwLwTtV
         p0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118153; x=1793722953;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFNrAqpRj5/hQtzzxfb58+4BY6vTIZ+FW4O/6YIk5uI=;
        b=VQ9Lwkw3SPyzv8yzEXPB23YIgrpqPwegYIRAJtqQVY3DhMLjCJ03oC2iiwbZSFvyxd
         OyTnWyJvipQ2XqSxfMzp/3xOQVZuzBjF4cOZZ+Of5tqc31h6v7y3gqXqUYJTvrsbRuGk
         EsSeMy9SpDejRiTgjvhrdM5nU6FrOWcGe58UpYHjnIAGArDzKVZ8vDY6GOMhiAPRydvB
         Hx5PcKoySPr1Xepe2Rbr66KJI+L74pHY4zJc/9g0TG43DzjxzWJosZZeWuYuJGdsenT7
         NOfunOLv8xJ0pKY/VkmNpn4b8MBD9KTxS59hcenfNYa+4+2AC4e2UvqdlT2sjvmRNIUD
         C3Aw==
X-Forwarded-Encrypted: i=1; AKwUvBwn3RKKtcptMJ2Xf552V7am/Ef2plkRHe+1LPuq6QujE7w1L3VrYMr3PJ8Ley8hlYErpNDzGrgTSfi+MeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLgd//1LOLj8t2kVos6GZTZjK97QCHS5x7bTgvbFa/QQFyknVO
	IQqXjOzW0I9HHPCy95Z039yb578fctzfQ7IKjU/t2UM+NjxB7KmCFD2koI7gCUIf0wPy0f2si4r
	3Ww4v9zbzOL8DasR97VbBWJ3SNQbkMykx6E8HL93bRMBKZCwNe8RFA50BfLNVOW+Nmg==
X-Gm-Gg: AYBFou1j7PusiUguMKL5OezkU5Uc/cMkXsSfiQ/i+fk9kXLyYYe68H/6ExLLE75RpzM
	objkXk3eEqLiq2C5hG8v6D6x0fcX7eY/vNLqjvKJt1ERPgSRc2d7pwOsgzpgGlPe1/yH9ZliDUf
	WgcMtm2LRk2nOUryw1nUlzZ0uDgV55ngiOO4u9DrzwL9fG5YP686EAOZz3XRs1gJV4ImUJAX319
	Zw/1eX7C0Npu+tSBO+qbhi3A0XOugpD5LnENvDA6IZMDEQkerW65bh+/5KCUWlHg7dDbsThh5w9
	nmByxM1HqdQA8N4d91g7oruP1bskHgK/+bEcUClKH3lM+a6YecO4YXtqxS9xgCUzAa99U4ZNGXR
	V1FDetf2jMAAWJr0bD5IAUUrvCmR36Sc=
X-Received: by 2002:a05:600c:4e43:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4a64d6ba846mr134875925e9.31.1793118152912;
        Tue, 27 Oct 2026 09:22:32 -0700 (PDT)
X-Received: by 2002:a05:600c:4e43:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4a64d6ba846mr134875075e9.31.1793118152447;
        Tue, 27 Oct 2026 09:22:32 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.35.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92afd54b4sm1470065e9.3.2026.10.27.09.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:22:31 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:22:28 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Andrea Righi <arighi@nvidia.com>, John Stultz <jstultz@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Connor O'Brien <connoro@google.com>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Suleiman Souhlal <suleiman@google.com>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Zimuzo Ezeozue <zezeozue@google.com>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>,
	Hui Su <sh_def@163.com>,
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	kernel-team@android.com
Subject: Re: [PATCH v33 7/7] sched/proxy: Add deactivated (sleeping) owner
 handling to find_proxy_task()
Message-ID: <auDPxCTyGbStTWJD@jlelli-thinkpadt14gen4.remote.csb>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-8-jstultz@google.com>
 <atx1U_0FC-fazkV7@gpd4>
 <267d3f71-7f60-48d2-b8dc-bf87f403b94f@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <267d3f71-7f60-48d2-b8dc-bf87f403b94f@amd.com>

Hello!

On 26/10/26 09:56, K Prateek Nayak wrote:
> On 10/24/2026 2:37 PM, Andrea Righi wrote:
> >> +static void do_activate_blocked_waiter(struct rq *target_rq, struct task_struct *p, int en_flags)
> >> +{

...

> >> +		if (task_cpu(p) != target_cpu) {
> >> +			en_flags |= ENQUEUE_MIGRATED;
> >> +			psi_ttwu_dequeue(p);
> >> +			proxy_set_task_cpu(p, target_cpu);
> >> +		}
> > 
> > Can this break SCHED_DEADLINE bw accounting?
> > 
> > p is sleeping here (not TASK_WAKING, not TASK_ON_RQ_MIGRATING), so
> > __set_task_cpu() skips migrate_task_rq_dl(): the old rq never does
> > sub_rq_bw(), while ENQUEUE_MIGRATED makes the new rq do add_rq_bw(), so
> > this_bw is leaked on the old rq. And if p is still dl_non_contending,
> > task_contending() on the new rq just cancels the inactive timer, leaving
> > running_bw on the old rq forever and making it underflow on the new rq
> > the next time p blocks.
> > 
> > set_task_cpu() doesn't help, because migrate_task_rq_dl() bails out
> > unless TASK_WAKING, so I'm not sure how to fix this case...
> 
> I wonder why "p->dl.dl_non_contending" is not sufficient to know if
> there exists residual bandwidth on prev CPU. Seems to have been like
> that since commit 209a0cbda7a0 ("sched/deadline: Improve the tracking
> of active utilization").
> 
> Only time task is non-contending is if it goes away with DEQUEUE_SLEEP
> or switched_from_dl() with dl_runtime.
> 
> The latter doesn't need migrating the timer as the timer will either
> be cancelled if the task switches back to deadline, or will expire
> where it was queued - set_task_cpu() has no effect in this case.
> 
> Only other case that marks "dl_non_contending" is sleep + wakeup and
> for that "p->dl.non_contending" should be sufficient. I don't think
> we ever do a set_task_cpu() for a blocked task other than wakeup do
> we?
> 
> Juri, Peter, are we missing something subtle here?

I think Andrea's concern is valid, but I'm not sure I follow what you
propose Prateek (apologies!) or are you saying you don't see an issue
here?

If the issue is confirmed, I wonder if relaxing the first check in
migrate_task_rq_dl() to something like

    if (READ_ONCE(p->__state) != TASK_WAKING && !p->is_blocked)
        return;

might fix things, but then it's ugly to call it from do_activate_
blocked_waiter(). We could teach set_task_cpu() about blocked waiters
(otherwise it warns) and then call it instead of __set_task_cpu(), but
I'm not sure it's any prettier.

Thanks,
Juri

