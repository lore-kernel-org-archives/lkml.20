Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C380F468C1A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850231; cv=none; b=HaBIMtdv2wyNeUnfa00YZLYFk/6LED4XsR/LCyiaBc2f9pA1kIp/Pa712yGiX3gcuGQq4IOtr2MLHjTKaDkqWqknoywusgBZn94Wxlg7fG9RFSfaS2eCZzB7m8Rsl9hko6vhaja8ahl+l/g0oRbUkkk0T3nkc/6JAxy3O6qZdPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850231; c=relaxed/simple;
	bh=28gSEAMplPj1l0fuQTtVo8owl1qoPoCfBXoJ+dhpPcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVRXdn10+UfKGCIEYoqKyV/lM4925qcQVeeUJlje4rTFChRuNDIUfPSPl/T704NLLf7ZmxBRS/4mrfA+8O32RPmTeHuiiwkkCqgQSEc5z9DJ5+OhONV3pR7qcTnyQxZb52MyPyspKYKiIE3cQ93iGUu5wItfb780ij9R2PUeQ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIrt2Iam; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBPAHGT5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIrt2Iam";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBPAHGT5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xNNU1062199
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 10:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yzAz2SWMqrTWqYRsucc7HPMS
	f2cC52cQm3KTbr2oPBs=; b=MIrt2IameCE0cj5sY1K8wpPRBmwy65JqkGjc1Qsp
	prgKmPwhBAAB6qFYeHuDUQMpfCYM4x6X1BVIKr+3XO0g/lkaW8PeRlGdzGN9Sqwu
	HZkmowlmhOIWGYgd+I3u3rTAZb7bTa7zaa9zn9yP628KQX3pCW3c+Gv2kF/RWdKj
	5Hpz8FktqStmcNBdS6HuXDy8ZigDmmvwqAuNhqoL5TdfEZRAct9V51WA2dmjoyFI
	x84w0mQr80Vww7ZLFxvkLwOGd3U6IbQLAirCaDg20JbOnSNgxzgZt6mTXnPy2+LQ
	sCi/ZTypQqPDvRnlduXsOjQgn9qGGvYO5YIgm93lWg5uHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvubp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:23:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1621251585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850228; x=1791455028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzAz2SWMqrTWqYRsucc7HPMSf2cC52cQm3KTbr2oPBs=;
        b=RBPAHGT5Qh7e5jCVPGOc1VRQ0nt/sQ/1yqty16DP47Bc7by3Zl0loUaLzqoHlFWUmJ
         xlf/rCGFAX6va4+nTMUlP23J73OR82LpeTObyuSHSRQdcntib+6i8HHWT9RmFtYEbdvH
         BXO04a8lgYNXP4eZP5Vjrv5QE6BHVTc3Iq2aUJkF1TAovYraIJId26lNka3HD+7ORd4G
         Ez8P8iNKM1KqpqXbOSLLUKz98SN/Ytr97558fNU+57PJkAptbmqNrK4bwOj7k50xgb4D
         /COV8vgRq15Gt2hZpDSMOfLjI8MeWeduTArVzdcOqv9UBEwIrRRb4cch2qe6mUD7KfIz
         65iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850228; x=1791455028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzAz2SWMqrTWqYRsucc7HPMSf2cC52cQm3KTbr2oPBs=;
        b=EJOm3GhcxCpeWtw+MWb/zWgrqCUiGg7jDNJoXFl6bLjDbvjCpl6yFjWrlcfqSKW9Hh
         LedXGJn2ggYBCHGad9lQHqJLY3qtEJUVl0HD7p2G/79/v8wn/fKQMSwQY6tzXL1ssQdW
         rw3blNfCnqaYZ808qm7sHGIXvAphZfb1uPWVBiO5MqoOqVruM+64vCmysw1yNyd1YlJB
         /zJ/rBk8d7ZrP8bAf+UtHb4ulSZSC8Nv8lbsQ9dDSDSYj1fVHiuMpruBGetYFzH3bX9K
         YCvrFTZgnGtnvYRe3ymEnUTz+6nAlZYqDg8Z/O1qwt5te1kHBmupNJCVSZcpPaokpNw5
         Mhwg==
X-Forwarded-Encrypted: i=1; AKwUvBycrL7IiIo8COXlLrpw9XyIlOrpmDGBIG7XVtbqI0LM7EhA3AylHViw847mn+5cIdCRT2FsPsT6YaZA4BE=@vger.kernel.org
X-Gm-Message-State: AFuF++nGDH2TRDaVseJ12gct5LkfIp4HmZm3XVPBzw5/BclF4bOx2FHv
	j7ygsEENFIXQl30tTDC6RRb8WcEJZzesMJEl3IPpG4AUh5g0z1nwHqY6mnDFk8GIIS/NfpMJ5jm
	nno5eoNkKbgTpn1dpPzuzraYnkofzdZkyKE9sePm8WEV0qatHqqkQuVU2wlg+5FyGzlQ=
