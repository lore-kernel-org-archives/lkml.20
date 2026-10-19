Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7324D6C5E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406943; cv=none; b=CE7chUDBabgEvNCf4fZ5dNEveemZcUD53s2gVhUjQ1yZulrEmU28WMyyYua+l0mzS0O+s1uSU9/SNhgj5j+7Dq5tbMdYtiBnTQYTUXjkGffKuEwjxipuY2rmdb09aS2d2KnZqdXO+eXmDyiqLXyqgyHVpJTr1uowFAsnd5d8uF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406943; c=relaxed/simple;
	bh=7CJ1vwF/ABQg3/G0LKwIOetPBmMUxmnh4sqqhvOCoFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVFkPTHwFPIeHuE7yJ7PQ/qmObtjm6wLGxmewj0mBVpxUm+4HdeSj9Gv2MScznXZVgzATtQdWPjk3bY86ffTio3JtNFpwcYG2hlMxNEPhn+K6Q9zqA9p8rt00otpEdgy59e1/Qbqr8WqB/bNl7Qdx/C3xKcms2lyWHD+QUJ1hVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5dBz8xo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2wsDMJB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5dBz8xo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2wsDMJB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Oqg63256584
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mT9pGEhM9TkqrI8yQKVArxrG
	5zf0RJAxHkhCNo1DWs4=; b=P5dBz8xoR8WUxR52X9YxaQYtq++PKHRxlqwDK2Dy
	3vsR48sPuO1nAfhnx4qSWDNzmYyZU6diBohgUqxRgJjm6CcclvKyJinHGswJkFx3
	uKwgSve1CyXmCrRKrmH41ur9AJG7f5b0vIpvpXFE52uOU0VnbA8vchXkbust52kD
	OWpqrYBUUDhQKo9GrZa3XVMgrfskbRBiBpTYf/+HgoYdpf9WA4P9yQnoA/QPY6Yx
	GJchCZT9cVREOxiVxq12Rqdbrx36H2O149PnM7arxVJ+LsMnwYPx+WcT2/+Hz2HI
	xgMC9Re/CC95q4CwDraDyOkevfl6RMbnBs9ZKxWgMl2/VQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8pct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:48:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso700247185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792406936; x=1793011736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mT9pGEhM9TkqrI8yQKVArxrG5zf0RJAxHkhCNo1DWs4=;
        b=K2wsDMJBcfBiLqIAlNMI3eQwO29GQe1FqqS0uR5x0Yo05Mv4JgJT9fRUlzNMGDsTrt
         IKWohp5BtZQ2kKWjB6fMNgblIFJCEDG5GGN2ZCJh6T4D4aZqw7FCsUF66lpcv2lALc66
         dFwglSyx1HjbDnlMyuCuHWLd4XPhIudjlK+nWFBB0wzPb2ogFce6AIOs0hLiSOUzTfyS
         +ngjhoTLNt4CfEY6j91FYv5wtb0eadMWVEYnGPhlyWtoG9JUa2q2cvIeEoJdTHlAkBDq
         8BkIoXDqF6mf1NlDMsCzHkqNEGbtAesQOP8ZSqP3Gmf6CqBNa1cwvl74v0rzL0GD9nhK
         p3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792406936; x=1793011736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mT9pGEhM9TkqrI8yQKVArxrG5zf0RJAxHkhCNo1DWs4=;
        b=FAlYbGVYNELeOtJc/8b3drOdIsauk+yvWJZpQQM187Llkuychi0iiThb1S2BPrl7Tn
         fx65Q9kTU5gg4h/bQ5V7vNZ279FiM/dhsg0UwIaVhCophcS0tYOl6YJNH5t/KzTQ3oOV
         APsIojkWBLsWKXH9pLKQ5oo6S2Sz4j3DSAAwlGmautLxtklP8KUGhtUYdhPqKUT6fuqF
         uPq+diibVFwb+r095Ba+kGm/zLtLt1ukm8KSzkuyxwjW9WvwZV5otGuXSvu33BgHA6Oz
         HKeLsHq8tiPZu0SNwyTw6x5tcmhipdE3P4HA+ETuQKYlsUEc/2q87yBiw2fB959kkrKV
         G3SQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjqQThVrrHaFcM6h9q1w46fOy7vWA6loYRD5j1wdjl43CnfR/DAQ5OsmMk5wMHux/mIRyOOCU9ZLlC8bk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8gi0UoJQbaK5somVQYfFkDL2a0Fi12wrZNHljP3OHWxsxRKpL
	sOSLZg6IeBdTb3TSl6nfrpT7EPspJcRhpQDR5blpB5m8xTpZPA0IzcPgGpJtXjn/9l2mW/3hd+x
	xGv6S6gQc7/Hs6ri1TQt94+IyaaWlKXMVq+8C1nalOluoNb5D8cDG49e3qv1aA0p0zFU=
