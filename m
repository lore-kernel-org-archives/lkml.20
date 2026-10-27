Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079140;
	b=pO2hvF4NER+ORETXkusYVAwcGf4DW8+R+PpLJ5wMJL8R6tvj2rRYFKEBQcszsc5pRTHR
	 EMtlw/UD2YAPyGjWvIoBdaEFtmgZ1cIOQwaf4ZDOSDa6T2kXt3RBbKQt/FMXUfzYrsxDC
	 uhLM+Z7ZBXlIuIHofvyPy7IVN8Mw6n0Ki6eQylW25r5Ir66Tms0r/GJOJWwAjnpwOcSJ2
	 PBuRNo5uOlebIZ81MKpokVHvB4OXFH7spFkxa47rUjcN8JuUpc7YdahdmyfBTQUup1zz8
	 UKSO6TUcQP9dTWmxexe25c9cIm0ev8augfknnITUBDvGnOXXctFk3eaj8nGwDTOU7gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VpHSucyNN1LDa5ApCaatg77B1Q+sqWuq080vIR/b0Fs=;
	b=ko0oPEjCJsaq93DEaKZ4hq4Go6z5K5hKZyOcO0QXyyp+gS9iRoPs0mHFaCPo3dTJ/1o5
	 /FeEFeqYlUdHlM5qCnldQwQILyJC/kehArMg+KX39Hiz+P+YW1Gjvb/fJ+EAzF9em1kkZ
	 ADlypnPvR9ktbBIPQ9WYcQLL4WVIaMg0ROFbqiD82weyVOqPNCK63DA/usST3Sr9LfOvn
	 M5w7hAOjFkN3UgSYVGRmiRlJaP3GlZyQHVLL0SFtyZMg4HaJusoo7e6TI1R7TMDgfHmmQ
	 yMF8GOPVMxyvDDTxSqRRMOgasxH4jIZFGwwllW/p3pNQqdFZ01ykHmasKemZ3V0M5/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5u+X6ID;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bpI4Rkce;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314C0606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 314C0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5u+X6ID;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bpI4Rkce
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F9Mr322716
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VpHSucyNN1LDa5ApCaatg77B
	1Q+sqWuq080vIR/b0Fs=; b=S5u+X6IDdAqSFMJ/sWFXego0TywOvH3i2WaDBwXL
	mfDX8VulUGbMrrfYuEcCZ1izjFgzaIrtWd9yxtNA0qeqD7VOsM4ia5hN2HGXcOml
	uTQb9ugVR7xpwkYbLrCl6fiksvHkkO3Dd5ubaWPUyuxgkBtpIiw/h/Di7Lbko6as
	j/UPCPe3ww0utvfbRS54B5/lukNbt4BfwSkRCc6Yr4gmm9g2ggWG1idnUE+APZtG
	OHifiAhrl9MpdF6EFICaQa9Ufp7aMytkMHUCmcpLhjgnZvisX5hrbi6HSsSRWE25
	AksywJxYyO7jNCA0Y1dQSI6nbsRFx2rf/pb1AFANpAhyqQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmma28y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:32:19 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so1680256c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793079139; x=1793683939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VpHSucyNN1LDa5ApCaatg77B1Q+sqWuq080vIR/b0Fs=;
        b=bpI4RkceNKUc2NF0b7jmDkvKf5yHbHtt+mPy5Spyf/y7Cs2iFHyz3/9u4RScEuN8tl
         2mRXi/82SFU1A3/V3EU7DYuw04iS/cineFp7t5kdx2ZznsfTT2iEMIzk4XsVVGdGjENP
         /advAMN1d/Cm4vGH288m3RtRZ+BSKkcvJ3cw/Ich09XhUZS9ZSLVOAM5UN4idV1ffDx5
         Lh37qDxoGdpzjKWbgMwKD2l3ecVGZOLAvyGd6HwdtfrmFn/CpMur+hhbyUn5ub0YwFIW
         k/glP9Jw397nqZnB3iBDj/HElOMZR3AgeJFWIclGwovmhPeF1SlG0LQu7JWGTkkXHeRH
         dYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079139; x=1793683939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpHSucyNN1LDa5ApCaatg77B1Q+sqWuq080vIR/b0Fs=;
        b=ZHvi+aB0fozx3CqWKWeDL8ORR0mOXz7hDbTsxWVH226FuIZDhUXpDq66BZlV6uBwaQ
         ma6olRJCtiJBxwkzi+GyeFKfPShdKZYBeL1/G0+3W8ONaWpVyvX6od/+boKUbnz9Okj1
         0cx01Npn9M5Uyw6SgznfHUmmIHwU71CVENdI37vILV0tBwPXIcxBm+VbG1/vBqJFEIAb
         Ny/J0EMgbKFgMoIthwLHv/+coJ4nU2xU3DGOnMeHX2CY0Bw4Y8IgiXugHRb+R1l2oJvj
         A77xBNRLeT1tW9T21JUr8zk5rqcc2SpwvoGUbXcxWCXY3T+EO5ddHf74oU9OisOXVL2G
         htxw==
X-Forwarded-Encrypted: i=1; AKwUvByaPEiIoBfZEcPC2oD51MfiE/xzcXylcv12jrDqYGLASYgrFIa/f5SLgMlSolPzD/bLefH1D2DUAJaFIWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKKn9/IhyoFgJUqy2vkRGDGsEDdlqWEqxMUkxP3CNOeUiauDbI
	6yvkq6/i7dkTS09dU8H7vHsjjktL81B7brQ4pH1+7KCBQBFBOFPjDQsKH2b10Crc/Kb50fDZ2/d
	iQxGu6RAqduqbe9Yansbb9/whjDNcvj+vP+ocwlCwX9u0scAni15K80bVBFH5u/6r036cazouvc
	w=
