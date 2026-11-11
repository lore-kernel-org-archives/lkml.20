Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408101;
	b=WEnwfKbz8a+I+8GJ9faqX1NWwvGu6hBH63ZESHHQWxZkWmqd3FmtBGvvdleoe2L58iyI
	 sHmrnZcfBEFcf4eIJbbh6kowts4Sj+Mkhfsdt/6Dt/eix092u6NPpk8TZmWWbJltBk3qd
	 ftQIZhj8kFA23CTwxRncVuZhpywjr4gsZ3Dn9Yj2JwkcCynxF9ckYGEX5k1QrKjrWKvEG
	 CBFIKysYslrf/WVDHOdw1nIjAanjVUOX7XyEIiFjZNxp8JMG3iJ2yqQaduaOGSk32b2XG
	 4VW0WikAmkiHoYNztXlQG12YiJxxbASBGwY8X/lBD0Y/Oqex0NFPS3ZJN7vvnYdMe3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8+OTqyFIZNj/ZWYD70+Pj87lVYrEXWlE6vL0wA6fPK8=;
	b=PMP84/0sqi+jviR/RKs1LOa4SiIsR3XNZqdLyXbb77X/wc/aeE1iMFApPpTGnOmkvjTz
	 EpRzYKOU7qs5ZqyAwSb4T8L30NNkkd4WEROX44oHKWx7Q5faZHL2nceO4/rxrFjlV176K
	 wEstRG3tKzaCwlv34MUJaZEQHvBJJwuvZUUp/+KhnJwy5eGR0Mafdt0U+sA1MQaHzOHaW
	 cJDyHKlff8AXkgFb3IhB4ej5s+XpR08syxzNYfEQL69KiTy70TNfaa5jZ6W9vCJ2syjTs
	 uevI+WPuMTdItR9qls2dkIhngZSKmjO9krhDAFqiqimwE7l8PP/VsNo8NN+WxyIt3aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gkqcOOJG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VDpv86D/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03229606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03229606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gkqcOOJG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VDpv86D/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHPr02556135
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8+OTqyFIZNj/ZWYD70+Pj87l
	VYrEXWlE6vL0wA6fPK8=; b=gkqcOOJGotekbX5HXwO4LsrSjuKCl2eipTR1QVn/
	IUnciLmv/akBpXvAMJa96jjJVWZfwxMRAwc71XXQKyGZIiGkfTjLh7+0tAhRt1di
	jk+WXfzHezA1lL4SHlRbkgbHdxjNf6REBRNrM2zP5D4JTjednuaW/mQwNCYKc9TM
	oMiit/f6uijQlKgsPymmf/EWPYv4OA6GnBwEEdvT8Dpd92C1iblOLiUr9pC78sO/
	ZlB2GKN/xW7yRUmIN/Vl9nIZ2St1vq++/BW5aS6FOF2O9V1pkTK99wbq5GChEK4G
	r4GZ972YegkzaPU3SbZIQ3kQoUnAlZ8btDCtr08Hb0u+Gg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmb434-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:41:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so681684785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408099; x=1795012899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8+OTqyFIZNj/ZWYD70+Pj87lVYrEXWlE6vL0wA6fPK8=;
        b=VDpv86D/A0vMK5wRh6hNmAwWNTDvla08jM1xUUJVdmZQKIHLOMYwSSaMJ5UuOK3Zya
         YQJA+aywuVvVKv00Cn7lghxtygqxEJsnwWZ5NfZ2rfTtqzs5RL36QC01tlP5/Xn4H7EK
         NTevZsD14PoilmbIEzfiWjSJ47YGvaQr1u/udMJ1iH7XLeylBc0MbRHE1Zt0WginIb/h
         PVzDQc5PRitAHH8UVGlCbhWrRsNZxdGCynFY/13VGHMZA+51WNlMRderd2p3n+ny869C
         /N7CalEuiKbIpPisB6+wY6B+Z210zJ8YleMfvq5kQy7yWHlHbgTtlWybssLwx0x80hBU
         01sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408099; x=1795012899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+OTqyFIZNj/ZWYD70+Pj87lVYrEXWlE6vL0wA6fPK8=;
        b=Es7h/j9vxFL4cUiw09mehYvE6MQBksKlY0K/KoyxNmCt3yoULIpzc6h4GS6WAibFjZ
         rarIz/6ljERx46xnE54gV8jh0iAZh/C0H84Hbcnqy7Q9hBP661yiNkEmIJRJmX0y18Ks
         nrMFicO8gXzZ05irm7mwjE+vdbjRS8aPXs5ho7XxSa5ge6va2eDlBkHdx65ZJcZCoSWU
         nWqPQv2PnLHsntjVZnZASuv1DEprANVDvEiWKXXzVt2nycyWowbrPAlgZZPJJRWHbuiP
         ri1ZnGcO+rDcgoJl41+Gda3SPjsVhMDYf3y0GiHlmdbDFYSRGDp9fBo0erzE9UfjJunp
         Lksw==
