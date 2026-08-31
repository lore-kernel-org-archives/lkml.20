Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2020144A41D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193672; cv=none; b=rL3hD7NAR1KlxoU4qgy3keVQWEyzV/0zx+Cemou3zi1W2kdzhHXIk/MGnPA2WhG4PWBOviEoEidt+QYTycpyoJLFA3jmtJY2vaq6V6I1G4q0JEoLjkqXClJNcqhNG/TSTDAHwKAg0sZ5yPGYxFHWqgDrh1k8yTc3GDblSd+DJsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193672; c=relaxed/simple;
	bh=rhAJXL/NKkli+Ix8F7UvkfRU46UJwkacUKhnytEydKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZGyE4GezObBVYvPdka/VNcjrQAo+Fe94WgNzubeqQXgnOzhVzW5n3uMeWWICsmMf4h0LOGCfcHw/hVVtPAlJnMWV+W/gg30LsRtWavypYdI7zHSSf1DeGdXKWZLAwxbsMyXvc4yiwWmo9kW4dOgmhHWfUSmMyKdAQ2xCdnFz9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VO4zeFzR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvD8dbQ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VO4zeFzR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvD8dbQ1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFpR19540927
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WNpN+Vr63EvamqdAdbzpzLee0raToScEoKCwQyIt1U=; b=VO4zeFzRcZaWm1Mn
	R9NqSGNXDFXRw8Bd6dGNjLdzXb11WYFfawFWyWgRiuwsNM+Bfs7FqOI/SGYZgsaY
	jU2610ckV46mPKQNVi1TDFHLc4Ev27KiFDCXso1+Efp2ZJpAAlzZQAcoOTQ8Kse/
	znAkAcoIX6Q7q2XIc6duVKeF11XZH2NbNT9Fug13TGRP2Wr2LvvawWnfLynyeebE
	5cFOvO/eVqhniN5Nq00gJTjtYoXAS7ttBz4LGz+JDxX0fEDQEiMd7XhkWDhCIgtH
	r9vSHveg74VQFbOvYn6m5Ow89K6CizzgMimrctm8yh/9+f+wf5quFH1tx/KrNYH0
	ijqGsQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x0adf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:27:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso69054485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788193669; x=1788798469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WNpN+Vr63EvamqdAdbzpzLee0raToScEoKCwQyIt1U=;
        b=YvD8dbQ1+UHhNNaiSfP4ORGd3baQbaHoHr/vURmsVy6vLYQBBTOP4i7asd7/EXAt8X
         I9+ivpHTI6T3N3LhltvySZ6AV1mHGyfYvPN6AQNuB7xkjoq1CHCgokHgoPeUHXC78THi
         TV6quM1ubYKX6iw30fbsTlh7r1AwWX4/V3OcLFgGxdNsGlVxNXmtI7Tel4hl4/7qblmR
         zilzz5wd87sbgt+0PwacxbMLtJ/9YJbl1uowiICZFxOaGP83ebv2FOmo54cpu7ElC3ic
         ibQ3sHBQrS22fLWzHRvI43Yqhv2HVTH+0qBZuCB1y8r0mOJ19PZHjgHsThIwIP4ptBzY
         ss/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193669; x=1788798469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WNpN+Vr63EvamqdAdbzpzLee0raToScEoKCwQyIt1U=;
        b=SpdGT+TTMO9apZdLm8cEJtXtm/mR49P/3YxuW2HtuciSfDcTISCWC274h1dVbJoK2j
         hU21CmelIjXTOXk0Pn93blCGAU/ujCW6uiFIzWB0gNFI7T5I+hY3DbCigJRI0lsmgY52
         hplpH5lkHcvCVT5tPbIRJmQtyj9dxOVsVLDsrwJu4GlWqRec6I5Xym2U4LTf4CjPX9SS
         zyj0RTEKBNvk6/GSmzlJNP+yle2/9vmYcqpS2fPvBYTzU2b/UmD1yneB31Yk5uWRQrvw
         LtQ8ZwpK3X72u5T8gkz4C398uPJHh+3rmEOCsqwe24852hJAecs+PLhGFZt/tLt1fKtH
         pi5w==
