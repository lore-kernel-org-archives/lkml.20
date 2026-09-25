Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8822433ADAE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315021; cv=none; b=pW8si6+FjCRzvbqB4bgUPqolFWHR80d/jZoJ2FMId8iz/iUKV1Uchj6iRSWSlFLKOYJOLRViZJDp1jeOTxwa7/NmqfUfqrfJ3x1eGQR0Eq8RO0ydb+FXIIC8PpDcD4lBwRyPp39m4C214PFBZYZ7x4qkuq9t6IraWZnugvHvwSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315021; c=relaxed/simple;
	bh=hbUUz98Wa7UWb5Hmz8kQwpTb+XOMC+doGlgmjJrJxg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulEnv6uGbFwVxWrGDPwd6FCr0Uk/kqZr/LKTkozzk/MHZQwM0QfoYpilum1uvhvzdhiP6+aAZAS0x9GNc8vkVqCG9fUWKNW+5XjP9F8TH4XioB1Xf4tIrUNXgPWvDXBA9KDKa1vZTo01Bd9YYhdgqgHLGx9H+Kx0AGgpAEAHiiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KF/ZLSom; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gTtgd3gi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KF/ZLSom";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gTtgd3gi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790315017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1UdrPYhk+H7Ax+M1gheQL2QtOog+I6kAluj+Jz4QTDg=;
	b=KF/ZLSomCtoeiDuIEZRK/BZ1eoYBgOXVEnf3O4esFIu22s9JCSFPegbjLruyoAUpgSISb5
	KdyFauUjdUOAOxbmdVaFM6MJEa8fsvVWDW+lqr6MSPF44FiWMUf4wMKGFuYObWrHYK7YVM
	fRhW1+OPlCWALQGL6hx6vYgF3pMB02w=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-bLpikLpJO0SDxT9liiIVFg-1; Fri, 25 Sep 2026 01:43:36 -0400
X-MC-Unique: bLpikLpJO0SDxT9liiIVFg-1
X-Mimecast-MFC-AGG-ID: bLpikLpJO0SDxT9liiIVFg_1790315015
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd8920c132so8053405ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790315015; x=1790919815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UdrPYhk+H7Ax+M1gheQL2QtOog+I6kAluj+Jz4QTDg=;
        b=gTtgd3gid2PYqiz2YSui3RFrWw4Xo1xsyeVsYOvFqCUEe48aHgvVh9nKLZ+eQ8dYjk
         R4b8GiEYUPLS/T90LmfnSxoTRh5ox+vi/FHvs4lPwe6wdEPcMqzQWbQBD29nm30uNZW7
         6dqZUB3rjsI2fU6hz7c4ug947D3I+P26XATPkloir4aMdeVh/ddg9MsFWA+5GhGyxrWe
         kmxzzYrABjxlq9a4PRkoWG/dllCh0FCNyviEuhoyZrvCBM/KluEwMVNeGX5P2VHfC3Zs
         FY3HsR6CpVKMxXSjFC1qbTg3VTTWsosK9sINsQGD7wyOqPOCO/iggit+RTEf6Rwg30ei
         ZRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315015; x=1790919815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UdrPYhk+H7Ax+M1gheQL2QtOog+I6kAluj+Jz4QTDg=;
        b=G72ZDwyzGeHNnE9nN80FeFVTS0FJ6sDRR6x7k2kcFke5kAs/eLGp9IoLAChFhzPWBu
         XIi2z0BkCC7Vllv0djhoEq9w90BB5uxx0pfMVMAw7bVPb2DDKCnyB55NPoqCxtLx7o7T
         O0nkoeG4Z0uJpR8Tx3CIJiZI0MdqJ8Bzh29XIwkirWm7HQqd61VL9ff7ev8liZRHULQg
         TnPDAfHktVMfy2mJoHo7aYR6YgEvRalNOWleQKNF9yWgQ5TPRV2kKss6mUUzMNnLX61u
         PARXi4w7p6eNK0nmGpWxZoY1Yp4BBkAF0Qy+7IviOSORRNhQgdhLN1XZ72/tqjUVTY4o
         XhwA==
X-Forwarded-Encrypted: i=1; AKwUvBwx9G7qvrrYLbnQbYIUbxlAvNAVHwX9n5Izrj2XN8GXy9o8rUOxYGmaxrGlD2zvhVh9cf3uU1kSyHpPGSo=@vger.kernel.org
X-Gm-Message-State: AFuF++llg6K7sCT4w8s5pbOZEVaaFUv824T/V6+nsIk22qsKw4pPgAgf
	RZhHvFlPDl2x7cjcGjA66we85kLbDASAvy97vzHzGeo2NTXQkB+UgAFDl0C2M5hbg2U7Q9NsCZx
	6PEHSmYGWnIlT6BX6qDMJvYooTdcyImSC+uVX3lKrPiy/0JvUusWobrPlEin7hXQ1sg==
