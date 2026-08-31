Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDCB495515
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193692; cv=none; b=byw+ZfM2JkZbzD1jivmGpU+xkwZAIwnbV98rTqVNoR/DUcfddOcFbz4BMBjjMjjby4b2mpzVVQSL7zl+80iUP+e654ebYNf9dV1aqO5qxky0B68uwbyO8oU+RphyVX/g2PHSUd+FflO3wWMUFGzCBRnqeMUPeMGt81XHUFceVhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193692; c=relaxed/simple;
	bh=zkZGdVRwOoNfXfRx2NY81vLd+sAQrNPf20jgzNFCH8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpZodyBmvlXPZPeUNu//RJPqudYHA57sS88K9nWqTiw/SO2Nk1PLXBzsR95s+vJaALrRdJaSgAZd2EN9ymSekMgYEbYJWBgW8bq89w1xfhnrc22NHZwaQaLxYv/uGYzzSeIbpbs2D2w+/SBBoZOoHJkESc5m3XbvAQNziEKbw8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aufi+QbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7EvrDzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aufi+QbF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7EvrDzA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFpQmw540918
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQAALbq9tEkve6/a0cvzrhYbBBU23fzG+zbH/pMCIG4=; b=Aufi+QbFrcZ1EklI
	yP+e1axCE2oid1XNbvldEVA/YAZYMEPNqSMQCmiuBPHNo99GhWe4ZpJZyyGGJR/T
	6M51b+JIXS4f1sxyVMLiysgm8dbZDxY5LfUL1SqsKUvr9zKgXJTHWFIaGcP9v9C/
	VzdACCIxboE/CqkPlNeJ+INS57zyOwnInsnqxo+t31mGviuvf3gMAM2kf8T7MlNi
	Zd7gPd4g8FtFxoOFm5bFnpcJqQH5NQlSxQnvd29nEQl9ta5yRxB49eKWEofsT7j3
	LBHJ5PebDflFyXAEtIx2N/h3UMVlTkgLoi6cW+oKyPrmOs4koP7Cc7DOPisM158f
	lx21wQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x0adhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:28:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938fd633df7so98772785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788193689; x=1788798489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQAALbq9tEkve6/a0cvzrhYbBBU23fzG+zbH/pMCIG4=;
        b=e7EvrDzAXTec2z1JF7l7dCInKqzEFQ7vECHKQBB82dXVrZSbyWDdT4WlkRk70xQOLi
         vNxpRn+g8zZVHNkJPsqtRwDEHOBxvdezLyvwB4lYOi0YTR5HZ1F18hXO/as43D+f+hCD
         APxVmD7XcWhfDJfilmIYauIbKm4nZnCJYYhuESgDfQKFg94M1OUyU0I4gagvu41mSkEq
         zXiocDkQ/euv5+8uLKOLTrbtLBKuzQMh13LsVqsFcN3O68Ah9tCMxhfvyJ5mefJPvKLa
         zqpj5oyJZf3fLePNagS95SpoEPkYy8sX7B2Xeh6U2MiiAgk5Pzsc49EMPoas4kbMi6B/
         Zvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193689; x=1788798489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQAALbq9tEkve6/a0cvzrhYbBBU23fzG+zbH/pMCIG4=;
        b=GC1GTTW4pUw/5K0oeOGHAjdnCpX2zw1WMSTr3iXPup66OWekuijZFbI7IvW0SKwLtm
         TJeRQToIXUa6C8YZyJqhAf/SJDwLiVi7vo2SQeXLfrtAymDkNdBsrDi9ZXk7Ddg8eHL9
         +jHwygz4w31Vc/iNRH/xvUvbSSz+iDhUfhg+lwsXJIiZdFYb+40bUdZ0KCIeYT1Qr2mn
         G0Eg0lNSYpAiHmphBqrq5NIDdJRVbtp1OIgSB+j1EON9apberC9fgkc/Sgq39iJsjIPP
         Wyq0ElQhC+QW+is1HPHVJz4BgZmA+cx/7jisBm6HAcjx/7WdfT2Vth1AJ0tOkX4MvtJF
         07Vw==
