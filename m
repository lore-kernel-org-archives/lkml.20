Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5FA43801B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138477; cv=none; b=Mf1DLdDu2S11utynCbbrnU2q+1/X/k2qYFWQEyxjVwoB0t4D9tPEDHrYGeMmqFbl/rizl9jRB5syPzR6x8w4eL/UZp3bbZPSQL83sqFH3gRsbDbY/lwxJiXY16uGzdsXJHK7D0UE6ZxRgTAlSIjk8VVgW/RIZxEWd2+hcXN3erU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138477; c=relaxed/simple;
	bh=ewweEl0ILmlFEynfdw37i+tzRtA4GALlKRycg76XvTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/0uqaZMlWTxV8FZ+89puEN7CBEwVRe68ILkeO4uFCElKJtrA9OyBtMz5AOtsxKMLKYuK4bW8MMPB04xNx1Lo1E9OMMNJ57voVHmEbHiu/YnwxHYtWbX6TvId+5mCkPsN20MtKTi/cTaGWHbt2MiAWkXfVTg7xuft4jmrn/+7Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eX4LkD9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEx6you0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eX4LkD9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEx6you0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G89uu41675912
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=; b=eX4LkD9QphhegX3G
	fJSC8i9CtvbMoISkCJqJj4tLN83yck3czz7esLSkPR/JWEMMHZkGzJigNb4qDoqF
	uOx79DkjoiaCpRxgvkHYJfoN3sBekrGG+NF76SBzOnx9xrn1uVPW5qaxoJiLBFM9
	pRjhVIWxE0hCPaBIrrONitdxgY2G6TC1zYyKY2b2yuLl+rhUYuJaK3uabdmWn6ko
	U/TRGHysUeKbImfIiYzJjR0Db+wOTlAu75tiBLSJnx9mKhJb5Q1pUIPkWopvZiEQ
	wUskhBdZHFf2DNKOWElvGkYf96aDAF5+NXwODb5LY1Y2Un/J1cQBifjOC1L1WaXO
	NME7eQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yr0ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:14:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35a4d2e39acso7030008eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792138474; x=1792743274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=;
        b=kEx6you0GSNfuMzahDdi8RhnoNxyyWfxzq7yHyXVs2dSZrxbxrAzTCnimK/kmvx6sq
         btjNJrs+4hbPECdhzZrQYjbHMga/jwrocxsV4H462lrjikFmk6ZlkZO2QLmQbYFyqP30
         odXjRGEytl9YVfsHjfJxRVBf8Lh06X/BrgeisysELHNp/AO44rekuQItCD7wM5xvAW3m
         qR3kVvBP0dU+EHTdUldaZqh8ljiQnaA7yidDBlwNsLC2JeHmDYwQp6c8pcp3GMaVar1U
         qsRcoYCTEzynFdO+h9uRUbiz8oPjSHEx+2YZJlZDKvk7od9qjLL2I9jYV9BJ4XzscM8V
         fDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138474; x=1792743274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=;
        b=O5FPYrOlzTDijIqUcG7livjfVuRzF+DaTxi1qk0LD8mwAXcBUG7X9ybvZraGhCMJSr
         liOONUDV8V8Y37SxXA8JKo9B+vMMYxK8agpnnSAzBWx37jA9dykMH25//9CyjZLhPS7u
         8dACMhKMqoVuJPnOSGGJaeQp6+kokdlqBlianUI+etBGkEjrh8brm3E/PUN2y8zqTthc
         zMju3+Ih8E0lRURuw6vmsBzT/siQ8PN87B+Wt8kaVmuxV1yXACXw9UOn0i77FHEjPdYB
         iMmxg/eD686d415U0gLKl2bq9+Mziem6hBPV2SUjSyqxUxa8i67glL9iWEesyU5tASla
         pv8A==
X-Forwarded-Encrypted: i=1; AKwUvBxOUZqxm0IRqMfPEkqsMoVtO+9Acsa2XNkTJtlz7K8wlG5+RpsscQcgMa8CqE99I2Wgg+Hu7i93et0VleM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK23mhAoCiL6yMCfVZ2Y1ELYZD416qxp7cB6ab1fuN8SQVWpL8S
	krRUsVcqYzaMx/mIjkcSBIflG4VriZPk8Vvf76jXSeAhowQQ8HNoV+BkdO1tB8mSVdCOIeTzkin
	n95nDC4wf+A5Anx8t6GXpsUzocaezmtEeC4LFmbB5BIMHsuv4TysEK5qGrFmhq+gF2B4vss4u3b
	k=
