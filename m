Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477160;
	b=jSXFx1PiOV0D6CdJDt60ZKd39VAebPExCk6s0jcazKfD7xzA8U8HBtEdKNURHDOrIcWb
	 gw247uOaoKD9mQnfi7kFXV7nzPtJS4tVn81yFKZ2SUJQy3fBLFFz+8srYnVLGgrduodkG
	 xpe8cph4829x4QFVopBbte82x6YqgSWRihlONXw0V2wdOqiB7WH1CKTeE9guMd14uwQD/
	 QoiibNSijiCEEYbshDQWNeCtUawKlLWyXStKwQcn2k8i3SWY6aOW2hnxn4hdqsqwpf7qm
	 HMbS7js7ZQ675Z4sY1hNVpEwkjtTFewF/1qHM8yS8Dv792/VEa81pwEH5LcSHo2aK6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477160;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pqZQfZiYxPSu/7WSL1QBG0oS8S7CYXTdmoMJsV2CUPA=;
	b=xRn9cquRVAQyGI1xRnUU8EOKik/w8QlIjnWRyTRuYynzISjfgELbuS2JaFHkvVp4AlVV
	 bWTx7OXA4WzM2qMy1uQt0iaBVZRB76IUJOXxQfJQDcSybTZvsT+SZfEngKhTslgGEe8LB
	 EsrFYROam+es0qsCSX0CTO8UuEJJtkooUpBZ1tEXMU7ffu/KUEmlR2ZntfPh2gpU7dQsz
	 72v2d+rKc0rXZQV36MBSxGWAuaR5PhNOYwYl6Y+NJ+VJuA2OAMELAyIf9K3uTe9o+ieB+
	 H8d+m/h6eY1xQJtCsXeJcjr4TeP14xC7cjhgLLnzGvfFawm2tA4EEGVGs32FL3hwLgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hmKULjJG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YUJRKQNP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41857606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41857606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hmKULjJG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YUJRKQNP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tPdK4178143
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqZQfZiYxPSu/7WSL1QBG0oS8S7CYXTdmoMJsV2CUPA=; b=hmKULjJG91h85Eb+
	MfL31RtrWFg7XMCJzYHN3/oRNN/AW5rGAi6phBylb6dQtxaCvE8f9cFiTN1VQzFt
	qNeSlf5/usy5Dr8DUUXUOFQdQU3wInGz6PUmIRq0TTvKWRJX4PEGpnUxXIxpVC5Z
	ifVzNSoAOq5T5HkOOJjtOVXEGHKEz5Fd9tHQdyq9hNglfK1L1CCTdYbqtWp87416
	cWE3HRY0iteBKVFC4LZiZwF0C8ysGu0lMhasaYOrxw1HlKDNNHnwxKK5NKLUyJIB
	FZbThnKBmEWocSibznkXIqopJ3LX8YpW2f6r1tuVaZw8XeF7AiKzdOA5vB87RPKN
	8TMIBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1412-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:19:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so57410085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477158; x=1793081958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqZQfZiYxPSu/7WSL1QBG0oS8S7CYXTdmoMJsV2CUPA=;
        b=YUJRKQNPqHMX6m0fVOCn0VGSalZiZGmaMFEMAwgm7Vi07cebkZXlffaPLSqxVAl2Nd
         LFUkVtTboYGn0SPopcNflP5zjKcwhQbRFnIfYX/cVLOqe+VYQz0MR0zB7SMKrDNJNOSy
         5Elk+u4i5Ph6N32q0gH9CUp0Ekvic3UxxNYOSCAG5yYYRwIY9cGKLMWS6azsNvUCyDAK
         F3G1N5SEpp2IekbMXMdxXASMl2diEqDK3iOf4Qh1WIZkM1cpHQTfC+khJc7KyjH1eaVN
         AIvVyg48FNsOMUkieOkB3aJ7djejXeR2dI3/L7epFJE0WF2tR4P6gjZEv9fTpKenMBLR
         aojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477158; x=1793081958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqZQfZiYxPSu/7WSL1QBG0oS8S7CYXTdmoMJsV2CUPA=;
        b=FonHyL8igebnM4/2e/P7U/eltKw4jXqlzXCeW696R25E3Tmq++iY636FtInbiF5Tn8
         lnsviLh43mdfYNTGlhxXhg6xmgMLktVouCuSnfGFwKoAVX6mHObneNMLXnID/TVs/HQo
         vmGbsA/NE4j6PMzlsVg459nPrL0kNx3h7Vt3lf55RuQllPVnTsbiDykGu+Xzntk6zW7G
         7nLoinLlQAl5MJcV38KiwHTZEkU3i848OSb9PrOO6m6p88am+IbhrZcSN9EuyPLfnDhC
         9aK07IHOXUO4DyHcZvkM9cPuOiS1F2dLpTIysZL4x7CNxNmg16IuOpYbgqcQYlDwviP/
         MV9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1wMI1Flsv/7//PKwKJalmAeqzt86glhPKdbMC9NKt2PoeVvMWxQdeHDIpqROwOINMHYa/RUfNh9ZMuFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjW76wac1giY61WWGwsnxwtkhmWBlgGoL2EweJngHm+FRb9Syw
	HS8JHKSG2DjF0b5GoIJeTvUJPsGJXjeSd36VIENb6alPIB4I7JeWK+243sMlWD0tnW5KWdRDP1B
	kof1Pru2v9jxU1vw50XEGgSVX0jHeMDydyd3C5rvTuSmLZnlLLpwUoMIqrGHpE0fax5c=