X-Gm-Gg: AYBFou3BnupDT49oOi19XSkuRg+euQfRoZ8RKqy3yhVAH5lV8AOR+YEPItkaUhf2tP/
	fLQaF18Hxc8ofRd6SU1WpvJHXhBxdj1p2GMTxjR068lmuu0xYsI5tnljx+FnFj3B6iu6jBbUxNV
	D45gJDV9WexBbNCTWpeEabGla3fFjlAMHWdabxMWS+wn4vXkOdb1SvZ1d7XuLHxJrZAFHQd2uDy
	nok1O/AqVKpMKAcuTIpLWnf/Xo/D/kCSqlMEO0ZZOHfg7fAaDg0wCJYLaeCnShLwzkiKIj9AKiO
	LrvyeKibqu8uMj1CIakccXJIm22vth0CDTb7XAMxZdJIgiCt5r2n8cy4nDGCJpB+I1IlQkAoVuh
	E2ga0PCEDtQYnE4PEVN1zUZHjlBb5goT8IdjAkZRAyReut7qCZ9Lip7B4AftsPJhDGytCLPlsOZ
	hp/LDIUxEEI9eV
X-Received: by 2002:a05:620a:2609:b0:93f:2938:48ba with SMTP id af79cd13be357-93f29d9616dmr1189025285a.55.1792406935917;
        Mon, 19 Oct 2026 03:48:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2609:b0:93f:2938:48ba with SMTP id af79cd13be357-93f29d9616dmr1189020585a.55.1792406935510;
        Mon, 19 Oct 2026 03:48:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434a7esm1888152e87.37.2026.10.19.03.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:48:54 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:48:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
Message-ID: <cteiu5owhinqz53oxcfywioew3kh62c2jbcej2etobfx7awabp@regtmdoqc34b>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
 <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
 <36e8a372-3a4b-4466-831a-2445313dae51@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36e8a372-3a4b-4466-831a-2445313dae51@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ppbzxw_iFWSYU_nJ1_FWJsUmykgI9V-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MiBTYWx0ZWRfX75phyYHRBQY0
 Huk/l4okdazGRsI42psj/Hjj5gSkusjvzk1RFYTIIcVlT1echXbUEoLPKU+8CI+0qh8Jq9wBf7k
 xu8bwXiV3GyRVvFRPCM0dy+l2e6+27ihlwIPOefR2GTaO7EUSUkAzqGZOFUSr7DkZidJNfKXn+i
 hW6itSgYnUtECPLhzsKUqYrwspiCStnG3U36lANmCjUHjJ+TyNbDvs3hd4lJa78kmwQhzJ6mt3e
 OmXbpIXP/Qc6Ea2mBLR7an84z8wVsnyviV9Se5M7/OFNDM+DOFlwdsQkalgc/1UziHT9M/Fewsh
 NqDr1K45vLhp2hP0TgiosOGiOHWkdWIXOJGC+/kaXRVdE1v3BRBxvwSRF17lKJs7XhoxZ1o4M7K
 WjQHiQg2pi1luLSMatKS0fRAP3lclkJc0KbO7QXwOTug8UMZws5vpvcX+VqNfAB4MYld8y3/8TN
 QGCF13HrUppfWFyt+qQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MiBTYWx0ZWRfX5q9kbpjRgWV4
 zbgezTRcAdHzq6nopj6teclF+YkxjtMMICRE3fjlkBXsX1ofVEuvxj5DVxlv2pW/SI7Z1E5J10f
 6a8WYIsTf1I+4JdgMVa6A+f78q16sv4=
X-Proofpoint-GUID: ppbzxw_iFWSYU_nJ1_FWJsUmykgI9V-C
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5f599 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ciNfSeS1p6VPI-OA_NsA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190042

On Thu, Oct 15, 2026 at 11:11:08AM +0200, Konrad Dybcio wrote:
> On 10/15/26 11:10 AM, Konrad Dybcio wrote:
> > On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> >> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
> >> the wrong address the mux driver fails to probe, the Type-C controller
> >> and the DisplayPort controller keep waiting for it and the display
> >> subsystem never binds.
> >>
> >> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
> >> Assisted-by: LLM
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> > 
> > Hm, there's an ADDR pin on the FSA. I wonder if the previous guy had
> > an earlier revision of the board which routed that differently or
> > something.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> oh wait.. the previous guy (author of the Fixes commit is you.. :D

Yes...

-- 
With best wishes
Dmitry
