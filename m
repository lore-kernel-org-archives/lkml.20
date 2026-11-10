Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323163;
	b=HROuUP/M9EPnt7begGP+cFaaGFOfBCPLbnFTkG9km4ZryXwRzfH0KE49hdOpixMx94xa
	 KLmrOXQ/X+i3x49TnFM5tYPZr+vCmkrXjczPihn5eH15XdbFMP4hkkYV8SiTSTyp7P0FV
	 6dULrjP7ov1SEKOiBFroRJxPVRLsIoC4DFLvjffYe2jn8O8kKfRECr9xbiPJY+u9M0pe4
	 0xynJNO6eTRNV+4NLiYR++y9sU5T90YXRZWhOWEiUezO++p1ExZxtwLBgy8ibwLq4FGXK
	 CxxQlmtLC2pukb4ZfVoxKam5l3XqdT08HMboC1DPnnqxHoSi4ADgCdtgUaIPYQkenWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3saG5HUhHWIluByVMXbKrM1wtI4RFxTnUgkKyi8UGJA=;
	b=4ZeG9j1ht6JuaGWXc364CwceiBeOTStUoswQAMQOXb7u8UPHQbSfzO/AkIiav3K7gnMc
	 YB5zXqPvXH7ETyomaMhV4r8ekhCJDEB19rLRJJ7h1TfJ/y/hoeG1DEFdjCOjldO/ech53
	 iF/Wi6Nn+NLJ93rEFOaoSJskoiI3iCjJKlXX4RNzJBpQUmN+YCSciv6nWnR8VFDjf+Ber
	 Li457qGkwykdzzyJxLlkeEK27rNkmvu8vBFOWNApSOLaEYkxXYBreAhDwioX2+deB2FGQ
	 O68kntLes6VWRY+LGXjohFzh+Iid94zmLd9R0OpfZOMZ/8eq8SYNr+PkWPJAxWPKLaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rH6iUK0m;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D3606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F2D3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rH6iUK0m
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so26254775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323162; x=1794927962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3saG5HUhHWIluByVMXbKrM1wtI4RFxTnUgkKyi8UGJA=;
        b=rH6iUK0mFxC5SYg41GzhxuYBZQ8ZRWjcSicU/E/P8m8aSt+h7sTRxPQlU8JTL0Htoa
         famV4KvT7Ya1jaQwHxAvdsh11CRH8Q/XH9JO5juaj5mz2Evq6ZMk9IgIxAihrMea3Asq
         sCvgCbdDSpSGwKnDNF3CMg+Tm2RTXJL9oRW1ygHosdHUd2qPHC7/FTPQsMVS7Vy9HBpV
         0vQrH6aVsOxYbV+Fkt/NuCfarezXqfwaaQhGGv8rqo5fRR23K+6KON7mge4K4FLeSQdd
         LoGA3Zjxrc95B1/SBVbXyxNmZimu6JyjE5oguXnc0LmmkSOsHCZc/isFlW5A/KyfRF83
         vvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323162; x=1794927962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3saG5HUhHWIluByVMXbKrM1wtI4RFxTnUgkKyi8UGJA=;
        b=SVF2n0DDqYZfoLVJstDPVlECz6UPH9wKgzTHCvq3hqkn36wsqqWyHm5rc4zWenguGB
         7rxxa1f4aKQx8kR6TRqxS2MBoCyioQo1RZ75TNzHDIaiXbVzcM8vzY9dXarz/VG9fKCQ
         4Dd3qaPO04NxTlZPyv8Abfj2lH0aI5eg5ykDbvv1NKeuKGRlhZDLwfJ1YhLeGRJkkZD0
         Ch4vtssRfLGOGEQ8Uq4TcAsB8JY3XtFFu91B1lP+rmlupvPHYOryhe5nD3M9kZnPMjBp
         G6wW7MghAuZMj3BhQYMsBT3qL1mL23HnABOxdWrPA2gO5dsJfZcNxlR4ES7IqDNMhOMR
         iojw==
X-Forwarded-Encrypted: i=1; AL+hErHYVDR2DHAkqUD9fJabu+UqmBVDTxW/aqyICjS27K6pLJKFnMqhNZNPLE+xFQehF4ElTyhmTY09kPyTAi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fJN3JzkT6oklw/6Ax0qEAyUGiXGzJA0EDgy9xQCttro+zTfTp
	nfzVoROeMyFXlmO/cXFXebw5ZfneUhSfos1pDjdPSiGvWz7kQ3KyaoCm
X-Gm-Gg: AYBFou2Ma+SK8HtV7S6W1/HFXl3+BqVPxptUhEPyYJ9azUilRDAvPCVeruOW7nlT2ro
	aoy9cbw+uWDlvq5KKXTPH2L1ATFpnZPoZnrWBClrZyr+v4Psl05XbuFdewgtd4QCv0LmlewpEH3
	qtorTW0xuAtn4iSNLPvParL1+/8wpnj6qNpr3RY1YM9mgqnE24Tqpk3WEk2tpo8VYhlYNoAYy5g
	1cmnwFq/Jx0Lm0kELLjWRPj8Lf3VAHlnSbloW8qbWjBzkUYltupa+vj5NAWbrk3EPR/eb0My2CQ
	8z5v3v8qu4koPkMH0Kt0VNJVCa653s7rFkHPFGxHScfH/CmByJjHxeikmqHP1HI3IUFsPrY0SfH
	d5ItBsFk67mAV5DEinyGheUufa2d8FZBlBKLThd4EvS7gSg/SYBz0Q5RR5pjYs3Juz5GnuVTS/C
	29NALubR8/T75QY6zg7YPCMxgzgePN6GiLh1ISbgRbqmMVLOLU+AnLeY7ZifFd3kXVFggD4NTPA
	Z+GFd5hJR/FcqRaUhkIBc6LOiQpLTxgWsf5nUhEtn1dBmSAI3MMhjbnMhrIeXh3IG1jTfkMmd98
	zfT0vfxkcAWUSYEDfuB8Hn44dao8UMCJmJilFg==
