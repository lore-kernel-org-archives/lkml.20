Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84A37A85B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693514; cv=none; b=RcdDgS3hN48PclGecD4TvRusFXP55dMN4cQczafWNjQeJDHzWx6V3AopIVk8wYtcDn8o1tOzQXlU00DF8kNWkn/6EtXFV6j0QiSUdA21JwOoIUzwemMUhJrHRj2zX9rhoZukskKjlRYgN7D6DPCvgZK77dMX0YAOGQkf0lA8D90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693514; c=relaxed/simple;
	bh=j2rehNhGzbbVg012X8emIbS0OZcDIEKmHWgB+ZLmCRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=munxDLT1j47rW6b/uK6IrtZPr0+hvzVB1Xq+GTml8XZWP26khypiKoOue9hAtzXzEC2HNZuZtzX7ewOXOCniOovmzcmrZuBFPN7PW5pxKCJXlgvo5OhC/lnoKERbofae7Kv2T/Pyu6yav/8Q23K+/EHsh5x7v9nUNiqr+vuZXo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bobrowski.net; spf=pass smtp.mailfrom=bobrowski.net; dkim=pass (2048-bit key) header.d=bobrowski.net header.i=@bobrowski.net header.b=YDkmzPjY; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bobrowski.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bobrowski.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bobrowski.net header.i=@bobrowski.net header.b="YDkmzPjY"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-470417e5b52so248014fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bobrowski.net; s=google; t=1789693506; x=1790298306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=luKWt0kKmWjdQ8jTRpB2Q7txnP5JpBdLjM73GX2ZxbI=;
        b=YDkmzPjYCBQL8f70e3DsLAYmJKZTsdk9HXOk/JelhYR8ZIxiP11s437PnfLqXn1X1Y
         M4fi9v4ORtfyxA4pjgSkDL4ZJVgve8gceWTf0sgqiaojA8Bhp75vtyAemlP3PCt+v15d
         P1Gg8W9eBAKXx7ZNXsyGHSSzttDW+9MKyXTXBpJPfhTWada2sc5mXhM7Cx67unYJC3nA
         0FlgTC9xkIVvPYQ6K/tw6JXOVMZCx8WJLetEhunPIVvy/Evl48A+XWA+aDmnt8/ItX05
         /hKl+4JYUuY0XJHYjH3XnqQ9cVvMvDr1zjGjq3OHtcgIu+eBIrEG9Ig6Ys5H0Fh7DuM7
         2+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789693506; x=1790298306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=luKWt0kKmWjdQ8jTRpB2Q7txnP5JpBdLjM73GX2ZxbI=;
        b=E2NZTYr3cUeYDfADKHfPdsSqgFzs+DUEFYvoSqFLQGoFewt24aSN+Pr1tMbRNIRvS/
         gExj5o6hh6r9MitUlt/EcEeoRfAEpLlA9Mt5ksE3GvYqeTx/8HKDtU0I3TfKME3QL0ca
         rwOzB6X9+4O6hekB5RlOyVqxSvr+/wQI6H3ApkTnGaRfmV8aIM7opWmVwPeM+OJwpK9T
         q44DHGdaqpfIeCDtlhWPjkD4NAX45aKXlVDzGa/WM4hhkGBiCm3woC1jxIvkgQm/vb6U
         ojJm5Q1+dUPfhi3FW51TwsmJ0dD+KJ83/Qy2gK1mYTDBk4uAFZshfT1qaq1dD4q8Ec8G
         k3RQ==
X-Forwarded-Encrypted: i=1; AKwUvByuHThVa72q5FfBTeq/qD5Q2Adoapfx0IxJuK9/vbBkl0OzlUgPf1OPo8lxdsY1p/rFEg7N3UYFAsJKqC4=@vger.kernel.org
X-Gm-Message-State: AFuF++mICHwsRQ6jVTaAvqXXSDzOa01nSgjgYlDHuaaa5w18mQq+cRp/
	h3MyD3tuSMS/m/vN2dcCKaw8aIDKvCl0dwBIDEa76dl3PRBEBCayHhEfp/RgX428QEfv
