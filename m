Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D23A9616
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269706; cv=none; b=CYcs/fFV6vlYHtDxGpkI3lr5H2bEs95d5ypbwsr6thGA4n9BkumDgu8q/oLcOgfQxLiw4P/1qsyQk2Nd9FFpB/bQ18bkGBHGxo1fOAHaXhhUrUG599cgX+4LhrUuz30wjzCT2Y7DuLRiuIbc+0Seukb227GWefCLkyWepRtibPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269706; c=relaxed/simple;
	bh=PO6QmvWw5tooHxTBe0FVSvZPcF6IIIGrweNRM9SJDOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZfZjMTTWGu6+u0lduV8exGgXg5wtmmFySpcgTuYUSFYxYfAZ1LbZxwPL5N/Fw1DDss4Z8OMz/t5uGRQG7zlZRLhnzvZn1xkghIpL8vurHpbP/O9/SCMncIlk0dhJG0/uFOpza22+cUn6+PPrWeRb0tU94zlCc08EbdSF1K/7Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biZY7E0c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPKsEFlk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biZY7E0c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPKsEFlk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e8CP4103502
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 06:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+E5bvzyn0WJx+xO/nk1xNk5AmRTXIMMVOaScAhU1lU=; b=biZY7E0cLXydbwnt
	HAtCDEkLBIjp3vbjMmVivvMQGR4Xf9dDyFeZf4CBlS24L9O3BdZ+VJwA98VnwUTE
	dA6wph3grtzc86fLfRfNM77d5VkSodAj2kCrWha/wRWBj21KUiVCNxg/pMrSk2av
	rQLXsDxRUWdOVHsANAWoOcRYHmfIdcJXI2KvAJzX7Nks10wshtPC6qaPZnlRuvoi
	WApay7aR2+IAovZHVDIAl8x+FrS32xp5IYP4da3r2CDUsXKROUYL5E/+bp3LWMzb
	DbMe6ZCHyD2EYBSg3HmlkmaKJHcT54Mks2BAJMJmhSguANpFz+vNg7yTMnbgMPh5
	HT1U/A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0ad2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:55:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c0bad5eb7fso572083137.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269704; x=1791874504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+E5bvzyn0WJx+xO/nk1xNk5AmRTXIMMVOaScAhU1lU=;
        b=FPKsEFlkx8TnAWUIe9PVNR7Zv+mPZpZfpDEkp3dCmYpZz/VnHzAy6jXxwF45tc6Ln6
         JHYNugzZPu9znxUyAP7PUwL5tKIUZJm+H/D8L5rGCYpRrgQ3O6F3GIF3grnVqRxvH/h8
         I2I4RrwDfiiD9cUmbv4M3AbqVxMBQb7Fd5Hud5O7zeo7/TwNW6Um/khVFlI1R+bRY0py
         HT3x7qrC9ao3J3yYc3auxb0+cPghS63ETn7XlA9g391KPJV/Qv5cgaAPptEWHNF2LqF1
         yjRLqbmB38FLC8RqpoZIWECUS4b3BTLtxvN7gWlotkAdIRhS/gemXrC588UEcFSYgXe8
         Cpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269704; x=1791874504;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+E5bvzyn0WJx+xO/nk1xNk5AmRTXIMMVOaScAhU1lU=;
        b=BUICo4bYiMlyQxs6j/r87uXQLZfy0C2y8HkeFICxftc3+mDjiq+rHfUDCoP31LJHuf
         SLJ7C8MHuAlhX0GyiRU165w93h31S0bFqBar9BAdtf3VSWKw1fvhLVWjORiWqopsnIPa
         tGHT/lnEe672pTUe9PLFFcFDYYz041ConI+B3aim5hxuoHJx+oPLwxzW+2cU048vRLhF
         O9RA24XuFHu6tbMo4BOWktwsvH2MljJ0hoMGRTjqMWEBghB85t7/aFqFz4dnhizud766
         ybnYVFCcu4rk0aXBPTLf81xmHoYPPG5YLiTv6U0L9uxRNKB5teMftG3k4w619UTZ4Bhw
         jlcg==
X-Forwarded-Encrypted: i=1; AKwUvBzDDby3oGdqWnr7SMBfrpDrS4PfCf4s+ii2k2LoLqmRJEYWrNy6Hy3vBnaU9F9iqTRH2TSquRn257QLXeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuFGTQlOy/c/2vOpXC3AwFN0p4RftZmm/55NMyJiodb6E8g6Xd
	bgPIAA8fkgoR6vMpRGX3U/yw7tMahMiARCba5dfxFgjyfc+Ym/y7PbFTMddOA0HI9qpvFnh8sCK
	Kfvr3bb2Jm13gWlpG4DZQZ9WpkgMWwvZwOvcB8xLYqJygMvpNVk9pBqgJyPUIqQg6pMs=
