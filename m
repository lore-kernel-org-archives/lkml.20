Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758816;
	b=bdMzQ/Z1oF7Wegso0pwPX1s7qRMHsnhXrMm2VCjVXggPmMLlL3jk1XlQsEHG0o6XX+/k
	 yOkMQhrWnitXR+R0w5kBSOrUMd6akVeyKT9msOrSi3n3J+iL42N/dFUbSmq6OspeYBX0R
	 80nHCMswAGxXk9Xui6ZvehER9uVHDAHrGKO/zM1siY3squ/jubswe1Eb07ELXB3DNR8+/
	 oKI+gMntlotORZN0cCYCY/EQZUGLSAPE4Ckk9I2PHRh3tmc+654N0nritraN793zTcmPU
	 /khcqXDDLIdfeRnHpIIQJgslSKTeYGY49LB9/TTK8Qge30FwOKQqm3hFyUsKArbc7kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=xCk3/rz0DOELcqiOfP0DbefR1Tzq2eC/yEUTX368PGI=;
	b=Rivq63LjeBfJfJzB1NIZUSdhA7oBY99Jomwxq7BQxjDZDwwjmjq3U35dhfaBUzn8fBZS
	 11+lj1BfmSQ85Sb16oxsJnCkpnnJ0EWdgZW/bOUZf2HS+xBlJtmraVV+1cvo6qaJyWTTL
	 zb0l4gDms+QGjYDa37zT3nt6MN87t7+ft0Ex1R95SbtUwzawE1P3G5yZFoaycbbSlHywo
	 2ccD0K0Nfxefahg1fMJcgV1zxnFtiMX0/BRzhZ+LDM5Zw0xzuoRlBSiG809p/tTwJyCKk
	 ktOQJhJnvEJY2rJ0/UOa7gloHWSMRRTU+wgMvVbMox4ChkrPzcw0MQicaO8qDRpwZxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=knxxNkEU;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0320606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0320606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=knxxNkEU
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso974615ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758815; x=1794363615; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xCk3/rz0DOELcqiOfP0DbefR1Tzq2eC/yEUTX368PGI=;
        b=knxxNkEUj3H/maGy1vZXbPObigq0Lw5pTZSJ5WLraaakJIetgxF5pQYW9ISHAV4Yu7
         w162WqmqRsmINLrlMKRhnZsEHYO5Ny+wPBhy4p0NmmPaptph09DN4lxLAeeEuwXrsUSY
         YA2Tos0G/jghorJ0jf8BLfBbx0GuRKnlfFmLMd3pbUxvI/HsgYLfGKvwHp8wbcVUU7ag
         oOuFW0i9TJDGNHJdy4zkSIpWViNpdB0yyBVd3t1+otpHke60espzZqQv6Zk+UbcqwikY
         qh4yMRQkM7HQg5CFfuxNswKhZrrESU1bxxElr508pMjB7kwYJ0H1M0xHLrOae2rweqnC
         hDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758815; x=1794363615;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCk3/rz0DOELcqiOfP0DbefR1Tzq2eC/yEUTX368PGI=;
        b=PQ65T8cQbSOvVMSqULDB/dHZJAaK0biU2+LbJcXCKrH2359XMAUzpsvu+6M7KTEKSD
         FXFFV+bhXmY7hCq+SxrW6G9tdSuKlxnpoEjK2k3imrCEYAUw+WkIyUdjWRHLiiIeErJ0
         VNcIm7HzzFsKt9/NklBerusNjJ//+l3E2HzNwtJiRslrDAiAX9krT7Na6kC5Xzh7ZXl9
         /ojIgMwlvgqqdq0JUwOhe13Mb3a+DuW/wC3GcGl2hxz+e8JiQ4sbt1G8+AQasdo08u0w
         GJizDEhfDgbnSnnkkovCP0Kx6fPZRFZIt3FMFlSSxJpNJq0Bt72Ka06Kje8595Ah3o8j
         XSvg==
X-Forwarded-Encrypted: i=1; AKwUvBxxSBOrE29KFUG9zHSG5ObKOM7qiTMogZ1TFI5BDbwSLvQM8WsS7g+onYTHeP2uVoR7sXSFOjYFUABbHfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KQUn7He4BNZx1fX79SE1mfU0TFYrUWgHlbZsfb/jAKXhHda2y
	XHoGM5ys4TdFfxuYZ+v+tCU02AJoXsUfifwPD1tVmjTKKyU/EMEa9V9w
