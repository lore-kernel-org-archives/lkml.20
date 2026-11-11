Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416885;
	b=a9TqxAZN4hYseXzylD7rNsukL0MyOsSTsMDZ5ytCDkERTDiSe0q+SZgvIb/CrtEyBUfU
	 IwlfLTlqwrsoNEo4o3O0ZPTFEcqRbaX/9yphkX8CMEumkzJTUebRljAbEpCns1PJ+jdwI
	 JfIxz4Q1MhNneCYlIvVGcqbsAp3BglVz4FJgqlh7YCIAY9UdC/urB4RyCDHEDq4Myi6vH
	 Xn/SOdeXBwlXeSukRzZXyS8J8zIaJgWncWig79jmZWaJ3sYmccUq5lgSeSMxpVU2jpxPU
	 x6efWiYqJQakc6jFxoHPL336W1wpXeu/oQ/kL54f6oysZ5z15V+gz0C4WRzhgRvr96Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SxOyryHUbNQ1cfTF9VQJXNM+vPgoGOT43gQa9xsLuaw=;
	b=AUHRvshFLOrjfvoT2eQ8HGDP5N62kcMxmtvbNswPIYycPuvQ7+tvnUoEZbbUwz9tuNS5
	 JmKzIg4+C+5xRirlLnUZJDPAo8Hfq2VBT0Tm2pSZt1R5XkFx+3q6CIM2Pk5eQrQaco7GR
	 0rWiOho1ZIubrobRVQ7TvvxbPCk2ISeZrL54cBaOjeIM8k9uK5aW268AbHHXZUpvX595f
	 VYW4/jvFoVg2fBTR4P8paRM8UF66G7qnZKBj6V94+veoQyu6fglXPEpYzmvXvDxFvxX3H
	 3rGOlJHkRHKGJnjHooH1qBA/LkDgxinWUbqCKNscEryrqb/aWxy789NzKGWn5eQzqiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=olqaZRkW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ed0k7dhz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA457606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA457606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=olqaZRkW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ed0k7dhz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF049C1665502
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SxOyryHUbNQ1cfTF9VQJXNM+
	vPgoGOT43gQa9xsLuaw=; b=olqaZRkWfFlPRoXowPqT2XFofvzN3neVvYgeoSBN
	Lxo20Iy4WVfIsO2uFubngpftOURpdv5pxZlHZzZUWx17E+TtF987HAPafaDt5UYE
	MqiSMwtvs04WOsgZFfpFisIvG5+yr0PEQF2xxc/OKv+zut9F3pmSG9PrqrDUL6sh
	gPDguZ94O4EPkcpn6RbEpA8r5X3LF9y5lQccmacDKiTFnnXgWiITYxBwrsblsRiS
	TLBORvlsAug49jzlqHMgQoXOigI7FFTxJOi2QxeraA3NEcB8FCnwOjHdhAswKkmX
	E+0snCgosVKnMiWyC6bq9qgE04sUAKoGOIyTYrZiMKfH3g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7ptbud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:08:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so841568e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416883; x=1795021683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SxOyryHUbNQ1cfTF9VQJXNM+vPgoGOT43gQa9xsLuaw=;
        b=Ed0k7dhz88d6X9Td71sEFOEwEtaG1YQG2r8ZtVvt+i4raqRjDSrIcxzw465dJ8Fh2G
         s8TOr/t9ktNRs0F2bV4n+EKTcjpp0h90A+bznV1z24hkPlOJVBm8t1mrH+nQUEnNe89O
         ZAS5Hcu1CfbAtfoQE0K8sCU+REu828TnayQw4PvCPO8s+s6/KPa74Gv/arJ6eyHf4agi
         He+pLevHOlCtGW+jBxWLdHtw7osEWoVD6SHcIZNaJSExyQz6RsyhMkhnxPNUfONpxh05
         RufA2Fz1YJzqjzz+xewb4Q56A6yGVW8zO0g5ALlqq1bFwBI3pY14H1gMEJLjTSf3FkPm
         ZeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416883; x=1795021683;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxOyryHUbNQ1cfTF9VQJXNM+vPgoGOT43gQa9xsLuaw=;
        b=DuNZCdeG/h+MMo6J2cvf2Pk9fK9XWsDGgr9bNFcZl1OkvTO0UUgs8ie42t+ZycoJzk
         v+Z0CWy1euODj9bgYtlih6K9TXBDuk8cjhdDcJ/KnBBS0DJViTRR/ebyYOsYAPbk+pCo
         mlKN/z9nv6k1W5gnpQRAyv9qNgleYN1G6YVGrSs8kaPXC3FGubscwwZA1wqyOsu1wtu7
         iH3y1A/+fbVOPSq0y4b4URoUVlUVzmjZCjJLZJxGu+bxkO0xCj50ExxbvSA5D5uvZtU5
         yrt7WrV2IPSA0AcV2eJEL68VEePoG+jRLEHDCtIt5XppndNJSdd9YXNQ0u4lAV+J9HR8
         7YqA==
X-Forwarded-Encrypted: i=1; AL+hErFueWoMigzY0LufoGMsIbG5/FzniLfgZCmxjiZLuX/pIpviPiss0oMNxL04cOi+CHPiF/4xWbrlh+SzwyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9biJf3/qJC8QnmFXr63lQ2NuLQr6Cey318yUiPOZ4O2cs6E2eZ
	LbrHZlj0xUmj9zrHb9coIse2leciqt2YEg/rp5Rpcziq4oiBzm5b0fatvQ8rVmwXySeXoOYluiS
	d5cHvwjCypugIfp1di+n1bK+pdhPooiSOR80oGUJtZmZRrSwq0TFpkz1EupNiW05cqAo=
