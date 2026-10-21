Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581389;
	b=mgGhLaZgdw/e0L3qwJcoB1E89Cyaoi4y6zAjPwrYbEr6yKhWKBBRMbPCP6WvHszmY+pW
	 kuvDr+KpNN97y/OqlR/aqSbzJFSxtGS6XrBr/Rgf+i7R/VXpZx/7Sz/h/eegqWf11W9A9
	 PzWM8XWkAQjBGgQLFJ6ERlduIBgIuUQ2r9nJ1GZK6NYrQURiWCsYikOilIeYvlvHK8ilD
	 NrzLPyuLnSUx6inm02t3rvbvEuEr5MSnP3D7ybaKFLZidxf4xtZD7JQ1BfTZ8LWgSDTE/
	 mXb51SuQ80TWVDFQHuI7MX0PuSGZsTcB3Nx4iyXBmnLjo1qD82IPg9+gmSO0SvK9u1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581389;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=;
	b=JJ9JJnBKZ9aQjGQQCE3O/NwdyCp/zBWuXE295XPNPTaViO6RUwicF2n8GA1NovPT+hB9
	 sjl1kZH+l30Q5PRQlVcIMbX24OvONLmA3Pqy3uiEGLihiv0IEZpdrbxayO+jK7HEKFcmy
	 A3H0UK8W2+dDmpXFMkAcXEMaWq1P02gL4EVfjgoPayi/NMah84+wFRNhp6HILR4uo2eTX
	 rqe7zTPCqBZksMWEBuliDQ1sZakgv37wK7z21qZ2FRok+K9C1rI0ExVuTaFG7NUmVcM+A
	 A5yxkGfGqciI9fxADqB8hG4OkNhWNPO/wEGtppul+Mrq1zEsZzF3JhgwGN7xI9YxO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlTyuTus;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxET5xM2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3792A606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3792A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlTyuTus;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxET5xM2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LAJTbG1422109
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=; b=UlTyuTuspJTbmMcH
	TbrdWoyGP9Fc4ksN8AP603nQ5JSMitl6SGjKkcJL6A1xjJ+RvA5CB4Buzq0FYP6P
	zO/EhRjitSuLTpqfPj/KiOqAZUouh1jnh2a29eP0ZMWFBaAfUiKryACuZmjToJdE
	2+FB8XRZmYUKQupgsJ4TenV8dLAldxr+Mj5TQc+aMatuvNZfCsWHVqAXWRAbxUrq
	1tyUC1rpg33NVSZeVbqngcKuycHB99rNqcs/FMRbujq5Lpmiwi7frL/ChtxIHlwz
	rZqPFNvYjnNBGfgNjsk2MeOWjCeJ55jUug1EkcHLLTRg1rh+JJLh+EjZb4kh2q7J
	fztWUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug62p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:16:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso951754a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792581388; x=1793186188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=;
        b=jxET5xM24qbiY2HOIF3FedDwxyS+BxFcKY/0NIe8Ym9BoGGJPshZ/DbK4DRqdGPu1G
         3rFCIC8G80yuRDLOtEz+4JJDy8Q75u2XsIUabeyAvqfZUbOYZJnKMKEi2YeD0PqYVfmv
         1oI2CmUsNd4l4Wh4g6kFFkLKBDJdnphHl0jSpDSZheqOWG64LwL6m9MR+8QeVZPWCORy
         weAq+ZMr3BaMYihwaAx3nwHmWm6o12CCJCNmT3g3dw9ZbQI0/SsdjzFiwYXoO0qa674E
         1lTKC4TgGEauTvpHcjJA9YXiEji6anqMPmEsZa5jlsw4wkOfoBOnA3dHagnZ5Oq7zE6q
         RK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581388; x=1793186188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=;
        b=MRe47i2zW0J168IksBsZBI6VJK+VGzwbTD8q4cUuWQky2zsHpYcUCLh4WKD4mdGl16
         oueRuZu4rzyLr14vV1jLwtRELQCg5pLCrhefM7C0kIDTCUS7NKtz/mzQ45MSR7KGqP8W
         X57coHC2kpeUnSscfGqPzYxoNnQoGYURhiAdgAYp4pBL9TU6b0GkaZ4IaVYG+AxOM/6m
         NySMZkcaN5S/Tgxa5zGz/Glgd3mp13AUY+4IzheISmEDHNgn5EFtYVl7ZSzn8h81filp
         Scydgw1V/KohrJv22rnvJSYQFYsFoAPKxg7Qp9SDckkD2mlnyeve7CyRWt9Ri3ejdws9
         Ekig==
X-Forwarded-Encrypted: i=1; AKwUvBz4CA5EO8ORCTndgNBf6wfk1TGV65INz9PKw1dq1hQ8LB90c/VzKvbZSoU7VKwcJ73XIkAB8YLXnuaC1HY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7xOLrXQdHOEGsknZj8wLe6qx8wCseq/eTD0hu61ieVYC7NpLm
	3pjAOztvBqALxzGQw1oYBqj5zXq2yu63Yxxq7jrRkLM4VjgWDe0YzuG4lF41a487K/yQ/8Hd737
	DO1rG1WSivXJzWkzh7Yq5KoCdxSwDhmTDUc/vj1+7bnV7imUesY9xGCVpTjjYzIUB3qE=
