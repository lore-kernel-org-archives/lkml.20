Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610956;
	b=OIXCyYlHfxGVIJzbQYqdsPyQvCphQ2VB+vWv682gzdQchLsNO62S+ZMA4xtcdmnoNp3E
	 +hAECxGfGs3SaYDgE2dhRpiin+kjEpY3QE8BWeabxaCtEvVzyipcl8zwqDUXyFh/mxFQ6
	 Wx5Um2XB0zCOImQYNt18IO+bLYEFRf64Exut4Kj99kfDFNvC/EYvrgvcJV9men667kqqw
	 W9wwpRF1O6Yo81rMnWZZpWVqTHuH6dx1UIzIzzyWtHuRPMP8fc798XLz9Sup7QnaEKqAm
	 kRRKEEEFS5a+EoMvT2Q2E2qI6crFXUkhSq8n0AhV5WgsFNnVyxp89GuX2xyMHJ0jsCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
	b=JrNIbiD/n8KVFD2peZbCOk+CZJ08vXi88XFMnQNPxcUmdWIGLrkX5j8gStlnxpFtvCqv
	 S3aC+GwCHrKkawizZUti7dTM7lAOE7WqdSQRNEYzweH1SYJV/4rsO8WHvmOcTLcmLhJ6i
	 LOP+Pn55XxkxCbGKpMZMsqBYat7AK9KRix5HeFI8tV9LR7bji6wfLo6Q7JnOTK+bQYnTN
	 Ch1Zz2pha01MKcqCGDLOFbWe0vIaAJ+LLji9K9P4YEwzRtcGHl9O9rBDYg1WTgM6pQ4cs
	 gpiVR//MqXr+EGa/Z8RXU0nB8H0nFED7GJxPm5F1896/9J0EB0lXi7eGt6IuaMlfXSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7uTwWoL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUhHrq3T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF267606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF267606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7uTwWoL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUhHrq3T
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQLp2361160
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=; b=I7uTwWoLS2R3vItJ
	6mMqX4yhEjdW4vB5H8U0w1FBr7abaQK3uOWKOeEmb6bhRQtDPH7rQd6WbYWK66H9
	kjT8Lxy6XzeaMNWHqOrjfhivIr7cppkwGiyQDTjQyDUKljgAMWcllBAy/sS6Ag7h
	e23SLG5HzDs/m4Mb91jcvS73OlCIoqQFQYN65ORXIsLne4UAH4MJQT+9zrdCbWY1
	IzlGBpkIFlgI4gNAW/id0TY0cZ5B/UnkXCt2SWRLN7TZGyjv9d3wlyeDttYTUsgN
	09GPkyjxKhaRCB70V0BmrMQ0ILZix0v44oNGKYMeF9hwPLlKnUxk+kWhd7i7sNK2
	9wLBPA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7x3p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:15:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0592d4539so4046677b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610949; x=1794215749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
        b=SUhHrq3TTvQYhpa5BgzXfksRmCaualRkAZXOhxMfu/gwcELB/Ks5H79mCGcJWLpUtu
         S+FhsLvh/ZZe2IOCO258msbkN1nXXqvBeC5JiBI3HSgrDpxiEwWh/adlVS9RuHSjRyF+
         8kIT3vsqyH165LiSbCZzj8mDe+cO8tS+QDlx8foGIM/FddRwFzNeoZdaGfpz7kDpPvZZ
         J8n0gFtCYJo9xS+oT9582nsKxyBVMheStD+H4OxMjsm986dmxN6k0TFdslakAwUktcbF
         x6sSTVHupcPQIU7+yknp/jkptpaX5bNqV0Lt8QWOJjtujeTBkv+ymiVEKnzndrhjkQ0s
         +BcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610949; x=1794215749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEVL6MRXYsWUQLv2m76Ju9oh6r1L4lN+d8opj8HszTI=;
        b=rieUTirO3IWsQNTgKQ7y3qGnXI9nzexkF3r+nWnUuFJX/JXU2JAMBNg+mWZDRqyJeJ
         BeSAr41evAGAKjD7aTnthAXdiWCJXviArmrbLhMsPODspo8+JOLfSWo2Qu4GlQp3Ky/k
         2t6pruWu7GD/x2sY4v/Ez90FJmmLPowG1Z+zeDLA3TB3Etv/DUxT7O+56BX8OmEm1hSl
         t4faSNEd6Mh+29aG9cvPCYJI36F9RHq/vtYmXZ6zZ6VTZE8Oyh0V+rBm+SYIkA0AROnj
         tieO7Y4crkpmQ96K40bJLTWLfq/+udYW96sMopYxC5NEMpqkvbRx4s9gXGyXoztnd+G/
         oEKg==
X-Forwarded-Encrypted: i=1; AKwUvBx7dP6nlmGA41Gq78D1rzk+fQs1sU4YofPe5YqzlEgF9XXMRU5vv+XIxJHd3nZ5q5nrE5ZVegLWEjQMkFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Vo4MdfUbpvLqpq8pSAq0Gbl+/iwMGl8MA2rNpfjU6gNQqHxI
	E8DgBi7w+p4s45dHdGQAK4Zl3tp8dulsFIPKIxudAkGBBBsbjM7ZasqzMxFP4HIU8yQ9tob+NaZ
	Bu1ZcXDOyy4ICEv/9FCfd6C8kaCVm2tSK46rC3R0jSQIztjD3xhK1KG1LGvChohweUxY=
