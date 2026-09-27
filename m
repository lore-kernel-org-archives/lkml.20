Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12473515DA
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790533415; cv=none; b=Im3ZINOVTCaz4M0oydJIHr5oaJAQkV+TEMbnZOCQhBPhzRPW5FaxX7Y7k5FOPaI762imvF0WAUiL6SzZ5j1DRB4T/h4feEdQtrAC0A+STiT39NuJC51W4TZhVOMqPoerA68YbHJaXjt6L6NUZR4spH5hoqqTZ7Zgv5Ey/vo5GJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790533415; c=relaxed/simple;
	bh=4okd5sJtByzcHmnDoGEkYXN2lkRwYygpt417K4Rvu/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enNeibwFyW3eI75zyTTvrQbZYL1TPy9nATgoWJ4J7GXL8pAxoo0hH7QsMyXuimIONZPkdbW0qbplfD3fsqmFl71Jy970TxfIX/YMM82ZuRTdZNjazshk0NEAqgK7u5TuxSZwzQmB7mJ3Ey2kqpl3iyV/yIT0kCBxlWuulAIn3Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKP13tba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LgxvoYvU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKP13tba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgxvoYvU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RAE0lJ1659839
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=El4U2Ujw5CUIPY811W14jqAn
	hChispOwOutMgabxlvo=; b=JKP13tbaHKjK5YZPItfvQGp4KVLl3/sDyw8ChjCv
	unNdSOhZZPWmOB+5T6we77XCrWO2Q0ZCPRk9KTaT5OKIM4nHa81sw8wvyJtP76G5
	Eib6yKBgw8UzqPbVIPTGQhzvUfSSrhO7JZYnako3wEB+ExLXqJB7qbRjxvMcC+u6
	/re2KL887sS5zWo3QXLp9Pco9+54FpjwfupPjuqvmkRh3oNuLZ9wxGG/bx/akX8P
	SUunwoetLYhsDuPfYpqY/WzCz9E/bATgCyyvxt1TC0svqPfMiUUEgjmegdsWT6Ac
	34k52yinI1ct8AlJ3BHLMnzdIcvhL46rlQFLL90PXa6/sg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9ubvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:23:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c63d960aeso170148685a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790533412; x=1791138212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=El4U2Ujw5CUIPY811W14jqAnhChispOwOutMgabxlvo=;
        b=LgxvoYvUHrNmeWZfWldKPBsLA+Fql577QFF2BhRXkalK8/1p/SjiD1n0Lh9qqInNUB
         AT+UPhjg8k7uTzLVbNbupP0GoGvga5T0K6+QJxipytHzwPCrJ27kFKdWFAqXQ6Hm1naa
         S8vBLNuBHmDbZe0dJV5Y9RkPAxUOKf87ltjSjIquTU2g+oExQvb/3N8emkqQUefXAm8b
         VhFLKzWeWD9RZzEq8z5TJO2ZwCmMbb0CqtcYypYjlXxEOi56IjDKKAJHNgqlMOJxzhpc
         ijVvpvR5m1tctZFUlqpA3uyNpFAyATi9EZC7KN7QRMMze8HDDfUAZqzQJfCzbZuvp8RI
         758A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790533412; x=1791138212;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=El4U2Ujw5CUIPY811W14jqAnhChispOwOutMgabxlvo=;
        b=kr7gjezy2ycMs2UuLTlWcGuPBBYYdV+OvcTmozHI6l9bQ4TBzNb72AmrIygIfjbZD3
         oCyz634wtLBcSwRP+GqtHicE7HBIfynPtYmsEkqcFPqzB/T7gyuxZ0SPEPzSDiXDpd+3
         FgyDpJF/HYblg+GcyjItEkhWcR+YoXsnLsuYMhDT6yJmgpMzxF9/fK3HnUUGaJeg6Wez
         sKwooUwQl83J7O9Ax4hJ/iHRSmHZUS20HCbJZLd2Cm7XNKnqCt2HaaQUsNxrJRBlyMbp
         h0AOlRf9k2Dl8OruZSSwtBZtIDmraOrDPUkeMuuX6jHa8SlA+24079UT+zo0+VrqO4mt
         Tkvw==
X-Forwarded-Encrypted: i=1; AKwUvBz4TTVf6PAb+8hyqzk2TX+Q2v1ou/zEOOhqiHex+R2qJUEChlFzaPb4brqf6xsR7B5Hnn+M6rdWmIzf+4I=@vger.kernel.org
X-Gm-Message-State: AFuF++m6AaPjT/kF8+AC+UQlq+9v938xVOjmwACnOA1/cRlFUFL8LP7T
	avxDdpUA0gUtH41qu9ytmrIxGOGoKvAu5lTuZHDYTgWD0hV6Zt36d3urK+ruePlhIv9J9KRbny7
	Cyr1Z6tnn56//OFfcGDK0coixjYvmOXtG6rBtZ87lfi2f+Urk/NutzCzWo7TW1rlhRbk=
