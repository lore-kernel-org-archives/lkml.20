Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE56C481FB7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888122; cv=none; b=QqOHl4ePGuVMVV2NdGnbQ9rZ3WekyobsK14nWnHSV9atSc3HL0DqtnTAQVALRVm8nfVo6/n3jaChoAb8oLbfATSbKShYOXKx2UkFLwiXhD2/FmxaQpRJYK8r81dtB7QlMqwmjAi7qsz1xuIgWgVaww71hDu3c5zNRv9QbekVAZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888122; c=relaxed/simple;
	bh=25t5Shm8jjOBY7bq5UJ8UnAaGLeRkAXQC+r0by3Ebbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEcacw5PBatHF4BpaX5IanKvUpSiuoEkoQ6ipEpaWWkkzeIzbsn6quxGq68kenzpfQak7VvUOZLk+kmtTO4hMdFFBr0ithaPV+MNY4/Jj0P1281nmq/mnIJHvzSLXpMGj/WTgwnayRd90NmrPYuVqswxLdUxWvKAuqA69EEtv6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3c4v/xm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/rCz8CI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3c4v/xm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/rCz8CI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D86AKY302840
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYm7ffZ6kkZ9ZrD23lf7fbY8mVfzcRmka0qHDZVc8vQ=; b=f3c4v/xmL9JnOCRG
	vrDzx9NatQFDk3vf6tHQu8PFSkZXjNMjFpHg5tbvt4OWdCznRP3FZuWe+ALXl8YI
	SLAhZJCEV8EmC4q+aUI4KpspOqC9Q4j+MTj9R2AJnTiIvGmXbb1GAaRHrb9VWs7k
	AnxX/NvEL8YGLzizBrhQks/+T9AzWtpeJgJB9gskD0f2Bq/hrImUSeWBVSHws98O
	u76kbfNQCGxF0RV4HvhKaZSFl5KDC2N0qtm5nBjIHupM9+ngZ0APaBrbL2Rj0Ect
	Uh7uXfTIBnHcZRXJeiz5EMKWEZ8YyR7lEo9W0xzYsFgguM3X4z+NNrv7hQrpcvrw
	yaDqcg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqaeqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:41:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5350d8a2368so6263491cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888119; x=1792492919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYm7ffZ6kkZ9ZrD23lf7fbY8mVfzcRmka0qHDZVc8vQ=;
        b=Z/rCz8CIvF+PmFQKxMMejblCAGIwRfa3+dZ7KisDWaD2Js/XLQjlq+5VgrBq8qBskm
         vgter0chsXQOblfT51l/bg9paOqRW/bV29m5xQHGfnK5yjeda6paGgwL+DdTrZe2Qt5p
         QvE+aRSImuSkyc6s/wfIHrB1NXJs26No0IxVlUiHg5N+9pm3cqSxRSX28DlB0abYWsyO
         Y4VmKxlXl6DgksuoywPGbnAbZvpllkEuqd8m+RKRfPKNH7bbU0IcMSR7l0ijjn1vPB/s
         fYLnYt6nHAew5aTstrskn4Znni4My4IrCvYwOdwbHtkYurmHRJWvH3FDa3modJGeKDZa
         dVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888119; x=1792492919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYm7ffZ6kkZ9ZrD23lf7fbY8mVfzcRmka0qHDZVc8vQ=;
        b=tT4DYL+2LGyFD2oKIfmvv06h0AgrYEZzh0vHQmH2ZabMhje3psYt2BANeTumc2ka3e
         E4ipkXYR36dIEhDy8Sh2IHUQDfFLohWDROZKlFg+jiRnDN1TAxe3yOKGyx7R8f3wW1i+
         zu6VrDSSv1qq1NlLqLx80A6oXgTCXI1VfN6xdCKtj+gD2DCoto1pO7hmc5+Jb5Hafluw
         hT0pwDHkyP6F7J+cOi6SxG1t1tgv5OWWzdkl8xpMsm0cI7FE5U4M42BMk94KeqN0r6M0
         jp8PGxZdU02l4FMWoD5SDIj5AaOyFqceI1zO+GTDVscDYzwe1SfYLJNqgIO5hNxdeQUq
         PvNg==
