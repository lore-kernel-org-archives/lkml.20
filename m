Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9E65616B2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092960; cv=none; b=AH9RYVwU5s1Z3E5RGcU51Aii24bvh1ItXoPTxp8f+k80x3t0AuK0E4SCVBCF5HB97LyeORzrSwryWoawjUtggCT+d/7FRblHN3Nr6WtrUY9Unbp7MY7DytwJNYr00f/ZJ9T/eZy/N0bhku/YowPKNkYRm/f+UV9s1IRPYZr8Jgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092960; c=relaxed/simple;
	bh=5Nc0E6uhwpOLhJ5EtHZx20sCq0FgvYX46L8SSfikNeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTlgkCe6SkWLLzyyQhKZHI7iwiaCGgU7G6EHUPXu3RJSVp1jnAWnowu9M/rIEXSRf8qXjGj0v6K4QA3cQZY7aKEs4jOr/DBpjmk/IUR0PXhXvXhtbHmpxKDJM0CDm2/LY84KyzWhYJ7JT/KFpWawVbeKLsGYEmvedzm4qRq/oqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAWVTpG6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAWVTpG6"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so75887a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790092957; x=1790697757; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8E+kKwSqex3XXbBNJuLlbTD55wWaphcALCZWnc93Tss=;
        b=kAWVTpG61PfZEqBghapa4FkH+n0/je7fAbyKOffmykoRIVutLO3HoKdrV/aM5TzBD0
         ZcJoi3xSUUnIH2l6ehWzMwzIjpQ+LM/AOnRDp84l6tvEtRIkJWxYEOn5qBZWm6WRWVdN
         UI8vSOEFDetuQZFR3frcxzLzsZmeKMx/M+IpJxPJIVuK9pxBTTI4fDu6g2H4rEIUqUBK
         HeFPcpj/acQ4GPzOcFSNLLCwF2VvcVxjFxQ8TitM9N5QOuKLucytqnXYq9LrxK+IDpDm
         Z/SW0tX66S+udVCrzB/n5JRj7R7qZ8YPlTiYekUNMItUsomwPWdKawBTCrqoghcxNQNp
         wf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092957; x=1790697757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8E+kKwSqex3XXbBNJuLlbTD55wWaphcALCZWnc93Tss=;
        b=C1RYaMR15kWwmCbwux3+71d+Q9mRC97J3p/xficmtOvgy+o6C9oaCLVMyYRd3W99bl
         EawVAZcnjd90hH40DIVdVho2RpHKqOxne57t8/bd0jj7XGbBpS/B27A28hcIXL87V9h2
         DsMJ4tyl5mJi4f0fIDrqoruqv5GdYZP/KigjtqkE+sAQdfzhCzQ/Ot+GVZfJBNyQ7vVm
         Vgl1WQxibyqQPZFSYJvxDGeh9MPid1Nd4AI9RPQlEdy6TqNpmBLmS2Hf4S71cus3SFkE
         zGlS43pwAyVdftF5MQk2Xhjjf8+WJ7wR+p6G6I7lyrmvR+KjwNhdfgCvdkMjWvHVC1IJ
         L8gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKXOtFkNr2Ms4g5vZHMI0MlLb9B+grAaOkQcFTOjjUPavlPVFoOXvMT2fMLYAXlT7TB8vD3lJHIUXEscQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nCfvvyuijStczG/XWJ91nAnSlua5FnqLaTfsC7jyY0WYJQIBTE
	CKfL4mXGFlY2+QBF2FjIpb1piY8kcIr9dfKvDN1JmAETlHNiWWbc1mtf
X-Gm-Gg: AYBFou3GmYeWr4Wusvqe+qziRGQ5CHjG/aFkKaqI1Ks0chwj4Shzce+O2QFjD/hbvcu
	aAGSCXbCoo2qm8yXafifu5ZohMItWLYHtK7rsEqkPa6P7arOL5yWXW8KTiUnvHYukfeYYey+i+X
	2u2vsePv1qp84c16Rkb14SNNzhzFnW96b5ywhlhc6hXKXRh20mfwXPU2XflZxXKzSNlqDR2ThZw
	PkJKt599bq7uf8m5fVbHG76HOfD9qrCy1t5Qb++Bn5G8srxPfws1DWToiFaJxBAtJfIpE/hHsHM
	flleOml2JQJ/bGyYL94ncLcmRJzYnbveysDJ4NyJft2qXkRp3Mt5NH/aO1Lco3yxrUQZQxy1kbC
	RaNOwGzHOKZtL9kJyvmBqT203UK7FlLf04stog2aEwHqrqncP/ZP6/M4J+XdVXfwei7lM3EScw+
	8sZQJlGwLZoGS0AzuMljta5ZS4pzGCvUrxv9vIPc48OAs43rQBl1WzSiBFLH3Owh96Ftj0eZfOz
	uVD1c40jceK
X-Received: by 2002:a17:90b:5826:b0:39e:6c68:c777 with SMTP id 98e67ed59e1d1-3a073234153mr1714050a91.45.1790092956933;
        Tue, 22 Sep 2026 09:02:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db882a5sm109505a91.1.2026.09.22.09.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:02:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 22 Sep 2026 09:02:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?utf-8?B?5p6X5r+s5ZOy?= <m18667909625@163.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] watchdog: use kstrtouint to parse
 softlockup_panic=
Message-ID: <f2d5714b-6277-436b-9be7-f5cff30c7b76@roeck-us.net>
References: <20260921064143.81420-1-m18667909625@163.com>
 <7b91e8cb-d068-484c-9a9f-2c19cb37f5ba@roeck-us.net>
 <e5bc7dc4-3faa-491f-9c8d-62afe0be0bbd@roeck-us.net>
 <20260922153000.10086.2-m18667909625@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922153000.10086.2-m18667909625@163.com>

On Tue, Sep 22, 2026 at 10:49:52PM +0800, 林濬哲 wrote:
> 
> simple_strtoul() is deprecated. Use kstrtouint() instead; on a parse
> error the variable is now left unchanged instead of being silently
> clamped.
> 
> __setup() handlers return whether they handled the option and cannot
> propagate parse errors, so the handler simply returns 1.
> 
> v3: do not warn on parse errors (Guenter Roeck).
> 
> Signed-off-by: Lin Junzhe <m18667909625@163.com>
> Assisted-by: AI coding assistant (per kernel AI guidelines)
> ---
>  kernel/watchdog.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 420f08140713..69cd5ebb4929 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -423,10 +423,11 @@ static unsigned long soft_lockup_nmi_warn;
>  
>  static int __init softlockup_panic_setup(char *str)
>  {
> -	int ret;
> +	unsigned int val;
>  
> -	ret = kstrtouint(str, 0, &softlockup_panic);
> -	return ret ? ret : 1;
> +	if (!kstrtouint(str, 0, &val))
> +		softlockup_panic = val;
> +	return 1;

This is not v3, it is a patch applied on top of a previous version,
and it unnecessarily introduces a temporary variable.

Guenter
