Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F246371CE9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183470; cv=none; b=FmYLZqyjQhIj4eQf9gIAdYPIy0ABXGM0d5Y8pPzAyOUTTUxCyaNBpurZkum8LngSys5Tv5ZQZ8dwxBj/Hxyz1Xdjdx1pZoheDOZt1uHznCUl0AyIZ86OH3wVF5PlLBIuKd0mJ0DpzTXXqyt21+c3S11nkDocm3abDm+JNYdJzTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183470; c=relaxed/simple;
	bh=qbIdZAKoZiKIXm+V7iO8Tpd5L7KU17AoLK6Q9ugcdhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAH36bq52rSUYstu9hlTWz5CPxuKM5UIg1RbCrBbzlw25gPQMAzQNlAnC+2h9RpuzP1wn8tfoLc83X08oIqj5soD+I3blqVy13YFhxKcURs7C1us3X1BUd6XtO2HQbDjaFlwqFLSc22Ya5CzVG9OPfttrhA56nqAPAfW26Tbvww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xptj5nE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNUmygm2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xptj5nE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNUmygm2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510Row1411618
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 06:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QESzrKoeisIYlJc8o6G7lAXpcW3BZJjUzWVIuPcsLo=; b=Xptj5nE19lKE7Uao
	lpJEc7rsV6Jk09upWLVCUdx0yv8u4fiGfUlNc1RBT/kux9OLGyOGUgZHbjM6uyPx
	4aOh/z6KTSvtSgAT0i8eIX26vHmz5/LsEtmdBiiW5I66cA6yJ6nFqQzNOxqCSFZT
	u0v8c0kQhaf0dVyPBDbptu9f9yuB/oF+gyx7PZkz0jRUpbh2d6Bj/cO4p0dvC9+P
	62xOIag0K1WKnwvWuZaI4tv3+7Ehj6YijOdFOlwmOokgxXvxwczHEhHv8YFq/p8q
	XYM0UbSfdV03qYyoo/SEPAF/etehdX9z7dUBAi8qpNmfG3QmqSofRsHg2j+p+bpt
	UuQ3VA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sr6ctce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:57:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a47a81e70bso1458329a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183468; x=1791788268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+QESzrKoeisIYlJc8o6G7lAXpcW3BZJjUzWVIuPcsLo=;
        b=KNUmygm2VpZjuSHQidkeIE8QpEiG1jfMtlRwz2ICuipaIwxd+97Dmfuy+J1SL7moUa
         SYj6/uYiobWaXXU6FdTD0tMDi6Lh7WlNYI50HcEz1sEjsDiMIGNTZEqNhvQv2q3AISpM
         4e2zZuOazNVe5IIIVwQd6xE1Gs7O15SNF4l4OqaQyggp/YHxSgjUg7HV/i6wRqvgH/79
         ujkyeX2zrm/aSKi0SSy9eb5R4VBXyU2zPHct4LDHYoU9RBDc9KpuaTvOckmJGV3EABnO
         pja4H8J/qBrmGYZSEfyVhY5drr921rdLHHq0ZuCneyRoa2ZlgastNrtoESZVLM6Z2FhN
         Z9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183468; x=1791788268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QESzrKoeisIYlJc8o6G7lAXpcW3BZJjUzWVIuPcsLo=;
        b=0hZRqF9uKBbCAF8ac5HPVh9xM1a62lSuTn/h3EvmZOVSBVHJf6sfSOWwsRG8ckmg3g
         sa9XA3gIzT4Sy9Tg7MGf0o1c0Djd9odRpk0VqQVHgHHM3QteL32lzutPrbuM57iGPmvP
         R5HQAWazuB/RjScL/UQ87HO4yPUr+gKxIjdcbWFgMd+Tu1y3uGvAnEtPl/n1SChGrbAH
         YwWWtomGAco7Umxm2olCOAx++vlh3QMIL0c106cXXTpURRO/67EPhmqESJ/xAunvuQa+
         uxnPqm4pK97U98+lfAYqQ7bXbdOl0MBVbsp4NWO3kdenBnQq+CRMFQLpVubUK7sZH8Uz
         aW+A==
