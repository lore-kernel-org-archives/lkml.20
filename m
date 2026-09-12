Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F543C1D57
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197238; cv=none; b=Qn1y/q6ROyMV8t3dNLV0SvrN9c4UuqKJjjYnrX6o4bHJx7xV8L47WUMPSQ+WUVmGHZJlfRm6k07s1aSXJu4qVppSZ0b3g5mXwkF3RLYbQPG1LiFOTUWcdx0qS6p7ZpVsZ+cKvqjPaKW/TdECLSG2XEqb4mWC0U7NImqF9Q8Dx3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197238; c=relaxed/simple;
	bh=F3MOECaxR3CJhTRes5N5fgMTP57ppQy59xIDCNNHQyE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=FAkHYqe9rB1XCVkySWMav9s9j6n7FY+w1FGbICtCk9aflxI7if+v8ZHyNz8hTrszLEbGZ/Fs6MPrQgWTgkRfv9lK2lKxvsknI+81aWmPBUGHbbs6j7sIsJV4yRevXMpEvkMWwr1LZyn7BCy+AFVy7rofnuL1n7ZQ/9uQfiNN8Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JHXbc2k/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W3qNy96u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JHXbc2k/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="W3qNy96u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789197235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDLXH37HEbl6yRUp2dcCM+7uDlwa6YnDWzki8R5Rn8A=;
	b=JHXbc2k/taQu0BeQ9ErkV0Gz1wNbzAJpQkvODRKUC9k8DRZ4ajhVxd70yCPC7tPx1mP6kX
	Ez4RVIfGXrq7ByS5jCcFASv/A2/EfY0bLkGUQehS2XJN4mvYLNC266Vpd/sGRWzzAUu5xk
	ikTjT3+DiGONirUI0c9cPmULiDBVstY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-nlJyPV9AMxC0BYZXNFBz8g-1; Sat, 12 Sep 2026 03:13:52 -0400
X-MC-Unique: nlJyPV9AMxC0BYZXNFBz8g-1
X-Mimecast-MFC-AGG-ID: nlJyPV9AMxC0BYZXNFBz8g_1789197231
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cf4cc2125so6624775e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789197231; x=1789802031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDLXH37HEbl6yRUp2dcCM+7uDlwa6YnDWzki8R5Rn8A=;
        b=W3qNy96usdq9RDx9sINpZh1lM2xN1V04t+qi5TQRmUcNrTz+PaYMkogWQQ88SlJc4f
         968364DFRAlRoMgcWgPJMXycPotfavazTqAUV82TW2Bis+/xDLv/yYpaBUIbRVXyxlQD
         5Z55r6QtgXBVb98N/BTaq1Xw7jqRwrpmzkATZr5BkJSec2T7e7cQWFE/BuePzFjZATca
         tT2+A9SIQh3Bw6hNWRdSMeh/v3LMgXtsUfCc2Pm3OjuOm+1ACO+wEw/mNlgBx9/KpDFL
         FIMrJesB35GRd3c1KJ96o0DRWVTpItLrTGwJsv6qMNv3LkeF8sik+ToZaJuEpJamrwJM
         o/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197231; x=1789802031;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDLXH37HEbl6yRUp2dcCM+7uDlwa6YnDWzki8R5Rn8A=;
        b=hKVRr6rkZg8j/a1EE0if9hyCYtlzGVz7T6TWJe8Vh7XwJjTTUtIsO506Gm2SQB+zKZ
         KEYvSA8Mtu6RqatVqUGdQZ3pDhj/emU2wuc8/aUHWv3xbqoawCr/EJ7TnD0x86k4VgGi
         na8D8ZnkR1qKXOT5yoXKUnsNT2FY6b2gNkCSsvnfjxn+CpOIJxJxzMiuTR+WdG1mvuQE
         x3SM1ISpMh1S3gN3O+27/IzU+Exh5l/0gElxymDOib8X2ixQLOt6F/qBZZTihlgre19y
         3JIGQOmHlqM978RcXa2T3U8W0bEqEamKMXTELQg03goS/c+00kx5JIfucYvyI2afX63J
         ewhA==
X-Forwarded-Encrypted: i=1; AKwUvBzrUQaZkfLsvhITIAgsAXNMGCibEsPlTKGKhifMvf3nq7G0VmGC1y/N8iA46lYCnywPjyIlLHrrxjOMCdM=@vger.kernel.org
X-Gm-Message-State: AFuF++m0uF5MMOA4f/Lvicek4+5PCpME2PCnwFJua9Fr/uoHyuKMixf2
	nY5YioikJDcA41RqTigNhX4Fgx6PDdZKixgHL8tW+phwPVuOF+4DoB93BmQZ7m/Dp06wfBJPcWP
	Oqybav/hV5y/rq7CxKU53HHswUv1fjff9brXkYqvKBrGGXKcMLIhkYFIrDENCxmiQzw==
X-Gm-Gg: AYBFou0cQfaoRR2cn9ddCKCdQJ5RU0LzBoEPa33OXLR26mPLnZIDArmzxx9hvEPW4L7
	wSf7r1jXj39dLWdy68HEYGzJy/RfflI9KRX9+AJ7aEQvg7A1k47czGku2MaLzvD0SXbxNMD83po
	G3VbUtGy97OTqQ3k06qxSSOXls9JIuM/y0laOf69mvcDpOir2nIsSsaluVBax3oxNH0RgEESc0o
	+oZzlELfDvTq7X5PXCNNQBkGjc3MQtuW9m6UxMPmTQJlY1riKblult0lrsKt8S7oeutiloUmp35
	ValFg3P8gr2L/Cy+PqV6C+/8S1FaNIfY84tXn3mE9uhtkRyK9nnv/hcCBpq2s0vJzZYLwZJRPrC
	B+9G4/fQRSU2ekbr5PaAI/sq3gg==
