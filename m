Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793837566;
	b=zRK0ab9Lj8k3LWnofY6qdya/F5/Aj+uKE+dHy9P8iGaN/EbAwPMF/eKxCymuaVPAV2Mc
	 093P2V2kaMxmhQqUVxvWQJG7LIlRN9AREzKx34r7pD+DbXAZmi+PBQPzb5a5wy2a1fdLq
	 IR0F4PfIW0+7cXE4MtaVrmmwyWMeVURE9rj9NjkcEYZNQY/qkfY2TzU3wZg60MX5shv56
	 OdPpq+37d9VUX6ugLAssaksrhy5VdkQN6ntcG5SuZBUDv6OxsK0x7FN4er1wUOe1SlXYZ
	 onmP4UdEIUMg69dMBFL0jxb1aY5zeHRuvKdyx+QnP7eBe1RBYNRXNZlhwynLYhwOsag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rwJhK3x7XVjm47244mpJl9P7sCIrVF4iHXLk2RT9ybs=;
	b=iasymEKFbDfe0/Ynq5ruu6lGOzRZt/fp7aPT+ni4Ot1g6OLcE+vbDRddb4Ja/WR348oe
	 dNC9EFQiz/lP3DEq2Zmn1Ep2HdkB6KXy9V8A4QUHpc1NZqT6vxMjM0f/h64ZsuSlwMcWR
	 g3eL2Thdl3bThoaWGAoYcjSxDb613Ui4ojGOtkXXnHLKY7lxFTPFltKuPT724+8Do+xDP
	 7deX7BpmmJU1ZoknDzUDJDbwLaRhxsDkn7xly19eWhwEPql6O2ezfbC01ihI1uvgDkfwM
	 5zWuKaX1ihCQuGF7HGmKpL1PS8YyZq1Qd+VYWQJnQf7/RaPtXQMFIaQHXKvHe3dAQKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=AIPk4pu6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40729606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40729606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=AIPk4pu6
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab7b8e6fc2so121048a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:12:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793837565; cv=none;
        d=google.com; s=arc-20260327;
        b=VarPGrStDInUeAe5YF4kc0f+iP3EKdLUYoD69mZYs5N0d8apzgLqMKf4RkI0o83RFR
         Ig2kgDlUyF36xgrzi4eVoVj7O39i+CZEg/wBGGPh0JI/4YOAh1lvQLuIhpRyBI+m/vPh
         gpkRpFKlkq2ZR9ImJA9+6JJ9PN3O1V6AYVkja3k2R+7P7cwY5/vAdkV4BJ9X4DlkmZMh
         aXuigrWBTZPF1azcExv2Gc0z1coH5RCC4krh06Vjk5qomVThFLp/Cij1bIK87Ss/q1l3
         +Dzio0SxRDJjXQUgDzXUsu7w/2z3IIfPe0bTx4cjDoMX0B0WEaia7lkW0VcHrWieygER
         iGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rwJhK3x7XVjm47244mpJl9P7sCIrVF4iHXLk2RT9ybs=;
        fh=YaBHCrdq0Cght3rf2VbqITUURakqGX8Wxyg9Ml1aMwQ=;
        b=L6bkZF6thGqy1Tae5i+gApsLUrRoJNRgyoBniLws+nnsKcYiXsMjDvmdAX81hhcHcg
         OU6YtqLJY+FdcZ3lACCAbXt/QcNjtiKTR2mcDW+aS44A8eeispScuqIrtoFDsf958ydk
         f+SYCp+KOjMTTSRIDD+798umFABeZ6NQGbjDxc5A1nOCNE5bKHuf6EHakhuV93iOzjff
         cp5+dB3P7/3fRYiuMYBpeyhlyfkcjhusMGvTCapoDfOe8jbSeEWpt0YkPRyPi0FrSfLK
         1j9uwkdUCJ5usHo2PpJo5VLPUl7Vtja7be0vo85dYjiq57DAZtbXhBAegZcoAorYoAxu
         9GNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1793837565; x=1794442365; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwJhK3x7XVjm47244mpJl9P7sCIrVF4iHXLk2RT9ybs=;
        b=AIPk4pu6kv59pyU6Yftzb6cZja53z0GgjNiVDI0dY1cJucbOX64fTB4HWQprJ6UX3X
         bdYP63NgbU7hxKqGeS6fxjDJ+uk2aEAPmWo9GY9dDfVd2DNFHLu3aXzP9bFUF79PNSKy
         1omu0Tuve/kzRnzrZdOSkaEX0//VbVnQpQOdySSg2rNpGHxQ03eOKXvYNgsaZv9ZP1nB
         HKPe1ivDtl8WX++yckdqnXl45otViFSbIevYUhwZ3Ynn0HQ5Gz+5Ja5Gxk8Bjab7Kg9j
         3/QNU4jkIzgYYJeZxCT/zKUf+spcR9Y37aGtXc+/kS7fg9w7ZXZDM9x072jSL7DhWi72
         lMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837565; x=1794442365;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rwJhK3x7XVjm47244mpJl9P7sCIrVF4iHXLk2RT9ybs=;
        b=2yEQQHAG/R11hpwVFV0pvs0rjwTKRtWjtdLaQBeMWWQTDWRmk25S8ayc5Gi4ZtEBJT
         JDnzYRLi4Lo9X2s7i4lTo6dUfS4bxl8Lz9TTOnkESwGf7p+XfJ0u9kNgiKP5Os8c/KGK
         wWsVunSnotXQHkjOzVGnA30+7XIKJ2/1V3XIgxoxO6L1CJLPqK49dDca4YGReHon6wwJ
         NeuI/bah9VLXg2TyWz6DD5pX1YD3aZzGPBmBklTKZS3q1ZWoFZfz1E32zXIx54tOIIqb
         b6FJYRt1CK4svIzLvuxJ751z5/4v3STTcXitlLfty0iV217ZIM0Atk2d5ECeXKs0zkJD
         Y1Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwvZFViOqhMfHqrukB6Po3xS+rU64HepYvt7vVegTF8tCQsT9z5ISaLQfVpUHMVT6KsM/UYmwrpzbNp0m8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YA9AkpdpscSkj96FO3JozwjEsXAURP2g8BxcM5FQk4UgPmO9Y
	D5MFwIOoTG6f6IefKSjSdLShxCAPoKgfgc1G4iTMw5w7n6z/MYKDOgQZpXrJsB3h8P9MlrNR6i7
	Jd1mEFVVxKbSQLPH4zv6aaGm9U4sE2SuCR4J74M4Exw==
