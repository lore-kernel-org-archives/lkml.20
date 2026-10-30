Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377469;
	b=dtdP8Li7FCRvnsqY+v/U7kgWJf5UVKnvPejXkEsNcXb19Z2dyHIO5zEwhLoRjE2dlY3F
	 aVJHLfKYrCco5ryuT6sRlz+325f5NPh63J+ZheU1Mjk+51XnmmaA2oqV+ih8bkt745NPl
	 3+U9A2VTX4zvXAEI4TOa/e2w4myPXL9SNPjw5o3kv0Cf6ujJLHcBb7oxtbB8NvYrwq6xp
	 pgOCTi0svgu2MPREmTdF5X1rxMByOJVWehWhUibJg1/VFUjJs/SU+Y3BxWTwcw4H+T6iB
	 +4kqRdfp7xQwMiOb2mSOnBsvn3ygWoYw7d0mtWkowVpvSfTYk1xOdL8HifTWHGcLAMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zQNtNZSFKk3b1SWHuvIukuDRed4VUjqAkVFuTv8R5y0=;
	b=l95csSTtQdrya4KEmOm9ytGi8TbfxAf5tGawGZ7qgqLfEKYBBbTCaNSl43hy80eC1uER
	 etsMfi6lpc0nJ4q+9Gzls192PQLtICV3/q5Eb49Ya3zswpbzp0MKR1dJD4q0AhhRUOffN
	 hnb88WAQzIHZxXkdAfBhx8gR9c0ckGMblikVu2Oz2ySZ5E+zn01ok4HRLFYL4Zc8P3oHe
	 tDp2fmSwhMo5vSvjxCWtrrHjXDnTwoW/YLIb9WoR+ATFYcQr4GSy2CAdHWYP/jOtE0cHy
	 VRN8mgwD9QDuHH87/Sh0MjGPwXuoDRL6xtu5CmNwMg12XTbjKko5Rg7qDrBgXFMqNqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6cgC2aE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NU0uH06C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7A5606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F7A5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6cgC2aE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NU0uH06C
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERCAJ3515438
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zQNtNZSFKk3b1SWHuvIukuDR
	ed4VUjqAkVFuTv8R5y0=; b=X6cgC2aEw3qwS3NdtWihL8QzyMn2L8/mSGdLn/8D
	K460qPW/SzZUlis7dBQMJSo2iH5V0JJ0lMiDLhaLqobt6vnie36xl2fteL6PLTZI
	oeQ04Ae20A9D9ATLiZpiNzapkzr6LRddvIScWEKka6BUNyj1IXREsTjmFpxSj/Md
	R00AfQ7Dp/T7rdlpoNqcQNNlpXPvB5NAWqq+95ZygVHAHqUqrTh6ILtxxvh7jr0k
	Ek8ytWvJweHCv9Py6hyGos/fESErIrCI7Mcaml/ioMljj8A2Q2lJauue0F1KwZ9W
	AYeXVc5y05xvKAGZDNqMar1vWEvF4qNNgXnMB/jujgfsig==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm1a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:24:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc1bb97ff8so195662137.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793377466; x=1793982266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQNtNZSFKk3b1SWHuvIukuDRed4VUjqAkVFuTv8R5y0=;
        b=NU0uH06C4JhQOV7mgp4uINri6WTnOXizyEsRLVsbZ1vMrxpreFqXiiRoso8Ys83VR3
         GQouA0YlbgFeLijOE8C51+o48nLM8oW/jP9fFIvYIehEjOX8uW/+PEmhJACbd8LsZI90
         ojQb5+dP/mHeOHC780JEdxWj4uqwkBGkg0gzjwPRK0sHKZACjGQ0E0lzG7FlE22Z2qYr
         dsF3O/4iZ8ADwunocoy9ojVWgM+B49lfoiT+zDIERXltZxlGsbMv7cFZCJ2JUFOHTeQK
         keS+YGD3KlSKy0+F55mD0Yv1Df/+q7npegyqYrCqu9vK4+xl1n+ExhNTx83iGCCvyasi
         x/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377466; x=1793982266;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQNtNZSFKk3b1SWHuvIukuDRed4VUjqAkVFuTv8R5y0=;
        b=1OMlK99hEUUu+lAz87jLvmXKD2j87wsP1wMISg/nJtk07V4bM+HPu3hgqdoy8zGYMo
         s3EW8kFxKhPrYckkH2IRgm9MRawPJrTHX/znfYYwud1W/xtNB72qXKW6gLOOMbDpd0xq
         uVabxmxwiLjBRc7zmPWMLCTLBPCwJQYQkC0bcanGZhxD783Ak8e6AYIh7xUY5RKDaOOz
         GPN7qgUuy3a1EorsDTeOvE/SlX1CO+52NbUEfvzWzRVPS8aA9wjidVpm10Ww0Rjtvmyk
         2kXsC/t3Roo/4euaH5CRTVwPHCcaWK6jFfwEHgvg9+Dw3dxhsvklSM5BewwbTuzrwZ6E
         CrZw==
