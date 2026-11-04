Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806426;
	b=OhR34gU0OBq5JJ6lnlFukpIVc0eQ/SB86wSwSlWYN6OESyKEEEnqcD33GUJUSbHKXFh2
	 AzuO8SBS/t+UYSvL9pXPW2jo1x7LPx3E5LpMwuSo+N/E4qz28M0IXoHyf/zn6lBpjHDNc
	 F0i1YxZMnX/l2mMMnx012FwYnzHLotjl5P13eNrIW0+M++eNlXc8XhyviXYpCHxtbB98k
	 n4agvQrZ/TtgUXx/vXlJMwFKvmQLUsTqkHFzDYkJHvRasDj6XncloD8q072FQafdoiMaw
	 WlMHKht4D/Qu8KQM5KJoPCWviEyC8+9hlH7fys49fKgth+kyVkD5Mw0bZFCZRtmD97w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Oc+EV5R5qicUTnDYhrGYR2No2F9ftwOjqvoIR/sc2KI=;
	b=faVUV8LJvDpBWSkp2f0A8jTLLgD7dsdsoxNOsWd9SjyHxi4yseGuU3TIS2ZBW/pkRzH/
	 beneoPkwz7yeD0a9672ZmnuuShlJyrjOm6/Q5v4NJ8Jak6YxW1AzhuxUkey9VKTGv0k6G
	 ECVCbys4U11qt4SkX2kMWOyZ26vEI1PRiQMKfIpPFNQYLykwYUmdTS0uPJaUg4Mm8I5Cv
	 DaEk1g2B/QoZ9sZ0NzQ/r+vg+uHlYNqUvvgJZKaqfYyHRWwtneAf+zdSb7u/lZBqH5y5z
	 eHaZhWx+4Cm8TW+z5XR/cQ9L6+Sx30rXXf5If0UKpJGRMAX9v7rAt+7ARVVaLweqofA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5lDlPE1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AdNqXRki;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67429606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67429606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5lDlPE1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AdNqXRki
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba1G9739317
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 15:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oc+EV5R5qicUTnDYhrGYR2No2F9ftwOjqvoIR/sc2KI=; b=n5lDlPE1Uf7O6RF6
	4aa5Gvgir9U27o1EbZODmoUwDgwjOWiv5/ppwo6knHP4Vb9nxIjcgla/YcjcmzgN
	dDZRaKgUUUioKyYZhYZpvPrFve1FhHOhXv8XUV9GW78Y/fZ9x5+ArmWJ1Bw9ljT0
	mN7vyXaR2qJwjTrXUK0zXvq7d6UFeT6DM3vH6ZIHD4k2ArykiVWhcRd0ZJIflV+X
	jX/SkjczYp89DQ7rwA2/YAMK99u0ltVdXBRSDTDAusYMP4nxtRy9UpaCnQlLZ9B0
	nhuvFMGu1/gVjUT2ek2uOejjr3mo65yrl0G8O5I24084agccrSdLaxIDPuyRe2ql
	G2aduA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163hnev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:33:44 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4a68926c8c4so851984fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806424; x=1794411224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oc+EV5R5qicUTnDYhrGYR2No2F9ftwOjqvoIR/sc2KI=;
        b=AdNqXRkiMfDwId68bO+bfVDeeCQG1h3ebhnQzScYGZ7xelaC2/RLLSt0T5K2wTua0v
         eXhnOJPJyQJ3faAkV0sx75gGppi4zq1ylpfrXYoVyUMSCfTptyjD71jC37Ai7uxcryC8
         UXboldzNzuZCtx7oNyk1Ch/zVN1TjLRxS018wfscC7Wz9ripAxqulhBUkSj6XTbKqQ9u
         kiiSA2+YpXPfs9u0MlCdjKsSWvMVDcvWLoBaSgL4AeT9GtlcYgl2vtK7DjcVVKgtEyy8
         XPUi9TrBLY6r+NdcPV+mU6tWN3+lrbdTLOEdDeq5xVoWn5fzcbmo6y6wQgdoTi+hrjf1
         rFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806424; x=1794411224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc+EV5R5qicUTnDYhrGYR2No2F9ftwOjqvoIR/sc2KI=;
        b=ro/sQxKcyd4lSRSg06kD/ahcRowqcPBeIca2ylO8KMjQEGtp1SaNIgzaUVPm8aL53g
         stTzXTgKDcztPd3vs9sUXbXpyeMlH0gQ0sCx9Gg8qvmgW+3LmPzd5dPd1Sgm6b2DhL8b
         91ShJVlE1/DrlzbizGF5rGoWuRIi1KEpD4EzGV6MsFrBnDDu973sqeqEedRHSwxY/bfe
         x9LnDhY8yp9O6No/6mInwrh590XP4kBomr4v5gCmK0bGs6LsN/Jiue6erWS0+CEPRvvk
         bPa7y6zX2X/BQDRvtuxfVPtd7+SkKSdduBs+4IZfSFaniBcjwnOmu7ipGtqLZtHxwxeW
         8icA==
