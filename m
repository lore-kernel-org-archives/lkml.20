Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023895;
	b=nxByAd/YUQowgRyME6+U5N91veaJ53eTV/K/5dnyZ4c56xqt7Y+ckEv9K21VzOXuwgQq
	 b8I/s585w0nwhmIIeYyG+sePikjDVn88n1+R1CXdx5FHvLZL+t36jtuV6ksiiSvwhJrrh
	 1j4y1OWbMJ/zjW+XO8f0GXIA+OCzmuWqH+EwQZ1HZnnQvmw2ob/JQiOcwQc0pm4SsOzNU
	 BM2g6AnBz1wnuIvGeoc1JkwFnjAiRD/VhL+FtVCp7nKmJ6Iew4Q5E7WpaRoWdzKe6dcE6
	 ofExWvKSj45U6Qsgk2ZA7y32O6YBBZI3iDNuBkCQmVr/dKrvPTTmRW1BvfWtVTws2Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x5OUiKwAQQjZIMun5+0lDkR9h9x33L88VUeqAVX2zL4=;
	b=YB2oC6702M48T1iaCdBVaBjY9AxIBGX8X5z0AKMYPz02LgsuPx5g5uUNptCgZJJ3F8cx
	 Xbnby9UzBactZ0N/cRUj+15rVtXl6Md0WjRbanQurqIxZDNJkR5qTcxj1K5wfwcACtUkr
	 Rl2k8Mrb+RfO+jNa4wrq3II89ZloLk6avUBCbjlKTzyYxw9Ppr54TIBkDSxAXLsOUMSoy
	 ErxwoBhdzvcfa5xdk1hBnya7BpBI3pqMflz+6lKfXhSw2p2RR3L5UTyBAbgWtTVfCKrkp
	 XoqkLq0wvCxv1Xj/jCaM4uxyHmRoj4RilD5XFgArfo5kBgiu05IjtOpznv9GXUIOjIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Itxi7R94;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py3R4D+d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2A6606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA2A6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Itxi7R94;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py3R4D+d
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0O72732751
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5OUiKwAQQjZIMun5+0lDkR9h9x33L88VUeqAVX2zL4=; b=Itxi7R94HI5KPy9p
	6yhs6OW11FyFFsvCLrXD4HdYWB9laEwHkrZe/1/5kHmb0QwPd1kY84tJl8feyH75
	29GIuwALscI1gsWNbeRVI+PKyF2rLDzmYspt3yxXp5j7eHgVVgJn9nwmf5Dv1Cmm
	uiySiATjiax/X2qTxJNx2RhHrlf1sA+yNYQocY0T5iHITCeCm62u8+9I54Wlldtd
	V4fv2OTFJ52xSaMacmtTaNRXJfrZcVoUY8ATbW/j91KeuVvfOTXMnN74goXj74Yu
	cUOuZwxUVcstzhkH2KAE5/8s+4cDdBFpZHQaxi3gfpO5HI90Zc2oVbiAKl0u6f+t
	16ptsA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp91dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:11:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc081f3066so82813137.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023893; x=1793628693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5OUiKwAQQjZIMun5+0lDkR9h9x33L88VUeqAVX2zL4=;
        b=Py3R4D+dyVJRGzNI+8Khd7ce5LjQcoae3W8Qy6qKINb3KiKR5oAY4h49XD7SymTyn/
         AoVgVN+mv+fFBBiJBGQrn/X/Wlhpt6lr6dxRNEWOSjkgOcWRVSpiRV0hpsk8ZebbRs6F
         KjkhgLW4/np17I7NqvlxNb+LCChrVhW+hLBlHG6skZXLeHCpdeY7pA2/tLTiWJbkWZd7
         PG+zH8TC1iNACe/icDRa0o3IBliFPWVN+FKcyqRaHugeuHgYqOmbIvJPxc3zOb5jzkfl
         1FRh/IPUyRg+lh2xNBO2ew8mU2U7SFO3DI81FMQDzYqxxzvNpaXtXwlVD3dsrHZuBSa5
         kvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023893; x=1793628693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5OUiKwAQQjZIMun5+0lDkR9h9x33L88VUeqAVX2zL4=;
        b=TJ7Z5iU09I7PHacYE/Wjr1uxhbgYhi+T1FASx/ALzw1bUUuwYXN8ywOlSCilIVeYXw
         pBgxdEuiLf4HptsIn5v//wOfVgn6XUWezmB7tA9ms3XAdDS+zHbKxYsvqUi0ESNvJCiV
         ZcMrcVN49uW3D92AkRKHbu9WBq5UZjmpe0RY6U256SI75wDPc897i2lrolOXGgsxQE9d
         D6v6v1FAX4kNefK9Frj6vfsHrEhJDTT6q4Q+neJLCDE3jYLIfo/gQjxOL1fnSodMcfVO
         XYU3DNzncsIFgLjnKbxG6w4nu9YQq+dOyfy/VJ9sYsGneXuj3qpVm8fem8u71nkmA3kr
         dPBg==
X-Forwarded-Encrypted: i=1; AKwUvBxArUSRb/n/N+v+CXn+m+p8lTWDeGRxnrIkJY1tGWhrysNe3cPA3JsUF+sQDvkcBYkVxcF/L1F25OCVhMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTdDlb5VvGU7xwkcZRyZ31IusnrTbc2Qbavasrf1ytjw7yC6/g
	iBYVC/AX5TNEV8Lpd//A7fxOx03J0DA3N9j+/LL/U3kyFP84Crq4O8u9QqGmSQ29ai+2GrXiLbY
	3CIWM9YbkTYkD+QA8ZkEVujN/o8kK9eAvtS0fW1DMnifrRmXxljFyeT/nnBh+76vzv3w=
