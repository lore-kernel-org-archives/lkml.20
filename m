Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098960;
	b=H62MjWMvGVwF0ubvPRmn21vrYNbBuQlloLhQ6B1uD0BtjU9q+o/aLTRbVWC4z+9INXvh
	 fVhSHk1/yUip/dLD3SSulDXNpk3P9IjoUT8ezeFcYSHU3Ic7fr74xv3wHpy0OV3fHBJiI
	 T9Im2IKqgHGpXkATfwEfr/ttLC4TuM2D+UG3DGT4MfbHAN7COY7dqDOJJ8QKx8MMCdYh0
	 srXU5B84FkGw3U3ezy1VF04ohNvDwBHGai1V0NOi7bWJfrKRKbi0fqzsomXV1hqJHBosN
	 fOh/3JAiEv/JmDzWnZjX+Cz2ESZXTr1azZkFShpLNoaDE/xFgiUKWdEwVlHrKsesqeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IPB0rn2u0rZd9tURP1svLhgonHTIM2Yl2cNHTf01vDY=;
	b=Wh6xKrKmaY8SMWycoF/82TOo6Yc+oxwsiG/fWDBdM8jqiHhQVzhPl+Tg66OBIA8/2fCT
	 AfYh32JOsvnt0AWRed/CCNEZ8nMjEMTIbUevdzAdXbMQFTuLmKthXKFXTBfjLIjGM6M6u
	 RX2GBUSgOO5p4E99jdUQA/5OvRNg4d2Rghm9DvE1odCRehrXz9pVLhbVeNk4bBSZ4X+yw
	 8ZAULHiG4rzCPPun33rIxG92ViQK4R83kTnln3Fg8tQBXp3RtcbCXXVhZ12iftj75BlR5
	 GF8sEBCXrqehT9UJZ1OA9NPu1urth1rzVbZj9wHQ+uhjqUMA8udrigeo9uqN2LiJiLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HU5qGGV5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PsaWdfVN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6D606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA6D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HU5qGGV5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PsaWdfVN
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsBV1973264
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPB0rn2u0rZd9tURP1svLhgonHTIM2Yl2cNHTf01vDY=; b=HU5qGGV5wqWI+V1U
	yH99kQc1m2007GWWvoH/qh/bTeS14xUUJCWmIjkN3RLZbgUqaD9bWSKK2UGuH+an
	uoY6q/MRYulFHAFZJwg0ggPdZhurMKJSU54vVDKwUmWQFJkAEBrBujM+8SShVPqd
	D8QhQzS0xTiuA+WZh1+zZu4tsDJTWXHM1sduJG2/qJI3Aq7sNZHEiBP9HIcKuwIE
	k8VI6XCm6mXKMaY+r1qVJY64yfAiJxW1MfbdDBx63M/mtFsG7XPrGjdceTn5j8ZV
	lJp4BT/c8SntO1VlEwe0po1GTQJZ5MUMZRMqrm4HFsjbTTC/svZowsyF6Gb3x8OF
	w9pNyQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1g7jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:02:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf71bbf197so3861968137.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098958; x=1793703758; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IPB0rn2u0rZd9tURP1svLhgonHTIM2Yl2cNHTf01vDY=;
        b=PsaWdfVNQWzZvjhyiwB4PWNgxhrkqh9YfKWjkG1PNfhwfHTTkw4chve1Urur6Fahsk
         g8GlWeJ9v1CQHQmUEWlxWgKdPn15iX9f892GmFuE6il4eYQrmOZVfEnf+hgEG5X/qxdf
         0h1133cBXKPFJT2F7idShAqLeheOAg+bqIIeLkjbTNjOcAlsS036205nPUy9/MKFrRVd
         vqytpB1eHEkSQDjJNU6L0M5Lx8bbRh/6mc47ieMMHBdwC7n/0pMVDwugxsaQMeELhtQA
         6KD+GiNVTRcMo/l6TG6yQjOAMmBI72r9Wtdzf21+ahYePUV9ZAMaX4jVATlBTzoRk1nT
         w2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098958; x=1793703758;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IPB0rn2u0rZd9tURP1svLhgonHTIM2Yl2cNHTf01vDY=;
        b=tdzSLeFL3UHVcGlFWvzALHBEnAObTZxank0BHsH2lanCB4efno4k2MnGHrtS8iNrck
         JGkN2/QKeDZuv8VMUYPLqCZpbcwWrLpXntzCj8kmjuuLg1ftY9llsVaTbYRA0xlRv4ui
         QLtdch0+HTKFzm4caqEfOni2An/al9u9ca4nABwn/IkZlk4br8Mi+CyKSPhtgVNaB1Z6
         6Eg8oI4PLm2MpaWI0KQUt00f1mNdSVMCUe0upcYZURLQj4+coZkNfxPCT1l8Fr+fglLb
         LXUgndgeSLube+purw1t4oGZ1ykpfmeeSl0fkcDMeXbR1chuA+mTki+YYZliVgLv1L/P
         Ntug==
