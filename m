Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855658;
	b=s3OOFd+IsqB+BWVRQwiqjhrZK0G4spdwXPxNSSJNxTB/Waw13lx4xVrOgRxmA2MrfrNL
	 1pH9vJUILYA4Al+SYJPz8d28nmO1AyQfpewIuapiQu5aQTIAKOWlviM9UFiW++1hEjDIC
	 zjGzUW7J7FRAnUTS/gYkn7omD2/PDmzFCVUwtc9rnHWCzNgVO0BPSwUZkzj0BYTy41ntV
	 lg5yHXbMLbs6pawAnYhFqg/74uKjMw0oXD5H4eo+EFwboS5NpBnGaoOaffHWX65jUAx4/
	 Oneen2lTt3vwYR3xoS4k/aCD9iRNOWJ8jRBeEJpcEy+JihfAAhfE1TMfi6wVCVG/PLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=/dNLoK8eolfJkj1an88i/VPdEv8gehRvTnLhDc4kaqU=;
	b=Ahgo0seFVkikBr8LTkAI/jjJuq5HjZP+8gSGxLYk4OYyv34SklXZvRvZ1cFUzQ+i07JK
	 /AKmTiYvQP4rjQgcoud6D5YqSuRZiWJP+LQs1Fx4BTdrmsxWY9UJa1EF3aJxrFQ2NPYSs
	 zKXuBwERNJCrwGzRi7xiHI/1d5EhQe+MCqYs8lv6asINlAtfDK5STtmEbRwq+9Ihbdw9b
	 vc0lj8zZariBjeL/oDgCYpkYUDtEKYRhtysjf9nKgDaGPzkXNfOtHYOx3bGndM8U32CnS
	 2i19snsJmHoxEqx8mrsw75Ejfaj6TtlWIGNldAlAVL329RbaWoTZamJhUDOrZ5DZk3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmpmO1aN;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4BF606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F4BF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmpmO1aN
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ea7987517aso8370925ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793855658; x=1794460458; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/dNLoK8eolfJkj1an88i/VPdEv8gehRvTnLhDc4kaqU=;
        b=wmpmO1aNcXZo6fYqQBuOI8WyNSidCMIjF0MAWyjOg45Ff9KVA85lXzdGf8TT2kIwnA
         nwq+Flrd6vzgzgcbVpSkwymojlv9nCXBLVP7Bn18JFDCMW5BrDjyR4b4ectKrsExjfFb
         X7Kx5aqb8xzIa+/BR7GpBv/cO7hhWp/zvbd9KiowAV1LZ4H2zIrh2LCMjKngCTKDAJR8
         aPoLtBo8QPyyZi8JNfITn5/0XGy3xijE8aceN5ANa3znno7CqkydXB1RzsPmz/XTy2l6
         RnET+OvMMZImCKwBJD1w3TmIiR3x1utzV1CpNECmK0ygR123cwPnzKxU1SR2tLhvNRBs
         KjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855658; x=1794460458;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dNLoK8eolfJkj1an88i/VPdEv8gehRvTnLhDc4kaqU=;
        b=EQB0KB1JbzrM1wGB44P4TlegCQ0FdlXZXIqNSq2vRS4rety74yR0ijGJCjeaXv6OTf
         El8FgkVTqf7qiXujw7J5NlG6nWb1o/mHcyx4hZT5sJCD86zvypcbfRMY6Pjt6ibpDhCn
         eyusYdlWUgEEtPjkEY2g8rZtopqxHROAedsCR3qUMpQEg2+GErvVRehqIs+atpN/l6UJ
         Xmv2BZBr23360EJ6jhBaN/29krtI8gT/T/VGJAh6TWLLLjyGP2MeFCocTShkHZAwEqv1
         QWT1X6cOT8IGkQrA6uYLG68R0PLZcF0bkwXhqNujaeboKQdeiNNsBADpo3rfgCx0bvLD
         8OYg==
X-Forwarded-Encrypted: i=1; AKwUvByeiUnx50HS8xd5vuOgN08pUkmhnHP/stCRfN/w1o2kGXWiUPQ82B4XEH+2widqmt9fxQGgK6YVlT00v1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1u0Wot4m2FO+kVcEyrBZsz5+obcllFtzLa7ICXq4CnTwmJyko
	FSgFbo/os473ScF1uGWM23g1KlpnxnAfAWJu7WaD1H8+NHy16ebDb4ZF
