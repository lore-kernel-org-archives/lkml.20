Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845798;
	b=eAdLIALW5ZhPlX5elGa3pXVu+V6aSC4GJdIK2S6xlaIBeot2AU3hguEtRe6L4ZDjq3zd
	 SSBg82B+oNNZY2k91B4obJqeOK1A04FKCRjPX+mP0ayjjV2Nz0HceQhfCUxuk+TQy249L
	 IKdXNio+AW8hMqnXmfwqavgIEhLsLBChjzxsjh8e3VxSDER2eIl/kXw3uAT+merjHKHyI
	 oHx4NmYmzpFrOp17BBNEYnx0/vOZ5OlfDpqDDXqseaqABeBcDBmGA2mEXl6E57pG2qWjt
	 fyHQYogxlUKWq861jUk3KRjWPrZF6ULcnn8rS1jIGtHMg9DHX3e7bZlLItwGIKeQs/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845798;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yCSzCrkdCOCPlR1zdVahyL9VLjI4SbXe7wRt306JhTo=;
	b=BywhjzrDG4yOJj8hc5tbNB8AeVOC5mmAyi45do4DC4SpyiuKImTIDkjTt6MiTnWx5Opa
	 Laf8sBtKhxbW6KCrA+6AKTteuyedyu8uLZMt0SfDRfn7thm85uVYU/GZovYiuXN6MCwXU
	 XIJwtF04x6erfA3TRkFW5e97am4rSNtT3qN22s5AV8LcsJipfn39/ZlBQ5kNIsvOTzNKJ
	 tx54fg2A2DhnXNwLX9aEyLwhuNk8etFP+uffimX3lvMpLxRMF36amVa5LKAs7ARh8ryj0
	 eL6Cai5JsJKSO684iJZAOjFmVzOPZx6VtOGTdJPDhIamsmoHWBet41pDDIxUhge7I6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2FF606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2FF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-702fd86d674so3085037eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845796; x=1795450596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yCSzCrkdCOCPlR1zdVahyL9VLjI4SbXe7wRt306JhTo=;
        b=Fz6U/Aqfta6IKjXGLRjaacvABn+zZZm8FqEaeici1SlfK9UH9/8ii9pJQKrtaWzTw6
         TiImPlTN3jgVm4tKvBxNdP7gO/9Z5TdTOsA95Yd5NDuX9/CDMeOTGTYcdfNtf9AV+r21
         3jBdDyTpE3vSSJPgiJSnndFprAx4u/Hh2TWGYwEJZeefglw1xzjeFLHwU7fFJMx5VGWg
         z+oWCQr0urWaXsgaJ1aKYUQM5wm6UMn7OqoHXH9kT3u/wNdof8X6nwycwPqmmNGZK0tg
         8Yw/JVtkWB97dNkNOMeLHIC24CXe3qf0pyKFNkgpsf12QPwvJH3kN5Y2x9Sm/YhMUbCu
         xjMA==
X-Forwarded-Encrypted: i=1; AL+hErFV/giZIXRbMcPAINYUeg5uUy66QBrmfh9qmNTQG8q2a8c/YwMujvo7+GrzwF2imKc2MOZHnblIJhvuiUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8acw5B0Khp4UPRyyQ2oeThh99o74S/nS0kxcnqPCalRPdul/sO
	SLwOdo26ip6Fd/Jem7oZZtbb/vzpXkng9nS1dStFNrRfQufvUDe9WttF
