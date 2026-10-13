Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671225013B9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902695; cv=none; b=sKuO4wTii7EVvIabuKk9DwUJTWf4dSbUszoZVM6ZaliUlwtOExm9Niqk00EyXqMmkPydOLT08aqX9dkO+av/S5+Oua3K6em9E6euovuqI6LXD1fVAvmRcnxpZH8tBSTeNbbfQ9pqtdJx/ioUbwVkrRamVdVAjAQikhmA1lK+3aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902695; c=relaxed/simple;
	bh=hwP37cpMczyq0SyfyPPgo0PEVEDBe8eAaeSNpuvc5x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFkaQZGdMkVa6CbI9+QNU/I+7Un2Q0fZC64atlnfQ8xXKmV2S30b2fFzfYmCss7jRZjPi0o7+OZ9IPGrcrvyzXhCc6kte6/fca+0UqogB43Z3pwwQoJD5NmgQA7ImaxuewP3Ye0ZnDj1sEAgwh3/wsYUCjknyXguuo87EmBONrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJEKeZYp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RoEzo789; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJEKeZYp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoEzo789"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE46n4009529
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jn5+APV5tik35vKTyv5SDo1BdhvHgJ++Egi5C5rl0Ug=; b=jJEKeZYpNFKDiW88
	82aujY1TiobMCa4RlaigQh6hX2aolJMzHOxVnBTjqgCcwpJKtZH9Ma4f4Tde8ysj
	gx0akhTgJf1yd/0Q3uBgQFi/9zctLFIbkcwIg9sEfiNiOBnIaWKmAItswDuwJVHS
	qZiIxOJvWJ5cGxRiHcDW7gh6eMBC4ecJLriNE/pE7Fy//eizdO1IfFysp3pxj12B
	UMk/QV9jMwgvk3d5wWQX6BPiKRz4OwDZ4YEG5iidprEH41UH4QOiSrclnbDpQI2Y
	OJt9zhvGcPP/wAGf/kG5h7I5l7r/xiuFC3JcohJrrGiUsOu2CP41ZX34tRnVFeP3
	6veqYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjj1gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:44:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso37447685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902693; x=1792507493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jn5+APV5tik35vKTyv5SDo1BdhvHgJ++Egi5C5rl0Ug=;
        b=RoEzo7899derSOCdjBXi9ZNsWz+5Jt2Si7mIiJSPKL9MMcgGXMUql2qLbM4a2E9EIH
         LpKhxyp/FmGLwwaD8dbPq75nWzFpMaKmuapU8Tx2Tne7TQNCgGLYY2JY6DF4fLMmyo1c
         IHwj3GQOq6amkw163fKns6Ub32ppYPdutawR9v4D54nHv351Yd33CXfxJNt2diXBufma
         lU2sOvtK/vBqdisE+uPPVbXSI19qEX0+X0Zycppmft7qbsqrPx6hzCbwGGhdFQp1WFOj
         VwZtRm+gsuVtFGEKoEderkVUMnER0cjPJkuffHpKPibUTDwp6kZIbfTc0oD+VeKVO9NQ
         yBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902693; x=1792507493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jn5+APV5tik35vKTyv5SDo1BdhvHgJ++Egi5C5rl0Ug=;
        b=VNtZRMt5LeBDzFuwXlHQwoqD++tBlIDD08zQy5EDZ2VMCLD9Ypl4OFtU2xIcrFpVdF
         lfN2LdyMEn25wGmSJIONWF1Ms2U/u+yAR8D9+shcBeQtyp/6ZJRKVQolLeLpND0c0VYD
         lR1SkyRLRbj3bau/ti2YwtCkKZ8+MzhcWLvizct6/pDypwk9zfZA6l5BFt+TFsK0BmNo
         aCc+bCibw35I49rFGFQPoTHwJl9yRMAy6pJhR1WJp1hjh+24Us2w9KSxAbzZkJ1c061b
         OJ5O9FsRt1gBbv8IAWWdnPZ4VcxwRR5JAFKuK85wfJbGYbT/B38tIf6DlO9YnjxwT4q0
         F0Jw==
