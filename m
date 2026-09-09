Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB8453ECEA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956029; cv=none; b=U4gc55rzOQZCCX5Pp4k+jKX0ZLyR4PXK/psJZmvwQAacM7SnY8FJZKmCAKrIcNzA48w8wvOAa5TPheOz2TNbWfXn6s5i4jh2R6Rrv18er3hxl/TIAW/8FNtD9eYvDZuF2OGspOFjMGFwSEMn91VJ+r/pidgyms1+DRhm0QXK894=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956029; c=relaxed/simple;
	bh=XOFr1t6iHiWwqmGZHYFxDJ3h70Pbw6ACPcaaRf/a/pU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mxb1dIKD98OJue70Kc9wCDIhDLmTYSTQRYB002mar/nopsoeuh+fdfFsPxCsSeIurr2zXZhZtiiUFDA9EHf+ozSwIqFKU5yvgZ6/afvrA9wk5SN7zYlFEkYe1DSA9ccqkpxsSAybIyim9xIBYpC1ECslQTYSARS7QIUx5o67m9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nr81ZRgb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PivBa7QG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr81ZRgb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PivBa7QG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4gY1183711
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZaofx3jEGw1pcoifNkFrAimWrgIiAh3nV1FQR9qRSc=; b=nr81ZRgbMWebvGXP
	sz0HLid7uQLBJjrv2K6KCplWOWN8T04JTwLG07dC/TGjlKQ3CD4iMfyXda/PcSj6
	TuulSshY5cICQ3+aJdQmJ6UhDXkqsHUfSYBOOY2K91VSVglyOuHEhmmWwcimX/DC
	QGywt6sU5ZGAuS2hKp7+c05Q4+uQ4vWFcfvZOZLTEeNQp3P6EKtAycHPgBZ5O9va
	HwHme5+Yh/YCmhtmNhPT3/i6+/B1fYHmdwMXlzEBwUSUT/HTDtRy3EKtGbTN8VKt
	g0cPToh+/p1V3tN/QU/7QH9iDGK2PP9cX8gQBrfHWhEjFy0ezqYhJtz4DWiGmfAH
	REA7zA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559rh47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:13:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso104752285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956019; x=1789560819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZaofx3jEGw1pcoifNkFrAimWrgIiAh3nV1FQR9qRSc=;
        b=PivBa7QGskxoEchCqK50K8Qk9f51+tvGFMIY4XfeRs2IQ7x4reHyRpsfLJK5jykVI/
         c/iMStGrGTUSARYftlt6819xB6hbuGEqcTmfD23wcR50vYekJ6iDf5JEXTrunOfLg0oE
         YKytYt54ORkTU7ppKo0rHCiuFyS8FwgB9+aYdFEjIX7d1umisb0zf3cvVLDEHPMCibPT
         J9QY2vD4SwSYBFenPD9kNnEnDDHdyHD+5iAQb8juY8Q7Q8T7P9KXFmVvjvqwTPBc1veQ
         mmzxdpjOzpNrkH/7/tAvlNUNXWHrby9z+xAIZzn1/M+J+4oQ2130a9KPDAzmxQuigHL+
         WjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956019; x=1789560819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZaofx3jEGw1pcoifNkFrAimWrgIiAh3nV1FQR9qRSc=;
        b=HctREK4IL5O2lO0JSndqN1c0aL2RVtRGxViI/OuVX2mRc0SZXALkAdhIBFNaPCALuq
         jgRdGPTZW0Y0Q8sktkEpTfQOIgccijLHRQlLRGX1bxKB97721GBHoLxBNHBYPrbIrk+p
         4HgYr3jdgiTSRQjZ61xulfK95L9zKnwE4SsRYG24rQsx4z5mFrHBeTuk68FHMbydJFni
         syXgpTjjAbCDnM4Y3s4nA7R8W/05wbaE1xC/sRE6RsjN0/40VhekUjJx8hKxV1/5LNFz
         QBTWOVvghXRGCU6UtVPve2ZW/+0Nnp+dnA549/IY75sJOGA3sqYJAozoIlCg9QX5eZ6t
         MxEA==
X-Forwarded-Encrypted: i=1; AKwUvBwPOTSOXF1hbH3zWM4yCyOuJqjnOGhzP1kRKLTn33MY9xG29/irRbR7c9cu3Qcm4A860w+sQe0GiR/kAc4=@vger.kernel.org
X-Gm-Message-State: AFuF++lOy4NGvQrCYiI9jD50/zJOOMTNrZIC6miQWry59KLsez1KL3WM
	ovPvyU6qfHlo+I50sgnobU4OXKI2moqFgF8bpZHNd754Io+lbBa4RyRK5iK4VDieUmmYTpwPrfr
	/KsUZl3OQgZqAwrO3cKapcVBaUx3sqNbfZ2QFwIxiEDmGPM+1crRpOEt+bgTnka9qyJs=
