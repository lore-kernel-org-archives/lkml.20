Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20ED429014
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396995; cv=pass; b=mkQaue/FhDiB4ntauVKJA6izI2stSTdN4wnddBykj7vmMDyvvN60JGg2AuPgBjW1wAiyxG7JUQVYco5MeTitHYxcMjfwul9krNAKDhoaFydwbjUQx5kAqLCAxkpHN53Mo+961y3mjCEut3mrXa9oq+urHI29mlaTkCNOAkzIuDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396995; c=relaxed/simple;
	bh=HVlxiLUTNiWE+bPAoyNB60lJPdl4a+s1ny2DsDgGaHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MpKy+w7CnkjL+QLPHxFgEUTnTj0bFFedGPAnwk6H5OW3F27d+LpGzpqcAntu+FY2Tz7YbP9WzoiN3r5AJe/S3DkKhta4OgLGSTOCsm+M485I4lRdRysBEi3xhPp7GkZ4+OjzOu79+U6YLZ27dNA03dId75y5H99gz5QJA99YhAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=knJav3xQ; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="knJav3xQ"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso2111739a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789396992; cv=none;
        d=google.com; s=arc-20260327;
        b=P54qe+Kg61OkpQ2RtWi/lVTDHU+CEC3CpfdQZLWEQPYBGBrx+tDUmCH1HTYNe/vm6U
         DCSU1mC0zOAvCD2Zu2vb9fGFIL+jBPKv4mneWIL5MBT2TcZ4iFSHBqT3o7EObcpo6SjO
         yqR5OwoJTiiR6x50DwZSArkCdqWBG5ExlGyLaUeTzocAV27EoHrWJMic1UwhLUoSiRBE
         4V36t/A2PwvUUEZy1346OSlpHLaEjZ4D72thui6Zf8g+fdIbrGcwZn7ZzQm45MkhR9dw
         4HMdxCi69d6iqSQQR7OuvlGXsJAbeNfwN4H8d1tfyNhFDGqImOcRwM9JudM8lXE6fKHe
         IE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LH9xqDwg+UWNhqzaDxSdBTBsbVKqSIk4FBsXYbZlywo=;
        fh=TPBk5669KHuTZVt++BBcO9xfdVZAaXdK2yDkTZ5CRkI=;
        b=QH/iZC/OFvUWLTbvaipdeb0KH/2grABNFpDW8nokbabgrl8ZTxRH9l0lH5sTohXSXU
         FM5mccn3TpHgJoZe9v/fvcAseUCUBF27DbDh/XeA8304YcpUZmaeQm+U1FVSYeuJCfef
         IY9twY44XMa5qLUC2nTTfU78jbAqVbJl0otMEsTdVST4BMEE7z9EDxxd8GIYXQJ13gTY
         RDfLFXp0TxeBWbnbh4BsKmWcYmCd/7YmVQXL+hM9ZFfNIGAGzL1LY910asKKg/pZzQTM
         hQ3cPITfqO7lB55nGsu3Rh/u/f28iIiQXm5StQY/Iqvf51wdUJ4oyc+wNuoVdv43bzRl
         ANQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789396992; x=1790001792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LH9xqDwg+UWNhqzaDxSdBTBsbVKqSIk4FBsXYbZlywo=;
        b=knJav3xQjChMSBomH1KDZ1lHehb3lORAd/GWrtYVv9hsj7LwVHDwZ/JHl4u7pqw8Xt
         8svahyOQmAgbnBoHNKzsdciS4uxAF+TiU/CoRXc8QVv+C2Vds5tR/zdxT8VCnwcwbFQo
         Ih7wXa8Ln6aIdfoT6fBJnA95ntxO5c17JT6x8rREEwf/r7jS8xacJ6sGjZLQe722TWYS
         327tFikw8/x/mjIFrzyApgrekJTMa9DXs2M2IsCkPZbedv8IL6SzdvbqxKTMhNZ4yr4h
         +V5MWoFtBWmSsMbPWl7udIHMeqRTpxCfnZVx81mYntVd11VYW1yDIAs46biz9JRxSDgZ
         YVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396992; x=1790001792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LH9xqDwg+UWNhqzaDxSdBTBsbVKqSIk4FBsXYbZlywo=;
        b=Qd6MkeGQ/1Uu2kNl6yhAbYfJwftynbsySOJGh5T7Wzk2Aqx2TnQoNNvf1fAaDUZxZp
         JgyV9f20c33bfiskTIa3gaGLiJ+BzjTBzmbB7mabjMfcJyQFRB+5VwYnATmOdDKGc2fc
         7HEu9kmdrdJKemoWNPnP22YxkPOCX64S7m2f8wyvwbRb+sEp00AtYGrTDl8AsMEC9rdU
         67FjBu/cXAHGfcN0KP/qPbDkrrSwM1KhBXZ5AYMpP3DqgHhHzMss8qU1tmbcXXJWuVTU
         gauRaX/hwGAUBwtoZg1GQVwq0r785frvA277gzrCSrMTmsWJksy5RKaf/EN8vCXKI+I+
         zkvQ==
