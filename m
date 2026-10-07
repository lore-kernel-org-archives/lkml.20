Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94C0472F74
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367062; cv=none; b=YfyLoXK1Dbfnd/v+P0SOXIwtbH/zKZ6QmYw866+SREN4kD1VLZBzoYVfe1BOCkJ7lH/E2tkFEwnMgmjKaCWT8jqe1n+efp1Gu7M8NTErGTEc6qKhVuKTrPpNlczmLCwSmTRDCHnEvxd2G4+BIPFMPea0M0J6MviIe0JOX1hZkHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367062; c=relaxed/simple;
	bh=G0D7fnoSmrBtX9XsPaG3Vf/7Fv5FbcC6uSXd9+bMZdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuPe6VyYjIhGBYmp/522sFFBvXL+vpooLY1CxmiFYdv5TUtP1GpPPdGisbYbypwA3BBhRG3R8PSEYc0Xuq73pArBJlI8uzE3mzT0k/xuOg7sd2gH32l5iHlddrlyQHhpZk9LZ/hpuy/IfA2aTo0g1G/llibbjw4loguF/y88zCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OaM0xPUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+qovThl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaM0xPUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+qovThl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jifX151949
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N7hS9sHZ4oab9Nfvb0VRSOm/VlHYex5ygAHSC860spc=; b=OaM0xPUIr/C2LT88
	EhKj303oqBT4P7VR+QFoXkgtBg6WuWvT4iGJqKAWlZ21/WFmiORHbpHSPi1DrFdB
	eFpUHcDuEzTyhBojLjRacmwrNhhuR5kx11wN3hWeqIX2i2hz60sT1F1LXqD7XnUq
	nXmIY4hGsrj93CzFXipvv+inU5IDM4YvPFevwIqBXzzsCeQYbc8LneI8K+ictUyb
	ox2+WNV57VN8s72AXuPXsW00RftniTzhw6qt124ynhpXHVjWEHRo5xkWk1gNw/2d
	A/8FkxKDow966SfDAcRNA7ijrxwTGWTPlw6o3ZeOHX/OETHD2mROTT5P0irf/1qh
	UlqkQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719j3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:57:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1050124785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791367052; x=1791971852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7hS9sHZ4oab9Nfvb0VRSOm/VlHYex5ygAHSC860spc=;
        b=X+qovThlw1qtU1oSLkZP6m+XTqn/x0S4A+aOVvC9o0huFYGiyrt1iFih2A/UJsFfhL
         XOnGb4OjDuQrranA1i32CQD5EppvqxofTh7pS5IGoxrLjGQpO0yd0m6asI+l/id+XHJa
         A08S4wiqIrz+xkgCKb3ZyVKQYkUDAgjLJlfQXNw7y3O8OQeWZg3UUGvtuJQlfFCBEtvN
         SIijp47Lt+BqBVI/smCeIbUVtWotAyQ7BstQrGp9085Jl9rm6SiKhVuwIV2+RvgMkZZh
         7oxJIcAzjkG73otPdHMoO/uvtkD+Yhfa3c6uBz3/UsElGWxEMw3XCTjMryB67w+A8bhM
         aIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367052; x=1791971852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7hS9sHZ4oab9Nfvb0VRSOm/VlHYex5ygAHSC860spc=;
        b=mLr2bqcMklaCfQkHapywAjThLePYVp/rLL5/klnug6KBm7E8I/so14ctxmWhKcguft
         uRA+hp0x74dbrbtjhegZWQWSvIesDx/wzesp9thfbh5FcpZJL6gPkSI3adSyEfmQ4Vuh
         0N3AM6cGftiGYip1kf2M8T3ibvMoWihDizxmFuuSMChHNAusmV8rzgl2lKM1zzQkkYNC
         8bUzfUJfTXYNVHlMG+lLJJL9labSXKPikDe/xv5xQDrpCv5zMOWQV0jtu3bF1XZKL6fQ
         f2jo3lx7l/1I4mhVKVztFI6pMe8bKZw2X2JDMExPabur0MJOJZtU5FcxiKQ7AJAC2pO5
         vNkw==
X-Forwarded-Encrypted: i=1; AKwUvBwoWRgoFd11k2gFy9MnUa0MQ27zLbrIqV9fjB9jNsDlwsARv/dUsLPEdIw3QxiCSfZTCCDVDldV8n1f+OQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k0rO+vFgJCaCw7xsmPkjyMeVA1FymNcYq3H0gWxjCZxOplO5Mg
	tvXN/uOrpyMLZBh7ZzcB3u4loqamWPOLtXx1bifAaIdSX15TqnZDQuT6ZRMPUMLSTkHEDagkcpa
	RX2aXMDAjgnxS6CQwwaDHIUMr3wsFaQ0xsdS/cJYtxyDLdwB+wTzX6cXMuYsVDh2vwgIry5HSuT
	tzNA==
