Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF75A548560
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953522; cv=none; b=W96BZ5W0YFoX0kLm8knyNhh5loa/3bxSjiR1K2D0iCXd4QbwiLZdD6qLtNnGLxqCZ05eA2YfHC57e8O5CwbaaXdXKzOeCB8kpHm9u6/bZNaQXJ8YKFNGG9VJSlTpfOsDCQNZWuJ1CMH0dhhshXtEVgbmJ9RT+IkfejXQmxdxy0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953522; c=relaxed/simple;
	bh=2bI+hvC4gIbQMw3MMwoMshp1SYwCTQOzMUzddE9Ei50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPUT8ZThRu0E2Zyo7U576fgUqRqfKaiYUPKE7Pr4IGB/5tM87mzQ7AQW55lLJWHV38gvuj6I88qgTEWlnzYXJmCwx6UdrWyhOGPDhgM0hdhjyu0GDV9zNEEmRtBTKXsfGpRvSCUALd78izseH2A5TZYZjawJ04s9jTuhe6ZEH4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQ2z9hcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYNvZjbJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQ2z9hcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYNvZjbJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU9Df1307873
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0HTfQcHjuPofeObVYGqE1jAWmGHTVv000wfTZ7gq8iI=; b=fQ2z9hczGdB1BGzh
	iDO/7zRUnWTXugfJgoIhpkPkg4xLoY4RP+uRYiunQoPWrEhb0W0p06Z2ExHOrPyx
	kiLHrt1Nwt62jrs9UgR766OXSMDxnFq7Aov1chOLguHR/gHFDVgrChuOgnHLzJa6
	CdpJvJsGEx3SGbjx31JJEVrHtbv1cFdHpRJPyQq7ggLbLTS3ZZpKjC1Z65ztga4U
	6tu2W0Vnho4WmD+lUFFpoPiq02/qo/hxKKe0YMGnrvf9+Ax1NDX9Z0mh2co21FS5
	Rxl8FI5HqNEVM+5wbPBIjHNdvDNEFclbRQDWoD2r1mS/4OoUIvFQHZXyJLeZHzV8
	6dTfIA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstuayyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:32:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7868c30d4e0so75727137.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953519; x=1789558319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HTfQcHjuPofeObVYGqE1jAWmGHTVv000wfTZ7gq8iI=;
        b=GYNvZjbJrSofJtp6FZ2uYWqBoaFdLXPSgHdvhKN0tKlrBwdL5UTl7txGt9v4R1HuFC
         Mw2lLXz5+yQbP9S35hi6zkiKqXxi/NwB20kOqbGVrYbOVPM7GlvZIPk1+1JS+UW0kWkD
         hlYLjpwCtJtbqNP2GL0tJouRqG+FbPkP8Z/m2pSXcFlMTEo9gsS8dyIsMFO1R4DDPrfA
         GZTCNHpsgOuFHszW2rPKsEiqAbOqRzYgP5hINM2Zfq/POYs1Ir2hYcV1AQwEiTYMk2ZW
         /Enz2D668UxrZkKgwBgdzRIhhfJqkPLE4Z3zg9//f1aCSR3NsWAgjtV48mLb0LWLyY6e
         NDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953519; x=1789558319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HTfQcHjuPofeObVYGqE1jAWmGHTVv000wfTZ7gq8iI=;
        b=J1eeSA+5nJjm+CQnsuFUGpLwqPMPx7biGJJphU0eble2fs69GqeQuD8YXoRbiXWH3x
         HKUWu1oU6DXRgFExG31gWxDnLdSEyknaUFtSmAf9tiZucGcxkxQpjGriiSdInTStHxNk
         B75u4koKkRrNgnF8Y8TL4htj73sNUCXCmgKw9KDyUqDl8phMS5lvdR+raeJX9KaECqOw
         NmzWYawEFdJSKEy+zliFJpEuIKCYaHXuzodcgvuyhKeKv58sUzFuWZAeiY+jQp3Cg7Es
         zLAftXvXkeryrBIXQloLeh9fhioSvAyn6JM1dtSR9I1BcPS/5yvftU5Q9hjr+JQbD/pg
         NnIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwq6JB9/WmWwEKQzqnYmRoZ9qSyQPds1aYwZzMKGpEOiYGm/4JQLZTXQf1S/iXFU61TWZRsO9VryEmoH6U=@vger.kernel.org
X-Gm-Message-State: AFuF++m6lw1kroawxsKzb/3aj04bNTYZuG7+z4mW1UsWLYxKliAIGXKG
	9obAi2dEsf3miwW9oGRSZj6g9VvmbdwTc2XMae8lw7R3g2OKgLdlOwGNtYpbeo38zhi9v3M5+oG
	a0fUq/pfRMgOYlxRJtdcqSOWL6OjhFw8O/5/yifJNnYu0RUdSMC/wvvA50K/oNpM9kBg=
X-Gm-Gg: AYBFou2ugoBFQSxBbYZRzM300uwrPmacX9uf3v70u8p0lBtHwuZMUl1XOQb9dt/qosM
	0N3vFR7TtWHUte1/BGCVgtpzIbGkQIk2I25J56QYn6wBNEAd8sueDR56xVMv7MdsXXT7u3456R5
	qR47gjyojkxaTpo5UHskgEWLppFnU518Aob/sJnX8uEw7aC4CRlW7zyaGiu84FPpyZB24ctz9NQ
	8y0VnRaP5ysfSeNmn/7Brw1MP3GO/Dd8RmjAQZOiL/wK1SddJ65wfcr5mQXQdZ0nuFl0q2/pWXv
	5ZXjMapsM/YqOlGONpCw/m9nFI7TF61Rj6YprvW78idd+orMNStDU9y6bddU4cXjGN68vm3jEXr
	6RO0vPjGhaKKettEreCT4xQ==
