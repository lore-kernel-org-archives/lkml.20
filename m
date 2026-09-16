Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A494FC8F7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565880; cv=none; b=HYeuPC5uodh/RMtzaYsRvuuU6Ri8q5y6PfP9ujESmDaD0U+WZOTzgM0hY6Z/wS8cxMnhQx2bdB8T4hfIwKqYXM4gZWF3IqL/9U0Ss2bvLbyLhH0zBvwhxIs/xCkKjqV7QZoCAeO39LPRoJWRPex9HgHtsubQ0WOuz890h8wMU5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565880; c=relaxed/simple;
	bh=dli4thVl0/lxjrbuWQYG1n75DsupJDZPWr0t/4D8kHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iR9U6vdJjjyotp5EtUB7MowDfVVEqsv8/6NeXmfgUvTa8n21szBA+ILtW4TlNzAXWZlKeuprFvql40PLxrpq5bKNkb4k67bXmcMw0damfOTyL8ZIPDngv7RhlLs8Q6ZvKltYFK5OwZosr8SHiVWFtir8ITJQI0p5MfVcD7jVa10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNlAvkQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KIhfP3rP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNlAvkQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KIhfP3rP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYtbx2586591
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+yROzQlRt7LgNDY92+8DzprGrYcUOrZaiKl227u+Jc=; b=dNlAvkQWB40U0DnK
	N06gp19Onp4iXOxLmBey8HgViZ33AnXPvyh+y+CI0xQndwQcRE6GKx4KtqoJzK9V
	EldxvBcEbEiLoqBLRZ+NXDFH1I64391HQouqFLm4xabFFt3kA1J1y6nDtKmmDU8q
	FdeFx3MgdwVr3xtv5f14i5U2U4zXcB20m6lxVime6wdc1CZuHt2w5IonvjxlTSNp
	lkbG9pbLjLViKr4qj4Eupm45YbUfQPiZO+/mmaEdBc0bV7x84zSlXrRDgGLadnQL
	vi39DLxo4rmTsudhQ+zlG7XCHwWpgOgwJPBItawy+KX9w6VRwaFjfnewF3/9ymEr
	zntgGQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7j8ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:37:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dcfed75f77so85132705ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565871; x=1790170671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+yROzQlRt7LgNDY92+8DzprGrYcUOrZaiKl227u+Jc=;
        b=KIhfP3rPRFKh3UX6/GnHZa9snqrt1q/zjOuSfA7u9x4JSng7Y74aKmyHWAOHUYpsRa
         oXSMiNKsGuZD09Ie/UNRqzhcvo7E2yNE9/MUTvPyAg4iFgWbqFRO1eo/wXtyyTHQOaqD
         UASXzvGPQO1c/5IZqs4tCajeHy0E/6IGPdDNUsgiEBhV0NfWC/V8jkCSsl0x8siyc5CA
         lQAdtw1Ut1JfGTHInLZVRkEfkvqP24T0RKZfiV/I5hP+RGrVR0Wvbqb1M6Gh63QBGhJ2
         oWmqdKJEZ6tFuNnkAHXYBBsfjbbc0H/0UqgFIi6QPP+y/Y9cjN0/ts7qeQLWBtJyaK8s
         4z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565871; x=1790170671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+yROzQlRt7LgNDY92+8DzprGrYcUOrZaiKl227u+Jc=;
        b=TxvbyEmDHzUfdX8ej0wfeiUPOYoj5nC8K4YV6zu9DYov2banKHI+rJvlxCfAI+gBPH
         lgSj2inswufsPincVpNitHFt4e2jVrSxDWbIA7yeCe0Dxfs/shCu+hhqeVYr0kHJUtUC
         hYEIGRxjqnG4O5Up+HICQfzFboy7HC7xBUbxECSMZrMPenjN3thl3BZdW8XkV2oB48jR
         CdW66oCHUwA01Bml20oMjpbI256u/MtNa8NZJvIeHkyl2aRUji41TppVRzG0CzOrRVYR
         UNQdsuOztSxvr3EkmmTDRTjSBtY/Hbbct+HyBaUHa0/6D/K+JaytihZSL87B14OB6BXT
         HLlA==
X-Forwarded-Encrypted: i=1; AKwUvBwhBsjacm5kh72J+/LBWjvJmrpq9JggWTFlVSiWy9PgCdfOeFoFjqHkn1vA8J829H8UxT1mwSQFm+2bx7g=@vger.kernel.org
X-Gm-Message-State: AFuF++kXAWtW0EjiS+4YmLbx+FWgH2etSDAYLl9NHz6V6UoFSxpHDJeR
	kMlq9AaPsUuLeZANSV9kIiPoU0NIZJYd98BVsD5i/GIgQ+p33B/O8nEQfM3/frzf7U+mdfGtgkt
	il5vhY/uPXJT+jKrEoeATbFnrwZkJuUeEgA/bdAV0KzvFAZJiAfPgknPZgi99KK1Zlbg=
