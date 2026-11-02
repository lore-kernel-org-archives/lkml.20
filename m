Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615330;
	b=z4znbG6BwPzxDk8fM1kBoMGjDAXif2nqZ58+oBuS+nTHwufxpMcCs2eEW2/X7UFW/Jrm
	 ITjQmwOUZ7QUPwn+FEbJgdTV49jDYWHwC296IDDaL3UNPP0LchZ/buJ6jso5OlnwnqD0y
	 nGGz6+iw+B3lrOjvCKgEgOEXXUBy3hdQgpOXDO1pQzNUoP1Ceke9IQfBPohwBiRCkbAsX
	 77QUQXoAT2ZfXcAym9elD+Gmuq3+7kmVJZJoBVi6kwmrh3WyZnAMj82J8OljXTKJZWVX9
	 C5ShFP9qy9Lm/rmGPIqhiapyJvWlO9Jd/Wf56msedkDwq5GOa4yh32Lv3bNGEUfx+Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GWPR9dxJ+6mYEfqzZ0xvkf12jtHOjAmnZXogzpguUXQ=;
	b=H8YRprbHxgdFM9AmnAm2SE2fLk9Stx2XRMEBcWLnyi3TgiZBLCKyxLOod1/p2uGwF4jf
	 PGIdOz9i+kEL4khcN4W/pjBfyaglbIjd+//T2NOVNQ+4/fvkbVw5rH90Dbs9Q6BsJI6dd
	 TJ3sV/tGN8bVO5TyMYJoTnqPLSuIKc2BwnIrz0EqDyTgym92GGqrPsdkxNrYzXh/rCOjB
	 N8BE7suOx5tgLQMEhCmIdzZ8m//ftp5fQH1kDn74mNZ/VH+dA+dt/+5inu2B/irPU1Zj7
	 0TOfkrhCJYRyfi2I9XWBr1BesWRo2gjLYdhQB3pBr338S+F0N7U9MSWSkbjuDXluV7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0npo413;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmPs3zLw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8364B606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8364B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0npo413;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmPs3zLw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B15p4015039
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GWPR9dxJ+6mYEfqzZ0xvkf12
	jtHOjAmnZXogzpguUXQ=; b=A0npo413P0imsetLspBjs262CH8BXVYjcjpv4jk3
	Dg8z3cG02zDKBgSC/kTP1WukPF9rJwzzVP5q0lGoGHPV1qit9zluSZkg3IhlVqSk
	DM+qrXx9XX418xuZsaGUxf1tvpB+E+jDoVL/2AdOeWjwentbj+xRJtajk/jdFZBD
	Es/FJwn7cdJf0SlOR7xuqrtUNuX/T9FM+6deYmjK6VyQCBi7MHzyPprP5UZVUp8K
	FINF5rjZ300Xy+O20HgvCDAcoWhtZpf/VguhYL6yEGJO+zUsvkCxw0w11MPXyNhe
	dr5AAHvPbJBRlL2iK46bOVFw/ylMjxaWHYHCjOilN8O4Hg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pk1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:28:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c84af45c8so59042336d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615328; x=1794220128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GWPR9dxJ+6mYEfqzZ0xvkf12jtHOjAmnZXogzpguUXQ=;
        b=UmPs3zLwAdyfGNhUx7St/0HCGCdeo9HV1T9c9qZcX791SCUGLuJBhj9iey9Egr2Tvp
         OThVrDAdJhcEpwf/0etF7lHGeQWuMmOaBoelnzT4uyPxwHbxXoAsX3n3H5pMDE2KbfDZ
         5wmGmIfq21q9CzKPmCmJvDcSpEnn6jNaZjE7rDankhFxbC3X/QXoYPiTJYKmq6P7zIu+
         V9lAAC3vIjDP5nSKuffd2hSaqTTLKOy1Hig3fG2ksLLbcsVLlTAqlASyFB8VVBseRvjO
         bY3hGs4h1Eh93rqhBMzb+XddeOwzE9kuNIEjpuZA1bF27eZWDtwINuQZlNwQiAdzBx1q
         Mngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615328; x=1794220128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWPR9dxJ+6mYEfqzZ0xvkf12jtHOjAmnZXogzpguUXQ=;
        b=fmHJmZh3BwifjKjOX6v+pKgHh9W5jq5ITvUWH72+DaNEoTcvhxo4Xxwcmlpb/8C4me
         hSTPl2Y1roTKt/if0FLgo+eF0l9jYeT/zvRigrBtONnA+drcxeBnN5EYzoMbZJbU2Zh8
         SGEekQWGD3tC/WUmgpAVnJVcDii9L9+ncpQ1zSgZRmYAjFrQbgep4V0z9bbFGi8WDd7z
         87geXVheXNvPhHZrgN0H1XWhIZoEFdXlM1ZYNMqePmEHaRDnn6EeXaryLMQgiFGMZWwb
         kee6hC6di5nmMR85naFK8QDKANfVtYCAnOZbatNkDIHXhV5RWVvYY2XvhPmkjqtw2AvK
         eh8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxdJIPvFuRboiqQdxmQ4hYWFBNDEFK5oEOY3Lqm1+CDy51X/S7DxsKpq/3TjLYJUJgASGS+AHu5pKTbvBI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGvK/iFhbx70gJTxhqS0yX32sCI8GRnhCzfCOoVbyHEo6szvMO
	F/zmIlMhnfn8uUoF0hSgYmPYVQc7nXJozN6476cZMfcg/fujA7kV154OF/gJO6oI9FBHuOuiu/m
	VdXC/xDKugbyh4y6vg2bz1FnkRYvCsBz8ZHxc+2BDrJ/1mYd1SzZLycVDUlVLbGdxTCA=