X-Forwarded-Encrypted: i=1; AHgh+RojTeIdn86ZFkk6AkYPyJq0lvgTPPFfIh/e4AdMJH2WV9dRT8dgmvMbX8iiJ2XloClWhTL6ioB3e2t83hk=@vger.kernel.org
X-Gm-Message-State: AFuF++nID6zjkkfCxYVZvArK2Yw4fk63JWesU29tG7mDA5YAzKQyg2T1
	zaBm9PHj5ZgRBMWvxiDA/VToAH2V0vT0k/kImJ+xlC1WAY7poqPbgXS/S1NzOjmZTtAue01jtNF
	Stcirpd99xXnfnH/ZCS229SsbX2ig+/sL5gZDpRdEiNvLV3SWuviDb1n9SA+6J0913kQ=
X-Gm-Gg: AR+sD11QT4ttZ3vxHBIvS9pavk3QP3WGjpo7V9ijjIKJCb7iYHI3yGGzCE5LObXNprf
	/CBQtK5QI0HX6fd0GLZTvEPEL1NcjVJNFyZCVSvPWBlzVEZlk05+I5elHdCgHcPq4j33Y/B939Q
	FaEo9WqFZjb3pgOGsgBpNMN2e0pP1ePVy0wdNEpEWC39sflF06U4hjN5foEPtrhHGpo7rMG0DOt
	MI2yDCrr728Dnc8+maLT23ZUox4AlcmfP+u+O9SikKnRqN73Bee6/inRn2tE6as05TMg04CxCwM
	hzbU8qd4UjT63M7aW/CcOgEkD68w1xG5i5ILJj/wyRoSk9D4CHKgs0cziGC77aJSnCjyng+YJQZ
	Y0uCVD1EUp8Popn2KKHJlSw==
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1054410985a.4.1788193689317;
        Mon, 31 Aug 2026 09:28:09 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1054405585a.4.1788193688823;
        Mon, 31 Aug 2026 09:28:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b5a4esm464039466b.32.2026.08.31.09.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:28:08 -0700 (PDT)
Message-ID: <563e9749-5558-4ccb-9b1d-0d3ec6a80ed6@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:28:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 03/12] drm/msm/dsi: Fix indentation of if
 block in dsi_mgr_bridge_mode_valid()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-3-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-3-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX06r4n3x9fkL9
 ypEveVnw54Idn48RDnXBRAu7NXGdhsyjGHHA32g1wxE0PbSsiTCfdYPFRlecVHu4dVEN7gQV3Iq
 mCIwTeOwtc8BMkSbnhDb8Sb/R/1hidg=
X-Proofpoint-ORIG-GUID: TNJDY20ZiibOqnz6Z7j5dF1Sa2Q6s1ra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX/GIrOWdlxr8K
 dw0KTmARgi7MTNBHf8u+9zcQqFWIY9xGdn2HjXt/C+Nye4b8pL23IQMGMdvA0Z42EHx6EjBhIpN
 yySNiIW8YSBRc43fVJItJkJ64A/+WcZlm0skhPWR86uvW+PcV/LSibN9e1sz8Gv49kihbKKbeeH
 IVZfcoA1Jz3E+0tsv7tUlBmrfZetE19oMlS6r5yUgCnokhM/MtOObo6bkmPX9z21DN3BzA1b/29
 6nx/WPX+0CNzdRKjxBsgtHfsv7dQ7e5RlEbz9OC0yqVFvl1jio+rcOee+cPkMQVS6HuPkh8YGxD
 PFx4HNK5TTCjg6l4WdvWp4+T5PXNoi4rR1qRXE6DVBIhO22jgjGy3fp/V070ehGTP8/4a39l51x
 7uvHyNbIp+c9LrOphHKaVEOPO82jhPc72OtUATdDgIiRDeSIeoAEowmJI/E8f/L79uIX7tWctGR
 mcszsHXlGy05SgUZq1g==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a95ab9a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=oMov3bMtrqd5QQYwA5wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: TNJDY20ZiibOqnz6Z7j5dF1Sa2Q6s1ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310142

On 8/28/26 4:05 PM, Krzysztof Kozlowski wrote:
> Correct confusing indentation within else {} block in
> dsi_mgr_bridge_mode_valid().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
