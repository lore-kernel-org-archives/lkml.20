Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C8C548541
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994541; cv=none; b=NHYIuO+qQDObUc9/aeSBO2UabYBEJmVBj5y7IQiB9iy4yDxON17xEXbdI522dcHI9JHpN8XLetaCOYJ7iSXKzveiJxi9UtgMxVtrYCMwl3vULuWCIIepUk/gSE9vBqOr2xYLZDri9p46uIgke+qY6LPsHa59b6eUIwEtL6nMlyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994541; c=relaxed/simple;
	bh=0RvKwl3q7hzuKdFg1I8BZo8T5YtSb4oa+XE58e6PUGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SYZdInbgZtcNZeWe/rniRXql2vxaX2o4ylo9fTfCGa/cmBjggWe5Q7xVP2hQhw4iq4WE3FZfLjg7B7otKlUlvBV6hzSnHzwT9ccp/1vLtnIP9ExiIcMtgsXt7HpmG2iVzpu0uDQv/VKS03nZPs3EFS8BOAq4cd/O5KMZZ00wljk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J44F1Yqc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KoTM5Dlc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J44F1Yqc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KoTM5Dlc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb0OF905391
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1oOiNmlK64EmT5cyjjFMprTng+kmDl29DI+/5EipVSw=; b=J44F1Yqc/r1emx+k
	7GR+y/JVkcSutXHs9ow6pVoXG5pskbgimKiJoTwguQqtlwK+oTyJzVXa36l4O6Cw
	Pjh9q0qe/bwpr1wThklWKtcATryKqP40B18JZYVZK3IgHDjwL+EzSWydx1KGaN6u
	1dmIgNgU+K2nXi+cTJZuG7ygw5W6KdNvgRaNdBX68+3dyzHQ99ioDmRs6/Cc2kjo
	S2DHU1qD5sQ4Mx5c/Eb5G1VP0jeHhrUTi7aas2Gc5McOt9ej8u+sxCRRm0IcH8dI
	saXI89BztyJXg2+QMQkArMi5FT28PBF7oq40L/XV5q3jvLovfwLO18eVNdOjbxP0
	OwIW5g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p2gd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:15:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c1fd351530so153056137.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994529; x=1792599329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oOiNmlK64EmT5cyjjFMprTng+kmDl29DI+/5EipVSw=;
        b=KoTM5DlcoQPVKQYxjjsJoxr074UzP22t0JcC022ZAcz0oFtSvRefdsPzXm3r2KK9In
         6h169TGJV6LMg5ctc4VmsGfWvx4hw0uqQ1s7Ce5PmDvvw/04GfUxqWH87K5uY+AfeLUq
         NpKvrWsgrqx5CTIbE9zNYYoboCbI42elHmgUUaFGCWB2aL9l/zGjYAggcE7h1lNVxyIQ
         GHBRSms75M7DPwtpSu11Aw9944ozY1e/GYQx7oTxas3o9ekcBLsNTU6SEC/wjowm5Uaq
         ijIMgGutB1+TZQcAzH7v7Ohm0Wuxw7uu2Lmq88zFXWvvqUX8bWVsrJ9t8KscbR+Vhdha
         lLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994529; x=1792599329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oOiNmlK64EmT5cyjjFMprTng+kmDl29DI+/5EipVSw=;
        b=ilHzsZXMfqIXOCCrNrQFwMx8Pkf1Y4ZPzYVx9Fbghj4WwfgDT5vv+2lnu6W9uALYSl
         WQwYf2f6EMdT2KClGaIjf/WTzlon38w02YD3kmLvMjk3rE+l6JNuCoKw32J0UiOSFriP
         8zVPhU7y3YNW+37Of35OaWiq+9UHH3h7uTbBg+xvyCHno/tV69xEwK9nJjOQCIKBay/e
         93SGBmf4LdHwMovJvYwCcAIqJcXKIw7BKVTw2jHWb8R6fN6r9oKO8Ug0JXLMQPQwYj67
         bHOj+ERSINzUjNOurgALZP73RNjvUztR8uwf9tV+ZOq57P8DOqrUsZtlRvs48BkuJKsC
         fytQ==
X-Forwarded-Encrypted: i=1; AKwUvByLBX6b0MR1+N6njv8428UEYGiANxkJl9N9ydhcFEdKDfWrn6O9pjRamN7C4yDDSwKrpDZssB0iPdACCKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUuLAuZp+RBEic2vOsBk6q7d2mmVR2EgHu99COHodAjrLoKsQA
	RgCcleF89W2Pa40nr79FTb+WtFSd3lnFTTZFn1NhNrnhqyDdY/qqKbyD2h0KVPepkCmXbWnGb/2
	9oOk8hjkjlY3jLa14SGLDMdb4u0axao+x2YMRwwnMi24Qb+yWVUeIUzFy4uhg46GezeeogPCpwT
	Y=
