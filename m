Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB3E4A0138
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418374; cv=none; b=O8R8/xxS6I/qXXHtAwKlMhY1wQzL1roUGD0sN29qLXsgdzd36AIzlylaIj6dbmP+74y2iJuTnK23q0VCe66pqKY1XMrZG0aOcKB6z07gufS1qdMJIQ5Cn6hvYng5EtwmJNFzZppdL+PKxUKDkt94U9F4HCVM6TIs6KFN0c35K0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418374; c=relaxed/simple;
	bh=89nldO+YQsi2DhvH1cafWv+EXMkOYKi6Wr3uymu5UCA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rfsi3p0T6oDuWFQjYb6dyRueteFB86v70shbvgNAlce3srwNY3TVmkKzZJRfPUtaIfJAxtLNc7dH2IKx0QGAoOAaEPWLi8Ne3g4n9dc+E0hI1d6H8qNQeQKHNlMBt2eQlGDk6FWTSh8Qqw+crOPtm7NBlcRQt0PR1qdNkUxxZKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVTjlI6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHaHznc3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVTjlI6+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHaHznc3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYgbv2396566
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPZ0u6hxp+hAJlhrzqqD7XJhS0h3R8VCtazFK73+Pv8=; b=OVTjlI6+q919IrN8
	HWmJfMuqhD6af9p6Alllzrv71c5BiW0nGOMwOfTAi1ho12BQp5D3kiL4sjk5QK3F
	RuJ1tngn/AD6YVH3E0B3e3TIGa6mpAHMCH7krO5xb6l5AMAWGDE5r6/xjPHT5l9B
	E541GwSoMdoCws20sOm9HvB/IK1qwa+rsI4UpdIFpPIvEELIX9KeGHTygqcPzqZR
	ONtmMXgnSxxaWyDnF7Y9aMARlRI8JDXjdTPFLnjUy1d5vzRv0KiSwxB0NHpCVeX6
	werzNw49eEu42KM7gvTwgisUhDI9r7E8e3OW/8flf+6Lng7l0Db/0YFJGyD0+2zH
	FlNXYQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41rq7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:39:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so6407077a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789418371; x=1790023171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UPZ0u6hxp+hAJlhrzqqD7XJhS0h3R8VCtazFK73+Pv8=;
        b=kHaHznc3m7j4JQsa6KTQ79veOwrNP++T7OJYqab2UL1DUXFFYc1hPIxD1PQiFKjXMj
         OUNlcXTrg05da56J8Xl3sBN6m/pqjkgVk4oOVvghZeo29cz2wPQ/b9eQQNpBMsOnSYBC
         bpPZ9pN1wlDPHrYrGafVchZxWYwQZ5cvHiHX4VOmvjXSasnZ1EPqR4rLnSZM0BysYoNB
         rB0wq6mya8D+V+6RETLsCEJlzpwtNfKOX5x2uCXVTELn0Xgk5FQZcSEswGN6ZuOhLMrp
         IbmdrSq1G9p9aIX0N5/Hipe4XiakPTeoiUpvrmm2mR3ra9RIVe1AUJXTXl6HYPPi+J2o
         c0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418371; x=1790023171;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPZ0u6hxp+hAJlhrzqqD7XJhS0h3R8VCtazFK73+Pv8=;
        b=sSXNsrwHV6Ipyq6j6yfCdf4h21j1T9aN19y8tMGlqBSeuDj81AVcvTWMTzooumru1H
         8uThTkPoh9nrF+256EdeGIwn0K2Jk1MTHOwPXvH1vhzYe0YdpMCnGuwHrl4fLNaoO1ic
         pzZ0HHzTgttO6ReU835xKfM10HjAyvSwIiPVp7QjqcP6ny5+Q4aPP7+uD9tPj8ilAsO5
         QhdrtSllIpyCaGIyIAAhTniU7EzeM852JGPVR0zxO/6JGgfga2ZEmHkPBZkx7yrCj6tc
         fuXpx3UGIN+F+GzmArEaDjbgvHa2G3BeNmz4/xkN2dDfAaTKY8C0mouC+0810+EBBRcw
         pTPg==
X-Forwarded-Encrypted: i=1; AKwUvBz2QpM7aYaOk6XfjCOsg9W3lVDZ2PVEY1+jHsl2JVOjZVqqpiQpyewq3RbEEGM3Wx3mp/aml0OpuHmbTfs=@vger.kernel.org
X-Gm-Message-State: AFuF++m+/13J3XK6OSc3LPoZZAUt2AmxvCQBBJTrpFaMWXJlZyc5n8mo
	6YioHzRs7lQK733FTzbdGWc2osS6nZwBSijzejD8FcSlquZXKDPCn+zkyMYmRRL8yRiGxZ7xzji
	2AHN6b8KaoKKo60aGRZw8yEno7snsgQg+BJWCcUvrRmb5YdA6ygKC+G8g6lLi7L9JZPc=
X-Gm-Gg: AYBFou1VCWRpymkNk33dl9IDnHkBhOq8BqrRPTAomhXAib0jXSvWNLhBgRGFYpZAXuz
	X+F2tRNvaazph5T6rPU7llgMVlRvcnghGgu8HZCqf4Yhc7RdylbBIBqCdk+WuYgovvjFMX/4j3u
	HieSYFdOHNYHqagvIbmV+xwuB1ejXN9AgOlmN5EWrGRmKq/e/SEkanRXEmZ9Y7k6wrF4Jl2qzHI
	ByGwviJQmR+kBbV7ujkuY6ff15GZ1msWb95GjeTXMBG3II6nAda3psHavxV0rjZNXL/IBMZEIYd
	Ji/SzjyWL+jIp1FRL8HJJofBB+Dws7+w+QObI8lgukcjDtTaFK/pjNjnIKTdlhaV/aHlAtrA0RP
	zPLbOkHIUpJJQU2zYBxgB/Fu/ggo=
