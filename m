Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE722E8B83
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194407; cv=none; b=cZYgdoFgii/zNY9cuPh39TXJfF4I/c6y0kEqMrnS8HFggY5HaYduNcXMe4g4Ie7nCB7mFlg+C+sdZmZNA33HS0K2AVg4Q4qq9YiEU7toM2doCpFV1jYQrujiyFio7tpUpSz9/r6Uo1tyXJWW1kEcZGZoUQN90TE28RUONQcuiWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194407; c=relaxed/simple;
	bh=kxaKpRrz4PyK9S02Q7PhxjZGgYb3ZSiqi3gVBc0RWvs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTX3OCcRoyvcfGAo+VT3uCnqE92G7/4vUqS+uIpkaWIJuGbQtDtRMbaayEhdCO2Y5iUW0ID9AbxzNvFswuEofWgHSa/05XOOJjkvQy/h9iEkn2p03gj8+tyMYMxrHPl2UKX088pOF+7R3ZD0mqknXHiPCoPxKi7fOE01Yx53cQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fdy7FDGi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fdy7FDGi"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-484362f5c4aso1500288f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788194403; x=1788799203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=miS1UZFH4R+WnwgYePCeDyLowfeIT1GLv5/+U0iMKYw=;
        b=Fdy7FDGivCVUE3LRh2/uFCJk8c04rOlPDM/cBsN3sqQVdB8EdSTo3iR2deHXwNKSzr
         jtJaUqqj1NLxLbMBg5J070a6t6nz3r6FkDEdci4fkV0teW2XGgkDefqNC27189Kgxn4s
         d5kTjENTNvTNJvCWV30iDl70fkXAapNmczbpFIQSZdhd7q2TznpnW/QmTyXxeXoST6sx
         3wrktIuqcl4vAz9owYkMsJXlBRfwUo0Lh8LrGtFmtkl0FlPQWfaBfi1d3HNOuD3TZ2Fb
         2jjFYgPdoRnLKLiZjSMp5tcGuORKnYNEVX8j5y615DfUlrxISp3b2MwUgLpAJZJIezb8
         uA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194403; x=1788799203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miS1UZFH4R+WnwgYePCeDyLowfeIT1GLv5/+U0iMKYw=;
        b=nNV5es1QY79O8WzoHlRSegYvKFYUNO9TtkkL0yh4gYu5wOUVX6AXz/dLR4LsNmuNNb
         qg/gg2kYTZ7+dMPcgKLLCSizxVlfLXuSvvfiCHp+lvhlYJ9OPSGoTRqLnQDRa++c7se7
         ooc6md4E+PLNPeY6Lf4fklBDWFfUPxir6oWQzVjmvLpzsNUZWBtfwiWdSTS63R1JKNBQ
         Zu//5gz8KnqUTdxTJb3LxX9q09QmvwnTDP202U4MNmgcg4+9m1dCQyH2m+BVfS7AWIfv
         W+3NWXJ0KYCeQfOSjR45bU16e9qc7sfB7MkS4Qrh+D4HYZQc177mhZO0S6zGtGrJq87z
         gGFA==
X-Forwarded-Encrypted: i=1; AKwUvBwb56DkNBAN1FUyQ0sXt1pgVC7UKIb8G8VNzgNA9d6RFwR9F/GGFZ3DMyHcusx0dDpbsBOfW+WJS941Fwk=@vger.kernel.org
X-Gm-Message-State: AFuF++kRNi6LUmwFO4OU605L8bHahP9De/4IAJUEczF2RIHejTXx4XLb
	tLalc8XpFRla30oTNfbzkKM75f5KKRvGUpwt64Ahtu7J8Ikrt1euK3kO
X-Gm-Gg: AYBFou2fNiPEa4Hu6BwLgcE7L5+RkjCt4FsV7tN/vvVjProqCoYWNsaEvxzAug3iAfn
	gCb9rZF0hDcCkxNygeS2QrQL8ilB893bJBgL3wgq37I7FaQcs55kf+O8iqW0KFMYESAAfDbpSYK
	dxqMtmZBJcKpPt8fAkGtoDzetv7dDnqJc2EBlfF9R3Bv2q7f+XoTChX9UvfxWuNKNEC4pa2qwJg
	EkPcolM9gEyH009sQupS8LWGMyU1s5RYECy3Tmq31xCgoJ22ogl1BL8z04IElp5/L7/pfuHLjaC
	nM61J5AZ12O6Rk6v5/QWDs1MfUZahD7erzQXnWN2cwUv6O3BHx1WF52RBf7jDix5lVS2b1fnx+8
	QRlM/Rz6S9M+3x2xQwHtaPlrH1b4CM0m93XWoKgiyvladerkM4Zkp6IqP6YeISt+qYPpbY0QZaO
	z6YBGdVcE2CeQ+nND0ftgYc7yAaI3Lb36n9WNtyQqWv/+szX5arvKjGIkIVA==
