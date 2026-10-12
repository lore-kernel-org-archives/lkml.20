Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57F48EC68
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815803; cv=none; b=BwPeo3Pb6+k19QnWDhHsK1HP4El+YjRg6SaBBRVxtkjbVl2gSVBRqC/b9CxYSfcauz5kJmXIEOOicC6rFsEXcWitaYZzXQBgoDS9t9mQAdzHBeBYDdMXT952Uz0G3j9/IJhfWwoFWAiGg80f0ZmLnAT9i1SYG83OYzt6qL5+aVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815803; c=relaxed/simple;
	bh=zoBGOwxoePaGg4F6Bify2gdUtyE/3ZyTpQ8tOtBnw3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzVmrS9XIKRpTOiOjHtl9pcRfWbr2vExYG5Akp9qFhG2t6WBd0m9RBNOqjCQbkjVX4G3NZ2ssiBxefi4+CHAiEGElPdBpNG0t4tj6CCJX284q1BcNheaCAVw+VWh1V0YRErarramjeI7WpDOa7yiqUlg1lTgILaZu3JkoBiRTsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INGTTlaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5/LC9Kb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INGTTlaK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5/LC9Kb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0OAx2088487
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J9HMb+rbLJfcyQVlt0skqJmt
	qpokfqdjdof9s+dJvi8=; b=INGTTlaKgMcesmWieZ5+nkXVfzKBctT08I2hS1+2
	lrAfjshdJKeBapa44nzbbOQK+iIA7HCBxWG7HeVGPhMG+S+CtJ8BpiJOkiw7J/xR
	Cnbnnk0ynBhXsCo5nHSZO5sICr/dOsKCaQPOorI1LmIlykwa1bu/tDI86QxYUMee
	oTjT3N3DvWCHn5LGjoIzrAplCoX9cbFVQrCJzaxvlTF0pj7fLcEGEejbA1fIw0YU
	TrRYsefKmZ/aIhja8bFTxb4EfWGarC7VB4kSdBASJDKCMOP0uACKfeDTRgv0fSvU
	cS+uBNPtjRUiBW2aF8vjernE9mvzGV6Sut95H4MkvAu6VQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2cuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:36:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5ab5c136so335342585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791815800; x=1792420600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9HMb+rbLJfcyQVlt0skqJmtqpokfqdjdof9s+dJvi8=;
        b=L5/LC9Kbjtgw1xHuJ2UrBmuuD+a14WemJRjOKd4KK/GHySI0rNB9wdl6VXTRrff3C+
         q8qlKHaRN3rWw9mHqpBVuu4y0b2vrsNx+QVF+e3Syw+Qv2sMNQwlqUc8M02xXtSPDDan
         tXKY1ZsGwkJlErPu91ce0QRkp1gqXt6NqW0GzDxAczSA1HSCr9CdAzfRT5gWa24tmrUZ
         fAGe1k8xrXv0L1R2jo/l4r9ymky/aSpFl/keDr/R7k07jxzUtYv8e4h1nLe5zoYpWj8E
         zxO1YJkv5GynaVtpx5xLnjDUfuGRNMN3FjuIJzHGCC65m+3P0E4w3L4s6VZ13k7HG2S2
         u8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815800; x=1792420600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9HMb+rbLJfcyQVlt0skqJmtqpokfqdjdof9s+dJvi8=;
        b=0kIQIm/SrNeNkeWBoGuUBpUk+d8+G052pajJGTq55CQ0deqvlzFK2Gu93+9x+lGxxB
         2VbA6N2hiuyYw7FOjxM/It6pI6vtq8HB4Vv6hnpNr332OCHXUzTOLsG3amTeoq0aUYa+
         hP8oToq27Oim/TAvfXLnuj76W+HIoOm39r35VC11lVAypiZQ8zCFQAxlTlOorGoaszCL
         VGPznY4qql2pJSuKknE5Wie7GAl8Tw0lCClX8r/XsBHYvtqzwZO8+k6foBKPny4w0ZmW
         H3SvbT/+INEQ2ENdeLhSJ1h9NHQZdtc0jt1Qh9yio/KBrq7oXSHoOPLQA5tJDqSvu+PC
         gjRg==
X-Forwarded-Encrypted: i=1; AKwUvBz1OYrn8rhZmLX9Yv7ouWq5hZ8bg6q+9R/cGrsl3a+7G+wRUPMP2hGgZHj9yUa1NH/EstniKav4o9vqdY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxZiPUDcVCqWV1iY9GcYekIqeTFVbX0pk+MkQGZaG0gcvGbM0y
	THiFV+QNAw/yla/3NX9uCmD2MNlN0m34BEloZvN5o6ZBa2ASeuN3ibOnrvOLrXfyKVl1KKZ/ThN
	9g7pZmKC/cmJtqTKZ6mOkcJqsXOrdz49g4nhcHo0wVDNZZJTqfbWRnaqESINyONBdDEk=
