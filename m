Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD357248896
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359988; cv=none; b=LmBUSl/1pqV/3myGakJUkP1psvABX+7P29j9fA/EsEvjGp49kadj362FZipN8diTuijlqIcO1hOXWkFj0Ouc68qk6wXLSLfONnIQtPEK8oJJlV5Czy8pbT/ZNCmQ1GrQ4fru7IwrECuqzl9b7ZI1cw3Bpf2qJ0OZU3OFj22h3FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359988; c=relaxed/simple;
	bh=fjRGSpFjc8M6cbsDeoHiF0I2G3xYfkksOFfGhfZSUD4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YvgWXuw+JaIq7++ySbbGRxVnOIc//740kX/h5eOxjOxyQ91EpIfk+ijR2nZCRUrqzRtLEgtssQqSQjHVDHQvR4IjLtifZithCI68kXgCYHzW9VNhDVCgW8aL7lwIfWuPb3VrfvKJTJnLDEShvNE89Wvj62wgFKbp/OsSa0IWMLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2E2frol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1ZHFikO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2E2frol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1ZHFikO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jgn23334712
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 07:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gv/7MEAMu8LuOR3t2u04tsb5jDcSdhQ0Is0uBrXaBMk=; b=e2E2frolqzl/c0BS
	TSY0qier8vJNk8Rt5meyziF5+ku3CJfN4QbEtJGKv7TXrv1Aw8C37IR/oWqcPsz2
	lnoFuL0sj5cKQ572R/lnugStrfl8IfhNZyHQ8hR8w5DEoaMoc76hkGKsXATuuWzg
	8TP3IlNAw81u+6MRPSarIuqC2zwR9uBs1T7RuSVZztLuborQSy1YgqDgW8lUp5md
	PSWBZW/uh2Fm4atUGTjMqGQALHxrN9m/7RhqJhlSkkPp1vTqyZfSWG+2NzkhY2YH
	gxPEMl0l09zaK0tzVbjCo2n12P9eGS/biHBfdd3NhfKcUMbVsdC8pSorLjXHTmaZ
	pN5IWA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5462346p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:59:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53514fbd4a3so82479381cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791359973; x=1791964773; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gv/7MEAMu8LuOR3t2u04tsb5jDcSdhQ0Is0uBrXaBMk=;
        b=M1ZHFikOUxTjBVhoaBZvMIZLFRJcSdiavlhSTqxas9138eztq7Hc7/8FmE+qHJiNzY
         di0+YOkAPB3J5fvgxNtVYlpvFNCV399kEL34bTTsBJaZXyiCk8LHlUricMQtiT7DJxSn
         9gEHOlQy2XyaJBYlm1UYEtjRZRmaalCepy20sS0Nog+J91UUo5RUJPvJqbZpL5GsvKDG
         NJK35iLduj5giyD0sqrJROT5HNTVMSgFGTsTCuK/YUO3FMHVHOAYG8Gj4lwKrQ3KntJj
         XDKBoYffDXB5fs4xMGzoiQMba4KC4U9RrXNWazxO9t6ak5iXikdJ5GJUx8hW5LhUbDk4
         QcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359973; x=1791964773;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv/7MEAMu8LuOR3t2u04tsb5jDcSdhQ0Is0uBrXaBMk=;
        b=foRFiOiYwHFx9FoltNP0BBtmvXDbd5GG12C87MihdhakDnk8ZbjOt2uKnKJueoYG8U
         xccMACRJUGZy89ABbjP2pLLDjmBNLsNGveq83UVrfT3+PcTIr49y8qFEKZEYqRua47Dh
         0YXrk9N6HCdcaq4SwnPYOU4kM8XM5ujtZ5RPZxuf1MuYqHTdCL3O5NOCRDeXQNdOeJ3j
         j2iKoqn15MNDalOt5eT/qh3j0ea5mwlBFoJUKWghuq41XIi7chiCE+R6oYQxZUTQnwdX
         42b5NooPN8C1+KXWVFi9UKvHlkXKObJ16UN7HkG69G+3LnTJxOVf9qv8bLiDB0jIO/lI
         E1yA==
X-Forwarded-Encrypted: i=1; AKwUvBwa/4yvmhEWUk6ZgYLqS2+fIBorJFodM6YJORsyOiJVV8A355lUkzOXAOx8nzGvpl7xfTCE3M0MsbySVC0=@vger.kernel.org
X-Gm-Message-State: AFuF++m2hHYQF8mFJf6/4vDlneCYZKM43+5C9oUE0QbCUQNv9L9fqiuv
	KpR1NYrVXRJHO13USXQ5nsgItNf9WVba9TTlcKIxOl1xvnNaiJ7/W97WBmnlXYDB9RREVtNLHXP
	erpZ/lpXi2jWBr4y3pW5ctSmL1nSgCHh54orEuphRj9qg+4Oo+UU4HxC2n83HlPOkkQNU72tbqQ
	o=
X-Gm-Gg: AYBFou3MSlgwbIhxekVUPjEbqbNLeQ5n9EG0Myrxx83Fd+s8nxq9hNmTGVH8YYLZIoW
	Y2kuCqirsCJtkGEJtFpQhBXzGgApb3RPpb19x94mRv5wId3LJv9rq4vou/j3i8aY/g6BYpsVyCy
	RLIglAmZ8qUaXdirlLgpUWoNmCYYDYzCC4q3IdcQ5NPoUIk4k6L0ROQaWOndxyFcFgnjd8sDiUC
	MwrCuqWlxBnztIYrYZ9aFa/gOf8GVFl3trJRndOMWDRX/KwBdgSZXtv7/apdnyzV7wII7F7BQSp
	xKc0AkrfZNePgjfU08voFzuoRMN0IzM4vPnSLOJ85U05lZX2C83p5Hhu92X24aJOl+0qQv+/W8v
	yKHKNZPA3BlcIobNIezFIpA2Hjn7H5so7eoo25A==
