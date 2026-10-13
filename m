Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D33AEB2D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880677; cv=none; b=OAzK7uMllxYmlV1VqlwyB/pCcsp86fIsuk1vvhC/GtMldBJDuiMLMrY61we68t4ZFF64wvhLgE1doNiJqkEDVVCilKZQ3JCV+D41strFrkwPqygu8rHzhTXF7+znptzwCSfONacexe5K4k8PGvDpqrgDhbTNris9HdxD6Qyhzek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880677; c=relaxed/simple;
	bh=CcrD/2r+08F6nr9/H13IdXa1LefUz2T0INYsIdfMFQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RF6Y3BaSefkMSyW2K/cnSiM85tzbWQUp/guEyqMD01wjQHKGdWocXvsozdi+Iu3AJyFUxrvTNNbS0YgnTzoOrOt1vaqEgMpyqSr/F/cF0uzK0QOZ2yqYepbCb696XEvQtvZbDEQjWyIJa0oh9sofAfQLLfnay0BBa1yo3pJ94oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKdgvEQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSR0Dz8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKdgvEQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSR0Dz8l"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8NFve302833
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gT4Yf0815a57DxLWlTv+fE/fuapLIrnYK/QuztKTzJA=; b=AKdgvEQXQTYGVSQq
	KXeymLujLv+pD/vbsYher74ikIa8ojC3xfLuNqYcNIVKRdtbX0qDNTn3VTkvb26F
	YnXSbO8GNadQ3GAPjgXE0lxsNI9dkuHc1PJsBvXxD/nL2R6hE7cAfaBnOJHZ5gpL
	q/v09KSKm8YD8+AE+mOjjjBou0fpgb4ObWx0xY8hZMaM8/blWyeWGVTJOZ5XSC85
	qDHdgBc2poq5otuvnQnSypBmPRF/AVI/sUHlYtgYUAoXDMx7cfsIgZZeu408paIp
	RYUMeg+qVIX30yYX0DYzN7OQsF4Vaqt59dxo71nSaWfcBhwVQ+oJ7Y8oByZ3NNzp
	W5kENA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9w1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:37:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so7751177eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880673; x=1792485473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gT4Yf0815a57DxLWlTv+fE/fuapLIrnYK/QuztKTzJA=;
        b=bSR0Dz8lQo7VZik+hf4G8nYkoGpH/yL/BHNGbjuHhltNbgiAhakAoEte3Rg3rjNeDL
         VCe120eiMwT4cooKbevvoAeNay3jIT8Dena/6qG/fflU4/lulE5agGnsiDLXW3Z60BaE
         YF8/CEOeXU361PHP9FiI/DQjqdA+ivhXZTXoke7yGPThLyW7lZyqxBEY+s0p0T7YyV5M
         nNHMYh2zVruzIQv8K7y2JHILf+XUPLR53KyFqOiCIHEhor+UC9DQ937/d+2p7IdbQ9aK
         Qw/wPxtZlanrpES2arCQHM0d8YpKONV7CrimC4DSEIPP94L+JuWNCvnnSZYhQNLBAtvr
         fBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880673; x=1792485473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gT4Yf0815a57DxLWlTv+fE/fuapLIrnYK/QuztKTzJA=;
        b=1UvKZxs4PKfTpyeSg6kkXykewQw989cTY+kL/8vNM6brcyi7biYTWN9myog1MNGtS7
         TmUNNmCE/k1rHWCte1h4e0N/7lI5F4+jHRP5JrdZqHyjBHPGud7X8QwfHagyZFy97jxb
         5EQnDWunIRpTjoLc2JlF0X6iqA9sMtUnESZdlrJ4k6hg9buyj8q5hRUng0NrsqpyujE7
         RCzK0fJ7FC2BMslOT02InM3HUa/glPRtVzyNEJNK/h2Kz+WF7qFKOcHjvRDLQ/sryF72
         i7hcE+qyPJh0ZKkst6YmncZql2Fq/tXdzaiFZjbhCugHuxXIg0JRIl2NL5BHpEkY+C1V
         rf0w==
X-Forwarded-Encrypted: i=1; AKwUvByCz/4gqm7CgFglAW5gOZPIRCUD3PxmZFbSTn9lTCY8ev2zdnqmr06N7VF7g9EV6lVGKiyv5IJa6GIJLsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNxrRBBNiptmWjIaF+WsIwqFvqgKh78wd4pqS0cyD60ZawhXHe
	4DiT0TDvsZ2jFnPFK5V2H5yToVqYnc0mHNmM88uPiduMg1skbPj5k7kpgVt5A9FHmnB8lOyayKS
	vMOHfiyMSMGnkgHDV3gM/EBdhuSIcPyFMhyVyrXArf2HMprxKYJMrp029dTybIUv77B4=
