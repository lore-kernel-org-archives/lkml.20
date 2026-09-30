Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2EC3B6377
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794295; cv=none; b=QrgUUigckHwaK7rfSY6MqlZVpaHhcoHVpvpEZ/jaiO+riioOhPB1R6FYcYa6LTD+sIyXlCoNS5C9pgoVpDGoXc5yjE8YcJMC9B+Kr1HOMXZfahePeGIIF/55jzk9pf+h28oAI7s3JA/Hw1ZosM/bNSAJ38pAOVpogszntzd1L1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794295; c=relaxed/simple;
	bh=LvR4i2pohFiB8qn1koGcdA89iLknx0Z6qOV5b3XmAqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neEzBKAOU6P2d9vAmHe8XVCbx4p1Qo/HM6xla7SF1rgCbcEUE7t4k9u2617t8TdWRk2NnG70XGxaZ1Tj/rUThTrF6PUUo+11ydg08P8ZzCQc8vX6lgDJ1+rCCwuWBhYj0a+W1zyvtB16MpzEiZuXYB3ne3JCQ1LoM/Of7QGsRfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InYaUdIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFmtmKs+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InYaUdIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFmtmKs+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHfEkN2902252
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=STICXhlmydY5ugMIn/MSZsMe
	t0adQStm/p3f87Ly+2E=; b=InYaUdILg3kHLwOu2C2SrlnKcrJZQhfPkm+Psw2E
	igUObzQrIIdGG1KyDU2F1F1/Ns54YvQuTVYguiRe/pdUqU0eVJ+bwgvt6mipUSRg
	icwgybb8mgMjbvIQAlVDpZ5EX5s6zl+6vm24yC3oL+0eWPXzfczAlpPq4YlVSecL
	O4qb2S80/JX/HSk0FWl1OleyahNwVi8lpTzIPQzv1mCi7G5KbU8TVTLRJFieyUSi
	ecXidL3dzHKURycfGAXN6CyFvXPul3jJLVbLJ3ukqzMmhQ86PkQC/sdABeUBEK9V
	vnzOs2QaxtsJ61AwnM6U3xDNDZ8Ch49/TPw7u5IXQO2MmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c32ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:51:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf4c0af4eso15906585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790794292; x=1791399092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STICXhlmydY5ugMIn/MSZsMet0adQStm/p3f87Ly+2E=;
        b=eFmtmKs+yRehmZP6RhY7t2AwFJ0iB724SDhAZELwajJfAVBrwyZ+L1DUjlFDXQmVeW
         U4QeKjsivD9xd2Y7XFM0Mdg7mz/ssc93maIUDxZvdOsVkh0bHnJmhk+y1KdGRlGQJRfI
         6zHxodYtFcN6wIaflCHBGsHn6I13aBuZnBEOo8jU3b63qyKCkqMluBn7CN8KIx2i1wQ1
         tMbE99Mltt1C4gjYxAJ03L6GfSay0DXnk9+VO9DlWTSLeglRcphl+5rsg/2QbKKO9XDI
         sFDMzaH7bb2dHM0J+MMoJuAWdO3Dpewatu3w4I9PoyX6LfmkqjbDjKnjjU6tX2VJZ2KD
         a9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790794292; x=1791399092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STICXhlmydY5ugMIn/MSZsMet0adQStm/p3f87Ly+2E=;
        b=R5z6BeBrhvlkzt/ag1iw/VA5bCHDJMjGu9yxWggXz8S1QAD6eH2R4usfmB9L3/5yTo
         5q0C2nLZEAa0n/k8czDDQK24Vzc6T3iOCvfrCE2HZLYvdZFDUdD8xhjiuay33CYWG5ng
         IzCaKI9NgbcF+ncmuSQKjENoztMfihTfNAHkzSJp5ZHkcFYuH3TCG2zml2IkCXQefYoK
         DUh5pNRGAog1kH8aHiCYTZn1fAg9ANp6LBE1+bF1QVREQpsOkfPOT+48k6NoJxvx7Hyo
         RzuNO05aT7lxdRjvPHvup8g84oN8Gkp6dGby8iaT/VkziszY9gMJZSuwHVO7SiBCgH/L
         cXNw==
X-Forwarded-Encrypted: i=1; AKwUvBxJnhbBg24FulKpcpY+2BuL0G2F9vkLMSQ5FfWu0Oq0vB/au5ovB5jhivXIJlwq8bdg+tNQXwf+SKzm+LA=@vger.kernel.org
X-Gm-Message-State: AFuF++kIqw+0d9X1FbRas54vypA0h/Bhf/wif1cd6vg5dkRIclTWHtrv
	rk5PaooMjqf8OmFeaYQWJGp8GUIol+UrYi0EPohTGynsmVUc3Kfoy3mT/gZs7izqclcitXe8Cc3
	/PKBIaPBEtvOZzi1nUaUt2C9aa6dlS9YpAo2P/YpzPqhjNByDlYI4vXo8bNhFb9jaEQg=
