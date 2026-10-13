Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143D350256D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897230; cv=none; b=odHtst3zgYd5Fzm/5d+/+pCHqFyh95V8bRsmw94YB6csbJbyUu4bGLaemeVnWTgLbTcRtnyxeKnAOEQRx1ldzBatVo+hnB5BGHa3ksAYdBaEUrrNyNNYXy3zwJ3NKqtr0nVSzfCDTjgtOgQoiEOifmHpkLHCyHgMYLKs3Lo/ZFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897230; c=relaxed/simple;
	bh=dSn2YOK/o5zN/fFQVZ5JWu5zrl6iCtrtE0xyPG5sprc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Twz74pBltKeY/CnzpWBATh4DLBlu55URa/uxDpdL0ZIsYudrDjBPWePh8JhMxUyzWgonKKqoSeBqGRJyHmG9yUnRfhRCiTJDQzJg8jPdTHFK3VgKqu12j++fUmRlYULzzQu1aK5/kVFYVGn13kc54Ii8GtqYlWPhKwnz6IYZDbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBT8ykL1; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBT8ykL1"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0a28a720aso16174127b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791897228; x=1792502028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I/tAlO2Ru2n+9OCc1aJaId+5L7PReTvcGlCIUg5MWD8=;
        b=VBT8ykL1s0CrYvt+YCR8ZxvCo8ATKo5yCfpU/yztKtof4v9hkKt4xrpL+JUvUG/S71
         +ZN8EEf9hSv9mZF4vgfmaE75NOE2Ad2QsfFBJIZuNqu8yI2rorLvv9YwQWPwiuxzAPgH
         MXZD3JwBmhnkyerr5TW8deQgp7teq2yo2GKEe87yYGQbL+HeqY3KsAxnI7pRfZg2sn8A
         CyUTdyoIVfhyFH9aLyJnsOFtZ7WReSb73MdFicMv8o8+ma+4q4e8zX2JRVL4BgUnSn5B
         yMqMj5rTWl/3utuE1Yhs67wzlooD5x49V0CgO/Z3/eGCPErQUTe9OY9eSxO18fEePZQN
         Yrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897228; x=1792502028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/tAlO2Ru2n+9OCc1aJaId+5L7PReTvcGlCIUg5MWD8=;
        b=NPtHlEfS/mcIjSWJUYv/QVSwoXF5u0FUIsTFvz9FvVA3FHP16cLFJ7hSdLtumlN9OV
         lVC0HiUmEwiepCZ64YxZapn4FR53NsOJr4pmB8PDUQM5ujrRixztPknEM38FrUEBgEpN
         A8sU1Ej0d9uDy8VAM5pLc5hyYVl8oz8i0oHa2o0hlZTNeoTZL2PYOHVANgjPd7XW0FaF
         ncHNzjYIcmeA2WZlaBlRgdGg5e0Fnw/yNFcjOxs/+Q4MznxGoKpyx+mS1uwZzLlEdVh3
         OUUUQCDRROSgHB5KNWsQ24no/2ZYmgBTe58iQf2aWuFzoXLEMNx8Map6+45/KL015cGX
         Gs8w==
X-Forwarded-Encrypted: i=1; AKwUvBzXDF3Qeyr9d/JZ3r11RZqZk+OiqUnH1sfAIFSJyRes3AHRAQRMbv7gsMCkIxhgG4dBndXSTlec3B8xdII=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM7mQ09JXixe11C7Lbm+vcm/gymo3ca+ejoYk8uwduczf3J/z0
	LJG07n9QEXrnNL9KOUimKd5JRSqBsYScZEON6JF8mSpqcvrbso+wtYPO
X-Gm-Gg: AYBFou0sy1yaNaII2rtuHjRF+K0Qjsj//kgcfYTi56b+39Lk7ZZIcq7LLOZ8Yo2sXIK
	ng+zcSYoecA30uaYenS12hAbzH7k4opNjM3jZy1kJFXC3p7psXUcoM5Hd3JLa3uT4W1uElMqNrB
	ZPNLKb/XjfWzsIbdM18WUnNQpQwr3AN/e48T8VL4tbrLIHE1UZ3yI7814slINzUSuT5yEQ0EsaZ
	HIesnMHkhvJfA1Id765z109z/HeL4dDbXzEKIoNVD5BlZ4R2pSWGBzhc0uoFPXhtvc6/GU+VQ0F
	cJI2hT3+cOf8b3O9r4eoOactBBp9bITcHBmRnQct0hkpsof/sE3A7MEeweduN43dn0utzNmoF+/
	InL1D55gnhel9Zd967x4IjpaU/l1PRXultO9xCnJfGP0lTnGqa5GVDk0sacAUVmA4jy5he1JX/l
	ZRJXNvSO1osVqZizgFi2q3ikSEkolcuR4SeCz2XQ0IzHAEjBRxfT1sIabNHL/Ew7jNMy/Mh6Zef
	Q1YI2/8xvWMpnhwt/tTwl7uoIXifosK3YTcdEOhHmbW
X-Received: by 2002:a05:690c:a4d8:b0:873:5c7b:c102 with SMTP id 00721157ae682-8b07ee83c2dmr39395797b3.58.1791897228016;
        Tue, 13 Oct 2026 06:13:48 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1b8ab5sm44012217b3.17.2026.10.13.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:13:47 -0700 (PDT)
Date: Tue, 13 Oct 2026 18:43:37 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Michal Suchanek <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>, 
	"Bernhard M. Wiedemann" <bwiedemann@suse.de>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc: Restore all registers after a traced
 syscall again
Message-ID: <as4rwq7OXutW3Wa6@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <4c1da7f31a6603455ec452960af529e4d77f5334.1791826411.git.msuchanek@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c1da7f31a6603455ec452960af529e4d77f5334.1791826411.git.msuchanek@suse.de>

On Mon, Oct 12, 2026 at 07:38:28PM +0200, Michal Suchanek wrote:
> From: Bernhard M. Wiedemann <bwiedemann@suse.de>
> 
[...]
> +/*
> + * Syscall work after which the exit must reload all registers from
> + * pt_regs: a tracer may have changed any of them at a syscall or seccomp
> + * stop, or under PTRACE_SYSEMU. Audit and the tracepoint are included to
> + * keep the pre-GENERIC_ENTRY behaviour.
> + */
> +#define PPC_SYSCALL_WORK_RESTOREALL	(SYSCALL_WORK_SECCOMP |		\
> +					 SYSCALL_WORK_SYSCALL_TRACEPOINT | \
> +					 SYSCALL_WORK_SYSCALL_TRACE |	\
> +					 SYSCALL_WORK_SYSCALL_EMU |	\
> +					 SYSCALL_WORK_SYSCALL_AUDIT)
> +
Hey Michal,

Thanks for this.
I would prefer this to be in thread_info.h if it's not creating any
cyclic dependency or any other issue.

Regards,
Mukesh
>  /*
>   * This should be called after a syscall returns, with r3 the return value
>   * from the syscall. If this function returns non-zero, the system call
> @@ -117,9 +129,9 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>  		regs->gpr[3] = r3;
>  	}
>  
> -	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> +	if (unlikely(READ_ONCE(current_thread_info()->syscall_work) &
> +		     PPC_SYSCALL_WORK_RESTOREALL))
>  		ret |= _TIF_RESTOREALL;
> -	}
>  
>  	syscall_exit_to_user_mode(regs);
>  
> -- 
> 2.51.0
> 
