Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406977;
	b=PwvsL6RQcrNksQbHFaUAbBk2E1MeGDb55fonXs73G7UjKdmDHEtT6kOwu28xERK6BXLg
	 W+03IYO6qnyqEZVtMXIrAQWLR/lXOz5Y3UhLOVsCZaoJ6l2exGGvcBK4FC/3ocAwR0JHo
	 Ut/eJjFYRtY8GhOtwIxWyQ4JCTaCeEso2ySoP6J77Imq/zpu3wbroduKJINrqnJUNI7aE
	 O+B8CLJTuCTzz3vaEsjv4Wbok3cnPhGhishxL/G7KHotNxUoHypVCsK43FVbpvsNXybU8
	 8nxOg6fmOX8XwyB9gAGTcxwxT54HV+/nafdr1UCYgMOn5rAgc1yuNwdSfoXn9J2vhiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ysdktN+OG/bhbACTJfJokpiJlx6njf29pO0caat3PyA=;
	b=zp/5PVvYymzysFf7kY/y5YCzFVQWp0SriKkFF1wMRHCnYe58QrD2Mde6Yc9ZZ3qgM571
	 HhuIZrKRJ7b/wwOmgay0m9UNS4OXO9MZaY3iFxFwxuphNoz9ALIKGi4MF6QrbJ/dA3zB1
	 SlDFIQ8KXA5kcL2e9cV9+asfASHdtcpFykokGLYxpnfeugwPTfkjrIVzotwJ4WdCtSy75
	 FNqguRLab4pQLRWF72VexsfzncT0VAcGO3sfErNPCEewDJBF7Rssk86z6mhCqtCE3+22A
	 U7RnLs8oXJR/FuxDovhXdo2s3mIWfU8E/zp+44yNr77XaYBQbMR83lUp+m5dXVIftJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZBUrBT7R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L6vUny99;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7E606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E7E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZBUrBT7R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L6vUny99
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEKDlb926525
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ysdktN+OG/bhbACTJfJokpiJ
	lx6njf29pO0caat3PyA=; b=ZBUrBT7R7nChmFfL9Em+yy6bBU7MgIeRY4sx8I6Y
	GSVnyLaYeIcWg4E2yHxRVRK2FCxWDioeSVErJkNJfrB614anq0bOTc/Fhhq3mZij
	X1Cz3lCKfPmxU8nS3Q+liJd0QeSNLHWg1zbd7kY/jfZH8Jp5qfOw7gSwxYWRx+2F
	4HBytILd0vYxWnG7SYzrY6/HCQi/98emI2LOSaTAk1DFes88E2XEd3Fj0G277cIu
	JflNyuLVcAK4Aqn2a0Zs8uqL3YFGxpbBqjvdcCFQiJ+p5MY8L7Zb+iiLvQJMkVwY
	p187A3E+ysiJrWPPm2qgG65r6vY9GCb5zxBs2L1T3miXeA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33v70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:22:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91eb3a63064so69229776d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406975; x=1795011775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ysdktN+OG/bhbACTJfJokpiJlx6njf29pO0caat3PyA=;
        b=L6vUny9985sJLTWdjHIJYVQadVJKN+dl/DzW366ZRG5/63UczyiBw28nzjQ/WaAzOK
         TqQ+IzKLe8RkL/zW5pbz0XyOAPyVFQEIJ5gc/yDKL+zGtX9T+kCnoGaS9Xpssu9DSvCd
         NZJTyk9SeldGA82be5IJ2qLRXCuFflGw5ma4QRQGIiC/jCTsvfjZTEEnHZxMRw2lRWMg
         eA6cKkGO/o2F7OTA3sLufN/RBsskuLshl0VXQbQXfOsFhwdFACa59k3/IVwpRJtRvLsj
         1JmQEYDBYdKiwrqrGzBbCTCQ1pxQhKVcWiOX+VL/l4PzpZDVQiD4eEuqBHpK8O28LzMe
         BZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406975; x=1795011775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysdktN+OG/bhbACTJfJokpiJlx6njf29pO0caat3PyA=;
        b=25pHIGcXfIa3nQoImO+e82gZ28Qvo2h2dFLkdITdVMYYbMPScglsvlgeE1bGJfFngK
         P1RI+YNzht8J3r/fzk0xgEp+A3BW9K9MnEjVp0/BV5d4yvO7sp0Lvi606FCp9yu3JKdJ
         T2iEtXWhFus5dwTeffiwVaJxNGFWdpVDI27KQin/TOn/QD2zJs2thXB61xKqN2o6cWzk
         Yy6fDBTM0aoH+xOJGk+62tNyAdOf5/d1wsZHXZNHe4PoW2dUZUvc4lbrHcIhh+Ipn1y8
         nQPe4luQ9+6Hsn4ykEV/QbnrSnL8AEq+QHedlTfl0yT4EsOa3RY+csb7GRPhFFokAzxu
         VZLA==