X-Gm-Gg: AYBFou0Liu1o5qX/+pYsoHaZ3iFUEGb+cS7Rde0LgTCQYjhHSvqyLW445gT51jnVJ50
	jlnp502mUTR1JUXFAAXs+codKFrW+hZCpGfLS6iG4SDQ8Dsg692ZLNlupLDHY1c/zS5P1EGZv7v
	GXWCSwcfIyXcNiykOWZTrnBOL1QN1BvxW/z3QXOgwLk8igmHaCLQRp2jplHY4f0y2FzwHKsFTMV
	FzX4o7zlpF9uXM+g2mHiAVh9SpGGYwZCJce6GLJMepvYnzWajiNUiPRmmXkgSFPPutv1p/nK198
	Vv2i5Yrs/QkDgj0M7Cy6HdIHjixGSXvT3fUIhTkVKLMF0rsxcgnsMoDS3YMF50fnXy7GToN/n/X
	zzz79s4mOFzuQCbIRDNF7pdC8uhezhh/SPPdUvwxbUkPBeIeaTVG0QvOe9qeOhkbfVNFCRy0/LO
	Pg1wNpD6iQ7KnjtXLjNAakTl8Yayg8pkHBaK9nM+DFKI2XWWpb9kdmkSCEns6JCHfE1doZrWZgB
	9i9bbQK2yH1WOj/9jp+vLvKH5qeKD3dF3xTYszMbRiCYwlL4MMqiJYBfPLoPG9QFEipfRIKFs+6
	pcCXwsWXiHXXLnEBnhDcphxWnXp5gmT66n1TiGRzFZxVJPkw0Svcdzy+W8weY2oAvTnl
X-Received: by 2002:a05:6820:570b:10b0:71a:fa49:2f33 with SMTP id 006d021491bc7-71afa49313dmr939115eaf.41.1794845796620;
        Mon, 16 Nov 2026 08:16:36 -0800 (PST)
Received: from [10.68.32.41] (bba-217-164-143-222.alshamil.net.ae. [217.164.143.222])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm8997106eaf.6.2026.11.16.08.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 08:16:35 -0800 (PST)
Message-ID: <a89b5be6-998a-4f3e-8768-0a64a9b33d61@linux.com>
Date: Mon, 16 Nov 2026 20:16:30 +0400
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: efremov@linux.com
Subject: Re: [PATCH] floppy: Avoid unsequenced accesses to jiffies in
 show_floppy()
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, stable@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20261114-floppy-wunsequenced-v1-1-a54dba6754c4@kernel.org>
Content-Language: en-US, ru-RU
From: "Denis Efremov (Oracle)" <efremov@linux.com>
In-Reply-To: <20261114-floppy-wunsequenced-v1-1-a54dba6754c4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Applied, thanks!

c1a8feb71ba8 floppy: Avoid unsequenced accesses to jiffies in show_floppy()

https://github.com/evdenis/linux-floppy branch for-7.5/floppy

Denis

On 15/11/2026 08:41, Nathan Chancellor wrote:
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in show_floppy(), which can
> break the build with CONFIG_WERROR=y / W=e:
> 
>   drivers/block/floppy.c:1839:30: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced]
>    1839 |                 jiffies, interruptjiffies, jiffies - interruptjiffies,
>         |                 ~~~~~~~                    ^
> 
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior. Per C11 6.5.2.2.10/12, the evaluation of arguments in a
> function call is indeterminately sequenced, meaning any side effects in
> the arguments are unsequenced.
> 
> Add a local variable to hold the value of jiffies before the function
> call so that there are no unsequenced side effects, clearing up the
> warning.
> 
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2198
> Link: https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74750637fc82dfcc423 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/block/floppy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
> index c677d783811f..f6339d779be9 100644
> --- a/drivers/block/floppy.c
> +++ b/drivers/block/floppy.c
> @@ -1830,13 +1830,14 @@ static void reset_fdc(void)
>  
>  static void show_floppy(int fdc)
>  {
> +	unsigned long j = jiffies;
>  	int i;
>  
>  	pr_info("\n");
>  	pr_info("floppy driver state\n");
>  	pr_info("-------------------\n");
>  	pr_info("now=%lu last interrupt=%lu diff=%lu last called handler=%ps\n",
> -		jiffies, interruptjiffies, jiffies - interruptjiffies,
> +		j, interruptjiffies, j - interruptjiffies,
>  		lasthandler);
>  
>  	pr_info("timeout_message=%s\n", timeout_message);
> 
> ---
> base-commit: ab43ec385580b8f8abf72d70fa3acbf4e4f098a5
> change-id: 20261114-floppy-wunsequenced-8b739d08b849
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 

