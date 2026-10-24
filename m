Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792849572;
	b=ytBoTU6fqYTO49WYVFIBiJNSG8j73aO6vvoZlA9lZehdCHxMJQV5WEfS3MLTWRa4KctS
	 xOEbSmz4DxPz1u6B6E0DNhqC49ztLFlgkZMmWGQeTJ8/mSowCuW9Ki/nAs5c3dN5NPTHd
	 cmRUWGJmOl6xhc1LJGCQnpQPJRdbP3EdnXd/UgBwhJ+Dw9+zjwNpgty3/DUPcT5JZ6hwr
	 9IrSTgsba3rkAN/MkOLYhY81PYqQP9jcDVE6yKnGLULtY3W5CcH4IcNek0QfhIBirjJf2
	 hi2wSbV4Fk1pIKAWJ82170j9KPkzbl6iSxLfFVkqHoN+B43b5sDsRPOTUTfxRA6uCIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792849572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fg0PYiPhEEa2RvF2n3hYUMcD35Bigy3qAux6hc+eWp0=;
	b=bb/CnmcWurY3XOeMQd4Wpvc6A44biris2EBkqsGbaF1HlUDfvRu8Y3W2uebHIwa8CARA
	 tkwkR4YKE7A4xiGYUuqoD3YXYvSLkNpBY3wJf/i5p/mzwWUk5mVtBgVtm1yf+QB2DrS/W
	 aVRfoMgC5FMzqiJ/fc8Yj/YIu+2VhomradnAmE06z0pzP5MADXkhNyUvvfQ+HGtj8Ze6V
	 20gRg/nnhKzBCOJ3DSv0iPv9e8Q3bqnWfNgYdoHsxR9OnXctuuBuhmCfEP/tWh3HPB4B1
	 20QTk1e2VNLzVB43DLVyT2Yevo2bLXTo7KbS7Ep07Li3zannRXpc7/mViPyqAq8mZDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CaYHtWgJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EWe6sjRR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2720606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2720606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CaYHtWgJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EWe6sjRR
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o7M61123057
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fg0PYiPhEEa2RvF2n3hYUMcD35Bigy3qAux6hc+eWp0=; b=CaYHtWgJNFOJxoy8
	xStFCKPun07V89l0j6nxgP2m4hPgi/CC4mqxiOIhpokVu34ezvxu7MbykzR9cW8A
	/qL9emOQcyy09hMcfYidldlPrnezvh26m1RTWOSGYLq5RfWM9d7yaXXAbHG5YeoG
	WCiqYNWRxpXyfu/k1vd6Tn7zgeOANpcMgJ3Yvfj1SKOde+q8+J+e7m9Yo6iMiEQh
	SEhRLJdupZeuIVUtKJPJswjhTYwyu4MDA93gjFsKg7w6lIAUPTDCKjuZCQAlFjoQ
	2C7QjYqkLXmv1JjI1el+dJqnKejlzOlrY0Ts6dTCAz4R9mGqap6l72ey7WSn73AH
	CJGYIw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruh1nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:46:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso3699619eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792849570; x=1793454370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fg0PYiPhEEa2RvF2n3hYUMcD35Bigy3qAux6hc+eWp0=;
        b=EWe6sjRR1+WHw128hF9oozx+1iRoMD7sG+CN1HVt1TQ7mo/qfhBbf/jGNyJ5oxKsuQ
         h3/ZRKxKS5KwSK2AStFkGkRknyoGCJfDpiD9nYA6M8aPZf0RN07QvXqnLPElRg3KabFo
         n7ZdOu31Ac1Ob2yYTENbYA64Pl77Os2DdfwGdagnjmCBMxRh38bcvBSuI5fpDdipu9A+
         9x6JxnYHaU5sXkGIn2vp/DgQ8aGp/F4WhXM40MXRz9//OXkh46fGqkpTcFestYHfgGjS
         UqfiZD4JsaZpNmDWnrE+4tLDsn1dGivbZbkQkGD8WdT0zQ9oVN3gltK86g7DCWqa0lIS
         C+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792849570; x=1793454370;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fg0PYiPhEEa2RvF2n3hYUMcD35Bigy3qAux6hc+eWp0=;
        b=m1FpiVPL3sBsecgBP6HF38O/5tJzJ8xUe7hOwt5SXB8c7rTG76Hc5qpITXPfSRi61R
         5y9DUtnpBnOekCevtXcaFN68mIQeWfzZfQgX5bpCMyWPqsLu7POPr+1A/0lzu7ywKQPy
         XJNL0fzkjyw2AcQxbXRAFBH0dDb7fg0if/OLd9mJB4L3l1WrsDN6YeszlefTKgJaOsRX
         XMshzi5FHuqkINfQ8U2YP8VEWnq8sVtNl8CVkDU37YNLzLtv8bw6xkqS4/MIJXJUp2AY
         3uklYkhF6h9mE197OKJvcj4eaVh7LbUsDdBwnn/WsSXvHKNNqc/J8cK4MQBaQ9Uhd7Ei
         LGBA==
X-Forwarded-Encrypted: i=1; AKwUvBxGMjDi8zf9zL9CJ+GOUFvkD2/TdmH2TjBZ9g1Mlm6GeT2ZUFLEjphQBMzWYmPjwZKB7BllEBVobPhgMCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1Vqlu5l7jW6yikn0OaCMwqyuw7mOfYqw5rnTH7JyYS6EcQ56z
	fJn/lINvougQGreErVRiMzoys4NnnCBCjXpCAzBC68NMzm7r5ItrOqzCaG92Ut1N44r0bA5LzPG
	0BPiRjlOSlmhnNZiNdtzEAruhOdujCV5rhb5fIzU/ff+ffrwwHc9qWgSXJqNc+TXWtoI=
