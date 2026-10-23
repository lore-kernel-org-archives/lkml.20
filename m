Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739606;
	b=WNKEzeueOi705Ben6weGdF46qkqPFRYp1loTM4zInDwP3GKkU6Arcu5LtAhfeUCSfG1I
	 AFMjpqaU+IMgQ4at7C5H/RupwPa3viodR6hJIbCIhsJjEFUqO4Cl58xfPhNMjgbZPpTnD
	 yKbPBwdsCbt7c2lSmRMomxj8MUuYii03dsl2kzDfWBIklPad3p7BJvdf+uLDSjIpTW1a8
	 BtNuhYSm+TJpEqR5IiDVKte22jXLu/WCCxNlIoiwEQNReIn6qUAFMUnZJ9pAjEdeZKGOO
	 Q7uiVE5p+sFzITAigVeeCZjJEoJ8KKIcoUbWRjrGRE+0eVhZS/KH0+dCZXBGqdRCSOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wq7uJPFcmgA9r58RX9y8WD41guFgFXDdj9tzjsOmuN4=;
	b=NnJJtNUur2M4vIG270TC1+FCZP0ccERnqXz4BcFKxmhd8uK6b/M/Npn0/yFAtF1jtSQd
	 4smkNLdzW5NY6Ea/33KMLQjg2Cvsi+F/sxv5L/PyLDAuS0NmZoQYv3mkHRBRgbQ+VGwke
	 ESvuDJ0pGAa34A2nSJWXbZ6dRHrh35miSRCSt82ASrHiCVeJnCMRuXH2sozMXHhcyqv2B
	 YN5mYcqsCrDMi/irDutEccOMd82+Wxp06mUBtRGLE6qqDyZMt44et2jvjaBDHBFIgOzg2
	 K1JkyYmlV2lViNqHjJwkYKxPD5QPMTok6xxJlBAJD54EuLF1r3EdFoW9LOcn1LWqGmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P+OLg24T;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B2C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B2C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P+OLg24T
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-487049569b6so272028f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739604; x=1793344404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wq7uJPFcmgA9r58RX9y8WD41guFgFXDdj9tzjsOmuN4=;
        b=P+OLg24T2DE6IMHyEqMBpfaLZ19LKpR99sGMlJRmiYlyCBdb0kxRQwF4u/Uew8jBoE
         Kd967OujE2M3LR224GaT+vNY7a6ZVHhrYJaukdiTOprNNmrWe53mJkSvCILgqLFmUbFR
         xAKVDBE62GKFuNc4XlUB0vJSlY8sWaBxty6dB2u00s2qirUGX8n35La49WgHBOgYh7wn
         o5YV8/MG448i6CwxxFKntlyeREqUinFv328e9m465xH8Mu84saZRUnUVglkRJmqlz5bA
         uPmq6WOxIxjriPMmY9rWdzTIfjkHiONHvkGU/mtHlDPEfQiHG1ckLYBc+S6X/Fbln8qO
         yQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739604; x=1793344404;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq7uJPFcmgA9r58RX9y8WD41guFgFXDdj9tzjsOmuN4=;
        b=Bp53qy/Yi+dXRE4atlQepTgixIcuYcHK2szuYuUen7kqVzwXVzqqNA+D6Dvm1h5b9k
         8HXc4YavHFyDrSfIOUF1PWebypPCJKHR6PQfUBn2ZPy/jsbkxd4pDVz7aqc6ctSmySUr
         dJkw7TcjwogqZoOFiNNRYycl6gRNBtIhBeGcUC1+nNz1c+JSZq8jBwWRXPLI0Rdhx7OK
         t7oSjlEHWEGrzrKWZEz1YXi/1qMdtu+PF1eKXC2aVzuvG+qGqXjt0Ye3fLQASbHeLAve
         JU3ReA1c/PMf4QkBvZtk/n0sJRliuvjzTLQDTO+8u7fR2BUC5kCSK10+CV7vWuPOYy1f
         Lf/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxtFAV72QlTrVuuyDqr6pr++gD/Vo0nbmu7/TIM0kVzrZz8Ds4KrJE/Ugzdb6oXyHeNS1dL7PK+/7+uwog=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpdcrtgbRDOKsWhZaOLG1roMHrztRRwY0pCy5HkYH+kyiUlnVa
	mtQZsJgc/jkgjQoM+PgPt6iRZhus9BDTcsh2Kc/XKYUwnQ9faz7kbpd4
X-Gm-Gg: AYBFou3ePxAZGz3ba95eCQnDbHDNF9DPQ+Diw8+Gz6DDhyGXr7NLmpZfWu8yynW4wSa
	oI7Iz294yXM6EGZJ6kpuZDz0pCdys4wwubFRO6P25FeugymMPYu4fPiyDmPHtg3sd2rpVNokqMB
	VH6d8/iZ1M4TCR1xo71a0l4hLwGBkmQmeZQrVGwJkyEQw8/s+W+6LNFCOXzcQA6WqdMgE9fOlPQ
	ltarhF24CTAT7/neeYsuEg+jiqBvwHe/dMRdh4/0uJrR1W5afgxG8eq+DNfky7AXYvGPD/RTSif
	0yQUAtkUCrfpF5DBxjlQTV4n08Xi+d6tFTNhAL2C20nQYNpfOlEAibBZSC9AnM37v4Xnfy+qcDK
	e4ynjd6kbUzaUrpDoaFRSBwKDtGQh7mx+60LJVlwxKZ4Cnoz88an7NsYuk+ta1nzOfc5oxPrW8x
	feGdtVlwe37XSrP29Z3MERwo8CDltLOQHUT2AmtxjzzsG5wVwj+F7IsYS9IZZ/QwAmZiw9S7paq
	OKUTyqJ6PniHy6VU8PqloWSx2Nr
