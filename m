Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B67309EF2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788409050; cv=none; b=GXgSINuk/tP/1BJN9Mc05fq6BnyJ7o4Gvxw5jXMTt49rRrwib5YJnjRekr3is3Ne4pb8brkYm/EJ8g+uSZ/K6sALo0GtRoKJOQBHEPxrNvpkjBFxN8aLykEDOwX7tbu8Wl4sOwfnA+c1guWtGNSmPvynvc8NpcI4Mn10h5Ymyrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788409050; c=relaxed/simple;
	bh=AH/B7aaGDglCpKtBexb7Zxam2Ch3aRkT+fHsRoqeAAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMUT1xKWBae9n43tXd4lTJFvWp80N9GF3Ehn8DTqmMOLqoYQZKXRI4+99ChMf1FpF0gx53QWB8IpruGEtBVKtCfalh95+HdEn+gXzIdVIu6/tVWaiFxBGCIhiFxr4pKvFFQnpfg8iZF1+uTuJrt5U8ESIyr8rfjDeRGe04+BFKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyD3NwZo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aY44XBQn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyD3NwZo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aY44XBQn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xplR2235677
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 04:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7JoLMalHCcWAtlkWjmylVYKVal5oLWlxA5VWlLObjmQ=; b=nyD3NwZo+WNY7Rda
	EqrUJPJ/W/QNeEA3EcYuDlQ5nsevih0iG2OXWpwSRm6AOaghlUTazOu/xplqjko4
	KTI0lQWenqdwUBcudNc8OyGxaCWaMmJjCHf+QdB6xu8J7XnX9floQxWhItbEsto7
	mEb6mlRnyvwLNv0UzGrMpAh8KWWT+XT+tv+MKoKgsZNVDonfKMfLP3dOyPGqDqzU
	YyUL94TAH7HB5hSPH9gRdwHGJVaIJP2fUazVr5K/rXLklyvbbACdsPzvNrLb7Be1
	hYOqfeAd1JTPjtCS5B7RKCFLV+0xaKz32r7UeXFZ1+EFQ7A+QOmInQTvdM2HFmuU
	KkmNng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja3evr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:17:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so22851225ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788409043; x=1789013843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JoLMalHCcWAtlkWjmylVYKVal5oLWlxA5VWlLObjmQ=;
        b=aY44XBQnFUsez6919ZCOIorntuJHQWgtAbUwENu1aiD52Q13N6rg809cflbIw+7YcL
         8CStpXS/10PQp6h6z0CKVdRNeDyp3oCxY9snCku5D0ceo6+vhb3ybkaSZq9/xNchRspu
         wa/+jLZ804j/mNcL2F2gnl/+iYAAG6KQC13ciMJxnqhNXgenvrV+wPjVdGZnFk+eVcbI
         CjCnudSyaiBIKyMVPb27qcWVTlCOScI/nOS8zR/ehhFL8lDmWiLHNvG7sw3+S9kbKur/
         ZO+D0ymGYNOiAm69xwQkmttJupn/wIynTs1x5Toypry/M66UxZTMVDWYQQUJHHZ6niBD
         cT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788409043; x=1789013843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JoLMalHCcWAtlkWjmylVYKVal5oLWlxA5VWlLObjmQ=;
        b=E1X7xqqvGPfe+nEbRntgpS3gWkgnzGUDrXcPijRW9byQIZx+nDaXJYuH+ck7SK23Yu
         wGpZN7fKYL/zPVxeSwwrXzm7iPLSsncnJ2dbv0uBB3hNNXJ8WCM4emmaZRD5Zlz5y7bA
         uZNnFgTToezl9VosmbFGRKIntxOfFBioNpMxCHxHHaCuo4Pc0bEFHi5KoR8MitiKc7wP
         Wms0CnP6WZ++mejLXgqPUJga6DPZld2OWihb8r+Vrilu6dOQ5YbPl3A90najGRRaClYs
         k4HBDiGFmubWdf9YbQ7AsYK8SljU4A0x7Cml9DLJHKsMMe5da9/lM8wZ01rPUPzTxhUF
         WLxw==
X-Forwarded-Encrypted: i=1; AKwUvByyFB4zC10qjqRt7j94uEhTUrE71dlwBjZ5DbujzNm2RI+K/OogTmRoWXLq+5qfElxRfh1bVjL4H1aQvoA=@vger.kernel.org
X-Gm-Message-State: AFuF++lRZ5anpJGz1DXdS3HkQTIwCkK0OwZ484/HbbHx+ET4RAFDL1Bu
	zUxc7skUA5ACoWBFRg6nzCxqKuPc+LQvSw12WTCJGfnOYRRMFUfc3kMe3ckPzMjizRJ5lNWAE0X
	FbRHbA/POr1fNua8Kq4lpTSaku5YbCKIn8mhqLEkq7aFZUI6jmeFEwEPXsUEA4d2XXZA=
X-Gm-Gg: AYBFou3DRzHsEkNDdowfBmTkI6St1MRwI7l4+9+PwA+Ucz6HUQcF7V23vN4V6FuMspF
	zRPZioqSz3cu9ZeYuSZAEvWRCQv0UQzNQxitx1tpZ5WLATCupFt279VUttL+oPfrrLhyGz852zi
	/H0bfObpN5awXQPbh5/HbEXa3TQQr9J01avjokge/gcgcCZhhuo9XRCfWHcO16mcA/txP/mWutm
	kaFhEoG87rWByLJJZYecZ9DV4LoDjQKMEvJmQm9LEax8weqPYv+dn/H5IqQQe8ANwUl7zpmEQpm
	OlLxqZGMotJkQfO0lkN98uPxOqfEZF/SkkWJImdhf/1Wcxbhp1FKB5enCLLY7S8Vg6mC3DhNdwF
	J9/t+P5pGJt/AEeCWc918Go3b6dLn+iOz9fJKoUkbkb7w2ODHx0QM4QP27PiadxjfGSaynOl1N9
	faXjoUSoBy4LSiWONiXArjp6ps