X-Gm-Gg: AYBFou3FUcMmHomTv5lAbEIfNCmSzHGoP6TVsAKDptwLU74aJ+8VdxVlpiYoBHsJCTi
	rnioJPuenNH4HYHfFq8TFGl+ZUR/lhZ4zWEWT04Zq2h1G73d/UPt9s0l6SrNBFAkLYV894ouHvx
	eDsObnWacMG82iHvUVxowxHfl68Fb4AY0uGLOn+8CLSV+lAFRBpMYPrWo4bwX+ygpuqxyRQFW47
	yimaM6vLNE8t/ZE+oa9JTqidVzFE801PPIZUJDfKUdCQe6ozlKGSvd1+LsyYlfVzouWCoNPM4k3
	tXORKSCnvdywFSroqJfmVIL4xauNG++r5OCluXGPxByxWaA4Su5AazohjLKOuekxZ58q9zkALHS
	2rMjJyDqBP1Xn/jP+LwoP/kV8XoAGVh42K7Y=
X-Received: by 2002:a05:7300:6cac:b0:339:7b3b:236d with SMTP id 5a478bee46e88-3537dfc8fd8mr41404495eec.15.1792138474351;
        Fri, 16 Oct 2026 01:14:34 -0700 (PDT)
X-Received: by 2002:a05:7300:6cac:b0:339:7b3b:236d with SMTP id 5a478bee46e88-3537dfc8fd8mr41404461eec.15.1792138473880;
        Fri, 16 Oct 2026 01:14:33 -0700 (PDT)
Received: from [192.168.0.106] ([124.123.197.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0e5e6sm4528052eec.1.2026.10.16.01.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:14:33 -0700 (PDT)
Message-ID: <9a12fc9c-e766-45d3-a6f8-eb6ff3332434@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 13:44:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>
 <20261015-grumpy-salmon-of-holiness-b6e9f4@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261015-grumpy-salmon-of-holiness-b6e9f4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: krBCJ_YZDvS4KImVzeUPbJFgQBGl6mYt
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1dceb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Z7qWu28e8E/v29kk1A4VTw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qLKQgrqcCyXtwMQRFB0A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfXyqdJXeMpTaeL
 b3sER/A0R3dM/w/X0qqOFphUv1C5mJUFkAUTpSfGbtZFDipFwpVei9UBPA5XdrN388pA6n0USk6
 mAbhCGI1hlRQbZrV49NrrGl5bI1QHVk=
X-Proofpoint-GUID: krBCJ_YZDvS4KImVzeUPbJFgQBGl6mYt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfX4FGHFbcrkNLn
 tSUqf3nX+5C902tuJVDOiMhqDrqsIiA9u7d+jlcj7xRWcOhpI0w05evjpOFAKyTWBmdlOw3v56h
 j7GkQNnIjuAbGTlw49CADDw2+E0M2W42dhBW++NonS+chdTJF5u/jgZB4EgR3dvvNmOh8CBjztj
 xce/UZj9Wquau5YiNi2XBI9MLaudCh3WTgwMjpvq6lI8kZqiwHqvWIM10gFaFsnZeQximxWwVaG
 rSkNL9CeOmgl1GYjOsS1QZ03vdKK783I9/0x6/BZqidTOdEpkjnW4tj5UXf8motuhGyaoXaFn6f
 u79wNiy2CN4VqEGd7rXCK/7PbWSqCemImVX00AE4vDpyNodvqP0X6E2He5SlUTf9qRRsDToiAPV
 Si3iHZhhE8ZVUO/2OCMkrlMnS519MwbT4zk7HzKDDtQyej8WQbpqyNVZr/MBHdx/Cnr6xVLUZpj
 WosxC0lEKYKV3/OKkTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160032


On 10/15/2026 3:08 PM, Krzysztof Kozlowski wrote:
> Are you sure you are not using source clock names?

On Hawi this RX input is sourced from the LPR vote (LPASS_HW_LPR_VOTE)
instead of the MACRO vote used on sm8550:

     clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK ...>,
              <&q6prmcc*LPASS_HW_LPR_VOTE* ...>,
              <&q6prmcc LPASS_HW_DCODEC_VOTE ...>,
              <&lpass_vamacro>;
     clock-names = "mclk",*"lpr"*, "dcodec", "fsgen";

"lpr" is the same style of name as the existing "macro"/"dcodec" entries,
not a parent/source name. An sm8550 fallback can't be used here because it
pins input #2 to "macro", which no longer matches the LPR source on Hawi;
the other three inputs are unchanged, so RX gets its own clock-names.

Thanks,
Prasad

