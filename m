Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA8243E9F9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451312; cv=pass; b=sNEYUEThUuU9dzlHDIxY4Ut6nAm9PBvNyBeo08iL4hIcS05faDGV9XkP4drila3cFBzyzrQJDnR84ymURiI8W/Mq/gtFMIlGRSFbJMfts0PlsGl6k9sJAPcI4N9Ch3bRMBm2Tx7B6vf6IR81lIKauWXqyJ9XL9eyolk7RfEfIE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451312; c=relaxed/simple;
	bh=9sxs99q/vt32YFF/vpvn2FGC1BhsOFWa4Lxq22N29IY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TeQopfQ0TKBvQtXvtzKsZPJQRs6OLc935JD28HZhipBCJpAZq/flanjDLBfjZL8iNe6R7gsSuOFiFHAYUZRHvycab8Gj/EQh2e2fuxp/JzgwSFuiqHzuoez7UcYle1ZoWABgkQdlyB3RzggKKEQxPZKs3nyFCecZhd/eCDXbyWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TUiHngDF; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TUiHngDF"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48442ea8f59so259443f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789451309; cv=none;
        d=google.com; s=arc-20260327;
        b=OaE9S+pvH3Bcz46qH9pn32QQluEZAdIMHCoPyGMhFz1NB8P0/139D4nU5LnZ2W2RD2
         sRZTv/myG4CguZ4RKn7C+kJlyfcgIsb+gGBGiIx8wxZ4Ph2htp71zm/pL0auE9YITPJC
         KzqNT9kKS4abheoHy3GIkAqqoTw4ChuH51d9TNg0VdCVrjyi02Ke5dQ5b21aSVz67zcU
         vdpRJhNo5MBdboy22UXt/XMme6w8HS2em/CxLXy2CN4YWAYWqExXrboSNtp+OaWJnM8K
         Rn4cXuO67u74LrCOswpD078NY0UGuPCQbZ8N+az6Ys8RTxzT/0ouhtss3PgnNxtICOLD
         WxdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2VOnoftcB6kDYobufFfu9NfBk4Zcg4IG3hT/VsiMjWI=;
        fh=jPSqqZxAlf+6KJQWgQls1dja7eQaE1OG1VGtJYzmwPE=;
        b=Hm06//7Jw9uoQK57lI8aYXK8ObusCz58BdGCqoLsPn/P6HCdAFEpzW0CkYmCzQ+l9b
         8L+Eg6FkDvNkNB9Oob1axg0mSeqD31MFxBUjXzO9HeubAVYoWWlluHus5F3N6e/bZDpY
         PFQNw41FZoASGPND6TGRIKby+QU+NdqHCA4ysUdmAFs38O5cst321gyamUbpLyi8swG/
         CZAN9pWlkjpsAhhEcXElJTxk9XyxMnHzXVzII8cqzO8dyEn54VCArMIpSyRralAOwVda
         pJVyNvxxRffonKxXIcF2SSXkbMWNQR2JfGRhZcgbnn8WAqUHHiY77Hl3hGfbczrk3TxM
         eWsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789451309; x=1790056109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2VOnoftcB6kDYobufFfu9NfBk4Zcg4IG3hT/VsiMjWI=;
        b=TUiHngDF2tjbI4fNnOjieq9oayDCxgf8CD/3/MT2ifd+FXbqgxf6Me2IkUd1aeP9ou
         +FqaC1+PYPCXOyBwYkzVCPJEhlj66JF/Q7JibnfOc4dmgaVHqJRBH6acWRn+h8LG3GDU
         1xyWNQ5bwoa9HMjvS64437gYDCoSnJWN7bwTuVPy8EDXXyvB+D4Y5Vx79eQ5wnZTKY9s
         xMbgcBs8xt59xSrSv80o3waFgxPof4A7CG6lxaEQ5okQXonzpu5k8FMDLTBCWi7Sa2A1
         b/htEc2UcjKqvb/44rKnc8P7EQ/V6SKeyKz/Yw8+A1Bkr8h5MK1Zy4QeKDPODSLtH6cp
         dCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789451309; x=1790056109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2VOnoftcB6kDYobufFfu9NfBk4Zcg4IG3hT/VsiMjWI=;
        b=KA3yVW2f8xUrMQ+Y5IvQ2jJG0jAuGW2TI3vOB7QcR1BWD9soarjFJgJabsdVrcg8u7
         YpfZEGC98cJMJevJtrJemwqs/zz9rdwvCPZduWo684sDAjUq1FKY8UdTx+MCBwbT8UWb
         MH5eBfGfA2FNSe/U2ETlMofhGQf0d6obOo7hISrpTXHU77A6mopBcuc7hIWSIEuxPcq4
         NSJFlAVu7tT2CuZfQvWnta6fwFzaQbo0F3p2JwdcDVbGu+QFhaxGSitBdSk7cK3vc3nb
         hSu0t+7HdNRzZn0/nciY3QwiWuFzVuyZGfSF8HvtnDPUVdwN8GL+HayqmtrR/r7Hw1lf
         R/VA==
X-Forwarded-Encrypted: i=1; AKwUvBzW4JStYI/3zXPs01hiYt7SKtL3rgs22XcZg6GsqqbgLbVaGwh+TsHobYBxAgZVFqcpOUAyNLoscnH4umQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n6JO8M/dli386j3d8ZdVNya+ta2sIv6eyYK1bFsQwyTxJ8031z
	tRBP0lLpIak7AwVul74js1xXQpWBEa13PXJA72uWKrgerFy3Kj+Amw5r7umfSe8LUkkSjn9rPXO
	dU5AaH0oNjY6jmQXACKTnGPTKptf2CXJdZtIhWUE=