X-Forwarded-Encrypted: i=1; AKwUvBxYz4t9U7egnlivrUmWEglMg6DX48IHmZccNX5kkH3S4Bo2fDyEAqcQ0D1UAyGgCAKvvASdiqsNFD+sSG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAyZXgQVUBE0ZwX45zkVLx3GdoLci736L2y/gD5n6EISDJAATU
	tys6Eu9QQEQlnWAwwd67PT9DuDoys/0Mh/Lkxjd2XJlUY/X1jp0Zg1ICBnjhmbzX4LYp0jPLG8a
	DwgwEaEkQ2e9CTm8Iy1QnJVtdMdEGHArELHVOV6nLhGp3tZf2QeolFmI2+54HlzbQrww=
X-Gm-Gg: AYBFou08G+RaEzyy0FnkzT3UfVKyLJWrLeJQcMCehb0Cqa7lcTvrZ6ZcV5oLyKam8s4
	R/+gkyu/am1R9YfFn47Hj8RbYHDLuxpcAqfA5dyThFyi1Hz7untkBKAUxOv8YSwt8jDvqXWz6LD
	4Yg08Ezv6ToGh1bRLTwdmlSRj282qCowLwUYRlDVaMLKFlG7LRpM/DwQZojAIpZ6d2nv5hlwdAs
	iLSZe890keyPnLK4i6ztIkLBNmHyAIKYL5YaWJWCqciEl5nzhld5xVJJAxXtmJGrev7ctNNu0Kw
	kvvCXRd0DCH074Zp8q5L06TsVJuClTJp4ps+S1v4fLOKRbJ3cyLuKxZmnz5CUYPq4XmGTo6BLtZ
	5psYChTHMpP4HhxGrd5ob3/jNrAV3CQ==
X-Received: by 2002:a17:90b:3b83:b0:39e:6c69:34d5 with SMTP id 98e67ed59e1d1-3a6ce95dedamr8429202a91.57.1791183467744;
        Sun, 04 Oct 2026 23:57:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3b83:b0:39e:6c69:34d5 with SMTP id 98e67ed59e1d1-3a6ce95dedamr8429177a91.57.1791183466189;
        Sun, 04 Oct 2026 23:57:46 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a5150sm9834853a91.1.2026.10.04.23.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 23:57:45 -0700 (PDT)
Message-ID: <0c6d29ce-920a-4566-9a4f-a0687b0e5ddc@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 12:27:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add TPM support via Qualcomm TEE TPM TA
To: zeroknots <zeroknots@protonmail.com>
Cc: amirreza.zarrabi@oss.qualcomm.com, jarkko@kernel.org, jenswi@kernel.org,
        jgg@ziepe.ca, linux-arm-msm@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, peterhuewe@gmx.de,
        sumit.garg@kernel.org
References: <20261001055029.1960743-1-zeroknots@protonmail.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261001055029.1960743-1-zeroknots@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfXwcPaXs6Rfp6l
 2VFlDdRzLpJSpHN+y4VQRHxFtcIvIzGfJiRBAZzjUiFtg7YcR00h218lA3yPwFZTp9QrImgEVTJ
 uv0mW9lNbZ1ntkOdVW9WoixatwoN50g=
X-Authority-Analysis: v=2.4 cv=NaBzRGD4 c=1 sm=1 tr=0 ts=6ac34a6c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=MGVvYQGpb7276ASQA-MA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: mTgKfingr9MLv407jVqe_WwbslzVyuxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX25CVCFs7uwLq
 r6t5AoEXB9PqXDQAeCEeKbIJKTuKHqtrsv+ftslVncLUTC4Bv1cXyqzH6cLxZkDsl6DVERd4btr
 FE7j5WpQI/mfJLaB/bW5o6M3rKwJQFkxSJXCwPwqA5owrxqA/da5NZvSyHstjvYLmzpNZYiG2pW
 sqYq38k4FQgYQLeHL1UlK/IPrG/me5vmy3JC48vKtjk36ulTCRSHKZKyEZLREaOsvazEk4wx21s
 9uk0hBkhaoWzK/CQGYv07e8vrM2++pguOgABdRWsHK6fc/ixRKphT98Mm4qLneK1cHkIY1MMbkO
 jQ+tLQgmJr6eQ/LlL2c825fFThmeALhVq8y9Y2F79NY8eTwvQXGrsCyr7yiKsi4RldyHJtUQYRn
 NAmwq9uP8STdPap0JF0zvQ44qH74i1PXIX4E91hlKyT4yjdaWZKX7CR47H09KA+yx8ZVr5DCEq5
 LLLoBYJzR+tXHh6hU6A==
