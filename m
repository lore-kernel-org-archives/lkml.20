Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6941846AA8D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248099; cv=none; b=gL0j9jUF6BsFwFBCamT94eIdpHZvL3hUcb7mDRsbp0dr721omAiBT9rPCmxmE9He78s92dXS/2Ccz8NTDao2fM9oUbBCsjFfLRgNKsgBk0Y1ND5DcUYZJD1Ppvxd5B04qNXAuPrbAhSTgrQnuMPLwxldmKtoeGwNVXJcK28YKXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248099; c=relaxed/simple;
	bh=MFEYPaTZXGidEsGjbCjg0usm3Cutb8p7bOkDBGDOfkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYkqZPHGUiWoqbr7MjQ2EHKh5j3AYOQmT8iWCE/ZMWMcy8i84dfLj8hEHmPz0OWX3jKMg6qDj8on/OE3LBu1EdKAVYYlw3HgCW7TUTLIozSMtxgZNPVamECk8qwRDo+MnncTjs03O70ymJLILnn1CIDG+nil/lLHMy2xCHDS5CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMw/nX9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtNr/Yiv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMw/nX9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtNr/Yiv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Ovk1282792
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 07:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGlFBkKXrHiR0rsOfALM3d2LLsNECGveEfEeOj5vR2Q=; b=aMw/nX9BJ+vV+icv
	dhQa63ToSLO3yECZlNZ1fGj9czLy7r1tK9aq5+OfXLw845Y7xhlRiONklvIcNtbb
	sNo10YHZ9XBJE6rtjZRATEmIQxdgG8uwZSIG9HG/psp7xnmGI+DtzQgrIeouh+/9
	chIKu5PmaVenFbnizFKDguWIshNSJLlhWJG4J8xPcL2LVNi4UCrbSiv1/l6fMJdH
	cOMHzJ95am8hUxuwGKgDSGPqX546TWUYzuX/I+ipwcbeFf+CSiPlmBj9MR6iKglv
	KKAr11oi/dOdFLr79vjGhTHbH3iS6NCfARrW1g1W7t63YhEKDZtJceuBBkgYdI7+
	bUeGzw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx984y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:34:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e96bdbbdaso5748656d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248094; x=1788852894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rGlFBkKXrHiR0rsOfALM3d2LLsNECGveEfEeOj5vR2Q=;
        b=HtNr/YivhpvQcDmvQsmprzi6HN8Rn+iPCudDDOBHLJJsxu3kBlJH2FQV3WgQ3g5uKx
         N0OSR9Xz5ehQ5boPsDCI5oXXmZhPhpJnzBGjFdCGoWrlWfwuPaZkBJreT8/X25UOEx6z
         NlRksNJf2rTy5CH2fF47fUjXLJ0jqTr+J+p6gi2XP9bUCGZoJBIRCUu6TYdTDvRJvKpp
         zgP37GoaAAt+xo8/uXcUC9jvRqmMzhk+OAuP8yAZAaN208YVRPryqIs5TNGTHKMsFqO+
         ee2hpSHsF4K8ZqXr4bkO1R+QOO0xmBKcf/yGEgwHXCynhL+p3fTzFb8nI0/nB8qJeOzx
         Aviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248094; x=1788852894;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGlFBkKXrHiR0rsOfALM3d2LLsNECGveEfEeOj5vR2Q=;
        b=HyRk7MIrpm2rw+9VkzTt7q/vvrKYhTozIID+YlqMGE263wa0yLrIfRo0JSQq8ZcRD7
         vfMjBJ9hL+L75m68I0acVvbGKjkThIW/UThoZ5rb67Lp9GPqfHtK+u3iWOYEWcAKzb/E
         BkddIyjlGP+hlDDVnfeEQw/MfOCFK5aT/WnjCFIcl+WVdhyqjy1v3XNN22mXoWHhV11d
         DZd43leCx73D9AoqeiV0W0dpgP3LzY4spYi3daXVzTu9J1EKtLKW6ciiuAqwrH0293wu
         so1Z8Y2ZGmtCR+LL5nOMdnJZnCGpWfqDIAd+KrEXv5qsi1JoKMM+l4AxCB6MOaCLPcWG
         lnSg==
X-Forwarded-Encrypted: i=1; AKwUvByEVjYCPmyPKAjPKIM11yZy6yPeu+ocKo835Yaj5+ytquN2LDLyTkXsY+JEfLMFxBPAJ8XmdWvLRnF/bi8=@vger.kernel.org
X-Gm-Message-State: AFuF++kBFabfAqdTykxEPiyAf60pEaLc93gAKGQ55g0IkAEDc9fB2er/
	kGZLI4YaxrAG34x5cxs1PRrQ85S7au/bP3MkaHGvLnSR/y7FcxAk36weG+GLbq8IF++A/DP69NE
	zjNaJgCqGmURg1NGaEvvbS4VdMGvTT6I+43jkKhpr0WR+4cpY+KF00J0MgfzrY9AApE4=
