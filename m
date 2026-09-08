Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E9152ED32
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868639; cv=none; b=Q5qEndo3Erq9BjEeG7LRHdJNT7kW3OVHsEfQR7FQQP0EaOA/OWIaTLNCgKMXeAVkA6D8FNPwcVcjvWv3frKiB81+0r/wtfN6QNU773CZsgvZEyCmMtQneUoKBtOopGxANYPTZOAmqFPmCOIhoeL7rhxtHgA8JbAeKXIXFSFa9uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868639; c=relaxed/simple;
	bh=nZX2MgBOwUo7gspy1IGhQhdI/3I1oLxQPNIFLmYD3zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dc9UuhU8UC1LwILrJ4M8TJtnKPJY6bDCvPe9CVOp/RNpZvIr8EM/I7V96HD3z2FamiGSIo+U45ltWCZW6dj4HpbP752xtH0g26Pp/qUpKp4+EQQuEQc5VUft+GAQmiA1KEj40tn7q7RHzNvpDOM/wKfGzH/HaJQfA/I6MMkty74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bobrowski.net; spf=pass smtp.mailfrom=bobrowski.net; dkim=pass (2048-bit key) header.d=bobrowski.net header.i=@bobrowski.net header.b=pNVWoDI6; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bobrowski.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bobrowski.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bobrowski.net header.i=@bobrowski.net header.b="pNVWoDI6"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c79c9f7b54so2352409e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bobrowski.net; s=google; t=1788868636; x=1789473436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGzdGIl2437Zrr1mgAS/9CkFREf8A7GElbXp8vqEddU=;
        b=pNVWoDI6C5zZDT3dJPifjP8Jc7WtJAhlDx7YH4tQgY2oKBlUdxqQ0FEaa2gcCPRC1t
         fQWro6C9HpHLMbKusnJyjQMLn5qUKAZNbI0HtAT70W0oGs0zPCNhxGBR99uix/JO41w8
         Vyei29vl9Q2LJeFgIu6oP6VDIZ3Td4fbziZTH6Dwa+LrXjyHPfwc6ePJzIyw4K0yo7Qi
         obvblB/QpAwscQAXGgkfK5k+BHqaQmFkPjWkihUjW6PZ8RgCZs1oWNeEXiopmByxeLo0
         Q+Ag99FyxiLhLNRQYCsYyhRu5ldnqIoksxPMIy5WCKO1TzxwMsdWPr/tsAJCL6mWUp4t
         BCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868636; x=1789473436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGzdGIl2437Zrr1mgAS/9CkFREf8A7GElbXp8vqEddU=;
        b=jLfwP7uXepZ3KEYcpanyfG/4TD30k+9vrNDe14mkJHk7JDZPv5ji6gUJg3UwFHCzzb
         AQSoCEOWqHZVguk/xc4mk2l/7/TFI1th1FBZZD/vw5j2HjgCDVuBZoRMs6ACgXk8chvJ
         oUxA/fYrWgrCgv+Ff9SKcfQa+9A9mUISR74wxosEw4gADRxLHA3Iwc4FMgtlXMulxuhr
         4ZUehmts2VLKr6GfjRQm9TXy8tDnhLv089qCjLuct+cQf5xVn15MFC3KVSB2TAgffHkV
         Bm7qNX0OpGe4hBNtvcdut7P7qfMfZPvnxlfdBsrZ4lI+UGj8W8BUrlVEKr6afO4TNl/+
         ZuDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZWCPRW6BeNoTKkwPirhDjesDNJbaZJNL+f7W8d8tMYQRqQEeWfCWhLfn72ybuxJNcStFC7J/qQsB7WqA=@vger.kernel.org
X-Gm-Message-State: AFuF++n8CJ3HV767GpFyVJGjrG2u/haKEsW4NIx6JaAkkp/LiwWBTxWq
	mURKbLgo6CEqrUbaFNOAvaC55IEcph1+Pz/ZmlqBRqXeqQvJDay0ntZ4jky8Es6YsHo/