X-Received: by 2002:a05:6000:64a:b0:47f:6f9e:1e82 with SMTP id ffacd0b85a97d-48440fe2e15mr4159761f8f.9.1788194402891;
        Mon, 31 Aug 2026 09:40:02 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb284cbsm23459460f8f.30.2026.08.31.09.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:40:02 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 31 Aug 2026 18:40:00 +0200
To: "Florent Revest (Anthropic)" <florent.revest@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	John Fastabend <john.fastabend@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jose Fernandez <jose.fernandez@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf] bpf: Keep progs alive until the trampoline image
 calling them is freed
Message-ID: <apWuYPCVCvBeaCKr@krava>
References: <20260819122252.1782790-1-florent.revest@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819122252.1782790-1-florent.revest@linux.dev>

On Wed, Aug 19, 2026 at 12:22:50PM +0000, Florent Revest (Anthropic) wrote:
> bpf_tramp_image_put() makes sure a trampoline image is not freed while
> a task may still be running in it (call_rcu_tasks() + im->pcref), but
> nothing similar is done for the progs called by that image. Since
> commit e21aa341785c ("bpf: Fix fexit trampoline."), detach patches the
> return path so that a task still in the original function skips the
> fexit progs when it comes back, and counts on the prog's own RCU flavor
> to cover a task that is inside a prog. On that basis the last prog
> reference is dropped right away and the prog is freed after a single
> RCU / RCU tasks trace grace period.
> 
> That leaves out a task in the trampoline glue itself: between two
> progs, or already past the patched jump but not yet in the first fexit
> prog's enter helper. On !PREEMPT kernels this is a few instructions
> that cannot be preempted, so it did not matter. With CONFIG_PREEMPTION
> a task can sit there, in no RCU read section of any flavor and holding
> only im->pcref, for longer than it takes to free the prog it is about
> to call:
> 
>   CPU 0                               CPU 1
>   in image I, orig_call() returned
>   [preempted before lsm.s prog A]
>                                       bpf_tracing_link_release()
>                                        -> bpf_tramp_image_put(I)
>                                       bpf_link_dealloc()
>                                        bpf_prog_put(A), last ref
>                                       tasks trace GP, A's text freed
>   __bpf_prog_enter_sleepable(A)
>   call A->bpf_func

hi,
do you have a selftest or another reproducer for this?

thanks,
jirak

