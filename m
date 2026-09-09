Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9253382DA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788928166; cv=none; b=M7YvNNldA9glTGgCMUjY+NQ+5sDpozADqodcoBz1qP+WKBkRF/b4oYQnVEWw3zjn/gP8XlVcGk+ukAOQ6U8OAiiEBSc5Fz1sJnAl4zyvXvzv4WPIxigvY1eHBe30A8ghyDbqXQ2rS7Btxl4hnfSvYG/vB4W8Lw/3owbklQfRRPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788928166; c=relaxed/simple;
	bh=WTn05/4QycXhxqRWks5EqAjlR8e86BCzz+vfMc6TDRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odjKCBvWg52/2bR6Zv8JoADfunF3epcrAYgA2+3n3YC2zMrS0b2eCxApeX/5WfMbhuURtfxa2h/aNp1kxbiy42Ic9BUyxN0pclmJtl/FEB7D40F/rQAF1tOUB6OMcytAuC+ApEGBnC8W/DINELFEOpJF9mG4Cxt7JV72Zc/xDno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LGUi96nV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EmPFeAu5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LGUi96nV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EmPFeAu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788928163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nh6M4VZCYgC4q2LdczwdgMA5ELYVwccRqILicmGF2f4=;
	b=LGUi96nVVP5ewTjOaQk1h7clWnXbVLTE6Wnzm1CS76i3AATFVCPI9brEI3jny+hL4fwGNs
	KMuAnmHtQXEcG4zxcSMKPWSaUYM8VXPq4Cm/LZ45eRK5eD+o2goVDYpon3QlivOoUYiain
	fz/fL1+RztXS+a9SVnLI5LQIyd26Z8g=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-TU8q3DFLPeacy9GNuGB-rg-1; Wed, 09 Sep 2026 00:29:22 -0400
X-MC-Unique: TU8q3DFLPeacy9GNuGB-rg-1
X-Mimecast-MFC-AGG-ID: TU8q3DFLPeacy9GNuGB-rg_1788928161
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so749356a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788928161; x=1789532961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nh6M4VZCYgC4q2LdczwdgMA5ELYVwccRqILicmGF2f4=;
        b=EmPFeAu50xW5vOqAf3VuxXMCtwy7CYeoLd+ZDi1oQHUoRRFivygD9WsIQugNaAR0LO
         p3jC1NDB1ADEEFkULyI0o4DiJVJ7JRf+HZhYl2BGoLEh/63JjG/a30E+FmqTappLkKS2
         EEj3b9J30qiOtSuKIb7+qHwLH80hiEEhW9UPgSWfvPQiAqQ6yJLCp/xlPbkvlgBwNx5h
         IJf1C6gZ/Kb9lY9Lmcrygv/BMYQ73+SKYKpKqLyuGqOVWUrXyeXr2i4VZGvKqDu/4Kaq
         Ey2QFWAkLCKYR6xqXKxzf4r9g6GVSK2kyIT0abkxB3hUmhnIeiv6whpzicPikpaXGvkw
         Oizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788928161; x=1789532961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nh6M4VZCYgC4q2LdczwdgMA5ELYVwccRqILicmGF2f4=;
        b=YD+oOZA9bu+gdmhrFoWL5fJpSlZ9n8vWeXdLmzOPCr8sc8ruErD+6CiOBf/+Is8YCO
         sTeR9c+HoVn9izwxuuyevDL4GO5epntXGjTszYwF2wBJY7pvAHl4H7NU4N1hj0LH88vS
         tU98fLcttB2ZIBDmYFcPSxseqWbqHelBhhRswbseMgIedvmRbRHkOT4EsVSIV1cNUj3n
         VU2exHnrm5xAUaza9DwxcDuOcUMxxLk65RZnEL/WyqOG0w86OoTBzYcAwsW2clFUgXZL
         /WXfvtn6VC4NSlS71hCDe/POLEYx0JqjlcCc+9FWA2Wt4A3wL5ccDZ+4UBWdG1r6ZGvg
         4LSg==
X-Forwarded-Encrypted: i=1; AKwUvBwOlPtTTtc64QFr2jdW6KOh1Xs87/RTGF1sCIc5NMem0XUU3Z//s4P6ATl67YSC/lKq3kynPH9w1G27rBg=@vger.kernel.org
X-Gm-Message-State: AFuF++l46xEOKS3lbV/NS8HSA8wbFThv1Ev11QWvQ4KVX3kCQ49lvdCX
	ovn2+owcsKI7BHXduVjFSYgI0gFd8YC8UY7eTwN+EDDV5fgANf22HcZb7fnU2EfKZsQWetI4ppv
	D2p6MgLPE18TTaO6D44kWfWJRyKmK7AVO+dHKkL52l2z7t7NRHqAYxD7TlXEXPseXCQ==
