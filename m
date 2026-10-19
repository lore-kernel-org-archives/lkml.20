Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441949;
	b=gZcL9u9e1nKfPdKeBgtDDayQ0XUWwPMeKIo4v1rAWSOcd5Wy58l83LeCKJ/9p0UGyLDh
	 zfQWnT1L+o3PAbEkhBgSI2D13gVhPPftXj8Q2UtlVEtAn5xBu/1k0vz/nuMrjq7B3ZhJr
	 zUia1bnqLVwtVpFHpAx6/4KQOoqLW718+LSo1WGXzm6Mki7fY66R74dOCpKQqnWLcp/vk
	 Hv9sjOPr5sUF0NI5D/iYYPmt4+LWL8Qk//nNyZudH+Sy+PWrgBvrcckqAi4GC563LyW3j
	 ztkw0qK2m3vwNTJU69ldm5ITFe36XBrBZyz9zof7DW37uimuH+QrpUxehJIvx0K9opw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WP16KsMS9UndTPVKVIGZFfnhHsJS+B7A6404Qzj4ck0=;
	b=TCDGInWd+Qlgf0BVDDS1BfC//VjKmClQrybtGUqXrkKb54poTRZgz1dNtWa4RBgT1XOs
	 MuykHW+7CEbF9Rkhtv8FOcvlJKNrE4HTFUVpwzWqVg+YbOlM4H+NO/fjwihKLg0Kut87X
	 7YY/BztTuEpZwHha/CFjAJzaBxWbTVjgYEz81xtTOqVvUJrb7B0PqJlrrLzXM9RIeDbrD
	 ZEM3nvqg4N0s5DHxth9HRbaWrzDcyPAeySDS6qVvIsNXnL7JIfE5ni+Lqpch8Rn4fMZQy
	 BfAM8DK5FmG+f+TNkInsw1k/fo35TjFv149kiG0P+eSdlpW3cGZDPzmx4+XG4ZFxHjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oidO9ov1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iLS0S7X+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ADC606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90ADC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oidO9ov1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iLS0S7X+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJKI1s4190068
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WP16KsMS9UndTPVKVIGZFfnh
	HsJS+B7A6404Qzj4ck0=; b=oidO9ov1cjN/3fBf9GYVjfKzjKLzVOUFeSsa2A4F
	wjEsy0IkLqjkAU/9E+IiZ6SgaLaxUtXe7R97+2Wv79gM7oJQlu3IEwEede4zf3AO
	ruRZf+QmDA+dhDJHnSnoP0oRVEEDzfeMjFQsb/dgQ5oYnydshZVGTkXtmGP6wOvq
	0+wT/E3k/dniG2YgidT30gkVDku2s6Snaimj96tcPVeJoZmJnbhAIrlj6truQo+M
	P0pbTwrfqSDDjrO24IV07pdSH1f7tIeKoQ291s5cnzWM88ouRhIXDM5WcX66JGrl
	H1A9dLQuCZyM6CbSBrKC7bnvKyE6b1VLwptXXGLY98co8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48k4et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:32:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so450396485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792441947; x=1793046747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WP16KsMS9UndTPVKVIGZFfnhHsJS+B7A6404Qzj4ck0=;
        b=iLS0S7X++14ZSmNAwSLK3mXst8zRmYmP66uToeDEOoPh4dMQ3Z27/RF1phDDznoAqs
         B3gYjADqXDPuZQ0JjRUnwdajirhdal7oTHOvThw7Xm/zsKPhh9UkL7n2CRK4PFEgBXeF
         Vo0gUbJBcGsuwtMY7YyAxPD4tmxpgCw0BsPFPtl5cOswXXGeb33IEM2AKBMUj6H4mjAb
         lVi4UppW/xUjM51g1NWq9k7M2KvNic1NtvUmmp0PWNgtvHdlzby9QKmBmUF6CCIaKw20
         OivDYHDy5wc22YQnW5NgzCPSHntq2isf4gachFquiVWkjvyfrN/fiULm02FnCV8LFYAj
         4azQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441947; x=1793046747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WP16KsMS9UndTPVKVIGZFfnhHsJS+B7A6404Qzj4ck0=;
        b=CcvHu4U+5K45HjEuiuysefN22pP0qJ+j28dxdTsecvkQorYy4Nn1bXjaITt5TFng4J
         Zz275iaE5Qg1QwIozMouSbvQXC4699tpZv47ONVfIZwxEZAyWR9OgnEIPif7XKF7IBc6
         inH+ny0J4aSLfiUsyobwJCCb1bzCG9Bt4owNjclVXIMQgXKRgJJPMQHVHkKrod+gld4X
         wBtaP3TA7zRRpE+qUN1KgLoeAzREaLmj/u25DnmKsy4UEWixz+74hOcI9Y4m7KAKRauK
         ymdxzgYUcZyfMfQ92SzL1UpYUKPYkJmmb2Oh6gJB7cBA6DUo29pivNjjZ0pGdyrZ1Lwk
         9KUA==
