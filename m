Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CFB49A3CC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590986; cv=none; b=nRdULCnOhl0SAzSJUxmqWUKGE4yAo0WeZqvvrFAY7bb6ZzVh4aq+qxOAhGnXkefSyHTz8QGLbBT3so5R2ohGb6yau2TXUqiGhCAWZnve3vDteC2iQlK1b5FXRFIavVktzNS6ppiqvd+K1DVgVcwRyuOprNF1MIHwH6fV3+qbPiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590986; c=relaxed/simple;
	bh=ECXWsUnejBZXO7MJL+LoyKce69tcLd0fIXkvPlMdWmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6ZIhUoCXLJM8+NoK02nEqvGjvCgSNs9VNjg33ExBCH9/SsJW8A/RCGVsJ+j670fX2tT2hCjObdnYliAXnY8LL0JUiTSk0ZNXFtvirdiKt8HH3/DtQLMmxZ3oUSQEeltfSqC2FI3p52z8eL6kaclsQPSrlXXKk3nFBZ3HKTKZx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VWga3LQm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYFERCwT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VWga3LQm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYFERCwT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M88O2168145
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3QURnDCY7An5xGLNpCoc6F3i
	MxAhLlXcypiYPCF7hak=; b=VWga3LQmgyLSQieWMTHkkLx0g8x+kECFnzZbPOUB
	jwYRaR0R1GM+0CgFC+Zp0gExgtdnO8KMV3ynBV6jviGUnAjpOKM+OyPLjy/UmwZk
	AtaJXp6Wl16jG5lVYa1jrkUfOT1ZXg0/ip87IFTKGpWYtzGLRJbgLSPskUofMd0W
	9VL1uECnsJOd/bX7xS2fkODhKPMAqEp1L/MxQWwxJilsT3h9HgF7YLp8lTM93m7W
	k3sQ4nNsuYHtomz9wMxNMLvRdjXBaup1t0v6RgeJ0fNPfDCyRSGi9S7rmv+7Ykvi
	Q68iwvFNyll+JnO4r9mODYPx2ZhzXxgMA59dK7uSDEQ3xQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t12ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:23:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530f5e827c6so68804601cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790590983; x=1791195783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3QURnDCY7An5xGLNpCoc6F3iMxAhLlXcypiYPCF7hak=;
        b=OYFERCwTG8v2tPgs+HS69PVY+DAoO/GjZxWr84wanicbPNITF329PdH4k143UncIHQ
         h8oHV8/15/9AYuOPHcw2qxNBUcF+nrNdqHLLYBdvc4BTHXb2E947smKKXNaOzVsbWegc
         HK1hAwsWRE0dFSOnj9aPVDQ6Yk5Ao8W2QA4sZRqmr8MiKd1Oj5DLd0F/y0aOjqy7vfH7
         5yDwD1sOaNgdGfntkIgEQ5rjEAqXg0KGnk8iOp9TjIXBH4XRE5sBPr617rCm7VDLj4Xn
         mvXJxIJiD8XkxUwwWTHPpvPRo2lC9yrXUKvqyi5TBlvksRe2XAboYNf7ijIrbMk9/v0T
         /IKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590983; x=1791195783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QURnDCY7An5xGLNpCoc6F3iMxAhLlXcypiYPCF7hak=;
        b=Mn4Q1u85Re3oH7+VPaCZ1tG3zhZ7SXQNYorAb8ShZtmSkx7/YkM+HYlSccZymqaPiU
         TQUy5i/Ii61LWeB2icw7FxDrrPA13FYDiQc1hM8EUmJr2kWjsM/fQljW0qQQE41WboIv
         jq+8a04hFQ5U6lqLF18RnZ1yIIxgCRLnnVb0biT4inFx4avvINVmyxCB6ErIwk6UV/HY
         2ymYwV1/tGfJJhlkq0McmbcfrtH2iOgFhLktm0euPS+wTnYUZFdiPtuihNd1irrWIl6k
         ELacUofbohfdLBHdV+SQs52XqX3YYrYYTxIdUUB9sYIBjcZnB6A6RxUFcxg1vgJyKxIW
         /4Mw==
X-Gm-Message-State: AFuF++nUPUJD9mul4Iop+iGuP3g3pRThznMOVCJ8Vl/d5u16T7zUgZdq
	GGUfhTpTaeQaMgqW8GtBUtlFn2EW/xipCrMVFE9xtRXz247Mf9OAnl513d9AoDSHmLZk4CKr4OJ
	CwdcOoluDswghACAqUcw2l+EkeIFQKbtmrx5zS/mSG0UmZ85AXPPxD7qAmandns3eprI=
