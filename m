Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FC11C01
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791941041; cv=none; b=bzE05tuKZqe1tXvPGBjoZVSC5Y4DDkNFsYJL9s1aFvQ3O8IaF8h+L2XWJcSsEttTcecMscqaZBUBJZe1LoZl8kN+aJ1dE/9VCvMvQ8V0MzhHtZMtDUrt+JGCjcJCdpfGtuvKkRdjubb3Hf3kIIfzC3+Jf6BoSeblbGgpZjsA/aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791941041; c=relaxed/simple;
	bh=bME5i0DZIV1lF2NykRIiMJxtZ8bK6OAsp3vw9WaYnKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZOBdByn2VKBqEQPVlbZA3PEx0Q8lmtUeuKzmjssIJ4opF4J0RXh2HIknX/qtNfNKG8pdi9nn3DnonkWDP/1Is6OvMgMZ3KQBXujue43AgAygCBxa98Iu2Uo8F81cPwUtqtEwfHAX9gj4RrkWsvfOBpB9yZyWKoe1o7U+z08kdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAWqs9Nk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbGnihuV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAWqs9Nk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbGnihuV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DJaEFZ2222162
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7QX4HKEy4Tb4JyJAP3/xQJsm2k5g56YQykmhLlZ9Lo=; b=ZAWqs9Nku6EgdLWr
	O+52qKP98n4qtMbEHVbuz6r4yUh99KZ1p2ZTvHpqUi4KbwwqGgmCHfjjDjbsydvw
	81Z7y1Iu1p3h22OF9HEA6FsI+SHB6S6UUVxHFlVIRY2hb2AP9XribDpq7avCfbGQ
	2HTod1fCyoA0htHMwR/hz3LbVsMgXFnluFHDyvR9lWxl8m9ERhEeOJtn5h6X9OSX
	r5NAccZkKshiPWq8+TsW44CD2VejeAIr3s8a22Ed/Rb9BZmNGxNAqeIwQGBsjF3v
	l62ZSqBcj/XbhlFkbFBYd9SgSRw93OzrgLnPG5IWPbD5fCImNYzCgEinqxjbO/ZW
	PS/o9Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txs941c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:23:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so3582375a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791941038; x=1792545838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7QX4HKEy4Tb4JyJAP3/xQJsm2k5g56YQykmhLlZ9Lo=;
        b=LbGnihuVCOJRH7tjTLJPWzBC+niHAgmpVw+7VuL7pGZHE2tS+NeJUif+S1/4SOs6JT
         ckp+JHHx16mkDlaD09NK90TudRgEcGw3LLeANCzzCJpifhN7OE7Y6yzx0eo/QauOd9rY
         PAPi3M3jz0VJAGuiUTAk7SWZlbI4ebYxLKuHf+5gBhXOgoE7rS//MeKdae9/yLXOYpgP
         qbL1KqlxH+gngPYHThoPSX59QYqWyjRXNoN5R8murfgnlhKWYfdbr7jET27SC1H/IcqX
         ATSglJKM1xtTbhxM4XiSebEnYbDP77aIl7CXnn9h2HQ48tliE002WRYF8ytCOCbncAU2
         dYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791941038; x=1792545838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7QX4HKEy4Tb4JyJAP3/xQJsm2k5g56YQykmhLlZ9Lo=;
        b=l5KpElGt3pnpFLTkQfD7deSm46sUGf3HXEmz7Xt2HOjaQNsosvbL4h6uJ+bpo1OMr7
         VDVLEN9/dERCq1/ra08XYXZCzSa9s3O8cxix+9IXJc56a9ugmFNsCuxp54+kBjsHMTje
         nL35rxvmg6FjhW/TnxCQ7bPmITZn15ijH+lAPfbi9U49Xe0kfkjgmh8gtvI95/ykjX1T
         mHGjBcdLYy4BZpNWExRAmqNi7t+IUYBVNugMulGtK10UbVjPZ5qvVxUkGR4Yq/z7qP00
         tkTVVGLZM5XzuP/wDy7dm398yx/8/ffQDjpnmwPxwwtb5wDxDDXTu1nrUzyVrBM8aqZM
         DLYg==
X-Forwarded-Encrypted: i=1; AKwUvBw2NSI15bkLj0EQ8cesgJtiNPPf3ieQ8lukwydwYMAS5Un90cJS25U60NHJMVz8InTqnb+vO5tMbwAxzuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFC7a7+bIrQbKc1SumdbVC7Rl7QgWONp85qKMy5lMF/grV+m7E
	CndIyl7vHPppoC+Qy4y+q1fk0DPntRwAhF+k6KQUvXDc7GokzsWks84gP3bqLrmmX9Esf20rX9P
	m8zDZg5/w4/cKxNgLM/n7HlkiUGgOuS198kpfV7yeNh8uSB8OTjWuprSoQnlpq5iS0Uc=