X-Forwarded-Encrypted: i=1; AL+hErFa/o3E/xKPu9+5Eba3yddONFFX6uQzXvWGSNm+4TKr50vazq3V82+DLYFmyrOWBJ7TZaY3bsvJrcfW8Pw=@vger.kernel.org
X-Gm-Message-State: APuU4Z++ZbpUzMsvmgUtoaN1m9VT/qRAdyJYnlJvKQ20eZoQCBnpg3Gn
	hY1K8LEEffsbA2bF+bfASlc/wyLptoKBB1Y1xyvc18n2cXuM+c45V/7Z6o8M3xCbjI1y1wLuHIP
	EWbIVcBnDn1NLE4mSd4+kMg2I1YFz0533JU0TrPv3PmkjC9LedjptnbksOtpwDh+oLFU=
X-Gm-Gg: AYBFou0fenfqsbC/MNKiC0JjPvbw+7B3g9ANI19caFy3VMhMLAkXhRLwSh2bOmRbBbs
	9yGvRaJMQTndmm3dNxWV9DxdK5spMqdXizMVlalmKEYMvf8kSZacFT5wc5nj43hqfHKj2IINeVN
	mKmdynPTrIIRByxrnRuyQSVqIN3GgNVc6MxPa9/44KJCoyz77A9nizoLI7qVjYZHzlanGheAh81
	KHHLtF82p+CcDnvnHzSIpeNBC+OsIBZ0/anHPvh1Tyd5DHa1NVtttmisy8xNcboGNV15V3w/DL+
	Dn3YKI2p7V02/enMqWr/YmiYYFKOhYIhETuojOBGO2U27pjD0mCDNt9DnACJSDPx1io3XxhRkxV
	GmleriW3OEyBsi2g+Oy7QMGMGPC2tiBcSPnnEFlDsW76etuik1uKi+Unmsmdw+JX8nBkPU/QzXg
	wBRp3k9mVP4MldjIvdzaF/DhqLgzElo35oKoVvchcHUcOd5EMIeNJ5KPTF52Jheg==
X-Received: by 2002:a05:6214:20eb:b0:91e:b57e:5426 with SMTP id 6a1803df08f44-91f04016859mr40853836d6.12.1794406974464;
        Wed, 11 Nov 2026 06:22:54 -0800 (PST)
X-Received: by 2002:a05:6214:20eb:b0:91e:b57e:5426 with SMTP id 6a1803df08f44-91f04016859mr40853226d6.12.1794406973772;
        Wed, 11 Nov 2026 06:22:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae091739edsm11368481fa.1.2026.11.11.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:22:52 -0800 (PST)
Date: Wed, 11 Nov 2026 16:22:51 +0200
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
Subject: Re: [PATCH v7 13/35] drm/msm/dp: add support for MST channel slot
 allocation
Message-ID: <s426afxolcgqb2pf4e2xv2s2g2cpn5minmubt4dcpwtcw4dwku@cwznffsa64xb>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-13-4b81473185e7@oss.qualcomm.com>
 <agm7esy726no4u4cntecmllz5kxdtxaue7xcn7vdhkuh73lxau@r6mqybgiyl7f>
 <ab5ebfa2-9687-48ba-8403-186e517126d2@oss.qualcomm.com>
 <jwmtxurikcc2qsahg4rq63earm75puu46isd5du2s6356oe6eh@7umfzpxmoebv>
 <661383c5-41c5-495a-94ab-ffd1b99d7f9d@oss.qualcomm.com>
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
In-Reply-To: <661383c5-41c5-495a-94ab-ffd1b99d7f9d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af47a3f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=u6R0oCwwweFeSL41B3gA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NyBTYWx0ZWRfXxp2au8kyQCpE
 EWH4w/lIM39WT29Z28OTlpr8BnDPsJzyFW5KTGX5rSpoS6TZDaRqqxQqf06spKi0OVokl2vOn2U
 02dzFmbR4c7OwSMIv3HJAzDlwNuoECyGEAUIFWACgsIR6TKZ7fot7dAUOMvCjJLrceBbXLXKmwk
 Mt0a9xF61IQj/NE9CiuV3CPrRWXO8mEWc34E046iZ0yakLVzVTFL9lSP8P2Y+Okajytu07sNwQe
 6oyKp0QWRiBG6lBwEwqqd+oTw1Msrc5KCykfZ5glsM+3whwDgO/QIHNcz9tgndIoJyVF7DyU91Z
 RXkzRWIeM+zMt4hNfVRp6WFemxLBwt50JzH3m10w+48ogAdIxtcAW9fh2FRr++LQ7J0pIgzl4hk
 YHldSQPWU5ogugFvyE2DaVw8MlgmVYawB8qQJnlLY5HBBxkcivnPQ+L+FvQM4iPIz1j1862j5Rb
 Uob+hDHJO5GJU9eRhCQ==
