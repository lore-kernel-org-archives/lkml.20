Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABA3367F4A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829035; cv=none; b=OqCbv5E8pxg9jsaCVF4gsBaY4d59kclt3oW5DlWckrrSGc1L6Mh+DOuMzFFjM5QjZKMkDkSRa6mXj+1PKwKnlZ6z0J3LyVgxIEEfIJ7lK1fXvJjxcfH2xZwMVtAJgx1vOHV0aAJ8lt7ZWMMyH8unri3fovsQEXbyy6juxngwpWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829035; c=relaxed/simple;
	bh=A+HAuPGVEEtFzzKIx71J1O6XHYUXXh3Xiiqvz/WV3es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCQJIoB2pvMWIc24NtfiYLOxn0IXqydZbaKGxyxjCspbb/5+REEaK2/QMUNsunN97uYrQ/njUNU1QCzxxUbYPnO7HUXcB7lkzVDxFvsAw4thzhAxuPHqnJze8ER+DvcCN5mUbWO2IX4Ej6+GnC4g3JmuH/iaaSCq4yKjWDcSdBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2DLjMEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDxDXOFg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2DLjMEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDxDXOFg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gfdI1240355
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 04:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=; b=F2DLjMEmYfSjhk2X
	dxrAswtz4KApnEFFKw39luKImAWqHKPw4tEggoxkSQhe5gP1yTsW/CxVO5ia0mSS
	Qog083o9xcs8b9kX4d7rZL6w2QNQtXvUuCXy4+c0Vkonl94yIfIldcQy6fQo/JOX
	SM5rQjFR7kg+zHYxvflmKBlQCZTF4i20rHBIoeS5HvLRym4rJrBkh/xWP2TJzIjQ
	pMtnnDVrNqaY6/7CIovA8QqshTP/hxGxMJTQUibQIU1m3l4Q09Rt1iCLvbqctL/8
	UuPyF9a5HEGDS4tp8SG7l5TsB/Tc3jnedS0dNeHnqLI0KSjHxhaUoILd8oWEtCv9
	BnGiYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pje8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:30:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso8543723a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790829032; x=1791433832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=;
        b=YDxDXOFgIY+oEdtvGLlNZxYPhtoM9y5xidKMzB8HjFuBEjEoEKEmwLzDU/G+8KBKl2
         vftpo45RloKlC4O8ADhmZnjAiMdw97kIlljan9coNVg0WyQZxvRQCM/ZtiKF/uzsZ0GP
         KLwY5LI3CnqcDNnGg9nx7YZmKiEVt46SDRa0HBz9GaThhMzAu/BE/3OPKrrlwn9D11pp
         HuP5ZRtLUKuZ/TjNYBivCG66D2c1KcBmAdP1VGORQLbvtxTbhydVsFxG12tgD75fBJO1
         Lk7AAWyZkF594exItNwMx2i9mQs1IHhUDWjRFwf+iF7B43TBzEPcs0M9rJuPOI/sqMm4
         ReSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829032; x=1791433832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rw9H7CLFAfPrFnYMkSIdA90XBAFg9HVemgdNbtcsSJ4=;
        b=sNnOgC9UcFVtqACu257jYgPHg0EDhGV8ysZEWExpfN60HWdY/fKf5uHwClO/ni/G59
         CsAM12fAFy0uoBp0LlRpqgvPhb/prKVtqW8SE0DrHV9kuEkhFO11EJxjWy4nYDmTUWSf
         5Cl40v0OaK9btUAqMFeBz4OldyMzeLNqS3inEQvCfwLBWIwsIfVhQ/ZShHy3vJt6TxSd
         LP0yQ8eDztTxY73yOoUlVM0aIZiZeI08kTK8uSIAZMQLq/125Aau042d257sPgz1e2ow
         jn/cZaAgmYUyzhrHm0OCWFt5d1C9eiQ7yOV/dgDSSDOT6XDYjzMs9zU9/iA7ixHZWFPC
         V9ew==
X-Forwarded-Encrypted: i=1; AKwUvBxbhxT5YZGwcqF7mN7cAcoXXxNKz+Bx4DN3T/GO2JuRZe4M1gqY/wV5a/VqdVxpo1I92FArPd4KnN3SLBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrFB6BwRQyZEPpz5W0BjJIHx/FA4fhlM6gIiW8kZkNG9suBxRf
	jGhxd20RuWWbMZdxnR/VVMN/jgP7qXnWf9/wVFG2s77tnuBXYMszynF7fRpPrLmM21xRTNMBFk3
	RPCQiWSML7Bpw18Mt50o78vq2QJQtgNh3xiUyLlwwVT7ALxLfEFlj8RkVLZtHjjfYHDg=
