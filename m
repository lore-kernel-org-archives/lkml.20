Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE997477E57
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779069; cv=none; b=bNXKZz5YlxCW2Dz6xRISFWXVV2fi/zYoL1ZivbpXraln1UGdjWlV9ZVHe+ufzOyw/BGrPdnoq1R/cq4E7vxi193EgR9Yo8c5mFsT0MBVAtEB3ver23YzkSHysoMVJKoinAEAkRJQZCZfmLLJ30g3wGqzb/xIf4EZtBMX41avpkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779069; c=relaxed/simple;
	bh=38bxwPm2GMzpyUAZBJqwwwnfLv7xHTw3haohKL/4joE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7FBF18HacKGAEehn1Z7NGTkEGwfcFH4AQyyxnG/bNTTkTgyLpsLf8H5EMlaucYaMkb2bNydDyn3T7LScWLC/1TBiXqyH2peiL9fvKzGkQaLBkE6GbF601jiNnSkjxA5ouByDfRnjOaYJ3GGObcWwduIkcaSIrWXgZhq1EVwu0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3fbSxfo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2wz/6Fn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3fbSxfo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2wz/6Fn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An3Vc3230477
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 11:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38bxwPm2GMzpyUAZBJqwwwnfLv7xHTw3haohKL/4joE=; b=K3fbSxfohhJlMHpo
	k8uur8kfctYRGgwA02lzfNY+DAmcF8npQlO6uHHixLToICkzhA6F0t1qgMrb9BPW
	hAGm2Lq/lzwV0kre+/gTsj0PIx+LXosFAllpr8ddJ9CeN9VZt20hGeiVjGqTwGYj
	02voqwAg7M9R2NY/j/DLkRQW+kU9tIdM53I7nNaJ+rwmy8DiujBhuS0ilhIqnFlA
	lVFnC+CC4RG6CZLP6G/n18ROv++80pxZUTTJXFJnuG3HlBYHG27NP0QS5U3MuPPB
	//odSVU9DSva0EirkQKHD9mbFg2GcR29Fnhy9SCgz5YAztUk0RcMSy55YZcxbVPe
	Dj+1sg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxktct2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:04:26 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b9376ed5so4126489eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779066; x=1789383866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38bxwPm2GMzpyUAZBJqwwwnfLv7xHTw3haohKL/4joE=;
        b=i2wz/6FneVDmjMwv51VcR6qnX+i8agf45thUP7MGGV+MwP1Kk/48CrGcAdPcuN68GR
         RD191x8Uj6yviib6RWBokuz6H8v7A8ySkyRKZkHWJEBfCae8t66ItCd3fCUtMXH1SAdN
         eZJqCzGN8I9mN2Ev+LFcgQfNuXvfzKcOy+QHMnsXK0hBUjPignAQIU+8DuCLCY0vONRO
         UOelWkrd5Ew3zu4jeqeoXvihO3dWRyfXTzCFZ15XFKVtGEzCfef0kzVvxoIaEPBYNGmU
         wGCGl+03msfQEM669SU65KbYoC94xbYQKKT+DECjLPzCzHimouC+6iYUbKPx3OW17h8w
         xqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779066; x=1789383866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38bxwPm2GMzpyUAZBJqwwwnfLv7xHTw3haohKL/4joE=;
        b=O70BCpMtO7cSVJe/LCnYfy9XmKD5ecJL51UP70IKbs/unqqxps2/kyRsCx/7MCuLU4
         yafEBCdz2vBRE8tJNapKXJiZIEY1xnc/xsQC7OTCFlAMhNOiKOdkOwx2HToDXqdfgU2Z
         GtHI34bxlclPYzPt8fJ35ePFLrI6IrmUEHyMubKu8IJZ65s8oJbfQBHqr9VqoSBE68nz
         My+WRRwgUw7WcHwnfAydngro4TOfnMkGEfmIddfQAlLa17hXMWZR8hA3tL2Gs1pR4SCp
         1MbK/6zBY9MwqXY20TeKvufIjwOqeyKp++cHqVxhZQuIz+dWkwrXL7TGsbRhF51lYs29
         AqsQ==
X-Forwarded-Encrypted: i=1; AKwUvByMbF2LIyFyMakABYMCTPRGwkwOAjQxuAfR/VANRD8qJ7hv5C7QXsjoYBk2SWqYD0m71ESkdED2GGv2rjc=@vger.kernel.org
X-Gm-Message-State: AFuF++l1x8ouD71kBtuI2EwyHSerkqrvVxBn27m8g9O9hEQfI/L/tQsb
	/XHJO8fcyh+ZN9V2XkhSzKxZWh09rJSIrXVQNCACeqfEh3eCgcQc6BUtpsRcktF9Z/9qgfJRxdl
	8YHlAfvoycdau9lQNFNEHNEh32h3JRow4FOywUqdyJ8ynwUD9D4cjDbUyFkICZvP51xY=
