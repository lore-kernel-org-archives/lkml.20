Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588811;
	b=lcJ78j+x+CbYY/AL0eHUnv9hOeH7gHQhNsS7+qxlKLaCRjpeoPWr8kq27IOnin1mzUdC
	 sRtcRpFnF7DNJWYmhPrSWM/Zs45/nPgydDX70y0ur3AMYsh397tS0WDVe/unmAKuvhCUg
	 MROUOYgKQMo5FXN//Fslo+P7LwEAG5AS58KBjw7pXZeoCi5MJGg7Wp+WduQwNyUzB7PM5
	 IOfvQcycG2C7oIYlPmcpucHTbGWAxucPLyMQYj2IfFUuFZ5Vg2m6ciuGr9BrPy16p1TNB
	 i8Ux5fsY/8TTXULmwHm2tKcd4eU7lhVuiTkosMdgHgglHuEua5z/dv+R5pqsrLOz0aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aSnzuw64QaL2ODuF7dIoTHdiPuBaqdsaTTJECpYAR54=;
	b=XAg/jxhsjlm54dQbfOJttAns5ufRlVdOk6FOUG0tkzduksZl2hXPSddVpcVfOErHFxMB
	 i7CfeiGtlHWPqwWiHeVY5H1+lNftRVTBvzgpW3JqclzxIha8nyvju3FcbwKiDDxDSs20b
	 bTitslIJT+OBDYURNP90+axSUYZcL6kolHxLWu0B1V420EO9J51KP+phKRaUCW9xh3BHm
	 tQ5ZOLTu15Ai6LZGVXAi08dkKTd1NvtYx5WbVYSLW7pAvT9/OlOPhvyObjoryPhj9krLh
	 WnvUQzDmel0g/LVLDknx4mmpVcrP/bLM6gukrxONB8035EI3b7BlFK/bbw7REf4Pjlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EIv8tbx6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J+DoKJEa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD212606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD212606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EIv8tbx6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J+DoKJEa
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfxxt1568124
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aSnzuw64QaL2ODuF7dIoTHdi
	PuBaqdsaTTJECpYAR54=; b=EIv8tbx6tXPAcGXLwoHMp83UmNhsZWHR/l9I8HDi
	4/NrazfTe4cn1dw9qZPNikqZsw4VVrGPrY4VtSEFy9B6EJYk1yQ+z1v03RCikitv
	K2YIJ0XBiKWbLJwtOzXCYY+SYkCcsRUwgYQ8nuVJdN1UTbWR3t6Lsyk4iRLagU9X
	iwGJ0sXwcyFwUH+4ANIereXBcz7d8bV63FMhwxx9w5IKcrZbrbm0x8MD1BoQOd1M
	Wv/u6WWzBsPnrYV5W0cH9JesZmgnCCTV8T3s+GVT+4io2QwEiMSn4FEkY+DU2lS4
	e2QI7TEEg5n0OPk7FoWS5Dm/se8LLP2qSKvoCQXVATJTVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4v2n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:20:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so239167585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792588804; x=1793193604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSnzuw64QaL2ODuF7dIoTHdiPuBaqdsaTTJECpYAR54=;
        b=J+DoKJEaJGV1exCt6hQsecBbBX2Iem8uDn4CQKHRRp3gFRfaHXPScwY5CH/t2I9ioU
         hWTU6Xitm4StBQO7km1Yj9QKlv9c+XPYDK1KUBBQU5CtGDuugAdNIogOg4ICYs9nMlF4
         1iL24hvmLL4+bLTrxXrI1dCLmOJxRHDe3GaTemPB9cWLaYzOuhcRyASAgiJwoiozf5fY
         XQdw7Obkmoc4AtWLsygd6WgoTA+QMqofxNkitjxWfYxKHDFvfXBDEOw7ySFsEcjVfcN0
         UFO7VvXPycMrzld6Tq5VKNBA7JL+GyJNDTqvejvitz4ISnQSXposFbgPBzdjokeAhCjd
         X+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588804; x=1793193604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSnzuw64QaL2ODuF7dIoTHdiPuBaqdsaTTJECpYAR54=;
        b=A89eGrf7rq440HTIMU2DI6ga+8l8sSY/bVZ2kFKFoJxcc2DtEwmpw+UGDR2eg8Ngcd
         gVQ8mlAyKrWKNVHE236vHeCK/+hE7wTD6busl1+CYpRqLKhoaEkMlpFUhmSYVfXnCOYD
         vPsi9XoxeV8TB1aeFtXd6V7Cx08hf+hN4v2gchvzcPnjYXdXZ25pdjwLjsrcTJeTMUh2
         uBf0t8JXzVTtfSrG5ZzEBzg9L/Hfom1YRna9mI2elm6PJcI8sgy+E21B/TsNiNxCpsQl
         04k5aaWlbbwAXw8lVOppH8u+guHNuovVYDv3WWxK43cchMrsKjQuPTxSCAS2qUiQ+dHX
         R3fg==