X-Gm-Gg: AYBFou29ZDEwMDEkUMQBanfS0Sb+AD02u+9JuqK34s8h5NzbUgC1B3lS4TKsJMYvaaS
	tS5OfQXc8bYvKmmichjkAEx8CWca1BbFpuAsIdSHUXL2oqLQcakNa4fdiPYQ50DmjDuGX/OHyM6
	uvf25quyADpOzQXFMIGN5rrKHTTV9r6xYpHJ3CA3b9gWVulDPMZMWeobPpJQ8iTRV5EXGjoXFnK
	RCRRltQB0/xrv0h7j0IIpbShLw29L9vyOlQUCMajB26mBdFHyZVYXewStKywlcMvOzgimYrK43t
	kM5HPBZ7OeJ/TFnQadtK7cFXxA54BGhTkMyzkhQiE+2UqNSh6rLVk5J+yCLb5sdXie9BvH9R4Cx
	hDSyFM0Oz7XiqfWcwI64TIk/0S4E8JE1H0HFvQjOFlX3oj/r2AzWlsN0zYB55fxyJBAlMnFp+Cw
	hwP09QVdkfyklPepB220gxV0g=
X-Received: by 2002:a05:7022:68f:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1a4c892b30emr987475c88.15.1793079138614;
        Mon, 26 Oct 2026 22:32:18 -0700 (PDT)
X-Received: by 2002:a05:7022:68f:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1a4c892b30emr987444c88.15.1793079137877;
        Mon, 26 Oct 2026 22:32:17 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a37c88aasm27316225c88.23.2026.10.26.22.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:32:17 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:02:09 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        rafael@kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com
Subject: Re: [PATCH v5 3/9] Introduce a new HEST notification type for RISC-V
 SSE events.
Message-ID: <auA3WZf5rLlx4Lve@hu-himchau-blr.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
 <20260924073714.1650588-4-himanshu.chauhan@oss.qualcomm.com>
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
In-Reply-To: <20260924073714.1650588-4-himanshu.chauhan@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMSBTYWx0ZWRfX/bkmBpNjm3La
 FOY8Z29ngUViGTjNyzl0kb5Z78ogcIBtN1eaLG1h3ndSlHQlKNYmRnAJFyfdWhtnsVAkA9q73M1
 beVmDICKs4joXtbyNpIikIjMrnEDpyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMSBTYWx0ZWRfX4Yk8lzGMjBAP
 TZHF3RLVar8XPWXfVUwXlfVIrXB9iJ0Ee8xh3Xma3rMdsJAROC4G/zAm6s4Iffaf2oUbqTkdMvQ
 MGI0Kt67yzrE/UUJm4QYMo0Eu193YYlmWErz3SyfmsvEdIpA/a1rbtTTnGGn0KjDR84SzBaZbLi
 H0fr4Kd9ipVb1BlQWX3zhslPlwtN5FMEUNgVaI+3g12hQjKc1Q8VcwEXndXy1FqavzvxVGRmPtP
 y+akfjoWbfccLZ4eiVpWYbKnb0NGUv7ZE3vIiUfyuNqU/IGzskCKpJOZYZuodnyl+eu4P6waaO5
 OjCN1z51fqe/Jsv6RDjBsgg9xoZP0qQ3oUQY+CqNUcAke+OvkeSqIVMDNRwmJzsQob0NlQY/bUr
 Pz2OV17xro6CPIRKo0q59HMfRb7DXEzn5/UVLVoOM5qt8BIHqIVI9dpE+2DPTqdJsRBzqitDBVH
 2weNi9lCRz2XfuD9HrA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae03763 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=wNwvQHF-ByPSNzcBtQ4A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: n0gpME2mh5REcTEpOcCYx6S6T9RNwOl_
X-Proofpoint-GUID: n0gpME2mh5REcTEpOcCYx6S6T9RNwOl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270021

On Thu, Sep 24, 2026 at 01:07:08PM +0530, Himanshu Chauhan wrote:
> The GHES entry's notification structure contains the notification
> to be used for a given error source. For error sources delivering
> events over SSE, it should contain the new SSE notification type.
> acpi: Introduce SSE in HEST notification types
> 
> ACPICA commit f73f39352c1170464afe812cc96b20cc9db1d822

Hi Rafael,

This is merged in ACPICA. Could you please pick it up for Linux kernel?
Once you do that I will drop this patch from here.

Regards
Himanshu

> 
> Link: https://github.com/open-acpica/acpica/commit/f73f3935
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> ---
>  include/acpi/actbl1.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/acpi/actbl1.h b/include/acpi/actbl1.h
> index d824838cb7af..105fd51f83ec 100644
> --- a/include/acpi/actbl1.h
> +++ b/include/acpi/actbl1.h
> @@ -1798,7 +1798,8 @@ enum acpi_hest_notify_types {
>  	ACPI_HEST_NOTIFY_SEI = 9,	/* ACPI 6.1 */
>  	ACPI_HEST_NOTIFY_GSIV = 10,	/* ACPI 6.1 */
>  	ACPI_HEST_NOTIFY_SOFTWARE_DELEGATED = 11,	/* ACPI 6.2 */
> -	ACPI_HEST_NOTIFY_RESERVED = 12	/* 12 and greater are reserved */
> +	ACPI_HEST_NOTIFY_SSE = 12, /* RISCV SSE */
> +	ACPI_HEST_NOTIFY_RESERVED = 13	/* 13 and greater are reserved */
>  };
>  
>  /* Values for config_write_enable bitfield above */
> -- 
> 2.43.0
> 
