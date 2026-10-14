Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21AE5349AB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985200; cv=none; b=JEMBrZS6Ti5iAu6gwtU9V4xdejBEVgV8He1CHC11vvIaGOvnMTiqpMAR+LAR6kyVYOBnYFV17/9j6jhlieMrsLQ01jxQFcXagYJScoYywlw/DMp7P6GJvK2h8GsZV/Xt0w/YNvFcoWjgq+eYAPuj8sFhzOsqBcQhZBm+IEzZXwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985200; c=relaxed/simple;
	bh=0xfdTrDLB2gWOdwJBkzEjPw0cKgTkhuJdf6y1UsT6YM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MKh+aP5eabq9wZ3Pgn8zCPKIqBLFh5krilhfoaNntyTkWWKW5IK9kTKEy6yEwX0ItYPk2b4Gg4A/bEkVkpFxRpOLcxXRM5DgBGwh4u/pWYwTfFpLkLh292qed7aoc9KHWdp2h/Asbt4Xon/3C0WQ1DiuHmBDG6CK/hymcWLaJKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5kxVZpb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBN3TQz6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5kxVZpb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBN3TQz6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8iA6H3000934
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NKJXy1eO5vGiVrxvsBEG/GIMF2FHbHhV5DLbt20ey20=; b=m5kxVZpbI7GUQhYx
	Diuw2Cb7PXF2g6Kk1nf81YlMx8pkB+qU1KrTO49M1fg/2pg+9GIBh0oZ2qhU18m0
	OlTVhT2PClDiT5R4bvvnbThWGaBEEB1sQizX6fNJZMIAvmP0NmUcNCIkGJkCqlsl
	GdSbpDp2H8JmUuCTeHGRduB42x8lbbtT1GrxcqkwgOo78w+ZUS4Czv44bIEFLwf2
	kcaIz2ZfZHeRI2lY/2u8J0ektqC3HP3UmsupYKEkt/sBfqQdqpasMZXrGTQGugG5
	KGdqAYJ2z0AceXufVEwCSQfO9PePeCvoM4x/MCakC8A//Yzojrvm7JHg48eyIhVe
	TpkCaA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbev6t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:39:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb71b1443so905467785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791985193; x=1792589993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKJXy1eO5vGiVrxvsBEG/GIMF2FHbHhV5DLbt20ey20=;
        b=TBN3TQz6AvLO/5zVm3opqI5l2Ru7CBNc79+vWRJ9KKBiPZjcFJRQuXgUytX4P2Umo3
         8o5zqf/nz/ZB+a9Q9mG+ssCQdCG2jvBfQ/fP197I22iFQ0nXwO20XB0fjEc25uVaOto+
         xf2Cr8IIXYJ3/cSr/JoRmR1vTQl1YJygeWsz+i6gHe4gJm9iZGiSDf6bq9LNHA8GCQqw
         G1v0BbpAAB/nz9uIIkR8PUF+6Hfhv4BMgUMw91NNeF59l/CBlyMGyiKqbRZHF6RlL8pY
         XoCcB8AU6cGHQup3UHCiPqIVho2nwLHnXUUZfzFYD5SQ/aUYi0m/dknBGHKCN71ap50c
         WCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985193; x=1792589993;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKJXy1eO5vGiVrxvsBEG/GIMF2FHbHhV5DLbt20ey20=;
        b=uGYHtXwRqkimghZQUZSJM1GE65b2DIArXN0PBu1vOFYlSCDztq78EIlDIP64nBNPTX
         +ya/6qs2IUewmELxwj8cvQO7HFygkM1PcQRRewzUiDgRK9LOtZTNskd3YODxTwcQgi8O
         ZraMDPXjpOYD4HaMHFwIu/zGDcQqg9eQf2WMofFcHDIKxIPZ/eY2+mtazMsnfQoAcGDV
         1OAImUwU7KAeHV7s7+eExyDuW+mXbtA0iGN3dk2hTniFnj/MwVEXJwqigU6pvJEitGg+
         PI8kK8AV8NF1nP7ibwkoi3AvKq9aGEa8dIIWY55jrmmWdL+iAJoCR5AWxIfSYqNMk4pc
         h1VA==
X-Forwarded-Encrypted: i=1; AKwUvBw8CHPo2EaG8agUjhDNCdSwpqgdp6JHyJZvxf1qH6d8NhurwLA2QIW3bpicldz2a1lOqihdo6gQdq835qE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKxQWzy14EzBOpIJnzXB2BYcrb4jFZOuFd3+exgvoWKBkeTwc1
	U3FBlw5XxLK3SxGIYmyRNrrPILaWq4B9VYhSNnGGzm2MUGPb+QfjW1QCdVT7AEBvo8MLE7w/mru
	8H8ld1kcYDP2twodutEtkYBTR93wiaJF2+9xXQ77kaghb/+2Zu7PotvjT4XSuSVgAcKA=