X-Forwarded-Encrypted: i=1; AKwUvByfRDawO/XLN4ymobwSTTQ+2ojxKhSSARttCDdR2uHqIArbjWcIB0nIHirdgf2/BQd9RYc+6zLLbAtJagY=@vger.kernel.org
X-Gm-Message-State: AFuF++nGg6S0/2sCQzqPhIXPJKI9LwNGY/nQqZNhEXg6tk0inoaZCuY7
	JMWdePNW4nXo5tEOaCQM0iSjTK1l4xrWxP/TWIE3QrVKnltWCwm85MTzlDJkQOymc2tjGr4d229
	JYvxYjtWphGn2AAzfff+ULfDw65HFK/aTDcYbridv
X-Gm-Gg: AYBFou3Xf1jiXsXei9Zs+CCp//5MRa7O9+Z4WZUoffoq9VsUElXYfeXhBmda1TORqXv
	S1ZXRDtJzW687MI6KLmznjIUI49RRAotgZegl2hVUZmVd29XWARwEhsE0IBiJw5W8/FZLa7Yj18
	klvJ5LJvRrDUMwrXU2E2cgJrVk2wp0xpW7gMkN4SMKTF8pakyIQnrk+h8kwPB1q8+0Qkxpj1yBP
	EByQzPo7hNJpC9z9x1lAdKRLwL89ik7N+79I+b60bbwyXfngEdrAam/0Hbt2UX1koMSMBkSz6aX
	m5+T57SUzLsM6eGYRngRBrLBVJoZVtJSEXh3OXHLgPYIMcQSQthMkxxQKm2Zjq8JCo1Oqjr6kLO
	7uV20sjuDy8vn
X-Received: by 2002:a17:90b:4b81:b0:39d:f95d:bd08 with SMTP id
 98e67ed59e1d1-39df95dc372mr1658544a91.14.1789396991179; Mon, 14 Sep 2026
 07:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914054632.12877-1-kmehltretter@gmail.com> <20260914054632.12877-5-kmehltretter@gmail.com>
In-Reply-To: <20260914054632.12877-5-kmehltretter@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 14 Sep 2026 16:42:33 +0200
X-Gm-Features: AcwNN1WppAUKdCf37pS7DpvK-X6wLcpPx-Q57kOJ1aEJoSJxBHs5p6fSfydB6Xo
Message-ID: <CAG_fn=VwN-1pdK_3=qrwpDb=EsyOdoNgNK19zB7Ga0puQZgScw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] sched/core: Pause KCOV in __schedule()
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>, 
	Bradley Morgan <include@grrlz.net>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	linux-rt-devel@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 7:48=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> kernel/sched/ is built without KCOV instrumentation, but callees such
> as sched_clock(), architecture CPU-capacity helpers and profile_hits() ar=
e.
>
> During preemption and schedule() calls, instrumented callees can add
> nondeterministic scheduler coverage to current.
>
> With CONFIG_KCOV_SELFTEST added to x86_64 defconfig, the interrupt
> selftest fails under QEMU, detecting spurious coverage in
> arch_scale_cpu_capacity().
>
> Annotating each callee would spread exclusions across architectures.
> Pause across __schedule() instead, extending the scheduler exclusion to
> its callees.
>
> KCOV_PAUSED remains set while a task is switched out. The guard in its
> resumed __schedule() frame restores the prior state.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  kernel/sched/core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index ae97c63842a4..54b5c5383fe6 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7116,6 +7116,9 @@ static void __sched notrace __schedule(int sched_mo=
de)
>         struct rq *rq;
>         int cpu;
>
> +       /* Instrumented callees would leak coverage into current. */

Here and in other patches, I believe Peter expected different wording.
How about "Callees instrumented with KCOV"?



> +       guard(kcov_pause)();
> +
>         /* Trace preemptions consistently with task switches */
>         trace_sched_entry_tp(sched_mode =3D=3D SM_PREEMPT);
>
> --
> 2.53.0
>


--
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
