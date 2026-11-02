Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624593;
	b=IvSMtHpKbg5cQsTTbiY+WEuxVWQlnbdUi4jNCyN+IhORs4fC5vnG76T/7/Qz4e7g60BV
	 s01poC16J1g3tr+WIdQWNFP2RK+CKOf1YprSdnY5gLkxUjTRPjBnALnnehjMsAF0FjenN
	 omoemTx5J9i0r4evJB2czGMt0RRvVOGDwN9GRM2LsLnQsP9eUjbeWfzj+6WqV0vwyVPOw
	 nfy6UcSwFR5WhExE6MwvibKpZeaLEXPKL6FJIoHEV5guMvAFR83fNBiTf+uHJnqLy/xZG
	 th4214l6SQzvJpcmIKzk8muFE9wM9eGIxr8tnW9YLxhJ5gPJ5ADaQubdl+KLwfUzCuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=;
	b=nJ839tu61+0fhwt9VNf0poPJ7HTFVOJl61ssZLjOM6nY2wDAgTfro+Hyu8x0zcNazJxH
	 QQcBA9+R3wUD/0/hQkvcgagkK6FVX8eHmLMchSfXXyUOxuIA6aoeBUwIHSAIG+udAhF+f
	 52ti6J7D88BO2ppQwU0i0hRw+U7MRcUO2UWaxlJGR9isoXtZ2bKsh3a+1tuj4NCIW+cYu
	 ABNaMxMcoK97h6I7OcOn9S6/TWeU1WRW6Syk3E5A0uvyMc6WFNQPjw14KGQRhRsGJuYmC
	 naAnzgiH4ACeVn8QjCjNO2Qfim1Vuy9Y1v5zBtW/WHTBF0x3T5nf5Rll3nHIaWnbvjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYVjH4Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzzdYjpy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B97460A2605
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B97460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYVjH4Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzzdYjpy
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2D0RWu2337723
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=; b=YwYVjH4ZysaBu8l4
	1s0nZo+iGjK+TUj4pKtuAYIgm2/oTd9cAZnCEL4/aJ3SCEY/bVs/r34GqFyhhDtp
	kE+HM4nuJAUnHGyB1n0J6SXPgq3yzYIdLSmt/DkJ+T1gC3BQsG47UfIs3rTpJOM/
	5jAQL7jqFSR/0nSwD+nc1UirHLDAlQtXcr9FWk1GfPinRIlawK7MsGKhEwfmUKSA
	dAQdl2CwFaleNszRvUFQjup3/S7IZXIVMB32ZADWZkIdtm1tNMWBpVv7KNKXSm+C
	C/KpfRer8MJDWFk9C1SwR1VPXBBjMbiiFOBvmgiq/yB2NbTHWtqUEGocwvSR6aWE
	Q2ddTg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hrub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:03:11 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabe7151daso90701e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793624590; x=1794229390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=;
        b=UzzdYjpyi8EQyQ8p+Wmj2QfEc5ejaMd7pDw56iYCFDciustdqBC4gi9eGVIzRmumwK
         LENot1NnvkBCTAhOFcnyr04eYJPnaAmt7CGIvESHeAfN0GB984qubQeDp3hYz7QED9ZZ
         ob3UQf1zFfwFoxofgwddyoRBFo1KJG8cKZVUmz2Byob2vpKFbBrFRzbbMw1ea0byHj8+
         FIMHi1dx0TkP9SEW0MWAyprhTq9AgNMllrnaYtHo7XpSujRIp6n+XkJVcRWX29jTOTr+
         3jIQ+TaWua9qI9emMsPfN9DI+O9IWDdS4urNkW2PJq+BSehgZ3S1VnQOUQnzhS4hs/O8
         8DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624590; x=1794229390;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwDvCUcycop1taBMmQpXpaVGTG1WRnAIuw6p85hHgWM=;
        b=RxcDB1j4rUcSVIvAHvFbdTXA+OJeDbIrYHOf7TP54aux3ov9ZIqNIAX7pzJ6Z7niRa
         kIEPAaFLK3PTjPFKsV+BHRWgJplNPFMSMatJH6t6pPCpZ6+wi3j0J4PGM0JfD74BHFgr
         VD5HuFw+t593pR1jyYykwHxkaxDS480VpXhhkizZCouQsUteZvLRF9RYUWoM9VVfiDqt
         ToEij9OCK4YxyQtTBRRlXCPEdeWqkDFZXmgO2mWjQ3hISTUF6YHzTgEhkSo+SiOylFrY
         Pa6oczLPLiEdYXSrO0UeEzejOh7FcUYtvYRltc0dZeYHRlT5egFwej4/giiiqjARNX0g
         u0YQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUmS//sE53e52wlg5KLjIoJi9rTaQutbFjQJPLxxlNsXI/LncFOLhNeY1d2605Vq45zaKF62bWxeVRFzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o5tDpdZ8UdJAJP516w85JpYJ1t4qRwAiBP4r0l8797dAu8NUC
	LXNn01ADrbwh7YMB1Ll4Xs99KgEd/5Xf4aWG9HiO/U5kWWZCCZDeiJEA1rlTV6QSz1I4uKilkcj
	C6w1TbIi7HthlWD2lKuzH+CqPyn6QM6Ae8UymllX3oaG/d5T8GkP61F5S1QmuLjSdZAs=