X-Gm-Gg: AYBFou0E4bL+ghq1BGZcLpU2FJqJDZCymRDP2ern6U04ShHX9CYCgV4js5tAfYlXqkP
	+ygcMQ8TLaw5w2YUSDlvMuALAUksCp9Zj14XtLbsmzXS/I+x8f2IH36ps3Nm6sLXP48LiuvXkTM
	LofbEacjqpiINkLjX3divI5TsXmGbAoIBX7yRjkuISvYFrj3ojfdgWsT2MJcDwia+PKPyBmDGBi
	s9MGapQWcA5tWwWxdNwbHAJ07klzXXyE+TE9v0HMOSpAl9KfqjyiWaLartqlw70BiYnBbnYLUwB
	bwNradAXq03BgUQVAEnlPhTvoIXJry1SPNZUoJX0iDi/UtVZHYI180FXueKAURUtxa3dooGCVnp
	a7kDcvNl6sfeAs63ELgqH93C+M4eEXSikZ8G0zPlGmgZpMzVrkuB6jHW5zUdhyRoH7Eg3pkCNn5
	3iOyst4U0mlu4y
X-Received: by 2002:a05:620a:6086:b0:939:af12:f5a0 with SMTP id af79cd13be357-93cb5b4b547mr103741885a.23.1790794291857;
        Wed, 30 Sep 2026 11:51:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:939:af12:f5a0 with SMTP id af79cd13be357-93cb5b4b547mr103736085a.23.1790794291254;
        Wed, 30 Sep 2026 11:51:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb2702sm167395e87.34.2026.09.30.11.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:51:29 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:51:26 +0300
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
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 11/13] drm/msm/dp: Initialize the debugfs connector
 pointer
Message-ID: <f3pxrfm5gjrcu7j7y3f7l2vb7o5fjcy6qeb66ko7vcpqf6uccc@2svugdnka7dn>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-11-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-11-dbbf8b2b42bc@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfX8LKOgeR7G1/o
 bcvERRBc+c5sS4W1nkYEWdQ5W2K8wBOpCzltTfm2bqR93RiL3SWu7Jwg2XZzYQotI/kJYnbEvmq
 AQlOzaYQ6Av6+USQ2QOuDOGWrFuJqP0=
X-Proofpoint-ORIG-GUID: Eq2PCLJJHOYI6ot2PheI4J5vuZfO5OQM
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd5a35 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=5ERa0XqK_cGZVxZ2II4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: Eq2PCLJJHOYI6ot2PheI4J5vuZfO5OQM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfXyfJB0kVXPKi9
 d3xUnQ9fZR5i2CWVkJjaFGOKEIndT6ngYR+Ge0pgg/l+zZncKLFFLNZ1JM5M/WSiXd3UsPGSzpq
 VpPywtFIAq0zLxEAgJk3Ev/WicjXjJErjZYu/VjRAQVeWpxZw9taWbZJni19KHsc171LyHE58aI
 HtVLdw/kuKoC4C43AG/agC3KLQ/BWeJsfdZANdMumRXhLsEwGpwEIOiJ3Lx2lDwe4fyWSyUTMcs
 qWpNZnsWm9eJ6v+Sceac0RypdrEDFfeJT8fg/m7uKbuRwgxIa2eJonUeOqBVG2YbJ1xz4St6iY8
 aPt+KJQIxpRFFCT2uSK1S1CjyYuDuWNistYyR76MTlb52DraZG6IDhGgsWgEHqtwDgRIITcj0aE
 Wsf1mt+96d2dBghK+GUSM24q2xfwFclSmYDFVy7++oV9L1qwpr0WkbN+j9wZ3CWTQP8utbuwIzi
 WD93Rag2JK4ajxkGC2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300077

On Wed, Sep 30, 2026 at 08:41:55PM +0800, Xilin Wu wrote:
> The debugfs cleanup removed the connector assignment from the debug
> context, but the video-pattern test files still dereference that pointer
> to check connector status. Reading those files can therefore dereference
> NULL.
> 
> Store the supplied connector before creating the debugfs files.
> 
> Fixes: ab8420418c2e ("drm/msm/dp: cleanup debugfs handling")
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>

Please don't add empty lines between the tags. With the commit message
fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
