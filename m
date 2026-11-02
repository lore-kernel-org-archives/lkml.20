Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615441;
	b=g1HYl1u//yI0OF6fwry9nBZBizGJoVop/XNWiNAeJMLomRCZO7P5N8nnhxEthc4nzL8C
	 YSWdeSM42FoEHb85+Y8DDuj1sobiH2Jhujh/7K2mARDmWgcx9EYiz93hLSUpr9lM/6opw
	 4Ga6pQwb2DAzG1nCEF+G3I0v9fzksuc9RiQCD0eRSsXFhAW0qYGa3kAfSUkiVKEDg9+k/
	 g1caWl7tVKeK9ctPRsAj1b+kLsFz7e/UXt0+vuv5lcfwqgU4FZjaHUgwmb7SCmHSSVfBt
	 qv7P7kuC5cUVQSXBUpFCB/cp/OmyPc7dQWO+EbiLh/61fAbuiWgz3Ap5NkcTC2eNl1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NzHFCCrQzGLsKI8/KQW7VhRBUvifYGel9dhS3AdJCd8=;
	b=oqyXh17nZghIFcy6yG3XkbUsRicxZ7SKCkXKiaefn8Emmj1VCiEd0a85RSgHKYEpN5A9
	 UGmRT6kJsgu/iWLeAtBgOz6ZJP6EAzQ4nozYcJbBNyiJEIFheRxWHCJC3chYnUnqDq2tx
	 OiLmB7Qw87GlXrR+1APmak+A5Sfp5rG2OirERQt7YAnlUW2HNAHDyP60HUsa1WwwDdeTo
	 xcizo7Le/eglhJON9qwknWZyF8alcfM8ChqTCiaLQXyLklRzTV0UHpLMInN90yuvVW9B8
	 QQbUg+nPO/g2FnmE2bMemMTrZsls4EU59hJetQngbznw4tFacX/yUHMrEhoz0hfI4zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T6Y9zr5j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MoJb6hjJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3112606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3112606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T6Y9zr5j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MoJb6hjJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B1al4015003
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NzHFCCrQzGLsKI8/KQW7VhRBUvifYGel9dhS3AdJCd8=; b=T6Y9zr5jzNmeahze
	Vk3VgX6HlfKPD0egTiQ+7G23C+ONdR5ejKOm4byHnPcPcdpaUIRJ5spqS2+kLqtk
	ieYaf4jOa2l/80Zb2YrBFIPoqRVwWTbi98LM9843sBEzbA3ElA4jMZHpcr74dxa5
	6PIyfMjTzQp5sNLUDJ1JHFvCYMehZbvVBRToC36VwFDUsncz4WvGSQEGhaERLzq2
	AJ3QiwSCGHblV11dK5oewoUoD6L2sSDz7x54aLg+AJX1pvj/p064Ey1l2qsWeR1Q
	xf+xeuVJc3N8AhZvl+D1tai07PnwLQW5Zn10hOwem3m4UTUxzrUK798omWAPwfj7
	w6syfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pk7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:30:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so48631885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615438; x=1794220238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzHFCCrQzGLsKI8/KQW7VhRBUvifYGel9dhS3AdJCd8=;
        b=MoJb6hjJb/P2CuFjZBHaCnGVWRS5KQM0Q8W+M24orFuLGymLnL6Ts0k4CgXIEjQ/vu
         yfVnc/liWIiQSFwTYAjsMVWnJpCfadCw39Y2jE3g0b4Mstp+Vyt2syWM1AMmYu4z5TCE
         XZlV4FnD6ET6g4vuFWcISNHfrcx2snmuteJhro7fwWfA40LTTVrOFrS+L/VwWFb/XZGS
         xXRJ2LEB3tkieFaMUh+zU6VSGbgr8H02pDCTrslRHvLsYTtJLCYmltTT+4vRFYf1Bxie
         TZ80gT1Xczx9qEZqnm/MNa9ViCYYlbk+USzVMbVoLehLx5c16rfPw2LVeS17aJiefJhx
         l+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615438; x=1794220238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzHFCCrQzGLsKI8/KQW7VhRBUvifYGel9dhS3AdJCd8=;
        b=kUj6knLXC8UzBVEu64qIhQqw0ULpp5ItTGQXovg6tbv6FD5rkhunRfdWoThTrzIxLu
         FGOFWyPOsnBbC6iiNdhHoHZdwUw3idhGwjjRFXyWdLZjfm0fGW4ZKJN5DedHE/Eb5B+f
         /OwDk1BSbKvI5M3S/ALWLC72rqzuo8WhvD2Dib8cfThML8/DdDVqGydI1p6YcVv2rOz1
         1sS6A6qcaZ5xCDIJGpTV/+KnADar2ob3o5+KDVO8tV2snYKwFOMlI61hNpkIK95xtaKT
         X3ihhel+Xwv8PiHI9p5omZyi8nUfDdC6V3h734jTCcZCBXd9RxkKDhVftVJlgs9pMBgF
         9rKg==
