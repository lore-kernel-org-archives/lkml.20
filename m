Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624701;
	b=oIUBOkM1f1NfMqmc/8abWcyGIlxTNhfcJg6fesFduTwIPxG2C/90S84kza3aQHMX9PH5
	 cMVa3T/dxzocObzg3ci19c+TD68e0P5HX8sKEXwCjVOT44UUc2zoYqQZWGf2Ygn3hB4zC
	 Eshm2cAWmh5KIFuR7B7jV+yj64ii98bQey1CIkH4L1EdchcDJJ8mc/DxuD3DYRmXmfQQn
	 PZfycEN73VUTZ6GpAwct+rBBRSnDft10EycDF51HtL/7RuxBaNZj39nqeb/x4K4B2VQuQ
	 68SFhQIqiEvGFOnHOBNwMt2gy0So8XSeRR6ONWz636RpRl187XeI6qWncMKwJjLQTag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624701;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DKbfkNf6shMAobIvrVNG47N567d/1LqtaVRbpnXw0B4=;
	b=y9yg8Qq9E9215Nac5pyueTOCd5puDk90O/st+F5RhZF6xwSLt6oGRaN1aGJXUkbKCnyW
	 CibE2hAtbIUJBHrhTtARL/MVvJYVfbBUpeIIdxWZOXepPhPY9k5pxz3dKHUfTyA9Xs19c
	 OtXYrVV+4GtIkcvxNe9fsPLEaUmqAgrHLvhCu7NSphQaAEpx9wOZSmYTXTZgG/03TNhg5
	 NzKQh2OiJrb2ogoTU6niJy/ftjqgXSeQmuLaoMH9JIyGNFs4pWDCmluQCuu4/EypRkJDV
	 6DMMxHU3TMTqFeutn8zvoU8Th+YCZHb5hhm2QOWVgJC6mNyo7B/IcnZn5IF35VIdTYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EGi5bwSd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bdn+paMf;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B137B606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B137B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EGi5bwSd;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bdn+paMf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793624699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DKbfkNf6shMAobIvrVNG47N567d/1LqtaVRbpnXw0B4=;
	b=EGi5bwSd+runPkVMHGLbqfz+zKZLKIgNO/WwkrZZVPocFCrneKvwwMDRrTSWFuTJgM2tEj
	8lmArcMRIat/gswFUcZxDMilC+unYcyhlthH8wMJGFsP6NQWK+msuFTwY07Ly52+bATMVl
	yT6kXephnI/j+2dpmoMOwdDrWCj/zGs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-tSv2YljNOziFhlYeZwbGJw-1; Mon, 02 Nov 2026 08:04:58 -0500
X-MC-Unique: tSv2YljNOziFhlYeZwbGJw-1
X-Mimecast-MFC-AGG-ID: tSv2YljNOziFhlYeZwbGJw_1793624697
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a2b0669946so21731165e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793624697; x=1794229497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DKbfkNf6shMAobIvrVNG47N567d/1LqtaVRbpnXw0B4=;
        b=bdn+paMfD1HoPoSWb3BurNJ+dmJbMOHOkksKLSzWZKznj8gg5czNzld442BEERZTnp
         4XNg6njpsbRe1I8ohWyUzZkB5CjjTsTqzWy+4jECAAfwqBH2V8TgPbw/54roU5K/xXRs
         sQi7VJtm491ROmLxY70pP65L6EfxIL3pj9qDXMSSvbke9hcGnbB/oLOGipOTcXfp85QW
         ZJaxentXbMr00BC9FF05ZIkElfmfY2I6MsgGUYJF1RtcR4zMOycSXXvrBpeDFzeYEC5b
         HRivF+aBvQ9HRstHB4q3eKw0c9V94l4iMGnwCBiIQlwF+Ir+baXYX4qzZLPKOgZ4jONU
         7FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624697; x=1794229497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKbfkNf6shMAobIvrVNG47N567d/1LqtaVRbpnXw0B4=;
        b=vdrD2eX2ASKpeOif0fJByAWn0c7ZOvaEKWqmrtSo9E+hwBc7p7SALis6vaCjyOq+jc
         IBxQIglqvNQbc3iNO+sdQmTarcGgxOhdQ7gXswW8xgTXpux/HD9LTT0gPxWRY9oH+bX0
         F1DQGjRtrkXZtP7oAfilhabC1qPLaNeL/L814jyK/EWM1KTFDJPgb5epVE+g3O3nhuIk
         /sYebw1Fo3p+dha93zvwoa34e71+TWG/yNtyJ+VdV6LvUlJevg4iTu8Cd0CmDXohMsEV
         eRNRvTKsRDWRyRGhyMN0I1hITTBCephOUewXwiHrJgPStgIZO1YcGirUljSpT4QyEgiN
         ioSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl/VYV1clsKg9f/a5vm4wP1q7fP/zSetJ2XtjyEZ6FNrqVunzcx3BYTR/Iyx18CuM2HQUqZaYelNsh6tg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN95V04wX3C4bXqUCSMTdnsK1gNvw1sj5MzXVVPOtZdKZAUZj3
	ivc4Tr7bU6KJMexo6mxu/2ANVQ8ZFEemTB93IrZcgPiCu2zgS5/lI/8+D3QyHjysrplsD7adIQ9
	HaaSktdh/m9A5xEFiugwdmWL1mbTs4s4C/q5E7yE5Oh0zCyTcrbbKCQ9YwK2Uvl2Dcw==
