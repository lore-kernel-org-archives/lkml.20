Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4950B1E7660
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789348878; cv=none; b=LXwCjjfsPWdsbC6UiEnEahE4Lq+AE3GuhA0LKSgw7s19rgHZMS8jPWsbWejaL/wJJpp9YUuPvIF/jPfwFdpk1RUzejwA9CTzcjIE3jB0xBx7RRvttt2wpazQpBhbHRuG6hOOTFW44ZC+f7Gb3ZtrzqCliqc/Teq+7Kj9cTAwDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789348878; c=relaxed/simple;
	bh=Jo52MSARa8uRGstHX+nkOGEuELufQdjvMtbOTrNMYwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lC6SkJ0+k7dFMn2eJ/umKwoOg2LkJEt8GZs0pIWWYws0LQ/KtsXcHWzoTjyF0hOUDQJmaIrDllOPagxjhftHwVwYJzhFBBjv04UJ9zvRMeW2bW6vq4CI0+NoiOZJLkIKMTCcj3pjxtJRPYZjW7rJt5UPAH8rjlcYH3BuKO7nx8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YHfXXgW8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=chpAJdix; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YHfXXgW8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="chpAJdix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789348876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hB6oGUDhB7NpBPwBSAbY4P+UYTTTI5VBvn+Ldw600iI=;
	b=YHfXXgW8/E69IFzH1P0NsSxa4i4g6gI7J4wBhS/zRbDVyxbr6n2ywlFk4B9erienqNCFAB
	LbzMxZo1GHrRd82bYXxHw6vVIiEnlZjQ6PB48l+QT+46RuefExJenVD032uElA2AqhGGVq
	0mHc99zuIopUk5KCvhnidbmjlzTBtEY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-m2n53Mz1Oo2U91vXCWZ3WQ-1; Sun, 13 Sep 2026 21:21:15 -0400
X-MC-Unique: m2n53Mz1Oo2U91vXCWZ3WQ-1
X-Mimecast-MFC-AGG-ID: m2n53Mz1Oo2U91vXCWZ3WQ_1789348874
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de1ee0073so463760a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789348874; x=1789953674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hB6oGUDhB7NpBPwBSAbY4P+UYTTTI5VBvn+Ldw600iI=;
        b=chpAJdixC4uVrly4nQeYE71H/DbgTHFb/DoLoaynQURaKJMn/7+/ZT9URUcCBNjzsC
         FVz+G7FSNs6PiaA/fjWPBcGfGjyoui/Z7j3wxv9AQ/gjkcyXWiegx8vp/+Iaad3DLAu/
         DxI0b1E8+R7M8HSTZykozNKcNMNjCYIMKVfiK/DCxJNahe8zr7qmKBp/ut85C1rDlQ+l
         Fu0CIDzaaodNzPz7nhj+qkPqjg7SVDEs9xXqznxmWypnEacCtXCOo4RmQj7JQfY3+c7e
         DxDFUVu82U8Tp9fY7xUEiH94fB3hH3Zi+AlF6LGTCSzBmjmR8hjwi5+dmNnCG/b745UA
         yFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789348874; x=1789953674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hB6oGUDhB7NpBPwBSAbY4P+UYTTTI5VBvn+Ldw600iI=;
        b=IwOfyzUN0s+laEjWdhUK5XCrJOzz7c31XzBmCaFKzJGxWaCn4H5nhouEJaz5EFgS56
         rfLdMm2hw1NoyvxH9Pnlv897oLujusLzrNjaF9rM3rtj5lPxbW02KCZVa07XRLYHZ0zW
         lT4wUmLIZuU3EPP2mn+4nS2TPQIpU82FRcaOHfwQ3ZdyMBpMH8gid0WXE5NFbsmauHpf
         YrxQ/V9A09WulWfRVVZlzAogGdr9RfRr6Un4UvjQPLkmsfNAqS2AucfXaXi8hOLt0ItE
         g3Hl2u9Ib7Kd1TzBIjQKjXKNJZQUSACHNzlCspcIHMd1CgE3FWudGebRWgXJsV5vvs0Q
         QOeQ==
X-Forwarded-Encrypted: i=1; AKwUvByOuPWXQtn/avu+wjoERpkm1BaAire51GUBNjpn1x582wPDgBfGHr1m0xFvk0OaSUnGgrKZUbUCInliNlI=@vger.kernel.org
X-Gm-Message-State: AFuF++lqPW7P83+Fw429Lwpd58HGx6rUrUmzgOy6OOkf+bu2PJm5GOcI
	WF+FHQGQfoN7hllepQJZaitzBehGNPzOP+nxa2z0mEiYYY5EQoYrb8YZYErZ3E+3I41jFiSlTUm
	ik7mZQiK5WjdKbzx1dpjXyYcSNCWxaqpirXD0KwIn+fQFSd48XFhCK88Wqw+MqBzCvg==
X-Gm-Gg: AYBFou0kcJbDaZ4Vaw8eUcs93xYOAvA/TMP667DtvFVX2llK6pxwOUnR05f4Um7srX9
	mrS3aeZhjW3Yf/g1eFdV+rkqma3tku69EdO9bDXNvZREnZBtI3iAxGC8nR+AuB6pnLrT58wNOsQ
	LbkgHmiVzpnRDEzOwaQJ8ge93MiONc1fJTNfYPHvO8UcKPdUZuMMRjEWtvmaTiy9R8mSESswnWC
	2j5IhxlsWPwtpyhEbHmMO67WXp01phq1JDN1vqFUyA+OD6jvBsTBu+vSapYCMnVrf2XQQxvHI8l
	yLEcAmqaKnK3PrQoDrod+6pDxzhlPDFKkCgllbiWnMnsZGvf3kP3HzxJe20yM1V/OS7srbQeKQu
	GoExs2JQIdCNrB0bi/jbSNyNhoBLsKgVQ6iEyQHeqjA==
