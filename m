Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420510;
	b=4MNLgxlbos1YmG3k3ix+/xj8Rzu0XzcqRV3Dm59YeKByUC4+cHRWpmSTwcdnAw7YxFkj
	 E9a9Unz28Su6f0IO6yOu1a624mtUxzV+644Gx6mCWK1cOuJw+MHYKluuqQvNXOofXZT+C
	 Aao7HusQ7PYFQBUVSGXYMt4zj8t5nVfd/GPK8Px8uTszU3w8ljzGk1PX0H0z76YKKj6mY
	 qiUwK41bwcVn3inYUyi/6ZsVYd/12vmoqJhgsBzKhuDaNh0aot7MW7Gkmfe/CLg2p+B7X
	 jjaA434yHB49thel3Vq9WkApN4s6IKqXA783US2ERpNW9C1c3J8WMKBfBx9cvRG8zqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mek+GhpJgbAlj6PFKAaMZa1L4pkrsPGjFMnbflusKoU=;
	b=xZIqOP/S06hCfQ7D8lvE5+e1Y8+ajESObXRhwmadhZ5o4NOhmnjmz8RqqWIr9yo7UgQJ
	 yL3aZSGKAh4PvZfr/oiJUC9N6tnDRITaG3OLY6/2mbgubKL1eMspEyI8+6jxgCMivajbF
	 68MyjJpywpf6PqgtdmNgWogNhIkDjVFeiMLf/V1ZBzDk2lxs2zcPEQLp2LYbv8ZCI6a2y
	 KrQZ/T7lXsAYt3DIJzhBg4Is3eKJV+oGkoKUNZN6DMj42iLp3vpfnmRPhOedtn/Fkifup
	 Aml0sa8N8uG/Vg1twMLdJlaMk2rJsaq/er3R2wOpUxItGXd/Rn/cF+MvfZzGN6shhMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HkRp8tNl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=USZQXkZt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21160606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21160606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HkRp8tNl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=USZQXkZt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtLcv1953110
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mek+GhpJgbAlj6PFKAaMZa1L
	4pkrsPGjFMnbflusKoU=; b=HkRp8tNlH/IHx4K+SnRTdTHTNZmewDVb125mi4ug
	0PNYhPRbnIzlTF9dttHZ2bv7GvVrhlYbAU6zCArXK71VDab/lX8OkmFNzgq10Hs2
	TqRgCFQnVPisJDEHHu1wLnwuDBZIXnfB3zRlmeFTKOkb/y0l/AVKVoOBA1bNDOl/
	AGns92zlCbYMecR8cQpSHf9FXLmGLBOS+D1bJoS2rkeRN6k7ViMmep8m1i8vhG3z
	+t4IyK+O5SlJEiJ6fg3U2Tq9Vg+oprgYeIyXycLOUxvJJFyD7i1EsFxc/gCI4pqA
	JGKB5lDNX5acXmPJg/bu2SE9u/jFTagrp7HxN3070qH0qA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m1as3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:08:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-998a2b06e4eso742947241.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420508; x=1795025308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mek+GhpJgbAlj6PFKAaMZa1L4pkrsPGjFMnbflusKoU=;
        b=USZQXkZtLVycy5Vz/3x6ZU2k6y206q2Gzc6VpDYwi+JihZ+B2TGrRGQG2bL7rmJbLr
         cwqYjkzsYlZjf3zw9eSizLUjnpWTIgwMnRKyI5hcrbqd3aUWuKRCNnMXXrhGHaWx/4m/
         7TXgNd9GS9swz/b2bKKp/bxPplqt7yuDcMoBcNBV/2qBMEwmtXSLBoJQiN0H82gLlm3w
         JVFLN+K6FRNW/70A3+cLD1B/0fZD90V1FmjDGyGTY+RSM+Gav8vi/iNl/z8GkCcivTu/
         6v99shOLb68mA4FpSGnsHOgV0WZoDZHE6GYpPhswKTbpPhmTk2aYPtCqSZ43sg04JV3G
         KqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420508; x=1795025308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mek+GhpJgbAlj6PFKAaMZa1L4pkrsPGjFMnbflusKoU=;
        b=YDJUmCd69p+fEhqSXT4nmFr0HEb3YxGKOem9fQduLfoNcUPrahresUqPUWN3WQMj6h
         Cprul9KuW/Y7y/rYP8E5CKQHC6w24eBUmdM/DiaJEjj/2wMW9QovDOtzW14YW6ZTw2kY
         OqJBHQ9+Rt0QM/25q4yGNWG33YxCgPQBXLLHdYMuF+STPjFRgbBQybRLbQ70s/Q/1LYA
         +MywowWikMwsiJEJ9LtQzyw9BVXvH6MUbVBqXlpGW+ZGknMgXCHelCw0149CqlTzKjAf
         bOb9e+QAyb42vz++QO9lyj+P/RDqynBzeQPqTLYFjgiy9GlRhZiU/I4Wd6R0w85AFUYe
         z3kA==