X-Forwarded-Encrypted: i=1; AL+hErH+TlK7istxLzlQqwdDE5KCb9OP39df6JkeN6OTDxoD4JeOaH/WTwmDPo7aNt/+x8u51IZmZW/V9RfnaPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jeBEwOFoev6MpgFlGo2eRfQIc3WnfjJFxmCjI84jyf0l/xmDr
	cQAu4Et76czIhISBBrEmhv8UYudaM3Ol68Nib0peyJFdE+mvdXtt6MlW/PVC/SDm+SmarDxJDzY
	uKZc58v9IY9QyHQwxSFSusmz8022Af65VSb9UOJs39qrhooXDebbkpszgP8zoM0rVubw=
X-Gm-Gg: AYBFou3Om7k6UvbFNU+IE43+E6zI6qAMErMk8Scu47erfd+zHWvUE8EejcuXoD//P6J
	UiALN22hxdWpMsCjDZJ97digTBrtg72xICGNQJScLhktW9s+0QqnHYJHfu+nxzOaRdzfjaqjlOh
	SPwSzJS3yVuEGmB7oFM3QlOwpabxO1v1Sx2xL4qzHTQuYOEh2nEQjeWDXoFXHJy4friVKwHEY37
	gh2KVwLSscLTexI4jYikuosBBBiKTDV7RM4tEtk6LM81zziTDmJA1DOZ94nDi80lKG2vGNMTGww
	Gey09ufYIKWwuZQgaCDDQE7aVJ89fCcfFB1lFOF6iwjJW8UxAw7xKWeJmpzoNEbJ32Alkk0jsPp
	DQu++xieF8BnxB7HQKn6n+yIdDiC0b7fwb3BwuSKRJOsgBgJnQ9KCilsNlq1bUUHaknLVb1+etV
	tEvyGJEgLMkUv9aVbBlkmUCHVy26fHfBt94gu2hWstBkeqAtiIkot7U2JvL7tIBA==
X-Received: by 2002:a05:620a:4544:b0:93c:9d56:a860 with SMTP id af79cd13be357-947affe689amr432823185a.19.1794408099248;
        Wed, 11 Nov 2026 06:41:39 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:93c:9d56:a860 with SMTP id af79cd13be357-947affe689amr432816385a.19.1794408098527;
        Wed, 11 Nov 2026 06:41:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0926c65fsm11020011fa.28.2026.11.11.06.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:41:37 -0800 (PST)
Date: Wed, 11 Nov 2026 16:41:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v8 02/29] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <ebgbhztbeifcty7tlzwykvwcfrn3bwsktfyy63nu4ocvygnqnm@prggbz5tzmct>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-2-d040fb33db5f@oss.qualcomm.com>
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
In-Reply-To: <20261110-msm-dp-mst-v8-2-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SBLAZGag80s3kJU90euQ5FqUF3qRr3x0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX8PanfEAWeguS
 FNGBtyfUoTGg4ZLAVcFbAl5dDimRxWqMjHZBPAlFLbmQSgd3CoIUm2M9ehCd+p6TjQTY2FJdzHr
 yVjTNpUy/EbSFuS9MIApeoYvZ4uJxgg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX5Acj0Svc196X
 qePdaXPXm7N6XmtjxAB5oyJCOXPWWwHOVPuk8juyjuv4udbSZaA9jh/1ZOZ1OSsklxPeWyhnDmX
 jlGEY9RvizjOULRhepS1UDyV3moFBBBBKE7OMhNtAwm+w65ly/MgB9H7PKR2/DV8zhYTqU1y3cM
 sQrIK1iw67IDbWtHVH9BtCXMSdx+q86t4qGOkEl/b6h1Q+Vh7N4foiiQhs7n08sQBUNxRYTYjNP
 Chygvp808AZHDXd8HrdeqJxDmjDKBRGEebxM8RuwoPDEPNK/qH0cta3+B7G47SuVVelruUTeEe1
 JNs4chOwbv0Y6OcRRv1cDUuWuMd/9WlgRLjO4g6CUozjGoY6wWrv42/70EVY7yULFlE+APK6a5K
 4Mr1OOA+HFv/7srHSGVIKXMm7uVFhD7m/K/CcCa48LD5ngyQBQj6jOA4bO872YXbMvG2n2v6BW4
 mP11Oj/orBtfyued6Cw==
X-Proofpoint-GUID: SBLAZGag80s3kJU90euQ5FqUF3qRr3x0
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af47ea3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=CXPGfuEPe1jOflqu_poA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On Tue, Nov 10, 2026 at 12:54:23PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Whenever virtual channel slot allocation changes, the DP
> source must send the action control trigger sequence to notify
> the sink about the same. This would be applicable during the
> start and stop of the pixel stream. Add the infrastructure
> to be able to send ACT packets for the DP controller when
> operating in MST mode.
> 
> Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
>  5 files changed, 51 insertions(+), 3 deletions(-)
> 

Is Sashiko comment valid? Otherwise LGTM.

-- 
With best wishes
Dmitry
