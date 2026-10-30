Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793366754;
	b=b2quPTquRWpr0tJAMuZyik7h1ZCWwadmSVP5shRFRRNr/GSEolnEfIxunndYuxLwYt1o
	 SOfaCbWGuinwwPqXvtnQq5sI+nec6nlf1Z9VRrSqvCAF6Qzu3XNjABMefqE5cFj+szo22
	 V6zqM2ebjZaJH2V4cplstryZGZNfno2/XCL0wXJ2J4VKmtBpsxx1iLWMSqoVoR5iQYvo/
	 z0ma9x8orfWpMWCZIuo2dHihlfCUWOJgFNdd/cWQ6latFmxhchtf4o1tcwBg2ZJLl0CMi
	 pTqyHbN82JMmYoiVd1cJm6m8mmXynUw2fZFTMj5j3d85DNq2xoTm885KhhnBd73QI9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366754;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0yIqH8rTlsuDq51lfs3vb+Ea8wfpWG7AfZ/9AnIdEPA=;
	b=MEB5WqPzMjImrqyFLGsH1Q6MxHHCgVYYm3dKGFwJJkf4QfLVp6jVesiXncYTuROyagp4
	 4Rhw7s+/VQtw8TxhpUhG0ctOQ0j2b0RjkAiUpmR/6PmpdZmf2k1Yz9RS/oeVeoJ4f70FX
	 bXRgJ5NYMH9xYeIMiFzLdq6aZSIHMoajKX35e1cXTJvnnjcDb3vjIefcvvJvuVTde/WGC
	 B8qzfMZJBNlb2uOCb4yxP1nw7kivMrBbhBK73GDZFY8XMjQnhGGWP0YQUTh88GNtG1egh
	 vadCVi4BwKirRXvQa+fckYypRsfVoIV0oR5niEe9WykAf8ZntAB3ofBvp5jy55spX/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lqb3YdlU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwwzEzFN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086BF606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 086BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lqb3YdlU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwwzEzFN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGHN01527675
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0yIqH8rTlsuDq51lfs3vb+Ea8wfpWG7AfZ/9AnIdEPA=; b=Lqb3YdlUdtJ9/KJo
	a4yn+zoXt2PLvRgt3UPxWwqw5hDaNNs2+6xwGjoQHxn4X/mb9OdIAIICS5CKBvuG
	W1k4xI7YO+zq6xtME1jSz07aFlJ79wQHal+uGfe2kml6ZUerMadJbMQt/AQMnp9I
	TI6ewCumhvBat1zwqceQQgtDTPepv2Ho76qEKvJZfZxYJY18UNjEpEXMUlgjoNJq
	L10p4dARgs2QOfA2L473WCto3Y+k1Q2j1NNekzKfr3BuGGZLqihpGc2lWeJ7t/mw
	zQJt0eYOyXb43lxyJ0TNWmkBEm7O542o5omeC6yi3F5SmRZPh6hBYA0/SvMz2Oda
	ib2JPQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pk7cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:25:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf97f74492so23521137.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793366752; x=1793971552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0yIqH8rTlsuDq51lfs3vb+Ea8wfpWG7AfZ/9AnIdEPA=;
        b=YwwzEzFNtITgk0TWZX1PY9TpexRm+lF/We4EIYN/Kkcmn9emv2xk/7McBqDXb63nzJ
         A5bON+9M7AcP0oYJFz2i4ClMYHqN/8GTbUWIz8ajppPKu6A73bvlX+Pws7M4eiIfgPZ7
         l9T9a755Zg0PvjTZ32uJcj6jxZgLbxbJ8qr5iWJKctrf4V3zICxHvN5DUvDPS/gc5udH
         bglSot9GatdmTVI7Gxp7ptUSvFfRoN1nfz2NCgEXE44jVCycWwtRkpaBqnI6MdtRtqUQ
         HMiDQ7mlbhdzJFgTjI0iNhXdJjIbZQzvlL0ArmMqBL3SyHQyA6ulCWUqconuU0OhMPDc
         F+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366752; x=1793971552;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yIqH8rTlsuDq51lfs3vb+Ea8wfpWG7AfZ/9AnIdEPA=;
        b=xxSGWEpYGY83A39c46wd8I8/pLeXFZF36kTTwYbRObXS3MNR+FhSlOV65qXbvoE/QC
         ctke+rQR5L4TDDhUpkjveSY0boLh75sXGfl9upyMsCO83BK6J90EkMt01oFvleNmEfOI
         CFM06a2WKp8yFooBZ2Bd8jlMIXmVqNRvRPyTRi1basvXgTfFvXRUyomL721cVsPcT9JU
         QvX2vyevXX4QtkRxUBbsWHmli2ny8s01NUdwNaAq9RFP+1x4E85qPECObGXQuLxwxypd
         WouAy2E2a43h1w3ltBPrKOp7BI8rXPBl2EzTFniWsTbLktRGeTfHd0Na5ANwZ90XWtXI
         EQ7g==
