Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C3E4C77C8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447827; cv=none; b=UQe1y/Dbd01Vb9ieUwZf/hk1dHCGrxrupfoyPDDUUraPRjBo5yFsMCCwdzmBBibEG8H5MCiYv75D6wT/hmAUrIX3MUMoK6rTrrhaC9RxiKvqBvpM0sJ02NrMBJwiUkvjT4+pyo6B+S3uIJ7ajebBrzGBuxKGb3B0OP8dL0WbS9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447827; c=relaxed/simple;
	bh=RavRiSXw0c90tbGRZ+I0K9Ulw+qbgmxvRzPe+L17rkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fshj+7hLYtFMcH98ZnHrt5oEeA7g49aO/GndJQIHTAJrVJrvpU/kljwUTo7IGXdJGVy9PrIGXyBVRSmeqgp+RAfsH4si06PeHe+ekuXeNiCXWxHixT9XOSWccwCyCzqkTosFTaf8QXxl3qC3WCeu0DXWl/cZr+UZtQI98rvzJQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaIFM5vr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWXxGuuS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MaIFM5vr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWXxGuuS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAMM3433531
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g+mnk5DfTfkUNUAaoQao6YSG
	lrDwKuJlbKUzFBnu94k=; b=MaIFM5vrc2Es2a+GS+SNJn68/bX+RLpG+XFZpFfm
	+Di0vIgm8COrv0sbZWgaC+OUV0Tq2jd1S1JwOY1eTogra50lMSw1Ggel7U7wJq26
	UAX3qU2NdMpYndr8uKqt+jPLSXKs0x2d+E6shIPHH0FXvNqO4aMZXEE1UwfkYWDd
	WpYt6OHw0ydnDeikHmfR4ss2/HY53dQR9t/fRjXAfo+24iD5h223Wl50NEiaKsIR
	VA1fej06vjY4srQRkvL0EU1SjcGZwwMZcbWuhEQIGZBeZewbC+jq4Tya13B60KJE
	mLt+0B4hjAqTlmpA+itds3ssL3nG7XHXl9+o6C4pSbl9Xw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82k8x0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:03:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939694871aaso304094185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788447821; x=1789052621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+mnk5DfTfkUNUAaoQao6YSGlrDwKuJlbKUzFBnu94k=;
        b=CWXxGuuSXnN/fMr9qygBXgiQ0zvBYuogv1n5MLEsdPCCdhv4fl61Y3rWawoVN7JDEr
         OmUKJTNQ746B83bnJTdeMfe6FjiDVzIntazqxmUzrQTBytJTklXKoJz/DcEduFoCR9JY
         zHriqCBYY09byJ1yYBoCMGmJNGiuGUy4nSu/ysm64AvBaF8p82CDw3qeZnMzlTVsrVK0
         8Rob39+wysKKZ+C9BvU06WSphG64RjTezlGo+6D5BIkZ+9H6zX6iq6ck/A2B1ZQz2GBt
         D2H3OXNIx37BqW0cqgiXYCEcJ7isulAH2YWEc9UpulgbcWtuOPMMM1GqFbMoYKVbpKv6
         s+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447821; x=1789052621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+mnk5DfTfkUNUAaoQao6YSGlrDwKuJlbKUzFBnu94k=;
        b=ch99aalySixuM/XUlHjbhePjt5nFAlU7P/zyEGtexcNS9cqGMYqPQ4e6CJlZcgDadP
         EJXCEnmfq6QogZKC4YtH50TkD6gwqtBnCZXgkI11cbQmG8x+6LWG8Pq54fAT+8Ra9gUA
         uYsCDwDI5D4SvgVRnws5mZbZwUrAVG5djGOGpSbX9fIoGMY6cvFcAR/nlUjG8TEYi9h9
         Ny9euFXGcrLEiBypa5gd0bKWeUrfb2ljP8vUGQYpA2nRwUdn0pInwc3ZSK18R7C440HV
         A6mHeVqDtNz4GyMStzTmSkDqi8u9eeMuesqvzXMN0nE3Yj3//6U1VmeFLdCVcS1GpDeb
         OU7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEd0HwcsCnPb9AD7EbqrRp3BsEgwjOw8sFPcKsysVzNF/mVYL9v4izJEOGccdTCzO8AHO3NZq3l/pKL8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kvBz/s9ep6eeYzOXE1LZeJo5uqpG4fkuKJEpAU2frzzT5E1sQO
	OoL9O9cVHOSxDfanjmGwZyO/BZTh87HRJQSgo9gyKfb9/naRhy8qddkDyBiiR7TvjBGqLooDw2t
	zN6OuCgMIvfHUT4l+pO3NpuobdXj7KfmgRKZhPjkUCYsYVFsSZKhaAmvlmiaVnsIVNW8=