X-Gm-Gg: AYBFou0xlT7PYlBe25T2iOSqYmXczGW8JGjp2je+zK1P7Zw38XImNOyMUoKsWqVCmst
	fC4guzqiZkNDtXNz9rx/V35hApm2nrw+DuZeSIqOgaGuUXXTKMjlcuUU0xwF8Y/NjOU0kqX3fBh
	CY/YMn6TRR/vmZNOVYAZsO6+wHFQGowwQaU+9Pulx4WFStt27IBseyBqvg/sQC2uZ8xOivrzuE3
	vjZ67DjfJLkDTF5couK94tNX0q7D82vNqtAPrOUvTG4UnahM6WCvwpTm0q7oi7IkUmm5HvVBa35
	v7FGwvRj6UZWWUOpACjKbvPvpowBCA+9OuySmPzmcJ3ArM9aeTuYz+zvtY/0mTiGXYY3C82Qm+N
	/CvZfmpeqlCsVC2QMaVjzPnrD01xJRg==
X-Received: by 2002:a17:90b:3d8f:b0:3a2:11c1:fe77 with SMTP id 98e67ed59e1d1-3a4d1ddb1c9mr2358357a91.67.1790829031732;
        Wed, 30 Sep 2026 21:30:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8f:b0:3a2:11c1:fe77 with SMTP id 98e67ed59e1d1-3a4d1ddb1c9mr2358336a91.67.1790829031165;
        Wed, 30 Sep 2026 21:30:31 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4372f81sm2370864a91.4.2026.09.30.21.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 21:30:30 -0700 (PDT)
Message-ID: <3b766c9e-fcb5-49bc-9238-48caa085b5a5@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:00:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Add QMI TMD cooling
 support for Shikra
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-1-96c1cca82f30@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_qmi_tmd-v1-1-96c1cca82f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VG8kUncPJMW30YEI99ZvQ17Mg8BFnRlQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfX4TTZAr7+8c4y
 vScd5n/DrHF3C0V7iFSRPSE4+1GxrJrN/NlvPy8igucD1Iox+yRvlJYNy0J+xzKVrQVNRnkxGc4
 MnqUsKDfgx0ydY6oXlJOaQpgebzmlU0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfX8F/yWYCxVicw
 I9clAmfTkZIxMNHAzorU6kXEUPdJdS01QpEfEUARdsujSTlU30R123/AcaJSH+CpQ/DmfflTic7
 K+USQWWKcCzaz+62VIFRYVIqR+QR39gvT5FmPM4VH8Osm6jF3J/pqlzoTFaQZe90dm/hqs6doBw
 /3cfUCBMXCOQ1HdXjphVWK4FQKOVBO/6G4+xmhl9tsVAEszwps51smoXxJIsPCW0O8p9UDaR8Zd
 I5jjQACLcDgCp/YZQSuIvu+t123qs2mLX48iWa0BHmYGwLcNBlf9ATr9nhCD2h1o6cSG/ybk9SH
 E/UElvykkSTXjAE35jRNpPJ2gUY1/ESnmWt7idqFxeQqtX8c5lI/fNT3xhtpVYap/klFjqYWuXh
 k1v8gBaweVshIjVlL2n+2K9R6hSOaoY1kdD0BMZc8I+nt+0IGwngdD+vZulqB4qnjk+kxqIFIbr
 cn8wgaaQMJwxWdcLDDw==
X-Proofpoint-GUID: VG8kUncPJMW30YEI99ZvQ17Mg8BFnRlQ
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abde1e9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=K35ozmOADcEJOmzUQUIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010017



On 9/11/2026 10:33 AM, Dipa Ramesh Mantre wrote:
> Add QMI TMD instance IDs and cooling device name arrays for CDSP
> and MPSS subsystems on Shikra to enable thermal mitigation support.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..3daaed6ca596 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1660,6 +1660,9 @@ static const struct qcom_pas_data shikra_cdsp_resource = {
>   	.sysmon_name = "cdsp",
>   	.ssctl_id = 0x17,
>   	.smem_host_id = 5,
> +	.tmd_instance_id = 0x43,
> +	.tmd_name = cdsp_tmd_name,
> +	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
>   };
> 

Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

thanks
Gaurav
