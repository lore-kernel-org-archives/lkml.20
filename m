Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0172A477295
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807675; cv=none; b=MWqQ+J8IOvFRvDYoM2jnQh5kqgY6pef493tB07nCC3LszfHh5DJufokU++nVghi/HmWR4ayL2WsJujOoVoldyM6YZI/HDKOxVc82dJKxSGwAzEGvRxIQKLETI6tqRA4UJ8wX59K08wSyFnshWBOCDft1v7jya1WRShgxTvqz2yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807675; c=relaxed/simple;
	bh=sPlCgvKLaQGPEK49kPDxX/eVU3lHhok69zTUg7Fcme8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZZu6guuIQesDYH3ERkmCpq7tDU+2nYQywi5c8gDZLNkKvoPLMnfsfQbhxe42dnEvUhWRpntyxMABqabXNkWfUh0dGcj0GhbsZhmh/Za/8z2AUOAnRGnFv/6Hb5EIoLUykN2hFgf58Au+L1RgqG/n4BnB4WbWu/ny7p8XLl1yVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bm6/B2FX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aW1nGgAa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bm6/B2FX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aW1nGgAa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0PDX2088511
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q3lb9in910fJkfWVBwHovBUr
	JZ9CnyxdzxZK5FoBJaA=; b=bm6/B2FXBO5AXh2KjISbNO/fYbm7R7VRBFK5EPUp
	jBjk6/szNDrZQYmZXlNaRFW+srEv/hc2TmBQ8l21uUsEzBBWtipk2XHcxbsFj//w
	KjXjIxB2ETmnK6d7puiNRDM82V5kY/HKAUYtOjoxtJZn3KpPxIdi0hFEqQX1Adu3
	XZTLgSbHmMpLI7sfBjKkf4ohdCui9bRhLJs7g+IncDrtAE55TPwMmKxEcQfY2kww
	MaS4fQwrFf2LLZ7Kn1FAf2wBOosgvlgSZgxH0pZ6WDRqedRc4N6g3vB7ZPdZxe1i
	UZ6cue79/63CMpKJhsJ540P5PfXuSonW5Th/VDBi5aVfKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu1uv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:21:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea9ea9d13so302915785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807672; x=1792412472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q3lb9in910fJkfWVBwHovBUrJZ9CnyxdzxZK5FoBJaA=;
        b=aW1nGgAaksERl38Td+SQOnbR0YBKXSxXgrlzgGN0Hc0LlzncJ3g2bnvOhH3NSMkd9n
         Gk5aEAQ0sLvZoQJG5cPgYB1satWVJFoC4TMfkP3JdHpo/5Q3lTYzLmbGfZQaQWOxaNLp
         PhRuk7hoTcY3ITajiIIHjmkc54kPKFmLzc6tnlOP14d80DB87dv6mn9uiprAhHds0CGm
         S9Xpx9zSdWF2tcvFImT9tc7MBornm84i6lDD+8+/xmqwkyWtoZwCGzO7WTwRZZX/0ULM
         jqzm2f3nivmcyn5LzGavrByiITqTYDqKUppesfqKR9BvGNMhMwLSnIAYpCPEQ69lw0Zp
         gJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807672; x=1792412472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3lb9in910fJkfWVBwHovBUrJZ9CnyxdzxZK5FoBJaA=;
        b=bE9YBXwHoyMDUdor+5ppnyTi31KBh6+gb5Mb7s6YSfHCzMntt7VEUTReOewwFZR6Qu
         VWwaBAIndlikua9GPxu8261ACQ/mH7QRvB0BgYGb0lLSHXhYXtX8/K42vlMQ8KWbvxF5
         iv4fIin41xXc0FBG6HwMbGpoDuJk9+CmBRP8SzEJRvY0df/W0JV7qUEHZGJNJRznNSw4
         OAzGBUj2qJPVbNPmCSdpEAYI733DJ/o45JaBYdeIWWBIbkmWg31jAfXwty31ROkYvnmR
         +Gc4Z8Zf6Yy24q7jwaL5FCXp6AAuPOZ3V901H1y/8r8W0vHNLNvzFNhlKrEyR0AvNUNM
         3yjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOiT7INiYkkGlMfctT0sMkFx7Qh73i6Y/fdangv7WV+0cdlcKtVh3gPcxFCunMy0Aon2LSWs5z6Idgw0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVZuJR6yw6ipt/qYKigLc2G/QRt1x9MwB9DO2sdn5aiLt0HXBq
	WvWvNeNQ8yWgIzHwEdUOKLZOyNuk01jRuHPjsuiivIlDYgVXc6odavHxaCrN8HWBAy+Ny4Ji9PY
	0XPuZ4pY3+mh0FOWKsyBmS1KcPgnGJi2soZqMV/Vig4r/XzH1xr7QGf4bEZNIWp1vBrw=
