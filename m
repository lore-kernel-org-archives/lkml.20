Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E67E306B3D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147041; cv=none; b=qpo/oN9Sr/mXe79XK0k+NAasvHJI/k+qfullEqL2yCby6+do1HtxNnerU2e5GtVJkkIQc50nvh8JJvsuJlyQzaJaW9vLyzHZFT8yWiLEaAx9mHJzZDokeYQDYo18ZKx6SR+j7Oj6HXfulM365kF+305SFdUTZkzDSVr8CNbYdJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147041; c=relaxed/simple;
	bh=KEiSXVbrAzINftR4uieON6VCuuatgzOfrQX1l84ki58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmSm2vlAk25ek9nCdSRqj/F5bZFb4uK0jSrnNfmkwmaWxAkF1Dwxgd7JhtIXzjApI5M97B/DkCNXXAfs38XmEzTv89bwXKrazGtngJuGI5iTvumSxDTQkENaHVdCFJYODES36NNY7nGq683da0hdyi5L/YBFr+KiqzEIq2g/JFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gp0mT4x7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=izHZ2tBz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gp0mT4x7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izHZ2tBz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA4VF942709
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPugK6C8PREO+LCGRT/RgUl4vQNiRidS/fdrWPEpGlE=; b=Gp0mT4x7Dt62QP/T
	JGUduJeKzyZxTEoUHFFHYjoQEZG34jEyz1+ADoFyqGxfd6YwSj6FaLSuMH3pUAAK
	ImbaOyyOsqYlV33wagpeulGEAc9PevotOiszCLR8u+glkpzMERt4yS8xEGPWWyK0
	dMHLUo3Dw/+xN6FxDGn6/+IRj1oMYnApPcCA3aOu5FbS9wIGiCkYxBRGptnAmbt7
	ktRNUEcv2GGV+qi8yG+LRAWN4y9mQAyUePC/ApC2gOfjncmY4YVsE8ekvOPoNxEW
	Q2QMlBG+alqYkylQFtoPMdD8/50P7aUIqFZt3/mZvK1e1/upvo99tcioHf+CJZjU
	VrSlPg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur03s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:37:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179fb39cb4so15543966d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792147038; x=1792751838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPugK6C8PREO+LCGRT/RgUl4vQNiRidS/fdrWPEpGlE=;
        b=izHZ2tBzsBdoahkbPhdBqyEFftDxdQGubq/ECcbPlclBXP2PARan4UQ1sqMgNleUOl
         qr6gQLBSk3ekNhM7fLmewm3WhYd1f5/zAJWxcxhayuumI7vL1gLSQQa4NoZgi8DTUjOX
         miZJoAbj/OBqdc8e6TRuSk0MvYTtDmSOr5eiIaAG4wM7rp0Ym7RrSd5g05ne2fQdFOrO
         ubPDgpbJVgh9+azY1kFoVkb4MFAJS619qWXrSIrif4UtrTIKxm1nI3ZTBvIddGv0UCfJ
         y1/rw3XaZ3Csennl0QS1d5txlHCXfJzPI7XRj2a2juq8sxKkPZa67hTBF6L6f1vNaZVq
         nKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147038; x=1792751838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPugK6C8PREO+LCGRT/RgUl4vQNiRidS/fdrWPEpGlE=;
        b=uX6geYnphu8S34RxUyDHzarbPrwsnMNc3lpDPEmAWWXdVEhJ7gs1AKG0Z11A+L8WMS
         Gy1m1a8TWTgSZfM0j0exUwyAxyk3+6+KyzRqnGjU0HpPG7/mYfO/KkSABp8SRZzS0Gje
         KIH+Lj8GXMBCHS18qRBc1UNrBO6HW1qMfKgkO6mPCGSesD1340D498FtIpSnJudRf5pp
         2VccudeMRLLTUGLGZ3U4IeI6g+3nqE5GjCB3S2mD+HHekpWvlM1UDCHW50sFy6HVAbqJ
         pXd1FDoWThH2XM+1k5FVfuKKwaThHmr0yW4J43mx82PLpPdRUdO+SmcNWtNEllbFxHZs
         LzLw==
X-Forwarded-Encrypted: i=1; AKwUvBzvp4n+adhjkdE5W3CbsjRCs2UWpocMQOUVxhC2QrK4VKsQNLVCmbXX2fmCuJVuYkAI25g7F+XwJxWmmTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzCW9ZJVd4ynPgnijG/D3vYJToDC8PFGlbhsH4ks6ZwjLA5B03
	B/+yUHzPGvvvXG7GaphbmLW7nd9mEmK9YLfBYJpxHzKrkiRYNWXVmUPDZ+NLrBmhdfvPJtR36er
	JQtn3NazA8ncF/vm0QnkJi76N5VmzWNiTCgxEAVd0UCLke7nIWNrJORTcC96b5E2M1zc=
