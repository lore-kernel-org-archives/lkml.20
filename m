Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794853293;
	b=YVYGV6bxvEnW1eDAoHzNNRcKuNuFMEkQiEKea+bObO5zysbfFUhVyupz1k+hVRyUeOp0
	 k+3dxM5v34X0qTx7yz+C41tSGtwmCpKcdC9TR4i+Cq5aJV4Xj3YyhjuQEB63/FFa/LtcB
	 HOIvzog15weUti/ezkPw86UhZ7tBdlVHxIHAlxASWAGuara1IM4C9w0iikJbPkz/4R/45
	 qJJC44fWuNpBCk5IDJt50ocTAgJVFaYFX4uK7t4lgB875dUqUEwm3BciHxAvdzAvpFxUR
	 WCPqt49N1lwz+NiNvrS+7DreH/pmTe20XZcPDXPWI/h3KBj2j+dElriBt/qWfKlo1lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+mRY/21ginX+39dDXt2VmzWx/r/vzzUjn+TaaDwm54w=;
	b=ctRgV1eDiz/LwhEw8TFx2dBsWW8gTmE6neRohtNnyc76Ugtk3EOR5vaHpy1ME2K1upuO
	 WRBUNkLgHstNsJCSyhTo+e+sZj/xqo80lsTTQTAycChLcvceyHkP2lkeRAJLrqgSPb20A
	 o/HAD+wSfBnFglrFlRgGS13jjezzjuc1Ov8AamZNk13mXUwQmA0iVuOujfkIwWPhEGggm
	 5mE1t+VZV9aUNM/AbDFsWZZ9KqP0hjCZlntyl0BzupAXsKUiNmjlyLrMVJSEm+AZ0tKgX
	 RumueRZGhSlMJ1WjbNVpq5GhgLId2eTGy/z+1OenpoKlrnyTHaX3vHKOGtbfdo/RTVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zm/cbSev";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECD4606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AECD4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zm/cbSev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492690dd5daso3656562f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:21:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794853291; cv=none;
        d=google.com; s=arc-20260327;
        b=pH4WrisGwFoicYb1T6UPY1PkM3jxdN9h3gDLvjdOnLlILr4h3cbXoflyewcI+eMAKP
         SV10ls6JF2QJuecEpYjxhfy8Uf+4GrH6AH/UH1bmZ528TwW7rNbrU/gM4qImXEQi1GgK
         WzMwh2rQM6TLguMGjfPELe0UiSTYKzVnuiDPwK7HCo0+dpdJi0ZTJV+Na+D+E6MN8/n5
         iQZn+ifz39ieNgLjris5ouaFCRQhnCddERXHJrIy+HsdgrFDHqXtiWaNjGj6yPhjP+sg
         lMdY8se/KZKxq0pkvIGKlINqqfeVCwswezRNL/BLspjrVgALloSyIExdlCpLyshkiymH
         YgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+mRY/21ginX+39dDXt2VmzWx/r/vzzUjn+TaaDwm54w=;
        fh=0EtVkpGDDspzHxmVpL+zopm2yYv74B7iIkQ9wEliutI=;
        b=rGNGm+2wDgpnIAEp/pDa2Xdcl0mfRwp2PnXjNR/8AFcaiYWDIl8gGJlhTTtDMkwIli
         axoirVBszTmz+F3pp74WSst7j/gITM033qJPFbXK5SwWl9Ax2LYAZG9MvngwTAaZRJnW
         Qdq4aszNspBGfalhwGw9kjoNdUeiB+66xkMEq+Q7Vz0vxw9jYyIk12mi5RltAAptYk+n
         ezfccbsQpm7ycSa85c3d3+cjSJ5Uya94JPfz2SKvJ+sM7bnr7d2AJZVWuM1zJi4UQE5H
         T+AFnjXRdzOs5LK4gpwIAhkZmlNEUzD4+Mt7uaE2wfC/Ms6uM9exhpcpHoPlPc4RgCcv
         qUVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853291; x=1795458091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+mRY/21ginX+39dDXt2VmzWx/r/vzzUjn+TaaDwm54w=;
        b=zm/cbSevgb5vX1U4LBW+YkNSL8vMI4OWxN5YoiqU1WeBbLrEIkidzr4BETmU1pUE76
         ibA5HIiy6+4OwhPntqQbQdP2rXXUs/qTz296mY8FQLW/qWqFDzkfIII0HrqsVbUizGRW
         qKLh8HoK+iHj6ov2kVxLmzZbX0U3tUBUW4ewYnzwG8lYN41vYG+Pg+4ZSlEhcZ64gKNW
         mfuIA/YECNDIq3brvfaWU+UmNJem2HB6zClJf5fsoL+ofoB4zZTZW9IuiFZ001vvUaOb
         GTwXf1fR9c4JzAvZkdsjsFXHJkinyMKl1wWc9m4k/iPd8NKV04p+tt7H78cGlJjofFXV
         DM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853291; x=1795458091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mRY/21ginX+39dDXt2VmzWx/r/vzzUjn+TaaDwm54w=;
        b=SVTb+d9aYJz3e4JmYUAhgDIiAyfHRO2HnjcgClLkg1uKN+EYwa3CuYLS+zm+Emm0EI
         o9f35XFKyPNrNfZEFOvc+TnSs9aKW3ZWk//3FYshBwmNixOxIC2v38nab0kv43Zdunjq
         xTRvA7qGRwrHZlSz3iQkJooRU4LSqLdOW9X7t5gk+maySa5SkeAE54Z0snyXa/eNrUf1
         Z5jFKoIvDwPbgB3o0fqTY/fJE4H3q6Mqs73eHuc6sOwMXEnV9rav0IHCaAoZc22/4dbh
         l0z3UbovSnAO2sG0H6ceWOYJx9nqAQpCJUsUUla59q6weU86fwd1MVjdAcY64m98cvkI
         dsXA==