X-Gm-Gg: AYBFou0HB24n0Fyqi03kyF/iZo0CBNd+IqvyTDiDkwy5KH2JVq2GnBYNY/moaKhABxS
	qg+seIiZ54+dfmO5nLS8HapSNT1c3IkW4yPqRCTv1yuJUgaAmPc23ZesIxSnZUHCuvEyeIv1FmG
	z6QdesSqqV3y2DXbJJk6kSs/S521BFYeM5k+aoYP8hGnKOKiwSlODL9TeFDjoVW1NbXx/283rZe
	PrqbnB2Nh13uGZ6lXdFwsKcdQsRhSZy1M8wd+vtEUFVQy3viHuY8QYbhaZCvQ6whk4iIeCeT/Iv
	XSHGICjfs5RWHjpi7nt62Hk8arwpBJevbQgtyW66e/exuToRUEXdmUDl8tIeGsSqiLlr6x8cbZl
	kNDCeJT92W+MV9g==
X-Received: by 2002:a05:620a:1a25:b0:939:6dbd:de55 with SMTP id af79cd13be357-9397ec20921mr15184685a.18.1788447820865;
        Thu, 03 Sep 2026 08:03:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1a25:b0:939:6dbd:de55 with SMTP id af79cd13be357-9397ec20921mr15172985a.18.1788447820325;
        Thu, 03 Sep 2026 08:03:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm14339403f8f.2.2026.09.03.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:03:39 -0700 (PDT)
Date: Thu, 3 Sep 2026 18:03:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/5] phy: qcom-qusb2: Remove _SHIFT defines
Message-ID: <fkje34nz2eqlhm6nywtcvh5pue2qczmtks7dvcagpqb4ytniak@a4fd6jisdsji>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
 <20260903-topic-8996_61x5_qusb2phy-v2-3-4c3f980a4560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-3-4c3f980a4560@oss.qualcomm.com>
X-Proofpoint-GUID: XvWLuSvsWGrUnAneblCcTJ2AdY9dzBz3
X-Proofpoint-ORIG-GUID: XvWLuSvsWGrUnAneblCcTJ2AdY9dzBz3
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a998c4d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3bhTxtwNgCDITtlkWrAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX+QeYl7cOFdxp
 AweMORUHuR2D9bKhy7SArLyPX2C2iv1GGbMh5Zum5ijzNDSI87efC5EhVOmoAzeBFxoVvJyEg4s
 guf7b7s6/wPs6PqRtEJq3IOXEXNNADt5CLg6ESBOR85++2uViw4ZqW+Z4eR90yjxZ7AOKprqkms
 KyzvOOa/FD0Oc2rZUrVTJ6agYj6EeR4vYv8nWPM41b3agFfNRkCkwLJ2FcKd1Mu2lsAAOj2wkXO
 X0+3yuV2rMtS7qSkCCraywCzL9BjHxHy3yngJojFarEkaktLgwsWzk11iT+1RLh40zMyKDErb0U
 W13yk1uwIS+R2n/DnPTsDYhRR3yDHm1o3A0xvqf4NOVe5Yk8AASbV1ZBNGIasHB9Q4lVg4CDYwz
 XZ6ramo26pWGRILf4fu5PkMApeJAHINwyNd3uRNNVbvSTWDgdxu++P+YWFA1pd1tcrEyHHByUP/
 V+hg1Z+pf2yAzlQ23cA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX3ZnigkjWSsuc
 wLT364JETF2F1VGVU1Y0uH1ILxitqmKvcPBFbKqB3TOxsJ7/t2EdSJFaJGSR5+s6tYFIf4sdeRI
 gfEZa6NPQ6BTcyV8XrMh1w1ML2vPptI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030130

On 26-09-03 16:25:30, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These are unnecessary as they may be inferred from the mask. Drop them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
