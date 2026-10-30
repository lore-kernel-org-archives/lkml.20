Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349134;
	b=R2NgZDXY1YYpcCKSx91iZH7l3mKF9i7qROJ4E/QQHRGG0T5C7Mzl4p6Nb4684ZUh04Q2
	 E1Z9lD4jScboZXvd96zGEOIXHxDZFn4IbdZ/9QRc0vK27zx4cHEEbeNbmho96cPD/3/wq
	 cAS4vtLFQZVTHBFcMm9P2J1ppsusA+F/BUGYXqnqmIckvP4p7wmiSA9BkIcf4FZ/Xg/ne
	 axsmsOiQa1wEL6JUSGsNj+nq5PqOa0rQDswHPocMyPegxKygH2+PM9qbR+7fVH44OhYrx
	 pd8k289IcXIJpKJGQKiNUnqs1n2FdZoKAsF2GFmwSJ6t2cZls/d1v/5Yh+b4aVWM32g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y2nNmMULCkjiBMguFlrU+V/6B0EjOBHt0prOTM93F9M=;
	b=SIz16jP9GUGZWD1+BzGYD8aPn5aX3jsR3kKsThOvwFctfZnlPnrVksowkWOrtwQzEK8b
	 /iz6ru/9vIFhHbYGEDIllwOmTN2c8D+/TtCPdoI6TAEB67cucvya7UlI+lRzMPr1ZbGpa
	 gkInOvMkMOrWQ7G04xbaPz34vCh6f2CbfV8/6SFkjwsndwZqjN6jE6dcEq2TNwFrnz/nQ
	 2Frt+VAg0sxzAxTIEzXWx8ptlHhYOj8s97R2C7DJMPyfEDLNLHw9+QWN3aHIVrYx4EnK1
	 TVMRMqTH5UTC1Bt7vx3G30sBgArDk229Z10AomZw8mGriM9n4DljJkHUv2VXes0q/FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSWT9XH7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDbuo76s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5879606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5879606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSWT9XH7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDbuo76s
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FXdg1664291
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y2nNmMULCkjiBMguFlrU+V/6B0EjOBHt0prOTM93F9M=; b=fSWT9XH7JUOojZrZ
	xNPFNDbX8/e8FIJ50SSI2/g6RslCmTRSQ/GxaPSbzPMUPunCvmahWT2t9536u8oK
	PwJnp2qSHBuwigf7/0fq4tEOxiE9bVvAFAPP/aq9d2yrXd0A2SWylArNQdm1Q/5p
	jIMWi4xTuV3vICZA9ZgrRSklsXGJd2L/YFIXH5w7Ab5cXbcUlZACYmVz10G1NtDZ
	e4rnqncrfY1IOp6Hl5Jef/B2HtZKjxTatIlDEDkvhxIjzmLiuwOP5uJ9N+BZpuRM
	1z+GbuQp7HZmCC5LhHtNeRTBemDug82fT/iKjkxMnZIVBXbRzL3B0xhdYFRy0Zes
	U0aB2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p22ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:32:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1440e081so10599085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349132; x=1793953932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2nNmMULCkjiBMguFlrU+V/6B0EjOBHt0prOTM93F9M=;
        b=FDbuo76s05Hqc4Buply8z9wzqwji0fPRTvzLD0m3Y7em4RHbsQx7pVfNERScrCIB+T
         u8Af+UEZCDT0uiSnqg+xaqT7ob7WvTtYA7sNNLReoeEpVVYq4QIZBO/AAEoS/P3xNfJo
         XpbstX+k00Ki2C98r7M+Xu11hd48aK8NPp9QMfqKHPH+oG3YCDIFjKnXYl7yb7OauexK
         dimV/T5pLa4/UMvtSHTVdi0v/wUZxe4ZzilOK1HmN+OiPqdn7esVeFPSYdmHprisefe0
         KblgeSEmls6p0GXS37eDkbwtOoeJ1Ilu0RHCEoqKuplzBADTWutSFm/ofc6zngkdLzYt
         GIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349132; x=1793953932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2nNmMULCkjiBMguFlrU+V/6B0EjOBHt0prOTM93F9M=;
        b=jl74Z5+3LTAGb1JWyQx2ZDi88py5Q1bNF+qTqtVO+eMBosornPi8gkkWkXRjvifOMK
         SRQ6XHPJcLzluNAOcjT9wpfiAwmaDR57XN09MTnfsJ3nJObSuBHNPGHH0edNuanE6Cnt
         ORM1RwJmVsEmOC8YozmbNzZYu6/SNNTs3Cn2nvpQKMEUKFM9W6nE6ePUQVoi7aimqCLA
         88dx0uO6hlCaPqL79oP9V87mIi7ilMgfeFecVurZYs6XhNJl/61dZdHSV0N+CuKhklcP
         +Elq11Me5b2Dw/58C33Grk46c6//tFApDsbi4fyNwzzIfjiLVJSV+Cdc1/sBKJnSvJo1
         YHLA==