X-Gm-Gg: AYBFou1W9SvP9grJOCrP4odKeZtZMjqTZFYLm0HXscC46tjgdhQxreq1YBibOodX50f
	LEKcDFfUJ2Guf0uwmOUsVEWAcouZfLLsDaxDJcssvZZiM9vGhvbj56ekT+eJdeQRyjfjl+AckFI
	2J9xFZ39X1tEK8uCQI64OVfNDaki6canqz8Dg81IgW2H6q6gNEkKtdvlRV4qEUpUMu0NnowenF+
	drSyBi5lLfqnCMuphb7beEYZl5RAvlffb4n+Fzlo0M6Oxn3bk+CT3GlqcwDmabny0c0NFbZAl/r
	BXW/2t91ddVHCuUwANJYoOpN7a/gVhgxclK0iLIKXirJ+X65cMr/kMcoZT9uJkq14qsHU1R0oSO
	6x7+9Yc5Gl79I5gtuUOL2Mfiasfch1x30A3fuGkVMkg==
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr54737966a91.4.1788928160900;
        Tue, 08 Sep 2026 21:29:20 -0700 (PDT)
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr54737906a91.4.1788928160430;
        Tue, 08 Sep 2026 21:29:20 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ba0a7b2c3sm5544813a91.0.2026.09.08.21.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 21:29:19 -0700 (PDT)
Message-ID: <aac304fa-a371-4210-8703-74281c9748f8@redhat.com>
Date: Wed, 9 Sep 2026 14:29:08 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 5/7] firmware: arm_rmm: Activate the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-6-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260907095942.1140734-6-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Suzuki,

On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Activate the RMM after the basic configuration. This is a memory transferring,
> stateful operation.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v16:
>   * Split into a new patch
> ---
>   drivers/firmware/arm_rmm/rmi.c | 17 +++++++++++++++--
>   include/linux/arm-rmi-cmds.h   | 11 +++++++++++
>   2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 42c973c3a98bb..d969c8738efde 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -641,7 +641,8 @@ static int rmi_configure(void)
>   
>   static int __init arm64_init_rmi(void)
>   {
> -	int ret;
> +	int ret = 0;
> +	struct rmi_sro_state *sro = NULL;

Why we need to initialize those local variables ('ret' and 'sro')? :-)
Also, we can use the scope-based cleanup function supported by cleanup.h
for @sro.

	struct smi_sro_state *sro __free(kfree) = NULL;

With the scope-based cleanup in place, we needn't explict 'kfree(sro)' at
end of this function.

>   
>   	/* Continue without realm support if we can't agree on a version */
>   	ret = rmi_check_version();
> @@ -656,7 +657,19 @@ static int __init arm64_init_rmi(void)
>   	if (ret)
>   		return ret;
>   
> -	return 0;
> +	/* Activate the RMM */
> +	sro = kmalloc_obj(*sro);
> +	if (!sro)
> +		return -ENOMEM;

	if (!sro) {
		pr_err("Unable to alloc SRO object for RMM activation\n");
		return -ENOMEM;
	}

> +
> +	ret = rmi_rmm_activate(sro);
> +	if (ret) {
> +		pr_err("RMM activate failed\n");
> +		ret = ret < 0 ? ret : -ENXIO;
> +	}
> +
> +	kfree(sro);
> +	return ret;
>   }
>   
>   /*
> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> index fed0f3421895d..dea7c7004d35f 100644
> --- a/include/linux/arm-rmi-cmds.h
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -64,6 +64,17 @@ static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
>   	return res.a0;
>   }
>   
> +/**
> + * rmi_rmm_activate() - Activate the RMM
> + * @sro: Preallocated SRO context to be used
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rmm_activate(struct rmi_sro_state *sro)
> +{
> +	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_ACTIVATE);
> +}
> +

rmi_rmm_acvivate() would be used for once by rmi.c::arm64_init_rmi(). Lets
not expose the function by combining the logic to rmi.c::arm64_init_rmi().

>   /**
>    * rmi_features() - Read feature register
>    * @index: Feature register index

Thanks,
Gavin