X-Gm-Gg: AYBFou26CGkKnRWL3jhawl+Yl3CjrbtoKFo1LBWCuwkLL5l3OJV/IsZJTvXjdn3rqci
	7ueooW4XsRQFSj8t7/f/RnYhKWZPPgQCOYaywt/xfOqqYkhqj3fuxdl60v64LoG1qz+Zje0NeC3
	lCA28Jz5HEsARlfvolp2ySfs7cYVg8XHf3nHLDlXXa8D0SzaVpz+xjh/jH84iwu4NxpV4o/PG75
	hMsQrZu3H5ymoJ4XEKo0/NRMUlOop1oZ9cuGkBSzk1eQNoo+SevVQ0hGiLnD92p6Bxk82CSlN4s
	Ra6xBV5Byo9A/LCYC8ok0HjqXsxN9fkIiP5VBnBKsIfrDDMZgmuUniZUVzFK+JcXa4zTQNfqm41
	DD6khv8fUQSIqZdUoLfStEMgDF9xksf95mKrx/1uShTwL7Wo/X1npl1pMrKAekfzsyy2nb+PT8V
	5Ywa4HDsFYNAGbWVRUivGqvhd9eZendaJlDzars7OLCJ+UoAvaiBl0nYKn/Eyl
X-Received: by 2002:a05:620a:2984:b0:93f:2e7e:c818 with SMTP id af79cd13be357-94421799c57mr1645331185a.59.1793615327688;
        Mon, 02 Nov 2026 02:28:47 -0800 (PST)
X-Received: by 2002:a05:620a:2984:b0:93f:2e7e:c818 with SMTP id af79cd13be357-94421799c57mr1645329685a.59.1793615327296;
        Mon, 02 Nov 2026 02:28:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072194csm1649332e87.15.2026.11.02.02.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:28:42 -0800 (PST)
Date: Mon, 2 Nov 2026 12:28:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm/gem: Disallow nr_bos for VM_BIND contexts
Message-ID: <pa5mluujqthv2ajikpoejheure4vswtbsu5jry52ek6k3myikr@heh6mx6y2gnt>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-3-robin.clark@oss.qualcomm.com>
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
In-Reply-To: <20261101174911.25184-3-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Y6OJw6lAMqma2alKjOlCnAG-zmEjUIUR
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae865e0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Mlro_P0Azzi2O7fenn4A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Y6OJw6lAMqma2alKjOlCnAG-zmEjUIUR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX6m7+d4B5kufC
 7/RzHgDtv7eAflGjbwO+PGgx9YotEsJXoUGyJMmcEqJ+xcnB6GRGjykwMP+xxfARqnv1+eHLvvd
 dQbLskGlw4/6LqmZwniL4w9VYyL5Hgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX7NzqpZgs/2yJ
 7Pjr0e3FmTWObnqYlSf+NLxb/U19OpWwUqnnkKfNY2Yh0K6zLZrQIqfuzzvtRQC98gL4EU8FuJg
 VFm8Qd9Hh6tW8UnaHjauSRePhj719RyTPBsicCrRxRbRdmkFUSeuW4TcIw8KBlTqB5QY/WGQAqs
 s/5th5HGzEgnCkPj9NdzQdd945qTWm3luO1oBM5giv/qc/a6/avcZN0zv/DQ4W5os0U52AkBRof
 yFmYC38S0GNK0hH4bhMi4ae8WiouVGoB3Y2UEIAdM/pNYak46MmK4O5r6IhvpynGlNzKA+TOv0E
 Jr4KwxxCF80mBfrj+6+Yz1Y/6jBuFdivHm3tAl+suBmFea1ZZG3dBxYKxsJYAANH7yFQc24WRyL
 6kOWX2CNJi9RlyCXrZOB1VY75eyvHlKzFZU5y6OmumGCs/QMSJbZYz6EBduE7e9YfwQWY/4RRu8
 CRSAh2ZdNgQfe8BELKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

On Sun, Nov 01, 2026 at 09:49:10AM -0800, Rob Clark wrote:
> If using VM_BIND, it is invalid to attach BOs to a GEM_SUBMIT ioctl.
> Only the VM_BIND ioctl should be used for binding objects.
> 
> Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
