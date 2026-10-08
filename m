Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB944F5E0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486197; cv=none; b=IH6j2IPih9cnbl5imqZmaDed5lD/NAshUbqQGkqo/DcrAW0IoGID6wkn3IRXqZHi1urNvDpZhHswU26EeRGrVwVjNAc4qNYImsutvLquHW9psy9Kal56ARrqDWQwJLO2MZIS/PwmrJ4B5zLjJSCAnE+3wAgABL/GEGoLBUEWG6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486197; c=relaxed/simple;
	bh=cGCTkuphDdXab6FhUHbQzB91AfpjIaKc/p1pgUNBsVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHZe24bw07PkAcmHCzLQvkJQiJkHLFuGF20Z53CY5/iMOr4CddtRj6K900N9rYjiRRed0DtnBcLWbIqXT3LR5jrXSeyAW0mHTh3Sp4U2piOUNvP37CuyyU4Y38WQ7/ZOL/VLJutoJPsUuVmfX8nXTm7VCxHFWkETq5Y+4mtkAwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7efawdQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcBgjhjK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7efawdQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcBgjhjK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HVMXt3411249
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 19:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2zcL0LiMvrJA6V63SGWxmku4
	SnTILn+WZTgNkzMK1l4=; b=I7efawdQ48XRgy7apJ/aEfb+tTbRqFZVLWlSch4d
	JSUxrBdPnmWEhUbD7jj8m2GxOGqzlYX36Rv1r+YJ5BpicZCXUzS6d9jcGSmWA2lq
	BJK2MNsJyPWayvQbLnCzdtSDXiUwSXN3NQINW5alGJ92Y674WPQxiQ6E5fuI9hT4
	MXhEdx4A/RsBS4MeNQmI+SAiEwo+wYZwOFxWX0YC1vi7VgHROxuL0bHNBzrjSDgb
	OA/9ZDnWfb54d21jjN5he/spotqs+Mu6DS5x3agJOIsDmbM9dU1pjmxfFc23Zgm2
	zJ2MTXiPWHVOxHcPG5S0Vf0V2kYKr4kxNczuYe8/t2ZwRg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9khfm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:03:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so11347583eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791486193; x=1792090993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2zcL0LiMvrJA6V63SGWxmku4SnTILn+WZTgNkzMK1l4=;
        b=gcBgjhjKmyJm0Yv4uOagrCdg9SKDKF2FkCR7MgzBCQEFWKSGYKQvGYWeFf6KqmKpiU
         ZsW0iCVL2sg8ich7rukk1ljUowFpTWb1kO3HFD1OMYLMc92Qjgw2LnMx0CcxAJmFaC1P
         X6n1mnKbs0coFwPvEfSLRxvZjYwSb/Z4pJrs7XpQiybRCSZOm2h8zV5bOa7PKRVQV+ti
         88wG4Fa/yNcqK7Gpcs57iHjWXiBAV39jawRRrjcc69mS0jFSUop2aIDpasuLevjjBqJR
         wElRar2ufzQONa4FDie69RTwV1H0IRnOJySOzh2Br/8DoiQBwgy+NINhb3a6D3xvzxwP
         TvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486193; x=1792090993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zcL0LiMvrJA6V63SGWxmku4SnTILn+WZTgNkzMK1l4=;
        b=nYSLOByCVvZNOLrh4p1d6p9md6ABR7KEKrKYH8El84GixF72YhFsRjHQEX9pkGa1HX
         NSCdkT8zuPrLexeDcbmDORrKRbwb6wfOJb9dp1IcfX9bYHthZPXz+ufj2udqzi7Hsjyz
         rzB8p1xob0u3dKIiB66gfIjLE7/Uu4JjJnwkIeuz0qza3rKoZbL9pHm8tDszdck86c77
         PR74tdAkT6uk1Tw3TU7EGFgtdQiTFtwyYTLxff3ldc3qOEv5Cd5uyCfyyGKKG+fD5d7U
         shhVnenc+zttZusRdg1hxgb8c+ktWYyV11kE8UXhVKxuOJ30BDqa0dMYCSNKZ1G2KBLW
         iWVQ==
X-Forwarded-Encrypted: i=1; AKwUvByngd33UVvg5UO1J40t27v0gGHwS59XEbqgqCNtvPbzc/WdikbbAomn+MIhmu+JyzJvACLPj57IpU+VuW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5hZQwPdtEeguuRKcnOUk5TsGGIlToqiZitWkepmbTWobIVsST
	deZYkvMdqSEF2rtCiZR2hBvkDYzCttHXbxmL3QHHwhrprsAI5AhmuFPMlwmxpuCsCfaZJw9IbLh
	ffJsqhqI+J6tK7sYwvuWbNbnqucPafnCC5BxSODDJs8KmdBRn5O3TgcC2N2DHk5hWCIY=
X-Gm-Gg: AYBFou1HxEuRW5dioQIFxrIICAaDO9BcVLrwqJiMlUNYDBi8sONZsPTY/AgdR1ClXr+
	d384sxwpqB4gPQHGUrU/l44xrlqJdufkM/H1maAD4wEKwcGSBlSb02hmdkzGGgVwmF0UFHxZQYz
	E1ayvEXB61V6BIMCV7wVNKw/fovERmbJrG3d09tkZOLWvMY/t97ZWquZMBICItpS9eZjNArjlaJ
	gdkYbCMX4A3UzvhPTZyYHI9fvAxJ1ri/5DPuJmXfMNGow4fMBvACm1aNdhEWhdQFdofgaghhChm
	xHIrXGyH3yzY/1/Q7KUVLodgFD26dkbmbEheikrsPvoEQBLMDNAhGmdU59LbwGeNK7g1lp0zVQT
	6g51fJCOjS65+WZ00EOjK/VifXA==
