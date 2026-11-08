Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165658;
	b=GdN9JqPQ+JUd6iKweCsptMkYLX1udQWbPa23nUcEY2wMjjnt3ZDJvOsSoaLOuFKv64VH
	 rkEEsQ1Ce6ZuPyRLjPe+Ck40UysltZqniq6awgof6j9lpjpnK56V9v1JRJKXYSW2p4UoK
	 SAm3LMRYOcPDwMMKz3Q8E1xnZ45HW6z5oiOrltjEOWe7ZIU5DXmDsnF3Fa+4bTxDQIjGJ
	 mNdmVNu9ju+o5msMKl5ewwylmLPFzCAFNKeOCg1E9RXqnmZYmOyZ3pe0PF16R+3Yn+KNq
	 08+eAC06hmXpcUWl05gTBhS9hqFcDZo+4EUABe5dHChxCJhFjPrzFzSziVN8oewe73g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zlzWWaYK/j7SpOXqtX7DHJ/kvUzD/3AsfJhk/toPE/c=;
	b=OFGd/JJShuy/Mi0TPXCfTqk2PFJG6KPO+/yLDhCqXuKjoReL0fc62QrZAIhhKOhcCIFo
	 cCMZxVnsCntin+k4QAHnaPs/jzCnWwIv3ZlYTTafIA7WcDGR6CUQY91eYq3I68Sjaohmu
	 htNW9BT+R05W0vKJY6pqtylN6PL+1tNCVtEwq2lFhUdtKBQbDtuoLnoI0AzQb+Tvp2yfW
	 j9kKiQLKbd8fyi61YjYcejgn3ollskJyqTmLoSkaiP7HdlLwf7KKlShoaCbwg08ts2Sod
	 EShdDh+CxVL+te9l2My0s7/vrjRKHZvXmt6jqpVKEYSjvx/gVAmiyCLiX9Z/knTJZBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CYbjHCC5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eb5mdL3d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FF9606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FF9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CYbjHCC5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eb5mdL3d
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Ho4oS1142629
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 19:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zlzWWaYK/j7SpOXqtX7DHJ/k
	vUzD/3AsfJhk/toPE/c=; b=CYbjHCC5/XcAw9g32iaHHYMZfGqyuF7cVVhZC4is
	6lD1ZYT1yl+5xQtI1cUlPeZ6KQGxBWBMPLnbaWRnEZ5I2WuyeYn5SN3WkwI//gKX
	U2Zxayj+Y+eh2mE2QxFldnf+ge3ZTJC9ACHGfq3yL7uw+N5DbKbhA3gtzKZ+Ne17
	I9bvQ9YmfvHSvkWrQnV7JoyDO4amI8iknEgpNtJTuI9pb8XNU63Su9g24F3sjdwE
	xopduHPcRoJPoghlmpHYdfgFGA4wmkBktza9o42BwJTrnGieBP8bbtO7ky3Nql+B
	TxNtiGZ75/XRD/ZWIBcyQlHHrtOq5LThkYf3uxBD+kxjrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99kc2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:20:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9440b27c1feso38007685a.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794165656; x=1794770456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zlzWWaYK/j7SpOXqtX7DHJ/kvUzD/3AsfJhk/toPE/c=;
        b=eb5mdL3dYpUr/woWYYeq3PzSdUrekt42I703VaaKJHsGFMSl0w83HKDcpR8HBlIena
         pkXnyv4iukfIbM6DJ54lUNN0y0kOjmu611E1ELUvFGEWfWn9Y4s51jYIZSEoCTCDFBSg
         6sexwLOIvB3ZxTJ03MAWin0lA3g8Ys/M2o4uNW7DtFsfm/xBxh0YygICMphBwure2Kx4
         kQhQF331L1TLoEbR2cjun/QGP54u1BW6YIubUhJ575xEYQlfPmkK9AO/E74hBKk7SVgc
         bSqlRYWeD9gVhF0DNjVzbZdJxFQjd7mnHLddzFIxBh1cVvYXtr3UzL62Ac5usjl6GX+u
         DfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165656; x=1794770456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlzWWaYK/j7SpOXqtX7DHJ/kvUzD/3AsfJhk/toPE/c=;
        b=CR79B40jxLE+ORW5trigGYNp3jqAq4JakXXRFmqX+M4tXOql05n0KSsOb3ZZrypQJy
         coB4t8SpVbAT7MKrX92zMR802ahBIEDRCaCsOk8/BYZDpDVgTJkBBzUEKlpw5itT71CG
         jbjSGvqYKBzFfomg62uZbtnRHSBr4EpabEAV1HJd3nSwlAyh/2rzCwKA8SOq9cbdebM9
         TwGWLTFStXHAKT+1c7GKPtkAKs1Sxkw88cvSnYRn98JS01DESWrhaJA4AadJTj5u0hK+
         EWY4H0buKDCc8dWmRphVas6gyFkAxO08qb5yg/q7is5K36Erbwsb6vpcSO7zHoebRPCP
         E8uA==
