Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBFB1C5D72
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066045; cv=none; b=THRbGa3kYHEenpCMEcyIJevWGFRCVYH3bBXVlw5FvMcIECt3vCShPUz7IPY4ZGw4jclZqbbr4VR5tht0/LJCkiIal7geZkVxfJQM9tYROhK99NehRovO0eMsjr/xSkQAyn2NIbrM9ZJlvt9MTroyrXMUI3bccAFt+H5zqVnAP9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066045; c=relaxed/simple;
	bh=kOE+PvxI+4yBG0TNtYvk0ZajJYnO90dr8q6q825hdlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSxAfwiMFGYZhuQLu5anULC8sPs4RfyWhR1VfQTjndGaTFbRjk2wi+ASbP1n3UycCwLtTqVvLdDrpZAdW/eSb74BLC7t6j3W0axw4YSEU86Aw14ypqmDQp2dw1FIi459nlJO7SxmSU2lK6L7/89ko0ItBrwBPyQ00AVgdivgs88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQ4mZEd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mf4WVqkf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQ4mZEd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mf4WVqkf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693Kotd61306028
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 22:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZDUY4/VeGKFBMA4JwOSyOd7J
	xyUkDkfT0gF/JVIGPn4=; b=NQ4mZEd3FAsW2dkl8OqrjjtKWfP8wtAPIpaVmGly
	Yp5EhqD8FO2JGnZmIzuwX6gvBFFohxXfxZMBD6fD75OF2U1q+LD0GTz1G8Ber3ek
	NltrQakv+zZRMtlNxOUfSHu5GUYAeB6o+MMScpkwhVqvlqhfDGUtMCJy7qPnpnyl
	whqGJErcCbJjqDFCBPiTtJDt5LbkDI/CsOwHPXrldej7y/iPTIKSQgMnNAkPGFob
	QTwhoj/tfMueJh35z2l2zFe+XtMBoHOB1ztJxsIWL1MaTeoDuJTOxhi1CfS41bDo
	Xb4dDAoaISke0Rv+DatI6ZbRXrjls9Vy76dLYO8AYxetCA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sx31w6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 22:20:37 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c10b8abe29so702906137.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 15:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791066036; x=1791670836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZDUY4/VeGKFBMA4JwOSyOd7JxyUkDkfT0gF/JVIGPn4=;
        b=Mf4WVqkfr9qw86kTjTyeiAF2Q0tvfwbFUrtoLezj+dlJkim1hh69dYbY+P3ASM1JCa
         l3A/5G0j8CykF6TfKkvVH1Sp+/wwJ65e8dTIo5S5kFFI4iY1F3rdC6n3LLKdnJNgZB6D
         F2N3XAP9R/mTz/WmHUmVILzMD4vaJK8tEyQ8528i3QGcad66AWzU8ELYjxtp00FY7A5C
         3VazIzk2rl0l92CwQyrGBIteiPa4fTgL4VzhSYlZJsnjaWKXoNYP8pfvQHJvar2oByzx
         C38HKTJyWVCkf9OduqKM4hEpD4ekw+4Zx0L7CLdOkeLgfd4aqua0rMECWGbSjxymga8B
         HbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791066036; x=1791670836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDUY4/VeGKFBMA4JwOSyOd7JxyUkDkfT0gF/JVIGPn4=;
        b=huN9sO/98N836j7N422mQDhhjBTyEM9dbMrret2DgzYv/Ovq0D0qrhxaL2c3rozyM0
         04w3iK7H/HkSHa7CCtuSN52yPdCxkSvYIKxNtTXM0s59iQWaTk9lgRw6C0+ew6NuP13x
         oNMATWQALwgdRWLlOFFf++4lzg8QEjK9sDq2ElGt5RI0DKnSTcjti2cXwgnvZ+L4d093
         HqyWmiSWyx6enDD2p3wMlCzc4/RicIHz6xHouu44RRlrbeHlzDOyGVheJoVq+YUg7Sq1
         Ha1URSgBVUsCQFegszcAVmQN/ofgSPQLAlJ/lzKOiqEAoHPF6H/usY7ZQb8qg44sKZvY
         T6pA==
X-Forwarded-Encrypted: i=1; AKwUvBzyfYr+46aMj6OIszKkr2UebnsPfA5e2n97c0voKX8ACWhkjbkA2wtK7BKoA7Qp9Lcdt8Jq0cVA/tz5BHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIohajiMWSPGqE5mD5FkBK1bQ83PK/vagdWHNv1hXS4mZjggV0a
	CSeC7X5wTW8z/UPVek+Fsa4anrWgkjO4cp+/OZXWR760RWZwLBdo2T8C4B70mXE024nwe7hgh89
	gBvK7O80SCkpJUwKJxHU0w0xwO56ISSDOcet7BbzxJMe9irm0L48ZA1L+8zvRg6uD5zo=