X-Gm-Gg: AYBFou0DlbrLB6cFm5iWUnqHzMG1IrwoFGG5gAOLSZPWt+uO5y3Ub9Kpnv0y4THxxvX
	ixG7pzaWFrTB1zaJrng087L9+4OlPl/2Zn2vBTdw5Q8wQJ4nVpy17X+YgWnfxiSMN26X9TBqHHg
	jR0jCLWKVAoCg/J3PEp4GT7re5gmDsBOf2EWjSjyF0oR2Lyv38XsiEaJ7FTNDkHuU+bJEsUZkoC
	5rTS8M76wneFXbT8gqJ4W11+UA942FdRyX/ADzUa2j0udj3SAQ66upvD+tg8AfJgwRnVXCMCHzg
	DRYLXyr/sGtFv12IcuLEekSbrUWSQroOtDZuuzcJtfcuCsA0E83PaaN/L9JMuBKL70oLbK6PeJz
	eYpLr2zF2lirtxBsHl3M6ceL+VLpn
X-Received: by 2002:a17:90b:55cd:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ad86f49b66mr1399610a91.45.1792581387612;
        Wed, 21 Oct 2026 04:16:27 -0700 (PDT)
X-Received: by 2002:a17:90b:55cd:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ad86f49b66mr1399567a91.45.1792581387068;
        Wed, 21 Oct 2026 04:16:27 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80912f26sm3948228a91.1.2026.10.21.04.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:16:26 -0700 (PDT)
Message-ID: <425ddb41-cfd7-4032-8666-0193ab6b5819@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:46:17 +0530
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
Subject: Re: [PATCH v2 02/13] dt-bindings: display: msm: Document the Nord
 DiplayPort controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-2-a2ab9af954d2@oss.qualcomm.com>
 <20261013-tangible-wakeful-swift-a38f8f@quoll>
 <20261013-honored-bear-of-cleaning-bd8108@quoll>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <20261013-honored-bear-of-cleaning-bd8108@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad89f0c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=D6Kic2Gw2dsiznywmRUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NCBTYWx0ZWRfX1HENsCxVJ2Gy
 f0LtFiM/GsO2eT9OBJXWIw7W9k0TvFjy1Q4xEji1B+4rUg9pHMezQsVOIDUNGmWlTnFvNq2dgvc
 fULpEW3nqUHqPVQ7xUvxPnM5EJYZ1n8=
X-Proofpoint-GUID: aJRiFHN4QKN-KZLKe541E2_JnkNwWrkg
X-Proofpoint-ORIG-GUID: aJRiFHN4QKN-KZLKe541E2_JnkNwWrkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NCBTYWx0ZWRfX+xQJgT3MlaUm
 +tOTOk+u8/4gn2DCdZGb40X89Dxhmeai1Ez3ANKYwz0yfkgO+BrhO+Cak+mZXkatSqzNzrDl2xk
 GRBOii4EQi2NrD+wkPyNIeUZjaFscMGLdh9wwltZTQytOIHtEeTgjSLiyDiKqsgctVmBgEBN06W
 8pOvs2MXUNagEZBqwPx8WTW6GShLzYfZZT9LYHf+3It4q1UMv8REVxNSjXA3rM9p0pIiI1zivU5
 5wnUvMAEu0NxIDINUkR28JKZdjMLzue3bTIbw+cZp4YCQr9wpTYRQR06qbFdbb9tKgVsZczSSyw
 hvkHQ5JYRybD5C/ybHlpo/bHbgNnx4MtyJ+0j46cbgU1bKyAlg8UdwSFVDAg/7fk+9x6JX+wC+u
 Lq0whr68+qufa+8xARhTPv53cC++heq7BA4sTQ62n9mDydpLZmV1WMcRa67iVVZDJTpYICZnysd
 SR8hR/xLKUWWmDihhWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210044


On 10/13/2026 2:18 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 13, 2026 at 09:44:15AM +0200, Krzysztof Kozlowski wrote:
>> On Mon, Oct 12, 2026 at 07:02:12PM +0530, Nabige Aala wrote:
>>> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>>
>>> Nord uses MDSS 12.1 with two independent DP controller instances,
>>> each exposing two DP cores at new IO offsets. None of the existing
>>> compatibles match this layout, so add qcom,nord-dp.
>>>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> Do I understand correctly:
>> Device is fully compatible with qcom,sa8775p-dp, but a simple to fix
>> driver limitation is preventing compatibility?
>>
>> If so, let's fix the driver - just add more addresses to the
>> msm_dp_desc_sa8775p array?
> Or it does not matter, because top-level MDSS anyway cannot use
> compatibility?

For MDSS0, the DP register offsets are same to those used on SA8775P. 
However, the MDSS1 DP register offsets differ from SA8775P, and Nord 
also utilizes a different MDSS instance. Because of these differences, 
we introduced a separate compatible string for Nord.

Are you suggesting that Nord should reuse the "msm_dp_desc_sa8775p"?  
This would also pollute the sa8775p's desc table.

 From your perspective, what would be the preferred approach here?

>
> Best regards,
> Krzysztof