X-Gm-Gg: AYBFou1KKIGNtECLNw1Kmnrw5cfT107UaEK+Gk3L1de5s4FkmdtSuyghsJ+wQYQVNpv
	BNxs7W9uX5y/l0cJ0lcSfwRxhb7EKpbUonc52rxgmaaiNFUXZl0dROwxW4jfBO5/s9/ldIdGlie
	q4usC7gNgutaXdcxoorwlwh97EZuU5JTE9CnFSBUDq+UtwPAZt+pufNZX0EVpC9x/5fgN9+CJkL
	L+5+3M7CtNEO6cCGeSgCXB4oUM3JZY79bSyGzYymX2AhzZQJyisBR3u+613NuVI9DPApj0NDsJ7
	LeaUej4trL/FJjcDRntxZjMJG7YuMkFs1FUjoOuGkzUZv2D+nnTL5nXd6vMEYVflsnCmfC4Muor
	sXEHbotznTujlbPDhuEnxMg==
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr3499674e0c.0.1791994529342;
        Wed, 14 Oct 2026 09:15:29 -0700 (PDT)
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr3499620e0c.0.1791994528218;
        Wed, 14 Oct 2026 09:15:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed95478efsm2437166b.27.2026.10.14.09.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:15:26 -0700 (PDT)
Message-ID: <2df6ab05-4407-4cd1-855e-ebe07df2d53a@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:15:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
 <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
 <as8NHH4j2SBkDYnC@hu-varada-blr.qualcomm.com>
 <35bebc3a-8172-4c55-94a5-18c4047f7090@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <35bebc3a-8172-4c55-94a5-18c4047f7090@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfXzPdRc/vfTEfp
 3eeMdi3QrYNQn7dBWjSQvp+moeV13z6VPhBxNV0kiUaEY7W62R/K+51w2N2UzJosLAG12xhjatd
 0XOpczocNz2D7dAnhHwe8M5eDTE6jug=
X-Proofpoint-ORIG-GUID: OPabZ2vCKfokzFCXs0-gFR9cEqKEj2uJ
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acfaaa2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hqTCWq6c7NOpW_cclCUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX7RoiG1loeQ/Z
 Fb08K1c22Ojs38iNWhcDx8bE39g6bd5iR+7WhzzdQCxjiPeITRjZQyLQLuuxGDqcgyfW6iRbP8I
 NiuqLYAsUxTVNV3jbHe0sDYtLmYfXY67VftthH+iQ+/lQF45eJqDcLBmPE4tVnnhEdcOd3AlmLi
 cWr1+sOWDtmyLm5S+peznRAsKhoOxi/rmXUdC5vdWqYJJG5o9T3KWoHsGg7X24sTNeI2vftETks
 HYToqCumU3Vi3OMI8n1TkK3uiBaGcKShoFbRDwdkkunPrPXWDfVZXRzep3vqfwC20Dvl3NGok3e
 JBjcRPxD5h77VQ6rP+QaeUJr31pBqL21sb5UYwW74dd6nNg4Rp9FAs1/7nZtKFjMTXFEkKG3kpU
 rbn6TtDrmY985LnmzAy4Wc5KtQKiE/0qHHMAeEtep84OOC8HcLa3IUK2LdbEQxI5PqKsIJpybC9
 CT0BaYrOplwPRWu+iFQ==
X-Proofpoint-GUID: OPabZ2vCKfokzFCXs0-gFR9cEqKEj2uJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140064

On 10/14/26 6:10 PM, Kathiravan Thirumoorthy wrote:
> 
> On 10/14/2026 10:33 AM, Varadarajan Narayanan wrote:
>> On Tue, Oct 13, 2026 at 04:43:36PM +0200, Konrad Dybcio wrote:
>>> On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
>>>> Describe the SDHCI ICE register region and clock, and enable CQE support
>>>> for the IPQ5210 SDHCI controller.
>>>>
>>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>>> ---

[...]

>> Can you please suggest an example, will follow that.
> 
> Kodiak [1], Monaco [2] has a separate ICE node. For the frequency scaling / OPP support, series is still under review [3].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/kodiak.dtsi#n1085
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/monaco.dtsi#n4883
> 
> [3] https://lore.kernel.org/linux-arm-msm/as9ksJKk55wYuoOS@hu-arakshit-hyd.qualcomm.com/T/#mf3a36cd811e7933bfa184366aa77b3f335c5a3ad
> 
> Konrad, I hope you are referring the same.

Yes

Konrad