X-Gm-Gg: AYBFou1DJaZuShqct394i/0z/WBDBx1VMM2dSAlKd/zKmBJPdn1jJ26RT/cqwJMLj1v
	iNy4/PSCorYmZi8Jl1vcxGoQBUTD+a/fiDP/zhQXQxZ+7nbA4A+bDSwHjgr/mE5YfX3txf1swdI
	q1/yX0VVn20+5qPCzb9gNdoruNnGaYqHFBATJWgYooDn/9qPjnNdz7Lpzn42pSralzqujMa9O18
	QS74SlFpZgU/i9o1RQT/M6b/3BSVZsnnIMQtO9NHL2sNa6kSknTlw/43cbmLmokZAW65fMh2MGp
	jsQkfrOpjFuRsGN9RfWsPt/5eUJdVIgwR70V9cPhKylu9p+k3HBYOQHVz+twXVqePO/Ny2bNnOt
	wC4HBOVC1QKvG35PHimv9SGHeG6+0DkRLUfCCAZ8DySBxlTzkt4OlGBB0J7EA5xxFg+Z/x4acEa
	YdX3KOnDfumSBLCdkrvodz5uExl/NMwn7Mo76+h8bvUBq+YKDJoiyFzgKshzJ53d8lBweuE1YcX
	ovYkAib6dQeiKRU31b5MU4lbUluHELRd5BgADN0
X-Received: by 2002:a05:6102:41a9:b0:784:4d38:ef58 with SMTP id ada2fe7eead31-78a4a57f683mr9329411137.0.1788868631172;
        Tue, 08 Sep 2026 04:57:11 -0700 (PDT)
Received: from lima-development (163-53-146-23.ip4.superloop.au. [163.53.146.23])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae301fsm8384438137.7.2026.09.08.04.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:57:10 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:56:53 +1000
From: Matt Bobrowski <matt@bobrowski.net>
To: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
Cc: bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, david@kernel.org,
	akpm@linux-foundation.org, andrii@kernel.org, ast@kernel.org,
	brauner@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com,
	kpsingh@kernel.org, ljs@kernel.org, memxor@gmail.com,
	song@kernel.org, sun.jian.kdev@gmail.com, utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH bpf-next v5 3/7] bpf: Add user memory access kfuncs for
 mm_struct
Message-ID: <ap_4Bf61N4AtZWB2@lima-development>
References: <20260907165220.52431-1-tasos.papagiannnis@gmail.com>
 <20260907165220.52431-4-tasos.papagiannnis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907165220.52431-4-tasos.papagiannnis@gmail.com>

On Mon, Sep 07, 2026 at 07:52:16PM +0300, Anastasios Papagiannis wrote:
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
> Refactor bpf_copy_from_user_task() and bpf_copy_from_user_task_str() to
> acquire the task's mm with get_task_mm() and delegate to the corresponding
> mm-based implementations. No behavior change is intended for the existing
> task-based interfaces.
> 
> Register both new kfuncs and mark them KF_SLEEPABLE because accessing a
> remote address space can fault.
> 
> Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>

A couple nits here.

> ---
>  kernel/bpf/helpers.c | 142 ++++++++++++++++++++++++++++++++++---------
>  1 file changed, 113 insertions(+), 29 deletions(-)
> 
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index b3cc5c8fc875..d3c564437ad0 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -32,6 +32,10 @@
>  
>  #include "../../lib/kstrtox.h"
>  
> +__bpf_kfunc int bpf_copy_from_user_mm(void *dst, u32 dst__sz,
> +				      const void __user *unsafe_ptr__ign,
> +				      struct mm_struct *mm, u64 flags);
> +

This shouldn't be needed. kfuncs are prototype-free by design, which is
what the -Wmissing-prototypes suppression in __bpf_kfunc_start_defs() is
for, and __bpf_kfuncs expands to __used __retain noinline, which are
definition attributes.

Additionally, I feel as though any shared pieces of infrastructure
amongst these kfuncs/helpers should live within their own static
internal helpers (__bpf_copy_from_user_mm() and
__bpf_copy_from_user_mm_str() or something like that. Callers should
also guarantee that a live mm is being passed into each respective
helper). That also lets the compiler inline them, rather than being
blocked by noinline on both ends.

>  /* If kernel subsystem is allowing eBPF programs to call this function,
>   * inside its own verifier_ops->get_func_proto() callback it should return
>   * bpf_map_lookup_elem_proto, so that verifier can properly check the arguments
> @@ -682,22 +686,15 @@ const struct bpf_func_proto bpf_copy_from_user_proto = {
>  BPF_CALL_5(bpf_copy_from_user_task, void *, dst, u32, size,
>  	   const void __user *, user_ptr, struct task_struct *, tsk, u64, flags)
>  {
> +	struct mm_struct *mm;
>  	int ret;
>  
> -	/* flags is not used yet */
> -	if (unlikely(flags))
> -		return -EINVAL;
> -
> -	if (unlikely(!size))
> -		return 0;
> -
> -	ret = access_process_vm(tsk, (unsigned long)user_ptr, dst, size, 0);
> -	if (ret == size)
> -		return 0;
> +	mm = get_task_mm(tsk);