X-Received: by 2002:a17:902:d547:b0:2da:e68f:45b4 with SMTP id d9443c01a7336-2daec641a74mr137795075ad.8.1788409042883;
        Wed, 02 Sep 2026 21:17:22 -0700 (PDT)
X-Received: by 2002:a17:902:d547:b0:2da:e68f:45b4 with SMTP id d9443c01a7336-2daec641a74mr137794625ad.8.1788409042477;
        Wed, 02 Sep 2026 21:17:22 -0700 (PDT)
Received: from [10.79.117.104] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33253672941sm2601042eec.3.2026.09.02.21.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 21:17:22 -0700 (PDT)
Message-ID: <7a73d847-ee43-4a8f-9149-2471230e3969@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:47:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs for
 ADSP
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
References: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
 <40c85916-6694-4976-95be-6ce2a2f19732@oss.qualcomm.com>
 <6ae07fc4-fa79-4c05-9958-67154e850563@oss.qualcomm.com>
 <apWp5vxhRYozKQ7Q@baldur>
Content-Language: en-US
From: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
In-Reply-To: <apWp5vxhRYozKQ7Q@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vNNxsUuzw6kUCqe3ys1X4TuEU9gmGa6m
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a98f4d3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xGGhxaKCOqPHMtdP6scA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAzNSBTYWx0ZWRfX7frlsH3ZrXlS
 CqrdNX+4OnNSHa/txW6InzY3Bbr8dQPa904GMkpNRlGfubyuETWPlkZ42iF0zsSplm+dQHnjSVg
 q2SphlrUUJsmUhAmIIbNDcsIZPoErvo=
X-Proofpoint-ORIG-GUID: vNNxsUuzw6kUCqe3ys1X4TuEU9gmGa6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAzNSBTYWx0ZWRfXwb+kkJKe0mQi
 2X/cOtQB3W0YBJ02Xr1YcAqPmwwFVZGSwn0XaJjK3XtxWJGKviTWWTM/NAzqs/zQmwZ0VEMA7m3
 9qdcY1MwlMgOwQTaWgsAI28XxqWsofqYUnleg4JqYXj33IJ5UiVWRne58LAfuAVv380med4FbML
 u/LktsyFfpipv4NmTUngAsTU/fLFamNji3LYsyZR3QVSva7T3KjXibXoIwfV/S1Jz8aABVw5d/S
 Piq+FpAtbWwgbot4JF1nc2bh3KEaE6lAxN5haQ71UHEJADRbne+R6Q2nYJDIVm/UhTU4aAL3ssb
 Dfxzlz5B7xi6fNVPosONN+H0E4TnbU2TI3KwIGwVqHay8pdLyGOQbAMIkurxkssVdLOuOpeIDVv
 jmKFq0LgUYCcUTvaeifbIsXAaDTOdRbpjEQXVaAB7U4W6l4Pma0/nFOgVV7oYF879Wqudlh0Xki
 BsMhHXRUoLPiNfakdMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030035


On 31-08-2026 21:55, Bjorn Andersson wrote:
> On Fri, Aug 21, 2026 at 12:54:03PM +0530, Iranna Mundaganur wrote:
>> On 19-08-2026 17:16, Konrad Dybcio wrote:
>>> On 8/11/26 6:44 PM, Iranna Mundaganur wrote:
>>>> From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
>>>>
>>>> Add the missing SIDs for the LPASS eNPU masters to the ADSP
>>>> iommus list. These masters are exercised during audio record
>>>> use cases where Environmental Acoustic Intelligence (EAI)
>>>> models run on the eNPUs.
>>> Could you share a bit more details on how we can reproduce t his?
>> This use case is not enabled upstream yet, we validate it downstream with the
>> AudioReach application where EAI models run on eNPU0/eNPU1 and need memory
>> access from those masters.
>>
> Even more reason to provide a proper commit message, clearly describing
> the actual problem.

We are discussing this with the team and will get this fixed in the next re-spin.
Thanks for the review, Bjorn/Konard

Thanks,
Iranna

>
>>>> Currently all transactions from these eNPU masters will result
>>>> in global faults; fix them by adding the additional SIDs.
>>>>
>>>> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
>>>> Signed-off-by: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
>>>> Co-developed-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
>>>> Signed-off-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> index f04058d2e089..6b06e0acbcf0 100644
>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> @@ -4084,7 +4084,9 @@ remoteproc_adsp: remoteproc@6800000 {
>>>>  			compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
>>>>  			reg = <0x0 0x06800000 0x0 0x10000>;
>>>>  
>>>> -			iommus = <&apps_smmu 0x1000 0x0>;
>>>> +			iommus = <&apps_smmu 0x1000 0x0>,
>>>> +				 <&apps_smmu 0x1040 0x20>,
>>> The correct SID base is 0x1060 (although the mask makes them equivalent)
>> Yes, will fix this up in the next re-spin.
>>
>>>> +				 <&apps_smmu 0x1080 0x0>;
>>> This will bind the eNPU streams together with the ADSP firmware stream
>>> into a single iommu domain - is that your intent?
>> Yes, we've been told that these SIDs would need access to all the memory
>> regions ADSP firmware stream is given access to, so we want them grouped
>> into a single domain.
>>
>>
>> Thanks,
>> Iranna
>>