X-Forwarded-Encrypted: i=1; AKwUvBzKsL396Z58QXr2ULQ1iSh3Sn1J/7NJsT1KVMIz0ehrrbzZurIYXSktuvV/Gnnkb9ag68pO1YSvpNZQXHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSSIrR6NLPyXN0UPIpv6JHKzCi2sMTjybH2sQbqGkqAx+j1PUQ
	NQIv7LQcg5toM/nI9XlhKeQx0NhyR6Tp1Sc2gvDe2IRddcXgqUO43/o63IB6INxI0N+d4dw5sHP
	K99LjC1rBXmCaaf0B2tDOleoG8YF9LLjnupiMI3vMg2Mp547jdM0N08as3lQwDBOdJf4=
X-Gm-Gg: AYBFou3erY8DIY6NT/UORU5Bh3pCI80o6Wf79xXuGhbboP5YLwnhKJkFyvYg6ruC8m4
	O91qnZKzqucpYUue3X2ewfa8hG5ihvDek5kEkqHqlf7HzfvXyhxpzhcUPvQTst77ccbRgpg2kIp
	szVzkD8dWl+Uqnw1qrXwe2aZvE4WRmZ6c3HlWhTT27xKPryZzoLZ3egBJbT7AK6emJEBxJwGSYf
	8okWTC/uPyODroRAHNHU5wgx18nKlJlbEJ05AlPYIpvDqakt4OLpt665yMihrsXsJzw4CxaFMMQ
	zMduY+kGKI+FtwXl32yCwjGt+yMgY10QLMDM2wRHrkMZ/mfITUe+DOov8e5Xcqy5PjH+kqSNCYH
	z/kViLAamu0d0T7n+
X-Received: by 2002:a05:620a:72d1:20b0:93f:34b0:4880 with SMTP id af79cd13be357-93f34b04abemr804966285a.22.1792441946320;
        Mon, 19 Oct 2026 13:32:26 -0700 (PDT)
X-Received: by 2002:a05:620a:72d1:20b0:93f:34b0:4880 with SMTP id af79cd13be357-93f34b04abemr804961985a.22.1792441945686;
        Mon, 19 Oct 2026 13:32:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d85a9bsm17135825e9.15.2026.10.19.13.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:32:24 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:32:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Message-ID: <evnzk3qzvvy2pmf6ndffqamxf7sv5hrmu4tia342tmix2xhoyb@czxgky7ywmx7>
References: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
 <20260516-a8xx-clx-support-v1-3-62508bf651ac@oss.qualcomm.com>
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
In-Reply-To: <20260516-a8xx-clx-support-v1-3-62508bf651ac@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4MSBTYWx0ZWRfX1Va65PQt+f1f
 sNOShuOJ4gaWnWJGnbeMFL+muo4e/caNlFYs8d8JOGW74XY/R4WKJ5XzYkh7PPkRRHDIXI4wVPM
 ySvNn/8ScjGBEKSxR9kMz1FRDBPgLKoGGuCy/Lv5U7cCEkM7SILbPJlVE5qlRj9reUdOH0b/b+8
 f3bxchIEWELCwmx1FZc0z3RSIGLD7dd+hn94Zb/QFNmhdVt/8KMbuWdL4HGYFcOqT5a1Kl6ve+0
 YDbdO4Is05y7rNyVzq3bL0B9/zYfmsj0lfqdiPqVIXhRPU6RTUt2vVejrkUlWuulcxYc+3j2g1z
 TGnR6/WTE7pVOKqZYBkr2ZQthBFEYED+VQpGAZPfE6OpmZqanmRPfUNuYrhuz+YxRTEQQKsSZY8
 tfCl1zwfX3As+kdH+QpUGSbzgL3BjFcc28+gxggRa9jow/gco80fgT9wVdTutxi9rIA2oI4fm6e
 i2p5jgZPtsA3XFvFr6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4MSBTYWx0ZWRfX4mMFW3G1Rfsd
 eyfuFkAb7idWjhON5b+gg5j4/1KJjXPJ6gO5fTVaU1AzLOAeBOszL8QE/ZlIKmNu2s66MF6PClw
 XENWZgYOr/PXH6zGtCc7pDG3eMu6rEQ=
X-Proofpoint-ORIG-GUID: zfZI2JxK8Gsp49F7DVBkFYvjZNSszXxm
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad67e5b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=PlByJ0tI-E0pWcfLig0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zfZI2JxK8Gsp49F7DVBkFYvjZNSszXxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190081

On 26-05-16 01:37:51, Akhil P Oommen wrote:
> Add the CLX domain table and the IFF/PCLX limits tables to the catalog to
> enable CLX feature support on Adreno X2-85 GPU present in the Glymur
> chipset.

Same on Glymur CRD with next-20261013, GMU fw v5.2.38:

[    6.619232] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for response
[    6.629590] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
[    6.629750] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu [msm]] *ERROR* gpu hw init failed: -110
[   14.795082] platform 3d6c000.gmu: [drm:a6xx_gmu_resume [msm]] *ERROR* GMU firmware initialization timed out

Dropping just the .clx_tbl/.limits_tbl from the 0x44070001 entry fixes it.

Tried on top of next-20261013, no change:
 - the QCOM_SCM_GPU_CLX_EN_REQ change
 - GENPD_FLAG_NO_STAY_ON on gpu_cc_cx_gdsc
 - modprobe.blacklist=msm and modprobe msm at ~90s, after all sync_state()
   calls are done

So on CRD it is not an ordering issue. The CLX/IFF_PCLX HFI messages are
all acked, then the first GX_BW_PERF_VOTE never gets a reply and the GMU
stays wedged after that.
