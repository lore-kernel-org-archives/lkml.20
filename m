Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A862F60B2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139490; cv=none; b=a7M1JZYDf30vNxLLViSnWstPNqN0sPSqV5hDYTBTznM4vqXME09GeD4lCLPdGOGCk3iCEQ74T+qF+ymMincdHgA6ZYFn/lkgSNJypJr/rEc/pN5oc73E9twlDqHTPlSn1UGvN8DIt5+3nSTwd+O3XjL/whKPotT02IdKlZ8yjis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139490; c=relaxed/simple;
	bh=pC1CCyXtvN10xc3N5sbvGhGAdLjozRH2BPe813E7lyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XttqQqO0KD7P1ujdJiBXCNBjeByMjizesf1T/oO/9guBfkl/S+E4iwwpMQSlvDywr+D8Pi1HDF3nqbIyLJrtyvlP9AmoAWsAABbOb3WLh5hk1ySWlorN4cdpB5sqorREsi0PG0vqqT9/HEMAmtUQNnWR62lj8IwjC/MPhsp2PxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlSo1t0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtHIz/rY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlSo1t0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CtHIz/rY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFA5WV658269
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=; b=NlSo1t0VyetQAfcG
	0KZZL2ymdWwewEi3LnrO203oDKoNdt5vD8bkMO1i2hn3XvJ5dHFoDlcU84tWPtYP
	s3DxKXwEuVo7C/yqDkWKspOal4hpw9RemuOksseuF9+6jQPGplpV0lECFdfSDe+2
	BlLlUaKS0LqLIphK0LQNDQY80pt+kz4uOW0JsomVu4vHseN7z704jOCXutDS+OIE
	WSOTsr7ym/zto9R/TrfcARNMQqyyX15Pns1ZG7LEYAvg3E1vJaEXMo5K2Mf7PWW0
	qYPiEU7jOXQomXY8QkjfXrtFuV6no43BhY34O40duMjjbmMLA81i2Xw8QdGJNavg
	MiFRPQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22r07t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:11:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86ab8302b54so1030777b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789139486; x=1789744286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=;
        b=CtHIz/rY4lMZvIpDhWAOaiyXecVRwDhxuGplM36dpPP0I5KmuuKep4mkrXUZqUGACo
         KLBI4P9sJhAAtHeOrKaChqq0qeNAFIJ0su7MWLxB9lgWfwFJCB+9DKLnZcWvRynT9TXh
         DXyDk/ncggBQ51QWe6xZ93qTsgbMH47wEvHZIrIGr+Z/nyXbMlMMTzWSAPAMX/D4c9by
         eNESXQuNuo4MK1bIcbWXZ39CJMvXLwcPByE6WuOwoNUXD5+IsCZYuMlpt1xm+JiUCj14
         7oEzC2T3KCImni/F+rP0pLT1fGmgJWZFI2yKdHseXKhfkOxgm1jqV+j9UKdIyxR/4sbt
         A3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139486; x=1789744286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=;
        b=qyw4SRgmFupywXMhvmsxFAUsxKJJfSkgrrx/ehitm0hRmATnPcsNDWh9mWumvb1byF
         8toLtWcX5UMGTkMshM1PNPWxrlLCT6lH+9u+hNoXdDMZ3tnCUDj+73Kd4EAhwepAvB25
         GAxqajpt+qG/n/53dYZ5FfkpejtgdczjGuq+UHnINxuRZTAHuZY+9aciwhP0vDaxAfch
         mMHs7Ys1LrQ4XscVTnWIqgBOSOmKl/tdO/yq1dm/kYUsyLn4kR6CyOXgLIkAWZsen4B1
         i5ByQ/FRxpu1nYxFlCjIvIRs3U5ROaOx+w7qN0AwzAqoEljT/vLt4KmxFMSlo/ytHlWF
         sNYg==
X-Forwarded-Encrypted: i=1; AKwUvBzkkADXeVSW3N9b78ZDb17MROnQ9Dz/ypxJjmSEHc+XA5r8jCwvYcQIFA7CSodSkKXDRK/1By8ah7bV64E=@vger.kernel.org
X-Gm-Message-State: AFuF++kev6rnQRDSaX8cKuxK8Nu1Adgt0uNag/GZT3UWJFCLYaY7keuI
	qbl7X4e/hfHhR0gb4/efQbCi9ML1uW1oBD7o5hqKlbRtw21lT70g2PIOFaASgtyknp4XhKTD2xh
	d01ykYn9jMVsi5V6RzCjjYE2wNoIyhWJtNEF8Ino/NTJOxRDxSjPMsfPnEKlBxgQphlo=
