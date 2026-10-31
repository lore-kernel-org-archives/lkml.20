Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483083;
	b=CmR4Wxv2tIn+rLhBqVxFJu66UhJHLrNwuJygoj+A2jg+OoImCGbwGssyX/WJ0k+mS9Yd
	 710nseJv9HoZIyiilbbxRfRDv3Y3NWi/Drl/qgEfXop9quRZB3ZV8MGSYJyE++rqJO5B5
	 TGg9kAe2yQ6WFg0DQeHl26TNg71WSg4lDpDheymG0fwUvQ6VNBjxfd9zN6YV+3SpdiR3n
	 6SharoESMNTI9WizkrMXZb84PJ7pEvxRs02GWuCX5RIhus/qEjfDZEdeWLKB/sNoAhilg
	 Wrfw+fQicrczWxr+Gj+tFnBOGatsalvync3V5UMXqpXlwo3ASpYCfd7OiVAgt7h+i9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G3WyDIFGwvzASNJI/Vjyj4QhfCstvrtuJBWM5WfABQc=;
	b=ISvnJsi8T1j+wtYcpzfXYvgk59Nmr/w0xvZByaIx0iMebt/6ujoeR0zJiDyY2NDTmZUQ
	 zxCKSb+sVRGXAQQ3pTgwnNTFeFsO/55BUEJL2PPgQm5QJzkCpkJyHNd+0ja2oF2FtLrrq
	 bfabAoLOlyc9itFdoLhmLTGZLaJfYJOH3DbK0RYVHFKzXh5HH0P2hirNiAm/XDtTKyEFT
	 K+k6/8m2MaZRMdCu6XcVfcx0b2xygg4YLx1qCDWUeMdf1mkokZmMpWpqqmMRWPKRqVn2z
	 M8itXwlYhaMl83YnxYUTGbEDFdDHtqnMa16rZGvXVBguyTi/AUwCiU2qzPZ4r5v5U8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cfscsYbp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UUoINT0B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A15606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A15606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cfscsYbp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UUoINT0B
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFPis3533424
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G3WyDIFGwvzASNJI/Vjyj4Qh
	fCstvrtuJBWM5WfABQc=; b=cfscsYbpsec9HVAUghcqDLk1GkfjoPRWcgsNbSdA
	B9hcnyI2MIKFlurfd9j0Xr4QDHssmu20XO0LiLSYWGpC7sHjGDiw1Yk8WvcQBysK
	6/EnIvKoZg3hLhhqCv8NRfdRVD2yGWHN4K+qLjENYbNY/gYmJi1kAysZ/KJzQsg4
	4D8DZ61LSUc1PDv+psXFJdfvsxplaIb7b7M9/6oUvl34It1OyXIq9rFukGiOzU0y
	EBkEhSsYmY3Z6ZxYkorIL7WMyqdNqj6Pw/PAKvt3xkL+RdgR15PDMAurujmFBskx
	qVd9Zp3OlmW1h5DQwz+aeaJOPItSCpvAcGK902Cw3k9OPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6j8dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:44:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so348834185a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483081; x=1794087881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G3WyDIFGwvzASNJI/Vjyj4QhfCstvrtuJBWM5WfABQc=;
        b=UUoINT0BHka0RXHKV+iLD/k8zbz2j1c/f9Bf54pQZRM+87dvgP14zr2Y9KVJyQ8Q67
         NvyrD/Aa/NmGnrb6tfqGQLs6BSp+lSadI3mMc6i5j8y+hUhu8xgDNENENWIB0ZerB6yH
         w4/eAM8VmNPkcPTAmJXBHu2r+S9q1XC1USAhsjCNiQnghs/E2VvQ8J3XWeSdIt+RNXXB
         LLOkrmJYPUUUyGjJfWWGv8jwWRpv2MWzyse1qB28s/om5CS8btnAWnqjcmodkC6gPKI4
         rwEHimLgKBDqkzPXNha12IBvJl1N7JrEjkGnGS/l+sgc8ZTmAirdC2bMbYmJjwy8CPuZ
         yVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483081; x=1794087881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3WyDIFGwvzASNJI/Vjyj4QhfCstvrtuJBWM5WfABQc=;
        b=HP3ROndkf1E9FovEZEkbWrs+J/4oAJAMbtu9GizjkvcyYsnaTJ9WX9JXkuYyjID9rz
         MwtBDcGrNzmFfsG0DeLqdgFRiuLeksTsnTLeGIac4PCozyH/vPdaw6CqbkriBltRh+4i
         kApGnfz61GRTSov7jeLHncesETq8RhIke1rqtlqXl2qBsOxv+5TO21Da+vmBMJFffyI3
         Ovwh9FRLA3BJdQ6lbNQSErlc6Dyeqrz6e+e2HMUra/C88ste+ChWxahMW08Ay5pV5Bjk
         dQZsSbHVPzC2epDYzGLZqZTDwTexZcO058BoY83OSc7OD1j1q/+vBEB6vUKv9jqRIQoa
         XnKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpLT/5VvFe33grzE99DhyZtGop6qOFSdQfE6y7u2dL73Soz8v0l2OcE5LZK3y1hmRco+aCDhRJiUh5h8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeELs65ajKunqk6rjquqiiEUSfFzvOSnnmkRxqN45HF4bQfEY5
	M+CAxmln/ziAzwd8DraEHZHVkXmKcCQCH01ulSlyNHwd7Gtr6Ogm34cgi2aLwtaQXEQXuyI7F1x
	Ff5GSIc2WIGW8QtKXUtHLcDpM8kh3bMNTKfX8aWR2r8/TcIF3dncxvgpUYcntKed8aVM=