X-Forwarded-Encrypted: i=1; AL+hErHdptgJlto58Q4QAW+6Le0UtJzvKIjA0+QDDLPxjTG4tLgtdcTQgCLFeJsEyefmLvUzha5xRLHsItcUg8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AK1dVn2osF3cxe6bSKY//N/EhB/Zxq7wdQwH/Bd5emsIScov4
	19MigBA0VKZuv6G+30sof6ZNNyS5A+aM1ZcTXRHwYsv3Ij5drTKU3MgsIESBXC5RZhQjw79fkP5
	YRd988SxEXICXxYwGPUyZn8M8FiWxhfLVzCGVZjg=
X-Gm-Gg: AZFdTZevc23zf7YLQLfGpWpK5m5HYXm8yC9KjtHdm18aXhR5gcI4YkAuTDDO9kETlRg
	mz/B7HaZ/xPgGcjm2SvE9swuSpshPcOX7s5w8vPaqLUkKLOnYfFP7XkHNY5yiJwcdLKKI82+6Rj
	negslPAkbY234Mfs6Z5dOlYSJDwBmvGQmbR9ijeHzlpUGJI7KHlHL6HTA5K8+XvTDGOr3sG++w3
	3R/1vp/dzI8+ZTcLngxWoJoKMI87CJxL5RWD1eo8mG1qznDX2ROTqeqWc9KR1ei9KzAVlyIGI5/
	bgle2r+c4c+SBfGPCRkP7kHyGFZ4DNv1zbSrtzPLdd2BLYsmlC18N2BgdwFJFJ87EEWh+idzm43
	wtpTUnvBUDnAjHF08XbB8nMbhuNsN7h+8wbdXkxgM0IWzeSPoJv+BCEUZGBtPu/c0Y2K5kLrmBM
	ri5gNBfEDCfCnCYgV+Jtef6+RLX7zv/DSXTcb58Izr
X-Received: by 2002:a05:6000:2997:10b0:48d:f99d:a0d2 with SMTP id
 ffacd0b85a97d-49c6fe87982mr17681937f8f.15.1794853290904; Mon, 16 Nov 2026
 10:21:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-bpf-raw-tp-regs-preempt-v1-1-d01b6dd8573c@gmail.com>