X-Forwarded-Encrypted: i=1; AKwUvBwJv0QBji5a9hs1UeL980N1KPgiYszpQJThSzjVs0kMYkJHDWtY/xfqKqNYwEOfIAUZWJiqBk4VoGLLZEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHT4Wy1IEiaQ6hz4oFDpUvuIFGn6E7tcQUT7nx5FWiX/zia4of
	9K5KCZMw5V5Zrq14u6PCLeiiVQNuGfX0WAzpGLwC93S6xlljQ71naR3BMyoFfYtqasR0k2RreC+
	gADw4kxhFwPS+Sm/cEE7Bzf3UKDNWPjx7A80wVRaAb7/ueRI5LYW+CyBNmXuDrXWbVg8=
X-Gm-Gg: AYBFou3ffIzre3W9e+KDr3+AgEUO/OUJpeid4sW6qhy6kkUqLPqXKc+1g2NpGBPSjVx
	YBs0M71Th9WlE39qr/S6G8Jmr/2G55qHhKQY1mWI3LXOpejVGenPIOHWDLB3OKQmmWjK9AdW/dV
	zMhY/Ytk9IG6fkmIBjoJfFqzAa2Ik4DFdn0H3iIS0gz3bIejRHdqqZX9sRRmhglJPjYoX2TaGsx
	8Dnabgef05bPgk1yumOs1MCPqN00NOUrloNf3KonBWF8WgX+JTQHbadS1IWEk3JAjOq6tBsWJuI
	SfRyiJKhIh4QwVqOk9andZRCTtD9SCZk8YMifyBvoA6W6dnhsD3o978bebxlUC+nN5T1lqpsfpW
	IfravpldpOtKBb8VxaYAzzsCJeqPeMj0p01Gq2isoMMc4OxGS10cD09RdSrPdmtNk
X-Received: by 2002:a67:e712:0:b0:7c2:635a:4f4b with SMTP id ada2fe7eead31-7d072d173bamr1335638137.29.1793377465936;
        Fri, 30 Oct 2026 09:24:25 -0700 (PDT)
X-Received: by 2002:a67:e712:0:b0:7c2:635a:4f4b with SMTP id ada2fe7eead31-7d072d173bamr1335628137.29.1793377465369;
        Fri, 30 Oct 2026 09:24:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm3950768f8f.29.2026.10.30.09.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:24:24 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:24:23 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Tapas Rana <tapas.rana@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: update offsets table for
 x1e80100
Message-ID: <sem3sj673ju7rbytssvy3raqbo3gv25m6nx3pspj6hbegjbtjk@kcpv4wr3uc3d>
References: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
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
In-Reply-To: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
X-Proofpoint-GUID: l4XrkyOTpX-raaUv3z-5SmVNZzjjhuVZ
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4c4bb cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0BQXEinDYilFB-d34WMA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfX5yHg7Ca4pAEI
 PLn8QJEmkfjmP0lNqA0l/oLUgaFVYFSwIOq9ta081U4fpysmfVAU2MYM/9Q2HukhQob3JzJRSTq
 ftKwzcm2Ow+6ox4odCHvf6NZ656H3Xg/+B5Vvof6BJL2FIdidZ+qL04NhsKZwoLSLpEBQEHiHA3
 tz8qR7E3r4/l04Jn3S3SBDchICziIOTVWxDIy1XJOFSV9WD16tU0EINncnL27Tjmg0l7HMWEeYI
 tER5iWFQ5lbB0FcE6qdEkyKkgsUXaonbgxZzODaoiXJaCD7LhizhbnF84a3hqo1WG5V1b9ssoBt
 PQ+DionYvRQbMhGwPshIaoUmel5qnMoXKfd1SKxrjRi82O0iJTWvG/2kDYLmRV65A7StUxjZiSx
 WOkil8ck19OYX59qrYQnXxepBnv8aZbLKbh3+JCfUyL5v5K5gXBzNuKcym6uwzMqJ4KMlIN8xlz
 4OnfZI1ugUhpuTBTGOg==
X-Proofpoint-ORIG-GUID: l4XrkyOTpX-raaUv3z-5SmVNZzjjhuVZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfX/3y6f9WoOcla
 gmGPjfMlT7VP6HHnkjC8OEyBvv+Fepm45eB3OKllqtb/91yuZdOluxLLZiPA3P6OH/Xfwv3ymCY
 r6bPwkPpXod2SsGE+pcIgCQnkY795Jg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300065

On 26-10-30 16:24:24, Tapas Rana wrote:
> x1e80100_usb3dpphy_cfg uses qmp_v6_n4_usb3phy_regs_layout, which
> places QPHY_PCS_CLAMP_ENABLE in the PCS_AON register space. However,
> it uses qmp_combo_offsets_v5 currently, which does not define the
> usb3_pcs_aon region. As a result, qmp->pcs_aon is not mapped and
> autonomous mode falls back to pcs_misc for clamp control.
> 
> Add a dedicated USB3+DP V6 offsets table with usb3_pcs_aon included
> and use it for x1e80100_usb3dpphy_cfg so clamp control is performed
> through the correct PCS_AON register space.
> 
> Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