X-Received: by 2002:a17:90b:5806:b0:39d:f024:c7e2 with SMTP id 98e67ed59e1d1-39df024c8d5mr6541274a91.4.1789418370985;
        Mon, 14 Sep 2026 13:39:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5806:b0:39d:f024:c7e2 with SMTP id 98e67ed59e1d1-39df024c8d5mr6541236a91.4.1789418370475;
        Mon, 14 Sep 2026 13:39:30 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b759d0sm28514523c88.7.2026.09.14.13.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:39:30 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:39:27 -0700
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
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
Message-ID: <20260914133927.0000479a@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-3-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-3-aneesh.kumar@kernel.org>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5NSBTYWx0ZWRfX3EPWkqOQc4Xu
 OeHnLC1w1TBcV7BuYDo8Nk4pBSxa6uoOBRBzC9yRh8c4VtQ3pLm3SsgFvrvj1Ent5GqzNN6BUnd
 EE5/L5Gooq6DVh+rZFMIHEsDGhTJSJ3xMioRs60uWARrU0KEaebmdLwweFzu6PEKW77022sxWEA
 JG3s7J4jdeml2u7oVQZ4eoDFogNpLbndDD2EFc+ehcQTgkmvBgonNS6u39MwOVTeoV8YK3Xir07
 zPTAvPGDwIu+FZouliPfn+c6X6RSsH2sNXS0E2dYcha9fMK59X65xItk+a3Dqt8IrZHBhy570hZ
 C5vTNPgk43Ixn/pWuZSXcCEqxg6ILJUrgj6me3SwiIHNhzXx6/AWdX+XRy5eyfJBmqB6kHpQLKS
 qiZkXl4u155JQkp487rV27kLUSK8TH00eJQcGC6tPJWC1jgaN5y3jtQqrW/64zvlFmThKM8KZ3n
 C7Hnq6YSnwU7asCuoJQ==
X-Proofpoint-GUID: KzwCW-hKyBWrsdfXUumYyyHutkWM3jwm
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa85b83 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=hwAxrWSPLhvteNngLDwA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: KzwCW-hKyBWrsdfXUumYyyHutkWM3jwm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5NSBTYWx0ZWRfXwB+Dt4Y4rb35
 N2BIRHS5vRbMt+cqC1ar0VBLfLkkFtklY6E24RSYyj+Kq2PobZIUPhBN4/rFpZgrcU6o61i9GrX
 XEuUTuWCgPgai5lBxtbpgta8xkMChy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140295

On Mon, 14 Sep 2026 11:35:06 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
> standalone platform device. Now that the SMCCC core has an SMCCC bus,
> create an arm-smccc-trng device for the discovered TRNG service and convert
> the hwrng driver to an SMCCC driver.
> 
> The SMCCC id table preserves module autoloading for systems where the TRNG
> driver is built as a module.
> 
> The sysfs device path changes from the old smccc_trng platform-device path
> to an arm-smccc device path. No known userspace dependency on the old path
> was found; a Debian Code Search lookup for the existing platform-device
> name/path did not find any users.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Trivial stuff inline - nothing that needs changes
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index bdee057db2fd..756c79204e44 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c

> +
> +static const struct smccc_device_info smccc_devices[] __initconst = {

Ah. With __init_const I suspect the string constant stuff I mentioned in
previous patch won't work anyway.

> +	{
> +		.func_id        = ARM_SMCCC_TRNG_VERSION,
> +		.requires_smc   = false,
> +		.device_name    = "arm-smccc-trng",
> +	},
> +};
> +
> +static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> +{
> +	int ret;
> +	struct arm_smccc_res res = {};
> +
> +	if (smccc_conduit == SMCCC_CONDUIT_NONE)
> +		return false;
> +
> +	if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> +		return false;
> +
> +	if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
> +		return false;
> +
> +	arm_smccc_1_1_invoke(smccc_dev->func_id,
> +			     0, 0, 0, 0, 0, 0, 0, &res);

Fits on one line. Up to you though as maybe it's cleaner to have all the numbers
start on a new row.

> +	ret = res.a0;
> +
> +	if (ret == SMCCC_RET_NOT_SUPPORTED)
> +		return false;
> +
> +	return true;
> +}
> +
>  static int __init smccc_devices_init(void)
>  {
> -	struct platform_device *pdev;
> -
> -	if (smccc_trng_available) {
> -		pdev = platform_device_register_simple("smccc_trng", -1,
> -						       NULL, 0);
> -		if (IS_ERR(pdev))
> -			pr_err("smccc_trng: could not register device: %ld\n",
> -			       PTR_ERR(pdev));
> +	struct arm_smccc_device *sdev;
> +	const struct smccc_device_info *smccc_dev;
> +
> +	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
> +		smccc_dev = &smccc_devices[i];
> +
> +		if (!smccc_probe_smccc_device(smccc_dev))
> +			continue;
> +
> +		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
> +		if (IS_ERR(sdev))
> +			pr_err("%s: could not register device: %ld\n",
> +			       smccc_dev->device_name, PTR_ERR(sdev));

Could be friendly to anyone reading this and use %pe.  Up to you.

>  	}
>  
>  	return 0;