X-Gm-Gg: AYBFou2M/qmASZGWSFkLSIs6ADVj2KkKFk3tgHTuI9WM6lKaGARzTc67U00A9+d7nBJ
	gYrOwXsL6L14kHJuZ0wgN50FpjGWaB9QbD5+RKsdRUH+/NjHjxmkuwqmw4C5pcZZwOxTDdgLcM6
	r0f0aoX6CO2FP9YHI9RYh+F1cMtmDCF23ZnK+cDQyswCUuk9Fw4jfcy3Xgp+XvUDfuIIjgcEE2J
	xJUDf3PS2AOkz6xIQCqpx8rmF3874twOubrKn4idkqEQJrZdZyFzPuwQYc0qxy+gTEdwElQjLsb
	Q4J7JO93tQaFT9zxwrCITzlx0iH0ownQbSwZ4WlwKGnAhXRqGQb3N2Di7HoV5N8qLM8o3S/CjdA
	ZCm7gQ/zdY77n2r1/GoCnBYNmnzTSrYSM1xnc9U8bRZ32WASqpNnkHYd+VkvimeK7/08EfqM23r
	nBGSJWnCotXX14BNe/62G62e7ux2V4tb5VD6AvEuEtYxiKAtkhOtGFHKjJlbXaIg==
X-Received: by 2002:a05:6122:17a9:b0:5e9:731b:84f3 with SMTP id 71dfb90a1353d-5ee1c3fa04dmr1120666e0c.12.1794416882333;
        Wed, 11 Nov 2026 09:08:02 -0800 (PST)
X-Received: by 2002:a05:6122:17a9:b0:5e9:731b:84f3 with SMTP id 71dfb90a1353d-5ee1c3fa04dmr1120632e0c.12.1794416881748;
        Wed, 11 Nov 2026 09:08:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae09206aafsm12751441fa.9.2026.11.11.09.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:08:00 -0800 (PST)
Date: Wed, 11 Nov 2026 19:07:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Kumar <vk092kumar@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/msm/dp: allow eDP sinks without DP_SINK_COUNT
Message-ID: <wuuyudiqxomceind5f6yox53db5w6y75rcnbgscxujvv4cmnya@iq5522yhs7o3>
References: <20261019051441.2835682-1-vk092kumar@gmail.com>
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
In-Reply-To: <20261019051441.2835682-1-vk092kumar@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfXxt227xR4rDC0
 oNCt1A4G8XZpOj+BdhKslolZIhJeVp7grsMeu03uqEyLJO8AhIvkcnC1hmnxJLjhq2S6ycmMc+o
 3t13Xl4LN73l+gRUGh6g2BPAypzKXmc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX5yFyW4AcsFnK
 SB09c+q17Ls+DXMH+So54JrW3aCurKU0vm2JKVyYExJnAXDmXBS6gJkRSF0CvntXrOMYj6tNSwH
 P/w0mFryzfSo9Gbd0x9Qcc5oF8AUTfOzqVf56jnCOnwNRNHL8pwqMmR1DvsWC9RcsGA1/lvkCwW
 AqlJSR+TGaTtdMDSko/x3PPuqhipVmZ6xGXo7UOLa62OxA6cCTLU7HTDgVRQads0hj+5DqMbauR
 SQcqySKyigE4oDUB2hag68zUqfi2ghLP66f95tR4aiySlmD2DS1KxE1hW9eM8ira+VjRS5DXFWk
 dhWZyczFRHoWcLi7kXNH7U7bp5msXfmFaRJ5KfHLeniSpfcKKZpXGq7YcsrFP1wpnM9N/exiIBo
 vhkxwBj0FidZVQps0pjybrNm5m7DpZ8wxD/1IRkbHaQhHPf9jC8uObaalm6ts+KIlXWQLXXO+0j
 DRrFEsxAiIpmPvpAgbw==
X-Proofpoint-GUID: CqgyUlMG6OH-Bt7HbsxcOs7ek_OwAfdp
X-Proofpoint-ORIG-GUID: CqgyUlMG6OH-Bt7HbsxcOs7ek_OwAfdp
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af4a0f3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QhjrP75uP0Re7qhQPTAA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110068

On Mon, Oct 19, 2026 at 10:44:41AM +0530, Vivek Kumar wrote:
> Some eDP sinks, especially fixed-format eDP-to-HDMI bridge chips with
> no downstream AUX-capable panel behind them, do not report a non-zero
> DP_SINK_COUNT even though they participate normally in DPCD capability
> exchange and link training.
> 
> Treating sink_count == 0 as a permanent disconnect is valid for external
> DisplayPort, but it breaks eDP probe/enable paths in
> msm_dp_display_prepare_link().
> 
> Use drm_dp_read_sink_count_cap() in msm_dp_link_parse_sink_status_field()
> and set link->sink_count to 1 when the capability is not available.
> 
> In dp_panel.c, msm_dp_panel_read_link_caps() still reads DP_SINK_COUNT
> for branch devices. That read is left unchanged here: the sink on the
> tested board reports DPCD 1.4 and does not advertise a downstream port,
> so that path is not taken.
> 
> Signed-off-by: Vivek Kumar <vk092kumar@gmail.com>
> Assisted-by : LLM
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++--
>  drivers/gpu/drm/msm/dp/dp_link.c    | 30 +++++++++++++++++++++--------
>  drivers/gpu/drm/msm/dp/dp_link.h    |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  5 +++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>  5 files changed, 36 insertions(+), 11 deletions(-)


Vivek please check the issues that Sashiko pointed out.
-- 
With best wishes
Dmitry