X-Forwarded-Encrypted: i=1; AKwUvByi3LA4UGlrH8FFZU/Oxlmyi7stCsneF/Ry+tmUZk4RG2fmIN3jd0QAVoeiIOXzI8el6bYbQojnAXUbRLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPfuyJP1WPUxA8IsVSHtgUVsoXW1JMcvrax/ITjtC8aNcVrd9T
	KGqq6AonH3D+jCNA4Js6TFE2ezwahoUfVVSWOD86yN35YsCBTjLndLkQ3Blwkd6S70k9RFBkByR
	IrLhH8wWVd5EQOWokeDQPJRgR4krkpMU8cOJMaxnETJh7QdoDKyPRZ6sZf8yVo0yF38s=
X-Gm-Gg: AYBFou2+dkzQsceUsO0re6A3K3+xRANxxK/PuK1YyIXnwbVdYwhScxtzHNnLW6juaeU
	fii8LxgpJ3+cXIjlGmItKHXvZC40MX+n9pXZ4CFwfO7B3foNnRTlRdtMb2ShRXP1MRj5MpALUqu
	cre7A3s2/G2xEWnsLC85jFejJqdNSgIBYKcIPl1IncmjJe0b96QB1JZO3uS8B7XfaZe0+c5Jd9K
	4iTfI0u3dXoAvX2ZxfVj6nNKevNjgzc9ZdUbbT3mtmvGHUveGfJvuJNqJCiCv5SZ6YlTuhphhj/
	frwTkKV7zWPCmMUsdBrhu1BJbuJzUOs8n8U0WhTuFwLQNhn7bY6SV2AysYaS7VbgPagjnujerzn
	oYtp3RGV8zDHJztGVTzRfQEMibwIXq9ERFaTflZNztY+utB/sosMfYAQTSvd9U5lD2e6VqnM=
X-Received: by 2002:a05:620a:85c:b0:93f:977:5d9 with SMTP id af79cd13be357-94421404364mr1648768485a.0.1793615438268;
        Mon, 02 Nov 2026 02:30:38 -0800 (PST)
X-Received: by 2002:a05:620a:85c:b0:93f:977:5d9 with SMTP id af79cd13be357-94421404364mr1648765585a.0.1793615437867;
        Mon, 02 Nov 2026 02:30:37 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174c0sm366006266b.8.2026.11.02.02.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:30:37 -0800 (PST)
Message-ID: <dd0d1941-485d-4eff-9fc0-6dc900d198d9@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:30:34 +0100
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
Subject: Re: [PATCH v4 07/19] drm/msm/a8xx: Stop getting GMEM_PROTECT from
 nonctx list
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
 <20261030211928.45761-8-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030211928.45761-8-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SMhBjllcbX78HzgfcRy72ZKbU_ScstXp
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae8664e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: SMhBjllcbX78HzgfcRy72ZKbU_ScstXp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX31voER0MyE2D
 4bNZuDE49U3BtP2hp3PJXuxjLnlEX0mZw31zBZgvOr8YZb0CeaF2ZaKuyifGnXT+WdqRi3VSAyl
 aODrlxU88znu5cOwkJutyQ8WKSrKBo0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX9aGnbNJ2lWcv
 h3c7MzQCbhleLS4Jo7bpkZogMhmWmkMQQir6pU5iftFAHHlfgmZlwO6J0a8cMsSx4gtO//upskO
 rQQa9eiza+HIurD1q2Ld4U2XJFpi07GbT24QHURhzqExTQO3zv6WX+QsRJMS4udaZ3yObAhr6BO
 e+YgwELDQNVZ2G+e5b66ZfSSIVAVxEzqz22yTK535pLFrM0O3tRsCVRrp4zd63ZMqXPlgH+18Vd
 xdkd+QYTMTwiq1+o3FK23OEr8f0ldzjonVUen5cMTOPDlcC5/9tlMILmVlIYdxRpNtoYAxrJk4x
 vOj0EllDY18X8Y2pJ0nXjpVA/AEPMLnKqEG1Tifybm7MXGvSS9ZqMatL/eTPE3Vz3itKSqnuRuI
 tb9F5AdjdT0LNybrWKQPIT/Xa2OQvpB3iavEqQ+DQ3Wd0SsVtteJRtoJVO3Wf2uf04l/6gXYgRL
 wendgfP5JIoNyNdR51w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

On 10/30/26 10:18 PM, Rob Clark wrote:
> We can just simplify things and calculate the value, instead of manually
> adding it to the nonctx list.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
