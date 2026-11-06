Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794002899;
	b=mJy+ozqzTfH+PdG/QuEPxYAr/SiHer36AlnHpxS7IWcTWOgLYZw1qEvv3zAvNRoPCAgw
	 2fHVx7AYhywP33UXvf8sXFy/48yPHrQ9+E3tr7s02GL3zVAuOwzQXS5y1w+e2pPjCcjzP
	 RcTQrF1DEpJ8HhNNd22XvNs3fjBLF4ki2xtfNDjFIF7I7r3wY2FwOwSfa18LFXqfkbKNI
	 HzV+JpSQAr0m/OwYcDqtdkEtyoL5oXSsjTV/zexd5IJD6Pq65F+owlOMCSwl0cRl92OKG
	 H8LqICcIu8EWdSHczRY6T9Gpv6mqWxa7zbvIjPl/E9zuPzNNQbSt3bMUDgmy8mdPuOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FqFmqkkFKN4ZfUBPlXX1uRJGzP51Rl5pjkFD5VZ5PcI=;
	b=Cn4C/uvs5TnumCc5oIvB8hU7LTP2xp/TJQxxryDbbIh9rclb/zx+HGos6+UhD5cDpNHS
	 XKl+kycw0SSR/7Xr0uj2QMeoMPPU8VSGziT3AbJ8ZNe2gwV8paH0OxaX+LBQ0tXLTQcje
	 l8GH6Umdb0qgPZmeiEZ3lQdmBNNM0DXKEJmoTOg41aTQhPP4CywcZ5EP2P+/EN+2jfnMn
	 ZjKLIywl/8Fn7AQBGDIZm7S5cAzAb1cBkbKP+Hn27a3oKyK8FFt/IAJaYoXrMeqtVdZNC
	 BjVppuTtrryNFlYRDlWA4F/jT0wRX7iHxXTXT6ZrTVC6UoR2yjPAcVcQgmdq3OAbhJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b2/N2EGe";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB00D606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB00D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2/N2EGe
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed11653a91so4994225ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794002898; cv=none;
        d=google.com; s=arc-20260327;
        b=L26ks24eaKOI4Rzh9Hn96mXXYgVBOlcAWlXEhl62UkHA323+U+w9QFuwVXeBAKAPnA
         Pp2uZ2EevtWdikRQmxCLFv837vfkAkWBsaTmGd5h9dxGPPYZHWbImoKb/TOMHTbA9AVW
         RTZGOPYgZqOrTCpDCgY0BclUOp1yYacB51QPFhTSQ50PnUnBB1jdC11Hb+ETnnW2ID8z
         BK5jtFOe1/anPh3QmU3v3cWP04A3x4wAY5V3tpq9B7VvoeDtV5FvtTNJa8s400EgB1i6
         ZmFycpwjeHRP02kFNtnscwC0oPjeqmHUE4WXhiZj9Wq9NCY6RibIfSdKZJ16M8hbUWuH
         iWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FqFmqkkFKN4ZfUBPlXX1uRJGzP51Rl5pjkFD5VZ5PcI=;
        fh=h/H4sl+AElKX35qeebP2XrSfD7MXygWP/lruHtLIook=;
        b=IwJAUwUHqRnBx+kt6jo6zRtbfEWz4g69jfUAdlC0/AcR+devrDKqpVn88ANJwYHzkP
         46nCEjbI8EptJ0QSSKsgZqjZiBs/7CPr5SilCfz2OQlBIia07G47xlBqHPX3W/ibCnrJ
         QknRGo+ixTaRpEtkBbEcnHIGONHv7jrET7yCjgM7k2MhgGhDMxVH2RLGcWXrVBB+IMlT
         7/Fcf9rdsy/I7aUyarJXHdz3wa8KyNlsv3t9RYWfbFRsTH38OG8mw+/09cwZSJ4srD17
         HcnyGWgSvPXewC8WAYUupplQJpBRiDG9r6Z9C6jawlAz+WxJqLbm2WgJKByF0rswzWhi
         SQzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794002898; x=1794607698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FqFmqkkFKN4ZfUBPlXX1uRJGzP51Rl5pjkFD5VZ5PcI=;
        b=b2/N2EGedXLlXAmGy3seM65ririhay+J1WlirQfYoIUcuzkaIkl40FHJgakuZm17yG
         nAUDoFDfOaFJ2QMk1EmeGmZdPADqd8uhJznVwiRoEa7b9qPw5NO5xVYpVn9firQ/kOPr
         Mm37HnJIN8yf1x8+h31XvbSyn7wQFbQpPyf6/L9n14w9o7d/7pNuhwTPUw9cFq2U/wtQ
         WAIKhZ8O3jGTIIm/CeEJihiD58ppPZeCsmi0UP0AXYkJFrklaGSOGsTD0bocfuGE2dJl
         7rUrLFZbQygqs4qQRSuVhMdfq3MebiGXFEAym6kvd+/cthwIi5tgaGStlIqGdBN7e4SM
         hnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002898; x=1794607698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqFmqkkFKN4ZfUBPlXX1uRJGzP51Rl5pjkFD5VZ5PcI=;
        b=gKMeBk5SJoupSGgLeZ+VETn4CQBlI0MniN1SSu1JfZucadC/GHvU1ZN8uFQrfHwWHF
         2B6Rq6b0RoJiAELKM411LTQgb/3lyAG5EbcyDKPLiTDj8kc/5JVMrtqb0dN5t3Bjuw3b
         CSxOoCflcNVu/kOHdzj1uUq7kD6h3K8b1HpFOMS6Nt/qrJTmmF53sSemdZYXzPc0TLPh
         8IXtzBcaLZx7tPDKNv0qfQ7JpIrBpCWLAODfH+6DMo7gCOGlCn1s/uKdyToKM5u3zIP1
         48bOx8cCvsPA38Z9lbjLeiSxk73AMUglkx8npqs3ddbl0jaiIJQ9YpOU/Dlme/ATG3yR
         szmA==