X-Gm-Gg: AYBFou3tHwx1ikEmbl7M93ZJ9nPGDzM1BdYJWXyLblzD6OYQyKQKfVx8YwWDhagreWC
	7f+iuKL2FksymUP8vu4EfgtI4i1YktML8VRl9IfwN4XNeEViRhUuDEBw05sa9xGYzRcP80OXvg2
	P5dP24wo7UJtuNeFTecerBnuTcHL0pDvNAR0iunI24YDsJhrF4gXKOaUW8vqLbkPZzWFa9JOqGD
	Ksl5QH+taciEOVVuxmklEzEQWW2aTtlhNl4DTA0SuF0EHeTe8kSo5cHu0Df9/vuV7LP/llnDzqZ
	8NzWZzzI+0zOXZhOH/2zfaEUqw/HdoQt3qyChKLrGXvxADu7VfA1bCLRsvtcBuZsZZAprY5PG4E
	/ZUdAKNaHvZRKZLLfvgLcLyjxxJwuoGi9udv0j2qF6HbXVWHqirc71bdIN7jr3xgYZDpc4A/4ER
	+oadNX/PKwTcDLvTimZOP1ZaEFX/WE3myJUSoITbjY8/K013Ei5/IdynSBq3N4EQ==
X-Received: by 2002:a05:620a:4720:b0:93c:2c15:e510 with SMTP id af79cd13be357-9442174eff2mr1120359585a.37.1793483080668;
        Sat, 31 Oct 2026 14:44:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4720:b0:93c:2c15:e510 with SMTP id af79cd13be357-9442174eff2mr1120355585a.37.1793483080047;
        Sat, 31 Oct 2026 14:44:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074666csm760682e87.67.2026.10.31.14.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:44:38 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:44:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add SM7250 support
Message-ID: <zmzl7btnsgzb7ywrescyvtuksu6edrch6i6i5euhy2ven7qmzx@xhgfspbq4q5t>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-4-159f403ec405@brar.si>
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
In-Reply-To: <20261031-dpu-sm7250-v1-4-159f403ec405@brar.si>
X-Proofpoint-ORIG-GUID: JMwyobFv-pvHrYxb4etGMXI6X0jTutlw
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae66149 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=Jal6vLO4qNuLzgKlUnIA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JMwyobFv-pvHrYxb4etGMXI6X0jTutlw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX/NYTLl++YyXL
 TPwJvCWTSq3oq5CNZXyf51cFAMgyP5qmcfKXN/Yxf7rnq/oyIMX9Uk2GdV+xJH5cCsoaBrfUwpx
 kXiYktxwpL8z8cAOpd4EIGVpcDOAKUo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX2Jb7WAgFGJ4X
 6caX2uY/h0szb4QvWWTNuMfqE+mx7j/0yVVBfeqA5cudVJYMPGsxQHMBKmmM9LFoXQK18MLHnAs
 xpqgKMaYqZJi2rzg/HbAU4frmBc4b6r9B0nBE0lUKpIuA9nUvleYz8D5uOcOH5lzV/ffnyDdHPj
 RU0BNifMQ0qZOmIafGilIvmG7EPM/LNsouBnbldOIX0uxQ1clbWwRkeeU2mqzPmSKTjOJKdBsui
 Y7O/gjwz+isY7GgY3oSD4hrKe1gDqllNhkh/R6XPAZexfUAKc8BBjn1jsYFA5FOX0FaGQmbUJlv
 2Jy9PQwfbCaYbKJsmTWXKKOZINPv1o9/D7Kjm5PB28DgMXkJEHGeOOtmaX4xAT0q9wXN63SERH1
 jm/BBiGuTrpnLnOtxpzodnytiaFJFW0A7lt/2UaivMpsgjXGAowTqCijWXax84daOowPeytMges
 632JDBRoNtjU+u2GT9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310086

On Sat, Oct 31, 2026 at 01:23:40PM +0530, Ishu Brar wrote:
> Add definitions for the display hardware (DPU 6.1) used on the Qualcomm
> SM7250 platform. The values come from the downstream lito devicetree.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_1_sm7250.h | 311 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 314 insertions(+)
> 
> +
> +static const struct dpu_sspp_cfg sm7250_sspp[] = {
> +	{
> +		.name = "sspp_0", .id = SSPP_VIG0,
> +		.base = 0x4000, .len = 0x1f8,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &dpu_vig_sblk_qseed3_2_4,

qseed3_3_0

> +		.xin_id = 0,
> +		.type = SSPP_TYPE_VIG,
> +		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> +	}, {

-- 
With best wishes
Dmitry
