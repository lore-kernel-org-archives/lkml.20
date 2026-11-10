Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333275;
	b=mt5ifBueyEM8zRaxVjcBGZhhi2LI/dZuW11vZy4kwT+8Enc7tzfK2g7BIzqDVbMTopHO
	 rNkjsxpJ3J8/pNcAAcD3fW7tyB9G363nttzBJtcju0XqwC4bz6kByfxcIg0w9nLzioP+M
	 baKe3p9lG+vKVOXT5jBfdq0mPNcY6hvvbyV9W/6WYJu223SDieLp1PxDlVs9+TGL02o2J
	 UV5nziPryQfq2OnxXxX7VXEoYJ9IT3prkuM+RKu7LwnJVrPdagos7EkPoo/IHK4t9Lcmk
	 Y/NnB45cEycqjUUpgM3EyjwhYeJCxjCVYKXsZvBnC9VdIui90VSnTO/V+rIxbLOsjqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=XvblCMGLEMwr6aPTNBYSVtI2iLfab9ugT+R+DDYhUcc=;
	b=gpoD15ydQEZZ+7mWxT0LRXfBYbuFkqL359ouRT38fLWzRw80K7mS1uNEGa8NljsVerHf
	 h5Q1rOacQisv0+9zgetinjgn+ymDlr6wQHGhNkY79pDQtr4cI9tcyfAKKNSr/S/HtNkov
	 LJ43WRR8EKDnJirsZVuurThCYVFcDNzvJfMr4eglM7hA/MdgDyf0u25jD3TRgn2aeYHGR
	 Pg2EM8yisEHgpSusPa5Uer03fEKp7utZWDCeO1SCY2I9wCQLvcIWERTTa3d0y7PWwpv+N
	 OHivbDg7nHYuWIChVwdY+ICYRqc6hZZKvLrO18NasJ9q7NqQms/9nYSAx9XUARECmPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lw3Cz0np;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BCE60A3808
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8BCE60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lw3Cz0np
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-170135e43c7so3634879c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333274; x=1794938074; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XvblCMGLEMwr6aPTNBYSVtI2iLfab9ugT+R+DDYhUcc=;
        b=Lw3Cz0np7H6aT/xnS0b2HyPV5mz1dHKVxQXacZ0Blkw1VCOl9jUelyv5Bnr86QZo9i
         J2pFUEBNfuOMLG9ABmLewJ5PMSXZpypJHcbT9o5Mi7cvkk5nCORDJty1i5Na7UrtUXBo
         A1abRQK3FeExFQcNJToNAxo+x0i85qzl9i2x/zNyGB1rYWTrXrqA65RPr39UszJv5x0F
         mbvmrghN0HpWgV08HnnHx545UeZ8CHpolVZJMCLBe4GrZBRvdFEG39LoI2PB7Wi/zQz3
         29jrQunOmfGj65kNFLZThPSUt3IWkERmHZo2WxpiqdyQN338QupMbi7X8nuJHYOl7lED
         pjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333274; x=1794938074;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvblCMGLEMwr6aPTNBYSVtI2iLfab9ugT+R+DDYhUcc=;
        b=II1Qh8FPrcAnkTQ8S+vjL+g6yG6Ywqu/SxMYB+gu/HTIFsWG/Bvu1lckjfKGjRuEPv
         ljJ+/52mYjMNyoT/WcUaeksuo+M/RJ+d+GjJSqGc+PVyWj3SGzm+HAaLZ1Tw1Eoeowzg
         fGBiTa7YKvrnUkwEzGfWl9zYU7AIKmr57lvGBzEvavwmKONfBZbpCeWv9GPR0ugK7/Gq
         WkYZu0BtGAT6uvQpIdipLs81iGrRf6ulxG+ASG+xBlpqkmwDiXjwreouOLrwJPIAVSQk
         4LzzCFph7iEl2YXFhEO9P0WWCVaKqWmM0IJoK/AvWJoOB6VeITItNoQhALGqhqQZaSu1
         AjZw==