X-Gm-Gg: AYBFou3oYsOgaHczrbFozMJiiMP0GguFUAAW3m8Mk4pYfPrtR+yzjAtQqNaLRD0SRc5
	1XhC9XIXsnjBhTw/ggvQXZBlHArUJpecGneeJRf6gDCORNL24L4RBFgQTpkA4wqv9AttrKzypY2
	7cQDid6OKNRYWdaFV7hiingqBrFFHJvQS6MD2n+RUIXf9bpZ/gtrJ+599J8oqa0v0UY/hoZLfTF
	faFBx30mtrQSNdYaaT/p5ULSL8acLqiYwUv0wiTao1FRzGqYaTvlhhhO9tY7RPgEe4fakOB2vSV
	2sAHak1ho1hawa0Ci135USF1OitmuoXdiDYdilOt/DfJDn5V/50T9wC3Ml4cGeHzseLxuts2nKs
	Pnonhfd0RDaaMdPPRGI4V+u/BJfqH23z6Ju0TDwn67ub0wBdYa96C3FAtTEHk9/M7OV/LwsN3pK
	xIwgui75bZL1jp0h+yW3tNkyyD/ay0Yp1DQaQEeaIamxK7beXbG5BZZMJQKRMlkuhcf6g=
X-Received: by 2002:a05:620a:2a09:b0:93e:b685:ae70 with SMTP id af79cd13be357-93ebd228f11mr2646647085a.26.1791985192753;
        Wed, 14 Oct 2026 06:39:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:93e:b685:ae70 with SMTP id af79cd13be357-93ebd228f11mr2646638785a.26.1791985191965;
        Wed, 14 Oct 2026 06:39:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839a13sm1110061a12.9.2026.10.14.06.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:39:50 -0700 (PDT)
Message-ID: <26a3cd51-37ba-4b2d-8f56-cff4ad4de086@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:39:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] thermal: intel: int340x: Evaluate _TMP exclusively
To: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Rong Zhang <i@rong.moe>,
        Charis Stratakis <c.stratakis@proton.me>, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, acpica-devel@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261014132703.93355-1-aliamemis@disroot.org>
 <20261014133013.94097-3-aliamemis@disroot.org>
Content-Language: en-US, nl
In-Reply-To: <20261014133013.94097-3-aliamemis@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 90VaLGwo8cbEkuzLuDzhQCU66-n5esqD
X-Proofpoint-GUID: 90VaLGwo8cbEkuzLuDzhQCU66-n5esqD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfXyctVDiQ/IUEF
 jhKW0UhOhueVeTODtQvHl8qoohct91rSAXr9z/+cKRpJqNFXIqbHfwrekwjujIRtNWnnTy4UqaS
 dFtKqOn5hC/83vPTcOl1sQf2HfYuA5Y7lwcY5mkeH+K7Z6dhzsoQ1TgQFarQk79SyEPVdytSB3i
 cJVbxzja7p4+l9H5Mrq2G7b3ZojwumI2NVGwrwyrZHE29p1u6lMEw8Syyx1X7aIIzGnLQwPRtff
 eeuGl4IATHf50n0ywjGCgaKMGGRiYqoJl7vGzvw+YTWWO4wd2mlt6V0Euc1NQWuXMZGW5ktUG6O
 CVl7kbpkIDkvzx9puBhTPgq0bX8v0+WncvXtDWguiOS08kiO6FMRqtVuwxM86P96hqow99RdjZf
 KRXXpSSyg4ShaVUIMyNUXwmWr7yM9U4sGqgMcJregcZntFqLT86w2OirAOnqEHl22geUScfJFGb
 Owq7SfI90jAwn/nkVDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfXyz/cUwpc7lvX
 XhUh/ye/SX10a4nyk9CgosxIxPswT+gHUIWgOPYWlNcou19Q77t2EryA6Vc07NlB842QSXmjw3a
 k7ENSONQGwH2pWx8e/5Bq98SjQyVRE8=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf8629 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=yqPNUEQ4FSmsfWAeDTUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140054

Hi,

On 14-Oct-26 15:30, Ali Ahmet Memiş wrote:
> On ThinkPad P1 Gen2 and P53, INT3403 _TMP switches the EC page selector
> without taking the mutex the battery methods use, so it must not run
> interleaved with them.
> 
> Evaluate _TMP with acpi_evaluate_integer_exclusive().
> 
> Fixes: d33e89d12295 ("thermal: core: Suspend thermal zones later and resume them earlier")
> Reported-by: Charis Stratakis <c.stratakis@proton.me>
> Closes: https://lore.kernel.org/all/37N_jFulf7n-Z55NfKfE71C_wVPxYvZ0xD_iRUg2fXu7TypDiF5PStQ6siSfVBih6fThg5WoPes8U5ZQpfVm_teMFcUGXFxz2DdMbfSWuws=@proton.me/
> Cc: stable@vger.kernel.org
> Signed-off-by: Ali Ahmet Memiş <aliamemis@disroot.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  .../thermal/intel/int340x_thermal/int340x_thermal_zone.c   | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c b/drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c
> index 965700ee6962..de0a1fc7b817 100644
> --- a/drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c
> +++ b/drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c
> @@ -18,7 +18,12 @@ static int int340x_thermal_get_zone_temp(struct thermal_zone_device *zone,
>  	unsigned long long tmp;
>  	acpi_status status;
>  
> -	status = acpi_evaluate_integer(d->adev->handle, "_TMP", NULL, &tmp);
> +	/*
> +	 * On some ThinkPads _TMP switches the EC page selector without
> +	 * taking the mutex the battery methods use.
> +	 */
> +	status = acpi_evaluate_integer_exclusive(d->adev->handle, "_TMP", NULL,
> +						 &tmp);
>  	if (ACPI_FAILURE(status))
>  		return -EIO;
>  