X-Gm-Gg: AYBFou3lH7xUXzNTj/Y4fUfdVZhX2nbc2IMWGv+Vdww4KsFW9wN4FhdLM0hKZtF9WwW
	W31wFsXJDY7EowjJgdhdJaoSUk9KkpLAyo3t4DKnNBdo79VhX+zU5PlkQaT1FvQGHgKh9cWspDk
	c3UGno2CvpcQD0rBXukVddWokDcGV+4XKR5B5IOV+lyGQKRE4h7gwzfmG2IBrGqKb8/fhjpecYX
	XR526k8RurP4TR9m9XI4Ko7eJ0u/wvC3OdCgjeCid2D26WX0rI1vP9KUmc+qjcxWVwlFEV7HvRt
	RzAVAUEwc7gKz88oyq+CISToDVX1Eg/7zQC8coxnZ60j92IvfZ0r6zniwhurHpTsOTmZuO97S62
	OENg+i4A22hC4qDgNBVc4sS1z08GJZWZot4lgXZDP7AQaBtWoo4sXb3FSMdmxpOiR
X-Received: by 2002:a05:6214:450b:b0:90e:921a:f62e with SMTP id 6a1803df08f44-90e921af821mr111500896d6.15.1788248094429;
        Tue, 01 Sep 2026 00:34:54 -0700 (PDT)
X-Received: by 2002:a05:6214:450b:b0:90e:921a:f62e with SMTP id 6a1803df08f44-90e921af821mr111500396d6.15.1788248094028;
        Tue, 01 Sep 2026 00:34:54 -0700 (PDT)
Received: from [10.111.163.121] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce44f5695sm102949146d6.26.2026.09.01.00.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:34:53 -0700 (PDT)
Message-ID: <324ee2ef-f95d-4a78-945d-12d6b2f191be@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:34:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 0/4] media: i2c: Add OmniVision OG0VA1B camera
 sensor driver
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W_fWmw4lvCXQxOq9PPgsoDFUo8rzsMPL
X-Proofpoint-ORIG-GUID: W_fWmw4lvCXQxOq9PPgsoDFUo8rzsMPL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX5sFyUQNFZn/W
 4csY8YDAk/vMutyJSv/e7GqFxFPsg5xQGPAnxc5yhDhvjskUj85sUssvtkqxOtXrf1TmfW74xDN
 ez5z20A9zS1hNeIH8+sgN+qddYHol/o=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96801f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fdB5lo3k29YZU0rLWzsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX4/DdR0fBP+ZD
 ltCal2j7/Ylu2w1NKv7i/Sg3wpgG5QJRNfgUCRbC4MK92Dh65SctGZBQDpjJn2O5pfWaPb+E2m4
 tm9xBJUdU8ZAMpREcKk70SJ93YChZb6iRxpAC8EJXxKtoq+oJ4tXvaxItWGIXQaRFzTvu2RTzj6
 crX/2ZNtx025rKeNdVs9Eb7Nt97aoutZ/Nr9KHck4lvvHUhBz9j2zQzQgWoAUh3A3y5tp9DgX6E
 Z51MuMVU8A0g8pRmpEjE/tu1BOKLxy0RW0EmVIng5p48Ybxgk14/Dz8a4hitZTKJ4fzDFQbA28A
 OCyJP0w2RrpkaBYpmQB8tzVxiisyPVL8RucbyYaolY8yhij+3odN4SllZJUypzE+1k0qVuExvTw
 HWJWfpyl735wdNZ97giy6CRJvVniBc1QBZr3qdQ5wyTqDkMmDs9OFTEkUGqIxGzf8ADvpQrnDGd
 FUchGsnCvaCxe/UYftg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066



On 9/1/2026 3:31 PM, Wenmeng Liu wrote:
> Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
> 1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
> frames at up to 640x480 resolution over a single-lane MIPI CSI-2
> interface and is controlled via an I2C-compatible SCCB bus.
> 
> This driver has been verified(include tpg) on the Purwa EVK.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
> Changes in v5:
> - Use div_u64() for pixel rate calculation to avoid 64-bit division
> helpers on 32-bit architectures. -- sashiko-bot, kernel test robot
> - Link to v4: https://lore.kernel.org/r/20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com
> 
> Changes in v4:
> - Rename the OG0VA1B and OG0VE1B test pattern menu entries to make them
> more accurate. -- Vladimir
> - Link to v3: https://lore.kernel.org/r/20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com
> 
> Changes in v3:
> - Generalise the binding title and description for both sensors. -- Vladimir
> - Keep the cached pre_isp read so the OG0VE1B test pattern still works,
> select it via a per-sensor callback. -- Bryan, Vladimir
> - Rename the "sensor" field to "data", drop bpp (derive from code) and
> add og0ve1b_pixel_rate(). -- Vladimir
> - Sort defines, rename the shared CHIP_ID reg to OG0V_ and order
> og0va1b_data first. -- Vladimir
> - Expose all four OG0VA1B test patterns instead of one.
> - Link to v2: https://lore.kernel.org/r/20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com
> 
> Changes in v2:
> - Integrate OG0VA1B into the existing og0ve1b driver and binding
> instead. -- Vladimir
> - Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com
> 
> ---
> Wenmeng Liu (4):
>        dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
>        media: i2c: og0ve1b: Use monochrome-appropriate test pattern name
>        media: i2c: og0ve1b: Introduce per-sensor data structure
>        media: i2c: og0ve1b: Add support for OmniVision OG0VA1B
> 
>   .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
>   drivers/media/i2c/og0ve1b.c                        | 378 ++++++++++++++++++---
>   2 files changed, 346 insertions(+), 47 deletions(-)
> ---
> base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
> change-id: 20260618-og0va1b-55bbf3cabb0e
> 
> Best regards,

Patch 2 is missing Vladimir's Reviewed-by tag. I'll update it in v6 for 
tag collection.
