Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE648F026
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369844; cv=none; b=pP7kCS0D4zUl0BDPUkK9SsmXxQoltjg9Oj9ZyAf5kSwpwFyZTmf7+C2Sfj42WhqcdSE57HA5KwsrFLMY8C33k/UAKmh8sKsiUUuYO95qbjMdhiAXAY5pq6S+4HDi3iLc5VlXREIu1ZEh+kCoXVyEbvakc832SjXRJPqeE5pUBJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369844; c=relaxed/simple;
	bh=z30z8EFGdS9MpzWJ/1rGZvI4KgHGfl74E2sgwHNMULc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWHELQj/3AnPeoeBXYO8fU1bnSXlQ5Etwp3qiBXtSX/Q6x6uFtIgeHFKHCvCMqYd6pShO6/Jutukfx/zWtmiB3FnXVJUz1/TA0qvnFJOLyShzNNgPria9K+YfmI+OIpBfi+rS9tg2LbUI9gC2JlKVTh32z9Mfk+035gbeTfUASw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V51P7SbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDZbimwL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V51P7SbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDZbimwL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jWhw3298217
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 10:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IMClJZgZh+h/7kyhDwRKLGWenB/OxKGkOyF/L/dIWco=; b=V51P7SbJLvGvEKbw
	/LzCisXFhxbYm9Y+3SaAhn9KcGJxeCifWXAMpjuLwRDb6y/P5bPtP0H/AUjuqR+W
	sAh1OGdxFTBIPy9n/68Tiujzuj4QhAlew6GKLqpPcVFRe8p58hmEmQM1bYHnk3em
	Na/ZT6tTd0vYr8VlNj9D5oPLnIK26mMo4JdmfUiDopAbyzfrZL57+mNgXetdQVKx
	RzaWO2kQt9YJSEFZ03oYgxCbH3hTvp1HTqXipg2W8dGvJQWj+iu58cDsDBETgYMU
	x3UcoZ7QTAt6lA1xpITe2wzmrXZgfjtep7l2DoisJItY3hx/n7+cvbyJ6ndmRdvx
	s8jzLw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrpg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:43:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91064f6e75bso110468706d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791369812; x=1791974612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMClJZgZh+h/7kyhDwRKLGWenB/OxKGkOyF/L/dIWco=;
        b=GDZbimwLzrKbn0gTYW9Hy71epSsLmLhmXRApsSlRNTfn7M/Vsc3MHALom4TRzsFAqb
         9CRLHQH6amky/GM3h7qyrm6cjnuZ1wMOKeG6gl9wQAUXgKeKLi8aMNa8M6g8PL2yQMlG
         uYZfH5WzXK/dyKrD7biYAojy4keKqGnrLWLZ5DaRPKNjjLhsOA+qKH+7GNhbN03oO5ch
         ZPuiQT2/+e5IH079ikYIfptfwRMqp2NcSXWjWUdqC46yA191sPr4YgRS7U7wH0CgwB0O
         8szPjgtHHD1bXtnc4f5t3+dJqaEsprJU0P/WIQTXYe7I+kPPzKI2QY8deaZyHgmSvuaf
         cqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369812; x=1791974612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMClJZgZh+h/7kyhDwRKLGWenB/OxKGkOyF/L/dIWco=;
        b=sMn1U5eRfCk6HC4fnJYG6+fdBmXF3gbQR8iU3XgVldODJUU1MhptwT63i7gqTRVns9
         neP2KJj104BId9Fz4pVn1FxonQo/9K2EDAyEgUrbiHYUojH6ooP+FBu7GC4txkxy82Hc
         8M2Js8MprO6PW0IARL6bsGTR4SnOr70DbPRD9b1xEsGkYHoNMe086svnqsgrrF3q+TJa
         ZXc4J6fIxgt3amxNpa3ILdEFMIKDMJL4Ozr9eP5AxX+fYL+qRmjqB/2GXqZXOsvRGY+2
         t2c/IJM6hq0iXxaTLtJtiRqBfG2ZnPAwLA5nlDAqKDKr/Gv4m7lgCD33Txbq9nX80RI5
         qyaw==
X-Forwarded-Encrypted: i=1; AKwUvByL0DaHKLQTQAN1C43LRtNEf1dhIMzFcNHp/5LKPxKDSQSibvea6yUuHRtmIlEYXLEfp/A4QYu6/2cEJcY=@vger.kernel.org
X-Gm-Message-State: AFuF++lo0rvHXzi2sOTWvLuoXvelH4W2eFTNIHmU7kEg5/Kjre40hKDb
	zWq8cv2XVPV/fpjx77YHLCzTIIDb4ZFwJ56v5M7XcecYQzW1yC7oSgoDmJNs3+T1zRaHaykwEd3
	FmaWtRpVNAVJA243dE4OEent8uwKWDRuPNgCobOC/ihOzMrX8sEsNy14p2M8lETq4Ri4=