X-Forwarded-Encrypted: i=1; AKwUvByWVcq9/gLEdXLHlL2gYerxaQ/PIwTGuG0QsBISAAQOP4TmVGmxtofdO1Fubh0tEWz0npw9hk91W7yxVDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NM+dlPjKlpxXZt4g7Hx8fwv7HgtfOemxknWV3iqxl5ihXeZsY
	AYMGrkhiUbrRdijaI9QyH0oR8ZLgHRN5pY4mXjXBHNkKv+K3a5leS8TmkWwBBg2DlFR9/dYZg8/
	naSfKk9jdjP5OgS3nu6LBsXDQLLMY7bf3J244Mw5f7/vQfGVoQbPovKDVCZO+9hdIx14=
X-Gm-Gg: AYBFou2cJxUGEygyCxCoJmkOQrfg5nvWqG8VHyMvJV94CD/Ggvx9P27tG9k7uifz8Qu
	g/SkaQr7BwpxpR8Lao9dZHmsv0S9DNxnJrJX9XTZVcdR3LkXh23LnkTAfN3h0hnuWyoYOH0lfpk
	s56a6SHv8AWkQU36VH02Qw4vVa9ahrSwqfPs34jsFMYqHCd48lKliIAr3nhAfjM9lw36uO4NKjW
	PSTKInt5hC/929dYg0NErizJJ3lqHGa/JcvsmoCfNSdzBTPV3sMx276nQgF67LFrExIBuEfSAuV
	h+jERoGCynK5hiLNnrUGhs7YVObwzOOl5wAJDi0Mk+XWIA53xUmgUWcq5Ux+bKowWDJdYqFiO/u
	VUqYmAYQrVvpmGvZWGYO/Ajfo2r0RICfTP5DJhdXk7YryJhv12SGqUCYZTatWuQrusqE=
X-Received: by 2002:a05:6808:1996:b0:4f5:c4b9:dc14 with SMTP id 5614622812f47-5640dcb744cmr12375090b6e.13.1793806423757;
        Wed, 04 Nov 2026 07:33:43 -0800 (PST)
X-Received: by 2002:a05:6808:1996:b0:4f5:c4b9:dc14 with SMTP id 5614622812f47-5640dcb744cmr12375050b6e.13.1793806423309;
        Wed, 04 Nov 2026 07:33:43 -0800 (PST)
Received: from [172.20.4.37] ([192.210.17.203])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm1961627b6e.11.2026.11.04.07.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:33:42 -0800 (PST)
Message-ID: <98d01186-7d87-459e-8c18-db201baef34a@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 16:33:40 +0100
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
Subject: Re: [PATCH 0/2] thermal/drivers/qcom/tsens: Drop __init from the
 ->init callbacks
