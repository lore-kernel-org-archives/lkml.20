Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36BF442397
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361681; cv=none; b=l4wtQAzRPi8ar2suvQq3xKiUAld97Pg9kjK8p8VYLb5h+Qeg5o19WD6BF+a9aMWKuoFoJ8dU61aLkFgopnPsB3o+NRieWcROiCRbUgKsydtRvL0T6r5HIb/pGHhhnxXEZu6DubrjiXhlTe0oJfhl1IIdN7DzWIMhx9tVTZW8c4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361681; c=relaxed/simple;
	bh=ssKQD9BcM3CQbUK9x+g/1XRHw/eSMfakZw6DJb5SrFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txipHS+aIL8Ieqb/Bcq6Pw2Lt2mYdVs3UAky1Y4FVUWQFcLv/nkV2J/XASToFzdfjlW/rWP5cPnOG0RCSoUfGYMlBlPK4D83MNKrwM9E0NG5O5RPf2K1+9eiWE2VZB8hROFAJq/6YUHzlMkP6jH7S68kykmwfPxgm8F+RtfKz6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nj3iRZ0o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVi0LiX3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nj3iRZ0o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVi0LiX3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jnR72711451
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 08:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q8pejVtvwEZY0CJvyioOv3uZ
	UkPCWhEsgph7Y3WL6kc=; b=Nj3iRZ0oHMRNpu8bfSlnIuvRndjXLi6nECGFp2yT
	ZNn4syEZO05KUq/tq0R1NUNJ/zSZ6XCdzmbUy9KIqGCh7tqzlK2ZuHTAx6w9nCS0
	kXblAZqmvVJBxnRCXy6My+ORzRwPfFy1JfrMKipdIupgN9umngAK24gKe9OPlbR7
	cUMRA99Y5LLJF4Nr6jZCtdfI9uvYIFBuGTrY+CmmpoDymZXO2tmm9ofxEkENmjUl
	o1zhg3T6+gmyeDfqFUINIzP6Tmhu5mukagdlwWeqAvwUIkmNlHFPmNOgWYp8YHOn
	gT4T5q4XsoLMWhMJTec6eZjkVJUzIpCOLQBwQk06q9jrLA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s19ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:27:59 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so4335647c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791361679; x=1791966479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q8pejVtvwEZY0CJvyioOv3uZUkPCWhEsgph7Y3WL6kc=;
        b=cVi0LiX32MBI4wZG3Mej8RJ2TFWvRuxk5dmwSwUFzLoFfqwP+9SmyWbP04Z2jYOT7n
         +v/a80P9N5NBlFE2BJ4KOiRfIbD6yjS8wQ3T7HwOSOUVHwgsrB+7CHqtq/u+jva06IZl
         /FLZV+61t2rmsM6wiJ4eKXGfF5gTPTY0BP7+q5o/qWypekJdHoxbpBMQsPgIKGFl+PQa
         5jFaUcpBUhmqG+AIKtmH6IRyX4AdO6YRX1I2krVmVbyUF4Hzpay6F/yBQi1dV5utwCJk
         YhGPWJ96On0blliSKgMnN3N4JHR63tRAiK/mcwSy6wCMBx6eCuKChkGS2OIXQxpgV3BQ
         /qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361679; x=1791966479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8pejVtvwEZY0CJvyioOv3uZUkPCWhEsgph7Y3WL6kc=;
        b=y71HunDsJeAx+eJPA0jYEZq/z8XCMj9qH/cg833WFzhkS1saOGiKIknVuH2WlVT2kb
         BFQNSD7pItCSfwBUY4Xt6hOVa2CPllMQPweHRD4EINJzg5fzL4HQW5SrZegvF/zQbRfs
         2C+ZA8VsGbuU6q+NGrvVN/wYavPD6d54g0Kqc4EmX/gbipS287jajDDd4jKVjLvJ55ti
         Kci/uaLqqDld4CbRtOhL0SdZgtPdL/0qnLSWtWBvaP1xsz/wdXcE4YXsEJrT07e36oUm
         tKdrcUrmTSOqAlCDKeNEX6GsSRiy4O/09kFXdyY6zonPUzizWHvvCunoMGo3xv0vd+WN
         s8+A==
