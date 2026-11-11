Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406006;
	b=ybZ6AYcb4tISq9QvsIqYXqf0G5zD8ichsBG9j7V37WUsOvoynK8DJ5tgN55jN8sBqQJz
	 NTVY+58m8vWKDjHo/Kjzo+p0iLaZckpL/M8jHSGepxBUgkMsQpRxDWuj3rmaRy6agV33E
	 O+bQtmBhY2iUOhVFWCUty7vDDxaWEAaKhvTkHoNbJ27YSPnsAxVcGxT8f41s1iQkY+kfu
	 1Anj+YX58ulltoTL0IGplcIqfsz4iVmFNevxr1p9Kv1OVHGiczVH+2At7Oct9Vul1EBfr
	 9drSZJyYyBsRoEPRUbhxIy1TNGL7OqL96F5Mbvf0tAmp+AAvcR++M59NextHjGTMkVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VNI21V2lgtz8Hzxic3v5KFi0FrkQQXKocGAVFanNboI=;
	b=koJpUG2sYplIrPMQiA90CQBOR8b1b4EJPlRQX7Cm93nRcd92SqcT7BesMeU77HeMSvJf
	 9e4Aw6T/kSu9pqjEesXkJKqDNT6i5xyf4hcxEKdcdb4e21nozHGwaU0L56UmxRUYrPyZu
	 97rD7VpfCp1lM1SHjAL9X9mVZJrbTDqe2cdbawurO1rPp+f4uCYP5OmPFk+8dt3kMise3
	 SQWQFA0CUCWocbv2EdLVMb4ovKBre8xu13ga0ylbUfWQGrg+vigUyvPmZiTXykhOSRJ4D
	 mVRZUXa7rguhN3Bvwfi54xgleIje4mhZpLxmRoe1sGdO5cfAcG8LcmJZScZopvk8V+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGfjdUv4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJRtNHY5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22437606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22437606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGfjdUv4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJRtNHY5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZGZ42975634
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VNI21V2lgtz8Hzxic3v5KFi0
	FrkQQXKocGAVFanNboI=; b=DGfjdUv4+0wwjmeFWoYwb2ro+r/udE3aAA/oqPIw
	ZKWbQgx2p9MmF/XtqTK8XexmCYHJOR7R/XRdRSTqGcu0HBlrXXXpt3/Nd5VS6/kO
	lso3tYXcgIEoYmwFeRDrpKM+UQlHiFM1zwieAElsE+Vv5Rc4IwnfgZZpxUtudSin
	lBcwKuyvjdygaE4mj4rCSyRdR345eGIajAF21QoB8T4C/Kce8aLTEjUnxDmJWlqz
	WW+3dMRg+8ADOF57x7GKIkKYuspxTxafAMVTkWNATRAyS5cen7N/CbJdz6xOeoKF
	1Uihh/sP0TXwyTHX6d6U899uXiR5q5j8kX/SRUFNbU6uMQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cc51a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:06:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806756ea40so2439053241.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406004; x=1795010804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VNI21V2lgtz8Hzxic3v5KFi0FrkQQXKocGAVFanNboI=;
        b=DJRtNHY5AZlen2W9SnLi5XVRPEfyoBIoLPinLwHx3/Qa0n2o7xBf5iH5Myb19Ehj3L
         UzizI91FK3yp8le8kRDTIb7Vc96NeIWe/jWlu26DFs+eoTIIC7HNFxoO5Z35Wn679c+s
         JcSABsgg3rLd1VtS/jTSDhoF51j30f8lUEB0NWgKfoRT4gY/X2s4Sp10yUtw72hggFSG
         jmBW1yYF58lwc0QjUhFX+G6yqvzaWKz6C4vw6It9iSdlFXkiEPMgabAWYLx37jCaHVJZ
         7x1jy8MEipaDUAJy4s5rQRnA0b1rqlJ/6kFwxDJjwyaLIw1HcJfPImfcJhiR/4166Xmx
         7Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406004; x=1795010804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VNI21V2lgtz8Hzxic3v5KFi0FrkQQXKocGAVFanNboI=;
        b=Wk8jNsHpWHpXKFgbn4LeCHMdbPIHmlE5CCM9I5pCK2O5iC38zkC/fciDuS54M1iFlC
         u7X43CCnjvuhhRiHwiCPmusKARVaOdOeURQF8+oL1TtX395I+VKBR/pp/rikOEo5aFFe
         9gUWIRmr43lOZrKQ3lJGPMI63EVnb3kvHYWpmiBt6P9Cgt4uYtHQlI7tIK0Xi8ZeLPH0
         A/IKFnE9uDQ/zelKCKmtgmBxpaOi0ntH+UyztMoQ2e5uw9aqhHJTrawf1o5pQZHthnOv
         hkrTLasGtwKxYW6qoG1cdhUdDn+Me4f1mbt8KizZOtN3VKgWJb6yGJbJ849QUk4wiKbN
         GQdA==