X-Received: by 2002:a05:6102:9d8:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78a60ccc908mr4296894137.1.1788953519171;
        Wed, 09 Sep 2026 04:31:59 -0700 (PDT)
X-Received: by 2002:a05:6102:9d8:b0:787:74cc:2b68 with SMTP id ada2fe7eead31-78a60ccc908mr4296848137.1.1788953516915;
        Wed, 09 Sep 2026 04:31:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5bd618sm796814266b.56.2026.09.09.04.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:31:56 -0700 (PDT)
Message-ID: <f89bf46b-dfda-4fad-9e8e-fb88741fca1b@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:31:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: Mostafa Saleh <smostafa@google.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <dcae935c-ccbb-4cb5-a184-eb5dc2cc84b8@oldschoolsolutions.biz>
 <ap_qwdz-3WibXRjq@google.com>
 <364326dc-9715-4e77-bf25-4d0a30179826@oldschoolsolutions.biz>
 <ap_69OsnAOwQyo50@google.com>
 <9762659c-fbde-4887-8da8-200db7dfad09@oldschoolsolutions.biz>
 <aqBKI0Fg3ZqYPOJh@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aqBKI0Fg3ZqYPOJh@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa143b0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=vZxbLtyPAAAA:8 a=gs9rdYFyacZa6GlARNUA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=YIznc7gRMHvxYRuyG5Sm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyOCBTYWx0ZWRfX6ePZPcBrcXFH
 a5FJ6qmzq7apSOkp/P+FTbZmaJcgzxSO6k5gspzUvElTny0nHOgXrW02qUX4pki07HVnuXlEECc
 cQM3c4R58JO1pSobBbZiNVhJ2MVPCio=
X-Proofpoint-ORIG-GUID: 7IvZCxyXclzVel3gW6q4PAzIHdoVO3XX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyOCBTYWx0ZWRfXwuNd5mn4PgUR
 rKR01yBksn8Rmaoa5Ixmrms+Z8jm4n6qj107RTFxlQI3vm8tpPtgWVzVxKQjhJbjxas2saxyWjQ
 HmVr1mgveaHzFHZDl1WIpyPMDgnysJ8zojWKTvMbQm0KEm9ScKpAfNQe3AM84lFoMtUxjLyTvtH
 rJGGAuy0GyqQts4Tbl4JO3nBdlgjcLmo4v52aOqwkQh8IdwHY84pogGMpEzN/urL9MHfhxeb8Sp
 uwvbDI7gn/Q8MvdCweAOGgY9OT925ra1UU80PbDFP08cxzyYiuUAWFn5a1n6rQwpsKgz9qN+vpU
 wsdnhZny9ADpjLReK8x1encrO8jQMbaIYRfwCe5kslDcPsJGIVqT1BKFgmNjY3m59WVwC/HDjwn
 BtyyWfQ3tLSWHDuqYpMQqENg7Y2o/2Y7QuaXqMn+11azP3JTSPVwi2+xqnpcp1lagXf5U9gdAME
 7DeIsTcm5X3fko+Irtg==
X-Proofpoint-GUID: 7IvZCxyXclzVel3gW6q4PAzIHdoVO3XX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090128

On 9/8/26 7:47 PM, Mostafa Saleh wrote:
> On Tue, Sep 08, 2026 at 05:04:44PM +0200, Jens Glathe wrote:
>> Hi Mostafa,
>>
>> On 9/8/26 14:09, Mostafa Saleh wrote:
>>> I don't have a display connected (never managed/bothered to enable it).
>>>
>>> Can you please share your .config, I can test with it, just to eliminate
>>> the possibility it's causing the issue.

[...]

> Booting in EL1 hangs with timeouts and missing suppliers:
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
> [    0.000000] Linux version 7.3.0-rc1-next-20260904+ (smostafa@mostafa1.c.googlers.com) (Debian clang version 21.1.8 (3), Debian LLD 21.1.8) #2 SMP PREEMPT_DYNAMIC Tu6
> [    0.000000] KASLR enabled
> [    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
> [    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
> [    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
> [    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
> [    0.000000] ITS@0x0000000017040000: Devices Table too large, reduce ids 32->19
> [    0.000000] ITS@0x0000000017040000: Devices too large, reduce ITS pages 1024->256
> [    0.163152] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> [    0.163313] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> [    0.168334] clk: Not disabling unused clocks
> [    0.168336] PM: genpd: Not disabling unused power domains
> [    0.170770] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [    0.178347] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [    0.184718] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> [    0.211932] Warning: unable to open an initial console.
> [    0.212057] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [    0.213907] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> [    0.213928] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [    0.244210] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> [    0.244275] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> [    0.251833] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [    0.259418] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> [   10.213618] qcom-pcie 1bf8000.pcie: supply vdda not found, using dummy regulator
> [   10.214873] arm-smmu 3da0000.iommu: deferred probe timeout, ignoring dependency
> [   10.228713] arm-smmu 3da0000.iommu: probe with driver arm-smmu failed with error -110

If I had to take a guess, your initramfs it missing some(many?) modules

Konrad
