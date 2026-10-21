Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598033;
	b=SUgPe6EZI2rOo30fS9P0+A2dcLli824H0j9GFCZWexJNwczez5hoMag9ul6ox0ZzN4Kp
	 7DLuoFCBDwD7/FD5TLP5iUjX+BJjWSHHtID9j2C+1A0HOyVoXOY/K59qYIvEEeUJ3Q/i1
	 pkuS97fz/AX8DNJdxYBIOGR/qEJgDqN5HlMGkujaiE06O0lWJmozp5ac+dnvn/Ov7Ogvn
	 waHtiQR3Z2NB20Jov7h/SuONWpDhHvN2GoOk/RbGFvzJKBHp0+xMlthgjnT6ZBuoRTTVE
	 6D0Z3JqEUGlKighxF3/tAeqjpn29bMw0ZNLATb+6tMdD3Ykuoyjrcfs+xXWPiJurKWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
	b=DrD1QgjG05jN2oowMZAOZo9cvfzXPkJhQ9C9XeYz/GgL2wVrW6NcS/99P13TlG35lUe+
	 96zjZN7L7/yNqRcJTZZzCodsZmXD8YWFN8LNJtYLP1eNqjcdDHL0pudtjaZyXlrEZRu/Y
	 id77GG1RwwX5KXMsIWVG3Uz76qOV04M2y/pwpqv9VccwWcZdLmnDHzlU9cQb6HCCtEc9n
	 IndLn+DPZWMqDJglqOjIocJtVagxQzSfZZTPvZdI6xH1ab928K3ypsC8aNZJQPnpg+NhM
	 XXh+3c3WXwnm6FCWdfuf9wfls7SyV/d8f3AW3FIV11h8zqI5rZ5xqA7xs2i//jPvwSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMgbQEQ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dCyHkpKr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C8B606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C8B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMgbQEQ7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dCyHkpKr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU4qN824718
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=; b=cMgbQEQ7VfS06ZuV
	BtEiyMgpVn/N5F8ms7jbbXwaqMgAMC3WP58dKYhowIdj3zPxCgf66HFt0ZE9dZmZ
	MxEQ13a5bmyK7eGoj/nn70Opst95clRXvvI2oUwD5bb9DJiP3MKZlji8MMDYwsLJ
	reApLjQF46W6eHReycSp0Zjq7kUbKP86SPTQZZIhV/iYkX1URRGEj2eBsZ/3oi92
	quwmglX5GoM87OuYqQ7rjVS1y0RAxtc9PuW3WLs2YlTkPywh9x529DXSQ/33w9wn
	irlIFGWzaLByOOZHZFSsiHZmfyqKm878uaaX1sgPwiT+MPnW4jEm2Do4MYWTmS7s
	TgS1Tg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v4tmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:53:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so1377390eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792598030; x=1793202830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
        b=dCyHkpKrzlecjH9q1vhjhUL/j4PoPuvOk6m/EK0otIiAUBpIYTt//wz8ZDstaNWR2A
         tlN6vu+hknNgqkMl/WFl+N/9iNxjIsbXGBfKENlDhpivdT5aVIwoA0IGFJC1vIxYkHVS
         ekcg38qAqbedb42vE5qOuzkJHFlqzaZ0bxGhi2X+T/daWrnRZKbs+2bUbl5+P/aiMD/b
         Y52Vo7wM50HB3nhxlgD3dSngWycP0pHN2cJDIw4HKs4Dz7WzicZMmKqaiOu3t+ReW4MB
         UhA4EP4EhbjZmIaVZHtoeUaBRHorw1uEYJMZFp116elXK81xGCa7H724v0LoQUCGG3wE
         8T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598030; x=1793202830;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
        b=C9lDCAxuyemEWn0oyngQDUvi9JHd6KuDAEU0aRc5wPfyJCCukzuJPAzLRfDqhzW+6z
         /ngMPAHUDj+uHuCpxT2wxu1k9/37L2T0wXk/LTY5jZUxyFVpmYXQMbGaV/V3XHRNNRPp
         ke+7GZMT6tEnVmr6rT0bsM7lAhEyqRJ/KwJQkrhOC2yInpuglPl7xF0Ol/xI11mMkYDV
         6co+8fispr2M2QlrNR5IklC3Qk43ACaafRE58uArdPzxkoxhujREWolanKcRbxQ0lVxC
         pvvPy8nymJhyyzwHpdgfQDFeI5C1ksiOwBVgCOT5cqppY1fKJjvQR6SMEhKwZHXGL4rL
         hAhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUAFf8tGZL9CvHPnL6osHKmvBEfkrUQ74MuTnWP8dLYILru9G45t5QDdKCDFdgnkBuLNE7MBp9AvDqaAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKFuTB/hAuEfOISvbs80T7Q8cd0hBAlehH9N8x0hrt7+ay/bbe
	RIxKlV1SWvPlUp8f2JBhMcMsqZE/62f4MOpjCgUgd3riyrAV1uc0ZeYP7POGCV+sR+jMxlOQcgA
	pD+/QfP83pw5yUK7VMhOTmouzunRjH7i1BFAP8p/o9gHimuzy3TB229tynqzGiWo3+qw=