X-Gm-Gg: AYBFou13lby81egmK5YwNW3haX4ndvQWaWN6PY4K04vF8YG0asdMnoWkKZEgoRL2bnZ
	7eafnCp9022WBgzRfqp8X5XxAgpUgOJJK4P9VAelN+/fPgJwHgDIUHLDIFB7/yoqQ3+AWSBMlvI
	kDvLfWXvkHPk1IsZmM0rEWjDtdazPdzT2qluYU282ClPqS2/tDIDNH4+CDrnjwuhb/QOeVrYXPB
	6XoxCyOLTb+b2Hsh+sMnqiHu+f8TIW4QotvVzYDV8tJExCXnR0+hvQ24pL6+cpkGgMEwJfngy/F
	iNOTaK3VJjWaldah+sHFZ5pIZj++qnGN/omYHH5jr7h+NbveUP6VSTRjBoZ7Ct/zNJP+OSRkojW
	X7lvMA+i0tw3bCiBTegd/orKTprWFXyao/HpWfg==
X-Received: by 2002:a05:620a:1a08:b0:93c:6383:48fe with SMTP id af79cd13be357-93c63834d3bmr1077853385a.65.1790590982998;
        Mon, 28 Sep 2026 03:23:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a08:b0:93c:6383:48fe with SMTP id af79cd13be357-93c63834d3bmr1077849885a.65.1790590982538;
        Mon, 28 Sep 2026 03:23:02 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1847sm45517565e9.1.2026.09.28.03.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:23:01 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:23:00 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 07/16] iommufd: Prepare software MSI installation for
 address lists
Message-ID: <jiouhcgwcqyp2l3uwvy2cswgelwezs4bmnk3zgsvkbs6kb2tjp@x2xr4ulqlp7g>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-8-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925151659.419512-8-andrew.jones@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX0ZCrner6/KUh
 fQKsUhomP6VUhT01YEfdEqV4lEv2O1X+Iu3lFRGsh2aLo4b/MZ0OXJxErlpML7cuCEh7GK/Jdu5
 AJypYcaag5Yayc6T1IktL6U4hvEgQMpIGwpgm26P5oNdCivSC18x4rQRMJ3OFrRAXBOquLfImRw
 TI5oUTL4FXSxgCWOPq+doCq+hlDs4J+YN3N7PTZbD/kDwEL/+6eqOLQFb/rhXARAlKqF5XlzzAU
 zWAvq7RxRjbWqRjpZlUQjoMyP2WREKU5LMbTuZvlTNdTjU6UhajmMy+u1axIHwW54NRROI4Uzsc
 /QufrvRQc4bb4WhwnU5TsZctsZNRHLwnm2/OoYhJken8HRVj1lf2TIvnDIXy9jOkVRq82Im3rsB
 29R2nYEYtQ3Hszb8GygJp9MKJVDhpcll6N5QROZe0Q6vquNvW0vX/IUB9kFIy1MXAQ4vyo53a33
 HWRoLVzPYi7qSoKhjOw==
X-Proofpoint-ORIG-GUID: B4lleigP6wcWQCufAojwbSqfaxv5BNRE
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba4008 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8 a=j5oeER8E0eYNLuWwjgYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: B4lleigP6wcWQCufAojwbSqfaxv5BNRE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX3iQSSzpqjbWS
 rb8+kgF4VmpzRXnzhNhcwHMl2KF1mzZ15DU80OStxl+EZhX3LW0TiXSLRaifnwAu9NHSkOR3epS
 SQOq1X4/qP5yOYBte8PwMTKDUcZbKxc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280041

On Fri, Sep 25, 2026 at 05:16:50PM +0200, Andrew Jones wrote:
> Teach the software MSI path to install every mapping in an address list
> before publishing newly allocated maps. Mark the complete list as
> required by the group and roll back mappings installed by a failed
> operation.
> 
> Keep iommufd_sw_msi() as a one-address wrapper so existing callers
> retain their current behavior.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/iommufd/driver.c | 101 +++++++++++++++++++++++----------
>  1 file changed, 72 insertions(+), 29 deletions(-)
>

Regarding the Sashiko finding for this patch. It's complaining about the
mixing of goto and cleanup helpers in the same function. However, there
is already precedent for that type of mixing in iommufd, so I'm inclined
to leave it unless somebody other than Sashiko shouts.

Thanks,
drew