X-Forwarded-Encrypted: i=1; AL+hErHMX2bVRHQbfTxzXxOj9YCQf6Yj05WgmDQz6MUxmBn6wEjzUe5L/tlg7hJEcnk7GBj4yInC83cTTGXWdgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C/hbVdiquWM3APL0XvVaXrhzemn9b3ge2+JVCpZ8J5RNfOb/b
	qCxAsDK7yllY3/spinGAu+hfafRzbhthk06VY62DgN4KW/CFsXs/sge/JZueTj0Iu7GacA99DB+
	l1VL2sb3oJ297UTyuUiWYHWuvDC0ynet10V+BgmHKDXufuaK6JM7cgVunkkjwTgppVeY=
X-Gm-Gg: AYBFou0YIPYSeyinBUt7Cbsbkrq+nYmT/P3SKIJUftUXXSGPGgroYfoWpjlFTqxPJwK
	8pleiAxZz8seAvukiWcWQtnVHQHxuWbmqozFmqhaP6LmnxeAA5srdu2Rp1dKXABb3+dKsBq2S8A
	vAFvx4zOPfCvWkSdRnJ/SgrPxMU18ypEy+HvWRCuYyMH66WtZ273K+l9Mw97PYniU7Yvu4Ki+li
	joc8yYHOZCRfd9KlE5HUVhFVesiSYOLqwK/OucOa3y9HaO4CB73BS713Dmmy/LlENUFySuZLqiz
	JufsBdjKCuUPKxpIm2a9bN57hKzL/CaZt2RvrnTOYFzIgyD+EqqcljppAYCErA1kpWu9EThXU8B
	j1pbengwvB9849l5CqJpONddE0CxofM3cecJcTGOc1VWf30htAJTJ7GkfDbDuDEg3DI64LAS0yy
	9pQbi/ToDD2xXLP+TtrzF6C/aQ1iDaryvji+NQ656r87h3S4MQZrbAx0AMCyDtww==
X-Received: by 2002:a05:6122:179b:b0:5ea:d10f:2394 with SMTP id 71dfb90a1353d-5ee1c40c764mr813258e0c.10.1794406004299;
        Wed, 11 Nov 2026 06:06:44 -0800 (PST)
X-Received: by 2002:a05:6122:179b:b0:5ea:d10f:2394 with SMTP id 71dfb90a1353d-5ee1c40c764mr813200e0c.10.1794406003823;
        Wed, 11 Nov 2026 06:06:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c159702ae0sm815407e87.20.2026.11.11.06.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:06:42 -0800 (PST)
Date: Wed, 11 Nov 2026 16:06:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: naidu nama <naidu.nama@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, irlied@gmail.com, simona@ffwll.ch,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com,
        quic_mkuntuma@quicinc.com, mahadevan.p@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] drm/msm/dp: Remove redundant force_link_train flag
Message-ID: <gfzdwaeouexratptiktpzodi44x6ztsfttqajzr5wxtrluyqjx@axwlv5jlakcc>
References: <20261111104434.2222182-1-naidu.nama@oss.qualcomm.com>
 <20261111104434.2222182-3-naidu.nama@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111104434.2222182-3-naidu.nama@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX80GebS2ZLe0q
 BBvzWquM1mGbkYJklCoHzIqx5w20OzhT8RSGGE7wgPOizolgFhZlr42d4Iwa/QVU/AQb3xsqweY
 nZQRvDERKnBQ/zn6j70l56uQH1W/MEJJKu6kGZ2L11phAjKHam2Jgs70+XrYPyUB+ANDMeOfl1U
 6pnQeCom3JgXsaq+u0uTLpxzhCknbabj5yIm9zC9NNH6HuhfnssZkYhtmepP3ut12M4L1wbSqks
 aHueSaaA8r3+3vAw/mLi/4M8ykD4Ww5MAJ/+ryZRDc/G3/pzWYmxHkTYr7XDNvLKa9pkVTAAgbA
 /JfZLaXBcU+sugJeq4TViu0fyI2w72GcEcMmJwQZ1kFxDdn9ZP1ethE3VkXPBMsSv79pxbHpRVV
 jq/YS7+CWjqgSVN4HXtvh4XiKpST0IPJxyPMe2uvqpmEXboOHe4hqcJ9HjQ45J7ucG1ISIQNX1D
 Pp6eFIdvxGlYKHsdjug==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af47674 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=uVK0n7524QBmBBgzDoUA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: jmFgVbNWWT2jVAg3QxVGpnxv67XIBYju
X-Proofpoint-ORIG-GUID: jmFgVbNWWT2jVAg3QxVGpnxv67XIBYju
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX8tQn6UO4dxeu
 Yzl2iPcOTLvpJyOD1zkSwev6SgMYr1hiGSCmTvO1z2CuR97883zJBUGwpEyoCvvjP4kZ9iqplO1
 4IYHo9X4Z8XnI9SyNfMAy1/x4LoNbWg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On Wed, Nov 11, 2026 at 04:13:54PM +0530, naidu nama wrote:
> From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> 
> force_link_train is always false when passed to
> msm_dp_ctrl_prepare_stream_on(): the initial link is trained by
> msm_dp_ctrl_on_link(), and the flag is cleared before stream preparation.
> For active streams, it is never set.
> 
> Remove the dead flag and parameter. Stream preparation still retrains
> when channel equalization is incomplete.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 5 ++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    | 3 +--
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 +---
>  3 files changed, 4 insertions(+), 8 deletions(-)

The same SoB comment.

-- 
With best wishes
Dmitry
