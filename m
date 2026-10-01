Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698063C3C08
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850406; cv=none; b=pONSx+stQhde0TEqDjwUTW/4PiYK+VOfMjXktqqN4egX5y7uWFZw5mAE/59DFxjENdr38FSufNyKRaxiIl7mNLdjOpryJdhiWLd0xYuUMDN7vax9EkvO0nuE3rzFLIDba+S2LpuCnq7+SxG7fu1DsO0sAEL+XaKrIQ+y2gNgkY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850406; c=relaxed/simple;
	bh=N2JcS70y3AkxetkeynwcpCm7ih+SESJl34jmKaoxOiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khg4SyVj0flOPfs6XKeuzdJvFQZHRBiztrjOta+5UMcdiJPDocliabJ39/+72xp0z4UyEfCMgeFrnoMRJQohmrIoW2Pk71kr10PpYiei3XmusSLsDHYZWrr7/Ym4eoEQJyYi82wNb3bUzHwT++jUVgZWP3yHafHEa8U312gWNnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gG6oya37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+Jhb+G6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gG6oya37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+Jhb+G6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xcfX2176973
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 10:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btECEzNcIUrnRhydSG297BC0
	t1Sy/7JZkAmu8xyyFo0=; b=gG6oya37F1zEmtdk3v4kdXz16qy2VnDbEy55z8Da
	/fx2fZLwmZUyOqOWTJLOo9RdzaqlDVWb0G1bDXm5NHFH0upJzogdB9rhJb+fEiVC
	aVTPCT1c+Sa5ad7YwyuSqwfKOaKumMH664q47+HQ15bSZiVZU2Yt8qLajzGstwwZ
	+1j/v9+JQDRGcf0q86uvdjfldFlhoO5nXP5a+AoOw6UyamhYkAi6hzxL+3MTGPh2
	/eRQl7sEiZUgdW+ICY4sooOIz2neizcRBgqcWa5NEM5im7GDiA3EVg+YPtLhlZzN
	jA/MEOLAabf22l2s3UJNndVThhpC2AtHEbA7tftx5Hq1tg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nsb2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:26:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso2814086d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850403; x=1791455203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btECEzNcIUrnRhydSG297BC0t1Sy/7JZkAmu8xyyFo0=;
        b=Z+Jhb+G65DKx2ZchSh/T8LHOu2lwb/JIzYqVydS6DXarfVKWnkqIkcGZZI8REFHIQu
         RSnnvrp4TPhhQNyF0HTMfH9hgYBcElMNcJFFkwIM8aeKBxs61Fr/VBszKsgo5omRVyCx
         SW7pvWDdWVefH8iuhAI+6jp486d18VcBDwuS66R4xHDC7b66DR1SXHczxsJPxfb6FZCi
         gdYJ8DjzxADvtOfbn3/9Iz8BHEIpy3OixMZ7p5ZGVqQ/givIn1CHSUjTf5xORvg8sENn
         nMnfbPYefTb+wbpp1dOD2kRMstsiSU4AWRFDWtCxmeJhMI5+FgKVWx7VIiEU5zM+wHqe
         pHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850403; x=1791455203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btECEzNcIUrnRhydSG297BC0t1Sy/7JZkAmu8xyyFo0=;
        b=hbefFfYNb2poiymJa31j8FEL9/miRm3s41rOU9sAiUT1q+XKDwc18NCvonn38WbbOj
         ExrWxTb3lPFVXRmN4UXCzocTKPLguUNZv0jj7FOl4NWODcH4i+m4XCEejw5eM0pHH+WA
         UDKoBtZOlT0FMtMvyluQtLnh1UZl9zzxsvqOu52rW7jN8n4EWHbEcwXbZLYMckg3DoRO
         42kF61HTDYtCiF30W71uQqsGwz7gua2vkIVhWEEubAgmsWXraNMFGLB6XMhCnepRxP9p
         l99YdI4SUX2QJZhzxJe/lZ6Q1/6ANt3Rz99pm9gNT7KpmA++JDFstwDlmCdp3K7ZX3SN
         VrhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk70IQ6s7rJd9rG+/Q5qF7Fv3pYYl9rQ81EDOXtJ2H7VOvdeQ/qK90b1FGJfr9Qzh0IJVTU0WgDAifOKY=@vger.kernel.org