X-Received: by 2002:a5d:5d03:0:b0:48e:3b48:6f1 with SMTP id ffacd0b85a97d-48e3b480974mr340715f8f.54.1792739604164;
        Fri, 23 Oct 2026 00:13:24 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::25dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025d76sm3155877f8f.13.2026.10.23.00.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:13:23 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 23 Oct 2026 09:13:21 +0200
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, oleg@redhat.com,
	peterz@infradead.org, mhiramat@kernel.org,
	akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org,
	surenb@google.com, david@kernel.org, vbabka@kernel.org,
	jannh@google.com, hughd@google.com, kees@kernel.org,
	mingo@redhat.com, tglx@kernel.org, x86@kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 4/9] uprobes/x86: Don't WARN if an optimized
 probe can't be written
Message-ID: <atsJEWXk04C4oz4R@krava>
References: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
 <20261022015712.1297331-5-alexei.starovoitov@gmail.com>
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
In-Reply-To: <20261022015712.1297331-5-alexei.starovoitov@gmail.com>

On Thu, Oct 22, 2026 at 01:57:07AM +0000, Alexei Starovoitov wrote:
> From: Alexei Starovoitov <ast@kernel.org>
> 
> __arch_uprobe_optimize() and set_orig_insn() do WARN_ON_ONCE() when
> uprobe_write() fails, and user space can make it fail:
> - -EINTR from get_user_pages_remote() when current is being killed.
> - -ENOMEM when COW can't be broken, since memcg is at its limit.
> - -EINVAL from __update_ref_ctr() when the process cleared the semaphore
>   of SDT probe.
> 
> Kill the processes that call probed nop10. It warns in 8 of 8 runs:
> 
>   WARNING: arch/x86/kernel/uprobes.c:1186 at arch_uprobe_optimize+0x291/0x3a0
>    uprobe_notify_resume+0x1c3/0x4c0
>    exit_to_user_mode_loop+0x63/0x4e0
>    exc_int3+0x1f3/0x250
> 
> The next patch calls set_orig_insn() from fork(). Kill the processes that
> fork and keep mmap_lock busy, while a trace event on nop10 is enabled and
> disabled. The kernel with the next two patches and without this one warns
> in 3 of 3 runs. The whole series in 0 of 3:
> 
>   WARNING: arch/x86/kernel/uprobes.c:1161 at set_orig_insn+0x161/0x170
>    register_one_mm+0x154/0x180
>    uprobe_dup_mmap+0x61/0xb0
>    dup_mmap+0x149/0x9f0
> 
> The callers handle the error. arch_uprobe_optimize() marks uprobe as not
> optimizable and byte 0 stays a breakpoint. set_orig_insn() returns
> the error. Drop both WARNs.
> 
> This depends on the previous patch. Without it WARN was the only sign of
> the bytes that set_orig_insn() cannot restore. Hence no Fixes tag.
> 
> Signed-off-by: Alexei Starovoitov <ast@kernel.org>

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka


> ---
>  arch/x86/kernel/uprobes.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
> index 62bbe41c6466..33c35bf07801 100644
> --- a/arch/x86/kernel/uprobes.c
> +++ b/arch/x86/kernel/uprobes.c
> @@ -1170,11 +1170,8 @@ int set_orig_insn(struct arch_uprobe *auprobe, struct vm_area_struct *vma,
>  		int ret = is_optimized(vma->vm_mm, vaddr);
>  		if (ret < 0)
>  			return ret;
> -		if (ret) {
> -			ret = swbp_unoptimize(auprobe, vma, vaddr);
> -			WARN_ON_ONCE(ret);
> -			return ret;
> -		}
> +		if (ret)
> +			return swbp_unoptimize(auprobe, vma, vaddr);
>  	}
>  	return uprobe_write_opcode(auprobe, vma, vaddr, *(uprobe_opcode_t *)&auprobe->insn,
>  				   false /* is_register */);
> @@ -1197,7 +1194,7 @@ static int __arch_uprobe_optimize(struct arch_uprobe *auprobe, struct mm_struct
>  	if (IS_ERR(tramp))
>  		return PTR_ERR(tramp);
>  	ret = swbp_optimize(auprobe, vma, vaddr, tramp->vm_start);
> -	if (WARN_ON_ONCE(ret) && new_mapping)
> +	if (ret && new_mapping)
>  		WARN_ON_ONCE(do_munmap(mm, tramp->vm_start, PAGE_SIZE, NULL));
>  	return ret;
>  }
> -- 
> 2.55.0
> 