X-Proofpoint-ORIG-GUID: mTgKfingr9MLv407jVqe_WwbslzVyuxP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050027

On 01-10-2026 11:20, zeroknots wrote:
> Hi Kuldeep,
> 
> A data point from retail hardware, in case it is useful for this
> series: on an ASUS Zenbook A14 UX3407NA (Glymur, X2E-88-100, BIOS
> UX3407NA.315) the TPM TA is not reachable as QTEE service 81, but it
> is present as the QSEECOM application "qcom.tz.tpm".

Thanks for reaching out, Kindly check below.

> With the qcomtee driver on a 7.3-rc3 based kernel, QTEE reports
> version 5.2.0, and service discovery finds neither 81 (TPM) nor 413
> (UEFI secure app). On the same boot, qseecom (version 0x1402000) works
> and backs efivars through "qcom.tz.uefisecapp" (app id 7). An app-id
> lookup for "qcom.tz.tpm" returns app id 1; a made-up name returns
> -ENOENT.
> 
> The Windows driver for this machine agrees: QcTrEE8480.inf configures
> the TPM service with AppName="qcom.tz.tpm", SecureApp=1, LoadApp=0
> (preloaded by firmware). The EFI configuration table carries the
> TPMEventLog and TPMFinalLog entries, so the firmware TPM is active.
> 
> Through that app, using a QSEECOM transport (based on Xilin Wu's
> out-of-tree SC8280XP driver: QUERY_INFO_2 / SEND_COMMAND with a
> CRB-style control area, here at 0x81d10000), /dev/tpm0 works: TPM 2.0,
> manufacturer QCOM, vendor string "xCG fTPM", firmware 0x40000, real
> PCR 0-7 values, GetRandom, ECC and RSA-2048 primaries, sign and
> verify, and a sealed object that persists across reboots.
> 
> So, as far as I can tell, retail Glymur laptops may ship firmware on
> which this driver finds no TPM, while the same TA is available over
> QSEECOM.
> 
> The same applies to the prerequisite series that moves uefisecapp to
> QCOMTEE [1]: on this firmware service 413 is absent and EFI variables
> work only through the QSEECOM uefisecapp. If the QSEECOM path were
> dropped for Glymur, efivars would stop working on this machine, so it
> would be good to keep it as a fallback when the QTEE service is not
> found.
> 
> Two questions:
> 
>  - Is service 81 expected to appear on retail firmware through an
>    update, or is it specific to the CRD firmware?

Yes, there's spinor update(bootfw2.mbn) needed which is in progress to
publish as QTEE side changes were already merged long back.
Roughly it takes ~1month(ideal scenario) to get firmware changes
available but somehow it's taking more this time.

I think i should have captured this dependency info in my series cover
letter to avoid any confusion.

With the changes, service uid 81 will be available and won't see qcomtee
driver issue log there.

>  - Would you consider a QSEECOM-based path for such firmware? I am
>    happy to test this series, or any other service UID you would like
>    checked, on this machine, and to share the transport code.
> 

Qseecom-based firmware path is not recommend approach as it's not
generic and less scalable leaving less room for expanding featuresets.
qcomtee uses mink-ipc based model which does all interaction with TA
with just 2 scm calls and is very much scalable compared to qseecom.

So, we are planning to use mink-ipc based qcomtee path only and I'll
drop an update once QTEE firmware changes are available in meta builds.
I'd be happy you to try it out and give any suggestions!

-- 
Regards
Kuldeep