I'd keep the flags and size checks before get_task_mm(). Otherwise a bad
flags value or size results in us taking a task_lock() and an mm
reference before returning -EINVAL. So I'd argue that you changing these
semantics alone doesn't allow you to uphold your statement around there
being "no behavior change".

> +	ret = bpf_copy_from_user_mm(dst, size, user_ptr, mm, flags);
> +	if (mm)
> +		mmput(mm);
>  
> -	memset(dst, 0, size);
> -	/* Return -EFAULT for partial read */
> -	return ret < 0 ? ret : -EFAULT;
> +	return ret;
>  }
>  
>  const struct bpf_func_proto bpf_copy_from_user_task_proto = {
> @@ -3658,6 +3655,100 @@ __bpf_kfunc int bpf_copy_from_user_str(void *dst, u32 dst__sz, const void __user
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
> +	int ret;
> +
> +	if (unlikely(flags))
> +		return -EINVAL;
> +
> +	if (unlikely(!dst__sz))
> +		return 0;
> +
> +	if (unlikely(!mm)) {
> +		memset(dst, 0, dst__sz);
> +		return -EFAULT;
> +	}
> +
> +	ret = access_remote_vm(mm, (unsigned long)unsafe_ptr__ign,
> +			       dst, dst__sz, 0);
> +	if (ret == dst__sz)
> +		return 0;
> +
> +	memset(dst, 0, dst__sz);
> +	return ret < 0 ? ret : -EFAULT;
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
> +	int ret;
> +
> +	if (unlikely(flags & ~BPF_F_PAD_ZEROS))
> +		return -EINVAL;
> +
> +	if (unlikely(dst__sz == 0))
> +		return 0;
> +
> +	if (unlikely(!mm)) {
> +		if (flags & BPF_F_PAD_ZEROS)
> +			memset(dst, 0, dst__sz);
> +		else
> +			*(char *)dst = '\0';
> +		return -EFAULT;
> +	}
> +
> +	ret = copy_remote_mm_str(mm, (unsigned long)unsafe_ptr__ign, dst, dst__sz, 0);
> +	if (ret < 0) {
> +		if (flags & BPF_F_PAD_ZEROS)
> +			memset(dst, 0, dst__sz);
> +		return ret;
> +	}
> +
> +	if (flags & BPF_F_PAD_ZEROS)
> +		memset(dst + ret, 0, dst__sz - ret);
> +
> +	return ret + 1;
> +}
> +
>  /**
>   * bpf_copy_from_user_task_str() - Copy a string from an task's address space
>   * @dst:             Destination address, in kernel space.  This buffer must be
> @@ -3681,25 +3772,16 @@ __bpf_kfunc int bpf_copy_from_user_task_str(void *dst, u32 dst__sz,
>  					    const void __user *unsafe_ptr__ign,
>  					    struct task_struct *tsk, u64 flags)
>  {
> +	struct mm_struct *mm;
>  	int ret;
>  
> -	if (unlikely(flags & ~BPF_F_PAD_ZEROS))
> -		return -EINVAL;
> -
> -	if (unlikely(dst__sz == 0))
> -		return 0;
> +	mm = get_task_mm(tsk);
> +	ret = bpf_copy_from_user_mm_str(dst, dst__sz, unsafe_ptr__ign,
> +					mm, flags);
> +	if (mm)
> +		mmput(mm);
>  
> -	ret = copy_remote_vm_str(tsk, (unsigned long)unsafe_ptr__ign, dst, dst__sz, 0);
> -	if (ret < 0) {
> -		if (flags & BPF_F_PAD_ZEROS)
> -			memset(dst, 0, dst__sz);
> -		return ret;
> -	}
> -
> -	if (flags & BPF_F_PAD_ZEROS)
> -		memset(dst + ret, 0, dst__sz - ret);
> -
> -	return ret + 1;
> +	return ret;
>  }
>  
>  /* Keep unsigned long in prototype so that kfunc is usable when emitted to
> @@ -4924,6 +5006,8 @@ BTF_ID_FLAGS(func, bpf_iter_bits_new, KF_ITER_NEW)
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