X-Forwarded-Encrypted: i=1; AL+hErFegiM4g+BivJnxjZnA4R+e+ogPmqHQMnDXXCAgX4n7MN8ZUU/UIxnT1pRYWLVSc/qs5AvjcOIJhyl9FH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8E2ziBRjqrTWm80QM2miFN1k/Nwta81XH1hnV+HEKQykRx0KgY
	mX5H7Ba4JgZI3/Z9xdCgVT8ktndXDSimpjAtMy9ajiODUlyFpGJuvw1wnc99FJiyGXyWsO9jF4R
	8FicXQOp/7vlvNhhlWOvsF/9v+WTuSUU=
X-Gm-Gg: AYBFou01grNHjwPxNhMi/h5K1TDQNjcQLYEaU4jit/jMg1xpeXdzb9ikDbMWncmn5pW
	UX7ifrmncwxpLxwdY0p6VPsL/4d10eKo27jHCkDPaf3leKmtXMNA7QJvOf2KHrk/mMvvYZMNeVt
	vjX1XDkz3ayefRe2L9t9p2Lk4SargZ80JFuW9DfacFjofJQFKecsTS0i5XCcpU3fQp2mIJJ8jhx
	cK9zgEr2IOaISxhDMJdtcKl9mVlhMIgNmzif1wvEGcx/52b9QEXgZr57mthe2AgBSwjYOCw8TPq
	sesfkdaU/jMugKCjLxzYBHcR3fi3USt2tSaOwRABnanjWZOTr72GSPSZqhsaTGrpRGsrq9+gYdw
	Lo8Ig8pzjhdccNI4lPFoiXODF8fsUrEs/kzQFwo5zmyq5amv2qeEoxaRzPfqmHIsvF2HPNwxTFJ
	YlfOEEtZB4vHjBKuSUnFpBvMu5vFwSOhTc8tOK+cg=
X-Received: by 2002:a17:902:cf03:b0:2e9:5eee:e087 with SMTP id
 d9443c01a7336-2ed41c0b3cemr44187095ad.43.1794002898049; Fri, 06 Nov 2026
 14:08:18 -0800 (PST)
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
 <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com> <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
 <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com> <CAPnbwjrX-ywbcgNQSZKE2jiggEOSVCRVw9OLfaksihiVSCoqvw@mail.gmail.com>
In-Reply-To: <CAPnbwjrX-ywbcgNQSZKE2jiggEOSVCRVw9OLfaksihiVSCoqvw@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 6 Nov 2026 14:08:05 -0800
X-Gm-Features: AclHuK_HFrsL2zSNs8yVxrqbEw7XSZavKhtUuOEmL2ac3ue5Zeg2-SW1ecbr29Y
Message-ID: <CAEf4Bza0XDMTxxZeukwRXjvoOOruY49q66xBXnYnuncbeo_Oiw@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Mike Bazov <mikeba@sentinelone.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, JP Kobryn <jp.kobryn@linux.dev>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(resending as plain text, hopefully)

On Thu, Nov 5, 2026 at 3:35=E2=80=AFPM Mike Bazov <mikeba@sentinelone.com> =
wrote:
>
> On Thu Nov 5, 2026 at 5:14 AM UTC, Alexei Starovoitov wrote:
>    > Also try NO_HRTICK in /sys/kernel/debug/sched/features.
>    > That may be decent workaround for now.
>
>    The 7.0 numbers I posted were already with NO_HRTICK, and either way
>    our agent runs on customer machines, so changing scheduler settings
>    there isn't an option for us.
>
>    > hmm. you really cannot tolerate that small drop? it's tracing at the=
 end.
