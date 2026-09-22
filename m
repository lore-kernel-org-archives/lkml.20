Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6EA2EEE96
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060728; cv=none; b=te612CXTC+QXdoRuE5v+NpMXNZgEp2cISGvMoS5Xv92lj/dhyb504XK3kJPuUlAV74xreQDivi7CvWC7f+Cb69Ssm+Y3STE2c2sWMilN+ezoPe6nkYM8XJefsskI9QOavwv1hqQ0awuEnlvFCkZjCbg3SQCEkKQa+XHFpmtUO5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060728; c=relaxed/simple;
	bh=hBCN6l1ThVhC4fGeX/a3GQJUpEjGP0OgH6eO+/Jp1gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0gUzJygYmCz2/5pxFyEsEw6/mWqQYIq322D/OtBXG5iiYKZWXG6CSISIVjNV8dV24tanu9cX1F1KVlnrkLGczmH4UZSX7h2ZpXZ4mGseEg4RmPgnuwpAcYoBOj/WNGd18bYgupwqbXV1C3VEnnF5CM/Ycqi7v8RNwcUtc/GOBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6iF1W4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgANO0SW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6iF1W4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgANO0SW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4N5PT3383722
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GR8ZfdkRB66jty9GgiKOimRZ
	Wr0nRSeTXdMImkAoA2w=; b=G6iF1W4V2TFY3dcvk37Pm92nEu3Wh+LY8yJTvGQ1
	vF1hw/WUqThctWkdlML2beHMc5lhqkYApVEUV8/Fjkf1JMTjVOHXpNeIjYrPqWDX
	+eCy22zGK7mqSBlqGrEi4aEz4PNTLB1okbP5ZGLsR1NwjyhlZx3Ui7qFcE1Ytl6M
	SORcEI65ACDlN0nr1tElcVdob24K2YBsgpjH6i9MwiQbl6ljbevM2HqYIjPzv46F
	g4dWR1ANvYAD2ZODgTaoTLagrgyP3oqV5XVa6H6HcSqb03TXKJ9hOFg810lpyh4d
	sCSB5RaLkcWuAC69nF8TTNyOyOgbunbpgWciSs3MuMP7NQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj8jng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:05:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so700230885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790060725; x=1790665525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GR8ZfdkRB66jty9GgiKOimRZWr0nRSeTXdMImkAoA2w=;
        b=VgANO0SWnkUqvVkYpGDqNpsme4WCsCMonQ6UGqKnGxfFvFhn5tgoJsBFHgH4DSDu4u
         JZ01yN46FLcnEKbPENk45XzzuQNoSZBNcv60sJKAwXRfAe3G1dCtbv31vEvjh4pZP4Vt
         qKe8u7AyxrHE7kc9tvvxUbnIMTMZI+sKi0+iuJMOr1ALhXklQL/2zxgCQII93zoAXtOC
         mc+cwMhWj3KlKsPvDoPqGCR2TEFsmbXsd0NMKHvpfdzApEgeUKGd4ricfTmynPtAz2Ku
         VSK+FYTQwmKLAEjVRRt/vnjpP6lYll3SypcFEJ510Tp1S8TO8VaGrenDWelTsQvKAZ2/
         KzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060725; x=1790665525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GR8ZfdkRB66jty9GgiKOimRZWr0nRSeTXdMImkAoA2w=;
        b=e4axLT9bVFArJCbgyQ+q6PsGBM65w7N/dqvcH/5kO+jb/RGpDTHRH4o3Ipa9DPNNuZ
         RN9jamI6zO70scEnzQZRBc3SfIYwTCSNGMiaHhzeSGW/fDJ2Qu3Lk952K1HPyJxAtV8G
         Qc8NU/TTx5a9iECvuQ2lP3FILiWiQuYH0y/j5uk3OOIqZYN3DlebHErJ7zlL/7fDfY6O
         N5db0wKFSemj+fEn06BqrorVd/1BBJVaM+le+FLNCZK17JWxGrZclLuGc4BJrOvc16yM
         t9U4TBEEY5ymnckO3O1PHHf2wHD+caigTTUmAHnEPWCjU8hkS8XIE8yaGydcLgmKvBqU
         yZMg==