X-Forwarded-Encrypted: i=1; AKwUvBydUuMORteh5SSM5GUbeA3FKGd6RnciAt1/J/vsGpCrPfTf36YgsC48Xss183n15fNdtUwcK3A70Lvz7pU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIksFnOx2ehqUajVTwqNsUOXZl5pGsif49mAqByVBAAdaZ0kG6i
	0uBo/vx3KmHS9m7nGzQ5sYvAjy3i7X/gu/U0Y8J18HL/jFR/qLp6aDCoy0fnOe49yXS9yCk+j/4
	kiitWJ2eUlHStxD3rRL1ZkSpAI/o0vqXPYi4dtiLVy+yH6UV79coO7LtFFFu0qS2Wwtw=
X-Gm-Gg: AYBFou2a5M5X8wzalX5A4kNT3vjIz91hlasgd4SLLpSBtpRdkWJn1/AfNoWWCMJCBoO
	Lhh9ndR1RGmQwpaGkO2WU9E3d7MjBaDBv2KboAafSjYrtv27ZJR0uOyUL+HfSXnYQUjDu7RG5E4
	KdEozNxBCtU+Bs8uomfhDDFVeRRZnUiMxuDIIWtcRKeFtY/+gft6nxyOVfJDBVHuYrEXWYuwH2x
	Holwl5IzCzliHMNuQzYjKFRPu8wx3BXAJxd2BPKCGXNKCOps0BYeRgFlp2OGpfUxfiRuanzsdcG
	yCNrsM/pP4U7iGi8cO99vV4WXSCm7e3HKz5vbopnFkv+FT46be5qSO8EgOsiuObnd4Wm9+AIQIe
	8EUFYBg8c1tQNNYKWc9O8fav1+Uvs99H4h1MBu9xXZza2ISSM204I5xlkpPFGorMQoNLg/J1c
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr1126388e0c.5.1793366750342;
        Fri, 30 Oct 2026 06:25:50 -0700 (PDT)
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr1126352e0c.5.1793366749741;
        Fri, 30 Oct 2026 06:25:49 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc20sm65493966b.19.2026.10.30.06.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:25:48 -0700 (PDT)
Message-ID: <70997427-6dfd-41ba-9afe-b2c556085de0@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:25:47 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: update offsets table for
 x1e80100
To: Tapas Rana <tapas.rana@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
References: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfXys0WLVMXmdWv
 ulPSiJ015UKX0LHMHvGCI+OryW9vNvQb6q4+sOPAfB2pIB1p29gRJoLYfhILDt3L8RAWcP1uSj4
 Npcqf/8z4cyj/u4cZXBtA52B7Mdvs4kyfiWF2jxIe7Kcct/w5hk9/wnc7b5f/ejH4/6i3uFVCXk
 WlgEpQtMQq/6vVPHlx6f235FZyDTo2VSiy/DFbfg2t1bfDIgBD2T4nTXnqTKsH/xSvKVLJ0fgdO
 oske972PE2UdwIIr1BJoeh8O6/ugldSlxUE1MdomrGZ+AGbWv7i+JcONEN9NAsq4qepZ2hI7wHa
 FfIyID2jMuXG6vOGKWvAzf7/VjCDpxHyTTXXteBrF7t/OrVbrvos7wY8MulAMgU3OpK8oB5pTaz
 /cdrEy3iPwsG4Ib+5AFR7LL12mRoce73M4Do6ix2CKeYn/xuJ1YTV3OLczehhXo6CgdHKgGOIRf
 +VOcz0KQACiS1L1+L/Q==
X-Proofpoint-ORIG-GUID: VZ-zzPuDln-PVu__QSaC87nhwNLUUyu2
X-Proofpoint-GUID: VZ-zzPuDln-PVu__QSaC87nhwNLUUyu2
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae49ae0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0BQXEinDYilFB-d34WMA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfX3CZdWXJqfO9+
 JMdZ7v8VKYfq7YO5xjRZMSs8CxiSpqC403UzzFvZkWR0ClAlLnUtPOquFEKBkDUz1nSQJrZJF6l
 zoZEzhYcyRFRSo/DyxuUwX3LILCunzg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300053

On 10/30/26 11:54 AM, Tapas Rana wrote:
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
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
