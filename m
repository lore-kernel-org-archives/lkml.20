Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C242333AD88
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901033; cv=pass; b=HctYO5eirYyKOXirO3eo9hfq8HfyBfxzbkRUONBLHzNKYzkafmU+MZv+/XT18keph722Lml0vqTN/556+07dqApSuRKshD3CAEGVFHePoE+Hh/t4dCAkw3Jacw+ZObHU2ZlSp5ImeDnw4EQE2///Nef+EWPbWb2MXUxxaeQnCoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901033; c=relaxed/simple;
	bh=eVo2ETLGu/64oGaNGV8KvVJmKGSFz6e4Q/WvJ0CP1J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oY70TN3p6osvKoRE0aLCLLZQ1r2cxMyldE3bu6BABOtrjVb0P9gUYPo7a2zs5ordhpEw0hJTw1RfODilT/nW1xeUP3spAs0+Vxq+O4KlmXjOGubNsL5pCHURo36EkAglLXrtefbA7/GpzI88BJ4vJJ0O21D6umbVOlwrtlICYTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L1F4fRjr; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L1F4fRjr"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso3031cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901029; cv=none;
        d=google.com; s=arc-20260327;
        b=Qp48dP/srhZvfsF0hKItV9wEbN72CKx8y3ZQ3HaUocyLi3IhxfC6WA1tt4D8o9rp8P
         awkeVhdC5TmZMAAztMnBO66qpBXR9PV54i2zgOvr03qsV7lZMADaH92EcpyQIUQWWvaU
         qilOngo65zjTqNaQ22x03526VhCupWNNvpoBU8N5p7yJSH0RuMV11fQWmADMYNmjmMwK
         6TpaVYcc548Jy3IzjqQLOJDvxYeIoH5dM74ybN4I6YcZNoDeOsUpTVe+ZA0loA0LUyZz
         /TNH6yAID8FnLFU7bmoVkE9s3jPjh8xf8iEXk/P8V6qy0hrbLkSG89qDNQK1voDjlDB4
         MoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVo2ETLGu/64oGaNGV8KvVJmKGSFz6e4Q/WvJ0CP1J8=;
        fh=f3OQsjlZrzr7Jip2zuC5WIeWub9I6WujTp4HJDR3Ml0=;
        b=k2vrpoSZ+eB5K3Aj+et1+H53fvsMh9Y58L+K7y2DyOGw7ZsKMPcSUqw9L+Sz7XI3DF
         aeRs6Kx1duD4/q8uus6hzKZPytczZnYAJx6zmedJvyxie+oJbtkW69qknNpsv2/N1t1a
         LTws65l0BSlDdvLRK2iA0ukkManbTHZwt2Y8rRA1jZ8iKT6lNjQkOhDYx22z3DBsoYsQ
         tWDNYqiIOtrGV1O81OdDhdTPjb4JsVw606YxTGrYbKg+pXS6SpFlkSMr6VqemzchKC7e
         KeNKWArgObdF2/ijoxJ50NWZCGWXlqmaM/cWvlaLJVmss73eNRr8Jin8esJMivM42o4H
         +Nog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788901029; x=1789505829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVo2ETLGu/64oGaNGV8KvVJmKGSFz6e4Q/WvJ0CP1J8=;
        b=L1F4fRjrJxwtwD1Zhuyi0DSi/eYeL7OgGf2ribUo/kJKOn4+emDH2/CtiaqKreR3AV
         agT/7fZ1F5O9cuYRLV5yHLwtZOJA+pEHm6UqI4YZVdUi/sALaBX2wW9R7rfFMzgMKRNS
         xdxjBXtNq83QmpAl18fQayFjUDM3Ns3CpAU+dY0sa1IboNvOvIjGMbZMVoqKXEFCRxbV
         FoJNIK4fLIElHMno6mp7rzAsYg0WlNUpZvUNA3D5OKLoKPOJ6QMdy6a5PiBlDxbhwzW2
         +YVoQLJKQRtsh0k450F6lVvP25wPATGHe2LEuWsVeSmsd2q0ZeWpsGINbVaHYVBCxvFW
         bYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901029; x=1789505829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVo2ETLGu/64oGaNGV8KvVJmKGSFz6e4Q/WvJ0CP1J8=;
        b=DBqovp6jQQ4sFKN34iVPTGdD3Phf8TPZ5KM/9242HETCT+ncLQH92nBp4C/LlGGurj
         WZh4fGhA6qwyeitjWHMTQckjznhsArCtjmgDDz1iG86ZdjRsSEsLlSNz3RZbRqWwXy21
         teiu5GwnsE0mgTJcAr54biuTVzrPhm3uXLBFH/FyDaQCz/03VUtXKe5cFn7/kfGPkOBS
         5wmFUD4Ck5v8XWISmybz6uCqrVq5zVm7ytqIOTPxcubukh5CzbueoApXu0fNaK/u4xZh
         sVZfsPdi2c/FKxZlPlVuW8lCjzUyqzkfUsyBA59SSx4a4JBtvBFs/FolvjxvrdM5VN+I
         AXjg==
X-Forwarded-Encrypted: i=1; AKwUvBzVwTeUTkdqxeIXFJXMI1seF5+gjMVAYdDZJrL8nc7UrA4PfkfitT5LCJEjDcQvwmgBriRYmmfyWpmiHgw=@vger.kernel.org
X-Gm-Message-State: AFuF++m+s2b9R750yx161x550ne0f4L1hfNJ1N4GUZs+6PoVS8e7a5Fj
	DF2IFVTmpyZRBx3++bqnnug9ss5ct4+kG1IOq2JjMpW8tQZpgwkrGPTEp+eCVeBBn2Rs/SY4+8p
	23aln+UUqTINXTO6zAnQjzrxJIS8JIJevbBUHkrow