X-Gm-Gg: AYBFou1lh2TGHUu/UrLuo1FOcjbQbKfQkPmjBamNia0mIyPHG6ocOfGulkum8/yNaHt
	/ur8oB3MfIRy+jErGOA92JCJR3HrnKM/MRpAPKemSH8719ww5xqJ7O9ydso/pAOCwxEuZtTTleS
	jUjIBZLBL4j198+SbY3GKggV8jVzIJZxz1MngWvUr8Tlt0U+jLHq2kNFID77BjdDy2GKG0il4Mb
	pivhbeHlBsmiCYRKFdZgWiy7vvIic6vtqhBX5ad9iuy98LS+SX8elZdGNTdeUuIPCj5Q8E48kdd
	kcN032eh/xt2cWN2pRFoED6EqpUs8zD0ufRzLDWjknBuFPfSYI4jD9f47NC7d7kv6PmCd0CLB7/
	bxAUaUVjxkYYSRogY7FAwuiYhjPyId6afe9hrObT0Lh8EJGNrudL5B8UNO1ZuDGAaAj8YO1m5nw
	RfO0QDrKRlEFiL2PG8E1MkXz+CrPZPmCVH
X-Received: by 2002:a05:6a00:2d04:b0:886:31d3:51a2 with SMTP id d2e1a72fcca58-8a9bec6107bmr7559103b3a.39.1793610948760;
        Mon, 02 Nov 2026 01:15:48 -0800 (PST)
X-Received: by 2002:a05:6a00:2d04:b0:886:31d3:51a2 with SMTP id d2e1a72fcca58-8a9bec6107bmr7559078b3a.39.1793610948253;
        Mon, 02 Nov 2026 01:15:48 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada6bfdbesm1745367b3a.42.2026.11.02.01.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:15:47 -0800 (PST)
Message-ID: <a4370991-0d91-43ac-b91c-c1c416cfbb91@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:15:41 +0800
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
Subject: Re: [PATCH v23 08/15] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Vladimir Zapolskiy <vz@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-8-95f250b18612@oss.qualcomm.com>
 <dea88756-39d3-4c61-83d9-939ddb9336fa@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <dea88756-39d3-4c61-83d9-939ddb9336fa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Q7D9cot-0qQuOLko4UAkZaAekQvccyHV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX38lNrGOEiu+f
 55GmGKQA3gFMtNy0VrKU2TdCOxVrV2a+0cIChrjH6+EGHnINpfeTIUHaxOBnRCfdAYIiJ1IOV6p
 9LOE5E8/qQownx4m8GJMjUKbsB5FgRM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX/lEadDSywgK9
 il0HNiAUI5FmF+Xs3MCYV9Nd5JOsMAWMjvO9pTZSZ0deQeiHtBg8eHxNfeW4BrAJrMy50diWuQA
 s7CErKKX2Ak9HaIB4PEDgcPQrwso3p54aQcHQLxSZJEUK9dkV9n00Ll2cl/6qegPb7Y8vyIjO8e
 Q4inhESBMInn7mtIYHHpNK/BAxOgd+vPgiEB4AkbLYDA8PQy78FXic2H/cdJeOjLU/7cW/KtpHy
 3wOTV+OKP9nDS047qGZlAqJ9lyxMuo1b6Y6dUNqt7f9XQnWMRl2q48jOTdeiIxrR8cFJOZ9oo0k
 tG/UZeEgJ13J39spQkIpNmkvVK+U+mokU5sCiZHvlCAVAC1Qns/0xOaE2iMGd8HMNGgUqJDMYcg
 AJ5cT9I39vz48OH1YeHSeNCZXzJpoLyx9YPq9aZ/rCG3WWd0DWkntNAFXOXUaMCmnqRWfAfdaGa
 HRC/TY1Rtx7LmY55Wmg==
X-Proofpoint-GUID: Q7D9cot-0qQuOLko4UAkZaAekQvccyHV
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae854c5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xlR6tl6hVQPR--6jroAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On 10/31/2026 1:01 AM, Vladimir Zapolskiy wrote:
> Hello Hangxiang.
> 
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
>> the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
>> rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
>> which reuses the x1e80100 lane sequence, clocks and supplies but selects
>> the v2.4.0 common status offset, adds Kaanapali power domain and register
>> the "qcom,kaanapali-csi2-phy" compatible.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++ 
>> ++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index a64242c66cf0..b0b63dd3d958 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -38,6 +38,51 @@
>>   static const struct parent_dev_ops vfe_parent_dev_ops;
>> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
>> +    /* CSIPHY0 */
>> +    {
>> +        .csiphy = {
>> +            .id = 0,
>> +            .formats = &csiphy_formats_sdm845
>> +        },
>> +    },
> It makes no sense to bloat the code for no good reason, especially if
> these empty tables are to be added for every new supported platform.
> 
> CSIPHYs is not a part of the CAMSS on this platform, hence resources
> shall not be statically allocated for CSIPHYs in the CAMSS driver.
> 
> See also https://lore.kernel.org/linux-arm-msm/20261026224957.1115370-1- 
> vz@kernel.org
> 

ACK. Will include this and refine this series.

---
Best Regards,
Hangxiang