X-Gm-Gg: AYBFou0uN+SYY9Wq65clyxhOLik0BffixM+RAL/IZ0U0JcrfuduNnHE24LIrAVFx6hH
	6RQ58yJNvb7NphAkQlEyCc5bXSQDkhBxbNLx2D87ByzAmnAIx6zjaCdsZ9I05xVSSwTnNa0bUEw
	HJ+w+YxcqHzpzV7qnZqvRSHYIe2WDgNRBROGU1hg26r71Ad1G6gYJPB0w96vVXCUjN88EnqwfJ7
	4nutuOn6LLbheYOvZC3cQsUP3jICRmQAslTzLTVN2plTpZaLjg6kT7f7i1r2T469KcaXrQOQzM6
	yytbh0gIG/IJVLSb721jEScYkQLOpiikBueMRcISWuBnvp6iPTj7HQohJoieJpfz88hPBO154XD
	deQgApVsmjakr9ppXSrfOosMOF+NImQGCMQJZ1QFuCKNjnWWHz/dkn2/NkuPtw66p
X-Received: by 2002:a05:693c:8099:b0:358:c755:81a9 with SMTP id 5a478bee46e88-358c75589d0mr11619422eec.11.1791880672849;
        Tue, 13 Oct 2026 01:37:52 -0700 (PDT)
X-Received: by 2002:a05:693c:8099:b0:358:c755:81a9 with SMTP id 5a478bee46e88-358c75589d0mr11619395eec.11.1791880672202;
        Tue, 13 Oct 2026 01:37:52 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm40467132eec.28.2026.10.13.01.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:37:51 -0700 (PDT)
Message-ID: <ff46d549-a766-4263-9bcf-caf3ec17be3a@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:07:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>
 <as0BPGd_BJivizEW@debian>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <as0BPGd_BJivizEW@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX6MqoJhun/H/e
 q5xbD24FVvTwW6HPqk0MKQUbywlYcU7uWEYfmi6z6YDRCbtevJmeLL5ULrCsRRlFkAV+5GAi05X
 y1Es/fYDNYNIm1WK4X37YHyNZJu0v2QYhRBpiXBH5zecaMzT59VlDtkRO8Wg6s8P41gYAdGQ7JP
 FYHh4q3XP1yvih0wExIW7jXJI7Q2dXH1+EN2EppJPMckG+LBy+8tle8p3EeQE0mZ4saEQDMLNMk
 FK23hZpxle3UB2Qkcw0FxkBCuKm3w4LYnJnRbdCyeH5O5Her+CtbAU5VL3pBnXz4g7/quT8GAWy
 zs74+qNo4/7jLh24zmdNiGirjCmGykozeueOb6Q3swnnOUhMbXD0tiUXNnPpcrzEukekXnYFPFu
 neoG/qzJ8NG5BygEgIxESsHslPTgGnPLWeZHSUE/9d95rv79gekD0YYeyu7K8xxn/F/rxTP7TX1
 Vs/g5bwF1tLIb5y7v3w==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdede2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8xOz2izvBwbMBXgYhnkA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX7Xg51Npn2Mz4
 uU+DrCDruvDG00TlKTl7HbK2wvtQZHHYWFkVgCt1ttA4gVYErqUjjtD4N/okssJnYuV3RFVJIT9
 8oCRoVTXKu2DssK8Hjd8u3JrtlpB1C4=
X-Proofpoint-ORIG-GUID: P40VHvKYx5ksVrvJm91PxkfKIgctBX7z
X-Proofpoint-GUID: P40VHvKYx5ksVrvJm91PxkfKIgctBX7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034



On 10/12/2026 9:20 PM, Manivannan Sadhasivam wrote:
> On Thu, Sep 17, 2026 at 03:10:09PM +0530, Krishna Kurapati wrote:
>> On Glymur, it is observed that although the exit call is done, there is a
>> power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
>> well). As per recommendation of HW team, disable the repeater during the
>> exit call to prevent this power leakage.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> RB tag from Konrad received on an internal reivew.
>> ---
>>   drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>> index efeec4709a15..7db2fbff6163 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>> @@ -229,7 +229,10 @@ static int eusb2_repeater_set_mode(struct phy *phy,
>>   static int eusb2_repeater_exit(struct phy *phy)
>>   {
>>   	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
>> +	struct regmap *regmap = rptr->regmap;
>> +	u32 base = rptr->base;
>>   
>> +	regmap_write(regmap, base + EUSB2_EN_CTL1, 0);
> 
> Can you safely write 0 to this register? Since init() just sets EUSB2_RPTR_EN,
> wondering if you need to clear that bit only.
> 
As per the HW spec, only one bit is exposed and the reset value of this 
register is 0x00. So writing 0x00 to this register is valid.

Regards,
Krishna,