X-Forwarded-Encrypted: i=1; AL+hErHo/yP6N3BIKvCb68mC/SJ+rzQ5AIifZBYHGKCghW0O0d4oV4Fuvy578qg58YZcmwdul6wVbrwpIwCnpFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vuHeMqqZ35hkH9kCGBzIQCtqiGxL0j0frWq79I3OAu+63YDo3
	E07rHFdPaV3PJvExA7vKfjKLOYM777/GvT2XHVqsoazPwz8Sr4RyaIiwlL2OA4+aADJzpry+byJ
	gfSTZiuYpRGwqNT3jFMtcLlUwRFZqSUk+9vmChTOkINmAomzJyh5NCIhV3AO3OP80Lkk=
X-Gm-Gg: AYBFou3CuztPxSYNKTGUYpBdkXQa9wRmfvqjj6mbjt+6JCjidfp0IDF28PWQhka9kvX
	TVwJ5X7HB/q5+hucTYphKubABbhLaBx5fX23QTk/ls7HJW4kxNQ/2ALIgINqykQdZW0dvS0eKUX
	FuSL5z7GXwZZoY8sfu0kmzVcVMZtVWRZfKCvBuaajZ+glIFQKYjLrMI2ehayMHz45cmb0Ts/kIR
	Dg9IwB9h7l93Q6hoKDRva8BDPJKpGk4QbPIABtWSrkbCJWe8rHcwuWYgaCq5J/dnlw8G3LmdVi6
	FrEZC5t6LdjcTlM3JC6FJ00/+cL0BR5a2Ht69i8t8tPreJdTHxanmsdZoXmh6LMdfAQb06ncIh7
	mYqcsxKDRLiwibSX+0ikZMKtYaFnmBVvdxqJfrl3YvppqjhgRj6BSwH6CSkNrGuw7j14jxwgAJo
	+U2dqfES5aHTmGUO5FJm5xOikQLp/7nai6WnZKrqlKrK0rXO8YDeQij7UnxZAv
X-Received: by 2002:a05:620a:3711:b0:93f:3646:7a53 with SMTP id af79cd13be357-947842db1d8mr292300985a.83.1794165655810;
        Sun, 08 Nov 2026 11:20:55 -0800 (PST)
X-Received: by 2002:a05:620a:3711:b0:93f:3646:7a53 with SMTP id af79cd13be357-947842db1d8mr292298185a.83.1794165655282;
        Sun, 08 Nov 2026 11:20:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b7fc371sm468860e87.20.2026.11.08.11.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:20:54 -0800 (PST)