X-Gm-Gg: AYBFou098Laq9D1GT7GEzPvRz6T15bBo0/G8ZUwnFVWmQLCdUKBfwiE/r2ZhjbiSdxA
	ZLFcUc6/FXFHjV6iGh5e+3fYc8f/OFpI2C6Og/5pqwvinqckVoI4dlUGMyGoPI7xyCJmOqUsEbu
	7m6TGhuNOnbUriEFNFRMAlTJi2EHn4NCoc7AdnHxCFOORM2/9j4VCChbliTN7HzH22OYgGgn+cn
	DsK6lznlufwnG4LEXc0jXQJ35tk/4CyFwA/LDwW7i6PxWZBTLRshXJC8o6Pc3fouSAAAWO63Xiy
	X7g8VPO9L4vdoJyot5YtfUlZBRi4GmqijUnvoWoKwfEL6BMAON3LFp4aILk3/gg8tP7Kmi9dpoy
	5ysEjd208bUvpN/HpBb/xuT5huKpKzX5e7yEZ3Jn4/ysI6mpZ7l6ldSWpEAL9sDUXyyZLLXtUiT
	Fhdg==
X-Received: by 2002:a05:600c:848a:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4ac17b2ce84mr249990395e9.6.1793624696816;
        Mon, 02 Nov 2026 05:04:56 -0800 (PST)
X-Received: by 2002:a05:600c:848a:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4ac17b2ce84mr249989845e9.6.1793624696447;
        Mon, 02 Nov 2026 05:04:56 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm272885665e9.1.2026.11.02.05.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:04:55 -0800 (PST)
Date: Mon, 2 Nov 2026 14:04:51 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Weiheng Qiu <weihengqiuu@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: sched/deadline: total_bw leak when SCHED_DEADLINE is set on a
 dead task
Message-ID: <auiKc77SS8tGfSXM@jlelli-thinkpadt14gen4.remote.csb>
References: <3f6e6c87-645b-45fd-8fc6-8da5bc5b82d8@gmail.com>
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
In-Reply-To: <3f6e6c87-645b-45fd-8fc6-8da5bc5b82d8@gmail.com>

Hello,

On 31/10/26 17:02, Weiheng Qiu wrote:
> Hi,
> 
> sched_setattr(SCHED_DEADLINE) on a task that has exited but has not
> been reaped returns 0 and charges the root domain's dl_bw->total_bw.
> The task never runs again, so nothing releases it, not even reaping.
> 
> __sched_setscheduler() does not look at p->exit_state, so
> sched_dl_overflow() charges the task. A DL task's bandwidth is
> normally released at its last dequeue, which a task that has already
> done its final __schedule() never reaches again.
> 
> Repeating it fills total_bw to the admission cap: a later
> sched_setattr(SCHED_DEADLINE) and CPU offline then fail with -EBUSY
> with no DL task left; only a root-domain rebuild recomputes it. A
> thread-group leader that exits while its other threads run stays
> unreaped and keeps the TGID, so a pid is enough. Needs CAP_SYS_NICE,
> as any DL admission does.
> 
> Reproducer below; needs root and debugfs, assumes x86-64. On mainline
> c339f4010dea (0.25 CPU == 262144):
> 
>   task 63 state Z
>   total_bw at start: 0.100 CPU (104856)
>   SCHED_DEADLINE on the zombie: rc 0, policy 6, total_bw 0.350 CPU (367000)
>   zombie reaped: total_bw 0.350 CPU (367000), +0.250 CPU (262144)
>   6 more zombies admitted, then: Device or resource busy
>   total_bw 1.850 CPU (1939864)
>   DL tasks left: 0; new 0.250-CPU request: Device or resource busy
>   after a root-domain rebuild (recomputed): total_bw 0.100 CPU (104856)

Thanks for reporting and for the reproducer.

Something like what below should fix it. Can you please confirm?

I made it DEADLINE specific, as I'm not sure setscheduler after exit
might make sense for, say, sysrq reset to SCHED_NORMAL. Peter, others?

Best,
Juri
---
 kernel/sched/syscalls.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index b215b0ead9a60..64e604affa288 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -583,6 +583,16 @@ int __sched_setscheduler(struct task_struct *p,
 	if (retval)
 		goto unlock;
 
+	/*
+	 * Reject SCHED_DEADLINE on exited tasks. A zombie will never be
+	 * scheduled again, so sched_dl_overflow() would charge total_bw
+	 * that nothing will ever release.
+	 */
+	if (dl_policy(policy) && p->exit_state) {
+		retval = -ESRCH;
+		goto unlock;
+	}
+
 	/*
 	 * If not changing anything there's no need to proceed further,
 	 * but store a possible modification of reset_on_fork.