X-Forwarded-Encrypted: i=1; AHgh+Rq/i6OgKZ1GPncTH7+FjLD0Qbc8bso7uXlG+p8DIPaQbLIWo+ZbfTZEKUj+wvqVCnEPxNaUnCD6FTl/xg0=@vger.kernel.org
X-Gm-Message-State: AFuF++ktDmOCl0FdbaIk9o1sljvCxQWm/6Jlo0EVAl6cFWTJTO0ejGFT
	7fQKDgUqslscKI99qrkDJxz9gn6GHHIln4C4MowB/UuW2QucOHfkCIRonux2Bw/2jlOQcWz+/35
	hPzZlBj0+v5g+HL0oLrimmAmOdGaIbd5mfGaFjgAOlT9aqp7Pq3rluJMj2rTE1ZmzuK8=
X-Gm-Gg: AR+sD115iHoo98QA9mOzot+GLxoP+QwzjDZBJWwb/Rjw+M23Yb/zqMD6Z+47ZsOBUIH
	5vStsVJMFvWSedVdwy/4YfGWAykFvW58unVu1UlfnhhHRwWCE5/0zAJtGPREMRkcqZcmYdV/gTg
	Acl+ZUTPXOGM8yjCZhSZH834ssVzsLNB9g/jC8SCsU5zRydYh823t6DTlfbM0JbSI3/boJ/Zbha
	FBba+kDzel3Se37009naiTxBbmmxtmgLxy8RSW5uUT/Dn2uEwJ1b/aZbOX87UaXynIp9gzytI70
	wt1s3hU2WfZ4vu+lvnmre7vIQa6m44An+48VuSvoPlTcE1vzyIkfSCxWdiA0q3H68pcFxR3a5IC
	XNYun2GbVVc1PhbfGKRNkyg==
X-Received: by 2002:a05:620a:450c:b0:939:8bc:8826 with SMTP id af79cd13be357-9393fcf48f6mr349886185a.2.1788193669004;
        Mon, 31 Aug 2026 09:27:49 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:939:8bc:8826 with SMTP id af79cd13be357-9393fcf48f6mr349878085a.2.1788193668312;
        Mon, 31 Aug 2026 09:27:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255eacf6bbsm450982866b.0.2026.08.31.09.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:27:47 -0700 (PDT)
Message-ID: <d4c8a4ee-2a6e-4644-84b3-bb5600836d8b@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:27:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 01/12] drm/msm/hdmi_bridge: Drop
 redundant initialization in msm_hdmi_bridge_init()
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
 <20260828-drm-msm-hdmi-eliza-v1-1-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-1-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX4JRtCMDolHxb
 JDj45GlYweQVVBvS95O9ZLdwINVH6DWu2XzeQfvHmJIFTV1JEtq1sBIgBC6/w0CIRP5Z51qSDLv
 Dubtj+03hyIL07LkAv/mSZJ99rBhuho=
X-Proofpoint-ORIG-GUID: 5YKXAx-Y5oQiHnEl42uftItTdx6uhT7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX6BwOmJ0bYST8
 /OJiaOc700pG/YMXR/c4uGPjUgqfneLeG1G/ovmJU27wYHtkZerReKs0cybhD8rXBgQ4VzQMCyl
 vNwZSiNQWD3NyXkE20loC5ZSnn3+ha0nQpsslhBdpjanBw8UKpIJ+YR0yn6hYNGDo4u3IknteJu
 RZ0UV/w51Od0bi8xJxNeDf14SyWbBb6DeRT+jouxRLiA/YoMwWzd89rmnwomuQWQdgMAclNtEic
 Kra5V8LSRZ0w4L/1j5o/XAdSLpZoz28cb5tAzWvQaOkPlMIeHbMOOz/0l+BGhScrYKG6eJiKN4Y
 fCmCK02w4zihugN+dY0KxuHKAGUp8hPEvNyvKlmj4ajCXT9kM1u4p6GG2dgsrkCyl8C5TQdkgUn
 y7DonPGz0kKZSEBEeyiRlxsz1ND2PxExBphV33njnr1mNQwLnHO3YDgI74G3pfBwEd3TmQRZ4Uh
 MtizbgkiSPuSttDQmIw==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a95ab86 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=P84uMFOcKlMy4IiKK0cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5YKXAx-Y5oQiHnEl42uftItTdx6uhT7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310142

On 8/28/26 4:04 PM, Krzysztof Kozlowski wrote:
> Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
> the function, before any first use, thus explicit NULL initialization is
> not necessary.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
