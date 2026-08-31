Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C103C5848
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161548; cv=none; b=IqSPfrf/nJv/R80DpT2eOFAPewHrK6FQLITWnUUzrxEInUOTK45G/CoSbgz6ObtrpBnP42L8AjQuMNyqymK30jpTi8pdJNoLmdsaJzFbZyi7FZrXfIH6BQwUpLi70SzlPeFpp6mSH7xYJCmDxyQxQ6AIxmRb2PwIFuBOklLYxAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161548; c=relaxed/simple;
	bh=9ZtS3Kh7B2FsHHDwTz+hVkE2XOpi6R4tkIHivT6iElU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELXx9B/1by/oac0EFnnkNpl4VhBtFi0g1O3Pj86tGCSbz3KliSYipgqtbLS3hkv4LTHkIZw7/JeDa9aILMa/gj6toHZn9hRjpFhdBoZ1O4sNWAPVKt7ELiZG6eX9FiAWM5pGe1s3VqVJOtoNl8Y/ABA1a+TtjtqeXW+Rr33on0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuPORapr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCerx+y4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuPORapr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCerx+y4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52JTH1933547
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tcTXj+RZIfINLYSFGhJYozsiKVrp1yzyjRmTapCZ3/Q=; b=AuPORaprObe/vXoM
	zlxzxDwDlLbi6AO4sF6Obq4Z/HYZP8RKkKHTMflRT64uTA/YbIEL9fdIic6uI0K/
	ermtNrhx+WzIgNnSBTClXXbC93qQkOnVwHSU1qAWUgAtPawHDXIWbRBy/ffdHVLa
	Bw9y5cjNvXcy6LsKOZNugLNsTbYoC4MFpf7OnuSKgaLYjzt2e68KZcb8BoshukY0
	oYHK8pGIOBS4tdLFLot1v2GLDcqolt4uTejq61nuySWvIvaLsvoCoA4JbMlR3GEE
	fgCB4QmEff+6y5fLItPhQ4fnZYTqkp1HzPMicsHMlKz3ztSBy5+WOe+P4Y17ybBs
	R3bJxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq8516h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:32:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d0caso74460485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161545; x=1788766345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcTXj+RZIfINLYSFGhJYozsiKVrp1yzyjRmTapCZ3/Q=;
        b=aCerx+y4gLGLzZwjVu6/qUsxeAGU7R0baGxTSW2PfBMXD2d1J17i7ysh9HN97enJgZ
         OaG0ebXOf1GQ0ePwowlqZM9nYmLPHyeBwztsV7QGy44UGKf24nPZkHiskssRKhCtscRu
         S5Dn+3wq60Dp5R6Uz93q+Shl2o2sxZfLzsaQzO2vBMd60Y6kT3Cf/hQMEDfH9CMiKKSR
         s/0WgFkAU92yW/ldJVqqsik8VyDV1Ck6AI3J+QeuKKEKZa6sho99rDNrWeJB7mHf9LVY
         fgkGokXY3BZ/TDhCi3kKT7ZQSg6/LcOkJGDRikEqJlPkpR6A7nb6cQFchBZDSJAcmJNI
         R5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161545; x=1788766345;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcTXj+RZIfINLYSFGhJYozsiKVrp1yzyjRmTapCZ3/Q=;
        b=A4LLR2W3EgrTFgBetG5JiBI5Dm2EGHKVJWa+GTN/e0ZJ8U3isAZPz2BM0pp7ySx847
         5vJkr57HoT9JeGbPm/mUC2FwbrEDok0oa3LCg6GnXpQot8ftYoRk4Sjjz/eDVx4valQw
         s2qIorZZ+PsRGqJm7na2ZTL/bhaEAI/MjNQnVVAIZBO7ah31Tf/r6hwd426dB+yCNo/7
         T21zgDGi2iO70jqBtM/IOHu2ZtJpOYV8jlBdKsP0FGtgtEf+bm6ireF9TR5oYjBeXIR/
         7BMxkeMd9Gyfx/sukNtjeY5EcIGJ/yvFnBRLeiVl6iNbopJcejpIb/6CsKfXqdyED1bK
         j9pw==
X-Forwarded-Encrypted: i=1; AHgh+RrDACTbmCdopOptZ8T+CHVyi3SUZWSLTr4EioJ4rfdSF7G+3nK0szXLEcnM/Bw/Lmg3Sr/g4iaqA59WHIA=@vger.kernel.org
X-Gm-Message-State: AFuF++nusPy0yv9IfllMWpp/N6c7ogicYe4BTgfynMIwt2SOy2U1Yrvv
	7Lpz2UCqoXuznwA3S9vuRT/JTsRLohxdkj8P0nljDPGuV4kN3OlrELO+l5z2pIXsukRFqhXLhk5
	p2WVDhqHjeF4bDs8Tw1TX0oEd/SDIi4+xSQOShtdI2b4mUWnfB1BFwsrsnRzeHEC4vCNoDH6Nb5
	0=