X-Gm-Gg: AYBFou0Dk6Jv5d0u98LUMPfWfJZmzC8l+6W7MfQhChEpR9Rq8OuCU1ggIVYrj8UPmLM
	pLGpxWW5Lxhq9y+DqW8E6ZIbVtSc1xmthNwnmkhJroUeEnGgGLAQ59T2Psawam+wz+3yNHfd1Lc
	yQTmb1JRNnD7W4I2KJgj4mpzXEOnSGEPRo4Abql8R0ebEgJau2DJcMCvZIPtMk0mnz/ExyaybC/
	O5fcCaKkOZDxlYpOTiHhp5hvd3vVJLixr47xa2XAsmt3HVRAtaZbVDlvljQJxjX73AH5iXNd/at
	l4NmishwGz6vGalv0nTsg5btyecYhoVDHyOygwrIFmZECsAPtOTUCdVH79uI62c2Lvj0bai+KO7
	AQBpMve7dJdHLi0iSgb7+VyvrniaTxZGMgDIhPodLyZ1hP7tYrb/78VuE8eUj6h2hTqsk+YYw7L
	ySjviv8NmisW0LUNKujes0L1SjBY5X0FJDP0CVLAG11e7M1QlZy6VwTiWE59Swjh57s7GNbabEE
	IWbMrNi6UVwZ2lZfoagYyXDEV2wdFQQAjn5TGbUBfrKUm/z+6zm5JdOys7vZuKxBaGF9+k8NH6m
	3n7NJoi02O5hxGPGV1+RsmiIFDNS7MkrjPnR265lsmTnB97CbwzGq/zcwhkQ1gTuRd/Ugkc7yRX
	A4KSl2nPu6ZyKcEP0IeESSi4y/rWCj6RoSg==
X-Received: by 2002:a17:902:e5c1:b0:2e8:1929:c8e4 with SMTP id d9443c01a7336-2eb36527d99mr133638285ad.60.1793758815155;
        Tue, 03 Nov 2026 18:20:15 -0800 (PST)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe4dd2sm1063965ad.25.2026.11.03.18.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:20:14 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 02:20:13 +0000
Message-Id: <DMM2FJ2SNYYO.24TEJ05OOR08E@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Shuah Khan" <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let
 preemption cause false recursion drops in trampoline progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mike Bazov" <mikeba@sentinelone.com>
In-Reply-To: <CAPnbwjpv3bkGAKVjc7Eywgo-H4X6uDLYPJWFuSakGs_sBdgr3w@mail.gmail.com>
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com> <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com> <DML75890DWIX.EYB690LPBM1O@gmail.com> <CAPnbwjpv3bkGAKVjc7Eywgo-H4X6uDLYPJWFuSakGs_sBdgr3w@mail.gmail.com>
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

On Tue, Nov 03, 2026 at 01:28 PM Mike Bazov <mikeba@sentinelone.com> wrote:
> Thanks! fsession does keep entry and exit consistent. It doesn't recover
> the skipped runs though. I ran the selftest scenario with an fsession
> prog on __set_task_comm (7.0 kernel, lazy preemption, 20 rounds): Task
> B's entry and exit runs were both skipped in every round (entry_b=0,
> exit_b=0, recursion_misses=40), since each run still goes through
> prog->active while Task A is preempted mid-program.

Right.
fsession fixes the pairing. It doesn't fix the miss.

> What is the main obstacle to per-task tracking?

Today a fentry prog never runs twice at the same time on one cpu.
Existing progs rely on that for their per-cpu maps.

  task A, cpu 0                     task B, cpu 0
  buf = lookup(&percpu_scratch)
  fill buf
  <preempted>
                                    buf = lookup(&percpu_scratch)
                                    fill buf
                                    output(buf)
  output(buf)   <- data of B

A plain (*cnt)++ in a per-cpu map loses updates the same way.
Today B is skipped and recursion_misses counts it.
With the per-task check A sends a corrupted event and nothing counts it.

> And if per-task is not an option, do you have another approach
> in mind so that runs of unrelated tasks are not skipped?

Add bpf_preempt_disable().
Your test forces the preemption in the middle of the prog.
Explicit bpf_preempt_disable() will fix it.
And you'll have an easy way to see why disabling preemtion
for the whole program might hurt your own production.

What are run_cnt and recursion_misses of your progs on inet_sendmsg()
and inet_recvmsg() in production?
