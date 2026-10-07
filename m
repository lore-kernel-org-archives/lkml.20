Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC8411FA8
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379394; cv=none; b=K9kPAXie5roOwWiYZ9N9Cqc7mLtjRrXUw2kiPnHdbd6L3NDlDgp7AfK23j7IqjvXCpxIYUbh3Kh5ncZxnnG7Lxypocbyg8pjekX3bi/y1V+vrB6oBSmhHUEtYccsfzweXI6kigdAT7lwR0w/uyyCGQVaQAxuTl9XHKpPJYQM4O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379394; c=relaxed/simple;
	bh=lcYghPYPQnAUdk2tTeEOuezyDzc0WhSPRSI7GgfJz2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRsNRE3EOuKJlyPqvEBd63JVWwJcaxykrw6M53hmtSwN+dAMfusITA5NNAhDKibWYVuVT7vEb8JAExZjGbdWNAqzGAIF0xIr9mwU4xVdY4Q1M5w7vl2MRXe7kFpuaA782w4MQu6SY1nUMZyeLAJ0gu7Ebph5E3Wiww7aibSJk5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQVLruBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmE3Mh88; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQVLruBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmE3Mh88"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVHjY2970016
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 13:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BjZrN+hkuGyVx/Cflq3VwuxQ
	GN0nui+PJTPi3KeyDmY=; b=hQVLruBuIcAcZ58hbB1ru6pS5+rp2PchQurd9mzH
	Cjd0KVZG/NnqWGIQdyVQg288r219R/JEbMS3svvQ0klRULTlugDVr6+/w8wRqxet
	2S6F8MD4780Vz3obRwb4BBFYOQKy9jT9f/soLNJuPyhVpAmxLcsaqhSfxOqFl5aE
	64MCXP72bi/M+/LwZbBsyN+/sb9mNo4gUHKzk/CTYe/nEVqDQ0vac6gD7w/CLDvU
	jaoJff+EyhomLL5I4gUXkcAaVIQlETGRMRVcZf1GlaHqcA3+pzj2mPqeRBy3PHJv
	QzyV6/ZRtG2KoQktzO4735tsYTkeb21f5/CTeqpbnu7JcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u2a6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:22:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso330110185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791379375; x=1791984175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BjZrN+hkuGyVx/Cflq3VwuxQGN0nui+PJTPi3KeyDmY=;
        b=RmE3Mh88HO9cSGJlpPowPddd/FjDsoAgPqN74P3iX7tu4xTtC1RKFON3iMKhzNzGAg
         O9JSsxhbMVnvLg6H2xGEir7c55CGvaioc0Wr13bBlbtSoYKwTEZlpTOd/uXL67QMPIxk
         3fIfyftQB7P19g6JKidTXkCdwUseeYxpeed/kdg6k6D2cxDl3qn3+M2J7JdSkz8r2tx7
         PbGmv/H4VU2mHosW3me7gBHKF1sqEPHqNeG+kabG74Q/OU5VnTIaofy2pBHBWxomg4TR
         rYDW+aqCwVruywPQvMmchSUch1583mhDypBm3af82bd9aQWILrEYUtgh4bi7bZHrqTZU
         b5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379375; x=1791984175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjZrN+hkuGyVx/Cflq3VwuxQGN0nui+PJTPi3KeyDmY=;
        b=aI9M3UY3Q3VUgvvMgBykD8zi8Qem+s6eELwo1u0bXygmexXD7Ak3Tcz2xGh5VvB7l1
         19ALlh119mZGtsIvYzXjAaIPCYyW8VjIvOmC0C+jhXi4xj/uSdJuIMjPnBsQuKdAXh+W
         z73Tjxo4UUYTck0piDr515erVqvZuUoSIzcmkVrTw0OM5MRDG3yhvE1qkP4eAGYSdbjs
         0iUr0UKmzst8gEpsOdoa0+PO/4zTFJVbvy+PEiFGajWpSZkynLqrh3gAcbqimm7zvTRJ
         xsGXvt65lEPhk+5DlNLuKWpPOZv7EHU3byTAf91UKPthUZYzPDX1wwxOuUNMdXlQ8ZQF
         gdgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlZ2tcswj/PFrldWwcmVBvdyafJ9u2F54dF1VbhcHKr1GMHPgSuN+PviGpXB+RjTu3f8POn3F5WbxdcDs=@vger.kernel.org