X-Gm-Gg: AYBFou0lqUWCudXIA83UVE5DJ1yCM6G34Ch6DZwhPru9qK9sf56Ep5cvleK3pCRMxo2
	F26uuKDo7TgUd9LrdFFA5GzNUGHf0GEfuFMF3jR1ffFQ2oqkLQds4PWyyclM4KGFEdgAMPAi7TW
	bne7+7jlZoDH/jl29aUh63lF0Rcs4eIxCBrU0DCcl1sw4zJyepGUY6+5WF1cv7J27B8W+L6OwkU
	790x18OeiMs/paonqLPDYks21u1S8LUwmf+Y9SyVi9Zz6htnXKLggEEg7OUuItXABYwmztV0u61
	67ZrF3fzwqBbSEmlzx9MW9dAXGaltpdWNd1cqiOsXpf6noxy1fW/3Xtn5nQK4L8BDDusfQHwi4L
	68MQz+PzpN3adGBbag4+oQRulCOgCAQhp777c3XI7UlW2GsZBj5IpB3J/OEv3B7/40z59Uo21X/
	RNapbaKjhVkiwP
X-Received: by 2002:a05:6102:3c89:b0:7c3:a114:99a7 with SMTP id ada2fe7eead31-7c3a1149fd1mr157074137.14.1791066036380;
        Sat, 03 Oct 2026 15:20:36 -0700 (PDT)
X-Received: by 2002:a05:6102:3c89:b0:7c3:a114:99a7 with SMTP id ada2fe7eead31-7c3a1149fd1mr157066137.14.1791066035847;
        Sat, 03 Oct 2026 15:20:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e333cf3sm24109191fa.39.2026.10.03.15.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:20:34 -0700 (PDT)
Date: Sun, 4 Oct 2026 01:20:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com, akhilpo@oss.qualcomm.com,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        jesszhan0024@gmail.com, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lumag@kernel.org, marijn.suijten@somainline.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch
Subject: Re: [PATCH v2 3/3] drm/msm/a5xx: Add hangcheck progress detection
Message-ID: <ffjwlr4kc4rxb5rktabvuplrz4kh4zrpki7ctz6mrkdtyjvk5f@r4easyboav2s>
References: <20260930-adreno-progress-v2-3-3882f0fcd7b4@oss.qualcomm.com>
 <41bbbfda-de3c-4ecd-87f5-cc784fd6483a@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41bbbfda-de3c-4ecd-87f5-cc784fd6483a@mainlining.org>
X-Authority-Analysis: v=2.4 cv=JY0pPkKV c=1 sm=1 tr=0 ts=6ac17fb5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=TF15XWlp9_Q2BVNvarMA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: MG22iUjVFXmW2oiJ679xL_HkQYdS2OPw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA4OSBTYWx0ZWRfX+4+RMWZvuvtV
 tBMjHRklCfruOkgvcF5SeNM1SYwAO8GUG+77OgGcdMntdOfH6byNXE6JRSNDqVJt6ybU8IGQY7p
 nw0805jX6GWuA0yBUMt3SbcDLm0/1PI=
X-Proofpoint-GUID: MG22iUjVFXmW2oiJ679xL_HkQYdS2OPw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA4OSBTYWx0ZWRfX5Dghh+yYk1BO
 MV2CBsLhAkc1SWorqo3Z3UFzasyoqTKG2R1ruMFBkxtyU4UN8fN+F8/xAWkHBozSjd2xoI/QI+U
 bjDQBS65nl61aC8G3CD5XjryiQVuanI5VY+esOtVZOErvHnvtoLCyGzp8cXz0ANlJ2ryeQzD4fF
 j/xv9Af8voz+Eicw3uLrDDu669SxYKqESw3wrfC3y8dY7LleuVF3PHesH+jUVgtla0SH7imxanu
 5tRGAZdhlgpPkV9vqP1E28B19pZTzFeIbE94sKUiaevqQ2pduiVBka9Ye0iFkTSvRdVaTvfWoO0
 V9LVEqMoCp1X875skcnfITTdVQg+m8dvHfYzasCvnTtofb7Geibj0qLm03/4w/GaIq/u3TLCtsW
 9AjBw81u3owYb1958uKq1C4IBf5xO1cSjG/HybJ3oe0w5qVj6/o4sXAdyRTZ8BuiIuu2xyMvbEH
 3JCxL90Ea9VAdwvQgiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030089

On Sun, Oct 04, 2026 at 12:15:42AM +0300, Nickolay Goppen wrote:
> Didn't solved hangs on sdm660, but I think that it isn't related to this.
> However I've managed to get a command stream from hang_rd. How can I share
> it?

Open an issue at https://gitlab.freedesktop.org/mesa/mesa, tag robclark
and lumag. Please note that for sdm660 you really need the patch at [1].

There are also several known issues which affect SDM660, but they are
mostly on the userspace side. I hope to submit and fix them one by one
(e.g. on that chip there is an issue with the blitter programming).


[1] https://patchwork.freedesktop.org/series/174541/

-- 
With best wishes
Dmitry