X-Gm-Gg: AYBFou0Qwju81pMxM8j0rx0LrAos1wFCrkeGUgR9BmSFnnICdEhYrPRdIqeLZZqF4mF
	gqVpq4AT8s+9xbKPNkKzlh58058/K8cQcbvTbtEM3EWk+uopPtoesd5wtPGFFw3iEJo+Oe8eUl0
	6VUCy1mW5DgAHLNaoV+CMvPr/o/rzB2zzocTQWmfpY9KSayb5Bn1UPmn1hnntma206PYPf7GfIf
	t3AYALz8te33r8QJxuL8wLE5/+xJy16x6DtEoUDZUbr9rv10PAEx0rkdvzOpxpo8Lqs1X3wL2uL
	WYt3ayNyiYoh4XBjgzYAzcHBvKheeu/LYg/FbZzsY9nmQ5emg0hpLnOgH/cC0Lcoi8XQ4PJSKg=
	=
X-Received: by 2002:ac8:5d48:0:b0:530:4cc8:b0b8 with SMTP id
 d75a77b69052e-530a46fdc0dmr3720261cf.0.1788901028687; Tue, 08 Sep 2026
 13:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908075102.540715-1-dapeng1.mi@linux.intel.com>
 <20260908075102.540715-2-dapeng1.mi@linux.intel.com> <20260908084906.GO4121339@noisy.programming.kicks-ass.net>
 <1691a05c-49a6-4b16-8bad-cb3c004ed07c@linux.intel.com> <20260908101914.GQ4121339@noisy.programming.kicks-ass.net>
 <aqAlddsFPYJvRhFr@tassilo>
In-Reply-To: <aqAlddsFPYJvRhFr@tassilo>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 13:56:56 -0700
X-Gm-Features: AcwNN1X966ABp7yeo8WK-GTAn53V_0RKsGXVzyPRdBek6tFMdJkXdAygR0j64J8
Message-ID: <CAP-5=fWbSNYpt8p3e+pqjY+xhqs8WrzsBfPaKB1NLBm88mH8Yg@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf/x86: Disable precise sampling for PERF_SAMPLE_STACK_USER
To: Andi Kleen <ak@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "Mi, Dapeng" <dapeng1.mi@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Eranian Stephane <eranian@google.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Dapeng Mi <dapeng1.mi@intel.com>, Zide Chen <zide.chen@intel.com>, 
	Falcon Thomas <thomas.falcon@intel.com>, Xudong Hao <xudong.hao@intel.com>, 
	Gennady Kupava <gennady.kupava@gmail.com>, Ravi Bangoria <ravi.bangoria@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 8:10=E2=80=AFAM Andi Kleen <ak@linux.intel.com> wrot=
e:
>
> > That's what we already do, no? I have distinct memories of making the
> > stack unwind use the NMI regs rather then the PEBS regs.
> >
> > > In my opinion, it could even make the thing worse. User
> > > requires to get precise samplings, but perf silently returns imprecis=
e
> > > records, this would mislead user.
> >
> > Mostly just the unwind might be off a little, the rest is accurate. Thi=
s
> > has been the case 'forever'. Performance analysis isn't for silly
> > people, if they can't deal with a little fuzz then perhaps they're in
> > the wrong business.
>
> Is the main problem that the stack doesn't agree? Perhaps there
> could be a check for regs->rsp =3D=3D pebs->user rsp (if in user space)
> to detect problematic samples.
>
> The question is how to report it and who should do the checking.
>
> It may need new fields in the ABI either to communicate the extra PEBS RS=
P
> or a bit to indicate that there might be a mismatch.
>
> I guess checking in the kernel and reporting an error might be simpler
> and maybe cleaner, but it would likely limit more advanced recovery
> possibilities.
>
> Are there other mismatches that break the unwinding? Perhaps the same
> for RBP?

For DWARF unwinding any register may be the source of a frame pointer
(e.g. the OpenSSL library would use R11 rather than RBP).

There is redundancy on x86 you can sample the PERF_REG_X86_IP register
in the user register and there is PERF_SAMPLE_IP in the sample event
itself.

My understanding is that IBS can only sample IP and so for precise
samples we can use PERF_SAMPLE_IP as the precise location and the user
register PERF_REG_X86_IP as the interrupt IP - this would match the
other register values in the interrupt.

In DWARF unwinding, we initialize the register state using the sampled
user registers:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/unwind-libdw.c?h=3Dperf-tools-next#n270
and on x86 we sample all registers for DWARF unwinding:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/arch/x86/include/perf_regs.h?h=3Dperf-tools-next#n20
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/perf-regs-arch/perf_regs_x86.c?h=3Dperf-tools-next#n=
238

Having PERF_SAMPLE_IP be precise and the user registers from the
interrupt I believe works for AMD IBS and ARM SPE, but for Intel PEBS
there is the ability to use the PEBS register samples for other
non-redundant registers. In the x86 driver could we disable PEBS
sampling for these registers when doing user stack sampling, so that
the sampled user registers match the stack sample? We can keep the
PERF_SAMPLE_IP precise, and make all the registers precise when there
is no stack sampling.

Thanks,
Ian