X-Gm-Gg: AYBFou075SY+Pl9dUZPpTJvYBfx70sbELz46nDZQtN03jB4Hl7i9Pn9WdZIMkVB9PO2
	AWE2E5WKJuGRhUd10e3rJOrK+uJ2tdo8/dlLUucd6dd+rU2kBsT81+U3ZjUCE1NhEqZovKmBeiH
	hkfkl64d4zFira1wHUKarZ3EvfJk15w4hraOw34P60ZsvkB+NZ6OFxY7/516bqgZmlh7j2VT4ad
	KVu81c2enyOi7hCjbztJbuaGr2tJkLYCaQZ0Hu5VFthTFLrUaB2GpO4pLuBziV0f4G9GU8iKVey
	s3PnzaNS6YubBya9IIS9hlVpSWBmBliFpblwVxgYzAe7ZXQ/R1zcJYDE5YBSwxTKUvSCIkqMbpF
	h+fKqaeZi43kmi0kgOvzfEbW2uQrC4rglHp4cncIr0EzUu46n07uYoX288dSRFCwjm84XwyebDP
	o+lFhIEXg8A3HF
X-Received: by 2002:a05:620a:2b9a:b0:939:a0f3:6aef with SMTP id af79cd13be357-93ebd1ba6eamr1634169785a.23.1791815799544;
        Mon, 12 Oct 2026 07:36:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9a:b0:939:a0f3:6aef with SMTP id af79cd13be357-93ebd1ba6eamr1634164385a.23.1791815798995;
        Mon, 12 Oct 2026 07:36:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36693sm2933145e87.3.2026.10.12.07.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:36:37 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:36:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 16/20] drm/msm/dp: Disable PSR for YUV420 streams
Message-ID: <oxdplbus736krf5p6ilqattox57iv5htwlof2otcgk62xgkxrh@wg2yt2iogwjr>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accf078 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ksxQWNrZAAAA:8
 a=q6X74nQK2RvUw6JQmdMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX7pL8zzXYLuov
 rp7fw9p9r4Vy/WkdL5wA1LWlt2N/btUScq4337rPIS33uKEhpcnI/yi8XIdHKdzQ13uF7uN89lT
 QOP7IQmIpKoWGlr4tAX9KnIgCN2Xp4ZI4XgN2MAIYckHqepVdCYaizHYgEIiW0QDXNIeSb1HYTE
 QIaphEmzr6PKx+A7WeUpsAXpUoD78BxqG6CHhxvGi7YvrrgqjDUn7KMqSr7Z5BrbYM3klP7siWq
 AbDvvETRaQLhnBVVI7AYYrQPgP2bnM6ER07SMDxQdP1KaYXHbQbt57capN9T5XemWi6aL6CWjE4
 38E5nzlfG4+93UUwcC7LyelAVMI1YpStQwRqWJmwLvRWtHL6DMLLlslkGx9ehqFryiPTC3zK2LA
 CXrL6U3axi7hmtPxr9gx5ab3DcxWs5K2rX0ZSA3/Ai80qLMpRrX8AOcIfj/m+MEOa2R48/Jhn1N
 jutRVNaJlNoQ7+4361A==
X-Proofpoint-ORIG-GUID: 908QHMHz379fjEt-mvenlZHrW6ZDQO0m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX5UTLelRh663g
 rhVpvBbApokImhXRLP/cyCZQlVzmn3FHU/NHmcaMRRqyW9HfBgkwOwMbeR0KlkBXXpx4rv5kK0f
 zij2d5W+E0Gkmx/evbIwHSSjOVR/VqY=
X-Proofpoint-GUID: 908QHMHz379fjEt-mvenlZHrW6ZDQO0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120058

On Fri, Oct 09, 2026 at 11:16:08AM +0800, Xilin Wu wrote:
> YUV420 uses colorimetry VSC packets, which cannot share the automatic
> PSR packet generator. Do not advertise self-refresh eligibility for
> these streams while disabling PSR in the controller and sink.

I'd need to check if it's possible to handle both. Otherwise it looks
good.

> 
> Compute eligibility after the common atomic check and reject an
> incompatible self-refresh entry. Clear the automatic VSC generation bit
> for YUV420 and restore PSR configuration when returning to RGB.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 ++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 16 ++++++++++++----
>  4 files changed, 27 insertions(+), 13 deletions(-)
> 

-- 
With best wishes
Dmitry