X-Gm-Gg: AYBFou0aMEf0pnQv4WVaDOp+Am83kdrtOd1TOOxiBFhN+aih6TyL1uFCUkpIVR2/MJE
	Chu3qn1asKHG468lsNlWjBJPsSc33ZmnA8o8ODv+GlO+OL4qnxBo6BwVZc0+6Yqlaj+OfI9rXWG
	jY/9fSmWNMo6qf7Ai15dDAehxMGQBxYDLfd9mNXjYEncIVwPW/R/rHbwj6pQK7Cho3TkYIj8oJv
	mJ9ZKf5AN/7+EAR36wi3lMdNbOwCD9vHOWOhBnKS3c73lQUuEeJV0/Iw7EniHLKegHKAWVqE9EX
	WA4Fl4JiVgolZUA464Iv2IAwaqSGSVBb3ixnqK2lsYeGLi8nCcSkHbtVUJIqp6mvSJhwcJqaD+m
	0lufK/cchFaLODC4f4BidJ5RbiMGoV/oG
X-Received: by 2002:a17:902:ec81:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd8e400f70mr59986385ad.13.1789565870674;
        Wed, 16 Sep 2026 06:37:50 -0700 (PDT)
X-Received: by 2002:a17:902:ec81:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd8e400f70mr59985535ad.13.1789565870074;
        Wed, 16 Sep 2026 06:37:50 -0700 (PDT)
Received: from [10.92.206.34] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d905f8sm12020575ad.2.2026.09.16.06.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:37:48 -0700 (PDT)
Message-ID: <88b7e836-4dcd-4e69-950a-c844e88ae7ec@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 19:07:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Ignore -ENODEV after Root Port reset
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260916-topic-pcie_portrec_enodev-v1-1-5dc7bde39552@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260916-topic-pcie_portrec_enodev-v1-1-5dc7bde39552@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -eRUM2Eo3Xej4acR5nwJM3TMZkJAFC8A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4MiBTYWx0ZWRfXwgMHsyCGaorF
 gi3qq65OqFt+uvlihaQ83/5NagO5j9T3yFgzdhH4HFa2E5bpkSAiIznXpuwtaKxawV+6NeR1Dxv
 KyokdhsHKWSCgddmK2LAuOhQMsV5rGwrZRtzyUsja1imp+jSCp7k+KSImWbWkzoOBdEH+3gZHfY
 58M2yCdwSbgVk7L1UXhC1+u3HLFoDKi4IBivyfYQUkJQD2qs0FqniGKOOWZ2xu9yBj0L8TBiRLl
 3NyVotgE8U4XJnwnvfKhy87HueQ1o54VtUZjub0VBq2tL3yNWCfTeZea8Vp8EgTzR3A7fAwCC1L
 5YtQX6uyPZdCFiASFbr/OnbcG4ataM3E2aS4Oxlm1TxJNUkBXGyTHE6gRWZx3Jv/9pE46COFh8x
 wyJXFPLSQy77T0C+l/kqlPMCxJywcVoULNAcinx76IzF3mcoNO4yjlcdyj2lTwv2TE4kv+U11hq
 /P+donenCFPL1dGsZgw==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa9bb1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=U-vv52QimnA-Lxqxps4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4MiBTYWx0ZWRfX4gJtbIhfRlmq
 ZdB1OwRfa1+H1LslsQlbJdDtU1BDsHFgdiTTQAHmR7mVbNkQPUkGev/0n5qI/n1VO5/iDoQ8aOH
 xjYuJQd/wCfwpg+egZIwVdrv3lXxoP8=
X-Proofpoint-GUID: -eRUM2Eo3Xej4acR5nwJM3TMZkJAFC8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160182



On 9/16/2026 6:07 PM, Konrad Dybcio wrote:
> Root Port recovery may race with a device hot-unplug. In that case,
> dw_pcie_wait_for_link() returns -ENODEV because no device is detected
> after the controller has been successfully reset.
>
> This is a valid outcome and should not cause Root Port recovery to
> fail. Ignore -ENODEV while continuing to propagate other link-training
> errors.
>
> Assisted-by: LLM
> Fixes: 4d88cb82a6d9 ("PCI: qcom: Implement .reset_root_port() and use for link down")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index ee63a6ec99de4d07c16b8d6cb68df0d92f822cd8..3d3be9bf798b7c247d69969d6570385b8648123f 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1880,6 +1880,9 @@ static int qcom_pcie_reset_root_port(struct pci_host_bridge *bridge,
>  	qcom_pcie_start_link(pci);
>  
>  	ret = dw_pcie_wait_for_link(pci);
> +	/* This linkdown might have been a hot-unplug */
> +	if (ret == -ENODEV)
> +		ret = 0;
>  	if (ret)
>  		return ret;
>  
>
> ---
> base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
> change-id: 20260916-topic-pcie_portrec_enodev-cc576ea927f9
>
> Best regards,