X-Gm-Gg: AYBFou1vmzpEquazHdREligN3fY0LMxsfvjkXMMSeyjfORIvS0M06OSPE7DCFZ6SJcR
	p7YczDPRQW9BKOfDcYzG8O+CV7dAUUTLvoqUoRZuvh38f87aRXofi5wpUT/97USLxaoncC8zJCq
	+5j2kLWGL3RJ5p1H35xEtFcZXU6HmdRx7Ck2Yo8nu3KQODnAw/nN2HOFo1lCpNvqSv3ifmq1ydI
	zBJnlKwRo2EjGv5fkJWeDLIIAhIYCdL73Gk2BTCmh4OQGvByG3NQTGzrr9DIRQJlR5iuJjxIfDU
	W9d/PfgoZ+yvbomyr4OPo+HPqprrmwTrB/dAUuNuCmIrYdFZ2VqY3LAJv6u4X8Ca32DidcbPm+9
	l3S7OW0dWnoHHf//jThSFAYxrHF3yDvzNGUoq/oo2qBRQes3XBAi9Of9V/VVk5g0CRAvn9/Htwl
	ZR5U8B/kM5WrOJ
X-Received: by 2002:a05:620a:3190:b0:939:f188:6d97 with SMTP id af79cd13be357-93c43ce52c4mr1660028985a.48.1790533411984;
        Sun, 27 Sep 2026 11:23:31 -0700 (PDT)
X-Received: by 2002:a05:620a:3190:b0:939:f188:6d97 with SMTP id af79cd13be357-93c43ce52c4mr1660025185a.48.1790533411455;
        Sun, 27 Sep 2026 11:23:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6af8108sm2009446e87.39.2026.09.27.11.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:23:29 -0700 (PDT)
Date: Sun, 27 Sep 2026 21:23:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: iris: enable pipe for hfi gen2 encoder
Message-ID: <y33yqv3wnviooarmgbiunmy7gxckot26hrju3fekxtvuxgqyvz@ee5pz4ogx4vn>
References: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
 <20260927-iris_vbv_delay-v4-1-8ee2b7462e68@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-iris_vbv_delay-v4-1-8ee2b7462e68@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA3MyBTYWx0ZWRfX2K6YRVQIEhF/
 geAnIh/PLdormbcYDyopTVugV/4JWuEnxQaqpUjd3XmjJDzjwFMI8G9jBaXKNkl7XY6vIqv8Q3e
 wpHknNsRD+7kl4/GCjnlv+lpVXDnupY=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab95f25 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=aJNzaWkW9GeV1-cziesA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 9QgFzizgoszmHmk5TyxjAMgRZrtOErUG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA3MyBTYWx0ZWRfX3WHKERdBszpq
 CMBtH9YDp2IpjykwFyaPp05+WfLe1tkX7rWdKqSwh4X4dK7iTKOtPB9tG2+IlRXPYAR9LTI6NfR
 OKg2nd9yKhWrfwQ6qjFjz8FguDnBsZK7oMUnLg6K++UVuaIgXGM7DXqzbCXeA4vU6gEHBzC5PRs
 m1zJesXhRl1K8mgJXJhFMRcWtVknYJfmRvECzn06wBz3B44YHqiwEJX52e/oYVCswFO9k5sEBHG
 hYZBbP71QIp+l9gMkI/71eqodYYNtcaSgxyUBB2loKEeNScyDLimLOAGNL3Nz16WGPtmHse9xPT
 wfefQ1X3HMm+/xpl4uhfFWBJQnb69U08yE74o6sQC7sT/NdKRU5Y9iDUdpsRfhGWQrLLGSb5XFi
 +mvnD4vZLozI7CV5pu3n4o3Rlc6Py3yPsoDOHWg7l8A7vTynteehj1GgB3ttE1bBIpezJEWrAdx
 nWX5t1ngKw25bXoi5Uw==
X-Proofpoint-ORIG-GUID: 9QgFzizgoszmHmk5TyxjAMgRZrtOErUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270073

On Sun, Sep 27, 2026 at 09:27:45AM +0530, Sachin Kumar Garg wrote:
> Currently the PIPE capability (HFI_PROP_PIPE / work-route) is only
> wired up for the HFI Gen2 decoder. Add a PIPE entry to the HFI Gen2
> encoder instance capability table, and extend the encoder
> branch of iris_session_init_caps() to derive PIPE's min/max/value
> from the platform's num_vpp_pipe, mirroring the existing decoder
> handling.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c    | 16 +++++++++++++---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c |  7 +++++++
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Nit: it's strongly recommended to send new iterations of the series as a
new thread instead of sending it as a reply to the previous iteration.

-- 
With best wishes
Dmitry