X-Received: by 2002:a05:7301:1929:b0:340:e422:fd40 with SMTP id 5a478bee46e88-3515dea7d59mr7265642eec.16.1791486193045;
        Thu, 08 Oct 2026 12:03:13 -0700 (PDT)
X-Received: by 2002:a05:7301:1929:b0:340:e422:fd40 with SMTP id 5a478bee46e88-3515dea7d59mr7265589eec.16.1791486192176;
        Thu, 08 Oct 2026 12:03:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c84147dsm32563eec.2.2026.10.08.12.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:03:11 -0700 (PDT)
Date: Fri, 9 Oct 2026 00:33:04 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Albert Esteve <aesteve@redhat.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ninad Naik <quic_ninanaik@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Venkatakrishnaiah Pari <quic_vpari@quicinc.com>,
        Jian Shu <quic_jianshu@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Subject: Re: [PATCH v3 1/2] firmware: qcom: scm: Introduce new locking
 mechanism for SCM driver
Message-ID: <20261008190304.rz2kbniwviinls36@hu-mojha-hyd.qualcomm.com>
References: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
 <20261001-port-scm-patches-v3-1-17520fa3c541@redhat.com>
 <66ad2051-193c-4990-ab4f-efce0000c00f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66ad2051-193c-4990-ab4f-efce0000c00f@quicinc.com>
X-Proofpoint-ORIG-GUID: fH24ZVOwK___j2RIRn7Kc2FdR2cChP_G
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac7e8f2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=20KFwNOVAAAA:8 a=1Dzrq4baI6OGQhUDbtIA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3NSBTYWx0ZWRfXyxwqNzc7C6j9
 oav3uALmovSy36qQNNMr2aAXcEUuvMWCBKRdQfrIEbn7w/KCMFpQPPPYivqkiDrGgabcd5XfvNB
 +z2oW20EJZY5B5G2eOLWQ7FxApp9WGw=
X-Proofpoint-GUID: fH24ZVOwK___j2RIRn7Kc2FdR2cChP_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3NSBTYWx0ZWRfX62NcYsIn4owO
 58eV7xkMLJUUGqyOUlRnT3RkHTzBRSw0OVuoy9/rpapjvE36F5Fok3sl6Fyi/o0D1cb6eWNXkC2
 RecINz6mwZZcmU7evcc4lwJT3cnciwXt5mm5a5z+F8SQpVPK60yup57O0t+cFkAnteBs1oi37Wn
 b18zyrJ3SE7o42CGVpHfIKJ4lWZ9e4PkmfRteCvc70sHLy3Qmx1XglGfGqpGqoGEH1oUjTy8LrZ
 HwQTJfqV7WZ78xBjWOicsU7NQuQ8euvxCOxYqvqbW+Hxog4INagx1OaYLVt/qN7wnnc31t4i2C6
 gjLXhy+/VwLaem3+TiX4U0cQblxihFk0AAH3HLy+aXq6jge5gFEzPq4gPdpGJO2Vbfb1rflbgtg
 0HPPV9Nq4+wjJflsEku0nUXaQ+BmPGZKHU1C/WZAbPNgF5nVWT4oVQDpQsX+u3ycyzd1lIfvy0/
 T+mABE61FEcWz9Lqi5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080075

On Tue, Oct 06, 2026 at 02:57:45PM +0530, Pavan Kondeti wrote:
> On Thu, Oct 01, 2026 at 06:16:48PM +0200, Albert Esteve wrote:
> > From: Ninad Naik <quic_ninanaik@quicinc.com>
> > 
> > qcom_scm holds its global mutex across WAITQ_SLEEP and
> > wait_for_completion(). Firmware waitqs allow multiple SMCs in
> > flight (wq_cnt). If one call is parked on a waitq while holding
> > the mutex, a second call (e.g., SMCInvoke) cannot enter firmware
> > and both stall on the waitq.
> > 
> > Replace the global mutex with a counting semaphore sized from wq_cnt,
> > with at least 1 wait queue.
> > 
> > Fixes: ccd207ec848e ("firmware: qcom_scm: Support multiple waitq contexts")
> > Signed-off-by: Murali Nalajala <quic_mnalajal@quicinc.com>
> > Co-developed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> > Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> > Signed-off-by: Venkatakrishnaiah Pari <quic_vpari@quicinc.com>
> > Signed-off-by: Jian Shu <quic_jianshu@quicinc.com>
> > Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm-legacy.c | 8 ++------
> >  drivers/firmware/qcom/qcom_scm-smc.c    | 7 ++-----
> >  drivers/firmware/qcom/qcom_scm.c        | 6 +++++-
> >  drivers/firmware/qcom/qcom_scm.h        | 3 +++
> >  4 files changed, 12 insertions(+), 12 deletions(-)
> > 
> I don't know all the history, but in downstream [1] selective calls only
> allowed to sleep w/o mutex.
> 
> Mukesh, do you know if it is safe to allow all slow calls w/o mutex?

In the downstream implementation, there can be calls that occupy waitq
contexts and sleep waiting for events from other VMs.  However, there can
be multiple such calls and we may run out of waitq contexts. Normally,
these calls are SMCinvoke calls or qcom_scm_qtee_invoke_smc() users. In
those scenarios, even normal slow SMC calls will wait for a context and may
wait forever for one. For this reason, one waitq context is always reserved
for slow calls to ensure forward progression. So, slow calls
still need mutex for such cases.. However, I doubt if we have
sleeping SMCinvoke in upstream ..

-- 
-Mukesh Ojha