X-Gm-Gg: AYBFou2zvNaa2h39AjLVOkup7dKdhbl5eU2YSvkm0jBvi9p4vAfre2d3dkbIq4oLT1S
	Smc4LaGsGANxsB5e6kH7O40TcaRvUgUYC4f6OTYiswqCsncHfW6dqq+hbp+RKmMyv+YFRZb3P7C
	caRaow6geB72QgAn6Ab2+ZbhW0fPfnFoARISocRiHPtPn4pJQFwBQGbWi6QcfJ6JHwu1LKJ7Z+F
	1mvr+16qo20lLaGXGqwQITQmz7OyV6eXvBh5zPEYj+JBALK0xzQPFw6HXB5MNoO4pb+J170ztrp
	+F6dX6epLt73Xa+3bl5VPofhIgBpx6qOC4JaIJbijoBTq42ap0ZN1Ye0zAmJVSlt6jR+nrblZb7
	f/JbkrXDsHHxdeDvikm6Y3kYpJLXJv328TOy/SqAgCfoRRcnDZOoA+6C60D5q1Qp2btUiYGeIuc
	9PHw7B4IU1FhRoGXu0aqqzfVDiHcPHOT/FMjWTsxjtcik=
X-Received: by 2002:a05:6820:2019:b0:6bd:5506:aae0 with SMTP id 006d021491bc7-6ca9a748585mr824155eaf.22.1789693505875;
        Thu, 17 Sep 2026 18:05:05 -0700 (PDT)
Received: from lima-development ([75.104.94.190])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4870b53dfdasm343751fac.11.2026.09.17.18.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:05:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 21:04:37 -0400
From: Matt Bobrowski <matt@bobrowski.net>
To: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
Cc: bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, david@kernel.org,
	akpm@linux-foundation.org, andrii@kernel.org, ast@kernel.org,
	brauner@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com,
	kpsingh@kernel.org, ljs@kernel.org, memxor@gmail.com,
	song@kernel.org, sun.jian.kdev@gmail.com, utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH bpf-next v7 3/5] bpf: Add user memory access kfuncs for
 mm_struct
Message-ID: <aqyOJVeiJrglQ7Up@lima-development>
References: <20260915080255.48929-1-tasos.papagiannnis@gmail.com>
 <20260915080255.48929-4-tasos.papagiannnis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915080255.48929-4-tasos.papagiannnis@gmail.com>

On Tue, Sep 15, 2026 at 11:02:53AM +0300, Anastasios Papagiannis wrote:
> On CONFIG_MMU kernels, when security_bprm_check() runs, the argument and
> environment strings for the exec have been copied into bprm->mm. The new
> address space is not associated with a task_struct until exec_mmap(), so
> existing BPF user memory helpers cannot access it.
> 
> Add bpf_copy_from_user_mm() and bpf_copy_from_user_mm_str() kfuncs. Both
> take a struct mm_struct pointer directly, allowing callers to access
> trusted address spaces that are not associated with a task_struct.
> 
> bpf_copy_from_user_mm() has similar semantics to
> bpf_copy_from_user_task(). bpf_copy_from_user_mm_str() copies one
> NUL-terminated string and returns its size including the NUL terminator.
> It accepts BPF_F_PAD_ZEROS to clear unused destination bytes on success.
> 
> Refactor the task-based helpers and the new mm-based kfuncs to share
> static internal implementations. The task-based interfaces validate their
> arguments before acquiring and holding a reference to the task's mm for
> the copy. No behavior change is intended for the existing task-based
> interfaces.
> 
> Register both new kfuncs and mark them KF_SLEEPABLE because accessing a
> remote address space can fault.

Thank you for employing my suggestions. I think this looks much better to me
now. Feel free to add:

Reviewed-by: Matt Bobrowski <matt@bobrowski.net> 

> Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
> ---
>  kernel/bpf/helpers.c | 130 +++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 118 insertions(+), 12 deletions(-)
> 
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index 051b6654e57c..f6b3eee6098a 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -679,9 +679,44 @@ const struct bpf_func_proto bpf_copy_from_user_proto = {
>  	.arg3_type	= ARG_ANYTHING,
>  };
>  
> +static int __bpf_copy_from_user_mm(void *dst, u32 size,
> +				   const void __user *user_ptr,
> +				   struct mm_struct *mm)
> +{
> +	int ret;
> +
> +	ret = access_remote_vm(mm, (unsigned long)user_ptr, dst, size, 0);
> +	if (ret == size)
> +		return 0;
> +
> +	memset(dst, 0, size);
> +	/* Return -EFAULT for partial read */
> +	return ret < 0 ? ret : -EFAULT;
> +}
> +
> +static int __bpf_copy_from_user_mm_str(void *dst, u32 size,
> +				       const void __user *user_ptr,
> +				       struct mm_struct *mm, u64 flags)
> +{
> +	int ret;
> +
> +	ret = copy_remote_mm_str(mm, (unsigned long)user_ptr, dst, size, 0);
> +	if (ret < 0) {
> +		if (flags & BPF_F_PAD_ZEROS)
> +			memset(dst, 0, size);
> +		return ret;
> +	}
> +
> +	if (flags & BPF_F_PAD_ZEROS)
> +		memset(dst + ret, 0, size - ret);
> +
> +	return ret + 1;
> +}
> +
>  BPF_CALL_5(bpf_copy_from_user_task, void *, dst, u32, size,
>  	   const void __user *, user_ptr, struct task_struct *, tsk, u64, flags)
>  {
> +	struct mm_struct *mm;
>  	int ret;
>  
>  	/* flags is not used yet */
> @@ -691,13 +726,16 @@ BPF_CALL_5(bpf_copy_from_user_task, void *, dst, u32, size,
>  	if (unlikely(!size))
>  		return 0;
>  
> -	ret = access_process_vm(tsk, (unsigned long)user_ptr, dst, size, 0);
> -	if (ret == size)
> -		return 0;
> +	mm = get_task_mm(tsk);
> +	if (!mm) {
> +		memset(dst, 0, size);
> +		return -EFAULT;
> +	}
>  
> -	memset(dst, 0, size);
> -	/* Return -EFAULT for partial read */
> -	return ret < 0 ? ret : -EFAULT;
> +	ret = __bpf_copy_from_user_mm(dst, size, user_ptr, mm);
> +	mmput(mm);
> +
> +	return ret;
>  }
>  
>  const struct bpf_func_proto bpf_copy_from_user_task_proto = {
> @@ -3659,6 +3697,68 @@ __bpf_kfunc int bpf_copy_from_user_str(void *dst, u32 dst__sz, const void __user
>  	return ret + 1;
>  }
>  
> +/**
> + * bpf_copy_from_user_mm() - Copy data from an address space
> + * @dst:             Destination address, in kernel space
> + * @dst__sz:         Number of bytes to copy
> + * @unsafe_ptr__ign: Source address in the address space
> + * @mm:              Address space to copy from
> + * @flags:           Reserved for future use; must be zero
> + *
> + * Copies data from the user address space associated with @mm. The destination
> + * is zeroed if an attempted copy cannot be completed in full. Unsupported
> + * flags return -EINVAL without modifying @dst.
> + *
> + * Return: 0 on success, -EINVAL if @flags is non-zero, or -EFAULT if the copy
> + * fails or is partial.
> + */
> +__bpf_kfunc int bpf_copy_from_user_mm(void *dst, u32 dst__sz,
> +				      const void __user *unsafe_ptr__ign,
> +				      struct mm_struct *mm, u64 flags)
> +{
> +	if (unlikely(flags))
> +		return -EINVAL;
> +
> +	if (unlikely(!dst__sz))
> +		return 0;
> +
> +	return __bpf_copy_from_user_mm(dst, dst__sz, unsafe_ptr__ign, mm);
> +}
> +
> +/**
> + * bpf_copy_from_user_mm_str() - Copy a string from an address space
> + * @dst:             Destination address, in kernel space. This buffer must be
> + *                   at least @dst__sz bytes long
> + * @dst__sz:         Maximum number of bytes to copy, including the trailing NUL
> + * @unsafe_ptr__ign: Source address in the address space
> + * @mm:              Address space to copy from
> + * @flags:           The only supported flag is BPF_F_PAD_ZEROS
> + *
> + * Copies a NUL-terminated string from the user address space associated with
> + * @mm. If the string is too long, @dst is still NUL-terminated unless @dst__sz
> + * is zero.
> + *
> + * If the flags are valid and BPF_F_PAD_ZEROS is set, the unused portion of
> + * @dst is cleared on success and all of @dst is cleared on a copy failure.
> + * Unsupported flags return -EINVAL without modifying @dst.
> + *
> + * Return: The number of copied bytes including the NUL terminator on success,
> + * or a negative error code on failure.
> + */
> +__bpf_kfunc int bpf_copy_from_user_mm_str(void *dst, u32 dst__sz,
> +					  const void __user *unsafe_ptr__ign,
> +					  struct mm_struct *mm, u64 flags)
> +{
> +	if (unlikely(flags & ~BPF_F_PAD_ZEROS))
> +		return -EINVAL;
> +
> +	if (unlikely(dst__sz == 0))
> +		return 0;
> +
> +	return __bpf_copy_from_user_mm_str(dst, dst__sz, unsafe_ptr__ign,
> +					   mm, flags);
> +}
> +
>  /**
>   * bpf_copy_from_user_task_str() - Copy a string from an task's address space
>   * @dst:             Destination address, in kernel space.  This buffer must be
> @@ -3682,6 +3782,7 @@ __bpf_kfunc int bpf_copy_from_user_task_str(void *dst, u32 dst__sz,
>  					    const void __user *unsafe_ptr__ign,
>  					    struct task_struct *tsk, u64 flags)
>  {
> +	struct mm_struct *mm;
>  	int ret;
>  
>  	if (unlikely(flags & ~BPF_F_PAD_ZEROS))
> @@ -3690,17 +3791,20 @@ __bpf_kfunc int bpf_copy_from_user_task_str(void *dst, u32 dst__sz,
>  	if (unlikely(dst__sz == 0))
>  		return 0;
>  
> -	ret = copy_remote_vm_str(tsk, (unsigned long)unsafe_ptr__ign, dst, dst__sz, 0);
> -	if (ret < 0) {
> +	mm = get_task_mm(tsk);
> +	if (!mm) {
>  		if (flags & BPF_F_PAD_ZEROS)
>  			memset(dst, 0, dst__sz);
> -		return ret;
> +		else
> +			*(char *)dst = '\0';
> +		return -EFAULT;
>  	}
>  
> -	if (flags & BPF_F_PAD_ZEROS)
> -		memset(dst + ret, 0, dst__sz - ret);
> +	ret = __bpf_copy_from_user_mm_str(dst, dst__sz, unsafe_ptr__ign,
> +					  mm, flags);
> +	mmput(mm);
>  
> -	return ret + 1;
> +	return ret;
>  }
>  
>  /* Keep unsigned long in prototype so that kfunc is usable when emitted to
> @@ -4925,6 +5029,8 @@ BTF_ID_FLAGS(func, bpf_iter_bits_new, KF_ITER_NEW)
>  BTF_ID_FLAGS(func, bpf_iter_bits_next, KF_ITER_NEXT | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_iter_bits_destroy, KF_ITER_DESTROY)
>  BTF_ID_FLAGS(func, bpf_copy_from_user_str, KF_SLEEPABLE)
> +BTF_ID_FLAGS(func, bpf_copy_from_user_mm, KF_SLEEPABLE)
> +BTF_ID_FLAGS(func, bpf_copy_from_user_mm_str, KF_SLEEPABLE)
>  BTF_ID_FLAGS(func, bpf_copy_from_user_task_str, KF_SLEEPABLE)
>  BTF_ID_FLAGS(func, bpf_get_kmem_cache)
>  BTF_ID_FLAGS(func, bpf_iter_kmem_cache_new, KF_ITER_NEW | KF_SLEEPABLE)
> -- 
> 2.55.0
> 