X-Forwarded-Encrypted: i=1; AKwUvByl3j163xb23I7BzyYej0zTvc7nwtqmgA4SwYwfiQYGDrY8GYUCdo43+WjAvfpQN6FPzEDRuoqbkEz2Grw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX5UD91QHtiLuZJ93HzqYmKlF/Lad5DAFOhHYcz+2bxdfJiaRA
	xw7H9QzRIjjZ0n96aLgnLUpZe2PnZMV+EYLDcnxTsjDqmmTKa/LL9eoNYOe8K+gwemCyD8t/LCC
	FP1W+v1fEWT4C7O/z87RPzJ/xv9m75ONOPNrCiOtheWB9hJfazKp3lEirFnBIvaLmJxQ=
X-Gm-Gg: AYBFou37BfMeyvNf0NoMO8K5SmGNZpJ2O3SoveQeEvckLq7b/uB2HQ/sPCDWwZ/bGCX
	DNEz11kwoAo/40EEIXYi+VnSzLmNeUPMRpKe7hr/NY/NWZLEtRUtzPVj6qN7WFKB1eC3HKfOGkJ
	wZoagIP17vTYrAGVoWgr9Ryj6c2u6blq2uOx3ykleq+RnGZm5eDjY0vtZsrKM+thupcCpivw3xS
	XXjvkNhVlOYhlhiBDw0By2E+iM1JJaWeQzhrJjG0qyBHyVh7YruOLElTtMZ6qe5kUx8rknMwuuF
	Vsl3Mhs4OgHLiqeDQiT/rGlKCwv82lOVBLVNWVDVOCfZS9vU3adIvy+hWckpasC5Ev5P/5jDIp1
	JQcSs+1lhhQDkfb4T02Q0+aWXfqktIChZDDfQUV0g/jne2IG5aYZ7ef6v1m8FQjGiiSD8/TMdS0
	trqsjDriEdJph2
X-Received: by 2002:a05:620a:40d2:b0:93f:571b:c72c with SMTP id af79cd13be357-93f57f66116mr409626185a.46.1792588803907;
        Wed, 21 Oct 2026 06:20:03 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93f:571b:c72c with SMTP id af79cd13be357-93f57f66116mr409621585a.46.1792588803368;
        Wed, 21 Oct 2026 06:20:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1224fafsm512832e87.63.2026.10.21.06.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:20:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 16:19:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/8] Migrate PAS clients to qcom_mdt_pas_load() and
 qcom_pas_prepare_and_auth_reset()