X-Forwarded-Encrypted: i=1; AL+hErEl/SFhG+EkFeIifw/GJND3wlUXG3kw2ybrh5CsxjDzFaM/2X4SNKdUt7bn+DdyAMwuBoFH0BqYOYrkRvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E6wdGhqgwGaVHjoB/5bKhvOOsKRd0QGIrolvHiQPVClStcO6a
	Bnb+whKGCE/0BLhLUaAmkkEIBi8UE77fVM11fPcWTH7BhOkOGe3tqsie
X-Gm-Gg: AYBFou3QOc9qwaG/8oRtAVXjG4+wlCW0MdyJLuRVszA85jO7p2LJm3NwLV2uv2iiEpn
	IBrkxtaZCaQEiXyot6hw0d3pV3SH018Tc+HYOjUZY+1ukRotYcBb91Z8BAn1SboqWtER5KD0jfK
	t/g/45PdGbUe5EbnRHHXblN0k9fKhdE4OLl/BT/DX3P6+KsGLBSc3/nxpRo/dtmc24Z/lnrqIS1
	mKICJRH8AliK0GdGdV0o+FpnHOLWPPIFp0RicRoV87AluAFOhu78/SSQ1HlXL57Dt0mW2umZG4n
	4Q8sDEPq1XyDKOpQr7OmIP7LBsLzzCVzpaRg+Zl4xQHv+xiQQzw0jqPJtP+HiNpmN1g/wW9xrCm
	g9R+sjWZR+xGm9XY7t/zKrdb/ulEGfANnUlc6RaZPJfQcSrC9bnOSbuw6Il9lwy4mao92wpUPr9
	JrycB3bihDfh7lYNEjySHhgLapivW4lQ7f6xH88yVTjBH5C6dVafckhtgNLtTLwwLygkzKpOKIg
	JJcWiUkH7JWzhny2Qk9VR9PY9QcnZnZeM1Xcko8s2lLlbWFGM6/bQxT86KmKXAw4s/CgOJ3uXEu
	TCA0gyvrIbDFpD0Gk1EY2ovOPCEPiuVW9BX/HQ==
X-Received: by 2002:a05:701b:2302:b0:1b3:a9c0:6a3e with SMTP id a92af1059eb24-1b3b5fff49bmr4373309c88.29.1794333273602;
        Tue, 10 Nov 2026 09:54:33 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:7392:6aad:f285:27fa])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm8649478c88.1.2026.11.10.09.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] powerpc/perf/vpa-dtl: use GFP_ATOMIC for DTL buffer
 allocation
From: mdshahid03@gmail.com
To: mdshahid03@gmail.com
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
 chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102143719.165508-1-mdshahid03@gmail.com>
References: <20261102143719.165508-1-mdshahid03@gmail.com>
Date: Tue, 10 Nov 2026 23:24:14 +0530
Message-Id: <179433325437.153822.17133762919793487046.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi,

Could you please review this patch and give your feedback,when time
permits.

Thanks
Shahid.

On 2026-11-02 20:07 +0530, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> The DTL buffer is allocated while holding dtl_global_lock, which
> is spinlock.
> 
> GFP_KERNEL allow direct memory reclaim and may sleep. Combining
> GFP_KERNEL with GFP_ATOMIC does not remove the direct reclaim.
> 
> Use GFP_ATOMIC alone to ensure the allocation does not sleep
> while the spinlock is held.
> 
> The issue is reported by script coccinelle call_kern.cocci.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  arch/powerpc/perf/vpa-dtl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/perf/vpa-dtl.c b/arch/powerpc/perf/vpa-dtl.c
> index 3e3d65b6c796..3d34417e6aae 100644
> --- a/arch/powerpc/perf/vpa-dtl.c
> +++ b/arch/powerpc/perf/vpa-dtl.c
> @@ -338,7 +338,7 @@ static int vpa_dtl_mem_alloc(int cpu)
>  	if (!dtl_cache)
>  		return -ENOMEM;
>  
> -	buf = kmem_cache_alloc_node(dtl_cache, GFP_KERNEL | GFP_ATOMIC, cpu_to_node(cpu));
> +	buf = kmem_cache_alloc_node(dtl_cache, GFP_ATOMIC, cpu_to_node(cpu));
>  	if (!buf) {
>  		pr_warn("buffer allocation failed for cpu %d\n", cpu);
>  		return -ENOMEM;
> -- 
> 2.43.0
> 
> 
> 