X-Gm-Message-State: AFuF++nr30TNHmIxYkr8CoegIeieqbDucQ4iYA0GnhuOdwdfEy2iieUr
	C9kYHifSvr+PXy2ugi+BqEhQdLztd9K1X72IHcyDlRcuzrNoNkYdtUl0zrlkdthbF2XcnhEUYbQ
	EciZnVv4TB6wWguIBZMPmY7vnoyRPiFK/L8gp47LpNuBE7+emOvB9Gx9hy9a86uquVxg=
X-Gm-Gg: AYBFou1Ames7q5V8kaSTJXjQQ7VFHRsXdmctXbTBYEUc+pm4NyxjBntBUB9dpNZMKOs
	f+sIeK0mTjsmX/02tYnjO+2Sdqha2Ky56rxsXIZa/9XD+sXyXjgMo5wkwkFIC0LaRh6uN1a5w6L
	omaJULh50dJ5SvTAxWwsS60RLH1XEG5jtB+SN/DoZuqLQdytDzA5nCjQW8OOtiBv+QQEyt2WX8g
	DFZ8PvIKsdEZJwnPSjcOpzkEtFpTSWVLc9oHOMY0/qGitbf1VOb3+gHnujkD6afWTr+lZa/QDQO
	sHyncFaTqraqLD3zT641Wl4+fOkE4xrI4GXnQOy7G/CmZqDFe/qcSYYmto2/fzlGnF96YYb54Nv
	IaMFsosXcUm99c10GQA3fAbldkaTXySFGbo4eClrmPK4hSYPLAy+Vn+IuNnhI/H7zV1EhC7cXWk
	lyg3dhFwGH/rsj
X-Received: by 2002:a05:620a:410f:b0:93a:48a:167 with SMTP id af79cd13be357-93ca973260fmr782552885a.39.1790850403122;
        Thu, 01 Oct 2026 03:26:43 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:93a:48a:167 with SMTP id af79cd13be357-93ca973260fmr782546685a.39.1790850402160;
        Thu, 01 Oct 2026 03:26:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb2970sm652330e87.41.2026.10.01.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:26:41 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:26:39 +0300
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
Subject: Re: [PATCH v7 07/35] drm/msm/dp: add stream-aware link register
 accessors
Message-ID: <uifszh5ste2v47fq5rb2ajopdb2tbkjqxvmgcizsl6gial3bdv@qv43p5qqopjx>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-7-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-7-4b81473185e7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe3564 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=_HEUNlLEu-QooldpwzgA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX+POdyx8apvxa
 VvzG4Tn0ZOgyLJlcg9mcFBzhlIVBDozPfwvhhzc2o+5nEs7fS5CA0hFq5TG3klZ+b8Pg8Sd+EP5
 h3QJCQhI8EYyLEMKwdR9ZqgtbXhkmSY=
X-Proofpoint-ORIG-GUID: oZ2vAETWxHg_ZeCjkNUF6MRrgi_BUO9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX8NiYuPgWmB41
 mpgQtNUyQYhPrXhEytWGT/qiTViBgx/WDeA/iATchsUMhmrN1LvAO96jfOWzLmv+xeTEprLkZU+
 FMnPiekPSyKu0pbfDd57gUOm4PZjyaGpGfg19bGdDm7t3BcLrz8hzUfaMOdntAPDEhyRnzW/TQ3
 aVPRX7PK+9Iv4HIAfaAEuy565ZUyY70Ss2tXh2GSrodhRUGQHBmqvjOIIRtWbkJMz6okVKN5L3P
 jIEhHj+kseNApwTs8qy4S/PANWWVzOFD6zilLiZoZZUNq0NFo89IMo/cK62EfUCMYBC7ReNB7jf
 dFpL7rYBk5T4Hp4j40GVwtRdUZklB+a87TMtjkKIvMg6r5hVVi3fFuFRts7eLuTvJ6dlwNy8HPg
 jRmBia8Kvrfro6mCKNxJqqCt8hdp9YEldLfENzrjE/edmgx1APU+jkKzWjwYX9MP6acTH9cAtST
 0tOe2QY/pdZOxFqFPYg==
X-Proofpoint-GUID: oZ2vAETWxHg_ZeCjkNUF6MRrgi_BUO9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010041

On Tue, Sep 29, 2026 at 12:25:31PM +0800, Yongxing Mou wrote:
> DisplayPort MST uses multiple stream-specific register spaces. Streams
> 0 and 1 share the primary link register block with different register
> offsets, while streams 2 and 3 use dedicated MST link register blocks.
> 
> Add stream-aware register access helpers that translate stream-specific
> register offsets and route accesses to the appropriate register space
> based on the stream id.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 64 +++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 37 +++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>  5 files changed, 121 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