X-Gm-Gg: AYBFou2NK0fPMd5v14s/ARifO7yz0SkPh0bVsoH9jKpgSzQ0C6BCovgglPr4bRIA8Fi
	lWpCPvzieuLoQgLdHJKIQM3ejXfnVAK54KnfECjVjbcY8fWWFuvF/tMs1m4IERz+NWoqjpfSvMs
	zwecJt/ULd1i8LPqwyB+ikjYG2V3sorgu8aNoaam2U92WYEJEfvRJNrTSaVWor1BRDwDduhk66q
	6GkCXvwLFZMG5Xkm/cUpJNa8rqtB5CpyYz8qW0eg1/ZR49OobKRN1qichShohiL7jHfPE6GACQP
	iGG7zMp9XG3W/mE/xBbqKZlcNRXH2RQNHjOLeTpurhAWoTpMqwKb5pxdN/Njmn17Mn/0h7bRRUU
	eW45QkUAmeLd4YTZ8sO9/6vfUKFgD69LFHX4a
X-Received: by 2002:a17:90b:2891:b0:3a8:1759:2217 with SMTP id
 98e67ed59e1d1-3ae8964f436mr24798413a91.2.1793837565532; Wed, 04 Nov 2026
 16:12:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
 <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com>
In-Reply-To: <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Thu, 5 Nov 2026 02:12:51 +0200
X-Gm-Features: AclHuK-Mv6D6Vzn9HGZ74QBGavLw0oS_88AhPwykn9JGIV4rU_H6TjzTRynM-M4
Message-ID: <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: JP Kobryn <jp.kobryn@linux.dev>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 04, 2026 at 02:20 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
   > Add bpf_preempt_disable().
   > Your test forces the preemption in the middle of the prog.
   > Explicit bpf_preempt_disable() will fix it.

   I tried it, and with the whole prog body wrapped in bpf_preempt_disable() /
   bpf_preempt_enable(), Task B is still skipped in every round (on a 7.0
   kernel, 20 rounds, fentry and fexit: runs_b=0, recursion_misses=20).

   perf record -e sched:sched_switch -g shows where Task A is switched out
   now, 20 of 20 (Task A, SCHED_OTHER, preempted by Task B, SCHED_FIFO):

     __schedule+0x48f
     preempt_schedule+0x59
     preempt_schedule_thunk+0x16
     bpf_preempt_enable+0x1c
     bpf_trampoline_6442539626+0x105
     bpf_prog_7dd04eadc26e277d_on_fentry+0x11
     bpf_trampoline_6442539626+0x192
     __set_task_comm+0x5

   That is still inside the prog, while prog->active is held.

   > What are run_cnt and recursion_misses of your progs on inet_sendmsg()
   > and inet_recvmsg() in production?

   We hit this while testing new distros with 7.0 kernels, so we don't
   have fleet numbers for these counters yet. For our inet_sendmsg/recvmsg
   progs, in testing: fentry/fexit on inet[6]_{send,recv}msg, Ubuntu 24.04
   with its stock 7.0 HWE kernel (7.0.0-38-generic, default lazy
   preemption, 4 vCPUs), behind nginx -> gunicorn -> redis, with wrk from
   another machine (128 keep-alive connections, ~1.07M requests over 10
   minutes, ~62% CPU):

     run_cnt 38040015, recursion_misses 4063
