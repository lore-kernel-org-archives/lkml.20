Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439943A16B2
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356833; cv=none; b=RMX3YfvcP+PeehpZMg5yPCsto+Ivq2c6kJrd0yd00ir1xxbUhG7Qr2zC4dmDeT1RP0MkaWoElSundhy6SVykpTPpGfNH8JFiL5CQzmnfljtiw71RSZCOYT4T/Ol8Os6lflBWnJwylOa6qONIDPk1yMkGbluAAlLSukzTHeeBvOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356833; c=relaxed/simple;
	bh=2xu3ydqR25irKH3DwztwsUkt8vMa+0pAkoN6XvXyQ4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpQfala//Wk2Pqc/zmET5k0lRLJtwF93ufQ3eXH5qpP8gSXy6I/y3oIML8W2b8oDfpkCEuLal5tzTcCjJrC2n18mAgQZcXQfs6+nZBnBvKAhuMXQbw8SWdXA3xYCY+jaOAkF/nMc8OawKcPFVmLWXc2PfWj7CkkK/7dIpbc6D+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaSViDn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsDSRQ8z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaSViDn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsDSRQ8z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U7Ju2295200
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 07:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=REdsKXMdkmNBVolsHOiGFdM1
	vrJDGL8kKYoVEdCkWkk=; b=NaSViDn8yT7Lltx4kDek7qbhz+RVHl3A2ZJBFGmY
	vArKbx2G6mtlQH9axzXPfM5xnTDS9v1VVGoijvbxtN/dM6LmFFCN5EOSxWmid560
	vsUo3obpJZbZwKYi8d7/p7buR+KrOjV4mUO1c2WlJtKGIqpyoD+1jXIZ9rPFBfqb
	qmft/OExaoeycsGeWIIxSSkDoo4OnieAr0+iBs8EAk5zV5WnhoBzSKQfr5kQe9lO
	oUjGdFqf6D1dyjFxc2g9jM9bU/dMZq7/2OfIZ5QB6OINxAdUqWaJSafuP1Ka4UyH
	02BfMTWB1LdLkJ6gYs1e6XwChaux9/FxiIuslEOC+70Hhg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s11dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:07:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46b4b700so622736685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791356830; x=1791961630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=REdsKXMdkmNBVolsHOiGFdM1vrJDGL8kKYoVEdCkWkk=;
        b=WsDSRQ8zCViz70bI2bs1M5bEUfXhk3g8COU6fqMiPBe0Z46z9QLdGi3EfhaSKx1OQ8
         BVkKv9MGkR1Iw0d+VgzHtNnikrnz4trcOoZj4yU3FKQlj6gVkwZAxad5BOs6HMm/mqDG
         eA55dUHd3IHmc0dP5djgk3PN3hPcs5Rirn7KVfs8Cd3mJJIK+pv85vR1NN3y6zTzLVKn
         9f3xt0RWy3u2ooSOgB/Ct33GcCBJoN0g2VC7UEYplNUYgcmBdajeEqMKhOl1kL274EbR
         BZ+hc4XvzXe2elnKfXoapsES6N4MojbxHZ5FlfmX8STjy/juxzfF8D269oKRC7mY0MsT
         +CSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791356830; x=1791961630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REdsKXMdkmNBVolsHOiGFdM1vrJDGL8kKYoVEdCkWkk=;
        b=SsnbIBWZZLra/vIgSoeHoJRzRhb35t/tn+T2XTsKJfzNtFcdBTxBnL1pFE4VXq6ehx
         iTydktBu5kpaKNx3hyhAgyhQ9bvYOJS7QcKybv/oo8OI2VdkVMvkMk9qa2roDatOBa3T
         RmmOZanEwFdoPobdF2BaUhqPo5YXceLDjbqEZaC/XN5gnIkidtCng7xEB5WX7bDqzk8M
         LsqnxPIsckXAl5ELVz1Qw/33dg/rEiEK8mxJb1tQky0hbpEtudypio4at+ILYu3SkmOw
         BguV7x2pLhiSCrhG9l2DFLKuYNLZf/zhaOHnEqV+DKp3225CQxlgLiuGQ6Wx9b7Ds4ew
         VbPg==
X-Forwarded-Encrypted: i=1; AKwUvBxc3kW1q8hsyuJWspfl390mIxpVcPtsFVdlZOLgyqWYleNWZfLfGTpQfzTxUWCsZntRIWRvV1sPa2TWU/k=@vger.kernel.org
X-Gm-Message-State: AFuF++l2BtesKRt3Cafj5Kn9s59yDaiQizRPEJQCpNfvpe4Fpd95oxB4
	WaNPe6vmxUOSXFBpTzbAiEvrpQI7vFq+1kbMVzdpSVcRW4mStFdXngUsJhFwribD2GHH60/93Vc
	6qB3jQlYPhbcuwldHL4fOG16bviXEcKIoE6haPOslGnTcLaM9Qp0gStsITe7aqKfppwY=