X-Gm-Gg: AYBFou04sfg3GEkZ9yjHa9AFa6W4tIahxQO03RPk9xcWTbqFYWY4uCTAtjt4yys9kWa
	CsJUvAlom53P85f/PdP7IEhDkXdH01ld53ZpVN7lLF1rfWtsZBEudSU0wJhevPzJLXa2A/IlQbV
	yEhY60OptO8N580PBjIkL9io4h6nQVsZgesO2B0Vz202M3TGYzFuo53pMb4PGMa/Xr8/402J7TJ
	Tz4BDx4aDHwp2mrvpkcMnz9PRByhF+mzeBtAdAwdWCufFJJ8iwLj4K/Gdpco9DtZf5wqlbL8aCN
	VevnjMs3jqOOltd3JyUscIsBGWUSadG+2B6EBmZes7T69CSif2KE9fNNqLn8qgssNNFxid61tuP
	+oj1hL6BsbVSSX2u9lZxJLSag2kW7o42jzkPDxsIscbTVpWNVWg74YGCCjSaH/Bhbm6uGtI7Jxx
	R6GuI1Zy+6ZL9f
X-Received: by 2002:a05:620a:6489:b0:93c:6f06:8f7 with SMTP id af79cd13be357-93ebd20830bmr1398728285a.36.1791807671970;
        Mon, 12 Oct 2026 05:21:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6489:b0:93c:6f06:8f7 with SMTP id af79cd13be357-93ebd20830bmr1398724385a.36.1791807671463;
        Mon, 12 Oct 2026 05:21:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cd5adbsm27615531fa.29.2026.10.12.05.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:21:10 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:21:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] drm/msm/dpu: limit the mode width to a pipe if
 the LM has no source split
Message-ID: <qavtboaz7zcxmt2pumasohhla23b7so5tm53nqtio63x6i55re@iemg6uqgecxk>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
 <20261008-lm_fixes_final-v4-6-fa986071c3c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-lm_fixes_final-v4-6-fa986071c3c1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accd0b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=RCAr_VjVQrktO2oC:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jQUIR41XILnKj_BXT3oA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX8O6df7bJb9HF
 1MVQoGOFpi8/eCt6F4JlvMqCLHVMhqXU5Bkq880T2DNJFq42ccDl68o1s+EJAodhwkCWwVrI0C3
 TLZI48zYptiGEq+JXgfYH254aCXkJ2oyu8wc5oZ3vyzHZQ5BR/yqHsh5yaytZsc0tEc/Vd8uyIe
 9JVZRSZ9kmjWs3xUeoIWLvwNREBgBLMyCA/A3XhfRJTN86onO9C53iG+/SEtobBbZirD/I5oTIf
 Zivj580f3I7iigqLbxZZcz8P/8ShxZUzOCOPRIaCRfEM24eSd9FwgyJcujsVLHMEscK8qiJ76ml
 38G6yI3funwcC0sMIepbeYIvcXCUoOz3A1isDrZHy12JNSrmmF/FRjnVSlwTGCHjFsQsGRMhuo/
 loRf0E1klDn7Bjvp03jBgjoVAVQmafj0Qz5AvQGKJbKs5Zy/oPyhtZ7IjyIWPP2Luohep+drmXp
 Td6iV5ffbVOLJ2OWweQ==
X-Proofpoint-ORIG-GUID: 6mBOgnW0mGljcbS8Q0cpc4bSpkx3yhPe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX32NORivfiNsd
 jb1Ot4XMW17HMnOn/Ybnmrw7t92T1zVoiexXAUJYlagjPnXVXYBEpHaKAVURXGgOpezrBDj1HI8
 kOGRk7N8KEJXXD0nB64c9Q5/PB30OHM=
X-Proofpoint-GUID: 6mBOgnW0mGljcbS8Q0cpc4bSpkx3yhPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120049

On Thu, Oct 08, 2026 at 10:53:52PM +0530, Mahadevan P wrote:
> Layer mixers without DPU_MIXER_SOURCESPLIT stage one pipe per blend level,
> so a plane is fetched by a single pipe of at most max_linewidth pixels.
> 
> max_mixer_width used to reject wider modes. Now that the mode is checked
> against the PINGPONG width (4096/5120), keep max_linewidth as an extra
> bound when source split isn't available.

This sounds as a misplaced patch. If one of the previous patches
over-relaxed the check, then this patch should come beforehand.

> 
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry
