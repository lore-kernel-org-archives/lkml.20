Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416188;
	b=nWS2kqBQ7vp6xOunnIsbc5yaJG/9tf6TVZiRc2L4WMdmRlwPhV3/zXRcUJRkPK38x4tB
	 Iw5rZDrCKWBmQ0jNqpMBc5T3NRoPR/30kr0W4wS5bzPl73u9ZMT4ZLDerei3wjOTkr1Gb
	 7Y85gW+ioEJgb4wwVa39TdibG9x/H8Y17kGG025lBu5URhmgRHAS9+F8PSdP/jpwaa+8u
	 wdBNri7sMVveiDdJvdGGqvnuG+UL5Wgk1wqh0S0E7QwJFoPYK5MOTRrleAZaOZEjaNm37
	 Ej+uYex6/sPpVIS/rnIs3yiTY9q/wUaCcwX/Rd1KJAahDe9X/x1mWN9UChP+l49a0jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6SGhToZVDBAmY0nSnfy1kLVZC6LifvOaMyucd4yV+pw=;
	b=EcTwi2mXoIFGz/NCBKTnBjKwFomxg08rQeyM3wWIAvKNG5kkx9H7sCCJ+xe1AIOSnnfU
	 AXs6DTLbcSvZysjFuAakiy9P5dgtAipw8X89KvmWlISttYdaB9uGkbtg+uPXomhQO1bhu
	 ejwZi/Ys1l7Q3CkipiPWQN0tAX0d69mIZLDcNuev2rMxMnJgTePUmSIA5Vk9m1It92psv
	 T94W/BT1xjcbdu/WPjhehBPmUh3WH6vLSWP/sakh3IFzZGEvsR4aa2/W4JUB9VDuu0rzQ
	 rT01nFhYV9UNq//EW59+r3LrIOFBTjXpmT0K1s0DRBqHX1Azf9L9d+HGvlTrVL8bFnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rdf41SCB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RFFN/9aa";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D011A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rdf41SCB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RFFN/9aa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0do62594211
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6SGhToZVDBAmY0nSnfy1kLVZ
	C6LifvOaMyucd4yV+pw=; b=Rdf41SCBIoPctfV9yhVogRIBhB1lPP41gPT1nb9i
	DQ4s1g2CBe17SzoFCoX8njivuVdDVVwNq0dA8P8Hj2+OM+E7FyHcyXdDVLd5WjYw
	yMGzriAL+eBnsZ2aU+BgmOjBnLkUiQkeU0B36OahrEL9h+LCWItm3uYpemidFq6A
	A01FlQWo/98RUT3/53wN4Bc2j0FxMKlVEtbzH8itRqys7IBPUawypb4sNWWu/6SS
	t0v8jFFI4H1Sgubjs8cA5x8c6QQlwmMRVEFyDbYaXqG9k2PwcKfF5nSJC6gvkgCF
	M7WRnFUH7eva5QPUXhBFst/i0iOsloLb0/vn1tCQnLXbxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksma7pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:56:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so690548285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416186; x=1795020986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6SGhToZVDBAmY0nSnfy1kLVZC6LifvOaMyucd4yV+pw=;
        b=RFFN/9aakqSJylb+lUhryrSeHlTqRjBRFgSGUKPiwWn3eiiQpckStxbSIwPxkakdek
         wnTayVI+3VQI+SVy3nN56sBkuvCnakhm7EkR6Y/GDVKVTDnEm0dAnZ6K4KMQMe+uot1I
         2PAMR4TmyswT3psN12sSmdFnQ4LmRVssmJj+YqPzb1AlGwHoZd9nrtdfvX6b7GTBEJ5O
         O+d0laDY55kSbyRCt4icKODpPb4wazZX+R817+FOZlqXV9y6hz7pQnRcu2/LU6+sLVEK
         5dXD1+rvtZsz8KPznEtWRG/yBZCemPMBQZzqhmMqkxES8cevqB01biBJJu9PTYCHzMXz
         +5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416186; x=1795020986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SGhToZVDBAmY0nSnfy1kLVZC6LifvOaMyucd4yV+pw=;
        b=RpPiJCTJa9OxCYz2KFa9HCvpdRFOTl++7KdTsOm4ACmQJ/Jb4hAewINxzYkwC6xad9
         MfIpLajg9x2uV8yTOU9pvO342nvaOrPStmwPV5qk/Bi///2Ak/lu6Tw7ED4NikilyVF1
         FEHAoK+ZvnObg5XPqz+2OSa5FahUtkHbHT+N38zZlJHQ0UeZz2R1x7a+5yS3hlUfIWe+
         JrKNWbWuUnhObT12MdfkA4jgJvpY0f8AXVqq1NJWMoBMVhTJ4TbIOaB2P9OGFK7Yk1Tg
         ZObdW9lKjDk6+L5TTF2Vd1Vggs/DHxwKSU7T6Vix0jkLutBYBhMu/9qpWQOx0q+Vd6S5
         DsFQ==
X-Forwarded-Encrypted: i=1; AL+hErHSg0l9hMisnJezBqYqak1jw+Yzt1Ac0E5hBBk1xyQj0Q51zIIPck3WoDzAETwmCLZvU035qMn4OihPZ0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tsn2AhK98EaiSMEZEVtnZ8WnYt1qx9ItdaunV4i3h16+k1Jcr
	KteyxIwwMLXVJmpZ+HgNDqsThQFrDBXoDLi5zT9j/8j5diz6pTTVtr5Zp0fTr8UecQld/lyGMNZ
	BLnKqUHPuNFv1gv/uxd4xBo/Y8AFpRWR3yLZQLuLNq2jIpeBYyHeaIKOemVjb896x9NE=
X-Gm-Gg: AYBFou1vvxxDhtQ+pZBJ1lKm8f9Z568n3nHd61qJF/77ZVtxbZS2tWiQjNqXgJM6o+c
	Fe566YTEMv4DXhgJfShBk7N00Jd5+vL9TJsVpgpQPFFwf+vUM3lk7iRrp3XgLiXgMC2vKZ/VjdJ
	u71v72x9k2o/OrjMexaLk1X2ne9mBXikMzp7RU4Hyo8QNB71TzM1LZgNSnvfta+I/XPXP5BEO0C
	dOM06SJrDNcoY/eUdV4v3pYbterT6YHosjWlncEiBBdP1nGd7/4arkBf+u1r/UdFoMTcsvnjchE
	fkkXce2ixZEL0+NFCR7YOIMO0X/NYP8lVGFJj1IoRUKFuiNXsXVFiPmKazACO8SpKAoOjWU62RO
	HpN0odp9VxWOx7CvbGFiyyNEJDmP0JYgPOgpQoBF7l/Pgh+jRzQZpa8fswrmUA9N7XQ+wSU7SlW
	1L0Dkifb7Neh303rJaNz6PwWkMEzjjQn4QfmgqSnMVR4HTgalnmBUdVRVWO3PTCg==
X-Received: by 2002:a05:620a:2890:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-947afcd2adbmr501041685a.4.1794416186045;
        Wed, 11 Nov 2026 08:56:26 -0800 (PST)
X-Received: by 2002:a05:620a:2890:b0:93c:7a5c:77d8 with SMTP id af79cd13be357-947afcd2adbmr501036785a.4.1794416185561;
        Wed, 11 Nov 2026 08:56:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157ba5363sm1085381e87.27.2026.11.11.08.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:56:24 -0800 (PST)
Date: Wed, 11 Nov 2026 18:56:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] drm/msm/dpu: add source split order op for DPU 13.x
Message-ID: <scokoairkxrec2i5p2puxjbdkog6p7eo5s7rmx6q74l65rdd2e@c6lgdbvjgam2>
References: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
 <20261010-pipe_order-v1-4-9d8bd29fd78a@oss.qualcomm.com>
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
In-Reply-To: <20261010-pipe_order-v1-4-9d8bd29fd78a@oss.qualcomm.com>
X-Proofpoint-GUID: h_san5bIZXr0JKKqI4_wZc2_o_R4x5uL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXzqkwc3HLLbjC
 IUEITWhfjS+bITBcFc/6IQYpsoFR2oylu16V9bdrR+Z3gxrWW0cuC/oQykv87yWvMxSr29DRdkF
 cf2GLVS7o+4/mA+PaA5tAnV3ayYPRS260E3HsY2velXjk4qhl0oMOpWeVjPmymbL54KqTvyL6Qa
 UDHRRO+qhk5NIndN2zSfZF3EXwNaK13uYNbRg9t915tb0aSKslvvERgF+CmODCnUFVvYoSdQg2j
 Ojp+/lVS4eOfQxho/9+TxC7Ig0w/qBc79/MoatVW2Lf8R/z1Sn8bKg//z7UVvYgXit43n8VZO9p
 FuoKBjyp1YqTNVbeUWDdhMuhTNhqXmkvNWqOCetZAzLXz4y2htg4mWBWWEvIKBMsAvDun3OrngW
 zD4ZbLrD/BG706J4WOqMdgXHaUoUDwiOtvY0G7YPacCGwjd/67v1KnBRvnaAMDW6t+YnbAMmZdn
 mKqjOm9+CAfQPGuHPUA==
X-Proofpoint-ORIG-GUID: h_san5bIZXr0JKKqI4_wZc2_o_R4x5uL
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af49e3b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=XSFdTqI9Vx7Z9g5_j8UA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX6CLLjWdIMwjq
 VfzgVkCLU1NyZdoYAHhq5sH+DM5E3qomgqtzjxbooFYJ9ACAkWWrAj7Z22xI8vJAqo3MoRt+pJp
 eCqiFKvsnqCGNdZkA+sxBBI4tgparpo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

On Sat, Oct 10, 2026 at 07:08:24PM +0530, Mahadevan P wrote:
> DPU 13.x places the SSPP op-mode register in separate REC0 and REC1
> banks. Add the source split order operation for this layout, using
> the shared helper to update SRC_SPLIT_ORDER in the selected bank.
> 
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

This should come before the last patch. But as the fixes shouldn't
depend on the non-fixes patches, just squash those three.

-- 
With best wishes
Dmitry