X-Gm-Gg: AYBFou3RWtLkdS/HutYr2N9QL31r7+F1LV3VbTs4E6FGbc+eI4/BeD06y0tGEO2Pb9y
	0bk8r9FcLplDMHW7b0R5KweYpRLjRlFtrkljdwKR1jYEEJ8XMRiYGCHQ5dk+2nIkw9wb/uIBsd5
	6qc6N8IC+UMOkdBlBTeR6uis44Fo7DUGWEPPabukhajMepCPJ+qP76l4l4aPRrrkFxr4HPVh7iX
	KdBR02uu/EUnsQBHevZSqUAsvXvx0Ew+KMzHSPvsC/DnOkvMxn45jJ6ArEVC55pOzFZV1Oq+fyI
	/lCjgYaXFYbSbONf65x2cR2PqpdzvpsR+9JXqOg9GO24iMFzumY+fMnMWUeK+aI94CXUBDzAm/P
	P9byHG+zRDmMvcvTT9zV5Kg0FsF/SsRaUbt8mxGtjSg==
X-Received: by 2002:a17:903:22c5:b0:2dd:c100:3137 with SMTP id d9443c01a7336-2df7e2493c9mr41840475ad.51.1790315014914;
        Thu, 24 Sep 2026 22:43:34 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2dd:c100:3137 with SMTP id d9443c01a7336-2df7e2493c9mr41840225ad.51.1790315014491;
        Thu, 24 Sep 2026 22:43:34 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91443823sm4588265ad.57.2026.09.24.22.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 22:43:33 -0700 (PDT)
Message-ID: <295014e8-24d7-494a-8f3e-0e17794d024f@redhat.com>
Date: Fri, 25 Sep 2026 15:43:25 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/7] firmware: arm_rmm: Check for RMI support at init
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-3-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260924135201.850038-3-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 11:51 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Query the RMI version number and check if it is a compatible version.
> The first two feature registers are read and exposed for future code to
> use.
> 
> We only support this for Little Endian kernels, the Big Endian kernel
> support is anyway marked BROKEN and is being removed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> v19:
>   * Read all implemented RmiFeatureRegisters - 5
>   * Use ARRAY_SIZE(rmi_feat_reg_cache) for the loop in rmi_read_features()
>   * Fold rmi_features() into rmi_read_features
>   * Fix comment for rmi_smccc_invoke()
>   * Drop default y
>   * Add retry for RMI_BLOCKED and return to caller
> v18:
>   * Always use arm_smccc_1_2_invoke() for all RMIs making sure the unsused
>     parameters are 0 - Sashiko
>   * Move rmi_features() calls away from the arm-rmi-cmds.h to rmi.c - Gavin
> v17:
>   * Rename ARM_RMM to ARM_RMM_RMI to make it easier to add Guest facing RSI
>     support, which is also in progress
> v16:
>   * Update Kconfig text to include PCIe TDISP.
>   * Export rmi_feat_reg() here rather than in a later commit.
> v15:
>   * The code is moved again, this time into the 'firmware' directory.
> v14:
>   * This moves the basic RMI setup into the 'kernel' directory. This is
>     because RMI will be used for some features outside of KVM so should
>     be available even if KVM isn't compiled in.
> ---
>   arch/arm64/Kconfig                |   1 +
>   arch/arm64/kernel/cpufeature.c    |   1 +
>   drivers/firmware/Kconfig          |   1 +
>   drivers/firmware/Makefile         |   1 +
>   drivers/firmware/arm_rmm/Kconfig  |  25 +++++++
>   drivers/firmware/arm_rmm/Makefile |   2 +
>   drivers/firmware/arm_rmm/rmi.c    | 109 ++++++++++++++++++++++++++++++
>   include/linux/arm-rmi-cmds.h      |  48 +++++++++++++
>   8 files changed, 188 insertions(+)
>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>   create mode 100644 include/linux/arm-rmi-cmds.h
> 

[...]

> diff --git a/drivers/firmware/arm_rmm/Makefile b/drivers/firmware/arm_rmm/Makefile
> new file mode 100644
> index 0000000000000..65171988fdcae
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/Makefile
> @@ -0,0 +1,2 @@
> +
> +obj-$(CONFIG_ARM_RMM_RMI)	= rmi.o

Unnecessary blank line at the top in Makefile. Besides, why doesn't this come
as below? :)

obj-$(CONFIG_ARM_RMM_RMI)	+= rmi.o

Thanks,
Gavin