> 
> On x86 this is an int3 in poisoned bpf_prog_pack memory:
> 
>   Oops: int3: 0000 [#1] SMP NOPTI
>   CPU: 18 UID: 0 PID: 94573 Comm: x169 Not tainted 6.18.44 #1 PREEMPT(lazy)
>   RIP: 0010:0xffffffffc0601d8d
>   Call Trace:
>    <TASK>
>    ? bpf_trampoline_6442515411+0x1a4/0x21b
>    bpf_lsm_bprm_committed_creds+0x5/0x10
>    security_bprm_committed_creds+0x5f/0x70
>    begin_new_exec+0x2d6/0x410
>    ...
> 
> We hit this in production on preemptible kernels when progs attached
> through trampolines got detached while their hooks were busy. Adding
> grace periods before the prog free would not help with sleepable progs:
> neither RCU tasks nor RCU tasks trace waits for a task that slept in a
> prog and then got preempted in the gap after it.
> 
> Fix it by having the image take a reference on every prog it calls, in
> bpf_tramp_image_alloc(), and drop them in bpf_tramp_image_free(). A
> detached prog now stays loaded until the old image is gone, which
> reverts a deliberate choice of commit e21aa341785c ("bpf: Fix fexit
> trampoline."). Detached fexit progs still stop being called right away
> since the return path is patched.
> 
> Fixes: e21aa341785c ("bpf: Fix fexit trampoline.")
> Assisted-by: Claude:unspecified
> Signed-off-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
> ---
> This should also be queued for the stable trees, the same race exists
> everywhere since struct bpf_tramp_image was introduced (v5.12+).
> 
> Tested on x86_64 with PREEMPT_DYNAMIC/preempt=lazy by attaching and
> detaching a handful of sleepable and non-sleepable LSM progs in a loop
> next to an exec storm: unpatched 6.18.44 hits the int3 oops above
> within the hour, the patched kernel survived 10x that. The trampoline
> related test_progs selftests (fentry/fexit/modify_return/lsm/
> trampoline_count/tracing_multi...) pass with KASAN and lockdep on both
> this commit and its parent.
> 
>  include/linux/bpf.h     |  2 ++
>  kernel/bpf/trampoline.c | 28 ++++++++++++++++++++++------
>  2 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 7719f6528445..fc0949156a5c 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1368,6 +1368,7 @@ enum bpf_tramp_prog_type {
>  struct bpf_tramp_image {
>  	void *image;
>  	int size;
> +	int progs_cnt;
>  	struct bpf_ksym ksym;
>  	struct percpu_ref pcref;
>  	void *ip_after_call;
> @@ -1376,6 +1377,7 @@ struct bpf_tramp_image {
>  		struct rcu_head rcu;
>  		struct work_struct work;
>  	};
> +	struct bpf_prog *progs[] __counted_by(progs_cnt);
>  };
>  
>  struct bpf_trampoline {
> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> index 1a721fc4bef5..ca83ddd7cf37 100644
> --- a/kernel/bpf/trampoline.c
> +++ b/kernel/bpf/trampoline.c
> @@ -531,10 +531,14 @@ bpf_trampoline_get_progs(const struct bpf_trampoline *tr, int *total, bool *ip_a
>  
>  static void bpf_tramp_image_free(struct bpf_tramp_image *im)
>  {
> +	int i;
> +
>  	bpf_image_ksym_del(&im->ksym);
>  	arch_free_bpf_trampoline(im->image, im->size);
>  	bpf_jit_uncharge_modmem(im->size);
>  	percpu_ref_exit(&im->pcref);
> +	for (i = 0; i < im->progs_cnt; i++)
> +		bpf_prog_put(im->progs[i]);
>  	kfree_rcu(im, rcu);
>  }
>  
> @@ -588,12 +592,11 @@ static void bpf_tramp_image_put(struct bpf_tramp_image *im)
>  	 * rcu tasks to protect trampoline asm not covered by percpu_ref
>  	 * (which are few asm insns before __bpf_tramp_enter and
>  	 *  after __bpf_tramp_exit)
> +	 * im->progs refs to keep the progs alive as long as the image
>  	 *
>  	 * The trampoline is unreachable before bpf_tramp_image_put().
>  	 *
>  	 * First, patch the trampoline to avoid calling into fexit progs.
> -	 * The progs will be freed even if the original function is still
> -	 * executing or sleeping.
>  	 * In case of CONFIG_PREEMPT=y use call_rcu_tasks() to wait on
>  	 * first few asm instructions to execute and call into
>  	 * __bpf_tramp_enter->percpu_ref_get.
> @@ -628,16 +631,20 @@ static void bpf_tramp_image_put(struct bpf_tramp_image *im)
>  	call_rcu_tasks_trace(&im->rcu, __bpf_tramp_image_put_rcu_tasks);
>  }
>  
> -static struct bpf_tramp_image *bpf_tramp_image_alloc(u64 key, int size)
> +static struct bpf_tramp_image *bpf_tramp_image_alloc(u64 key, int size,
> +						     struct bpf_tramp_nodes *tnodes,
> +						     int progs_cnt)
>  {
>  	struct bpf_tramp_image *im;
>  	struct bpf_ksym *ksym;
> -	void *image;
> +	int kind, i, n = 0;
>  	int err = -ENOMEM;
> +	void *image;
>  
> -	im = kzalloc_obj(*im);
> +	im = kzalloc_flex(*im, progs, progs_cnt);
>  	if (!im)
>  		goto out;
> +	im->progs_cnt = progs_cnt;
>  
>  	err = bpf_jit_charge_modmem(size);
>  	if (err)
> @@ -658,6 +665,15 @@ static struct bpf_tramp_image *bpf_tramp_image_alloc(u64 key, int size)
>  	snprintf(ksym->name, KSYM_NAME_LEN, "bpf_trampoline_%llu", key);
>  	bpf_image_ksym_init(image, size, ksym);
>  	bpf_image_ksym_add(ksym);
> +
> +	for (kind = 0; kind < BPF_TRAMP_MAX; kind++) {
> +		for (i = 0; i < tnodes[kind].nr_nodes; i++) {
> +			struct bpf_prog *prog = tnodes[kind].nodes[i]->link->prog;
> +
> +			bpf_prog_inc(prog);
> +			im->progs[n++] = prog;
> +		}
> +	}
>  	return im;
>  
>  out_free_image:
> @@ -734,7 +750,7 @@ static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mut
>  		goto out;
>  	}
>  
> -	im = bpf_tramp_image_alloc(tr->key, size);
> +	im = bpf_tramp_image_alloc(tr->key, size, tnodes, total);
>  	if (IS_ERR(im)) {
>  		err = PTR_ERR(im);
>  		goto out;
> 
> base-commit: a13307e97d5c54b65720bb71fa379960ded1e51a
> -- 
> 2.54.0
> 
> 
