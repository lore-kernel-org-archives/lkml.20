Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B8128FFF6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722756; cv=none; b=skjWwh4+RaBaeWZI/6qvGi9+3nNHTus1PNqq0o5cyvN6WypoZXivsqGVERX7w22jwt0yQnY+bcxf6acd3ClAVdJuCrgJH1ryGkegF2yGaj4C9Jd8Jt83we7Oi2qW0LVO6NtvdyN3sKt6WZ5e0WLqLz03i8mWaN98Nis9gHXQkXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722756; c=relaxed/simple;
	bh=dqNLkYWW3gpedw8yQO06Nn2TvNDxzw6IotmjZsfjq4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZKJMOeAFkAANsTya8tCpXcVQUfjxOeE0x8t1ZlPFK0gowGUpy+b0169j3f3cB/WxnUyKmsjEpHzQMYRtebCJ/MnBn60IAjymFsObcvuXd8T57jQFegWmu0CiixbPBIyiSJZO6UXMZY2zJVLBScrDf75J1bsECrn9hRg1bvmscM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UCVq0oo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXZm6+iK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCVq0oo8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXZm6+iK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xu6X3834606
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=; b=UCVq0oo8hh3zpuNN
	YkqNqbz3333d1T73kirv80Sdf81VJxW51udbIcADdlqdimOPwFrBroXRMNZmCa76
	kAeBZfibEQL0ApMCmDR5Yli8Eb+1FTGBUYooe/kIfRqwteQSs/Q9Kkw/lOQPmJcC
	P3C8IMJkP61fVh4FHZ2v/Dm7Wj+kidskCGgUH9uRCWb5JOlb7RmHS3xb+JwgGWeI
	Gp1UtYJuSXW/GoRn0ybRNCpk0pyvklL31mHpqb48WnvgoievVWUZysFa0eqKW9nD
	JzzYetzT3VYrkLgMM2DHhuCBz2nVo11zppWkJAlEXh3mCCNygH+p1RyoFvOwI4V3
	gMIuqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2brwen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:12:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so102166385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789722753; x=1790327553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=;
        b=CXZm6+iKFUl+TDKQmvTF03XLC+tqEHyFbdUs8DsQtC8MSs7+xL5OZ/K9G/heFHiUWX
         oQXaCG9nNVt2rIoYlOW0tkGZTbNFomAszQiYfm+Tj9/+JB56xfKb2A9nc8EMD647booF
         68RU8CIZ2TtaSQ03T0/UXZKy7PGgiTcJYOJq3lWWuspLlpIGvSRnnte6CdJXPREGfWqp
         4npQ4h4G+tvMVppnC9mk7wuRC0N9BG9Vmil1rsPIUDntTLAjrm8cJjsCosAGwQx3Mury
         +5sxbPZuCT3ttuxXNgqrmIpjZFQ0hpw1lR59cv25tMCTPo1xVkTYWePP5At16cAvBGgc
         ZTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722753; x=1790327553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=;
        b=SjfbIv6D0RInzBksWTLM5ssyTkZrFqa//Ccht6Pot8RppOXcWpoLXwdkDH4xqXNcmj
         xSkjvouIfh93IJ3g4KoaE5huQA17TNr4EVjV+ZEz6dS4ulxLeutIeFX0yz1aRIGILWkC
         yGfcQL5f4dBvk0qBMfo7f8QGxxr7kD/7Ia3exgn0+Q8DUXwFn7PM0ktu4uRN1/CDxgTH
         ghlpkfHXEozaFfY8UGQAm8gA5OFGDfaL4RItKq8bZCyreRJlhKuwBcTZnVcFUOczgd6D
         68CKPWZ3fYWkq8MKTJu/CcT7MRumJv2RGBry85yQpHYs2GqpTLLN5V9cM/5twSYEMoJ5
         ZlZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKnxms8wQPw1Y37azEuWbJjrFmVdQ3qYtMVRnSvtg9S068FahJ5st2LG1w/tGudAXTwNhM7rDxvYpY9SI=@vger.kernel.org
X-Gm-Message-State: AFuF++mD8tz+1f2FZ7CEfMjm2iPUQ0duA5v+Sdi3TBaAzEGI5mbW1D/J
	dgq7WYf7MARfTIsjYMVq89gjdcW9SHt73jFyAR6K4n9u219hfa5MoQDfoIFA8G1DliM+AyG1f8c
	xF5NRHmp7tvOftr77Ov/5XSwLYVQ69FZLYMGqK3BJtHoCANwHPWnFbraBAMCPx0YW7L4=