X-Received: by 2002:a05:600c:4692:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49e619ad0e1mr160450835e9.11.1789197231471;
        Sat, 12 Sep 2026 00:13:51 -0700 (PDT)
X-Received: by 2002:a05:600c:4692:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49e619ad0e1mr160450365e9.11.1789197231095;
        Sat, 12 Sep 2026 00:13:51 -0700 (PDT)
Received: from ehlo.thunderbird.net (air210.wispotter.com. [212.2.212.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm169819125e9.3.2026.09.12.00.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 00:13:50 -0700 (PDT)
Date: Sat, 12 Sep 2026 07:13:48 +0000
From: Gabriele Monaco <gmonaco@redhat.com>
To: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
CC: Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched: Set need-resched flags before tracing
In-Reply-To: <20260911213300.1305763-1-arighi@nvidia.com>
References: <20260911213300.1305763-1-arighi@nvidia.com>
Message-ID: <71619AD0-A163-40DA-94B1-39052E808DDC@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Il 11 settembre 2026 21:33:00 UTC, Andrea Righi <arighi@nvidia=2Ecom> ha s=
critto:
>sched_set_need_resched_tp is emitted before the corresponding thread
>flag is set=2E This allows a BPF tracepoint program to recursively invoke
>the same tracepoint while leaving its RCU read-side critical section=2E
>
>If rcu_read_unlock_special() must defer a quiescent state while
>preemption or interrupts are disabled, it calls
>set_need_resched_current()=2E Since TIF_NEED_RESCHED is still clear, this
>emits the tracepoint again and repeats until the kernel stack overflows:
>
>  __trace_set_need_resched()
>    bpf_trace_run3()
>      rcu_read_unlock_migrate()
>        rcu_read_unlock_special()
>          set_need_resched_current()
>            set_tsk_need_resched()
>              __trace_set_need_resched()
>
>Set the thread flag before emitting the tracepoint in both
>set_tsk_need_resched() and __resched_curr()=2E For a remote reschedule,
>retain the result of set_nr_and_not_polling() so that tracing remains
>ahead of IPI delivery while still observing the updated flag=2E
>
>Fixes: adcc3bfa8806 ("sched: Adapt sched tracepoints for RV task model")
>Signed-off-by: Andrea Righi <arighi@nvidia=2Ecom>
>---

Hi Andrea,

Isn't this mostly what was done in [1]? I wonder if that patch was just fo=
rgotten=2E

There was a discussion that apparently didn't go anywhere, but it doesn't =
look like a blocker for the change to me=2E

Thanks,
Gabriele

[1] - https://lore=2Ekernel=2Eorg/lkml/20260627081657=2E499781-1-rhkrqnwk9=
8@gmail=2Ecom

> include/linux/sched=2Eh | 5 ++++-
> kernel/sched/core=2Ec   | 7 +++++--
> 2 files changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/include/linux/sched=2Eh b/include/linux/sched=2Eh
>index 59f6366fdf501=2E=2E6003dcd080e6c 100644
>--- a/include/linux/sched=2Eh
>+++ b/include/linux/sched=2Eh
>@@ -2105,8 +2105,11 @@ static inline int test_tsk_thread_flag(struct task=
_struct *tsk, int flag)
> static inline void set_tsk_need_resched(struct task_struct *tsk)
> {
> 	if (tracepoint_enabled(sched_set_need_resched_tp) &&
>-	    !test_tsk_thread_flag(tsk, TIF_NEED_RESCHED))
>+	    !test_tsk_thread_flag(tsk, TIF_NEED_RESCHED)) {
>+		set_tsk_thread_flag(tsk, TIF_NEED_RESCHED);
> 		__trace_set_need_resched(tsk, TIF_NEED_RESCHED);
>+		return;
>+	}
> 	set_tsk_thread_flag(tsk,TIF_NEED_RESCHED);
> }
>=20
>diff --git a/kernel/sched/core=2Ec b/kernel/sched/core=2Ec
>index 91f059a556950=2E=2Eaed403fd2f82e 100644
>--- a/kernel/sched/core=2Ec
>+++ b/kernel/sched/core=2Ec
>@@ -1196,6 +1196,7 @@ static void __resched_curr(struct rq *rq, int tif)
> {
> 	struct task_struct *curr =3D rq->curr;
> 	struct thread_info *cti =3D task_thread_info(curr);
>+	bool send_ipi;
> 	int cpu;
>=20
> 	lockdep_assert_rq_held(rq);
>@@ -1212,15 +1213,17 @@ static void __resched_curr(struct rq *rq, int tif=
)
>=20
> 	cpu =3D cpu_of(rq);
>=20
>-	trace_sched_set_need_resched_tp(curr, cpu, tif);
> 	if (cpu =3D=3D smp_processor_id()) {
> 		set_ti_thread_flag(cti, tif);
> 		if (tif =3D=3D TIF_NEED_RESCHED)
> 			set_preempt_need_resched();
>+		trace_sched_set_need_resched_tp(curr, cpu, tif);
> 		return;
> 	}
>=20
>-	if (set_nr_and_not_polling(cti, tif)) {
>+	send_ipi =3D set_nr_and_not_polling(cti, tif);
>+	trace_sched_set_need_resched_tp(curr, cpu, tif);
>+	if (send_ipi) {
> 		if (tif =3D=3D TIF_NEED_RESCHED)
> 			smp_send_reschedule(cpu);
> 	} else {