X-Gm-Gg: AR+sD11s6L1WSvub8JnhKfxtiESQmJTpKfPiw3pPvnu6f/zka0xiFrTOZWZ7vQAvR9E
	zHemx+60yYiPLfkxsJem4RRjSJ1/M4WRLQL9iHe3f/yIJPyK0VDGL3mHMH6bhz6Ug+DcPehfHd0
	9MbJxWpYSnVcG2kVVBGJfyZ1sBvidXOv4jAcwuTVy3t4tfYwlQFOxcnijqsfHH82sXk6XEks3o0
	OGwRk3w9SzYbHpWRIP3vUfh0RW3FIpC4hYSQuLW3nNkY118PD651KDKdB9hBETHg/WNfZxAbPqY
	AdHYRQxJxfK8aW0P7CV9yPx6w/gbHxgawbYofB9XohEP/6BomZgSEEX3GvyI45WDy55N2BGWLYv
	ug4tG3AaAbkjGM4DzRoHyDg==
X-Received: by 2002:a05:620a:178f:b0:939:287f:301b with SMTP id af79cd13be357-939287f308cmr777591285a.5.1788161544700;
        Mon, 31 Aug 2026 00:32:24 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:939:287f:301b with SMTP id af79cd13be357-939287f308cmr777589085a.5.1788161544110;
        Mon, 31 Aug 2026 00:32:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f249468sm389389166b.56.2026.08.31.00.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:32:23 -0700 (PDT)
Message-ID: <4f016e11-ad28-40d8-983a-ecc5330f4273@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:32:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_wcnss: Fix error check after
 devm_ioremap_wc() switch
To: Lucas Sproule <lucas.sproule.42@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260827072735.2262888-1-lucas.sproule.42@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827072735.2262888-1-lucas.sproule.42@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S-_UNdztAcMnaXs7gu6-k7UYFp4II7-B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX3f0ee3q+rkD+
 qKPPv5ZLgtO1A2q7xNNAszqw2Ya8q95rr2VL7rmxcahsLV6i6+nFLraReZeuCDbrREbF9RkflFx
 dQ4SBMbAJlEjApXUWTYerln1VzNzKH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfXx/1Y6Qul8Lwl
 CWac1nS8ku6a9pTyLcuPcdtf5ktN/TBgDthLW43nzBknKZsjDa6IyYllptU4Utcw1ixzAFz0+qU
 +PXKrhljdBpjTb7lUP+sr7yivRlCfsvLHBUUYTKyzegbtpUGmTiqoWQkEjjhHemcPlUZK88aC0g
 RbH1pZbnZvNxXgS3ivlCqfIhi5ZYf7COt8p1cpPTHkKsfUQ0g3jcEPMkLy+X1RECBNZY0Mf8UID
 tYaMJ4I9V8DC6ZiU7Z/O0tjwrfpKT7K3hvHkW+NN0+/SF5Xoxl4elHk9HufSdggLJ/8201nD5t7
 Ecwt3wOx0ZckXteTvv7oszY7DXoxLHf8QZED7rL+Sc6A8Jy+Tocbx3t1p5m3at5CSa2FezDP6GA
 tBZBBSB3t31jjD5rppay0n4TxI+O1xFAxVed/ybNjBp4vHWWnlAoLsGpTeEOMc+N/S+wDMBdxkm
 Y93SExGTyov9a0rjjlg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a952e09 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JRWF6Yl71vgolxuYvxYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: S-_UNdztAcMnaXs7gu6-k7UYFp4II7-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310063

On 8/27/26 9:27 AM, Lucas Sproule wrote:
> Commit f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region
> mapping failure") switched back from devm_ioremap_resource_wc() to
> devm_ioremap_wc(), but kept the IS_ERR() check that had been added to
> match the resource variant.
> 
> devm_ioremap_wc() returns NULL on failure rather than an error pointer,
> so IS_ERR() never fires and wcnss_alloc_memory_region() returns success
> with wcnss->mem_region left NULL.  Probe completes, and every subsequent
> firmware boot then fails with a bare -EINVAL from qcom_mdt_load_no_init(),
> masking the real mapping failure.
> 
> Check for NULL instead, and return -ENOMEM to match the other remoteproc
> drivers.
> 
> Fixes: f9b888599418 ("remoteproc: qcom_wcnss: Fix reserved region mapping failure")
> Cc: stable@vger.kernel.org # v7.0+
> Signed-off-by: Lucas Sproule <lucas.sproule.42@gmail.com>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index c856a92af43c..90747af237f7 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -542,9 +542,9 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
>   wcnss->mem_phys = wcnss->mem_reloc = res.start;
>   wcnss->mem_size = resource_size(&res);
>   wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
> - if (IS_ERR(wcnss->mem_region)) {
> + if (!wcnss->mem_region) {
>     dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
> -   return PTR_ERR(wcnss->mem_region);
> +   return -ENOMEM;
>   }

It seems like whatever program you used to send this patch messed up its
contents by squashing the whitespace - I would recommend using the b4
tool:

https://b4.docs.kernel.org/en/latest/index.html

for the patch itself, please carry my:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
