Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BAE4A5C42
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059360; cv=none; b=c4x2SubzxYHfLj9kXuvDuc1sflGAedwerkScdoyGXH3R8+mqFHy9alN7cedgJG/GIydcJBL4ZQvPRgWs8V8ioF1xjo3XOgVMcITcJugmYMZMtwTSzrgfkFR+ajd0Vgz49T1Gl3bA3FYVV+cO9T+VBd13XBdd/QH+yaPnxS3bgk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059360; c=relaxed/simple;
	bh=shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzrfhhpDTGC2kPs06FlWaPYowgFibisXRpQX8KBgTTSa6SOfFa5rAVIcsYvlk0QtjJRqb9KULjagDGeO5EWqaDtyZmQ90O/8vabXJYNVL3dC8tkxgPExUBZK0RLFaFnMz1jIcNH4CD5//53tF0d1pbzdkzjfeR4tYmU/OzyPRXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSJ3TO7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8c6ZUBd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSJ3TO7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8c6ZUBd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSbg2809287
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=; b=iSJ3TO7ckDsZiDha
	vTyozSoJSqmBjxWVultHkFGd8ojNNXSzxnN+tY6pEBDnWMWwiJ1A0YP2CgA4hcpo
	xeT1kAQU4wwKk3dyOvNN8I2U/VqYyY0ooEdJJ0oGstvIcruijG3B+r/HuciccY9v
	OLKDFocGjHXAderIRhlalYRIRJkxWCZ+wxekt4FhoTc/6+8aCXw4w3hPE1Izps0B
	fVdWILymgBZTuH9Up9dHLobMN1L1ja4ak1WKAY/dLSDPWSwzmnabCU6gZIuzeh0u
	MB18l7+H7ZTABqnXAl71uO4FFZQe/mC/3cijRwlhTsSjsS/TQff8A8hH0MugTNM4
	AiKJSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54t1h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:15:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so147085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059356; x=1792664156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=;
        b=J8c6ZUBd/N2XEsv8lya2PICzxrNVoImFYNqerGKiIlYugQbVpq2KOZk8pvRCxjskjp
         lKpTJwZkz0ZMS3ge3Og0Tb0X+QULs3bxrAlvWOApvvwY2PBl6rK/Yhz/NVqes6rslY70
         PxMA29ZpGs5eFTq7Fa4nxKMTCEjxTBp2nrcsmMDh6GgixInQxYziz39R6Bag4UJqHLJ6
         qfh2nk2fu0jOvxjDR66Uuos6Hw4OFFJotQ30Y0sJabHlJ12ugQRpVDMpI+1O556al2R1
         PJrN/wjNlLdapHi8fDJcRKGhGD8HdNmBeVTiYqbBpIrq1QVe+UduJyi3T2Tj2IVF2AxN
         4rSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059356; x=1792664156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=;
        b=H7rVbPOICmnLRqXifsFVCXDyhh2g2fQtKUThUT1XyuOnFPsPkRqZPaZ3mO8l4pY6sQ
         OB5XblPKix8eSEAiUMiXyJLfYN1o4MsG9AiXQZ/7QP9b0pqJwjknPZxHq02joWPrF+e6
         wlXZPqUpdI/cjBPrRhyZxiF9Di9oejFy+riACzGku+xvOsceTCXawhEYePDqbd4GcUZD
         /cjXt4Jseym+jqZ+Zo12bbQNcbbDrPIpd7tAZHzqVfuUQUquhfRrBGwPKMINGZkGeeAQ
         t6VtorB7Em5DrftpwTT0xC1ZI3MJZCrNQ6cDz4Mwv57/lqOnY/gDDAKwnI2YcMmL6eNj
         m8wg==