To: Christian Schmidbauer <opensource@grische.xyz>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261104145740.2623473-1-opensource@grische.xyz>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261104145740.2623473-1-opensource@grische.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qVSpMFlHO6Zv2O7nuU9EZ3t9gzB0DRYa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MSBTYWx0ZWRfXxg3sWSeH7kc1
 veh1W9rsdUq+htjZhoJ3QzVMVQbhEAxgtEr6OMjayMpLFZOJVzpALPhQQS7jdyi7CZQzLxDWuff
 Ijda5dOY6u26jx+d3wF2YylR9R28WOs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MSBTYWx0ZWRfX3uOnZtc9h9aZ
 +QCjiEPzftgjxSjrhD1do4kXfcwSfj6xW3vSsYwWfbGK8s9Agme03V7UZs8uCs8XBApxFmEP2Q9
 G/+Oczr40MWsbAks2olbHzBz7KoD4bO4rceT3AnXSZaknzb/0RrN/rsl7eUPsz/IGVG480nhcBN
 PhlMHQ9+WbX1WMgjy8mJpGlTwfJjtqhbKe2bsujP5UqZyz1i1jmb9xC31pvmDIvNlrbl9nVvYCh
 D7aNrmQavnVUb+vSy7cXKfPWl5QGbV4TZHFehB9+o4Qy3y6tOg501sNz8kQuMc9NIfCdWRofWP8
 ApjGANe3aY7XaxgPOVs+4XRXmOY1RFIQ8X+BnWlwJ/YtBTF0kO7zman8DLKJdcAlWCH0k6DbRR/
 ohYjDmTpE4C/kYrZWY5Tm0f7xQz3lg5V3n+ffpuES4Xiau9uByjcd1V1mjfDU+TFD/zGF+Vgkde
 jLSUVgGLbk4Nw3Czy9g==
X-Proofpoint-GUID: qVSpMFlHO6Zv2O7nuU9EZ3t9gzB0DRYa
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb5058 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=3CSVYe8HblTQFsWiJzwA3g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7I9-Nl3zapt3FfmOfCcA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040061


Hi Christian,

I don't see the patches along with the cover letter


On 11/4/26 15:57, Christian Schmidbauer wrote:
> Every function that tsens_probe() calls through priv->ops->init() is
> marked __init, so a probe after free_initmem() jumps into freed memory.
> On IPQ8064 with CONFIG_IPQ_LCC_806X disabled, fw_devlink defers the
> probe of gcc and its tsens child until the deferred probe timeout,
> which expires after init memory is freed.  On an Aruba AP-325 the probe
> then crashes in init_common().  With CONFIG_QCOM_TSENS=m the driver has
> the same problem once the module's init function has returned.
> 
> Patch 1 drops __init from init_common() in a one-line change that
> applies to every stable tree.  Patch 2 drops it from the eight per-SoC
> callbacks.
> 
> Patch 1 was tested on an Aruba AP-325 on a v7.2-rc7 based tree.
> 
> Not tested:
> - Patch 2 on hardware.  None of msm8226, msm8909, msm8939, msm8952,
>    msm8956, mdm9607, ipq5018, ipq5332 or ipq5424 was available, so patch
>    2 is only compile-tested.
> - CONFIG_QCOM_TSENS=m on hardware.
> 
> Christian Schmidbauer (2):
>    thermal/drivers/qcom/tsens: Drop __init from init_common()
>    thermal/drivers/qcom/tsens: Drop __init from the per-SoC ->init
>      callbacks
> 
>   drivers/thermal/qcom/tsens-v0_1.c | 9 +++++----
>   drivers/thermal/qcom/tsens-v1.c   | 7 ++++---
>   drivers/thermal/qcom/tsens-v2.c   | 2 +-
>   drivers/thermal/qcom/tsens.c      | 2 +-
>   4 files changed, 11 insertions(+), 9 deletions(-)
> 
> 
> base-commit: 2dc1f296b5754dd2441fc8b6613a362a47f6b98f

