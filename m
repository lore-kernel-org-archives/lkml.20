Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559052;
	b=GP3F7m2pfqoWufYsyfX1Zol9mpAIAdi8VjmdrYdagdxjmv0ZrxyMoVuB1vHfIQ5ZNcz/
	 odx2vT0JG1k9bvHU24gDz0cnImOwquPpH8q0GHcY3xuc49dC3iJvY0PHvov/rIwgWONxL
	 NJ1t60IXU97dVnbcXAegxnTAdFB04uHzBvsvUg4Pg4UPwL+BqibrcBXbDgCtDnWVFmh51
	 c0p602Bk7hSLEC9J+YpR4g0ETuGXvze8IE7iscC0cQSJM1KR62lmcHVbjRCflVpQuxqIY
	 Av30+PqvKnEfT80osLzQNue7O1mfo254GzpmPZVgWtrEnlpLGp6VeyFaj1Ujx9nQ+Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=;
	b=LJJ1qiBsvXahSU2SaG8GAeCcFzdFw4RuvlR4vprR+cj8tG55w6p5MzTCQbQBNisGni8R
	 rT4OmojFTvBaJIDXph5thLGPEZuq/zMG8MvDUrt8nIpjlpnbFt706JU1uTi3wStassfZh
	 PxbbGNHHw6Mm4JVv/HNJ2sM3R1KUi6AkK7cWTctMKwhEhZLA/sVMv9aQjRFUoaCFWW0V0
	 17CwuAgsPUFsZD7Apact3HDYPKy4gggtNdXGHyffvraPWeiT7JNnnNaBZJUaRSmW2nexu
	 g5KhqxjLY0uFQ8vtS6jFJMA/W04C+zSZNpLDDLngSEDnAB2742+ySQZsyTPcikrjV0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=kqvuemHk;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E03E60A5BC5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E03E60A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=kqvuemHk
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so4643305ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559051; x=1795163851; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=;
        b=kqvuemHk79RFnSsKnGqcfaCFlZsslhnlt13wX/OUB5ofsLkrIWggKEmEwHtZeYNUed
         cHUXB7/QF/2P3xKfMCBKIikUlfB4RfHXhRcgJQHQjdOKGwTRFlMN+nvnkolIcdTpEHZX
         2Ne3YX9PJzZJDR4Z6rIiPDlegs0QpGRkNB87Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559051; x=1795163851;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=;
        b=D/zKVDD3AEGCpCeOVv6cUoFLHEpJnzyGe+WtAwmbmykUPiGH5iVRA31/cUhRNqSZXG
         3jnJrCKpUYYopFVYj3dAA16qI6nkT0BhPY3zbDM8ptEKZzjuQXY55kAMS4fggmP6b9A2
         tt9GSsdDtslLGFDQnqlhu/USDWtekpilwZUS8NPHF23mgPUwhj/0vP0gjchPGB26ItUs
         M9KdEKg5qEFn1G5FzW6nyOEG84u7ooa4908fGcsO5DlX2GL0X7VznvvxJflLBo9wdpAh
         rlEIbrtHayeQ/s4EHNIpPZDZR/kvm0k7NGUVhreJCM36rJDHzuZIAzwaYEwNFqv2wp3V
         1CYQ==
X-Forwarded-Encrypted: i=1; AL+hErElf/4xqZLFmRDySPeD4Wy8BPw4ANISsPnhmGuem6ZGzAyARcogk7SX+DLemtEBV/JDes/EvWHmwx1q7Ys=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t64/Wm/EGZNgJvCh7acQ+g6WqNIOPRHC8QtSVfOkkvtw3NBK8
	WrSola9sJv+k0lXLgV5GCV4ktUrk3UgxoKB9+Pt9Pi1z2qa955pRif2gpdU7t4dq054=