X-Gm-Gg: AYBFou3SanaRK7zFvwOPMmvibT2NHakuIM/stGgxBysPqmxKiQhuTW+P1W5r6EHc2Nt
	aPdqtZliRsGoHdS7f3+UcT8ZALgXt9kbx0zXZHrdZuHILlPcTU8WeX8vcojxYjELawIghCMP2Kc
	wBOyKog0pjpl+KxuqM9ifxqUfUiAiLHWEQZlxKXfYw60WxcvwlqYFDgFHeca8cr/jZuTdJxAp40
	YJvUQTaLEBEWtuQSaUeSuYY0aBXV/uoOHGps2oQiA7IQXFOOXbVUR7sRKdl5HiUNcsOb+UrnXyz
	MKwWsAHeP7O4DyXZwBlCa1ZLQpnVd5F8DJfD+3AinTLRcVtZig7z5mjStpWPJEmMghd/9xXJIyQ
	8/1IT96zEfUTxHJPir1sNbpkZAl+Io9V2OvIbb8MuA1MUcGq03TUM70Cb23vzYx5rT+OmBXVD+m
	TL+tVjlt0=
X-Received: by 2002:a05:6000:2305:b0:487:149:f7f7 with SMTP id
 ffacd0b85a97d-48705b9c7d4mr3427414f8f.23.1789451308673; Mon, 14 Sep 2026
 22:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826062901.2137-1-kprateek.nayak@amd.com> <20260826062901.2137-15-kprateek.nayak@amd.com>
In-Reply-To: <20260826062901.2137-15-kprateek.nayak@amd.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 14 Sep 2026 22:48:16 -0700
X-Gm-Features: AcwNN1XRGWPbn7MHTzOA_4XcDTgaoUW0hFkhnGS33P8PZWUwbex5n7ZtOwmWxrI
Message-ID: <CANDhNCreubmsXsbYb6745xvfYK+p-ocxJmUyt2-KTrJOqdtTnw@mail.gmail.com>
Subject: Re: [RFC PATCH 14/16] sched/core: Introduce chain-wakeup to activate
 blocked donors
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Andrea Righi <arighi@nvidia.com>, linux-kernel@vger.kernel.org, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 11:34=E2=80=AFPM K Prateek Nayak <kprateek.nayak@am=
d.com> wrote:
> +static void
> +proxy_activate_blocked_task(struct rq *rq, struct task_struct *p, int en=
_flags)
> +{
> +       int iowait_count =3D 0, load_contrib_count =3D 0;
> +       struct task_struct *donor, *owner, *tmp;
> +       int blocked_cpu, this_cpu =3D cpu_of(rq);
> +       LIST_HEAD(migration_head);
> +       LIST_HEAD(wakeup_head);
> +       struct rq *blocked_rq;
> +       bool needs_migration;
> +
> +       WRITE_ONCE(p->on_rq, TASK_ON_RQ_MIGRATING);
> +       ASSERT_EXCLUSIVE_WRITER(p->on_rq);
> +
> +       /*
> +        * Pairs against smp_mb() in proxy_enqueue_on_owner() which
> +        * orders ownwer->on_rq state against the blocked_head addition.
> +        */
> +       smp_mb();
> +
> +       /*
> +        * Fast-path: Tasks blocking on us will see p->on_rq updated and
> +        * will bail out natturally in proxy_enqueue_on_owner().
> +        *
> +        * proxy_enqueue_on_owner() holds the wait_lock to prevent owner
> +        * from running and disappearing before the transient task can
> +        * observe p->on_rq change and dequeue itself.
> +        */
> +       if (list_empty(&p->blocked_head)) {
> +               __activate_task(rq, p, en_flags);
> +               return;
> +       }
> +
> +       /*
> +        * Slow-path: Since we need to wakeup tasks (and task queued on
> +        * them, and task queued on them, and ... you get the gist) we
> +        * need to grab some locks.
> +        *
> +        * Lucky for us, we have simplified this via p->blocked_cpu
> +        * which is the task_cpu() for the entire chain. Wakeup is
> +        * broken into two parts.
> +        *
> +        * Part1: Under the rq_lock + blocked lock, mark all tasks on
> +        * the chain as TASK_ON_RQ_MIGRATING in breadth-first manner.
> +        *
> +        * Part2: Active all the tasks in bulk.
> +        */
> +
> +       /* Part 1: Prepare the blocked donor chain. */
> +       blocked_cpu =3D p->blocked_cpu;
> +       blocked_rq =3D cpu_rq(blocked_cpu);
> +
> +       /*
> +        * Blocked chain is linked to a different rq. Drop the rq_lock
> +        * and migrate the chain over before wkaing it up here.
> +        */
> +       needs_migration =3D blocked_rq !=3D rq;
> +       if (needs_migration) {
> +               raw_spin_rq_unlock(rq);
> +               raw_spin_rq_lock(blocked_rq);
> +       }

Hey Prateek!
  My apologies for taking so long to get over to looking at this.
So, I'm still getting my head around this, but in running this series,
I'm hitting a lot of lockdep warnings here since we call
proxy_activate_blocked_task() with the rq lock pinned. This is why the
activate_blocked_waiters() in my patch is done outside the rq_lock.

Probably need to pass the rf as an argument to the function, then use
rq_unlock(rq, rf); there (and rq_lock(rq, rf) later)? That seems to
resolve it for me.

thanks
-john
