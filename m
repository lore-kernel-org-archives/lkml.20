Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6907519DF1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985163; cv=none; b=sx/BtVpLb1J9DMY21uLtEaC6mrwLxIrYqwqvdUiyrNAx6H6knOMJRkOxMI9LsbGFrPUpbFtfysmQIXAZEeeOoPGtalvzcnsZiMnNC/NdMOoaz4lSPCVB6J0mYNv5HzwzYlF8NhFw2ZK3xGsENsJrWicWKC40+cSUWdNGBUXuGlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985163; c=relaxed/simple;
	bh=aMjQnFM3wpRrDRUEzrRbcrPNUCkg3e/4O8PTerEkdFE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UfW+3Sd/oPg5fBioUYzjKzpUYVO7Cc6k1QL3iaIhpgkPAi6D5xrReBNUzZJmioVHzpNNvShLrunmU+roWk3PVpQBxP3LAn1ZaFkC/lQKF7RCTWi2kU1r1PGb1vEp6cREroIuXgVOxwD+LzHhkTafKp5TMXNPbp6N885OLWQYy64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=daQzY6Pi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3GumGDw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="daQzY6Pi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3GumGDw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDHqkS328832
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZRaRstQy3PLCF0tdj3ZFW+VIDVHpNYipeJXq7D4zHg=; b=daQzY6PiPI94Csn2
	a8j3G6L+SvsY3Vv1q0jLRAHcOrhK7NGVJKfLVahWMWTf+A0fWBIDWbiSs9cBUIGJ
	7c6NEHNvGzohqOMIkB26WzkRoHCvjsekoQEzKFU7vTZtwQdyDmG9kBRN14BjPuZc
	bvc20kMriQT6DcNBFDRdZYl+KGFgzOxQmtgTnovPf5dehlyVUaAt4WN2u36lb7CY
	Y4Zd1QkRN3YR1b7yjT1aK48/OJllfvO5ZiltKttH32r7AegMJoHkwR+tF8AoJQ5F
	PWGOWhpIibmQFNpWB/ScngR/xDSRsnKj2WxRoYGJnVu8Gi43zZw78SDK0uzkshKf
	/HSNCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf02sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:39:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so879155185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791985160; x=1792589960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZRaRstQy3PLCF0tdj3ZFW+VIDVHpNYipeJXq7D4zHg=;
        b=B3GumGDw+ueR1heeGTngrxwhhGXMRFITlrLVgf67+ENBI+ckafUdqkBWOdLEFsidNE
         nhDdGQ+fSS7pRjL+zHR8SC7WjygRhCNap+ycpDONgbPx2FomI0ScPQygvARAm6wsdar2
         2W0ijUcGpSMDudvXG/XSs6bPRNbn+MHQim6rvVpNLb1cvlu2D+ThDKbNyav2D0zGazEP
         iuNjFiaSxIAxEWkcU1DXNKlRfWOPxoVN+NQqwqpeVIC1QACIRT1oqRL63GY3OooEkJVq
         8jWk42KvbhSwCZZUpOE/uLpASrXsqfHC/J5+bTl4mGT4kIsqxcBcLhHhsvBzIkJ18IBX
         DdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985160; x=1792589960;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZRaRstQy3PLCF0tdj3ZFW+VIDVHpNYipeJXq7D4zHg=;
        b=vPf5x9wH1NW167/2rbuNvs4QeAns90NP89nb6FkDD3a2Agd+nueJCpQngWxbNCj3fv
         6S8c5/piObGUgAVncCIrFI6idLlNQX/g0Bmmvl5uUn1CQpWVd5voBXAd8OwO2YquaWIe
         JfCLWRA72qSE2SUYKq7FtT0zLxXcQkD0f5Gm8bUSpNH8oF7e9U3gSMM+b6HvYDsf/kYZ
         uCkkPH9A2Ywix2RVQFAUbZm7Zl4kAKBMvPDuiQRKKNzh45DeYIWm6cvbzzOYXxntyqwk
         galt4umvkWP5Eti4QTcm+LidfujaJGqVFAv2d/6xZpn1T9fcInjeb3vMo5qXi37upRZg
         fL9w==
X-Forwarded-Encrypted: i=1; AKwUvBy/rBw6wCrzFw82kULxapk6lwJ0yxhWeZHYMA6rgqIcSS2+kWS6IzSoyrKe0pvd9PfQIMHQaECtpIQx0Ns=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeZkD9zHD2CVNK12CFcjVJZSsSpnO98Kj/ZU+DA5fhSy+xArTb
	pqyBXTwYY+0f5cituOPquV3zITtF4EIieBwNqtoogMpEHLhXT5uADffIBHJaVzyqkQwfm0eyskK
	pvQmflAYfuDZt3MN6xiDGfWBeIVinJ/O0Zi78/8lF7Z+OKbjeP7TVtX62BiTOhPti0qw=