X-Gm-Gg: AYBFou1EiAkbnsaiiISsKv9jjCvfN2se/f0bSDiG9oWQlkiDao597eiwoKprVQ9kwMr
	CF66xLNOG5ogQsukI1qm0t/ZQUPoZf7D6gt7lhmhM85FELjL54MvUZdJ7f6/qGcqPgb6+KpIoV/
	PoKKl6KBlsZxSyK2/nhi6hHq0SiXCtXZgdYv5PV131yffnRjtlflqNWWXl6nZPJF/LIJWjxATmr
	4H50SBaJP1Cb6/xDzyBVNFaz9qQO5fpY+l/v86gS3qR8+/gpF+BUL7WXhS1ZYJ0tzAM7IA04gUQ
	yd3DqYRl3dJR7k6vj2GndtB6LlIYs0d0zaui47AaeVMoFU/HH3S/LNHZLF51+dcpcO6OBzMsmGL
	xvkOjhi+IRGLO3Bz6hm0wcA==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr1993128485a.3.1792477158424;
        Mon, 19 Oct 2026 23:19:18 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr1993125685a.3.1792477157890;
        Mon, 19 Oct 2026 23:19:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10ebsm448275366b.22.2026.10.19.23.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:19:17 -0700 (PDT)
Message-ID: <3dd32c54-eb1a-410f-8c42-9152e87ecb2c@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:19:14 +0200
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
Subject: Re: [PATCH v2 1/3] drm/msm/a5xx: Reset the GPU when resuming it
To: fabricioakio@gmail.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SLnsjFp__qMP1550HoR84E-Po9mppvU-
X-Proofpoint-ORIG-GUID: SLnsjFp__qMP1550HoR84E-Po9mppvU-
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad707e7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=IPAj4E8Ak8Ehd_2eMQ0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX/maI6niT9j9O
 Vgk1BCi/IrF/432dRtIM+bd8tyzoijxvVXr5QjexlQqTnMHB7Vl1UGygw446ldZrfoot7z7Vtbj
 KpN4DZgSprzRtMZUHxKpvwlZZ2Cns0VJRnPIObn8X6YH1m3ep8MNmIYSTS3lLWa+QSi2capsxez
 MN0JlfeOgy5A+GvgevGg9JJmViEbt46EKD1/AweL3zJVUR7B0OgtEk7B0oPiz+Tz4m7lyPIcRqI
 ouD1K5gThEFdWew2VWW7wsER+mg1DitmzD4gtzc8RRg5aodx3Fu3+lXVI60s9r5kfy633y16/1i
 O9s1ItNB4wySSvpvZOfeCBoTZUTWgZ4idjxytJIdhOSKF3HT028XQR25SlPVurn2XoQ1IS15Nb/
 /wx+tG8qey8nJ8EvBIXz6UFp1KfiAw1ujoGMBtGSwmkyvbmo/crbxSe7UTnJr5gx4mEL4shvFJx
 rYugN3C1cy1hulC5mRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfXyd9MLnCZYR3X
 y4peOWZnJDp2Y0T8fDb/nw0Ezjs3VP9gzloivH/XVNDjTg15D6THmgn1N2+c4qSHfRHWYMtZ9AX
 L9Nblgc9ZH4Wz9cyB3K+4PXXktLvYSw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200024

On 10/20/26 4:05 AM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> On SDM630, SDM660 and MSM8998 the GPU's GX power domain belongs to its
> SMMU, not to the GPU, so GX switches off only once the SMMU suspends as
> well.

This is because the DT part is a huge slop (artisinal free-range
grass-fed slop from before AI times which I partook in.. sorry!).
The ultimate fix would be to land:

https://lore.kernel.org/linux-arm-msm/20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com/

on other SoCs we scrape by with overzealously assigning various
power domains, as all of the power requirements are managed by
RPM and other pieces of firmware. On msm8996/msm8998/sdm630/660,
that requires a long chain of HLOS-programmed values:

- VDDCX/MX from RPM
- GFX_LDO
- MEM_ACC-GFX
- CPR3/H-GFX
- GPMU on the bigger SoCs

I believe Dmitry is working on getting most of that in order and
should have something to show in the near future.

Konrad