X-Gm-Gg: AYBFou3j9LjTsU0PPi57XI1OF5TF8QizcjvshuSvzNWe1VmznO4qGJ/i3Z13WbfsCjK
	tR8hYa95KgunPR+ETuwZfBaP2ySM1wCn6V+TLhnje50Iq/xxBXGf6qouzAkh5qwbZiq1rovzeMK
	EbtJBJoTGq7wCKo7O4EioUboA3/M6JAFSSiSXSMA0mSHnZZTChIMPYyy2bw9Ctj1cevw6R4IsfP
	5utABlr7LapnswnmlT4UQQNV7gDe2WMJftooUWpTimheDyHH234MoVABFgQZpkT4Kmx9TUDeh50
	q2cpumyY5S6RHkWIWkgkNqLqT9tj/71yIHtmpu2NsaGjjrLl5aOSHnHnmao6J1L5XwrAvdPu3Wv
	mKfKcA1zI350qWTkc7udezw==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr4295814985a.5.1792147038133;
        Fri, 16 Oct 2026 03:37:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr4295809885a.5.1792147037535;
        Fri, 16 Oct 2026 03:37:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf335sm60300666b.29.2026.10.16.03.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:37:16 -0700 (PDT)
Message-ID: <15a6f557-12a7-4dc6-8faa-fe96f9ed5d0a@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:37:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: scm: clear download mode and SDI before a
 restart
To: Royyan Zahir <royzah@gmail.com>, linux-arm-msm@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, aesteve@redhat.com,
        linux-kernel@vger.kernel.org
References: <20260921073231.3254159-1-royzah@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921073231.3254159-1-royzah@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX8I92dVf+Mw2T
 /NDKOn1x3+5Gzldit7o5J4ZXxPxgMZTAjmU85Kv8eqZ39uSyFQ1D+0FFNZrGm8a6xMy/ChYmfuL
 cKvTsea6bGPkAoeCLbPTdsNZO0EDOUkp+BRJEBYwoI/KL3mCYnhu75EQZs+9pJNs6MJCf+QcyXk
 w137wbVP4Gw6Bfp50B0cHotSHngH2VGUJkZQuXKCPYVRFo1fl9IQ37NHyfAPdvYGqEd4nSqI07v
 fSdsrB+PGHufHGLficpCnH/Qs7eDC2TCLaeLB/CP54vh8+YRY8uouFKyOHqggkGLGsdnF5lE7cM
 O9pHXWGzzrfNdNPJwAdTo2ireo6A0wgMFQOWj7KBu0DUbrfDai+dYS86nqxS5WdkVkGOB+8E84v
 tVN1zJnt7BMSXrzbJSKBzOC+FJTkbfQa7EX/00vwSjsexCWnqTp2mUS5J7176NMxIVT2Z/7gmW7
 B0dyT/oEFtpC2NALiQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MiBTYWx0ZWRfX4mM+H+r0Xmht
 2kbrmxhA8m/IW4qP7EmFFu1xXkuWkO3T5aHUSlk4l3xLw+T/2/AvNanZpQBkK1zIgXnKbpoG9Om
 /O9WN6tTcC2T2uCdQXQadIsoW2Aso/w=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad1fe5f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=LWmFl1y4wXh1j7GygewA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Dq-Gg6xeDZBd10S0CIeSzKcBUHVUAwi2
X-Proofpoint-GUID: Dq-Gg6xeDZBd10S0CIeSzKcBUHVUAwi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160042

On 9/21/26 9:32 AM, Royyan Zahir wrote:
> With qcom_scm.download_mode=1 an IQ-9075 never completes a warm reboot.
> XBL stops in download mode and only a cold power cycle recovers the board:
> 
>   B -    857233 - TCSR reg value 0x10
>   B -    865071 - RamDump -  Image Load, Start
>   B -    884317 - boot_dload_entry
>   B -   6774477 - USB DUMP failed, because USB cable disconnect
> 
> 0x10 is FIELD_PREP(QCOM_DLOAD_MASK, QCOM_DLOAD_FULLDUMP), so the cookie
> written at probe is still set when XBL reads it, even though systemd
> stopped every unit in order and nothing panicked.
> 
> Two latches have to come down and neither reliably does.
> qcom_scm_shutdown() clears the cookie from .shutdown, which
> device_shutdown() calls after the SCM device's own dependencies may
> already be torn down, so the write can fail with nothing left to report
> it to.

Ouch. Indeed there's no devlink or similar between the SCM producer
and its consumers. It just so happened not to surface any issues for
N years..

> SDI is disabled only from probe, and only when download_mode was> zero at that moment, so a board booted with download mode on keeps
> watchdog debug armed for the life of the boot. Writing "off" to the
> module parameter later clears the cookie but never reaches SDI, which is
> why that runtime workaround does not restore warm reboot.

+Mukesh are dump_mode and SDI supposed to be disabled together (i.e.
do we need if (off) { disable_sdi() } in the .store path), or are they
orthogonal?

Konrad