X-Gm-Message-State: AFuF++mth63gMqQBIgzl1visivMU+OPruxVK9sDOrGiAYpxX9lN6iWKd
	kZrE20EO76S46dSqDaJil1o4I71sIYbuG+XtaU9+k6TSCczAbaBFbr09EUnpMCwkgfo9CTIw/1a
	WoWsCfrVxAIUkuX/7ffDoGstDxdaBsAPZnUAnfpDfH/zaeMktW5rSxH8HN5rsXm7xCcBSSa8YmC
	D8Tg==
X-Gm-Gg: AYBFou2ia+gp7zJnOZRYkpykAXfk+GYv7eU4667iorBnzZJ4oveTBjR2Ib01S3xWjKg
	xRKw8dnRTh5d/fXIy04Ywtjjo/LOeHisg35eBZZdavOFBDZGTKhQVyMy670c9WwYv5sQFGODCzS
	BZbMhzLw3fI6L9vwmZikZydqlOaXpdT63OeIKBPr1GuEHG2j2Iont4SYiWe+rEhQwBsv64QxAy6
	AJvs8pMQia9N+31mIrFQLmmObrxmcta0txcoMxM04szWGN7wjwj1XTtmcHL3hDjLD9OCnVyrBow
	Hs1JsXzFCayVT1mUiiFxp2rnBMi9qGqNjSZZYvclsXNnXKxwXQjfdhhj+JyP+qeRDkw9lEdVs6S
	CsP58Xqkgk6U/kNstYtd7XvapKT6Oqe6C7sTmVtwlnDocFBAaEnSo3yiiZRBjMK+CTRuKXbo9Jh
	BBX5b7OBkYj317
X-Received: by 2002:a05:620a:6408:b0:93c:6ded:4665 with SMTP id af79cd13be357-93e9b2e9408mr369821785a.1.1791379374715;
        Wed, 07 Oct 2026 06:22:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6408:b0:93c:6ded:4665 with SMTP id af79cd13be357-93e9b2e9408mr369816585a.1.1791379374144;
        Wed, 07 Oct 2026 06:22:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3014cf4sm41282e87.3.2026.10.07.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:22:52 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:22:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] firmware: qcom: scm: Allow QSEECOM on Surface Laptop
 8th Edition
Message-ID: <gfjao7xufwbu5unlqhvwri6k7h3inujospqwilwqhywqxuvs4f@gx76h6ntiqhk>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-2-406fc042162a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-mahua-surface-laptop-v1-2-406fc042162a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfXyFHVo3KvzEl0
 JVS1vhAH052YmQIBUXwxuVtFthvFKbZG3l7CQZG5VzCDk3XY494iwReCEsKopZI6VkDCaqquCEX
 vHD6GKjbQbDhLz55frlv9WUlnmOWCA4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfXwqULeqI6BY1E
 mckHwJNqXPIaQlHH9166XIW1b45HprfdmVMTYA+a3TeU9FxODZbQnWT72UTq5vCBg0caDgVcmnr
 wcmBFKB772CEzgAMUqHSs+fyu7YyPr13tBwr6CnBuEFGYIKw7r1J6ZFuGNPEw7+LeH9OC7BgVQU
 F+oYLNbr3pDY5oSwKUfJeufCr+rCSh6BZ6or84P7qvRcN22uTZZfbvDJXBE+0g4FsgNn4M8sIYq
 NQBLctLNyHlTmgLIzqe8n4a06rD01b6DJ7OtR0ro60ugrrTLHUoREJJs40/oXoFt+ygxi3DF8tr
 ZW8y0u/6lmEbybl2m+lF8VJhEVd+VWQe9yOxO0+jSHQlG+Z4epC9RNfT4/kN0xVnCdSaLcsJ3gd
 4j8VuTzC+3NpID9uku523+MrVXgx8Mz3NiMiVD6EnKaoDdroLyOyQDS2sfEhRrP5jJgHSX86M9n
 3qRMDiz5XdizvSan8hA==
X-Proofpoint-ORIG-GUID: z-yPk5Fn3Zg7wtJTkV14wlzCmqEnu76Z
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac647af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JbvdwL0Z4G9UtC9WzY8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: z-yPk5Fn3Zg7wtJTkV14wlzCmqEnu76Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070053

On Tue, Oct 06, 2026 at 02:50:28AM -0700, Gopikrishna Garmidi wrote:
> Allow the use of QSEECOM on the Mahua-based Microsoft Surface Laptop
> 13.8" 8th Edition, giving access to the UEFI variables and the RTC
> offset stored there.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