>
>    For security monitoring each skip is an event we never see, and the on=
e
>    we miss can be exactly the one that shows an attack. For stateful
>    protocol parsing, one skipped sendmsg/recvmsg can desync the parser fo=
r
>    the rest of that connection.
>
>    > let's try to think how per-task counter would work.
>    > I'm guessing 128 connections is 128 threads servicing them,
>    > so 200 cpus will be hammering the same per-task counter which will
>    > cause real perf loss.
>    > Gotta do better than per-task.
>    > Also it needs to be per-task + per-prog. How will it look like?
>
>    On Thu, Nov 05, 2026 at 01:26 PM Peter Zijlstra wrote:
>    > I would strongly prefer all BPF programs that attach to known
>    > preemptible sites to use a per-task recursion counter or something o=
f
>    > that sort.
>

I agree, per-cpu recursion counter doesn't work given most of BPF
programs only disable migration, not preemption (even if
non-sleepable).

>    This is what I have in mind for v2:
>
>    - Every trampoline and raw_tp run already has a run ctx on the running
>      task's stack. Add the prog pointer to it, and link the task's active
>      run ctxs through one new pointer in task_struct (other prog types
>      don't touch it), so each task has a short list of the progs it is
>      currently inside.

hm, funny how AI figured out run_ctx, but didn't figure out that we
already chain them and we do have that pointer in current->bpf_ctx...

but yes, I think this is the only practical approach for per-task
recursion check. performance-wise it should be ok as normally we
shouldn't have nested bpf program executions, so the hot path will be
quick.

>    - On entry, walk only the current task's list. If the prog is already
>      there, it's real recursion (the same task, or an irq/nmi on top of i=
t,
>      since current doesn't change there): skip it, as today. Otherwise pu=
sh
>      the entry, run the prog, and pop it on exit.
>    - A preempted task's entry stays on its own list, so another task on
>      the same cpu is no longer blocked by it.
>    - Cost: the list is empty unless the task is genuinely nested, so the
>      check is one load and one predictable branch, with no atomics and
>      nothing shared between tasks or cpus. The walk is capped (e.g. 8),
>      which also bounds nesting depth. It also works across sleep for
>      sleepable progs.
>
>    To keep the per-cpu guarantee for existing progs:

I don't think per-cpu "guarantee" was ever there. per-program/per-cpu
recursion protection only "protected" (by dropping event, effectively,
so-so tradeoff) a case when per-cpu map is used exclusively from
single BPF program. But even then, there are BPF program types (like,
I believe raw tracepoint programs) that intentionally didn't have
recursion protection.

Realistically, you have to have some allowance for having nested
per-cpu map uses, e.g., in wprof I maintain a small stack of per-cpu
values, see stack_trace_scratch and embedded atomic st_cnt counter in
[0].

That's all to say that I don't think there is a need to keep
guarantees. If per-cpu map is used naively today it works ok most of
the time, but not all of the time.

  [0] https://github.com/anakryiko/wprof/blob/master/src/wprof.bpf.c#L574

>    - Make it opt-in: a prog load flag for fentry/fexit and raw_tp progs
>      (like BPF_F_SLEEPABLE) saying the prog may run concurrently on one
>      cpu, and that it doesn't rely on per-cpu exclusivity for its own dat=
a
>      (per-cpu scratch buffers etc.).
>    - Flagged progs get no private stack. The verifier could also enforce
>      parts of the per-cpu promise if you prefer.
>    - Unflagged progs keep today's prog->active check, so existing progs
>      see no change.
>
>    What do you think?
>

I'm actually wondering if we should re-evaluate the whole per-program
recursion protection. I think this was added to prevent deadlocks
inside bpf's maps and other internals. but we have switched to
rq_spin_lock since then, so that shouldn't be a reason.

Perhaps we should just get rid of that whole per-program recursion
protection and just make sure that a) BPF program can protect itself,
if necessary (with naive per-cpu check, I did that trick in retsnoop,
[1], because it was, and probably still is, possible to attach BPF
program to kernel functions that shouldn't be attachable by BPF,
leading to all sorts of issues; but I digress), and b) just make sure
that BPF maps and other functionality doesn't get deadlocked if
another BPF program got preempted in the same code path.

I didn't do any analysis if that's already the case (for b)), but
let's discuss if this is an option at all?

  [1] https://github.com/anakryiko/retsnoop/blob/master/src/mass_attach.bpf=
.c#L229-L243

>    Mike