X-Forwarded-Encrypted: i=1; AKwUvBxXPwZBQKojRbFC+NOPsHFP20mdpd+wWCwTXQX4i0+8YnNSSTO0BnDE1XoKdmzFh8k/LCJ7MGPHEK5/QqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxSXLLkIze5ysTsGa3xmHd8s3cJNsOQutC4LxmFhWahE6Kv+y/
	CvErTD87yofFh/MPBJ1KLdeoRz0koQ3oMZEqFDGWr+kSSdb/xSNTllkrxyXqcD1DElBKPaEDw3H
	wvZv+RV++XBVrYPQQmC5L/H6YYHwrpOFt7XUXDbuCabp3iFoLur7A54mHq49/e2bvTVQXrVM/Wu
	4=
X-Gm-Gg: AYBFou1KaDwFMJU9PfT6sPG3DzhconQvnDj5zBOaU8MSufitqpyfwZ3i1dnxK6W7BMF
	728YyNo/7/U6hEPV4qn1XrezQjLy8ssz3qUJlDvDNFfQKfkTjLzY3uI52QtaO8aUYol8c6kYWi6
	GL+GG22A/fk/+AcG+NP5CJNFDHwbw6E/KPqSZyO80IgNUib8pfgLc9j1hvVFn01oiJxst2xhcSC
	+9KbnOGTQi+13+wldsufD6zTH+ZanE3T8RfeEgwP7r4F2rU9dU+tIlbl6xsTYUeelOZGY8l48b0
	YE3tkOVHKGe1P6G/hsHUedbOThhQwKSAWp8QXaEINZKSTrvm7Iu2kfHaqDFm/d3TBuREmaX7g9B
	Sh3wkGvyeRXDqq0LB
X-Received: by 2002:a05:6102:a4f:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7ce5ca0cac9mr3759054137.1.1793098958310;
        Tue, 27 Oct 2026 04:02:38 -0700 (PDT)
X-Received: by 2002:a05:6102:a4f:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7ce5ca0cac9mr3759013137.1.1793098957565;
        Tue, 27 Oct 2026 04:02:37 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm201832465e9.1.2026.10.27.04.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:02:36 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:02:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: =?utf-8?Q?=C3=84ngsblomsterskymningen_Zefir_M=C3=A5nskens=C3=A5kerh?=
	=?utf-8?B?w7ZqZGVu?= Zetterstrand <angsblommansken@gmail.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, djakov@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: Use semantic names for BCM bandwidth
 fields
Message-ID: <lkt2ryacjrculzbnwwg2fazue2ylocq62uknhwpzomqevfz4cf@y5gok3esfvpq>
References: <20261027095736.94878-1-angsblommansken@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261027095736.94878-1-angsblommansken@gmail.com>
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae084cf cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SDxAmmnRaevP0qTVZYgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: Vxdi-cNO0lJgA3YInfZwDWHCAMgNJ8F_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX/s2zboBR0Cot
 XTnZ4GcPAQOahV93/hr41Futh7xSGmUqPqRnHXMWRfeE5cM8bf6V+3ZObCtaQcZ+HApG8RQwWCn
 rwoAGAHvdpRTXuUkPa5Mbl+QoOi7hIg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXzNF50V1nN73/
 OO1OXKD45AUS0ATepeZ/neimqpd9pOWNTjS73A0uv+WDcjTgPo3vIEa/3QJ6aEz37MlslIMPG6D
 bD513KmLQCLacm6MWahAMVLPX6BO5b7eIv1FdPOmuHXh5avbUS0+b7p7tA6XsBsgViu30m2mVW4
 DG95/WkqwMjANmvmmlcCja6TWU1fBH7xkxOckSswsK16WKLc9Mf79nw7cG1HIPHff72phXQYx2u
 fnN1wIJrWZXxMVxz2pCGV/j7L4VMKcCKt/9UpNi9jvXm56crBozuk6N7KIRIMTBo0jS/NtKafGB
 6g90DynLSWsgjw5SSbAy/YOY8S//9+/mtEz6uHPYMgws8ooZoqd1MHETgDzW+qp5CvRM9HQdo82
 olLdgiUJOUiZUkYK+m96i4wypZ8JFv4UNt14BgjW9DKlhORuIDpqb/H0eGOVo90d8hLWIa4518o
 wwl0fFATzK5RznpTYUA==
X-Proofpoint-GUID: Vxdi-cNO0lJgA3YInfZwDWHCAMgNJ8F_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 26-10-27 12:57:36, Ängsblomsterskymningen Zefir Månskensåkerhöjden Zetterstrand wrote:
> Rename qcom_icc_bcm members vote_x, vote_y, and vote_scale to avg_bw, peak_bw, and bw_scale, respectively.
> 
> vote_x and vote_y are legacy names inherited from the low-level BCM vote encoding. They describe X and Y rather than the actual values, which represent average and peak bandwidth. At the command encoding level, X and Y make sense. In the data structure, they make readers remember an implementation detail that the code can name directly.
> 
> These names also match struct icc_node in <linux/interconnect.h>, which already uses avg_bw and peak_bw for the same bandwidth dimensions. Keeping the same terminology across the core API and the Qualcomm provider is preferable to maintaining a second naming scheme for the same concepts.
> 
> Sure, we could keep the vote_ prefix and use vote_avg_bw and vote_peak_bw. Both names would be valid. But qcom_icc_bcm already provides the voting context, so what exactly would that extra prefix explain? We would essentially say "vote" twice without making either bandwidth component any clearer.
> 
> Rename vote_scale to bw_scale as well.
> 
> Keep vote_x and vote_y unchanged in the TCS command interface, where they describe the hardware-level encoding rather than the BCM data structure.
> 

This is not a properly formatted commit message.
