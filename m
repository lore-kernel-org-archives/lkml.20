Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C0932B112
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041403; cv=none; b=Md1tYHaG4S6aCNwrf1f26FKoLUEmtXiFF6z7b9NCoXi2ic835KWGIzczxcCXyDlqHSSE2k0DfONeK3sYoI0Fvh2oyB3UjB3Jq3UVavHB2bwXmll9Hewz8dq41JgDSJQrmi3bA77+DmYcUN82VQjFElA3LuT/XhvwRO7AZ6ghzQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041403; c=relaxed/simple;
	bh=9BIFfk5ZwDBAqd+AjKgGI4avZgAORNx3/Nps7Yk9gdA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NKegLE92O3tAs1I/gpiErTblXPJXjlzohb/zq2x9GTRhUNcqZb26cVCZyPdBPz0wdv/+4vH1zSpAzpvSSbQL+bj/Pp9Y5Mun6EYxC3n5hFCr7nY/05SjfrhDbFdeth0FA9jyiy8zVfGmy21bnzIT/ibcCTDhg8UWFqni0KAuBe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBe5Is8n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCBK58Yu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBe5Is8n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCBK58Yu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wfU21889621
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6m1IYzhzMlMI05KKCN6YlAZiCuqfM4U+iDqcMyD0ylk=; b=SBe5Is8nnDtb9/3P
	qjMCC1P/0I1O6BMfBHnBfVc6BiYir/a3R2GIptcdwbVEkK8YXkmK6ZXFzuMNOB+U
	Vo6oSHWFTvbXRE0iFTjoeP/hTCiJFwkibaHHoUCpfc3XhE3EDuFtaNup4b2vRjx8
	GHl46ByOipJVv3TPH67FNdJzGrP7OiAASihjJAWg53Ds1S+5LC5kyhfOqc30+/ca
	SoDp58MvMZPl8JhKZmIlOzLpKJVL/QD7XWiIViBnJjuJXmAdBRHerde1flyLOq2o
	VqFU0HO1CGzx8TfcxlcZkE2w78oLnF4cBKlTtcG1YNsCnm59pcx8SVMXfULHQCiL
	eE+SJA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda085y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:16:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso7194495eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792041400; x=1792646200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6m1IYzhzMlMI05KKCN6YlAZiCuqfM4U+iDqcMyD0ylk=;
        b=OCBK58Yu9CMq3roUo5A28Z8D/LdnRbiRhwDHE5QhCQ4cwr06GMtd7gTdsPzB3i7eyp
         8cM34OzhP+VfiiiEJ0SQimXvbpFEYLTikyklUSoMTfc30Q9VCDsHNxcHRWTc+20mdcoA
         IlaYodLN7i4Nh1GpY+mTVjLcH8MSJwiV77Sne07B7i8W2PabaDcL2TaId/gNP4SoRB5T
         bcpXpDxotD+Mzb3/Hqh6fhDyuOJQcARxUOcb1WHBI17M9H/zfGqnLX8+0EYUGJaKY4Ru
         2GlVj4PqOFG2TJb7+ZPbG18wGnRWzE9UkKl50cFr61u8IQTGQ1Fkhx/pdCUzLfZ8bpTw
         a+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041400; x=1792646200;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m1IYzhzMlMI05KKCN6YlAZiCuqfM4U+iDqcMyD0ylk=;
        b=K+RUi0GArGF7pKqVdIKRVn3Ur+bUoqQW2e5ogxPeyLerPXLa5i42M/INO8xd3B7iZ+
         AwjECGfmltZvHXS8o2i06xIMwNUXwnWKNCMRDu/QOE2XAJtb9RhDaQW5a+7g/U4dOq0l
         q1AyTzCG5FvNHSCV4xkHxGx4Q4LyYnhJCTI99qw2HUlAn/Z6/bh4DCxKd4FwJDvOHYaQ
         U6V2TmxcTax3aWYQ6jCcJ1nJX3LDDMKBkIqeGbcLM2kZpS+KyZgMlW96/BrPDXNrvd2x
         PYBMaSMxKd2lhUoanEIAxT2CfWqANrwjxi2a2/ebFwSnyMQiZ6nM0nA0JojlIRWcqEkf
         QPXw==
X-Forwarded-Encrypted: i=1; AKwUvBy/tt4YeGAkcjxUYhZOTVUTYj41KaIxzYv3QNAWpFLRaOalDjPOwKFP+8wVq6l2b+XtHSuYGCtjQCusgo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQMy6eWiHbmZhc7Xk5zJIf3c6rIOm/L2C9vJYH8l5a1d3O7e1M
	kvvJ4KsfMMKGbkC+6xmGugsahDRwlEai42VqszXjOk1ryFz8wfAc10Y/RXb3DxzZFVzsXNSMX9z
	rX36Pv4fmhrwpp4k4tBPfJVmJvAiB+QUKEWFhszAUYh1Q879pu1+n1dc+C6SaxiSFMuo=