X-Forwarded-Encrypted: i=1; AKwUvBw9ej2u+oYZHeR56tN+sswCML9ALTWe3Uj71nbEnQXFMZojLmkLuBO7Iv4QHN+p/cHTt2gSYeUlC1QOIYI=@vger.kernel.org
X-Gm-Message-State: AFuF++n1bXJBX7JuMNkXHOZmFqHVVEeEICk12Vomh4MOCs8WxTpTi0BV
	MEUGmar/ZLkODMfH0riiXzM+M0FygE+KvpJWVZD6dbHFf9cMHGeSkn4FP/XunN2IxKOM1+DQ4Mx
	nZ4apBwUCBW3vWBLCPv3hJaYRsXcYHY/L4Db7OAzKKxD7MWU6HRUYhaIz47/RefGBFkY=
X-Gm-Gg: AYBFou0rROi0vVZgGZk5kbMjBuVdNXxh6/lxIL9LGOX1S/T6y9GyMXTRIIk6Zq2Lxw3
	x0+yWlK1TwR0BoVrFyCXu3Z2Q08Rr5zBmbPi6YJb8B6MpjwCbNuvXmTEeOSVGQH7KiFq/IfEi8H
	cYfPjlAR9Hr56NJhIH3RIhfQqGpPgEKaT8pzyKhvNQ0KuE95PMJcmOSqLmllGhaOWLEjYqt5jOP
	tOEctO/7y9cvh8yOXSCEut5+xZS0qJiytsxpvdJMJDBokyJ9NIqhHHjlmZiMMPbP6rRoGhchK9W
	E8lgSw0zIDmjESTMYHDSm75i4fFGZjT8+Z2poivXBYsljquOA/7ZV8Va8+BlahW1ScSihjKu+PL
	yAqlDbfufmzQOV69H/WTEAHbMFA==
X-Received: by 2002:a05:7022:3f0d:b0:143:3c9f:109e with SMTP id a92af1059eb24-16208be0009mr1524611c88.41.1791361679100;
        Wed, 07 Oct 2026 01:27:59 -0700 (PDT)
X-Received: by 2002:a05:7022:3f0d:b0:143:3c9f:109e with SMTP id a92af1059eb24-16208be0009mr1524566c88.41.1791361678408;
        Wed, 07 Oct 2026 01:27:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16167ef2e54sm4519079c88.10.2026.10.07.01.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:27:58 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:57:48 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Message-ID: <20261007082748.bcdhzhqsrl25nimu@hu-mojha-hyd.qualcomm.com>
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
 <20261006-glymur-dtfix-v3-2-44e2bc5370c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-glymur-dtfix-v3-2-44e2bc5370c2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lKtN2JFBR2mXqAq77CT6WqxhM6NkAvTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfX1VF3sA6KY5fx
 wjHVg4O1XDfYf5JZ2qBC/5eL7fI0AIHseYkFaZZO9xqDnB387GYlXeRAP5wm7vzKswms9D3t/hW
 9bVkopZ2Gy+c0t+ZdCJ5A5XkPPWQcvMDxEC48htBhp6U4JlJh/CJSf8c/FF9NG94LmF3r2augxI
 2Yd7Qase2rtJKL1pcG4Wncmufd09odFEP8w1nUme0atbM3NfWDyTYl2c5yEHEA76/5+x/4JpY2g
 c0tB7Pwi2EB/wwdZun4dDaM5ETFYjWf8x4fuaGWtFpQMLfZmUn3bsH+zbeRKyaAKaMPqjqi/kA1
 ZptIL8AQilFKv48NLPU8XLI9vu+1W9KqC+pZcbFL/V4SgUG5yFeh1oP1EfPsSJnZ2HRXQ1tlcFw
 rVqMEUK2EMnnvhpfkbJhEDifT9EJotAFXtD1c6vYTXnqsqv9eLko/a70mlyRQctcXTyiimNnynh
 tWIrlLVqYR3I2qYv75A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfX6ihi9k41EaUw
 usXWbtdb4P2S4eI8weKojLLHX5dNpyhNqhDGnf5t5fg/J2fRBDd6COyy0xQwSzEBoQ8zgis6uHS
 BvIKRD0qCW80dFvm48hwVCW3aWMdmo0=
X-Proofpoint-GUID: lKtN2JFBR2mXqAq77CT6WqxhM6NkAvTV
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac6028f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v2SviNC_9pf3EYpT8dcA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070033

On Tue, Oct 06, 2026 at 03:56:07PM +0530, Ekansh Gupta wrote:
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
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

If it is possible to cover all the SoCs like Hawi wherever this issue is
there ?

-- 
-Mukesh Ojha