X-Gm-Gg: AYBFou3XXzQ8dBFH9svFHOlExOB6vEQWDl4M8W9IxWSBM1sTOACRqcu0QdwmlXAXClF
	qixf8qRCc7o1yzD5TMU+7wbGEqI7zHRJtRFM3ZSEP64c8uezEywHDfMB2rYMmSYqKXl6GHaQlWH
	A7bmLF31nHF31x9cG6fDE1l2tu3iBpPnpyMU3KEU/RZP8fXlbqGq6bMs8O4rOR0Ie1HCoFGnnC3
	kcYY0RId6jvmheC4LSFTY2/mkp1Tpcoqo4rad+GZmVn8ir5ipLvpK3hWKt3fSPiPbYhkYvSDRY+
	C8QkgrN/JbGa2Hma6pTP7OFPLqUmDnWcP8KZlTEdcXwyUY/ZIb+N99OB+TMD8IPh0xcPOfJyqR0
	mLDjD1aPE/wUZEiJtj9qeLDwTeIz4k7NPp5rbfWlota+b5mgwO3R4PZKUDWqyWqFOifSX6zMotF
	RTGrRbKvaySRCZ
X-Received: by 2002:a05:620a:6844:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93cabf2a14emr658671885a.8.1790850227812;
        Thu, 01 Oct 2026 03:23:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:939:5f4d:67b0 with SMTP id af79cd13be357-93cabf2a14emr658668585a.8.1790850227258;
        Thu, 01 Oct 2026 03:23:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fc529dsm618361e87.80.2026.10.01.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:23:46 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:23:44 +0300
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
Subject: Re: [PATCH v7 04/35] drm/msm/dp: introduce stream_id for each DP
 panel
Message-ID: <cef7gvd3v3oosjsgtoij2m2doaddnlrt3q7gaq7t7ih5w3em5l@a562vfmjv7y6>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-4-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-4-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7VrFClgobmJxOalwtNI8KoMdnjiWIyfF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX1T43KQMBNqNi
 D0gI7HbCzjocOqOvhBg4qJdp5S8ApRsvV9ZotWmeKrBM4/ofyOJX4hnLujQxu1S3271UDAME2/E
 Cc0uizgnQqtVOnkG8x+IQLd6CFNjLl0cYUShjJtmiugsrtCZL9FHnRBdI+CqWgIum2smL3xjSc7
 I5Nu5pt3UUXrmxpqb0cG4s31r1xuON5fhjvW5FhU8LFvgccHv7J2Gxre2bbqdWnReHXBYPBjxeF
 pmpylvkSlzJj6moWDH2PI+pYHm5Hy2Dckgp3iM8/jgmf1GJg6+qSgAZt5BzcxtL/qs1qQ9P2f7c
 Ne0fEd9tf1gfxSyFxm525b8lCu9Ts3YksgoFYm0qJVFGzMbUA4uKmj1aJ9Eg/ozhu9mWcbra9jA
 ibIXZSnw42eRRXZfNfoMW94Qd2l76t/vrIWHmYFck7IkLl5I9yZlqxg6hRA8EGki+z/B1DtPwQt
 4SWzfW1TyLhppBh9ZzQ==
X-Proofpoint-GUID: 7VrFClgobmJxOalwtNI8KoMdnjiWIyfF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX363akEo9Ap0J
 a0czoBcehtTj/fCTc8t1GKavnckm8/MMGS2ecsQ+SeOYcZ12bTSHqhU6RqoU/W8QapwwXFwoYbD
 qpKutx1wNHL0pKhx3sgxQ5pfBeVYYLA=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe34b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=einhxy-9zUKzVd8CT48A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010041

On Tue, Sep 29, 2026 at 12:25:28PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> With MST, each DP controller can handle multiple streams. There shall be
> one dp_panel for each stream but the dp_display object shall be shared
> among them. To represent this abstraction, add a stream_id field to
> struct msm_dp_panel and introduce the msm_dp_stream_id enum. For SST,
> the field is initialized to DP_STREAM_0.
> 
> In the MST path, each panel will be assigned an actual stream_id at
> stream-enable time by the MST layer (added in later patches).
> 
> Use the stream ID to control the pixel clock of that respective stream by
> extending the clock handles and state tracking of the DP pixel clock to
> an array of max supported streams. The maximum streams currently is 4.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 70 +++++++++++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  1 +
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 11 ++++++
>  5 files changed, 57 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