Message-ID: <zqu4sweaftstbt26v2u3ajzv7snnqswuyrktm7t7k5gh4zi77e@d6t2fpsinvxc>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com>
 <20261021130735.h7t2c7txqdfohrs6@hu-mojha-hyd.qualcomm.com>
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
In-Reply-To: <20261021130735.h7t2c7txqdfohrs6@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: BY0QeXbSJhiBOGTuy7yRBus_HTBSsP0p
X-Proofpoint-GUID: BY0QeXbSJhiBOGTuy7yRBus_HTBSsP0p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX59fqaf/QuSxC
 wxumRkIkjsz6ZYpZ9nU+kmMZouScWtRe96Fahr+Jvh2OweOfEWhwwOHhiv2eSAZyYvM+sh9XJ79
 1/2dkt6TmfN+KokK+ge+iFB5jK8snpE=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8bc05 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=LTSqVt2n0stEVfQD8AYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX9TkeOYB4c85s
 JMUNZ9utz9WVB8eBVI6NqG9FG2/KUy0WAwJV0GO6hpKofetDuA7TDkbuzJEC1s7hYbp4gIFDIM3
 XuVX0RAtV90rMcZvAab1m+qj8cpAu2arZDe9Zdnc/JQxt05L1dCpFDb/PFVfqXvri7sxc9ryG7l
 jt+x9LWjtJyqrXwD2V5BR85yXKyWm/9XCiTYX35QbAR4/hf41tVwkmAVkFNPiN4L3cZWopA6/2y
 zRd4gw+KoeN/4Chb3p5MtRHHO5c++aNZOw9mPsUgEyv8Xcol8S/gb+FFRGEib/xTXOqIK7avni6
 PgF6wg37RmVm08TlLKqT9aPvWjxZtKSXaLNLvnmw6ibHmGG7BBS7Bmu3QixqZTB6KzTEAzomB7b
 q85scy1DcVn5F/asSyOLJaq8PNqKOaJVeSd2NIoGo64bGA7xYGyghNcw83j+UQGdHi4/xnmacNI
 vBUbrj+u0xhmYaC1H2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210053

On Wed, Oct 21, 2026 at 06:37:35PM +0530, Mukesh Ojha wrote:
> On Wed, Oct 21, 2026 at 01:32:13PM +0200, Konrad Dybcio wrote:
> > On 9/25/26 5:57 PM, Mukesh Ojha wrote:
> > > In preparation to remove qcom_mdt_load() and qcom_pas_auth_and_reset()
> > > public function, migrate every user to the new PAS context-aware API
> > > qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().
> > > 
> > > This series migrates every remaining caller of the deprecated APIs
> > > (qcom_wcnss, adreno zap shader, iris, venus, IPA, ath12k) and then
> > > removes qcom_mdt_load() and qcom_pas_auth_and_reset() entirely.
> > > 
> > > This series is based on top of although no dependency as such.
> > >   firmware: qcom: pas: Make MDT buffer retention explicit
> > 
> > LLM has the following comments:
> > 
> >  1. Metadata buffer (ctx->ptr) is leaked, and overwritten on
> > reload, because qcom_pas_metadata_release() is never called
> > (patches 1-6)
> >  2. devm_qcom_pas_context_alloc() is called from repeatable runtime
> > paths, so contexts accumulate until unbind (patches 2, 3, 4, 6)
> >  3. use_tzmem is never set, so the shmbridge prepare step never
> > runs on SCM and the commit messages are inaccurate; TEE gets
> > a real mem_phys/mem_size change
> >  4. Not bisectable: patch 4 relies on the NULL mem_region
> > handling that only arrives in patch 7
> >  5. Patches 3 and 4 don't apply to this tree; iris
> > iris_detect_firmware() still needs mem_virt after the load;
> > the base of the series is not stated
> >  6. Patch 7: NULL mem_region now means "map internally", which
> > weakens the -EINVAL sanity check
> >  7. Patch 6: redundant second ioremap_wc() on top of ath12k's
> > persistent memremap()
> >  8. Patch 6: ctx is set under one scm_auth_enabled check and
> > used under another, which is fragile
> >  9. Patch 2: the context now carries the full region size instead of
> > the MDT size, which matters if use_tzmem gets enabled
> > 10. Patch 3: stale qcom_mdt_load() comments remain in
> > iris_firmware.c
> > 11. Patch 8: no issues found
> 
> Thanks.  Will address them along with Sasiko's one.

Just to check. Did you verify your commits with the lockdep and atomic
sleep debugging on?

-- 
With best wishes
Dmitry
