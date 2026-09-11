Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8164AD4B5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151172; cv=none; b=Ll7CTDiJzjBy3x6KF8dKOq84M2FOyBxz1Hy2LC9SigTGiPZUgyHNZ/YKaWda/nDkTTs1dF0fqthvuWOMYS+rW3WAOpgcsdiKc62XQR3D9xrxJ981FIPH6WMmAjA1abxnMVVkq5bZh9X5hsW73AWqLaUYeMd36HNAa/exFbGWVbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151172; c=relaxed/simple;
	bh=CkOP2YwaxjG0b5Gs4zSDT/f6WxnNkC7kiB3FD0vefeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+VAIktK7G07DXlGIh3wClZRIsyrw+4E8QB8stuKR13rVvh0B4N68QPCphCjM71xaxIDE2XEuQ3rotTB4YQJYi/cfwQAjs6RtOBw/mt7IvkROyuvz3aBd5RBQuDMvIQzoIuZL5Z/49FfBZbJN0/THQmAuZ7dT9upUUvF+LwDQOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6iRa0f/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmyfT64G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6iRa0f/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmyfT64G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWTIw488054
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I2VP66MJnRkDMYUgYGBaZzpl
	QPMX6KJi2mSu6YYl52g=; b=S6iRa0f/eOeRpK4TSer2p1jlzG4oKEUPSsdSRohM
	u16+w6WgSxLHg6yHYQgpKQZ46M6wO8+N7TRqSf7VU+v6fw9ihrL8oxa7lkFqytdE
	NcqONgZPT4DSoBo3jM9CcZ95qPPaPix592m9ZKFfgujPYht+VXIk9/AwFiiSrR2B
	J1tr6o1brmEjA/ynHBv5vYR7FxscNkuA9PUfPAfRs4f1QsqS0vtbG7A9W+mFMIac
	0Y3nKzBWheaT6q7exogm/UrGAwwX8RNyuiLXViucbsGYivAqC31UlQN8ZFuILglr
	x3Vj1ZhE3hqlLceTel4S59WAQYuoI5bIhov3/kEncesvFA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm1e8sn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:26:05 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b37733badcso1673053b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789151165; x=1789755965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I2VP66MJnRkDMYUgYGBaZzplQPMX6KJi2mSu6YYl52g=;
        b=AmyfT64GYa9rTUH4MYYy30jFyolE3UaQFNI35xtCwRWbRjkU1qnuVEY3NPuTARBLxI
         71J1X1JDa/R2PB+pXqwyxY0oN7KAnQ3RzYbplbbBqbhpziEHjJ12zZa5Vvm50WntMQni
         qVGdyZUvoZSs3Ug6Tf9MrLmHgBIK9Ow0dCTz9N7R2tsupxD335fkQQLNF0Qv+/3KRuGe
         zq4If1K3ZeOppoXYaL1Zkv+72A4PSdG5hNw6tISF4AWdBNHhvTq1YbuOViY+5pg6mevP
         bMfawezEhd7E3SsosncLrS/lO+1YjiIx7lj84zMuPayBOy4isvYgl9MZJi1nPq/Jnf3r
         tfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151165; x=1789755965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2VP66MJnRkDMYUgYGBaZzplQPMX6KJi2mSu6YYl52g=;
        b=NUmF10UcI65Mu1gNiA+Rrd24EjXsRDMX4R+rdHdqq9dgoMs0fRjOyhIVcRewHnjuH3
         2hoJ4QXiVJ51/aDEVPeqVFrm4i5o/n96hOETDXF/wCOfMhLW7LlPkYijxYcij8lK/HLX
         VT9APLZu52RQHbf96NS/i7RoFr8CDDq6HnSVzHqO4O/GyjpHgo4B5/vLCfS+Yqt57PpF
         /y75So7YAhbarP/SzUpyNeuc1/O8WNo4zG/uqzqYu0Bas4h80e//otCOpaqeEkOAwP58
         dLzYUxzt7ezmoYN4a2006I4FhjjpT7t5RQ/7VW5MpAaRDLRRl8pryhUL5DGbUO2OYns4
         SQqA==
X-Gm-Message-State: AFuF++n6Ag2deDKc4BzADm5saIhZWH2uFiyuv7wBqnrcJSvE08fY71g+
	zBXQ81Hs/sMM/PRFkkwzeREPHdLIGkglyibjJYJiRMUg8b4Ocj56WRIcgKlnnzKhN8J8HLdxxi0
	Fxw45Bh4+fTrtc01xSI0SidTJRYw+beguZl24BHofH3s4Oq2HJxSXyGJ/2SP1dkzyXzI=
X-Gm-Gg: AYBFou2fW54VDhkf8KyDrnirUbnv7kwKRAmLbEJsG+t2lnXCj/R8/t8eANKd8Wycq1g
	xnELPDZ1bS06YLG3J1KiIOI7e8ihXTv79xW9WT1iKwoy8wWnHmeCbThuY1Zgk1S4/GQ+pwYAt9/
	jCULxGMQ1/0sm1d6eRul0n5nLSnTp9ObvZ8KSGKQEMfilceFE8/S836a+cgEFmOKDjKiYgWyN8v
	SFZjGrOThUrNI+NaUwN1KtLJ2mKp0qZDeJEfvWsZHIV6o72hCmCP8ydofJhbPTV3XeeNvzXNv8H
	Ag+cag2BNwaD5EoWBKC0IFhHahMxTW8yVX0JX9kSyc8x6IbMQ72y+SWMxhUqLxCmVsIPMUOrTQT
	3oI88fDX397Dhhf1X0swKS63G/LOs9ikv/JROq4YZF3OXEIeNWA==