X-Forwarded-Encrypted: i=1; AKwUvByal4bJ+kP/zDt1ZNbU3S43mNZ3Cc8S9zbs67RPxPF0DhMcn1PY7u4EaieED0+gBfaDvB38vRCOTyhs7nA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3BkUEXNVFqlaPGTalvDhKhzcZd9Q35u1xMbW36zTgl6k5NvSD
	R5yWp8zF3wewTO6S2mZiZh3qr0wtCL+6mjgReR2yKugRetak7DBDPoe6zy89g/jVKmHhkr8MPL/
	zlCFbbTXOmivJFSW2oyCk0rQtVOUE71IiS+nxwnl/IxwAHcc5RsfOkoLMWl2VWqnADMY=
X-Gm-Gg: AYBFou39ktNNPJTbhXlbJTZA7ZHpB1Dv+mXb44hvGVeOWuBcHoyORWcZsoXCA10Mvo0
	mFqJ42lay1F9DgS7TxGFQpA+90tz5NskYCzVFAmoEsiNkTz2z6r24PXeosyFB2RG0EhDwDaqlxH
	q+2G/uyZ6qYz4neVzxqshZhkFhDJGeRJUSP2Pz2EBHOwg7RWoP9vZeVB1MNHyft0Dasb/yv7hGH
	5VwA/pTH/8iYSFLKy804fbpuVRFPG7fWE8PqQy/t3YvnMAOx2qXTOakfSPNUscyZMdr6l9TiDmR
	AP0u+44QjN3/rw2cStQw1/EHBElvN7pvXQ3uNxh4Jhwunln9mvOdBn0AgXZzASM3fIvUKe1C9uV
	38/a8xPPCwXw7c1+LdX8oFQ==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr2560162785a.3.1791902692549;
        Tue, 13 Oct 2026 07:44:52 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr2560159985a.3.1791902692091;
        Tue, 13 Oct 2026 07:44:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm6636032a12.14.2026.10.13.07.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:44:50 -0700 (PDT)
Message-ID: <071becdc-c312-4cb1-a7f0-49f13abcfb29@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:44:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] arm64: dts: qcom: ipq5210: Enable download mode
 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-7-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-7-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YYHOYfUM3aosBBQoV_CvmbAco97fAS_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfXxLIs89fxGBAQ
 Dp3stPlvM7Qsqp69CID6jFLjtdUDZC8EMDcfXcqfzwQVMeyw1z+qDIC99OqpWbuO17cJLejYdbM
 QKFGLi9HEVvfOZ8WMdHneYGJB59EjOI2I44dhe1xITbLDSyOWawUWbdQ9eoZbjbJI+Y1E87Hqg2
 0+P7Kcck4/07Na5kTZXezHDMLyvgmNhP82kHezjMt6TOhLzzD9QTPnJGpF2Ie/D5EbL76DCNvCQ
 gJKmc5l66HR61tVF334a7GYCeF/fD5sQIBqYHVXyUnClQBSLje6yiABW3PXjf9l4HcPoA2avtSN
 MVqkfrFPz5PQG3JDGtmw6CJaVzV3gLWq7ZAw5axCefz3BZSY/XXuPVbP4ARx20yFXuxnD9eSuHY
 nAVOtpt4Xvop20JK+FaNjINr7HadgpMl4gAhQFDOcjRYwhi1XWBGB/lzWngzfr99SMSpBa7Uhxh
 HogWDSZ2rd16GH4Fkyw==
X-Proofpoint-ORIG-GUID: YYHOYfUM3aosBBQoV_CvmbAco97fAS_b
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace43e5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Q6H3BXWa3Vqah50dtTUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX5IdvsaSbVgxW
 YuISl9emEkMOeariTEY+EEiHw0juBLt8hZl2X1wbjEQK4XN8LvASr6OcjihARLLNTECN44e58IK
 DovG/YZK9G8cqJuRxHUeudnQTebJjSg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Enable the support for download mode to collect the crashdumps if
> system crashes, to debug crashes extensively.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