X-Gm-Gg: AYBFou0KfOjHhiOhw3tsiTVv3J+s6+Bm/wK7TciaRAydKcq1yCOxduERcojEjKiGMxT
	gjQXBifmawRwFQwb6kN/SSj0X+GplA5bTAIkk454yVulNnUIlcZ7h4Dodyjc6XJfT/ubsueAAjJ
	NnAZ2MviBHBSXnPsgEHb04Q6/66Tm+/wC2YETgA2TAvnVhKKRxrJPWS2BvI+7jPO+/oS1+IuCwa
	UkJrMtIQsmPZ542n7xaO44Zz4DC1s+VsIikbEwQkP6EBxus+958uWws2GitpCpN+mk19jvOe2lQ
	BBYms6SPcCzaS2PbJesLVVTBdZPcQGiexOp2RhiX8Re74zzpwtKWuaVIwx0guZJQ0xh4g0KPmNR
	3RgjWa56RXheq4l2IlDCklvsQpuwygHCxgNdXsZ36thvJLzr4NN6W0A2FkZH9JyiCe7pMS57rq8
	iekMv8ajfFcLboPHJrIwcbefQhWDCtq5Y4SKjyCKPDeumN1QNxaVsJwR4b0Lv4gtHtrk0zGcm2c
	UA/AfI7tQW2ZxJes1Q4wM1UuiiBNJPyO/eayS8eGu8hc5h01T5qZRHvG2pYO/k0KkVIE+7oYueG
	t7NYXvGFxTwt+6eKL4aERfiuuaV4hXWEfOZvTBNPWcFopd9RaIeNGNezfxWOow7vuTiQMydrjsK
	AROLcK4FFFcMaDhUeO6ksD1OIvLkYYojNTIE=
X-Received: by 2002:a17:902:d485:b0:2dd:c053:a6ee with SMTP id d9443c01a7336-2eb364ce5e3mr166128155ad.32.1793855657678;
        Wed, 04 Nov 2026 21:14:17 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0910faaasm13103375ad.47.2026.11.04.21.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 21:14:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 05:14:16 +0000
Message-Id: <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com>
To: "Mike Bazov" <mikeba@sentinelone.com>
Cc: "JP Kobryn" <jp.kobryn@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let
 preemption cause false recursion drops in trampoline progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com> <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev> <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com> <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
In-Reply-To: <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>

On Thu Nov 5, 2026 at 12:12 AM UTC, Mike Bazov wrote:
> On Wed, Nov 04, 2026 at 02:20 AM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
>    > Add bpf_preempt_disable().
>    > Your test forces the preemption in the middle of the prog.
>    > Explicit bpf_preempt_disable() will fix it.
>
>    I tried it, and with the whole prog body wrapped in bpf_preempt_disabl=
e() /
>    bpf_preempt_enable(), Task B is still skipped in every round (on a 7.0
>    kernel, 20 rounds, fentry and fexit: runs_b=3D0, recursion_misses=3D20=
).
>
>    perf record -e sched:sched_switch -g shows where Task A is switched ou=
t
>    now, 20 of 20 (Task A, SCHED_OTHER, preempted by Task B, SCHED_FIFO):
>
>      __schedule+0x48f
>      preempt_schedule+0x59
>      preempt_schedule_thunk+0x16
>      bpf_preempt_enable+0x1c
>      bpf_trampoline_6442539626+0x105
>      bpf_prog_7dd04eadc26e277d_on_fentry+0x11
>      bpf_trampoline_6442539626+0x192
>      __set_task_comm+0x5
>
>    That is still inside the prog, while prog->active is held.

Right. Pls hack bpf_preempt_enable() to use preempt_enable_no_resched().
I think recursion misses may disappear or become single digit.
If it's good enough we can quickly add bpf_preempt_enable_no_resched() kfun=
c.

Also try NO_HRTICK in /sys/kernel/debug/sched/features.
That may be decent workaround for now.

>    > What are run_cnt and recursion_misses of your progs on inet_sendmsg(=
)
>    > and inet_recvmsg() in production?
>
>    We hit this while testing new distros with 7.0 kernels, so we don't
>    have fleet numbers for these counters yet. For our inet_sendmsg/recvms=
g
>    progs, in testing: fentry/fexit on inet[6]_{send,recv}msg, Ubuntu 24.0=
4
>    with its stock 7.0 HWE kernel (7.0.0-38-generic, default lazy
>    preemption, 4 vCPUs), behind nginx -> gunicorn -> redis, with wrk from
>    another machine (128 keep-alive connections, ~1.07M requests over 10
>    minutes, ~62% CPU):
>
>      run_cnt 38040015, recursion_misses 4063

hmm. you really cannot tolerate that small drop? it's tracing at the end.
It would be a different story if such drops were on lsm hook.

let's try to think how per-task counter would work.
I'm guessing 128 connections is 128 threads servicing them,
so 200 cpus will be hammering the same per-task counter which will
cause real perf loss.
Gotta do better than per-task.
Also it needs to be per-task + per-prog. How will it look like?