X-Forwarded-Encrypted: i=1; AKwUvBy92UHKpq9HML3kvi2dZhjor+muFOMsTN323vceLRy5cK0Cozj4PeFX6wFYZVZ5cUIwyHfl2hHI9SJAEbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK79MthRNFTDCsEgjdnFo0Ot6du2B+zouYtXbqUaXsXGtToE0ot
	0vsUfUiY4g7ff5BVaFYlPMTqeaZK8Sh8R7yiqwqdCbHu0lKw5fQ2+z3hzWW7Mca8OPgyMdN6248
	ygUH/0DYFv39i65mOR8wHBjlmRKmJhDfPScQSzL/smF1PRqFPYijtcnHR8LYb1GbqJyI=
X-Gm-Gg: AYBFou3W7eOOlOjjfvtQYp7c09foi1sCCUplKnzG3pFznkpCxvYGKTE9bddoDuGVGUk
	kSOnKZleHs2lxGnGVZCnH5tnE7XywfikGJXGTCVNRTRR1a5vngOew1al0yLewvLTtPBw+iMGWOS
	qewT8E42TyImc877wrXPki06dzMvuXO37uZx7mtS9PApbLwV64RRYZuWPabLSkRwMD0TLKbdImf
	qdk+RIX4oI6hU6QldeZOQisbO14tCDGsMEeJ5jV4djkA7+heEGFUA6gvdkZYhzIaXoJm3cdoYLQ
	gUvau2C6uPrGWeSIb8LI7gCF+/RHYXLakeTkxH2eLXG32WieO+G5S3qshCXkmQlP8winW8913a9
	bG9NUisk+sM+lR+ha+SYMtw==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3300568385a.4.1792059356018;
        Thu, 15 Oct 2026 03:15:56 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3300565185a.4.1792059355485;
        Thu, 15 Oct 2026 03:15:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6beaf65sm106831266b.3.2026.10.15.03.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:15:54 -0700 (PDT)
Message-ID: <e147f162-a52f-461e-9c70-4947019ca4ab@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:15:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015013827.716465-1-shengchao.guo@oss.qualcomm.com>
 <20261015013827.716465-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015013827.716465-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0a7dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FBzCk_X8rep-KjbTXLsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfX0QAh+DcLUKQ2
 1eduQTCofeXS6ZQ87pgGIqmh8Zv2PTLee6gPlY9plwhkGLmIsrVCuyn+vnEFR81E2P2kOpRjtZ/
 IAaZxjoZ8B1Ni99Jfow+nsPwsqBe39H1+Gk9t59C6EHR9XrRoMwB0vLb/s0X1suzaC7vXc08u4n
 APmcHvQGjX58ZqgpBfHdsZXesDPTmk1aplvYPbY0XjzozkP4GfsKZelhR5XNzgJKNt1ebVlAe0d
 rTKbDDbj6m/Ln9+aiNcDxj2YIBFbM3OOgvTa0CDTOD9amNigVBLV/oBygz7UMdanVYl8+py5cie
 AvY0bp90FqLWI82dt4xWft1A6s01IspSE1T4BhvDhLuMHDO+otKsxzNFiVlXkLmV6XpokJAhA11
 +DMFK/xragZOn0zroHTgBeanv00WYnuM6SicybEX+mTeqJeMEY8tzJOiyASArTenf9nF3A/OfoQ
 yDKwyJmcRgy5yWajoaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfX87DCj6uy9tuS
 BV2FBo3A+kw6WxhngxsiuFqAnKNPVfhu+yIZmmLz2oHmjIL58/L7LoNUpTWxbqYxKVkGISar2v5
 o3hbXYxKPD+/HP9cA2FoZ/XaB4ht8Cc=
X-Proofpoint-GUID: Fp-PqbhVQniUavNO9HnfMuBn5t7hz8Kb
X-Proofpoint-ORIG-GUID: Fp-PqbhVQniUavNO9HnfMuBn5t7hz8Kb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150040

On 10/15/26 3:38 AM, Shawn Guo wrote:
> When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
> a crash and then fails the attach. The core unwinds the attach while the
> crash work is queued: rproc_boot() drops the power refcount back to 0,
> and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
> the resource table and disable the IOMMU. Once rproc_boot() releases
> rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
> marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
> torn-down state:

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
