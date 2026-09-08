Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BF951993D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788909703; cv=pass; b=aRIYrUyD76xP06XnSWzbY0K7gbuGS60YWxex0AjBNPlIREw3KkBx6bqtoINi4RZgy/okee+F9zrqVFLrB9A8U2bQbAikxuY6XW/tqamtLBe0TIMQpNzhRilH2tMtvtoclnYhlIbUXc3rc+mD6eUUGyjhWG3eKV4xaBmMi+6d0w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788909703; c=relaxed/simple;
	bh=2w9Vu2z44X0Z4L1kBT3EHawgFCel5XoCWx4dtZIXYo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbmBir3WBdc2EUiPi5OT+sCBKH75PANaW4GdpXUlrXOkNP1mYPnfiynJL0xYFu7i2nFrfcjQoJSZCLsRcF66HLvIHx972vDV/RV/DfzPbK/YDvLHhJfzedmaG05LrFF92hLR2xgpdoSlIvgqQFA8DwoAHkWEXa7LqVaSXMX6GlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hkq1QJT7; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hkq1QJT7"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso6324821a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788909701; cv=none;
        d=google.com; s=arc-20260327;
        b=JzxI0MgfxhPZIBEQChdvOcNrdQEWRGubMEqvYQtDzBWbh35gSipTqQ7dCkLQJ5pGMD
         kZXF7W9t4GF5V2RpApSvT8wr3+5+YnkO45/gbk4kvGSTmKkXDGVFoDK5a415Iy6mwdB4
         3G6ahIdaoZ9dMAv9VL9zxZQuKLNG+tzd0awtWaxWy3mxHvHL4BirAjqZChHu+gDcn2gV
         7o1XLDqedEfZEXjQkogAlBaaYuxti0PeQ9oUUkXbtqoarXkaKgACDcL+0rG/m8RxEloI
         WroJtHgtY6P3aULXuRqZV+1fT2g39alfnoDo8FHSm5eiiStnE7JJqFtjLZa4XEo6q1+f
         0e5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N40Ys2WwREbdlf0UPMXpzQZmUrGcTgSJ9kBHkYNCAm8=;
        fh=uIaoIM95qsxxDIRvJdkWG3z0653ZInFXTNRqXtbQAdc=;
        b=PHI3UAV+vNldT+3lFFB02XSkzRbNnCZBG/bkhygugfzqsaTxr4MD7ga8KcTxuXHHXu
         O6ErJuOUEm0cvKeXoKNeg894I6U28czMadmMxjAjywvvgrgPmCGb9h9SrP8a0S4UEeCL
         aFtBF0HYwF93cKJaSbguYba7e04GthmQSxkKEWm7V7n9RK6Ga+Ed5BfNJwEvCM59oSxY
         pIs0itM8vSM5qD63QNfKunNx+/wSfaU2O0bLsRKZU+Z5PKaq0oQmOhFKxQIcseUQs5A7
         V6LCg51p2XAGVtFWrUtDSsfEk4s2L2eHi9e1dP6Gg1Uqpfy8ppMmQoLgtzWja/lO7TMc
         gb6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788909701; x=1789514501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N40Ys2WwREbdlf0UPMXpzQZmUrGcTgSJ9kBHkYNCAm8=;
        b=Hkq1QJT7aD2gS/kN+6+wiIolAdUiQCrVzoLUPWZlpYMRNz3/FxgNHmYhAPiZLmBygJ
         2ELmOjRjFLo0ffk+q/kjnbMC+VffmQLlBTj8vl4xveW94uYK7HG1ZjF3v0mbTW9Ed2pV
         XxYzXufrNGxuIfNA/dIZHX+e6ACW+U3UBfusy2ihqS2U2B37OprhCJxC5cYR2D54JtN3
         ETArIWgVNNue5PiMnlbRviiD2ygZrhU3myVVVElA5lD9p5T28BbrflzRlyYZMwaB0dKz
         N6Za3CMK5fs4UrXKy3mVyxZrioZHD5qwA2XokhT/cOPBkQKBcWI8WU7qWUv3hmaZCQ/7
         C99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788909701; x=1789514501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N40Ys2WwREbdlf0UPMXpzQZmUrGcTgSJ9kBHkYNCAm8=;
        b=ZA/G/6QusnbqqDnCgQDJjswzzSULSSPCldZlMHb1laB/Myx2XKLZmH0SGQVQ2k9E+w
         Eg+hJscIPc+2J/R/FMcU25o0zd7gMJz1QfuojR/BRtLkGHYc9cc3cOJ6An4RXIbpycfj
         pn4Ir9mcmF/gy30Uyb2A8Q24JizE+/0tyGhf6nlTkhCOU7f2SJ0oubK+gNkKfAvxOACp
         MZNTqbEws0HuycZzLYQRLp4x65TMp76u1o3eSaj93TFuVd9qSow7bkrOR2IoKETPqxli
         /aj9TvYBk/n9dLxxyu6psqbUl75aFdPN4iZvYKAnxtdsWDzVwfoeEq/ckwPg46PUQfsB
         kDEA==