X-Gm-Gg: AYBFou00eRPNTK0R/svGWsYCA8zi/zzxLI26haT60/AtMj9FEtwWZWBpkOwQmS+MlCg
	CUnmE7EuHRMZDKqYypJqs0pAfMdzdtnrE9XYiBUR9XhgMJL7xKURz1kSVRD8F+8yQOYQDfi7gHu
	o9ZrWLTas4N0Lt5gluCONT6SklsZcb6hqX+0k5VU7G41urV5vEU/rUqzxxyRMSfJENQjmzL9nOb
	QUYd4zvT/j0gExK8rzZx/ejJ2UtfS549/MTV/VFMzSuI2xFKX0EnDOXj61654mWiTXt+6yec56k
	+BWXzk7tGQl+RgZ1w3AUqtsaX6utAvQqpQiVIdjnMK4WDJ49j3FAf5IwF2oaUm7BHRiPxu+x5sm
	eRg7uvSqbUfWKHlruAa8+DzvdBxrtodo7fPe3Qjk+JHX3
X-Received: by 2002:a05:701b:230e:b0:176:a225:e364 with SMTP id a92af1059eb24-190a77580damr2971977c88.35.1792598029942;
        Wed, 21 Oct 2026 08:53:49 -0700 (PDT)
X-Received: by 2002:a05:701b:230e:b0:176:a225:e364 with SMTP id a92af1059eb24-190a77580damr2971949c88.35.1792598029355;
        Wed, 21 Oct 2026 08:53:49 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm11144550c88.5.2026.10.21.08.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:53:48 -0700 (PDT)
Message-ID: <b9924970-16f9-4c41-9b2a-a5d3b7958c95@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:23:41 +0530
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
Subject: Re: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL
 configuration if already enabled
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
 <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX13BLYi2XUkzY
 i3PRF7cP01ANEbczCWHgK8dDdNNRLSmhmV35wXX2V5v6RFUQCW29aAbUOGrsf/dSIpcF7HDghlb
 Aw4qQNuatrui5nvRZ1QFiYlrMlkPabc=
X-Proofpoint-ORIG-GUID: cDDd-XI7PjisfdTZs3-r6jHiRvnmsdT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX8DWiFGRsCy10
 zFfCNI0KwXz7aiZwV2akyJTDj7Vvs6Zh+T5A/r7SUPFjXy891ZJZolZZ1KY6Mkh+8Mzhz0VRpIE
 wbBQhRWs03HiTcQtKcBZZQ+mNmvp8YNS5G03c4bZH5zNP6uUsQHDA69dZ+Q+hue+PDtpI2p+Qjb
 JM0u9JWPF+6QSPrugmpD9ZZRkfzLNsr6dHP9slmRByg/j6xngODYDLEfesMrCQU0U9QzxxvitjL
 l7axn2bhw0t0xHullxeGQlzVw5QKlpm7qZOBDpflkHsouMxZu+mu0zDdTi1Pv8jSUlU1dYDtf81
 k78l5g4cRT4gxW8UUT7dKZZdDgSTWbkb0tCHy/onk4SGrb7kft5a5WgHMa8A73MByYPFsUo8ng4
 SrpkSTtO7R2SmUmcju37fZQCuNJPjSAiiXbT8y+UJpM49pTUU4axGz4V0/oZnz4wfgdxciPH+NM
 sBO7F7WFWsbro5rQqDA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8e00f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aSm82yqHt_v6FYJ1XLwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: cDDd-XI7PjisfdTZs3-r6jHiRvnmsdT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210063


On 10/16/2026 7:20 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
>> that provide the clocks for the A55 CPU cores and L3 interconnect. When
>> the APSS clock driver probes, it attempts to reconfigure the already
>> running PLLs. As part of the reconfiguration sequence, the PLL output is
>> disabled and the PLL is placed into standby before being re-enabled.
>> Since the CPUs are actively clocked from these PLLs, removing the clock
>> during this window causes the system to hang.
>>
>> Avoid reconfiguring PLLs that are already enabled and return early,
>> similar to clk_trion_pll_configure().
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 60173b076cc5..3641b2da92cd 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
>>   void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>   			     const struct alpha_pll_config *config)
>>   {
>> +	/* Check if PLL is already enabled */
>> +	if (trion_pll_is_enabled(pll, regmap))
>> +		return;
> Please add a debug print to match the other similar calls

Ack. I see in some places, debug prints are not available. Let me add 
that as a separate patch to make it consistent throughout the driver.

>
> with that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