X-Received: by 2002:a05:622a:5818:b0:535:70b5:80c with SMTP id d75a77b69052e-535755b4ce1mr22904361cf.68.1791359972672;
        Wed, 07 Oct 2026 00:59:32 -0700 (PDT)
X-Received: by 2002:a05:622a:5818:b0:535:70b5:80c with SMTP id d75a77b69052e-535755b4ce1mr22903801cf.68.1791359972093;
        Wed, 07 Oct 2026 00:59:32 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c49c35sm145831755e9.9.2026.10.07.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 09:59:30 +0200
Message-Id: <DLYG41IFMP2J.12CCFGMZGC4ZQ@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when
 available
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Paul
 Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Andy Chiu" <andybnac@gmail.com>, "Guodong Xu"
 <guodong@riscstar.com>,
        "Zong Li" <zong.li@sifive.com>
To: "Charlie Jenkins" <thecharlesjenkins@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.16486951642128892687.b4-review@b4>
In-Reply-To: <179133089395.137225.16486951642128892687.b4-review@b4>
X-Proofpoint-GUID: c45md2JWH8p26HqzOt2jnkxerSXDqS19
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac5fbe6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=x1oqbuiUUPxTaVOWjaoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMSBTYWx0ZWRfX36QKoa+JVuGO
 2JGC1ZSn7kIXcg2iKjzpD7Sg0YpzkuSnz8PbcoQbXO9whmopHNp/VccgamjdqgGoMD/PQKGOjPN
 PGmlRSA9jbm+PUAiVDFXPDHUqtFi0L0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMSBTYWx0ZWRfX3DqcbjxVVe1L
 ecwXfVtlY6cKk07xPI/24EBy9fu1d6U4JDW/hGjbFa/mp88RccloGLFwmR2gTg5IfICsEgO0qpM
 HFD1UK6+JM3lJwvHnDVu/lfPFMu+1umoDNbMDhvGFC8Vrgs0ED0Gd+UPF+NW3g+ZINakYFmidvg
 MVM46IUv453VIELptfUKk4bGA5hWW4DnApzm2bOdxqE8VPg3B9Zmxh9VNeSEEVXvwvhaddx52ro
 HYWhUzGzNeni/iLhpKrmpgMhGnYb2nQvnooNnQq8RcFe3Ne9MmFIA7KMgJZ9RIMYU7eST6xQQjP
 j4S6L23Dd2XHE3jZZvfMceBp6lfxg+L6Zwln56X+cSmQGaqK16xa2g6SChHVCH6+fODvlwHbGI9
 E/zduRbTwm3MhB6+vWHkfQnH5iS0maaYvTHlW3Q82gDnB0AJO84myi4sGscKgVTgmE/fLMLKmaA
 LhuenDwrRIFSlk5ZU+g==
X-Proofpoint-ORIG-GUID: c45md2JWH8p26HqzOt2jnkxerSXDqS19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070031

2026-10-06T16:54:53-07:00, Charlie Jenkins <thecharlesjenkins@gmail.com>:
>> User-mode use of XTheadVector requires non-Off sstatus.VS, which we set
>> only when has_xtheadvector() (CONFIG_RISCV_ISA_XTHEADVECTOR and
>> XTheadVector on all harts).  XTheadVector also bundles operations with
>> floating state, which additionally requires non-Off sstatus.FS and hence
>> has_fpu().  hwprobe reports XTheadVector from the per-hart vendor ISA
>> bitmaps alone, so it can advertise an extension that is always disabled
>> in user-mode.
>>=20
>> Report correct environment to user-mode.
>>=20
>> Fixes: a5ea53da65c5 ("riscv: hwprobe: Add thead vendor extension probing=
")
>> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <radim.krcmar@oss.qualcomm.co=
m>
>>
>> diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/=
riscv/kernel/vendor_extensions/thead_hwprobe.c
>> index 2eba34011786..f07aa1c8acac 100644
>> --- a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
>> +++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
>> @@ -1,5 +1,7 @@
>>  // SPDX-License-Identifier: GPL-2.0-only
>> =20
>> +#include <asm/switch_to.h>
>> +#include <asm/vector.h>
>>  #include <asm/vendor_extensions/thead.h>
>>  #include <asm/vendor_extensions/thead_hwprobe.h>
>>  #include <asm/vendor_extensions/vendor_hwprobe.h>
>> @@ -14,6 +16,7 @@ void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwpro=
be *pair, const struct cpu
>>  {
>>  	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
>>  				   riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap, {
>> -		VENDOR_EXT_KEY(XTHEADVECTOR);
>> +		if (has_xtheadvector() && has_fpu())
>
> xtheadvector is also gated on FPU=3Dy so this is a reduntant addition. Is
> it worthwhile to make this change?

With CONFIG_FPU=3Dy, has_fpu() is set to false when a single hart doesn't
have the D, and has_xtheadvector() could still be true.

>                                                                      Is
> it worthwhile to make this change?

I think that it's sensible to mimic the validation we do for the
non-vendor extension, but users of vendor extensions likely already have
to go out of their way to utilize them, so they can do the sanity checks
too... I can drop the last two patches in v2.

Thanks.
