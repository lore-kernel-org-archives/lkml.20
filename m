Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6086035DA79
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535417; cv=none; b=AjEGip9FQjfOFgz/Qbde1u1pjXCKVxlflsx9PZ3PDDMG44Cnw9vh2OyRA+kZFR5e8txUGet3p9rfcy7C2QvewoEuh3jajEKBLZZQSMTDrUs+/f8UyWBTeiVP8y7JNl5nBHqUlMG/r2jZmg6A8jcPmIxzBZLh2O/WL2d4S6IyNnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535417; c=relaxed/simple;
	bh=qluvmwuV83emM/3nJsE43LICI3P8DdmTIbeH+hWLj3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rahdhtUF9JquueFeuBqAvpwHPefS7SoIqxZembK8UtDQ1dLuIE3AIGogNQefQ73NDvBzmHp18419TfgzW+4aZm6DkQ1/SSAk8BmX51KTG3i2WroZST5/NPQ9pczIidMdKRG8HXhufnp5mKDrYUmYEjCH9i/fwJ53h8WWNGy2hK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lk71uPjA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lk71uPjA"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so468150a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789535415; x=1790140215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCSj073xDjVE5V/nmEXAKgguDBgTKgJjsaGKUYFcD28=;
        b=Lk71uPjA748GMNOBRwwx7CzDUrHhAUVte9H+V3pTb03yMvIDCdmLL4VrZrRAxA0fpk
         oMMFvav4mhFoot/vwf4CJLVc215JirItwK3F4V89Lau1epmam9E4AM5NWESVvUStv2ut
         Yd4+xeiZsGYdRXAJam3CqqYpvA+ILsLZKpuzxwTWRjpM8PIA6h9WwcTCftyA6LyR8pQ0
         RvsGo6G+jIwIF7EioRJj3r+oOubY0ceNZtZSoulifdtIvAmPQ41GYo34p6wHhGuCjIT7
         HYLhl6cmK1vwd4bGiQ2mC7H8UeLfJ+U8dzsWEYrChJcudLlGvEXzfiQQhXKHR+TL8zyt
         VDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535415; x=1790140215;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCSj073xDjVE5V/nmEXAKgguDBgTKgJjsaGKUYFcD28=;
        b=pYMhgxPPO2j0QsWandfU4g6fIB0DVsQQkq3+/Zb2X4cLH9nCF3Itwwird4Gm+0rC6y
         bLok1A07+EdlENKvGYh42cC4Von3tsEQKUOKJ/OZkrGJ8i/5wQW6ERgNrJaSr05rFSa7
         XtSeJpTwwBXIGOcdtmLkbXVi0MWgiZ0ufdBwCAENeL5LtbViQOzJ2WVnocCn9J3pv2WC
         3eSk40A4C/fQFLIVo+f2rwCfjpb3zt2EI7VNS6+CvmCBGe0IT6ooZT3G4w3+krOa8J2I
         FDsZYhUlPB+gMLVjIg9r2VzqNVOsGdRyJkJE3L43PCERh+2ruEHvlvMobp6zZlVFXVcT
         Uz8w==
X-Forwarded-Encrypted: i=1; AKwUvBym9HhVD4/gWtLQEvxAmGLZggBZddwAhZGJMcvJu8OPh/O7cWrSAxRpeEKMveRakArua3XvMSb/wNj1ZsE=@vger.kernel.org
X-Gm-Message-State: AFuF++lng2jupF6Kgh2oJghY40Cw1XJ8SgThOGpVoakn9gQuYh2dKFea
	wJqe6SI7Osihzt6IYdGrQqngcEc35h5qHFqMD5a4H0iynKIc6F/b+dI1
X-Gm-Gg: AYBFou1JmGZsjoryHcjvxt9wUjLjhklbops1/hv5HvGxNwU85mQ0hSJPlnOLKGJStAD
	TT/twBcKNHaT0osR3yD8v66fL+MR9VVkS+C9KlLDecJjts7/xptWuxdgmthEsunk+7+YN9OSBM4
	AnCKC/CxsDWzwnqMgo2u8+FOgztPE8OJnTlcG8fXIpwolDL0RqQdsXJWRJRWW5k49StzwFu8ZlO
	6MzwyP/AvsfGXxj7bUgXsYr3XvMNeRZg8r9e8cZ/mpQaYwg3DQsPGHEJR47Euzjk/YKxZN1Qr3m
	H+oTTu3OL2RNxj6azidEKPz5bNX0i7SXcyMzYfdIPDSVfXpAnYKJVPzrjtp/+6U6KRZKDLPfNQ6
	69AC1+u85yW2DeVHeBZIXoWUdNYE8fAW09hT9jcb+DPAtBTy7pMbONECmw4BxZ8jPZQszsocukt
	7DHjwG4bjhHUtkOLba4xlAEKK6ESOG4NzTsiJzUsoo56LI2Z6+wzbHlKarXSk5AIQFjzP2ctM0s
	85ohqEMs686Lu6lhw==
X-Received: by 2002:a17:90b:1f84:b0:39d:f064:3a76 with SMTP id 98e67ed59e1d1-39e1e45e49amr3002570a91.15.1789535414426;
        Tue, 15 Sep 2026 22:10:14 -0700 (PDT)
Received: from kernel ([45.251.35.123])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ac978esm3932878eec.18.2026.09.15.22.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:10:13 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:40:07 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: bhelgaas@google.com
Cc: skhan@linuxfoundation.org, jkoolstra@xs4all.nl,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, yinghai@kernel.org
Subject: Re: [PATCH] PCI: probe: Fix 64-bit limit truncation in prefetchable
 window
Message-ID: <aqokrxTEO1BVAyK7@kernel>
References: <20260814164652.43501-1-raizudeen.kerneldev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814164652.43501-1-raizudeen.kerneldev@gmail.com>

On Fri, Aug 14, 2026 at 10:16:52PM +0530, Mohamad Raizudeen wrote:
> In pci_read_bridge_mmio_pref(), the code checks if the 64 bit base
> address is truncated on 32 bit pci_bus_addr_t. However, it misses this
> same check for the limit address.
> 
> If firmware sets a window that starts below 4GB but ends above 4GB, the
> base check passes. But the 64 bit limit is silently cut down to 32 bits
> and wraps around to zero. This makes the base larger than the limit,
> causing the kernel to silently disable the memory window instead of
> printing an error.
> 
> Fix this by checking if the limit was truncated, just like the base.
> Also, update the error message to print both the base and limit
> addresses to make debugging easier.
> 
> Fixes: 7fc986d8a9727 ("PCI: Support 64-bit bridge windows if we have 64-bit dma_addr_t")
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
>  drivers/pci/probe.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index dd0abbc63e18..0cf2d1d35146 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -479,9 +479,10 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
>  	base = (pci_bus_addr_t) base64;
>  	limit = (pci_bus_addr_t) limit64;
>  
> -	if (base != base64) {
> -		pci_err(dev, "can't handle bridge window above 4GB (bus address %#010llx)\n",
> -			(unsigned long long) base64);
> +	if (base != base64 || limit != limit64) {
> +		pci_err(dev, "can't handle bridge window above 4GB (bus address %#010llx-%#010llx)\n",
> +			(unsigned long long) base64,
> +			(unsigned long long) limit64);
>  		return;
>  	}
>  
> -- 
> 2.53.0
>
Hi Bjorn,

Just following up on this patch. Please let me know if you have any
feedback or if further changes are needed.

Thanks,
Mohamad Raizudeen