X-Proofpoint-GUID: A9CF3jIt1O4VDBnQ_hZAAxY5Bu2lMWQB
X-Proofpoint-ORIG-GUID: A9CF3jIt1O4VDBnQ_hZAAxY5Bu2lMWQB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NyBTYWx0ZWRfXw/noFwrACn9H
 S0S1eB2WKZ/meAnWln3B7cMR2JWkykLeOSbCU0Z/b96ICQjLc7J7+gqBphmbKHt7GrO+smwFe1q
 D0tBV5lM/1FsDs1RF7ULRyR12M3Y/Ks=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110057

On Tue, Nov 10, 2026 at 05:40:07PM +0800, Yongxing Mou wrote:
> 
> 
> On 11/9/2026 3:20 AM, Dmitry Baryshkov wrote:
> > On Thu, Oct 15, 2026 at 09:24:52PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 10/1/2026 6:52 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Sep 29, 2026 at 12:25:37PM +0800, Yongxing Mou wrote:
> > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > 
> > > > > DP MST streams share 64 MTP slots in a time-multiplexed manner. Add
> > > > > support for calculating the rate governor, slot allocation, and slot
> > > > > reservation in the DP controller.
> > > > > 
> > > > > Each MST stream can reserve its slots by calling
> > > > > msm_dp_display_set_stream_info() from its bridge callbacks.
> > > > > 
> > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 187 ++++++++++++++++++++++++++++++++++++
> > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +
> > > > >    drivers/gpu/drm/msm/dp/dp_display.c |  13 +++
> > > > >    drivers/gpu/drm/msm/dp/dp_display.h |   2 +
> > > > >    4 files changed, 206 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > index 929e0f94f8dd..02732bd4efa1 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > @@ -83,6 +83,7 @@
> > > > >    #define MR_LINK_PRBS7 0x100
> > > > >    #define MR_LINK_CUSTOM80 0x200
> > > > >    #define MR_LINK_TRAINING4  0x40
> > > > > +#define DP_MAX_TIME_SLOTS 64
> > > > >    enum {
> > > > >    	DP_TRAINING_NONE,
> > > > > @@ -119,6 +120,12 @@ struct msm_dp_vc_tu_mapping_table {
> > > > >    	u8 tu_size_minus1;
> > > > >    };
> > > > > +struct msm_dp_mst_ch_slot_info {
> > > > > +	u32 start_slot;
> > > > > +	u32 tot_slots;
> > > > > +	u32 pbn;
> > > > > +};
> > > > 
> > > > How other drivers handle slot programming? Is it something to be shared
> > > > between the drivers? If so, maybe it would be better to update MST
> > > > helpers. Or, asking differently, why do we store it this way? I don't
> > > start_slot, tot_slots, and pbn come from the MST atomic state. The MSM DP
> > > hardware uses start_slot and tot_slots to program the per-stream timeslot
> > > registers, while pbn is used to calculate the rate governor. Therefore,
> > > mst_ch_info[] is a cached copy added to make these values easily accessible
> > > to dp_ctrl.c.
> > > 
> > > Source hardware programming differs across vendors. Intel does not
> > > explicitly program per-stream absolute start-slot or slot-mask registers
> > > like QCOM does. Nouveau submits each head's allocation through its NVIF/VCPI
> > > interface, while AMD converts the complete allocation table into SAT entries
> > > and programs them into the source hardware. Therefore, DRM MST helpers can
> > > handle the common payload allocation and slot-shifting logic, but source
> > > hardware programming remains driver-specific.
> > > 
> > > Without mst_ch_info[], we would need to construct a temporary complete
> > > allocation table from the MST atomic state during stream enable/disable and
> > > pass it through dp_display.c to dp_ctrl.c. Specifically, this would require
> > > extending msm_dp_display_enable_helper(), msm_dp_display_disable_helper(),
> > > and msm_dp_ctrl_on_stream(). msm_dp_ctrl_mst_timeslot_setup() would then use
> > > this table to program the timeslot registers for all streams, while the
> > > current stream's pbn would be passed to the rate governor calculation.
> > 
> > Would it be better if the MST helpers provided this table? Would it be
> > useful for any other driver?
> > 
> I don't think this would be useful to other drivers. The table is indexed by
> the MSM source stream ID and is only needed because the MSM DP hardware
> requires an absolute start slot and a 64-bit slot mask per stream, as well
> as the PBN for the rate governor calculation.
> 
> Other MST drivers operate directly on drm_dp_mst_topology_state::payloads
> and don't need a source-stream-indexed representation. A common MST helper
> for this would therefore have only one user, while the hardware-specific
> translation would still remain in the MSM driver.
> 
> In the next version, I've dropped the cached mst_ch_info[] array following
> your earlier comment. dp_mst_drm.c now builds a small on-stack table from
> the MST payload states in the stream enable/disable paths, and dp_ctrl only
> translates that table into the hardware timeslot configuration and rate
> governor inputs.
> 

OK.


-- 
With best wishes
Dmitry