X-Gm-Gg: AYBFou120mCLTdGRqCyzwVjayxD303aHHM2mzGFUInxETXATVwJtWSRWc4Bi4+5Ov3m
	XzBPKknKqYWLLDSsM8evRBDV9Seqs/ydw+15kKerojLoTvJ3nxeh4IAW3yDsjkrsPlPkaQxVOBp
	aXQPLrBFAD9vqf9NKuQmUZkzfsXJIzfCDxg9eWpK6azoSfftTWKGPmZCyCmKpS5JgJvaxDZB00p
	HqddX/XM+sLui6nMCjMHYgmomViB5kyyzGZwRychumc2fa9zuFx3i6pkZxS9ZyfFZxyF1W1boKS
	6nXwIgDF16UgQzh8cOr7coT025W5vAGbzitz/zr2S5P41ogU+86bGzkAYBB5hGwlwVlt4b4QyHC
	D3Q/mZUZJfYYo1qz74PjonoyCIoFuSgxuxP7GzLuk
X-Received: by 2002:a05:620a:469e:b0:93e:76a8:af2d with SMTP id af79cd13be357-93e9b72e5bcmr320212485a.28.1791367051820;
        Wed, 07 Oct 2026 02:57:31 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:93e:76a8:af2d with SMTP id af79cd13be357-93e9b72e5bcmr320208385a.28.1791367051241;
        Wed, 07 Oct 2026 02:57:31 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178a175aesm178374325e9.2.2026.10.07.02.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:57:30 -0700 (PDT)
Message-ID: <0d72dd03-8500-48de-a78e-6b99a4c6fe32@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:57:28 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/45] dt-bindings: media: qcom,sa8775p-camss: add pixel
 path variant
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
 <2bb9dda6-4a13-4da8-b17d-3bee6ecf9bba@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <2bb9dda6-4a13-4da8-b17d-3bee6ecf9bba@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX/CPQhnBMfUqS
 3SFM5Zmlu6RchSrkhaiwWf6z0/gfcMz10xhzLN8FsRdHfZWbBRV/K/2UKnrgRwV0J/XMvjJ0koX
 LG1BWZJ12md7okDLZv+B13fMKUPQCmE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfXxIC6pUAKdfQ9
 yjrnrzNPrh1YGbhV5t1xHrGqHUHUU0MpDSGO9EsLveQxK/L8sb+O9Y0ZQjfQwXTWfEijglSUAne
 MiXVYWgO2c3L+is/w2P9Ohk7hfwlxjy1Pj1vw9StlKckRnHb60uabxdRHmDwqXjO860kpZ7OXXq
 YjePWS6uRpN38031s7nOxAG9A+c7egvMHkwDjtcwi01kPjO4l+NDqLlMOnT2RmCltxaRbsLpUrS
 Wc/6+nSqO0OKcsm5ucepKkCaRDCwnXAY9dbjRj2GzenNz/zRZ8A6hRADkYvM2taQTRg9aiMez99
 rRSDn6UvPrfrqx+tNM6MyQC8N+4CATsrCW/g670SRAzxPEcIhdVJRnlAr5nfbqi/TzcEzGdYGF+
 sI+OaEH4Wi7TUk0WtlfhGtIuLFzNRNnV7HE84MDYLyWjAxAJ44rz+61zy9SGd/+Oo6Kb1jOnyR1
 Pz5Redt8T/s97veg2kA==
X-Proofpoint-GUID: 5q6vEsVikP_ExIjmimwtymKFEk3s7urF
X-Proofpoint-ORIG-GUID: 5q6vEsVikP_ExIjmimwtymKFEk3s7urF
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac6178c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rnyNrMEuC2Fy3nUAs0EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070039

Hi Bryan,

On 10/7/2026 12:49 PM, Bryan O'Donoghue wrote:
> On 07/10/2026 00:39, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
>> pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> index 48f280e99809..9206c7cfe197 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> @@ -14,7 +14,9 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,sa8775p-camss
>> +    enum:
>> +      - qcom,sa8775p-camss-pix
>> +      - qcom,sa8775p-camss
>>   
>>     reg:
>>       maxItems: 22
> 
> I don't get why a new compat is required.
> 
> Please look at my RFC - there's no DT depends at all in that.
> 
> The existing CAMSS node has been designed around the IFE SID - not by 
> accident - I've been pushing this for months - to prepare the ground for 
> not needing DT churn to enable IFE.
> 
> Sorry NAK to this.

Yes i have expected NAK. And it was mention in cover letter that
this option may not be accepted, but it is convenient to test new
topology. Anyway as answered we will wait for your new series.

BTW just from curiosity do you run parallel streaming on pix and rdi?
Does the functionality for all streams to output in parallel along with the
statistics working?

~Gjorgji

> 
> ---
> bod