X-Forwarded-Encrypted: i=1; AKwUvBy5JyIdYxWsxsCEWrrRpn+A+b9TVI/8c+Oa7jcteTlbSkiyFbQi4HLe9dJ663yORF75LYnPVZrOl4xIKAE=@vger.kernel.org
X-Gm-Message-State: AFuF++nlaVHtr7TkxZ1fBnRemrNpHHYQTPtYhRst4oLvOpMTODiVNylo
	HkEE+Nbdp5s4No1uHUs6E0lZVb66eaAiSk8xVcN/12Guo2jZr1JL2il+HUU9sC5pd+BCx4LZr9l
	qwoQX/awVGi53+cBuMS4lWlUuN1v4Kc4=
X-Gm-Gg: AYBFou3g3c3OO8IiaG4MG8AxbGnEC9V6wj6578W6PDe5QLPSt8iqvonEnjfmG3NYlMq
	CRL/nvIuO0vk9ruzNorhmrzVrl0tkSkkwr+7AjqpYvlm53LB/XRiivVvK9dp7m26ecQoBgBQPaS
	vdlgs7qnLCJNUuvzB8UFr/3LN0SXa7aI3mxnHt7xqmf0Jzjd5ly8tGLDLikHkr9ZHCioi2nakLX
	OKDG8IRRpBDzb8x7AuTeYnlzPEZZQmZl68YUugRtOE8m2zEMMpzOCe6CGS/ehIJDfyTbnsj0HD4
	QggogbEKXIoJ9HT275lvSMbcK18cU+sLbA5gUX2ylN2PXqggnCbj3IfdAVpLVoVfEZrZzI47OU9
	5nB+2j37E3hBmoYF5hUylSmx7andMXZSEkmhGrtPwvA==
X-Received: by 2002:a17:90b:57cd:b0:38e:bfe:81e9 with SMTP id
 98e67ed59e1d1-39b260fead0mr46769801a91.1.1788909701068; Tue, 08 Sep 2026
 16:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902150439.692725-1-adi.sharma@zohomail.in>
In-Reply-To: <20260902150439.692725-1-adi.sharma@zohomail.in>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 8 Sep 2026 16:21:25 -0700
X-Gm-Features: AcwNN1W3DRslezF3q8zGwmwdk3AYLdNuGHbMfUGJVA0I4K_g62wgy-gg8bf3BtQ
Message-ID: <CAEf4BzZSWKeEV0-i65Nr4zKmB3uKZu7cqtHc3NrphFV=Z9--qw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Only check nmi_uaccess_okay() when
 signalling current
To: Aditya Sharma <adi.sharma@zohomail.in>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, yonghong.song@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, jolsa@kernel.org, kpsingh@kernel.org, 
	shuah@kernel.org, puranjay@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:05=E2=80=AFAM Aditya Sharma <adi.sharma@zohomail.i=
n> wrote:
>
> nmi_uaccess_okay() takes no task argument and is a statement about
> current. When commit 6280cf718db0 ("bpf: Implement bpf_send_signal_task()
> kfunc") made the PF_KTHREAD/PF_EXITING and is_global_init() test the
> supplied task, nmi_uaccess_okay() was left testing current.
>
> As a result bpf_send_signal_task() returns -EPERM whenever the
> calling context happens to be a kernel thread, regardless of which task
> the signal is aimed at. The same call with the same target succeeds or
> fails depending only on what the CPU was running:
>
>   bpf_send_signal_task() from tp_btf/workqueue_execute_start : -EPERM
>   bpf_send_signal_task() from tp_btf/sys_enter               : 0
>
> This was originally hit from a bpf_timer callback, where the failure
> is intermittent because a softirq runs on whichever task it
> interrupted. The rejection is x86-only, as nmi_uaccess_okay() is
> defined as true in include/asm-generic/tlb.h elsewhere.
>
> Only apply the check when the signal is sent to current, where the
> predicate is meaningful. bpf_send_signal() and bpf_send_signal_thread()
> assign task =3D current, so their behaviour is unchanged.
>
> Fixes: 6280cf718db0 ("bpf: Implement bpf_send_signal_task() kfunc")
> Suggested-by: Yonghong Song <yonghong.song@linux.dev>
> Link: https://lore.kernel.org/bpf/20260819124324.43162-1-adi.sharma@zohom=
ail.in/T/#u
>
> Signed-off-by: Aditya Sharma <adi.sharma@zohomail.in>
> ---
>  kernel/trace/bpf_trace.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index 29260951aa87..f7a41f222599 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -871,7 +871,10 @@ static int bpf_send_signal_common(u32 sig, enum pid_=
type type, struct task_struc
>          */
>         if (unlikely(task->flags & (PF_KTHREAD | PF_EXITING)))
>                 return -EPERM;
> -       if (unlikely(!nmi_uaccess_okay()))
> +       /* Since nmi_uaccess_okay() is only for the current
> +        * task, check if task is current.
> +        */
> +       if (task =3D=3D current && unlikely(!nmi_uaccess_okay()))
>                 return -EPERM;

I think we should just drop nmi_uaccess_okay() check altogether.
Unless there is some technical reason why **for current task only** we
can't send signals, there is no good reason to have this.

let's just drop, it seems like just a copy/paste from some user memory
probing logic, which shouldn't apply for signals.

pw-bot: cr

>         /* Task should not be pid=3D1 to avoid kernel panic. */
>         if (unlikely(is_global_init(task)))
>
> base-commit: d761934c9483ecde93fe99d8705282f716dfee50
> --
> 2.34.1
>