X-Received: by 2002:a05:6808:c2d3:b0:4b9:e5fa:8903 with SMTP id 5614622812f47-4c31b4c8dc4mr3978457b6e.22.1789151165095;
        Fri, 11 Sep 2026 11:26:05 -0700 (PDT)
X-Received: by 2002:a05:6808:c2d3:b0:4b9:e5fa:8903 with SMTP id 5614622812f47-4c31b4c8dc4mr3978426b6e.22.1789151164663;
        Fri, 11 Sep 2026 11:26:04 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c3327e9300sm2849879b6e.18.2026.09.11.11.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:26:03 -0700 (PDT)
Date: Fri, 11 Sep 2026 11:26:00 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, iommu@lists.linux.dev,
        liam@infradead.org, maple-tree@lists.infradead.org, linux-mm@kvack.org,
        jgg@ziepe.ca, kyle@mcmartin.ca
Subject: Re: [PATCH v5 0/3] iommu/iova: convert from rbtree to maple tree
Message-ID: <aqRHuO1rzkaIL0WP@hu-ashoraj-lv.qualcomm.com>
References: <20260818152505.1057922-1-riel@surriel.com>
 <aqQ2E68lmU3Fbjsk@hu-ashoraj-lv.qualcomm.com>
 <d2f5889660e97f03fae2cd43ae32d8bf8edf3446.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d2f5889660e97f03fae2cd43ae32d8bf8edf3446.camel@surriel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI1OCBTYWx0ZWRfX7iECkcsSBu9m
 3iUHESxhU0BNq6k2BygOUGNieyjSKtR37G9qw/bdmmyUMhjSOAeHRZk67EfJDsDIk+yqqzWhSdH
 Pid5m3nZ1NFXSoF6uxGMjcYCJjjRG7umPPQ19gWs5PsRbYol0gXbg5NuZQv7+07m03JaTPhV1Rv
 OyYb9F8GDHwV4KSm98tcYHayszZ29GAWRtgJMUng/nvssMAjEta/PKLuOPsigy4FsijOnkWbYL4
 fVMwPYUJ5xUsvAVcOWGwIqOPyLNdHbATDI73DdwZax8EEf/lwo4IHXpgSTRed01ACCzVUWE20f4
 0p1Zo7fgvCmvXLa4PCZVnzuySjKcuyqcJA1lR1SsBiKQMZC3OrvW/eHolCtk0+gcAS0t8ybUZTM
 gFubmCN01/rQpi1JcZ2iaWKFF0MvL7vgan2bwJOk5A2vEWF3Punc7WBzZjv5ppPmDGamGz7B5t9
 JHB2cziiSBsHB7fgZuQ==
X-Proofpoint-ORIG-GUID: y1CAcqwp86aGyVKBtS4j-j_a5H_Ch3pV
X-Proofpoint-GUID: y1CAcqwp86aGyVKBtS4j-j_a5H_Ch3pV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI1OCBTYWx0ZWRfXyjmEZn72CVRj
 25XBjOg+wN+DKXoJA/u6ftuM+NXbvKFuMGC64wTWVkLNNqjUJJqwX/zIDODDZEEbdPSOcEi4rY/
 GPeI6ppzzlfZ9AnBbQP6ihZLNCt95iw=
X-Authority-Analysis: v=2.4 cv=LrwHWXdc c=1 sm=1 tr=0 ts=6aa447bd cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eqVH15oDgQDJub46UIAA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110258

On Fri, Sep 11, 2026 at 01:27:29PM -0400, Rik van Riel wrote:
> On Fri, 2026-09-11 at 10:10 -0700, Ashok Raj wrote:
> > On Tue, Aug 18, 2026 at 11:25:00AM -0400, Rik van Riel wrote:
> > > Occasionally production workloads at Meta run into the linear
> > > search in
> > > alloc_iova() in ways that cause real issues. For example, when
> > > enough
> > > CPUs at a time fall into the linear search trap, systems have been
> > > known
> > > to get stuck for so long that it causes soft lockups.
> > > 
> > 
> > Something odd, except your cover letter rest of the patches are
> > missing
> > v5 prefix in your patch? 
> 
> Ugh, indeed.
> 
> The content of the patches matches what I wanted
> to send, though.
> 
> Do you want an identical v6-marked series, or
> should I wait for feedback on the code?

naa, just wanted to tell you since it happed the last one too. 

Unless you hear from others and you want to roll in new changes, this
can stay. 

> 
> kind regards,
> 
> Rik
> -- 
> All Rights Reversed.

-- 
/ashok.raj
ashok.raj@oss.qualcomm.com
Qualcomm Inc
