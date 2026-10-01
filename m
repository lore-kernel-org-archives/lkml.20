Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECA748F03D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892914; cv=none; b=CU5uMMI69lFUd+z7Zpp4wrjDZxLv44BmPZdbsYDuHFKj/ckgvUapjlEuIdF+IJGeT0K3dBA4Z0JnvriH7Z9ofun2K7gnF+0nyRGYfmAOCz3CBMv7VwOKoKdDqDkoRcRE+2WrpqTuT1VDbeWYFW2CVx61JBLNQcB+/qeXuJZOTRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892914; c=relaxed/simple;
	bh=3D/SzZUHfppmGBKK8qp5FPfsG/cUw81+Btgd1hDqOMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujhMg+aFxSP4P83qtYj62W/oP8AbtcPUvsZLHwx3LL8zuCSt8QvvN6Ar2saO40cXpKfVNm+hUyQBr4jUNA+snI+DuWk6NV0Ugkguikrm4KXdHL2Wxj9skvFnyBw2TztPDYysOxkTlIlI3GhNzeJY8syzepN/VK4e96sbFfAz6kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=gnJfkdJa; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="gnJfkdJa"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49aa4a7d75eso2256799fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1790892911; x=1791497711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cpxOS/VhNieCUSrXbapdBobjrbsQO0jWvw6Phqp0CiU=;
        b=gnJfkdJaUYV6VeB+yrHlwGAWDINDS8weg5rmoajtM2HcpKYQ7PxjOqGczHMJFUwZIC
         CUvTlehb+bnxFfcqT0e5amEwIsmizHTmBjVh/zW2TRZhhM1pN62GK8ZRDJIMGa4W6e85
         FA1iiqv1+y/K3mk7N3pmPRAohRoI4ygax0Nyh80/9SkMr38zO39Zm+jPTJiYC0dDPZ9V
         4LgvJpQwjVcvLBufMgUufoavKzfW23y9FGL/PUNXIUFDk2spEe4/5hPn7J398Vjh5TKn
         y8vyhZ8z8Ujy9fhCVdNqhdOvKHYdY106mJs1yeuD2GFHdCj++g1c/3wuNwpBnKrZNMkU
         nwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790892911; x=1791497711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpxOS/VhNieCUSrXbapdBobjrbsQO0jWvw6Phqp0CiU=;
        b=rb8bEtx5WN1R49Arz0RlwNAjLfVMhfpaZWwKY5RGxMOjmrLON7Pc4to8mLqBRge1XT
         kQdwt8ZjOUuUwXkNNgF9jL+miOrkdoo/s1+THZYBgbRicJPlhqzwn/QN0Ogn6eKAecVm
         v0HhSOL0/4Im4TVkFZ0gScslCJxvc6fT6VDf5/kuQZnfaNxh+Uw+DdVIkKdRxtVgAqja
         ZL00l+39MVz3a5uGSWTIkuaKBLWI1F/MLEbKRbXJWBOSUMRo5oG8D7f9VW4LbG3C5Vpu
         yixQn/h0d7XXo9E3fkuEaiyqatkxXAusrY1JKOGLvdvJzso2Tty6BMrc3l0iu+kfz6Ac
         cZLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpolXOeRLHs9yXJpW/w942oEdPFCBIXA5x/EKSnijcZv/cGSR4yXP1o2yApLV0nGyaeShZRWuhfe1sAHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOKvneJxcdTpliUNeaW43TAiqW9JeTg0lAVb/XLOlPwhqrp/Dn
	REFTS74tw5dzYgF+wOZWU7cK7NUbEraNDsPvbdsh1PU3gWSVSAD9qU/kZmJUBWp5xH4=