In-Reply-To: <20261116-bpf-raw-tp-regs-preempt-v1-1-d01b6dd8573c@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 16 Nov 2026 10:21:19 -0800
X-Gm-Features: Aa3M54q2mews4rY30WpsGtsZElX86aOjciD3oE3m5xdhDPqaKHj29XjFeRC-ScQ
Message-ID: <CAEf4Bza3BpgTEpqONMcm6FdH2Qc2Tmv-5feVWJfe9wf55iZxpg@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf: Disable preemption while a raw tracepoint
 regs slot is in use
To: mike.bazov@gmail.com
Cc: Song Liu <song@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Yonghong Song <yonghong.song@linux.dev>, 
	Emil Tsalapatis <emil@etsalapatis.com>, KP Singh <kpsingh@kernel.org>, 
	Matt Bobrowski <matt@bobrowski.net>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:18=E2=80=AFAM Mike Bazov via B4 Relay
<devnull+mike.bazov.gmail.com@kernel.org> wrote:
>
> From: Mike Bazov <mike.bazov@gmail.com>
>
> bpf_perf_event_output(), bpf_get_stackid() and bpf_get_stack() of raw
> tracepoint and tracing programs have no pt_regs, so they fill in one of
> three per-CPU slots, picked by a per-CPU nest counter:
>
>   get_bpf_raw_tp_regs()   level++, use regs[level - 1]
>   put_bpf_raw_tp_regs()   level--
>
> That only works if the users of a CPU leave in the reverse order they
> came, as a task, an interrupt and an NMI do. These programs run with
> migration disabled but preemption enabled, so tasks can leave in any
> order:
>
>   task A              task B              task C
>   get: regs[0]
>   <preempted>
>                       get: regs[1]
>                       <preempted>
>   put: level 1
>                                           get: regs[1]
>                                           fills in its regs
>                       uses regs[1]
>
> B sends a sample or a stack trace with the registers of C. Profilers and
> tracers then attribute it to the wrong task, and nothing reports an
> error. The per-CPU recursion counter of a program doesn't prevent it:
> the slots are shared by all programs, so it takes two of them.
>
> Disable preemption from get to put, as the two other users of this
> scheme do since commit f2c67a3e60d1 ("bpf: Disable preemption in
> bpf_perf_event_output") and commit d62cc390c2e9 ("bpf: Disable
> preemption in bpf_event_output"). Nothing in between sleeps: the
> sleepable bpf_get_stack() of these programs doesn't use the slots.
>
> The cost is small: the helpers already disable preemption around most
> of their work, the unwind in bpf_get_stack() and bpf_get_stackid() and
> all of bpf_perf_event_output(); this adds the few instructions around
> it.
>
> Signed-off-by: Mike Bazov <mike.bazov@gmail.com>
> ---
> A reproducer, x86-64: two raw tracepoint programs on sys_enter call
> bpf_perf_event_output() once each, with the program's number as data.
> Two threads make syscalls on CPU 0, and a SCHED_FIFO thread preempts
> them every 20us. The IP of a sample is regs->ip of the slot, the return
> address of the helper call. The reproducer reads that address for both
> programs from their JIT images and checks every sample.
>
> Without this patch, 7 to 18 samples per program and 10s run have the IP
> of the other program, out of 1.4M. With it, none. bpf_get_stack() and
> bpf_get_stackid() in the same setup return an empty kernel stack
> instead: the unwinder looks for the other task's sp on the current
> stack and doesn't find it.
>
> 5 runs of 10s, debug config, CONFIG_PREEMPT=3Dy, preempt=3Dfull, on
> bpf-next 0fb18ce8a2e9:
>
>                                      without     with
>   bpf_perf_event_output, wrong IP    7-18        0      per program
>   bpf_get_stack, empty stacks        362-535     0
>   bpf_get_stackid, empty stacks      168-364     0
>
> The bpf_get_stackid() case with bpftrace, whose kstack calls it; @a[]
> and @b[] count the empty stacks:
>
> bpftrace -e '
>   rawtracepoint:sys_enter /comm =3D=3D "dd"/ { @a[kstack(1)] =3D count();=
 }
>   rawtracepoint:sys_enter /comm =3D=3D "dd"/ { @b[kstack(1)] =3D count();=
 }' &
>   taskset -c 0 dd if=3D/dev/zero of=3D/dev/null bs=3D1 &
>   taskset -c 0 dd if=3D/dev/zero of=3D/dev/null bs=3D1 &
>   taskset -c 0 chrt -f 1 perl -e 'select(undef, undef, undef, 2e-5) while=
 1' &
> ---
>  kernel/trace/bpf_trace.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>

this looks fine per se, but I'm just questioning why do we need all
those shenanigans with per-cpu stack of pt_regs and why we don't just
have local bpf_raw_tp_regs where we need them? seems like pt_regs are
around 200-300 bytes, that doesn't seem ridiculous to have them on the
stack

anyone would object if we just has a simple and straightforward local
variable and get rid of per-cpu hacks?


  | Arch        | pt_regs         | BPF ctx               |
  |-------------|-----------------|-----------------------|
  | x86_64      | 168             | pt_regs               |
  | i386        | 68              | pt_regs               |
  | arm64       | 336/320         | user_pt_regs, 272     |
  | arm         | 72              | pt_regs               |
  | riscv64     | 288             | user_regs_struct, 256 |
  | riscv32     | 144             | user_regs_struct, 128 |
  | powerpc64   | 384             | user_pt_regs, 352     |
  | powerpc32   | 176/192/224/240 | user_pt_regs, 176     |
  | s390x       | 200             | user_pt_regs, 152     |
  | loongarch64 | 320             | user_pt_regs, 360     |
  | mips64      | 304/400         | pt_regs               |
  | mips32      | 184             | pt_regs               |
  | sparc64     | 160             | pt_regs               |
  | sparc32     | 80              | pt_regs               |



> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index b4ff9d4e8..eb3daf2bf 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -1639,11 +1639,17 @@ static DEFINE_PER_CPU(struct bpf_raw_tp_regs, bpf=
_raw_tp_regs);
>  static DEFINE_PER_CPU(int, bpf_raw_tp_nest_level);
>  static struct pt_regs *get_bpf_raw_tp_regs(void)
>  {
> -       struct bpf_raw_tp_regs *tp_regs =3D this_cpu_ptr(&bpf_raw_tp_regs=
);
> -       int nest_level =3D this_cpu_inc_return(bpf_raw_tp_nest_level);
> +       struct bpf_raw_tp_regs *tp_regs;
> +       int nest_level;
> +
> +       /* The slots nest: a task must not be preempted while it holds on=
e */
> +       preempt_disable();
> +       tp_regs =3D this_cpu_ptr(&bpf_raw_tp_regs);
> +       nest_level =3D this_cpu_inc_return(bpf_raw_tp_nest_level);
>
>         if (nest_level > ARRAY_SIZE(tp_regs->regs)) {
>                 this_cpu_dec(bpf_raw_tp_nest_level);
> +               preempt_enable();
>                 return ERR_PTR(-EBUSY);
>         }
>
> @@ -1653,6 +1659,7 @@ static struct pt_regs *get_bpf_raw_tp_regs(void)
>  static void put_bpf_raw_tp_regs(void)
>  {
>         this_cpu_dec(bpf_raw_tp_nest_level);
> +       preempt_enable();
>  }
>
>  BPF_CALL_5(bpf_perf_event_output_raw_tp, struct bpf_raw_tracepoint_args =
*, args,
>
> ---
> base-commit: 8835113107b2cf75df33a71e265cdeec5d5d13e0
> change-id: 20261116-bpf-raw-tp-regs-preempt-1f7019989ab9
>
> Best regards,
> --
> Mike Bazov <mike.bazov@gmail.com>
>
>