X-Received: by 2002:a17:90a:1041:b0:39d:edfc:26a0 with SMTP id 98e67ed59e1d1-39dedfc3adamr55100a91.1.1789348873749;
        Sun, 13 Sep 2026 18:21:13 -0700 (PDT)
X-Received: by 2002:a17:90a:1041:b0:39d:edfc:26a0 with SMTP id 98e67ed59e1d1-39dedfc3adamr55067a91.1.1789348873263;
        Sun, 13 Sep 2026 18:21:13 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db090dfa5sm4045013a91.4.2026.09.13.18.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 18:21:12 -0700 (PDT)
Message-ID: <6d204c05-1338-4ee5-9ac9-5d9447e329ee@redhat.com>
Date: Mon, 14 Sep 2026 11:21:01 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-4-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260912083611.2513845-4-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granularity
> equal to PAGE_SIZE.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Changes since v17:
>    * Move rmi_config_set() out of the header file.
>    * Print the error message for rmi_config_set if it fails
>   Changes since v15:
>    * Actually check the feature register for the host's page-size support.
>   Changes since v14:
>    * Move the implementation into drivers/firmware/arm_rmm.
>   Changes since v13:
>    * Moved out of KVM.
> ---
>   drivers/firmware/arm_rmm/rmi.c | 79 ++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 2fd538c937dca..5b0e342ce3d58 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -35,6 +35,25 @@ static int rmi_features(unsigned long index, unsigned long *out)
>   	return args.a0;
>   }
>   
> +/**
> + * rmi_rmm_config_set() - Configure the RMM
> + * @cfg_ptr: PA of a struct rmm_config
> + *
> + * Sets configuration options on the RMM.
> + *
> + * Return: RMI return code
> + */
> +static int rmi_rmm_config_set(unsigned long cfg_ptr)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RMM_CONFIG_SET, cfg_ptr,
> +	};
> +
> +	rmi_smccc_invoke(&regs);
> +
> +	return regs.a0;
> +}
> +

The comments for rmi_rmm_config_set() can be dropped since its logic is simply enough and
the code is self-explainning. Besides, I would move this right before its only caller
rmi_configure().

I would suggest drop this function by combining its logics into the only caller
rmi_configure(), seeing below for more details.

>   unsigned long rmi_feat_reg(unsigned long index)
>   {
>   	if (WARN_ON(index >= RMI_FEAT_REG_COUNT))
> @@ -98,6 +117,62 @@ static int rmi_read_features(void)
>   	return 0;
>   }
>   
> +static int rmi_configure(void)
> +{
> +	unsigned long granule_feature;
> +	unsigned long granule_size;
> +	int ret = 0;
> +	struct rmm_config *config;
> +
> +	switch (PAGE_SIZE) {
> +	case SZ_4K:
> +		granule_size = RMI_GRANULE_SIZE_4KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
> +		break;
> +	case SZ_16K:
> +		granule_size = RMI_GRANULE_SIZE_16KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
> +		break;
> +	case SZ_64K:
> +		granule_size = RMI_GRANULE_SIZE_64KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
> +		break;
> +	default:
> +		BUILD_BUG();
> +	}
> +
> +	if (!(rmi_feat_reg(1) & granule_feature)) {
> +		pr_err("RMM does not support %luKB granules\n",
> +		       PAGE_SIZE >> 10);
> +		return -ENXIO;
> +	}
> +
> +	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
> +	if (!config) {
> +		pr_err("Unable to allocate memory for RMM config\n");
> +		return -ENOMEM;
> +	}
> +
> +	config->rmi_granule_size = granule_size;
> +
> +	/*
> +	 * For now we set the tracking_region_size to 0 which is the only option
> +	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
> +	 * TODO: Support other tracking sizes via Kconfig option for other
> +	 * PAGE_SIZES
> +	 */
> +	config->tracking_region_size = 0;
> +
> +	ret = rmi_rmm_config_set(virt_to_phys(config));
> +	if (ret) {
> +		pr_err("RMM config set failed (%d)\n", ret);
> +		ret = -EINVAL;
> +	}
> +

I would suggest to drop rmi_rmm_config_set() by combining its logic to rmi_configure().

	struct arm_smccc_1_2_regs args = { SMC_RMI_RMM_CONFIG_SET };

	args.a1 = virt_to_phys(config);
	rmi_smccc_invoke(&args);
	if (args.a0 != RMI_SUCCESS) {
		pr_err("RMM config set failed (%ld)\n", args.a0);
		ret = -EINVAL;
	}
	

> +	free_page((unsigned long)config);
> +	return ret;
> +}
> +
>   static int __init arm64_init_rmi(void)
>   {
>   	int ret;
> @@ -111,6 +186,10 @@ static int __init arm64_init_rmi(void)
>   	if (ret)
>   		return ret;
>   
> +	ret = rmi_configure();
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   

Thanks,
Gavin

