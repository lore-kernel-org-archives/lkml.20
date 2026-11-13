Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545579;
	b=oB+5olsomQpTVzOOC4nXHVDMhzC0tXIvuBhd4alzbyaVTsBlRitieGAstKeVLiTZPsZ0
	 09JFdDgGV7QCfZFyeJHJ1mH5Z8onY50uCZvJSd0ngz/Qnhg1tvFmrLkLxLjTxKIJKgdSk
	 x1GPaJsuf0iSiB6mStLQ1npOz3GsCHfZyGXzZIuGWClWBqCqSFaUg7Xp+xrqqVZcvnDtV
	 TP91YQylVb4PZEDkrtPVDSb3TPRZcYVb9ktRrGXA4h0F5rTljdXfXX01oeGM/Qy4i+g8X
	 9hLAAbPHRpw53i/WRbZfniHODKZ4vhHYx6Cq00CnvQ0RubNaXtxHj1TtTuYusfzbzUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545579;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SQOyNq4wTmVvG1qOL+i4cjxIp55ug7AVmwSdeBhMIlU=;
	b=R1uXkwKfCnObsUREyaaHPey3wcZzycEJ79chxOsZwKNS5rgvfdScDwelTKTZgcv+zAPR
	 O1YwdOElzM3F3VpvxDKdf8h0S2IUrrVbPW5UMjxoBk05ZtvLTrVLHuMtgv3Ib+swsBmop
	 85T+qvMg50ney6CB9IVJI6IXGk0T2h3a6Bzb+e8BEoyz99Fs1FTAUDSYNdm9pU/BJvR4l
	 COYwU6qq4zd/mUmMxTlUX3J4z8qwnBj4mKIgZ/Iv7FW7oFuuxn0+V+1GXrXuCUU0NxPb1
	 woej+Z1Uno6q50p1PAY+wwKP1f8bDbc7M1x77JIjMQs3Y3YLZgxiCp+qg0iHglvfHPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6dQD+NG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVivp0c+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35020606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35020606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6dQD+NG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVivp0c+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K1LN4120084
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQOyNq4wTmVvG1qOL+i4cjxIp55ug7AVmwSdeBhMIlU=; b=W6dQD+NGeIfbalbg
	fBXP1uYaB4rbxVX4V2s/40APqNdHqEZ55y2yBpgduq8h12Ecie9AUadWDYVgM4Ud
	h8nZNeDdPZI6R6uTnuUL7wzY5biXCfn/qtXLaKx0U9MuaotZUi0rmtYpyti9Ag8Z
	M3NwLxYgVNZarjrp8Xt4ML9bbSLBc6HllPp65eLVxZTKWGxdzS1XHOUgWAkRrZ+b
	tE0tCDU/bVCrsnpjai62L9R+ytvnZ1vfwn9Htl0uUctgxNYZzYfzwmzx3/8sbU3S
	pD5PmLq1qmU+2/h3TAXdBdvWNwyjNVaO3ta4LUErbYkRVnTCYe6BYrdQi3P7Alcx
	jVMMbg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx33fn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:52:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so442544a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545578; x=1795150378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SQOyNq4wTmVvG1qOL+i4cjxIp55ug7AVmwSdeBhMIlU=;
        b=BVivp0c+KqRu0CY1O1zLMqHhRs44NWrPUOCkD0aMkwOAplU0kkDGEZPZ+hoyn8LTJH
         8nEmQKepVCVU2ci8HccgC6D4P9Ye3SDHqTYBLrmDmpGtEoNTnb0FdpQZtEc75AVJwQ/t
         wqgJYMXHMyLoytDmTIMvoUUEXzErR5A/XSzBT3lJp+0LAMl9xxACWig3Edzc+nRFsiIW
         Djn+D5QLPqEgqQwU05dpldLg6RqOxzgSW/9uuhEwkyAJ7LanbB/quE7KkH61M73TBu7Q
         5cUx2YLMpVc5EYrVP+esE6gQIxm6Y220V9b8aFkS4sp0yQ0kkBpBJmCj1C8gSWQcqGaE
         kaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545578; x=1795150378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQOyNq4wTmVvG1qOL+i4cjxIp55ug7AVmwSdeBhMIlU=;
        b=2v5jp9V/CxvSh0MrA3vANtNQRukNra+JUWPpctiA1W5/g9j66TU0MWVMRN44rdOWx5
         nIZmVtiMYBBK7DfHQMRnMhwKczia8LSa0gcgBC2C3G5sSDRLIfrxR1Nas7RqYN/Rc3HQ
         uR8QMEwIduRTlM2CSM9TuVymCRbZnzFalvArQTmYlu6e5B6XKoumx4+3WSakOoRzBAZm
         FopP2HGe9VvFUfbbsJ/dfE0N8zG5Nom8PFCvkQjMx+g6gLgDdgxeoAAnqlYoyoT37rz5
         xjD8aoOoT/h71wGzisqIMcRC9zvX6EL0+BrUQWtjGwzEDZobc/NgeexIcBaJ43pYFt/n
         Zfbg==