X-Forwarded-Encrypted: i=1; AKwUvBwVP6Kkl7qEg8IBbDZ8+qSncpea9PZcg1urRs8q+BmkqL0QkVxinEhRwAplyTCWIcy6sf51JoMrchiRI3c=@vger.kernel.org
X-Gm-Message-State: AFuF++mhuwoOgm66Y3kMuOyNwSa2nYfY9UCcoZgyZfYQQ1yQkadLO/Mt
	qqZx86AChm62PSZCemxhWcdlG9VAchgNKQZl48kAce9Ct/sAu6BacTpNRY9Aqz1EPuAQRMUQFcs
	/pnQRgCSbOwM1xsKrn7h6aPK6qvMNGdJKFEGJHKUfXxnX8KEudbJ9GyyuLGYwk6PZ6UQ=
X-Gm-Gg: AYBFou3SA8KHIEqtB43rChTKWECfDHbYoQzC7xaWj1+TS5WxsXWXrZ5e+s20JuOwQ1b
	u6Rsv4msHG9IDheuc1v8CBZ9kqd5ftSu9bVOP9ok3h2vn5Oyg+e1tB64A2tZH2LBMd0znM8SEzY
	HYYj5hS5e1CP5UjsNIDLK7ymd4b0pcJtc7umKVajxM9REz97JmswGbWZoAsNvjEeZz27MwEFtCL
	b1MHPlQN800sQQ4l7cum1UICOdqmjPNE9lXT/ObZxcA2IMjcWEkXitedo4wc+nUEHvVshUlwnMl
	NESioPvehXebbSBUeirU0MPaqOs/X4qF0/wYaPQQK1lHH4+rza0EyZ3vZXhs/4Z+9ZX2ubc554E
	xdp3WGH2jdsLEXA==
X-Received: by 2002:a05:620a:454e:b0:939:df5:977c with SMTP id af79cd13be357-93c15d918d1mr460320685a.19.1790060724891;
        Tue, 22 Sep 2026 00:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:454e:b0:939:df5:977c with SMTP id af79cd13be357-93c15d918d1mr460316885a.19.1790060724423;
        Tue, 22 Sep 2026 00:05:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8ccc053sm59713495e9.7.2026.09.22.00.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:05:23 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:05:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
Message-ID: <ysfvck34o4qmck32smqrcwmgnuwujxhjcqbew6t3hmamddanvc@qgul2ij6mnq2>
References: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
X-Proofpoint-GUID: YeAX74W9bDyZC9OvSSGCgiGhqWdRUrg1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEwMCBTYWx0ZWRfX/qDri9go4Tga
 /zV38NvHWrE78X07YT+K2U8Vqr//vG7B7D8DX2wZyQZonpoyftiOop6zHc5G1BQ05ZJP0F+Ba/f
 tdg5aeSTn3aUJ/r7CHf3EOvBjNEtHCOzjjjoCK3SEsrwQOAZ3c0IHMxF4N+vqdNoHppflkOLPYp
 1oFlWypCaixHYryEzOviqhu8y/HngtH167wJcqZuUH5SCVXW+F976lReNP+CSkApaj6lq1rXJVN
 8DVa3FpXCh3j7HDvwIZXXNPpjW69XhPZE8RsTBng7SZB2DO9UXWwAa4JDI7+bHgkFsYlErPlHbz
 rzJC22uvTzatCIHdUuSJJ0DZst6/YVQHMGg/fsvsf7E8pEJ+md+7L4VcC2v4owjz87WCrDMpCSh
 XOC+bKco4cRXitF+GduGMaSCizDMa2FsRpKekoVa+rBiO4F2nnJnKWdp5x6txPqrLHQ8GscNyoj
 Osi5qTui+QqzrTvqB4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEwMCBTYWx0ZWRfX7MRMEHzjN5NS
 DQJNamn3+SZvuBp4YVEOeVl75K2b71wui3sg4Aek3zp1AEoj7e+lr5ACub1QT3VRV419ki9t4nW
 OItRobBGHViB5w/3S8UtznmcY40675Q=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab228b6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=r1vr85uP6TVZ_mIZg3oA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: YeAX74W9bDyZC9OvSSGCgiGhqWdRUrg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220100

On 26-09-22 12:10:58, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
> 14, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