X-Gm-Gg: AYBFou0hbuv8EDrATtItEohLYLGYy82fjm5mLE8ukDlOIFY6bp2akJqpsmTS711+eTH
	Yrse0pi299nwS+7TDPF7DHXRJPYo6ziPstIdOrl1/W4p+lIN8vEyeRQ9LibqrYeGfUCWUtA8XFp
	JN+JMVMv3UjBOxAi+XMEVacPazdHheSQ6YdVfU78MPfsyt+il45+uv8LDUrFbg+6pSQ58lguLy8
	1IQVg2p5sNgOu7bDiENWtv3r7XLTSfJ8VQTK147AUCOnZTpK46h/LIzFQJjjH6pRHlrYnHLA0WC
	lYyatGKTiUHfOPUHlbZaCTAzI1larT2cOSLzJ4s3kb5dUJxsxFfJ0DKUF5SARNakioKGTghHxLO
	MPKMFF5c7C656p+E5ojSxsC3eU3wC
X-Received: by 2002:a05:6820:2017:b0:6b7:83d6:2929 with SMTP id 006d021491bc7-6b783d62f60mr11389783eaf.44.1788779066094;
        Mon, 07 Sep 2026 04:04:26 -0700 (PDT)
X-Received: by 2002:a05:6820:2017:b0:6b7:83d6:2929 with SMTP id 006d021491bc7-6b783d62f60mr11389746eaf.44.1788779065713;
        Mon, 07 Sep 2026 04:04:25 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm43139397eec.15.2026.09.07.04.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:04:25 -0700 (PDT)
Message-ID: <dcb2f3a1-5fd5-4ffe-974f-4b3801ae3bbd@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:34:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
 <97360c1c-f573-48c5-9917-4bbc34ad394d@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <97360c1c-f573-48c5-9917-4bbc34ad394d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMSBTYWx0ZWRfX4tpfyGQcXhv4
 CP1YoPAfs7KI02a0hL33OeDNkydI4OHBm/5VrwpRTqER8pPJ/1Qw9HPhWsxACPYCut56OiuWvNK
 uNx+2Thp6mBSPo50w9gIHNfqA17GEFNYi9+kanMZMiPDBoC/gkt/J8xFRLX9OSYoRlXBV83DheR
 UVCnHB7M6hYX/SeHZZqUMU64JxAaxk88dWEfM9VKXMe2UQBDJx0HA1wquTyWnz9kOVsscBK7Se0
 Zo7hNz5wtpICGxjVHPvG9vDkd3ZWP3RFF7ACPZ1dXewM6m0XRnOaa+XF8sT6sTkmhKbdA4w9b91
 dpbIcMehN1X8HkWbwm6Pjcmt4a3pWvowrHLC5X/XwpWEFRj8MqTp6JEJlmhOiavYd02JE5fWwL4
 l9JM80eojjY+imf9v3L6tPTLH0BInfHK1E+RjNwjzy9egtasJV4t0zHH71XeEa1EXWlxCdvZRkc
 87vPWO0xsd7II8kQuHQ==
X-Proofpoint-GUID: bN1XjwikpR_oJ2p4OeLkbnMQySb79uMi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMSBTYWx0ZWRfX5yWSPQ/EXHaW
 K5jSJaktZ9gKMwJ1I39VinC6P01lEQoC5c5iNXOHzOLwlrA9ljfjANqI0wO4RisMLH7rCgj8BG1
 +jSD0Vo5ixTQqEzUx9wpGA8CgXLkf4I=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e9a3a cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Tf9iwjJDQdcXpSb9m0EA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bN1XjwikpR_oJ2p4OeLkbnMQySb79uMi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070121



On 07-09-2026 16:26, Pankaj Patil wrote:
>> 993271c42fa063a82cb0f6edd41e87b30bc8e109..7ac944974849b99abd982b1544ef39fc32e1f21b 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> There is no such file as qcom,x1e80100-csi2-phy.yaml,
> Same was pointed out earlier on another patch,
> https://lore.kernel.org/all/20260722-literate-nondescript-seagull-cbdfaa@quoll/

This patch depends on the CSI2 PHY binding series noted in the cover
letter [1]. The prerequisite is also tracked in the b4 metadata.
The file lands with that series before this one is applied.

[1] https://lore.kernel.org/all/20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org

---
Regards,
Nihal Kumar Gupta