X-Forwarded-Encrypted: i=1; AL+hErE6AOYw53adUkYImMSiVIdk6SIuloXpdYXrxdJNH1mvrpLeP4lh/vpoRwu/dD28g5pcjLXUWHnoCQLqOfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pBUHEd9giirUibxGYPCUwc2yCigIEIGAehALPlKGRbtn3ZEtY
	shdB/XtoADYQDbVlurjBTruYVdB/VnqovOMlscw6ypEHyEkzS10nYypsEZGd+4FUG6Yq20tsMYo
	elmmLicIM7iBinZC67nEzkwfRSj4sk7YfPmjG1t2n2ko9g8QFAmjUAojfTpTBp6ulgEih4JLr41
	0=
X-Gm-Gg: AYBFou0UzOB8ACHA+57jh92+SgCglDAf140NRIfoqiKlDzOVFXt/IzGf8hAnXLJd2SH
	bR887b0cUKEQ9DFG1M3N4dKrR4uyhVf8IclTK8j1AfGoZ+9QDlqmM18iCF/JQW+JCSB7Iqxz+hZ
	09yL9WgGyMIDvjsw6DQ2JDtkoYC2v4pPnaYhEVMeSpVG4ult3CxaKVHNyWCKUCN29bpwGS6hFkB
	+2VHQ6a2M9zx61BuXG55CnPtjgIHCYubp9jVpq9PdFvloOZVPykPpmTkDmREUuRMds/64DUx6Su
	cO7ksfZ/JT3cuephpYcR5pcMxYun7Rk5gOA/eyF67dXddZzYEO1Qu3mRPvYn582auYIWXqrULKd
	lb04g9LmAEMTwVL3+aJcq2ZboDR7c5gZgu/o+GSAu/K8WUW2rgXo+66j7MZj+Zg==
X-Received: by 2002:a17:90b:4e8f:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b1b0b53e79mr1213798a91.49.1794545577763;
        Thu, 12 Nov 2026 20:52:57 -0800 (PST)
X-Received: by 2002:a17:90b:4e8f:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b1b0b53e79mr1213777a91.49.1794545577299;
        Thu, 12 Nov 2026 20:52:57 -0800 (PST)
Received: from [10.204.79.100] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm2343811a91.10.2026.11.12.20.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 20:52:56 -0800 (PST)
Message-ID: <84eed340-905b-43fa-9c63-135401920e5f@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:22:49 +0530
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
Subject: Re: [PATCH v2 2/3] drm/msm/dp: Remove redundant force_link_train flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, irlied@gmail.com, simona@ffwll.ch,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com,
        quic_mkuntuma@quicinc.com, mahadevan.p@oss.qualcomm.com
References: <20261111104434.2222182-1-naidu.nama@oss.qualcomm.com>
 <20261111104434.2222182-3-naidu.nama@oss.qualcomm.com>
 <gfzdwaeouexratptiktpzodi44x6ztsfttqajzr5wxtrluyqjx@axwlv5jlakcc>
Content-Language: en-US
From: Naidu Nama <naidu.nama@oss.qualcomm.com>
In-Reply-To: <gfzdwaeouexratptiktpzodi44x6ztsfttqajzr5wxtrluyqjx@axwlv5jlakcc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af697aa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QtFsyhEtc1s9TALtjxMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX9Z5MpRjQr/pt
 32IdvRqP7M6KntpyuKGXt0wBef06ZLox1xUAyYl4YsL/XFUog73KXK2Tc80009r8hy8pSvN6P5Q
 UkrXAJg2pUTc2bvRoQ0dh3wygUCvOl0l0D9OX3WlO31lBq9FIGBuXFJUC72RfAF1mv98n+zrdxb
 un0SapvHRbFjV7qe9jNzZYGLBU1WTQgEOe9a137BKi32/d/rZuiUU5k2jBJ3pEHW54KpX9FAIhx
 dnRH3zQijaB4y0XPlXy/VN4iv9uT8pIka5jMoXFnp4YWWcQVep1CH2TA4+0hlE1/pKYwAUlncXN
 ujO04iFiqEZEaAqlSlOp4JVrDKoB5gx1nMtTciU5k/Sc50e+ZxTKVl7GREzcibgIT7j2w52Z9Gb
 UC7xvVReoT1+dfgMJwX4Oy6XkSZCH0dxHU8mVWJF+Ax6676Jg46pqhauiTK0NASgwc9DBqu8sTg
 K24dzbaOPc/GcuxbJkw==
X-Proofpoint-ORIG-GUID: 8qf67yGlRo3pUSiOSrTpYezPN1PyWZ68
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX2ZqIl5Rt6WA8
 k9jBqTTZRgTMmsIhqfFOrnmJt0EYlwZmKRSbwG1TN5sC4nPiOTOVy/E0c7EEWi5EK5seaHKW+RH
 f7YPCNX8XMtdSj45rXf/KkqkhiVVQuE=
X-Proofpoint-GUID: 8qf67yGlRo3pUSiOSrTpYezPN1PyWZ68
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019


On 11-11-2026 19:36, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 04:13:54PM +0530, naidu nama wrote:
>> From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
>>
>> force_link_train is always false when passed to
>> msm_dp_ctrl_prepare_stream_on(): the initial link is trained by
>> msm_dp_ctrl_on_link(), and the flag is cleared before stream preparation.
>> For active streams, it is never set.
>>
>> Remove the dead flag and parameter. Stream preparation still retrains
>> when channel equalization is incomplete.
>>
>> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 5 ++---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    | 3 +--
>>   drivers/gpu/drm/msm/dp/dp_display.c | 4 +---
>>   3 files changed, 4 insertions(+), 8 deletions(-)
> The same SoB comment.


Sure, I will update in v3.
>