X-Gm-Gg: AYBFou1RwQqbF2KrfWPM5nAx8ZV4BECq6aA6+kU8kbRUE8Opmsaxi1CS0B4lGhYepQw
	CnFfrFhTToeVlEWXXXel+je6mKDIrs8dWEit1GIfPecjI8UKHA+0MY+DG1BMolzUsQaQcrnkiVa
	7fywPSdxkuZXPN8DYsjNgWrXn/02K7dnpUdVWmgx1Nkgax6xxSQZQy/vEng3OT0wD1hR4vRTH+c
	YWFw7XiJb0dcu8O9KzVD/LN8cCWQnKLngBeAh7a7N1WbLXGaT6SaYL6BhtS4jtmshhPm566vbIn
	ubVG70b7zE+kRS4YdEMBbnO4og9MZMQkwliYRN/lfG99aZ8TQdmGIdy4y5W9EAI8w6oNE0Rou7L
	kGSvyKNE0CK++Fb3ysp2wYtbE1z+nIkWmAi8u2WruBowCBxOH1lVHhJmsQkLFrJKd3bwC53fn6T
	w1ZZ9i7ku1W/l7QQVzixGhEF156M6ARt0SRfO5QqXRhKajv2r78jlSqGDzGQv1ztPWkA==
X-Received: by 2002:a05:620a:454f:b0:93e:d364:c9ee with SMTP id af79cd13be357-93ed364ea97mr1793886885a.74.1791985159819;
        Wed, 14 Oct 2026 06:39:19 -0700 (PDT)
X-Received: by 2002:a05:620a:454f:b0:93e:d364:c9ee with SMTP id af79cd13be357-93ed364ea97mr1793882285a.74.1791985159157;
        Wed, 14 Oct 2026 06:39:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203865c2csm1125698a12.21.2026.10.14.06.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:39:18 -0700 (PDT)
Message-ID: <55d42852-adb9-47cd-a7d7-d5d9a533f442@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:39:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] ACPI: utils: Add exclusive AML evaluation helpers
To: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Rong Zhang <i@rong.moe>,
        Charis Stratakis <c.stratakis@proton.me>, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, acpica-devel@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261014132703.93355-1-aliamemis@disroot.org>
 <20261014133013.94097-1-aliamemis@disroot.org>
Content-Language: en-US, nl
In-Reply-To: <20261014133013.94097-1-aliamemis@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfX7E8ybu1siK6Q
 zNkwt8J/ovvdaTaQsLQ7kM1oc1zVtAuhhsCzv5hesv6fehGm5inAtNPv03xEh+7YhcnMquPEh3R
 dTxWGynv5dGy86NIhbqb72NqHaU6axUJSuFVkf8WUJ+7nb9hmTQAWrT0LFJhAGFiNfOCBPMgW5o
 b//RkPJTgfdcB+EycbTA9nQtA7VdP+y1AzLo43y05SjKdIH0REvH3LTp1ZGYdEfnklv+4+JC55d
 NstHyPhXa5rRI3L176qFKt0u0bs6+A6jVPhHSqDf7ccQBTUn9CC8VwEnT3qc+ywXHgQ1k6EkW7b
 LNjaxfgetLjGtQVRpvpNbWY0+GUSjiUN2CLbQqI06ecAQqVu+3gYHrT8ORGkkI15Il78g7UVIoZ
 M+2VkkNurcaBQrtfPn4hXoavX/KKZre7Uz63RuAcG2y+hqiA08Fd7/MYwzavnno35HCy8aBWgxo
 fHhZmDM6zO57XxYK8wA==
X-Proofpoint-GUID: AOFgmm3ZReCRv4gcgVnnfZFe9AUcRNzX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfX2fq13kTJhYg0
 U5P97osd0n0NpgYFWxfFpmn5WPhhLGXl6BT56rBbOoGLgX0tiRD+T6pGLFzKlg2PzZ1qh8t6b5A
 upEh3Ygq/YNNpp9jB/xnedk/Qktsoh4=
X-Proofpoint-ORIG-GUID: AOFgmm3ZReCRv4gcgVnnfZFe9AUcRNzX
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acf8608 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=opHQSxscGNBN5THkUysA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140054

Hi,