X-Gm-Gg: AYBFou1L5oYPwMn38fEFvtB3NRM1VQhVpUrOT1FqABirLubK6G0Q2QIw+a3/S8KWoK3
	VKl9Uh9qf3TNGWbaQFt7roaSBgvbaZ4KNzEtAEJXF/gSihwk1w1BQxkulBqvKI9vzXhwemcoaHe
	DnsR5YH2PCjXT8/c06oZTbQMkyJntenZHa55orGSpPRQulr62H9qPwRgUy89aK/QYKC1wSHwc0k
	7Ya2jpavXKwrZZ81L0t2TB47xSr8lbzzXgZu3zTG6ZhtrvMyk8YO/HHL+j92Vuh9pReiU0MjfFY
	05BY3X5HcmmtDjN7LB7kJorTAczogwsMXZ4HR6fOGM2hQ7iXlOi0Btw/6SjjefswK89/lRm2U+H
	AJZoRCFSvAWd8lwx/Vq3/NDP3tv2oF2R6qj753A6y2Pb+uAiRXYMwSl3+fEc4RKAlBwC1PBA6n+
	YXJ28qg7MvFEFU
X-Received: by 2002:a05:620a:29c7:b0:93b:beb3:5898 with SMTP id af79cd13be357-93e9b807709mr253454685a.49.1791356830386;
        Wed, 07 Oct 2026 00:07:10 -0700 (PDT)
X-Received: by 2002:a05:620a:29c7:b0:93b:beb3:5898 with SMTP id af79cd13be357-93e9b807709mr253450985a.49.1791356829790;
        Wed, 07 Oct 2026 00:07:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bccfdb892bsm440897e87.12.2026.10.07.00.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:07:07 -0700 (PDT)
Date: Wed, 7 Oct 2026 10:07:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-nvmem: Add IPQ9650 support
Message-ID: <tnmm2misly3wct7out4gybimrql42si47trcoygaquan2gm2w7@rzqqkefwdmvh>
References: <20261007-ipq9650_cpufreq-v1-1-bb808da4ab2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-ipq9650_cpufreq-v1-1-bb808da4ab2c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tqO9CMvH7EIeuAYhnGmucObCcZ1NS1uw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX65m+C6nbXWny
 GHSoEGiAwq0jMhuTmpygnRFPBIbzT9nlxPszoLwrTSrECFjGD+S+Zx+MkYwnTe80LL1Hy5mKQQ9
 VwVT7L7vRJI29Qc//LPpJP3zTK5/Gejb4bv9jWoqSnp0PC7RtMnwCGnRumflVMTuONmwZj2u42Z
 s/8a/8nA3j1mAze9NXrc+5xG//hEdBz86cl7CWfSG9YjbQIN0XZl6h+4H4kYWOK1VGcMBrP8JM6
 /3h9ZhFcGzQ9BPZuu+MMPg4SWTNU7Oj+mBoCoHDQuHB/IQ5WmcpbK3r+E4Vbz7EY2wS1zZ2xDbh
 +ELq4FCkESi4G3hXfYgl0sqLxtomz36HnQvzDLZlnzkNwRXv8BUCec/ARYF/5GU4JcJ9nUlRQbn
 bn6fmT2o4qXU+BH19mlK/vUuKvhzMjTwpyGR1AoqWC8Ngq5RfsDFXbdpSGZlIMUZpFnmeoPoduc
 GluLPCD+qOJ+xXZcu2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyOCBTYWx0ZWRfX/rw6CRci8lTF
 RxmHQpXg3hDS7cjD/yc4IEt315EoGCKznUfSWJ35e5GvFirnVZxubZGdem8WLY7r/en7L8IqF6Z
 XuBfis4YUinnjJ4uzA9SXN5t0wM3CFU=
X-Proofpoint-GUID: tqO9CMvH7EIeuAYhnGmucObCcZ1NS1uw
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac5ef9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kH__5QHoUz9KciXxkXMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070028

On Wed, Oct 07, 2026 at 12:31:56PM +0530, Kathiravan Thirumoorthy wrote:
> Add IPQ9650 support to the Qualcomm NVMEM cpufreq driver so the supported
> OPP can be selected at runtime using the eFuse value and the
> opp-supported-hw OPP property. Also block the generic cpufreq-dt platform
> device for IPQ9650 so the NVMEM-based driver is used.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