X-Gm-Gg: AYBFou1B2DYoDJXY2vL2cnN+cWg+yczyvwNomH5zNxthvvFnqMekrKhCMjD8LRXb1uW
	suG4IGwqfjPU1nKDLunmnjx/XTdlOtADCzdb5RqFE9k+tDcwg4zkikvwcMV5Tv8cJssFLszk6nq
	7sFfl5ZzsIYQ1AJO4vXCewAHe9ou+k62BgWfRtdZPpeg58EC81d0kbLunwdXW+6yJ60nxB2l8kr
	2FcRYvm8/GDx8v8GjzanDsNi5Jaoo4RqoIo7w3RWG+6u/xQETF3eyWCkgUwvK5L35O9dPb47RRF
	DFagNlDvw+gS2WLOQdL54+SbEWRtJu77OUvAgtcfrmyyaxfuLG1oml75+Dlo9ZcuEF2o5OjDldi
	gyAJbzM5hRVCP4QFThyerXifl9UO5YXhgbhbtonitfsG/KFrMgMF8j5TXnXcJlKyPTSPtqHE=
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr4388734e0c.5.1793624590348;
        Mon, 02 Nov 2026 05:03:10 -0800 (PST)
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr4388694e0c.5.1793624589652;
        Mon, 02 Nov 2026 05:03:09 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072d19csm1698389e87.40.2026.11.02.05.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:03:08 -0800 (PST)
Message-ID: <14d63775-3024-47fa-a495-60351c31e6eb@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:03:03 +0100
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
Subject: Re: [PATCH RFC v2 09/14] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-9-a21a5c850961@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-9-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zb2eleitQWgX5G-AEb4tfMmk5J7Hs9K0
X-Proofpoint-GUID: zb2eleitQWgX5G-AEb4tfMmk5J7Hs9K0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX8Tvj5gmpsBLx
 82osb3CX6sjR42loLyz8I0WVTRHDwNgn9HLu3MVnW9JlY44z6EHPsXDqTTgPbt20jly9De6n8Tl
 dIMd8uumK31bkww5wbky2xRuakB17fM=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae88a0f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=km2EZEuaMOR48S9SEsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX5CrhXpnt17KE
 SwkCMZGP8i8hrB5i1mY9u4VU1urfRYD6dGi8poc4ZFz/FxNJAaoDXy0wXcw8eU6k6hvo9gMkijc
 yFKQB56jGXvJJxlpPr/LVsWB+H+YGHkYu5J3RgT7dBOa3p7Cmg+eeYcb+juW1MXytob9ldTErXx
 FEvQ0hr2xu7kWuP8cvpNn8NM2Xo1cgzvy7TuR4uozNkOaCRlkPL1u+vG+gTZTI79DqpsxP7OA4z
 vlWI7KQuIPId2GmKtCsIgYb+yEMwYm3jP4fCsEyNqcReYU+6NgErnFfzNP1wB44fbps8tHeinbn
 G+MMI3SWF9GRNk5MUN78xq+r37G3tH2X/KLHVYwN4aflqMu3L4ts/zz4nJOlCeyaZWBpNOpqFi7
 awvBrbuBXiyqfN5K7afKvOD3HBdY00iH8jNMRLgq6xPoli3QPeZBCfLcjYz86dMPmJ31OZheL7Z
 aJBpXqQmLNCVSG1cl+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020051

On 10/29/26 2:52 PM, Anna Maniscalco wrote:
> Program all the register needed to start up LPAC and send initialization
> sequence.
> 
> Additionally, now that the LPAC ring is live, make the code aware of it.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---

[...]

> +	/* *Don't* send a power up reg list for concurrent binning (TODO) */

Here's what my robot came up with

human tldr: missing the listed registers from a750_ifpc_reglist_regs[]
and a7xx_pwrup_reglist_regs[]

LLM:

The strongest IFPC-specific suspect is that LPAC setup is not
fully restored after IFPC. The series enables LPAC on gen70900
(Adreno 750), which already has ADRENO_QUIRK_IFPC. When LPAC is active,
patch 09 programs several GX registers in hw_init(), but adds only
CP_LPAC_PROTECT_CNTL to the A750 IFPC restore list.

The missing registers are:
- UCHE_DEBUG_CNTL_1 (bit 30)
- CP_LPAC_CHICKEN_DBG
- SP_CHICKEN_BITS_2
- SP_LPAC_CHICKEN_BITS_2

A likely fix is to include those LPAC registers in the A750 IFPC
restore list and the applicable general power-up list, so their
initialized values survive collapse. The KGSL code in this checkout
has a similar pattern: it conditionally adds LPAC chicken-bit registers
to the Gen7 IFPC list when LPAC is enabled (adreno_gen7.c:652–660).

Konrad