X-Gm-Gg: AYBFou2wiJoOb+w7geuVM4eMW2cqyEhwtx3vdh92PxAhPVHNOkE18vmrzXmQ4s1mBUT
	D3i6/Nz1LHZwZiAt1kOi7Qi5HmNKIlHwgIFxxPkjgxak8C4gRgqzc9Akrh1K8sl78MkksUGrF55
	Q5aWZaTCklVot6Ojxbs2gCoCxIw18P/ycxilpFKfDKW3Szoq6p0PTQnK2EONUPiQVijR2mbW4iP
	OG1DopisNdLHoIhAqZe92ReKfmhyzJxkTaV3etpB8bRe9bWRGB8YOSR6DtMzb9EsLJk9joDrzJ/
	zZycZIxBxUTZS7prNaLrSxYcYGbDndg6RsC1ImYtKPnggwvlVZk3VjO4g+9SIdploU6tZzoFaQM
	1Ip+AzJF/cL13pXEVhQBFqMaEmy7tLw==
X-Received: by 2002:a05:7022:51e:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1994d8b728amr3780701c88.6.1792849569364;
        Sat, 24 Oct 2026 06:46:09 -0700 (PDT)
X-Received: by 2002:a05:7022:51e:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1994d8b728amr3780649c88.6.1792849568780;
        Sat, 24 Oct 2026 06:46:08 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.153.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm7294224c88.9.2026.10.24.06.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 06:46:08 -0700 (PDT)
Message-ID: <c4fc0651-e9f4-49dc-a43a-6223e1ca9997@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 19:16:00 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <6b539621-20a4-42a4-bf1f-1fd58f803581@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA1NCBTYWx0ZWRfX148rxierQBsh
 2g0VCGarHJbd2q5l4Wk00EIwbAq2sOoGqgtQ+5uKzM9jaBdkG7WkegvTBO/OZj8a0Fn+QT2OKUC
 HUDHmiizOFk4ANGD+hxzz7LiqiuKxyMxu90yn/RnlT0ZO3SYuuAyLW162W7htwonoccg0++hjD1
 Q/AX3q5z5qEeSwqIso3KUMFn7behc/l0NzaJElXsyU+9LFGf+ZhNRrHbK/bR7RavgUKSPDqPbXb
 Rc+RJ5AMrZgjjyuMeELssx1NAwE0sZNndVY1MzrI2kbw4//w3NJ/DbdXajPr3lzu55aoeyHAars
 WelaDrnOyPLgZ+fKnw1WtGcdNfOOrwC9xbr/UhUF9JVbDDVq++Gt6PGr2a8LD8tRXXMYXV3GjVf
 Q+wFsmr95Vj3qWtKe7TwA4AoiYxqVM/VZ4LS9vBej/lZ9Z7x8ZkgsqfN0m/CEwdcpV6aG76RjJ2
 33O/Sol4XzNm2hZxLAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA1NCBTYWx0ZWRfX3rEVYfI4e17+
 tkgiL+LpjIEyuWkBK4ojW+v+PUK41hVzxmI+OiINvPVGvEbF9LI3QLPTyqsgiD8+xnKBSdwdcO+
 AE6s4mzJeFFMXp0O2pIaFfaMNRadyQY=
X-Proofpoint-ORIG-GUID: G2daXzqjTX-BmDQV8hbjP7EANYPQKQOw
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adcb6a2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=hZ1hWxSZf3UX9FuxeSnJ0A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vk6uEdKFTZbF_VcgUCgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: G2daXzqjTX-BmDQV8hbjP7EANYPQKQOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240054

Hi Konrad,

On 22-10-2026 01:15 pm, Konrad Dybcio wrote:
> On 10/21/26 5:43 PM, Harshal Dev wrote:
>> Qualcomm platforms such as the IQ-9075 EVK now boot with both QTEE and
>> OPTEE. However, the Qualcomm Inline Crypto Engine (ICE) driver
>> currently only makes SCM calls into QTEE. With the arrival of ICE
>> support on OPTEE for Qualcomm platforms, there is a need for a generic
>> layer which re-directs the call to the correct TEE at runtime.
>>
>> Add a generic ICE service which acts as a common layer with different
>> TEE backends plugged in whether it's an SCM implementation or a proper
>> TEE bus based implementation (such as for OPTEE).
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +bool qcom_ice_svc_ops_registered(void)
>> +{
>> +	/*
>> +	 * The barrier for ops_ptr is intended to synchronize the data stores
>> +	 * for the ops data structure when client drivers are in parallel
>> +	 * checking for ICE service availability.
>> +	 */
>> +	return !!smp_load_acquire(&ops_ptr);
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_ice_svc_ops_registered);
>> +
>> +bool qcom_ice_svc_available(void)
>> +{
>> +	if (!ops_ptr)
> 
> Should this also be a barrier read?
>

It does not need to be. The client (ICE driver in this case) should always
call qcom_ice_svc_ops_registered() first before calling any other function
exported by this ICE service. That's the contract. If that is followed then
ops_ptr always contains its actual value (either NULL, or pointing to the
TEE or SCM driver back-end).

We could use a barrier here, but then we should use a barrier in every other
exported function here as well, which feels like an overkill.

Let me know if any concerns.

Regards,
Harshal
 
> Konrad