X-Gm-Gg: AYBFou17aGb0j0c7HnJ30+Mk2zOMudxrvVzmndUnQYHVtKYJ43xBeA3JrYabmJuqkXl
	YOtCejCJvHmR1/yddO5qyLsuTUuxdUfk+/17BQArVWw5bXec9urKg8lRautPrVFTSFulixHYjRV
	IPsWIoljL2ya7HFantweUtW0pdvc/6023wHj3ZG4yIQ7iFykwXou5S4Bgln1ZCzzl9ztuqRoWWm
	WCnUE4lcQQwPHDiMK5L+rmcy3FLbxG95/vLvW6fOsrLcDz/WP8yUe/buWrVGbNqj0YUPF5oCC2v
	eLONXsSnDD54MU+I8161tC1/XMeAgPeXwjRO0mKJfySJdUyWKHjOP0pjxA8QN/6qjjUpypBglC+
	S81jCMWTj0b3xhtcQPOqPQA==
X-Received: by 2002:a05:620a:3713:b0:939:b2f1:75d4 with SMTP id af79cd13be357-939b2f1778dmr1482191385a.6.1788956019176;
        Wed, 09 Sep 2026 05:13:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:939:b2f1:75d4 with SMTP id af79cd13be357-939b2f1778dmr1482183285a.6.1788956018592;
        Wed, 09 Sep 2026 05:13:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036652sm770138166b.2.2026.09.09.05.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:13:37 -0700 (PDT)
Message-ID: <bc051d4d-c94b-4f01-bc77-a4da93331d6c@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:13:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
 <ap6o4SRb_4dG97yD@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ap6o4SRb_4dG97yD@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa14d74 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ypysuNhM5lKd1d43LrAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: VyE0qN3ezhiJZfAJIEe6wkp6wjkguXvA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX1B2EhOzjOWhz
 REoMJ0saMrXWGMwZbzXWfLJ+hbHELrkN5yGPS9hlouZb5g1DDyd+rJPCUHv30jOpYHJEk0ijKxM
 lU+dMs7jZ450pNBtS18pzs3fOXcrtWg=
X-Proofpoint-GUID: VyE0qN3ezhiJZfAJIEe6wkp6wjkguXvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX99RS6y1qBx/R
 Q7nYcWwxsSwKDXcd06c1P3LKpUjsCyho0lRC6+z22H5a7VqGMfyfyiVf3lsLUXTNPIQjM94Rs+l
 O0n6xxkzBbMzZV39csq0rUuxXYtuHC0cVjuzfY9HXcEzFzhwoWkcMWSdzQAm/wTxhPttJnUEOQ4
 QRJYcXNixtILaWU8j1ICrCN8v6eun3B+khHT1wjFVS/KJ02CTQbLb1lClAESxFdszlFLjSsTSyL
 OtyIszYwg01THyDZMmTOQ+2HSdQ/11fTvSRA1NEZm6ltN5x8WJNuruIM2VDhK4YL+4lsDSx/RHJ
 qdv1YD3WO3Eftoy3vVRHtyymLmTa0a7othnNTdNltcu7mtscnTJLZmbzOwARDJJnbv0vUpHyyao
 XB2SLe2LIwElrkRLw3n1yzdGSxWGRpSHgKKY35fvVQT3uJA+d0WxtS70wOv2waq6pjSLUgiYthU
 Mq3laFQGP9kIVXMTYKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090136

On 9/7/26 2:06 PM, Shawn Guo wrote:
> On Fri, Sep 04, 2026 at 12:00:40PM +0200, Konrad Dybcio wrote:
>> On 9/4/26 10:16 AM, Shawn Guo wrote:
>>> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
>>> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
>>> initial device tree for the Nord Ride Embedded board.
>>>
>>> Tested on next-20260903
>>>
>>> Dependencies:
>>> - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
>>>   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
>>> - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
>>> - PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
>>> - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
>>> - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
>>>
>>> Changes for v2:
>>> - Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
>>> - Drop unneeded regulator-always-on and regulator-boot-on from RPMh
>>>   regulators
>>
>> It still remains on something like 40% of the defined regulators
>> without any nearby comment justifying that - are all of these
>> intentional and necessary?
> 
> Yes, all of those are intentional.
> 
> - Supplies of LPDDR5
> 
>   vreg_s1a_vdd2h_l  -->  VDD2H_LPDDR5_01
>   vreg_s5g_vdd2h_h  -->  VDD2H_LPDDR5_23
>   vreg_l1k_vdd2l    -->  VDD2L_LPDDR5_01
>   vreg_l1f_vdd2l    -->  VDD2L_LPDDR5_23
>   vreg_l3k_vdd1     -->  VDD1_LPDDR5_01
>   vreg_l3f_vdd1     -->  VDD1_LPDDR5_23
> 
> - Supplies of PMICs
> 
>   vreg_l8a_1p8     -->  VDD_LDO_XO
>   vreg_s3a_1p8     -->  VDD_PX3 
>   vreg_s5a_mv      -->  VREG_LDO_MV
>   vreg_s7f_lv_sub  -->  VREG_LDO_LV
> 
> - Supplies of Nord SoC
> 
>   vreg_l7a_1p2     -->  VDD_PX14

Does RPMH require HLOS to cast these votes? Generally such supplies
should be taken care of in the fw

Konrad