X-Gm-Gg: AYBFou0jjBC7FsW8bcZnZaksJ5DVaTPm4iTZkIH8M8kivcW5WfeG7se5NbM0WuGOVan
	/FA0aN2Fp/L8Fy7k66Ky3sc4AUmsmG9zQrhU6u2RyaPgwPNXe4qqzC3GXS5heDxf30zCQtaIIww
	HWuGa/vdqICFUadJwsmDRu9gHCyKYbbigek7CdzqWC4ZAYR7DFn3Ax+wy+LuP7WG8Jdu6hTJJ22
	xEBnSLt8n17/b9aR4XG8tfBqTfWVXZ6YtTjD0lhMH9+vKa42fV+UUdHjJsLQHvH8sh7JsDB4p4F
	EeCj01fTPiB9DpZ9kA+Wrx72sT8F67W1be5xNTqCIIrLdFjxghM2R1pyZzZLfa6z/JUFDoVSLMH
	twBWvUQ3fXUnst+Jp/lNhtUcsShH81mfzN0qF1oXjMjxvVj2qtw+NDzcboeRGGxo7OC3Os3E84z
	4/C4t7gEv0bmw3mN5aZp6KNNb576hcng5KXbGtF87bxIkurha9I28G7X7gnrwmxw0CBdKzZuKYf
	vLtJKw8CjY8zG0/i/dlra7OXUMBlc7Hivz6dJ6mWJuOeaOyjruIVFTJrBdB675HwxN240R2Pnbp
	N+zWEqaN8tJkn+4EkA==
X-Received: by 2002:a05:6871:c8ce:b0:48f:e0e5:a1f8 with SMTP id 586e51a60fabf-49e15e91affmr908102fac.44.1790892911312;
        Thu, 01 Oct 2026 15:15:11 -0700 (PDT)
Received: from mail.minyard.net ([163.252.82.98])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16a48b01sm635983fac.2.2026.10.01.15.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 15:15:09 -0700 (PDT)
Date: Thu, 1 Oct 2026 17:14:58 -0500
From: Corey Minyard <corey@minyard.net>
To: Ashutosh Yadav <yadavxashutosh@gmail.com>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] char: ipmi: Replace deprecated strcpy with strscpy
Message-ID: <ar7bYpNQEj_4vv1t@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20261001172209.52028-1-yadavxashutosh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001172209.52028-1-yadavxashutosh@gmail.com>

On Thu, Oct 01, 2026 at 10:52:09PM +0530, Ashutosh Yadav wrote:
> strcpy() has been deprecated because it is generally unsafe and can lead
> to buffer overflows. It is actively being removed from the kernel.
> 
> In action_op() and preop_op() (and related functions), strings are copied
> into fixed-size buffers. Replace the strcpy() calls with strscpy() using
> the sizeof() the destination buffers to guarantee NUL-termination and
> prevent any potential bounds issues, ensuring compliance with safe string
> APIs.

Applied, thank you.

-corey

> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Ashutosh Yadav <yadavxashutosh@gmail.com>
> ---
>  drivers/char/ipmi/ipmi_watchdog.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_watchdog.c b/drivers/char/ipmi/ipmi_watchdog.c
> index a013ddbf1466..79d4958df6ef 100644
> --- a/drivers/char/ipmi/ipmi_watchdog.c
> +++ b/drivers/char/ipmi/ipmi_watchdog.c
> @@ -1166,13 +1166,13 @@ static int action_op(const char *inval, char *outval)
>  	int rv;
>  
>  	if (outval)
> -		strcpy(outval, action);
> +		strscpy(outval, action, sizeof(action));
>  
>  	if (!inval)
>  		return 0;
>  	rv = action_op_set_val(inval);
>  	if (!rv)
> -		strcpy(action, inval);
> +		strscpy(action, inval, sizeof(action));
>  	return rv;
>  }
>  
> @@ -1198,13 +1198,13 @@ static int preaction_op(const char *inval, char *outval)
>  	int rv;
>  
>  	if (outval)
> -		strcpy(outval, preaction);
> +		strscpy(outval, preaction, sizeof(preaction));
>  
>  	if (!inval)
>  		return 0;
>  	rv = preaction_op_set_val(inval);
>  	if (!rv)
> -		strcpy(preaction, inval);
> +		strscpy(preaction, inval, sizeof(preaction));
>  	return 0;
>  }
>  
> @@ -1226,14 +1226,14 @@ static int preop_op(const char *inval, char *outval)
>  	int rv;
>  
>  	if (outval)
> -		strcpy(outval, preop);
> +		strscpy(outval, preop, sizeof(preop));
>  
>  	if (!inval)
>  		return 0;
>  
>  	rv = preop_op_set_val(inval);
>  	if (!rv)
> -		strcpy(preop, inval);
> +		strscpy(preop, inval, sizeof(preop));
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 