X-Forwarded-Encrypted: i=1; AKwUvBxLD6C/o7mdfHtse78oUBajBojZgY72i/EvVe+uEnAcfn+olNB8xlqZHJqi7QJgePASA+rJHX6Rzinkwk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6zb0YuXxAjymou3Z0cFWNF5xxN4/jOxpXU4Aw+jEsl4lqRd5X
	5DDUpsTkwNxuU12Agp178xGGOaqj0IO2SRLSEVWDA3efbdECnUlfdJHOBt9zX0mubyJdcwm4rUa
	PnktjNvhwdOP9byC08ZfSuzT77/b8KBabgZz5FfMSIrKxUj1XaOA1OISzZgW75XNlCt8=
X-Gm-Gg: AYBFou1vK4v9Pu33WLjWOA148vLHmUK3vctEOAIQaOLV4uDr72NqfJfAyqti35jdLNs
	YAOoJevOaZLymTLWco6RfWO1zDQywlvoBjEVgoN3Cc6AzuCOy9QtyR/eY140BAqi55eVBXiKLcZ
	sWeMyyLB4fgvQuAAjnzGp6VKgzBlwbkS81J4eBvSQWPB9qkUn6s4wx1rSNBA+6DrKpg31v64Lw4
	VhrYUGtDJVGWy4ODRHwg3F1wC1MCURQkhzVjW6GKiFkMQgvjbqU2yFdSwY466WhRl1x8YStDE9c
	mABRp1xq+HfNz+O/4kl4WomVMTOMOa/7nWKztO5RvNB7i0FpnN+UTZN9CLF9EdCoOt2U3JzmCW0
	DPlXnkID/pMP0vdKnCtKu2LyQxZ2veMTnfJ6OYmer1vWydZWxKDP5K4Cn0WWzaPEmgFbPv7U=
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr260516885a.5.1793349132176;
        Fri, 30 Oct 2026 01:32:12 -0700 (PDT)
X-Received: by 2002:a05:620a:870a:20b0:944:127d:f192 with SMTP id af79cd13be357-9442179be1fmr260512885a.5.1793349131606;
        Fri, 30 Oct 2026 01:32:11 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd22bsm39044966b.28.2026.10.30.01.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:32:10 -0700 (PDT)
Message-ID: <a2854c0f-d900-4f40-a28d-fb55aad17aee@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:32:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/16] drm/msm/a8xx: Add missing a850 ifpc reglist
 entries
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-6-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029201730.151754-6-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzMyBTYWx0ZWRfX3HA5lbieY2tL
 ODrXQrGxg+LlQpjgH1xlwabmTyGim/DBR+UDsGlp7X6ptyj6wW0bAIiIfn7VgDMBKxalryQvXoL
 ERLokDwxgO7bYE3jJ6cY1HihMsQNvZUHAkm0hyA5olnDUeFAetBEbsDqghcu6jblhLVQlzqBkGb
 jj559HGNJ44YyiyFTlQ00EGIqGbh8D5ejWfjGaW5vCNx0YVUjSvGD3ybfb+qXVIIYPPkHv8JCMR
 zNLT2iPVDyHz9U2KzO0+sJfsGLgwr6j5hvDApxhTtEW6IJ8JlGiqMemziVS8/kBToP3FUJ+Zw8E
 3EY9Hb5848V1c0Lphkv5bvJFf9+8L+dlx/monM9FOOcK5/txEFwmoZ9TT4i8Mf4oUyJbkpbmPkn
 i9wmH9XERQtrKUw5f1AgmimIwaIgAIbJyp3Y8coV41ZeHJS2LCXDxzznHwZ0ZuO8BjM7rWWlE1c
 RO5AxPlP4xEWZ7PUlDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzMyBTYWx0ZWRfXz0SdbslRCMxN
 rVBny5aLzqaJlGJzIp0gx7KkbufP7cJ3T1YdByJ6Ku+kjnyIudKE9jxLqqHDcsOew6gRXJXp0t9
 s5u3cCupHmjhLl9C27+O8lZ8JBbIueo=
X-Proofpoint-ORIG-GUID: Ygimbr0E4oIZlzBhfmD23KmbJ5Ek4-bH
X-Proofpoint-GUID: Ygimbr0E4oIZlzBhfmD23KmbJ5Ek4-bH
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4560c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QS795xsoLWCajuJlIHEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300033

On 10/29/26 9:16 PM, Rob Clark wrote:
> We want to save/restore all of the CP_PROTECT regs across IFPC.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