X-Gm-Gg: AYBFou1AGcVddeIOMTU7OICcjizsWtvmlccHRAZTPgPHAChDCL+pZGQW00ZG7rtv1Up
	OwBh2ujwH7O+kL+UyUtaNUrXpj6N41dxEEf+RnoxxU2qFMxB73Nb6bFDwKyXM8pyTb15QAOiOqf
	AKAL9dsQ0v4yTTgFNvkn3QP4ZUP0yTbDQoelN8FrQ5792idpOF00hws7muEIVl5YhmxbDSfxJnR
	bW9vcIV0ynQHdbmnerubNqMIS31/33AoLiuOR9cD0vjlPAd3Wh5HHISvA3cX3Fz7ZXhOfsphxcA
	SS/SxEZTW2eQ+j2uqNPGVxI3XrvXfkQwjZgcfLoiz36tQ2MVdcAjmZGo0FStDpXII3HtrdDrZa3
	8SHW9YsYntMDxZJhg/EhWZAlbeMzhwdwry/MYLhxOtw9HmTNKCemL7s32fwBgs4/p
X-Received: by 2002:a17:90a:e7ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3ab3a3593famr11738466a91.2.1791941038151;
        Tue, 13 Oct 2026 18:23:58 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3ab3a3593famr11738443a91.2.1791941037641;
        Tue, 13 Oct 2026 18:23:57 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac678d2229sm616463a91.3.2026.10.13.18.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 18:23:56 -0700 (PDT)
Message-ID: <b410aa8f-c4a0-438b-a02d-765da25dc160@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:23:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
 <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwNSBTYWx0ZWRfX0q1TkpYNw8cm
 CRfCXGplaH9kiuC/afkkmPhaRhclKWsALd1S0H/6mZcvkd6F0Fx+DK/g3hnb0UXFqyDIxEVbMLL
 t5J/9X0pUTvCayP2SYxHHBuXfIdPtJQZLkQRy5UzrscjiGfUMFojHF8bvzu6zayBKH2ywwpYeC2
 /sQd5UDxZNSJQg/SbEywUVkzY51BPAm+25gU/7FcyS4A1JhYgA/ISdBcXzCUjVvHwoKWd9lCXwN
 p6hwd1sbFFaDNjz64yZE/uhVE5jLoh8cRBZfFVmncEAZFJ78o6AqQWgz2usjsMTVJsbISAG1n/l
 HPdrEymDUw+bMmpDaMB7cDjjEeyKuQgMtgc5IR0w54CBy2zREmJ8reppyi6TB2QpRzvfkTgDrIp
 ZB2V6dNMT2MzEFrfzqLprg1J5EvmwDxKTjc6KL9cvld3Jhwxg6v5ujuS14gyiEZrgc4q0Zvb2Zg
 vkYk5lDRZfJTX1jz1UQ==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6aced9af cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ay6wXbw5ScRiw2kLOwEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwNSBTYWx0ZWRfX4oP577xxGwV0
 THfB9RMd9WUARqYA5I0JW/IKqww7uZGWGiUdXDFZ+xGA8ES/wYugnP6DFcdnJjxdPc3jYH0zdMo
 Dy+X5D5LmN2RE7J/lfuiJmBNx/WwBh8=
X-Proofpoint-ORIG-GUID: FbBTR8VpIIq7S5xg_P2uqnfP5WZM3PXq
X-Proofpoint-GUID: FbBTR8VpIIq7S5xg_P2uqnfP5WZM3PXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140005



On 10/13/2026 8:49 PM, Konrad Dybcio wrote:
> On 9/22/26 12:35 PM, Jie Gan wrote:
>> The APSS debug block is built with CoreSight devices like ETE,
>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>> ETM trace.
>>
>> The replicator, funnel and TMC ETF nodes in this block are physically
>> powered by the CPU cluster power rail rather than by a dedicated always-on
>> rail. Add a power-domains property referencing the cluster_pd domain to
>> each of these nodes, so their power state is tied to the CPU cluster
>> domain and the runtime PM core can power the domain on before the
>> devices are accessed and let it be powered off otherwise.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 567 ++++++++++++++++++++++++++++++++
>>   1 file changed, 567 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index 131fd2a16c54..d9313de53ee5 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -218,6 +218,110 @@ domain_ss3: domain-sleep-0 {
>>   		};
>>   	};
>>   
>> +	ete-0 {
>> +		compatible = "arm,embedded-trace-extension";
> 
> No power-domains for these too?

ETM/ETE device is the debug device of the CPU, no power-domain property 
attached to the device and the power management operations relies on the 
CPU itself.

I missed qcom,skip-power-up; for those nodes, ETE device should not 
check the power state of the device.

Will send new version to address it.

> 
> [...]
> 
>> +		tmc@1d029000 {
>> +			compatible = "arm,coresight-tmc", "arm,primecell";
>> +			reg = <0x0 0x1d029000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +			power-domains = <&cluster_pd>;
> 
> Is there only being a single cluster_pd a mistake on kaanapali?
> 

 From psci map, KNP only has one cluster_pd shared among all CPUs.

Hi Jingyi,

Can you please help to comment this part?

Thanks,
Jie

> The CPUs have a different Aff1 value in the MPIDR register, so one
> would think there's 2 (also according to the cpu-map)
> 
> Konrad