X-Gm-Gg: AYBFou3Yw7oDgD+6mD/tzLBYlDoWeopO3Q6Nf0x7bnDcvoXbkG8qH8IoVF2DGjDjVjL
	gDuZPHT8rQnLqKXL+d7xIhICCSrpcR7BUutss6LBDJTHmawASY74WzfnoIBC99Q0+l0FFSSu5kT
	Eaovg2O3GST/+K0WrAhtVdYngmpsJV2SaUii9pE0EmnkvYrL2mrDjuFkf1xEt1pN/dSFHBEDTnR
	f6VMCRq87V/dBTY8cmGluZPc8lbPS2uNafaGAWSQ6GDDvShDub6vbVzk0r8sFeAQeaWTB47DAu8
	HPBLMMpU9TBjhROA7EuebrKAQGLw2ZYJsjYswg7UnxAK1gytYvES12jHemjtJmRzsCDH8VuYm/F
	i4zR+ZdLsjdV+kVNxtmpf+Q==
X-Received: by 2002:a05:6102:14cd:10b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ce5c6d2e04mr1945045137.0.1793023892897;
        Mon, 26 Oct 2026 07:11:32 -0700 (PDT)
X-Received: by 2002:a05:6102:14cd:10b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ce5c6d2e04mr1944964137.0.1793023892290;
        Mon, 26 Oct 2026 07:11:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459713f9sm3771801a12.16.2026.10.26.07.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:11:30 -0700 (PDT)
Message-ID: <d2073055-22c8-46f7-ae57-16988dacaf60@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:11:26 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] firmware: qcom: Add a generic ICE service
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-1-b035be7aab0a@oss.qualcomm.com>
 <6b539621-20a4-42a4-bf1f-1fd58f803581@oss.qualcomm.com>
 <c4fc0651-e9f4-49dc-a43a-6223e1ca9997@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c4fc0651-e9f4-49dc-a43a-6223e1ca9997@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfXyeZlZlMo8Cok
 8rUoDCFE1apLJ3TnMyd2CEdg0UgH4WndiKBJrbrk2tSdwh1wncTp9IgMYEnVAOHgNabcIw8ERC7
 ce7JdfI1appx1l68gnEl3sLNKqxnBlA4cWhd73TLYEoDL/llAb6VcSXzupqT5MBdSs1+jaocRaJ
 FviO10vbkuq40p0GaT0CZfUkJwqZj4tuQM1++EUXmXpCUecXOxoGexHsCmojVFnkLMBn/5V3X5B
 QHx2SpQJPFf7725Jzwcpr6OpP3bbemFfeQvcWauJS5/40gVHCawPj/SIrZG1lr7KSKzSH5eLLJe
 p+fd1K+f/1kSZ3mSdtfOCnzb9OKJFMafJeKG0AuXeLcZA41nXrC4kazJahH8yNNr1IGMOg1fR5d
 HQ91NNBLnwbaooG+UXCF5fSnEmEECSuE+rSoGSuSrRhQcawWl0PoMYhtdfqDIdNXv0xmRL0Yung
 /dVMU9UWKBxL+3i4U9Q==
X-Proofpoint-GUID: 3XobtUswVySD2jMcRRpIU0mlChv4F6yG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX9BUBdVpwj77P
 2OZVaERBPWuO5+7gB1yWGvl7HpEizivBNgEHdpDw9K0TwwwfClXhmUntBo4vT1XpE/LInX0AhOY
 5rIZ6xwWQH+Rk9OGFaidvAYIvYAQLig=
X-Proofpoint-ORIG-GUID: 3XobtUswVySD2jMcRRpIU0mlChv4F6yG
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf5f95 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zMFzIM3uWIHz1-PbWX4A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260056

On 10/24/26 3:46 PM, Harshal Dev wrote:
> Hi Konrad,
> 
> On 22-10-2026 01:15 pm, Konrad Dybcio wrote:
>> On 10/21/26 5:43 PM, Harshal Dev wrote:
>>> Qualcomm platforms such as the IQ-9075 EVK now boot with both QTEE and
>>> OPTEE. However, the Qualcomm Inline Crypto Engine (ICE) driver
>>> currently only makes SCM calls into QTEE. With the arrival of ICE
>>> support on OPTEE for Qualcomm platforms, there is a need for a generic
>>> layer which re-directs the call to the correct TEE at runtime.
>>>
>>> Add a generic ICE service which acts as a common layer with different
>>> TEE backends plugged in whether it's an SCM implementation or a proper
>>> TEE bus based implementation (such as for OPTEE).
>>>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +bool qcom_ice_svc_ops_registered(void)
>>> +{
>>> +	/*
>>> +	 * The barrier for ops_ptr is intended to synchronize the data stores
>>> +	 * for the ops data structure when client drivers are in parallel
>>> +	 * checking for ICE service availability.
>>> +	 */
>>> +	return !!smp_load_acquire(&ops_ptr);
>>> +}
>>> +EXPORT_SYMBOL_GPL(qcom_ice_svc_ops_registered);
>>> +
>>> +bool qcom_ice_svc_available(void)
>>> +{
>>> +	if (!ops_ptr)
>>
>> Should this also be a barrier read?
>>
> 
> It does not need to be. The client (ICE driver in this case) should always
> call qcom_ice_svc_ops_registered() first before calling any other function
> exported by this ICE service. That's the contract. If that is followed then
> ops_ptr always contains its actual value (either NULL, or pointing to the
> TEE or SCM driver back-end).
> 
> We could use a barrier here, but then we should use a barrier in every other
> exported function here as well, which feels like an overkill.
> 
> Let me know if any concerns.

I think you're right

Konrad