X-Gm-Gg: AYBFou1JiNmiHx9nAcDXDTRQ4WuKUcr/jILFLyhS9r2DgjnnqelOy9pIGnBqdvoQpUP
	dTPGvIRTf5J5zyFX2w/X5GPhhUl3CUI+Bt7HWezAg3P8+FbUdUEGjVrDnW3PsT+JXZT2zI8yYux
	zYYUMLwy/nvrbjpB0wZxYgGVMSsmzVlBYuSGS04o6quGrcSqinaUHmDbz5YZdRpMOOPk19Anegi
	hqnDMlIykshVUPKVJ+prxTo83BQVW81jlncp+Yi3RU6ELQPmxHkc/oE31u9EIGJZ3mxC3ffJ897
	z3fdxaSjydrn3SoKpvBF2q/WFg3z65UJYBz259u5PljQVrUyqRmJt6/edab2+UpLFc6G1UlNDkf
	DCqPMO+ZFKMIwSjWC1LhaHH2VLhqQI63aApGnNm7jocywJ2ROKdHr41gTb/w+n+aEvQEmJA9/a+
	R/YcnIetVYFLp8
X-Received: by 2002:a05:6102:510f:b0:7bd:b263:14c8 with SMTP id ada2fe7eead31-7c245cd99b1mr2427436137.30.1791269703701;
        Mon, 05 Oct 2026 23:55:03 -0700 (PDT)
X-Received: by 2002:a05:6102:510f:b0:7bd:b263:14c8 with SMTP id ada2fe7eead31-7c245cd99b1mr2427421137.30.1791269703136;
        Mon, 05 Oct 2026 23:55:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303fabsm52162651fa.21.2026.10.05.23.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:55:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Joonhoe Kim <26rote@gmail.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: round up the compressed INTF width
Date: Tue,  6 Oct 2026 09:55:00 +0300
Message-ID: <179126968608.1110179.1395537655224906644.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261004102758.84436-1-26rote@gmail.com>
References: <20261004102758.84436-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfXwefYCV1XwmWa
 fz9uT4VK0SIyDf32Gs7Ps52d7gVtk/8+pYtnF0MWqMdDmC/iVRtxlvFXiPn8bnWfBMXrEkaZvcF
 sXW5aOr9Ji8e6YXonrKsIqIlt2Na7tMHvJ0BUHbLUvJf7VN9EtjJ8OP8BlnWg3pTXhDqU6foyck
 AZ3ZI7BW71sUlCEzRcsxEx3zkWGpcjKA3MGP6P6j93tFieKfq9rVS5hz2BB95nl3FCiJMqhXDtX
 56x0puvePk59QLT8peyE8B5n8kA8+t3EJJyCKp2fLHyhXcZ/dQWHSGarECh62KQUNQUlVvO8GQo
 TnTuSoRqgucxln/Du+a8QQ+gB3MJbF7oBhYT44Spcn0k6zCa+xz/CtJr7INeBaUtxBjEPFngSH7
 zTO0+NezN01IUEi1vs2VzH/pP1NBvAVi1yqVzdyn68JaucFgS7p0Pe3xIEVZQqdjT4aud49JOjO
 ImxhTOeaCZYHvUCzx9A==
X-Proofpoint-GUID: yW_rqlHMqM2E-M_jtLpubLzreBA37iuo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX+gTdbCWUE2Ak
 4ylDfV/uxiB7qC3iiaxtJKPBb7UGYvL8elvar9k+yjSSI4bKko/n04LDK55+raTLjLyDD715fKn
 sGX79h7En2r0Qx54PCkVlLWp5LRw4SY=
X-Proofpoint-ORIG-GUID: yW_rqlHMqM2E-M_jtLpubLzreBA37iuo
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac49b48 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=y2x8obCdhefAC7Ej7jcA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060027

On Sun, 04 Oct 2026 19:27:58 +0900, Joonhoe Kim wrote:
> For DSI with DSC, drm_mode_to_intf_timing_params() scales the INTF
> active width by bpp / (3 * bits_per_component) and rounds down. The DSI
> host computes the same width with DIV_ROUND_UP, both for the pixel clock
> (dsi_adjust_pclk_for_compression()) and for the active width it programs
> (dsi_timing_setup(), from bytes per line). When the division is not
> exact the INTF line is one pclk shorter than the DSI line, and the DSI
> FIFO overflows.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: round up the compressed INTF width
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6b93e8b453fa

Best regards,
-- 
With best wishes
Dmitry