X-Received: by 2002:a05:600c:a013:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4ba0234a040mr51183875e9.11.1794323161530;
        Tue, 10 Nov 2026 07:06:01 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm80488225e9.6.2026.11.10.07.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:06:00 -0800 (PST)
Date: Tue, 10 Nov 2026 15:17:30 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, almagui@kernel.org,
	john.fastabend@gmail.com, qmo@kernel.org, brauner@kernel.org,
	kpsingh@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	emil@etsalapatis.com, ihor.solodrai@linux.dev, sashal@kernel.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH v2 bpf-next 15/18] resolve_btfids: Tag fmod_ret
 candidates as targets
Message-ID: <avM1isGoXgAv47ml@mail.gmail.com>
References: <20261109170550.141443-16-a.s.protopopov@gmail.com>
 <069d59babf1ed531e1a5c1bd4ec0a943f7e8f12fc1e18f0ccc8b4edd032974a0@mail.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <069d59babf1ed531e1a5c1bd4ec0a943f7e8f12fc1e18f0ccc8b4edd032974a0@mail.kernel.org>

On 26/11/09 05:42PM, bot+bpf-ci@kernel.org wrote:
> > resolve_btfids: Tag fmod_ret candidates as targets
> 
> TL;DR: resolve_btfids may tag KF_IMPLICIT_ARGS kfuncs (e.g.
> bpf_wq_set_callback) as fmod_ret targets; the trampoline may then clobber the
> implicit argument, and the kfunc could dereference a garbage pointer.
> 
> > diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
> > --- a/tools/bpf/resolve_btfids/main.c
> > +++ b/tools/bpf/resolve_btfids/main.c
> 
> [ ... ]
> 
> > @@ -1841,6 +1888,16 @@ static int btf2btf(struct object *obj)
> >  		}
> >  	}
> >  
> > +	for (size_t i = 0; i < obj->fmodret_retvals.cnt; i++) {
> > +		const struct fmodret_retval *retval = &obj->fmodret_retvals.retvals[i];
> > +
> > +		if (has_set_func(&ctx.fmodrets, retval->btf_id))
> > +			continue;
> > +		err = add_fmodret_retval_tags(&ctx, retval);
> > +		if (err)
> > +			goto out;
> > +	}
> > +
> 
> Can this loop tag a kfunc with KF_IMPLICIT_ARGS as an fmod_ret target?

Yes, looks like you're right, thanks. Will be fixed.

> 
> The kfunc loop earlier in btf2btf() has already rewritten the BTF
> prototype of such a kfunc through process_kfunc_with_implicit_args():
> 
> 	t = (struct btf_type *)btf__type_by_id(btf, kfunc->btf_id);
> 	t->type = new_proto_id;
> 
> so the BTF FUNC no longer lists the implicit arguments.  fmodret_collect()
> ran before btf2btf() and compared only the return type
> (btf_func_int_return_size()), never the argument count.  The only check
> here is has_set_func(&ctx.fmodrets, ...), which does not consult
> ctx.kfuncs, so the same btf_id still gets "bpf_fmodret" and
> "bpf_fmodret_retval:...".
> 
> bpf_wq_set_callback() looks like a concrete case.  It is built with the
> plugin, has an ftrace call site, and starts with a side-effect free
> error return:
> 
> 	if (flags)
> 		return -EINVAL;
> 	return __bpf_async_set_callback(async, callback_fn, aux->prog);
> 
> so it would get "bpf_fmodret_retval:-22".  The kernel then adds it to
> BTF_KFUNC_HOOK_FMODRET, and bpf_check_attach_target() accepts
> BPF_MODIFY_RETURN through btf_kfunc_is_modify_return().
> 
> The trampoline model is built from the 3-argument prototype.  On x86,
> __arch_prepare_bpf_trampoline() runs the fmod_ret programs and then calls:
> 
> 	restore_regs(&prog, pos_of_slot, nr_regs, regs_off)
> 
> with nr_regs = 3 before calling the original function.  rcx (aux) is
> caller-saved, so __bpf_prog_enter(), the program and __bpf_prog_exit()
> may have overwritten it.  If the program returns 0, which the verifier
> allows, bpf_wq_set_callback() dereferences a garbage aux->prog.
> 
> The same seems to apply to the other KF_IMPLICIT_ARGS kfuncs that return
> int (bpf_task_work_schedule_*, bpf_list_push_*, scx_bpf_*) whenever the
> analysis finds an error path for them.
> 
> Would it make sense to skip retvals whose btf_id is a kfunc with
> KF_IMPLICIT_ARGS in ctx.kfuncs, or any kfunc whose prototype was
> rewritten?  No later commit in the series changes resolve_btfids.
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/42662799554