Date: Sun, 8 Nov 2026 21:20:51 +0200
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
Message-ID: <jwmtxurikcc2qsahg4rq63earm75puu46isd5du2s6356oe6eh@7umfzpxmoebv>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-13-4b81473185e7@oss.qualcomm.com>
 <agm7esy726no4u4cntecmllz5kxdtxaue7xcn7vdhkuh73lxau@r6mqybgiyl7f>
 <ab5ebfa2-9687-48ba-8403-186e517126d2@oss.qualcomm.com>
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
In-Reply-To: <ab5ebfa2-9687-48ba-8403-186e517126d2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZMbDs38ATOsOEoVeu8PZxL5bFlpabBB9
X-Proofpoint-GUID: ZMbDs38ATOsOEoVeu8PZxL5bFlpabBB9
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af0cb98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=xEe2GtBaY6AeIktA6SYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA3NyBTYWx0ZWRfX4njfS9Dh9Ptr
 uDMURmSG7r95KLwp/oBk6hm7uWVNdJBNiSsZ+7VRKmHGatKWfnOWL7AHYzHNp7O7u7dgFIUKF7i
 4FMV77EAaxFCumFVaMmJ/QF7y2b9vdMz/M4zzsjZqmxomE7pdt1NjNwIxg3lMqx66OktYxASXjp
 dC3snR8Fp0vCYI6j4xGnMfhr1iUS/Nq/9D8bU9F31aTl6pRS3bgg/upswaOQz5wfU3wT1hs5b2U
 tWMHvJIGq3971ZHHAIr+8+eVlPxJc4GeSGsbSQzhVJgYJU5J+sKkiTOQUNWIwsdDz0nqMb5KyiB
 f6ak4ZDRoSawrybdrJBMo1Cc1gUD2sohTK1ncNI4s64w1y3D1ShsiXmOgmcwPDbN9vJRC/lqtOa
 ddU1u+/2klVMe5PVWlRme6W65+3dCM64NJwZ+jQ3a9zYEEbH+XpW69egEkl6Wh+8M1yPdv2Qe5K
 TfYlYN5otUjqVp/ip6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA3NyBTYWx0ZWRfX7AOgGPE1Rm0B
 yxSLTeOqFelkLYHHSnaF4g9fEuafL6DaKxTI4C7P4r7H2fupAtC4b0Ae+0lV27N7tLEcZuZv0fX
 FQwcu29Mm1kRvNgMLeB6Om4A8Udi6LQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080077

On Thu, Oct 15, 2026 at 09:24:52PM +0800, Yongxing Mou wrote:
> 
> 
> On 10/1/2026 6:52 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 29, 2026 at 12:25:37PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > DP MST streams share 64 MTP slots in a time-multiplexed manner. Add
> > > support for calculating the rate governor, slot allocation, and slot
> > > reservation in the DP controller.
> > > 
> > > Each MST stream can reserve its slots by calling
> > > msm_dp_display_set_stream_info() from its bridge callbacks.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 187 ++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +
> > >   drivers/gpu/drm/msm/dp/dp_display.c |  13 +++
> > >   drivers/gpu/drm/msm/dp/dp_display.h |   2 +
> > >   4 files changed, 206 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index 929e0f94f8dd..02732bd4efa1 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -83,6 +83,7 @@
> > >   #define MR_LINK_PRBS7 0x100
> > >   #define MR_LINK_CUSTOM80 0x200
> > >   #define MR_LINK_TRAINING4  0x40
> > > +#define DP_MAX_TIME_SLOTS 64
> > >   enum {
> > >   	DP_TRAINING_NONE,
> > > @@ -119,6 +120,12 @@ struct msm_dp_vc_tu_mapping_table {
> > >   	u8 tu_size_minus1;
> > >   };
> > > +struct msm_dp_mst_ch_slot_info {
> > > +	u32 start_slot;
> > > +	u32 tot_slots;
> > > +	u32 pbn;
> > > +};
> > 
> > How other drivers handle slot programming? Is it something to be shared
> > between the drivers? If so, maybe it would be better to update MST
> > helpers. Or, asking differently, why do we store it this way? I don't
> start_slot, tot_slots, and pbn come from the MST atomic state. The MSM DP
> hardware uses start_slot and tot_slots to program the per-stream timeslot
> registers, while pbn is used to calculate the rate governor. Therefore,
> mst_ch_info[] is a cached copy added to make these values easily accessible
> to dp_ctrl.c.
>
> Source hardware programming differs across vendors. Intel does not
> explicitly program per-stream absolute start-slot or slot-mask registers
> like QCOM does. Nouveau submits each head's allocation through its NVIF/VCPI
> interface, while AMD converts the complete allocation table into SAT entries
> and programs them into the source hardware. Therefore, DRM MST helpers can
> handle the common payload allocation and slot-shifting logic, but source
> hardware programming remains driver-specific.
> 
> Without mst_ch_info[], we would need to construct a temporary complete
> allocation table from the MST atomic state during stream enable/disable and
> pass it through dp_display.c to dp_ctrl.c. Specifically, this would require
> extending msm_dp_display_enable_helper(), msm_dp_display_disable_helper(),
> and msm_dp_ctrl_on_stream(). msm_dp_ctrl_mst_timeslot_setup() would then use
> this table to program the timeslot registers for all streams, while the
> current stream's pbn would be passed to the rate governor calculation.

Would it be better if the MST helpers provided this table? Would it be
useful for any other driver?

-- 
With best wishes
Dmitry
