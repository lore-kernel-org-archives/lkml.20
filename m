Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6346C49EC76
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417978; cv=none; b=bUIV1801Ld8MIQN7YSV+ffuPYZwVqAAO4KLg2GQ4n5hS+yZDg4qqztwpOGv6qVoU+ccUqF3ySrWR16UvS0xkmin0vaB3FqhNjW5pImARggje9s7EKoLuQzxLDnTKh8HBycvkl97m9wbJKq5/7Pgo3Ndce6i36lG2pv9Ff9Iz8Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417978; c=relaxed/simple;
	bh=8+65nKi9I0MXjIV/W1tBCtNfo2RvTPk2JzGldsDp5Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUXB6vYpp5PeZba72aZZYjsPm89pi3RPECsCspw2bwuwhXMC4kJtyUE4bOc1dUr+/5FPvHIpmtpbN2GDd5HecDLpo83dRgNWwzb3hmlFHnvykQDYSNR40E7EK5vyIxnnQXQVcX07Qx4AogxV1j4oYGRaXg2YYpNqw2tjNBlNPds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iuDe0Imd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FiJnYOC4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iuDe0Imd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FiJnYOC4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYR4P1485170
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SVZ2YLsBB6VGQtK8NxlN3Z4ynzgoiLnBiZCMpH7eJk=; b=iuDe0ImdpagSJSP8
	pcUICe1qwK2Nh6qBJ/n705GYvPYKqd4woeaWEtiWJh4d+mzUXzHf2ap2wZqe69jg
	NzRkqhu1inSazJPrho8zX2foQZfcpIbbFzC4whh0BYQ+syYQaKpvVNctGXvfQoJZ
	/UsG6WQkn2VWEkdOIlLlINOieiLQqS6Yesu06YYSHOw3XaSz9ALy5stbDFRzelBT
	Xm48hCmKEyY5LbG5z+0aI/2juTAJIu9yb2PlQPRm0rqlJFCANJVdNdsEFq2dbo81
	fGNahXW67MzAmKPcdcEPgNlZStKCvOERD+F7XDFzkh5iaJ4yO1pOjwTAUrADu3Z9
	Zwb2fg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kt78x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:32:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so6675415a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789417974; x=1790022774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2SVZ2YLsBB6VGQtK8NxlN3Z4ynzgoiLnBiZCMpH7eJk=;
        b=FiJnYOC4oZ9ymTJuzwmbWg6zT2ukRmAj2MJHoHQTvod/4y0DavgKAWWh96e2dEMFV6
         s3FZERnfGM+DaiTKcMloLzgkWkK8SQHFtrokKzrHi5TdNDz5CDlvfsdPw0pehx0MgYwp
         euq40vML26PaxdUFaG0gSG9m33H0s5gBbpzTBj8v9ncRbH0ham0/2wxZgKuBwrlorStK
         TC0cfzhcExbez1sspDmtYmY/SZchTO33Fd1v1U8pDrdZjY3JxwaAXC9xouAAqBou2U6G
         14+OpX9g1ntAOt4jrMoJOhkVT1QrNH5jm47m8vKtHBiKc53zTeA/SlhE/XEbQ7Pf4MUa
         h1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417974; x=1790022774;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SVZ2YLsBB6VGQtK8NxlN3Z4ynzgoiLnBiZCMpH7eJk=;
        b=fbABOF7VQDfnXnszGKUB7cCk/ubfC1iL67TOe6nbL3F9PRL75qBu/iaHOEI8FmsDBZ
         TpcmtgPDyVe45NI5J34z0gnyrmXdaD6u0XoeLULCUPw931PimwzpvHnD0pnzQdnn5/Ac
         vM5s+b6jVcyucfNi8ecXjx4WhKXY4Ad+Gz+p9CO0vF6WeH/xc6pRczK5hivzj23MxH6C
         Zj1naweXOBXuknZHIh4AK/FckefcnA2UpATdRn5U4RoQ8NowFZPOFAdH9lli0VOLWcW1
         55CJvW8EecekG5ir2/JMZ9a1EXiOHRfD0Px8gG+mCx3nkbOrxliuSc1Fi/K1Wgc31Oil
         hYHA==