X-Gm-Gg: AYBFou1FMgxBjSwBtE1xhkZ48Ns6jeQNih1tZpLiJewO8ASIEQyhDH9y27uwFHW7ysi
	HmP1cz0nfQlsCvkWUz6MXydqpfBzLMVPmBYt3dEsvZMOWjmI5rrld9pjalxqItf/kCsWxGSspYs
	EofvGhmHaBs9GFxRiSzU4KMXRNjNelfSk5DW0AhbGr3xqLElHn6o9Cqw++cuLH2OwtRNydp55GM
	M5Oq/pOoGCW2BujV3WQ6eIQpM48ZbfzSCqHS7mMhjiGqNJnGN27ENnHl8cflthsYvinVv3ZO8Zf
	1MN0Nfugjik96GG+7/zlwwaQtHQfCbh/VwQBdSOFEPhjEi/5qGbwe8jyQuL7Yt7wieiVPOFa12x
	cBiCp49rdIbwJdC1WfgodrSvBlyVkUCbC4g==
X-Received: by 2002:a05:6a00:1749:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-86b30f12a74mr6902285b3a.2.1789139485952;
        Fri, 11 Sep 2026 08:11:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1749:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-86b30f12a74mr6902226b3a.2.1789139485522;
        Fri, 11 Sep 2026 08:11:25 -0700 (PDT)
Received: from [192.168.1.8] ([122.177.240.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250c1278sm1268447b3a.8.2026.09.11.08.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:11:25 -0700 (PDT)
Message-ID: <a9d52219-301f-40f6-8af4-c0dea8781dd5@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 20:41:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
 <20260909-devout-generous-oyster-0efdef@quoll>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260909-devout-generous-oyster-0efdef@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxMSBTYWx0ZWRfX4OrqJp7JOXGm
 fbUPTpYkCYt94K//ITknrUJ1jjrcN5/h0nX0hegMyu9VkLcTHzGNmo421Ik+xIMz/+Fhvc5ctxb
 A/bUX4lhQciuuwapdYDDKys4hfm2cIws7manlCOjmojC9BtLYteeEdajRxyng1HVJCJMeAiMXNM
 gS4SmlBTUuCWZaSJLQWL2toPzjJxEjM9dfWLsBcP+8st7gt94g1nLYTe5oXyLhUKDEYhl5XOoR4
 LHpa0rnOXOOgreQOgY5BqW+ZZmk8LoOM4XTvyx8iGTlrfrBssbC04aPSEaYcMHlBZtJXxvdOxem
 gf9HRng1KQv6IOAFXyybFu7ue/gv8g3NRuQvWUZ2h9ggNvBTBUG4wtm2DzUgg3fTIdy7PuDhnba
 WwLxcAwbF4iIVaVeUdeVkCTTtdqMeINdDa42XjkXiUjJf4SXlnlfQCMZVanWamolk9NNxTQr4Q8
 Xsr+v60MLsbPqUG3++Q==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa41a1e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=3NWKqmDfUQ1iRcuN9QhctA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dz92lDrrY3zvL3j2_bwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: d3SpPqQI18wykni5BAHn2cxzvZJKPXpC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxMSBTYWx0ZWRfX9JJQmuGnrX2p
 RKYcTq84017PDQkIm4Y16Mp8wcP6wO0L90YnAo5TM8EjA9fOkctcAFMG9AyCXNnbbj0Z33JNodi
 LKPo/k9BZfSzhppQ0I3/Bcfe/nA3YfM=
X-Proofpoint-GUID: d3SpPqQI18wykni5BAHn2cxzvZJKPXpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110211



On 9/9/2026 1:00 PM, Krzysztof Kozlowski wrote:
> On Sat, Sep 05, 2026 at 12:20:42AM +0530, Jagadeesh Kona wrote:
>> UFS and PCIE_4 share the same clkref enable on Glymur. Hence define
>> TCSR_UFS_CLKREF_EN as an alias of TCSR_PCIE_4_CLKREF_EN for UFS consumers
>> to reference the shared clkref on Qualcomm Glymur platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  include/dt-bindings/clock/qcom,glymur-tcsr.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> index 72614226b113bb60f1e430fc18e13c46c8b043d3..f338ab4454a14aa75532cd0a6a56b6bbb02f9448 100644
>> --- a/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> +++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> @@ -20,5 +20,6 @@
>>  #define TCSR_USB3_1_CLKREF_EN					10
>>  #define TCSR_USB4_1_CLKREF_EN					11
>>  #define TCSR_USB4_2_CLKREF_EN					12
>> +#define TCSR_UFS_CLKREF_EN					TCSR_PCIE_4_CLKREF_EN
> 
> I could not find usage of this new ABI in your patches. Can you point me?
> 

Thanks Konrad and Krzysztof for your reviews.

The above ABI is planned to be used by the upcoming Glymur UFS change series in the UFS DT node. 

But based on the Konrad's comment in this series[1], will drop this change in next version
and use the TCSR_PCIE_4_CLKREF_EN in UFS DT node and add a comment there that it is intentional.

[1]: https://lore.kernel.org/all/16ec601e-68a2-4793-8639-b899f31ff819@oss.qualcomm.com/

Thanks,
Jagadeesh