X-Gm-Gg: AYBFou2TK2xxqKTetAsqK4KdfsFOCLtTYbblqxZzxeLNNGriTW4GDqUnFZpnE92XWy9
	C13WuhZhdBdxkyBhL1y73axehkc/TXNXLslh5iT77dzD/KnXj++40ZLCBZc9kYVFBmMmszovVQZ
	A+1sIHuFIBchTQgJaopNdOBJe/AmDj7OXO0Gf9u7kBnxeqLiAp7NUd+jgipVazf8fVzIHRWR82w
	q2GQ7w8mqY7Zv2F7ZvlVxrS6bpKd9J637wlGvIIje/LQ39f7jzfjwEaNa2NCQkHMSHKCidXufu0
	UXvoKbNK1hGYBCXj0xXRhV/7Dqo+vDFLaJ8v4lWTFGNhuKUdlId1pdZjuv9c59Ir1KTO1mJmDkB
	BGvJIRdZQvba9Lw3O
X-Received: by 2002:a05:620a:1992:b0:93e:9807:9784 with SMTP id af79cd13be357-93e9b8201b3mr318313185a.69.1791369812648;
        Wed, 07 Oct 2026 03:43:32 -0700 (PDT)
X-Received: by 2002:a05:620a:1992:b0:93e:9807:9784 with SMTP id af79cd13be357-93e9b8201b3mr318309785a.69.1791369812011;
        Wed, 07 Oct 2026 03:43:32 -0700 (PDT)
Received: from [10.40.4.23] ([37.168.19.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4eac2csm72420585e9.0.2026.10.07.03.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:43:31 -0700 (PDT)
Message-ID: <99cd4231-b186-4db1-a9d7-45926720b16d@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:43:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 1/3] power: reset: pscrr: add kernel panic reason
 tracking
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Wim Van Sebroeck
 <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        =?UTF-8?Q?S=C3=B8ren_Andersen?=
 <san@skov.dk>,
        Guenter Roeck <groeck@chromium.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20260805-pscrr-reboot-reason-v4-0-54ef517084cc@oss.qualcomm.com>
 <20260805-pscrr-reboot-reason-v4-1-54ef517084cc@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260805-pscrr-reboot-reason-v4-1-54ef517084cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YYEzcuh0we0la3kCeIcgIuq-SZ1VENCN
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac62255 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=YKLnzF1Vlz+PFNxJOoRadg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NAPdFkqvqfqtUqX-_sMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX9QHoO+ZpN+HW
 fLIG3L7K9ArWeyoxdbBkphkjKZJqLNjxH510teWaxPUUpy6A+/op4NaMWCi84Lanmd1H4vsBmI5
 ACAG0koNSAg5FKd8b8IRyEkS3wWiiOE=
X-Proofpoint-ORIG-GUID: YYEzcuh0we0la3kCeIcgIuq-SZ1VENCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX0PHFI8RdEodW
 pBHkDrJEafoVP08s0SyYWiEiAN26DjDHD7iBGrsuADDVnHY3Ml5CrGZfZtgG7SMr/fHAXoLKUCD
 WjnIIZflBLEOYiEe+fF27E1wKli4L+Qk7ZVVRsnIiN10OzkkcpO7tvJ1ij8clZE7yAbrd7iQUFG
 WjOS7C6pCIh1ljW8ISZ3WOO1UoIQgvc2kKqCkqU69AqJD8ygbqCc8P8pcoDBVfsR1ndHdCfaMcy
 NY0EB5Oi7n9NKOOfVeNVPYfg0oJapFBYma3zhsPe4aptrU6Ax3BgecogkZiZBeDaGaaJ9qnjWec
 Q6cPJVhX1bSezUHiYJD/WiFf9trW48jZdSU0GEE3JksoczVUSvZTRsGtoRd6WlFUhUj/vi0q2v4
 WBBJysLiOgxViu+oMh2/TwojyrbM5O9lC49QdLTND3ZPW4EwVt4fuuX5i5a44A1k0+9jVd72SG+
 iLGw73rzJojP1jGDJkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070042

On 8/5/26 10:54, Faruque Ansari wrote:
> Kernel panic resets are not recorded in NVMEM, causing subsequent
> boots to report PSCR_UNKNOWN and making post-mortem analysis more
> difficult.
> 
> Register a panic notifier to preserve the shutdown reason across
> panic-triggered resets. Add PSCR_KERNEL_PANIC as a dedicated reset
> reason code and its corresponding reason string to identify kernel
> panic resets on subsequent boots.
> 
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> ---
Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