X-Forwarded-Encrypted: i=1; AKwUvBz+EZAMUfDk6RNlssiWWoQ8WMbPDRV5aJ8lTjqbbwDEMoSNm2OMoJlK/YTwJ2lEreGt9pZS1rfU3/bFl6M=@vger.kernel.org
X-Gm-Message-State: AFuF++nDhmp4b79tNlKQZClt67Qi9/xNrJRcd6XayUFP0MT+WyLHtLDj
	GLuJ4OwlmpdhlXguPOPq7E3eRG39+CY1pz52Thfz83yT0MsN7BT5kUeyO3ochKgtP2sWtuE29gW
	HXnkE3HK0XxVGQ1yk6ROEqCJRv3VSSYRltCJQQYYCMzuKa4xQbq1ixLfhU7wZUDgoeG8=
X-Gm-Gg: AYBFou1frAB+WslF6LFQomujtrAU7OGgwBZU+/b7qpQyRPdkboiToyB4hxZCkdU9tqg
	u69yW69o92NjiiHQGXseuaPbfcTdXLPVGCQ2yFwQrWa8MbhHFfdDM19aUTuJ5pOU6/Z8yFP6Q4l
	yw+oiWYbStuYyLx4NlmblVDENWqfZRvkXb6up+tgLok0GaDSVHNZY5i+HDWeJqkUcGV7Qw0Ucqo
	U+8dhUg0aAXSEo5Jc0QZK9x+7pCFmHztN5pwh5rBmat1azpHx0skfMfUe9DkH1DTNA5eCmicMjX
	2OakNV2chlk03ZwradiUA1Z+DaAeffXnBa0cW4kKxTFkuLzEXe/lY77Eossea1FPWcMEJ+Mt9zX
	l0mMB4mMDdrTyaXax63/P92v2VNc=
X-Received: by 2002:a17:90b:57e7:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39dec05d7femr8511335a91.13.1789417973928;
        Mon, 14 Sep 2026 13:32:53 -0700 (PDT)
X-Received: by 2002:a17:90b:57e7:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39dec05d7femr8511268a91.13.1789417973397;
        Mon, 14 Sep 2026 13:32:53 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bd8ad03ccsm9880610eec.2.2026.09.14.13.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:32:53 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:32:49 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Sudeep
 Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v11 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260914133249.00007d35@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-2-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-2-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c3Bq7TzycUkZHdCqmpulZTYnlBFcXWHt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5MyBTYWx0ZWRfXyLlcVXxFUTBc
 +VFi7Gczb8gaQO2mTWFQXGT7qMRdauCYAynVNFxheyfnUvjGkQ5wgD8vnTJI5y3AKf6RVGU+5A4
 D5lIH9PTxEUmdEYXDy8EbRsWzsMxcLj12nXPmNv0aVTqD/7pvpJBQ0Op25rJskioohkvo6nyRS5
 fe4ubzfuJpXywGA/svHkiz5+OBW8IM/IhsS500UdUG/RJhSSQ7sKp+P+eD8h1wSQbY4vNsztDZT
 Ha9zZsVvStAbWDbr4Ct55RDL/88gOqFaSCqeq2jEtxuqJVnNlfLTbbLZjAEVOAe/LNeasQeK+23
 8Fn2bk3pw5gPXs0q5cDBP+YwAKNsgXt+NCPaEGF6pbwAs8FF3DFDvpgj579J+14NbMwff14nIa3
 Di7/lE5ihZTknFKplVXt0X7Y2phThDwaIGRwhT5mOkb1h5P9xKE2NdnAeMW6wU2ZtVEW17Euk66
 PELah1h3UbiO+2fyilw==
X-Proofpoint-GUID: c3Bq7TzycUkZHdCqmpulZTYnlBFcXWHt
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa859f6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=rWZSSP1HmsjXzHu-GLMA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5MyBTYWx0ZWRfX1gJaPwPltdcD
 TvQCQTB9LYcBOu5r84nZd3hMTd1MIXtiKM8LKsyFnFlcmYwZYDzXVnPVRKTj7RFH6qJBq3qTZ8/
 grCv4/0vqi8r/2woW/FvayB8wLbw2sk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140293