X-Forwarded-Encrypted: i=1; AKwUvBz0AAhsl/j3oSnjGg5HeOPyZd6cKmXp/cGX9ReSR/1+Q2kN7AKp5VXjmPrwmTa3qhsOmHBwoRPs1bIx+bw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMOedidkpbWdwC9ltKbJn84uReQ6OvTvMGsoo1P1cRKIk0scUp
	Z29CaV82seG0AhvsGMBMIrZY9ix96WU0xj3Ug7ojTAqRW6hc9gXMrB2Sb5kEwrVA3E+DVe0Pa9c
	zryPOAC4+iVr8b+xd7bDBglZi41l7h9HWm7LQ3dusI7B3CMwMukqwe583bNCPDuIVHoGxEsO6Sm
	w=
X-Gm-Gg: AYBFou1kJM4nBMsE3g3751lITl2xqMH74rjYryL/fYmofARkOWWwZn8G28ql1rOqRaF
	pGxQGj7KIAlspFBpYdJl5hu9krE0AddIDB28GmF/oMSiu/ts1OUHmA3qfXDEDtIGIkvzak2Lq9W
	7imke18cj6NDW1qviVj9MVUgZF8KevcFCiSohV7gRyrTLSnkrPuoXckGt6R21mcyT9KB9Yoih2f
	4WcnThXIkijK7kaFuHiJZduFQE3sc8pwhsajXZi6Q8NBV2Lwx9iawHyyNz98DYlT4ZvB0u00+z8
	yvSloDXAgVeNWUYF12ckFPk8gZevd4sDe4YeWrIjlXmv2gJIHIdMeveEK/rylB0HVH4uRzcIKj/
	wdCVegrm9wkC6k10DrzTcyg==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2149896585a.6.1791888118841;
        Tue, 13 Oct 2026 03:41:58 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2149893285a.6.1791888118286;
        Tue, 13 Oct 2026 03:41:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm293208166b.66.2026.10.13.03.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:41:57 -0700 (PDT)
Message-ID: <ff148816-f24b-476f-ae79-5161a8e7d8eb@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:41:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] scsi: ufs: ufs-qcom: Don't define variable in the
 middle of the code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Martin K. Petersen (Oracle)" <mkp@kernel.org>,
        Can Guo <can.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
References: <20261013095924.959455-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013095924.959455-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX8QMH/BuOwYDQ
 bY4+0A7zEqfL1YIBy6p2EuFpJx+h9X6bosC7HZ6W1Do8yAgnpaCGBZrNo+WQsNu9hqQ1sfgj4qA
 R65N6VwSVhj8x9wnKrWPUSSktY4aHbTqrBgOGAicnjAMtX0d8PQKrhp2OaTfGM9BZQ3vHoXk3Aq
 X2hFR86ujmqyy8xGXidqpD+uJtfylP+7K7h284ZF1pahr3n59UW+rWb4i1BobGBlX958OznkMg8
 23EyhS3yRyrmIAQDEeYQKrpiGza/nMic6N5N9pz9I/tbY0J5CkYtyFQP6kLkIRm3W5cdJf77dVv
 1AC8N+9xX90YbLrvJfxgKF7C2XwLUl7kp5n+tH275hq3Jojc9AiF8RH+anDC+OC0E/phzBL4V/m
 rzZGvNgwy5zju/FFCdUXDp3Vxyjg8t6+1d4CyP11rORNvwCLVs885BINAhC0yZx0ZcHW/SZW7jG
 1ok+Wv+g1yjXKXv0L4w==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace0af7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=bd1Yv5s-Whjvz_XX:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=bLk-5xynAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=LrPPbbfl5yCxfJx9f8QA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=zSyb8xVVt2t83sZkrLMb:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX+KPbhpVHbzVk
 ISPoF1L2amfQsgA+ixHvCDlZoZoxu6yClZo7qBNgdOVprZAScvggW9Htcz4kLPKhle7PMCKMUgo
 PwPejYqaSL1a+KluxtzTrexi51F0tC4=
X-Proofpoint-ORIG-GUID: vXH_EiVAAgWneBNyt3swgdM1aBLeOy-x
X-Proofpoint-GUID: vXH_EiVAAgWneBNyt3swgdM1aBLeOy-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On 10/13/26 11:59 AM, Andy Shevchenko wrote:
> While the C11 allows us to define variables in the code, we do not
> do this style (see more at [1]). Move the declaration to the top of
> the function.
> 
> Link: https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com/ [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