X-Gm-Gg: AYBFou37x8mQR3A1A9cXsefaG+7EAIB7BoAkSf15oq+0KoJCqd0svlzqNwj7+wepZ2R
	Ci/shvM8dKQNDrdwvVz0MEf903F3eb2y0XQudAHj0Ek0UQb0VHowGZp+e9L3k8yRDfEP5DEiUZk
	B6U6Zi9/i3PAxvuWqRe51ruXFNAScM0L9zs59xPiAEMbN9Y5zeJF2LP30AhMnN2rbDCgS24icSy
	ir9fpX4apgAQOGfYw/Zc/36iy90I6Hq4ACZAfEZ06tnt8Ez/Kd/TzkQCAe0CssYpdZQKQyAGozx
	JyTyVKvc1T2V7nxbHfEmXoK7m+hLQaRXz0gcexv8O8+ia7qBJR/+YYHfL3W/Ue22C38ofpsEu8l
	2Hk8YragLrgJNPNRXWKpUIlR3asU=
X-Received: by 2002:a05:701b:2086:20b0:149:1b5b:1f25 with SMTP id a92af1059eb24-16a5adfc081mr25190300c88.15.1792041399989;
        Wed, 14 Oct 2026 22:16:39 -0700 (PDT)
X-Received: by 2002:a05:701b:2086:20b0:149:1b5b:1f25 with SMTP id a92af1059eb24-16a5adfc081mr25190265c88.15.1792041399409;
        Wed, 14 Oct 2026 22:16:39 -0700 (PDT)
Received: from [10.204.66.72] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm66982336c88.9.2026.10.14.22.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:16:39 -0700 (PDT)
Message-ID: <91d2fff7-2cf9-46f4-8143-371ec9d35c93@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:46:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/8] media: qcom: camss: Add Hawi compatible camss
 driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-6-fc93222da89c@oss.qualcomm.com>
 <4fe3f636-2352-4f3d-9634-637622b2cd40@linaro.org>
Content-Language: en-US
In-Reply-To: <4fe3f636-2352-4f3d-9634-637622b2cd40@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfX1rKEWuUsVrlP
 qO2iZnAhQoaJUjCpTvBCqHB1ph8A6AJAqcINvuQU0sTi9nmR/Lw6VhBThTO6bLlcOWo+dUHExjM
 kbGP0CCzGxWJpyIzDojRdgL69fppbx0=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad061b9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=A9cSDzJAzJsspl3E_m4A:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: eTtQBD5e9zVAC2xvxIWnfSxk_mj7xOk_
X-Proofpoint-ORIG-GUID: eTtQBD5e9zVAC2xvxIWnfSxk_mj7xOk_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfX/nOSa5x9gub6
 m+mMbaCluzIFVHnzCdZHVq+M6PssRdPUuKdqZ8HZ5RZXvMYroKFTyosk9sjHte7mIQ2jcOudj55
 uf3fqFsMxBdZwUz29K+KrfWwhCGQAxEP1BBzqex39tu8joPoP9TVHb+7EwILW4hAl2iS5IXrtLO
 a5O4veS4HvCl8kzENEoaeIbCaRW960xNVB+BEHoeiFMAuq9aJNFYUW7IniO3++pOBygP8uFPxLi
 E00wbqoLHLTL5fGFpDYZGDO7tgwilmBUst6E2uJudW8oypjHmt+K8LAxYMeBwteyZUtBrNBV4iK
 Cc+5T1LJM+gCvsm91Bk3eUuXEGM3b1geF50kDm7psrLCpAEtsy3n7GnPmHImaxuxYpM4TwBL5Dr
 TIWu132oyQiiQW5pcf3em+vzofMl5adNmIOPjbThsJZZp5mx0CfTKZBSu1nKVZk+GRqQ/3Xpcrs
 HamBVVuR60fiuUd8agg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150020



On 14-10-2026 15:13, Bryan O'Donoghue wrote:
>> +};
> 
> Wait a second - no IFE or CSID in this table, with both added in follow-on patches.
> 
> Lets just collapse the last three patches into one. I mean this can't bisect in a meaningful way as three distinct patches really.
Thanks for the review.

The split was intended to keep the changes easier to review independently.

However, I agree that this cannot be bisected meaningfully as three separate patches.
I will merge the last three patches into one.
-- 
Regards,
Nihal Kumar Gupta