X-Gm-Gg: AYBFou1QUbZsC3LPYMwzGRjxtm2UEteaL0LiYQ1iF7x2WmrJRXYR6QanHuAaaX8J3zE
	TsborHe3rVk+9WI9/mbRG90FUGAjk4IKJeIRjY3RYzjBZyiWP2ekfhLllTWJPON9V2m1rmePZpG
	SOlUoOTmdTm98MQzckwgaFyokq9Cq+2e3xce5rW1fdpnrVRjd7Y0pKnoBdHByokMPBfcsjbKC9A
	EqAygBD7gT8Me1xcQKrNK4i+ldErOogwZOI7Skw/djmvtbxW89tpw6MFHiTJG4p6uQSbguQfU0S
	cNp0PkRNw0j/sK/UiSW0bANTP/VBRDJjjnsn/qklfP4EHPnW0kSdwTk5WFrSR0YHcCumgEqEn6l
	H5K9mxCSml0avARiptOXg6pB9In6C7bFIdVDiO08Ha420u9PnkN7UwLMl9ukIFYw=
X-Received: by 2002:a05:620a:6010:b0:939:f513:cc3b with SMTP id af79cd13be357-93bdca3b239mr216695185a.42.1789722752708;
        Fri, 18 Sep 2026 02:12:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6010:b0:939:f513:cc3b with SMTP id af79cd13be357-93bdca3b239mr216692185a.42.1789722752340;
        Fri, 18 Sep 2026 02:12:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm31018885e9.2.2026.09.18.02.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:12:31 -0700 (PDT)
Message-ID: <45768828-d0a7-40c1-8eec-3a1fb2d66a71@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:12:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Beniamino Galvani <b.galvani@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        mfd@lists.linux.dev
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEyNiBTYWx0ZWRfX5sUjXJUfdIaJ
 SkKO9/HkrKaI/ED89pPd9KGT9Cjr2jhgHWNAe2r/KnMb7NIyXHfUIBarLuKJuqDbo9EoYblW8RE
 F+08OS3YiGYqNALT/ntzKQSgG02QgHWYr7zqmgO0Ym7QYncN1TTjhTn+y4tHZUDHN7qnwFgBMqc
 RcKHP/RAr8A+R4N6PEjY/R//HarMgfXZ0uO/rXws+Mk1H5Cxn+l/mYfgLWOS3Ar53l1IGE/cwH9
 SF5CSga23lr1dlgRHHOTGIW1YZaI+TDF6G233jIfJwlp7Q9mw1z+oT3rmkEi4A8D1C/OnG6W/UB
 UuM7Xnd9CGf9+E62yESVX8Lsx1Dbq74hy4n6S6DFJ3gWHMvJK2vGysbjbbQIlI46b0tXOfk77EW
 ohTDirV+ylstpaRQ2wVeKgNPCFaNQoo/1U0V5WKJvQxTG/B3rZrtt2q5lo66jfTpGq+hOSiht/S
 Nlo2Lz03ekXNSVouNXA==
X-Proofpoint-GUID: -8EoviRjhgoprdPciHLLoU2iHWCDMJ8i
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad0081 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=YaFGZCiNkOP6CsGDcAoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEyNiBTYWx0ZWRfX+FFwL8qk0wGu
 kDrCdwT340YsDuKt6r11XFH0k95aqtLVXj4GS16YflVU+CeRc02OOSDufjxfMuraFIWV60lcP6T
 P2cvYq2rtbLM37+AbmlidIoW5HhdqRY=
X-Proofpoint-ORIG-GUID: -8EoviRjhgoprdPciHLLoU2iHWCDMJ8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180126

On 9/17/26 09:59, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Introduce platform name, control register and duty-cycle
> levels per variant.
> VIM4 uses a different register and level set (0-100)
>   declared as a list (0, 30, 40, 55, 75, 100) compared
>   to previous boards (0-3).
> 
> MAX_LEVEL is kept and bumped from 3 to 5 to make
> the speed change more gradual with the newer MCUs.
> 
> The cooling device's state is stored as an index into levels[],
> and khadas_mcu_fan_set_level() writes levels[state] to fan_reg,
> rather than writing the raw state value as before.
> 
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> The regulator is released via a devm_add_action_or_reset()
> callback.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