X-Forwarded-Encrypted: i=1; AL+hErHPWa3Dmppy5wQtIHm4c2EHGOXLwzmngKgPwn4f064LhyXFFhOvHm0ZddQ5jnitGSoCYpjC8MygHczL028=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ept6+y+rio5hsGWhWzOsmiZoRZ+NljJ33IDX0Iqui4GDAfgGf
	/EIUELwsf6LSnTkfT6Y+LIsMGMu34FQp8/tNoWA4sE6P80Wjew6JtQqIxDxgQfC58awBWrT+Zty
	IBWuAP0P+9qOb1TSbHjAEWRFRhqQkE8IEy7XKDqJU6Bm/fPvGA77wj6dqUl5kQVqwfaE=
X-Gm-Gg: AYBFou3OR8v5ZsMoRUIT1+dR/YyuzQibmYxg+snmW8jpGfXfSq86mS0xkTzs/YEtuB1
	P5tvaY5vAXSDaB77KMroYWEPgpOmgc6++xJ+8JZS8F9FZMJtkvoW+th3hCpCbRSN18n4jnVQICD
	68Ue4PJImzw6InT0+6ZS4UyaTZfpP2ow84byroy8J52X+tOzxDjZii2m7Ul6IXRxnDi7SfTi7K0
	nglItnMPaxMqeor4LF7tihl7dq/Mxu15Is35SMW3zCyaqftHG2j5T4mi2uu0We1HLtREQ/iv4MN
	gpNYURAAaaoM8oMHnIVnjRVSr5ARANPpdKiNYdVTaUFTLjlsndpfbFAPGmWX833mI0m5rP2Mot0
	S5Glzd1iQOHUEVsYNblZZbgY/RCkoBivbTG+w/ufctAbbLAuCRoJj/zdg3QgG0U2oDLJiYLurPE
	iabpFXhrOMybzTa/Vv1KsJnCEYrqqAqtSZrQ3QU4oa50Xq5XesM2Zdypzp1VY8/g==
X-Received: by 2002:a05:6102:334c:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d50615aa99mr1096431137.37.1794420508208;
        Wed, 11 Nov 2026 10:08:28 -0800 (PST)
X-Received: by 2002:a05:6102:334c:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d50615aa99mr1096382137.37.1794420507572;
        Wed, 11 Nov 2026 10:08:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae09224efdsm13131431fa.14.2026.11.11.10.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:08:26 -0800 (PST)
Date: Wed, 11 Nov 2026 20:08:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
Message-ID: <qobhsifyot6ahopugvgsmtzvd3oby43vg3yhjxjf5r72zdohhz@4r4et7fookge>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
 <20261110-display-msm-of-graph-v1-2-0f3106f817b4@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-display-msm-of-graph-v1-2-0f3106f817b4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TQprf2Vj-rypI-qw6AbldY-q6WFo3ViJ
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af4af1c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=udFPpGrmtiWedX3Zxo8A:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: TQprf2Vj-rypI-qw6AbldY-q6WFo3ViJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfXwf43iiLy7W5B
 xs3GE4urkGXPJSkZy7LHIQZd+qUJVCA5ZR6/s7i/Sicg5gMhoG7nY6Ul4T/HOqXhef0Uly8DDn9
 FAQiJyjbosrgWVUePWBbs3GqmHHAYQT77/ehda8vkrx5yJHkv3stCKQqX5aCj2YQPrZCHVZ/kJ8
 Lrji+z/P5G2o5d8fc7utrz6rIQlQ4OnXJCPgiL4DsRVs64ag5AzTzj/jo/alEWjCoGi/V02DZBd
 ehTMt+vEs2eqFf2zhrLxdhLuJ1EOXneDhClvcEXcRoKO58lRDSay1FDEmySK/Ufkk6mSKbtHOqz
 XsVaMFj3A9PyA7qLrb7jydUKvj0Xb/SYtFdQ2Hg63vzOZqO0EVXt3th5O+yX+olH/+8xtXlFaF/
 7kk6557y2nqj1VIdJd7fwz8emg/hqVOdZJNurd4rc67ORwCGZpRjGrbmH15XwzRUtZK6uuWxBLX
 gY+g1aiKqZV8kQRBqJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX6uoQG2Wa8nb8
 AqYlpBOHFdKtqQGH8Dl7r5W9B2IAq++82PB+L6ZUvZsKRsyNKFhDL4/DYTDFas8MN9huw2coQNE
 bf/uiOmZpZuAZ95nVe/WrCXIhgaEkcE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Tue, Nov 10, 2026 at 01:57:43PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