On Mon, 14 Sep 2026 11:35:05 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> SMCCC-discovered firmware services are currently represented by separate
> platform devices, such as smccc_trng and arm-cca-dev. Those devices do not
> represent independent DT/ACPI-described platform resources; they are
> features of the SMCCC firmware interface.
> 
> Add an Arm SMCCC bus for services discovered through the SMCCC firmware
> interface. The bus provides SMCCC device and driver registration helpers,
> name-based matching, modalias generation, and a sysfs modalias attribute so
> SMCCC service drivers can bind to discovered firmware services and autoload
> as modules.
> 
> Follow-up changes can then register SMCCC firmware services as arm-smccc
> devices instead of creating independent per-feature platform devices.
> 
> Based on arm_ffa code

That code has the same issue as below and for bonus points doesn't check
if dev_set_name() succeeds or not.

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

On tiny bit of fragility inline that I'd suggestion avoiding now rather than
later.  Down to dev_set_name() doing allocations in some cases under the hood
that are tricky to tidy up with device_register() being used.

With that tidied up

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> diff --git a/drivers/firmware/smccc/bus.c b/drivers/firmware/smccc/bus.c
> new file mode 100644
> index 000000000000..caba1a03c997
> --- /dev/null
> +++ b/drivers/firmware/smccc/bus.c

> +
> +struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id)
> +{
> +	int ret;
> +	struct arm_smccc_device *smccc_dev;
> +
> +	if (!name)
> +		return ERR_PTR(-EINVAL);
> +
> +	smccc_dev = kzalloc_obj(*smccc_dev);
> +	if (!smccc_dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	smccc_dev->func_id = func_id;
> +	smccc_dev->dev.bus = &arm_smccc_bus_type;
> +	smccc_dev->dev.release = arm_smccc_release_device;
> +
> +	ret = dev_set_name(&smccc_dev->dev, "%s", name);

Does protecting the string defeat the nice underlying const handling?
e.g.
	ret = dev_set_name(&smccc_dev->dev, name);
might be better.  Not particular important - I only noticed because
you'd often see this between an device_initialize() and device_add()
and then we'd be relying on the device_put() to clean it up.

So as this stands this is fragile as any error paths that later
get added...


> +	if (ret) {
> +		kfree(smccc_dev);
> +		return ERR_PTR(ret);
> +	}
> +

here can't free the name allocation.

So I'd just switch this to a split device setup - something like...

	smccc_dev = kzalloc_obj(*smccc_dev);
	if (!smccc_dev)
		return ERR_PTR(-ENOMEM);

	smccc_dev->func_id = func_id;
	smccc_dev->dev.bus = &arm_smccc_bus_type;
	smccc_dev->dev.release = arm_smccc_release_device;

	device_initialize(&smccc_dev->dev);
	ret = dev_set_name(&smccc_dev->dev, "%s", name);

//up to you whether you care about const string handling.

	if (ret) {
		put_device(&smcc_dev->dev);
		return ret;
	}

	ret = device_register(&smccc_dev->dev);
	if (ret) {
		put_device(&smccc_dev->dev);
		return ERR_PTR(ret);
	}

	return smccc_dev;

> +	ret = device_register(&smccc_dev->dev);
> +	if (ret) {
> +		put_device(&smccc_dev->dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return smccc_dev;
> +}
> +EXPORT_SYMBOL_GPL(arm_smccc_device_register);
> +
> +void arm_smccc_device_unregister(struct arm_smccc_device *smccc_dev)
> +{
> +	if (!smccc_dev)
> +		return;
> +
> +	device_unregister(&smccc_dev->dev);
> +}
> +EXPORT_SYMBOL_GPL(arm_smccc_device_unregister);
> +
> +static int __init arm_smccc_bus_init(void)
> +{
> +	return bus_register(&arm_smccc_bus_type);
> +}
> +subsys_initcall(arm_smccc_bus_init);