On 14-Oct-26 15:30, Ali Ahmet Memiş wrote:
> ACPICA drops the interpreter lock while AML waits, for example around EC
> accesses, so two methods can run interleaved. Some firmware relies on
> methods not interleaving, for instance by switching an EC page selector
> without taking the AML mutex that the other users of that page hold.
> 
> Add acpi_evaluate_object_exclusive() and acpi_evaluate_integer_exclusive()
> which serialize the evaluation under a global mutex, for callers that are
> known to be affected.
> 
> Suggested-by: Rafael J. Wysocki <rafael@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Ali Ahmet Memiş <aliamemis@disroot.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/acpi/utils.c    | 56 +++++++++++++++++++++++++++++++++++++----
>  include/acpi/acpi_bus.h |  8 ++++++
>  2 files changed, 59 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
> index d499b72574ab..f28680424f14 100644
> --- a/drivers/acpi/utils.c
> +++ b/drivers/acpi/utils.c
> @@ -10,6 +10,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/slab.h>
>  #include <linux/init.h>
>  #include <linux/types.h>
> @@ -243,10 +244,34 @@ acpi_extract_package(union acpi_object *package,
>  
>  EXPORT_SYMBOL(acpi_extract_package);
>  
> -acpi_status
> -acpi_evaluate_integer(acpi_handle handle,
> -		      acpi_string pathname,
> -		      struct acpi_object_list *arguments, unsigned long long *data)
> +static DEFINE_MUTEX(acpi_exclusive_eval_lock);
> +
> +/**
> + * acpi_evaluate_object_exclusive - Evaluate an object without interleaving
> + * @handle: ACPI handle of the object or its scope.
> + * @pathname: Path of the object relative to @handle.
> + * @arguments: Arguments to pass, or NULL.
> + * @buffer: Buffer for the return value, or NULL.
> + *
> + * Same as acpi_evaluate_object(), but serialized with other exclusive
> + * evaluations.  Use it only for methods known to break when interleaved.
> + */
> +acpi_status acpi_evaluate_object_exclusive(acpi_handle handle,
> +					   acpi_string pathname,
> +					   struct acpi_object_list *arguments,
> +					   struct acpi_buffer *buffer)
> +{
> +	guard(mutex)(&acpi_exclusive_eval_lock);
> +
> +	return acpi_evaluate_object(handle, pathname, arguments, buffer);
> +}
> +EXPORT_SYMBOL_GPL(acpi_evaluate_object_exclusive);
> +
> +static acpi_status __acpi_evaluate_integer(acpi_handle handle,
> +					   acpi_string pathname,
> +					   struct acpi_object_list *arguments,
> +					   unsigned long long *data,
> +					   bool exclusive)
>  {
>  	acpi_status status = AE_OK;
>  	union acpi_object element;
> @@ -257,7 +282,12 @@ acpi_evaluate_integer(acpi_handle handle,
>  
>  	buffer.length = sizeof(union acpi_object);
>  	buffer.pointer = &element;
> -	status = acpi_evaluate_object(handle, pathname, arguments, &buffer);
> +	if (exclusive)
> +		status = acpi_evaluate_object_exclusive(handle, pathname,
> +							arguments, &buffer);
> +	else
> +		status = acpi_evaluate_object(handle, pathname, arguments,
> +					      &buffer);
>  	if (ACPI_FAILURE(status)) {
>  		acpi_util_eval_error(handle, pathname, status);
>  		return status;
> @@ -275,8 +305,24 @@ acpi_evaluate_integer(acpi_handle handle,
>  	return AE_OK;
>  }
>  
> +acpi_status
> +acpi_evaluate_integer(acpi_handle handle,
> +		      acpi_string pathname,
> +		      struct acpi_object_list *arguments, unsigned long long *data)
> +{
> +	return __acpi_evaluate_integer(handle, pathname, arguments, data, false);
> +}
>  EXPORT_SYMBOL(acpi_evaluate_integer);
>  
> +acpi_status acpi_evaluate_integer_exclusive(acpi_handle handle,
> +					    acpi_string pathname,
> +					    struct acpi_object_list *arguments,
> +					    unsigned long long *data)
> +{
> +	return __acpi_evaluate_integer(handle, pathname, arguments, data, true);
> +}
> +EXPORT_SYMBOL_GPL(acpi_evaluate_integer_exclusive);
> +
>  int acpi_get_local_u64_address(acpi_handle handle, u64 *addr)
>  {
>  	acpi_status status;
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index a10a591c18b2..e7a671dba624 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -32,6 +32,14 @@ acpi_status
>  acpi_evaluate_integer(acpi_handle handle,
>  		      acpi_string pathname,
>  		      struct acpi_object_list *arguments, unsigned long long *data);
> +acpi_status acpi_evaluate_object_exclusive(acpi_handle handle,
> +					   acpi_string pathname,
> +					   struct acpi_object_list *arguments,
> +					   struct acpi_buffer *buffer);
> +acpi_status acpi_evaluate_integer_exclusive(acpi_handle handle,
> +					    acpi_string pathname,
> +					    struct acpi_object_list *arguments,
> +					    unsigned long long *data);
>  bool acpi_evaluate_reference(acpi_handle handle, acpi_string pathname,
>  			     struct acpi_object_list *arguments,
>  			     struct acpi_handle_list *list);
> 
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907