X-Gm-Gg: AYBFou3smqo7hHmv66clyZ5RjojI910U0NmGPXHJcOF/s4kJhAImxj7lH7GUcgdbjl+
	Wfb8LZXz1e777Np8lhdHBBxZZKtNHA25eM/Y6T/Z4YORpoRSDKWb4Kh9HmALKEuaGUrjEUHUmOB
	t1wZwbUtUgtGwCiplFi71ZktnP5NVw/x7CpCuvHpm8wtDcmNvlHnSaqpreLiV7Zwxp8qR5PihLf
	4xLLNOAotMPLIt5j9Ezr1FLbPphZsJMbnPOVRKCrYwPKLJTbMu/mxEe50VnN5Cbzuy4oHNnQq4a
	wM9FIAYjLS+8/Vp2bn2Q/E4RsjOAcRMIsQ37qylDovk5bcH+TEDEY6cdChGJGGxt+inWaFdCDwL
	5U6Eo6KzAo7YoxHeelfHgoJnRJP6OKwr7j2TEyt1/2Al0m0DbCfUut/b8KZn/xSC647q0rdl69P
	3jcCnvxqcuqbvLqVqxX1fzx87j0qSXm2qkZqV1GZZygrSt8NxB2dpMyHVtMToF4h3pyhxfU45Ar
	MXvkFERbVlZ2QvHIxcqLZQkaQAiBcK8Ya3dhazTOIZdUybUgQ0eD0poMUvqDUnm1ebVKUGg9MW3
	LP0muApbvRqVZ3rcmrz4Bac9nqEMZR16LaxdoG4vWeocLUW+3SJcpBt2nBoIG5GkJ4kJYeJKh/G
	TeRFc2cgy7DMCZAxknoG+oQBKE50++9JdNZf96mnowpApVTmpuddjWp2zmPp/nH3vdoQlg2KuSp
	jwOY0ItoQ97cX9STQ2OwOiKam3HFYSK4hqg1yACaq397BHZ/EpoIUOZ9MIxvI=
X-Received: by 2002:a17:903:2b07:b0:2ed:3057:4f79 with SMTP id d9443c01a7336-2ee0de41b68mr16715855ad.20.1794559051439;
        Fri, 13 Nov 2026 00:37:31 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm6785655ad.22.2026.11.13.00.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:30 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:29 -0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
In-Reply-To: <20261027101703.GB2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name> <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name> <20261027101703.GB2668564@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003729.4a4222d8270db2bd@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Peter,

Peter Zijlstra writes:
>I just noticed that there's a number of task_stack_end_corrupted()
>checks that:
>
> - do not also do task_scs_end_corrupted(); should
>   task_scs_end_corrupted() be put inside task_stack_end_corrupted() to
>   make sure they're always done in tandem and the shadow stack check
>   isn't lost?

I had a look at the other callers, and I don't think the shadow stack
check is being lost in any of them. Two are the oops paths in the x86 and
powerpc fault handlers, and neither architecture has
CONFIG_SHADOW_CALL_STACK. So putting it inside task_stack_end_corrupted()
would only change __might_resched() and the stack tracer, and only on
arm64 and riscv.

Both of those are about the task stack in particular. __might_resched()
got its hint in
a8b686b3af44 ("sched/debug: Check for stack overflow in ___might_sleep()")
because at the time a stack overrun could corrupt thread_info and trigger
the warning on its own. The stack tracer checks right after it has
recorded a new maximum depth for the task stack. Neither has anything to
do with the shadow stack as far as I can see.

schedule_debug() would also still want to check the two separately, so
that the panic message keeps saying which stack it was.

> - should these other sites also respect this switch? It seems weird to
>   only have this one site affected.

It is a bit odd, but I think only this one should follow it. None of the
others depend on CONFIG_SCHED_STACK_END_CHECK today, and the switch is
only meant to be the boot time version of that option. They also only
look at the magic once something has already gone wrong and we're
printing a report about it. The stack tracer is the exception, but it
only looks when it's enabled and sees a new maximum. So there's no cost
to avoid by turning them off.

If they did follow the switch, anyone who leaves it off would lose the
"Thread overran stack" hint from their oopses.

So I've left both as they are in v2, and the changelog now says why the
other callers don't follow the switch. Let me know if you'd still rather
have them folded together, though.

Thanks!

Chris
