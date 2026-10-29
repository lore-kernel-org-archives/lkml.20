Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793291310;
	b=DKQdZf6/2RTSJOcEuhB6JGQuXzTQ8HXZkUP38WsNL9sB8oIKUDCBnFUziEleahRup+9/
	 i2kH82M7q+r3uUbTYwqG3jhBWg9y8RpP6wYGwN1bYkZVEbbaaC9jXc7mRmAoeIyJoj5+p
	 u86vi1Q9jk7I5QYimwFQaGUdCUQ2xJq3uUTGQvdgE/k34569Rk1PtSKE60uJ600QLXbGI
	 6d/s9eP4Oh4Z3WEpHZfAutjKWYnBscctHwPi4HTiG9IT/dgeBEJtBEHPOGgRbXag8PDpv
	 dis0uGabk4DLSSqWaoY4y3XPGd0mFVPUXSwE6Tdcm8oMDNa9H6eTTwNa/BtqpxQM02A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ec7n3tBIs89R2/LzH5q+gHIxeKPOb/RT/5XNvFGn7Gs=;
	b=xZi3h/NsRAerAkgS8LG9w6PxCLxpfdxKz1zUfJLZ7eOM00PCv7jHTPfpdMabODib0DQl
	 EReyqAEGRm5sYzsTcKBOes+WYr2dfOd6L3F0xexo3tRENgN1IgdbNp4CwV1ODpx/Sz/3Z
	 2qJ0uxW3lSDRRKWp7C5f5pNZS7Fow+2KcSG/cQgGiDkdhtEXXesIiqSXhMZsq9l5HreJK
	 M35rnmRjnI3WCdUrGvsH42hOKmhMgdpz66eAqN78NnaSgcPLHnZ5vv4jhX9dFbxCdFZKc
	 FMpVRw//xym/5k0aU235w7NgYF+A8pLIIBp2vJ59nu1lMX3PxiRs/K6eEPioVgkBQfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ljJaEdhI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+7gZiJU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C886606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C886606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ljJaEdhI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+7gZiJU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDIpX227451
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ec7n3tBIs89R2/LzH5q+gHIxeKPOb/RT/5XNvFGn7Gs=; b=ljJaEdhI51Ae+dKw
	BJD0bZe2JkSc0nwrpWLUljK0wB3INpfz7VXgHHVAtqn1Xrmh8QUGuXzYrdGOPPp2
	bQvomHAMxEFcSwiAK8fIWB8irunsEo6hByYcCqV5womjEUBL85IWIMCWVwPqnLcd
	zFjEE/276e3tv+PujkrtT4ciFcLBrG3XiLVpkCivhVfZl3T3r/YvzmRty5avP/yy
	Q+J7N1FiGz+xAuG96OA90BCKZ9u0nlXoJd0RPo/500Q8/6MSci2KNfowAYuAtpSe
	4CdeP9r9S7k2O0k5a6xCmaOcyDe0GSSXBNvuUjb0552QBJbz49t6y8Wr5S5U1sOF
	eawDpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fhkxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:28:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so490483985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793291309; cv=none;
        d=google.com; s=arc-20260327;
        b=UooqRimWmp2CI19BljohiTyqIeInYPuaBDFudKu6iY3MbsGLhJxdCqaXvf76npZJSt
         lsTjeKhMzbmn0ueqMVkJcaBAcvTjF/VdrI4aXSxRZ6SXwEiMI+sv2c92rBW+D1t3u7hh
         plY3Kt1IrZZlI7I4mH/5n5I2UUd29W1Pr3G60aRTqNF7QyO66h4YLTF7dtaf2HRjQEH4
         VTiCpjQFhBmrzNwylnxIIgOLsupHK9MK7MHT3kM4/iQk9XdtFK9q7w83obVdgPpkrioD
         iZ4divGNLVJdXLgU5bS+5IcAwY6ZRRrXxiys0oHLLmfhyo0fvEvfeZ10k13627CWspw3
         6HMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ec7n3tBIs89R2/LzH5q+gHIxeKPOb/RT/5XNvFGn7Gs=;
        fh=3cDjwIoHplHk3gsSaE08qsKNJhFOCesq9zPnSMNA3jc=;
        b=lU8FFdZrqtx58EnfY2LFOnpzLZmiKdczlA5j2WkdpqA7lAbXHitB6xEYYxgBOPkfY1
         l/IIswV2eRnh4wslLDR2vYREm6L7h+XejOjOqw27Sedobxw8+s7lO/yw+wzhodyLkUCk
         +rsJv7sFE6ZlF0CmW21wZOHkqrUbLzCVFVkjEl3B3yeTN/0KDCUkHKy4/8CNr1zHPo70
         rRYpXeHdE4vmm7mfBhkSgT5IR7S3JLqVaLqee64triAku5CTVJm5YzLFRIgFXdniheIY
         Oe8vaaXs1EsZQ7H1431Z8i7e6Rj1bm4XQr+XC2Xmzu54QT9vPBO+tJSKuY1k/n2w1SLN
         sy3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793291309; x=1793896109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ec7n3tBIs89R2/LzH5q+gHIxeKPOb/RT/5XNvFGn7Gs=;
        b=W+7gZiJUh31zjNBcD/7gfEEnrXKm8SK0/9Q0iunWJvHcGD0tX7rrjZ1uEI5KFwOYAt
         qUntqwgI/33M7umcU8ip81T0BOW8scWg9G5h8ZVIonGNH0qvdbyXj9Q6Z+c8gosDtCZc
         VPCgcUa8M11Oyrju45LEQZVIuvKWXdyU0/Yl80A1YojvKif46GdP30ZhpwLMJuCywdU1
         DGUiNncosd1dx1/fvqKu4sgP8IGOKx/bbAq+q8W5Nlr3fu+vrjps62/aPI3B9INpNNy6
         NWKumY50Q560hePsb9v2u3QjsXgEjLfd+kFnhecvEWqjiOI1BBMOVq3VsT/LHNR/H5No
         rFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291309; x=1793896109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ec7n3tBIs89R2/LzH5q+gHIxeKPOb/RT/5XNvFGn7Gs=;
        b=N/DujB+zesB5Hf5unQet2NuFWE/uzSatRBGA8V4KhIu0ux9czEdKWcQjspFcylSbrI
         RJ9lqgWeAE7d5b/TJfUT24p4UujT7lKu8GjnI0UDAP2ArNdJMRHXMufR/o3C5NBqj/FY
         eLesqS90psbFttajh0wF/GDdnnWgmB1FxQkTr/YMnrWZ50QBv5YGJCh7XPPc8hxRalxy
         3Pt8rlMgYAkKjStLINi3nwc4uwYKgGg3DzgA/Urw4zWFkfIlhFwZY0PzjKImhnShl/rJ
         2wCaJU20m4qpsqrUiNfwk9TBw+cvaGJfiGeBucPKUWEfnxLyBNWuh8Cp9OXbgYqqBbWv
         8VYg==
X-Forwarded-Encrypted: i=1; AKwUvByser33pigBl2da3DiT0bgy5tk69Inob0DNo5//m8R2XrRoBFIsN7uBEzdG29fZuwCRA1SfnmRZHtxDxdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIybjNbI18oL7CzH8BhQG0fvtnwgPYW7BU5iwV3dS0mBFYXM7Sy
	RgS85jQRrLMd9VWUGhH0syjh2sPeMH5y/pE8B0G5mCC/IIR6uP2rXcCLB8fS6YVszoT5Bj+J6Lo
	m5bEdoFLyu+0FklK5fGQpclerp5eE9k7auRTLvd950YYpZpPOB87bBvDbcL1GPzRMGDYUgQmHdC
	l4UolWlHUu1WkC+3YUT2e3ydOQoGg1/2wHUtpU6sOK8A==
X-Gm-Gg: AYBFou0XquASY/wvPnROv7ZT0IxUqJqqlIW0bVXBJG2gd9nyewX+a1RfdDdAp4EcY9I
	lOK41ESPN1hJX/nurxfprNDnp42USfmKNbT//ebfwQ4GQtiJ0SVdYhisyhk8CLoarrdV0TCS7cV
	IzS8MTEUV/K3UII6INHHgqb15cyR1uTgRiCurp8cDd5f9T9jk/kGvnRzggJGmEYf7EY3VmqePPh
	59+uRuUELlMM3Vy6+PefnoCeGuOSCS+VRl1F2HrefIDHNLB1EsZsTVBfMs7HSj+hG9RmUMWDLKp
X-Received: by 2002:a05:620a:4106:b0:93f:565f:e40 with SMTP id af79cd13be357-94408d9cd0cmr909713985a.65.1793291308655;
        Thu, 29 Oct 2026 09:28:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4106:b0:93f:565f:e40 with SMTP id
 af79cd13be357-94408d9cd0cmr909709685a.65.1793291308187; Thu, 29 Oct 2026
 09:28:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028050337.127464-1-yaojiale02@163.com> <20261028050337.127464-2-yaojiale02@163.com>
In-Reply-To: <20261028050337.127464-2-yaojiale02@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:28:16 +0100
X-Gm-Features: AclHuK9jYoqEMbdFg84LDshS_f4aCDb9uqZSpjUek3Kwn5SwhZg0YWrh26svot4
Message-ID: <CAFEp6-3UCSqHqABuvBwmNf_bAvJCWg+N9rZvLMYRydWQKxMpeA@mail.gmail.com>
Subject: Re: [PATCH 1/4] wifi: ath10k: clear monitor interface after add failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Michal Kazior <michal.kazior@tieto.com>,
        Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX9643Kt5kYRAO
 SXdWS/kx7ZH/lMbAg0uL3KpePMf0emQLkXejOECXRALsnOi7v1zSD1p75uF6/XreAjGvZ4/Dzb/
 RXKroO0b6YkhoNJi8qVe+G2hG07+VKZ0ujn1LIypGXKuCgEYXdrBZzbtnhJ9zHxzWDKm5e/FH6i
 0uuPDKFfUsqjA8tf3gw86ZgcEu5/8q6a0LjORF68C8+ynR6M+M4zAobB/exoKzu/urmTHWb0BiJ
 F9L9w10tIYw9Wlm9yazV+uyowGdxGAUHCu/IcpobKlNr/agmRqrkCwHEIz80TOmEbNkm1uE8QkQ
 l2/P7sAl/zY71+kGVI+SG5xXusoMIy+wlLrF35eiS8CrVrjXHHMz2s2PuWxsWK8iNsSKG9HhAxp
 hWjie/kiguFjl+WPVtssivGYahJGFiE6XinWgMf2QfmJgvhSj/xTRDQDnajiHbFnJxoapDGgqB4
 /ZDJVkiv3xKID/zhgyw==
X-Proofpoint-GUID: 8a_Us_pqyTTEeEvlnPJ5cSSeWm7oZhvA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfXwxCJ4VOcI6bg
 VNiFncdNS6IoZkXU2sUVbI54AM1dScPM9qg6ouWquuvG+/PRklnaDH3tiY4ZIoEgkXVy1Tb6ter
 QKxzifParIEI0c2dsm+2PDNM7mIqslM=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae3742d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=Byx-y9mGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=laIMyccDeTmSpVvBuxYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8a_Us_pqyTTEeEvlnPJ5cSSeWm7oZhvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290064

On Wed, Oct 28, 2026 at 6:04=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:
>
> ath10k_add_interface() publishes the monitor vif before recalculating the
> monitor configuration. If that operation fails, the interface addition is
> unwound but monitor_arvif still points at the vif that mac80211 will free=
.
>
> Clear the published pointer before entering the common vdev cleanup path.
>
> Fixes: 500ff9f9389d ("ath10k: implement chanctx API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

This looks like a reasonable UAF fix to me.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c2..36b694ae6de4 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5875,6 +5875,7 @@ static int ath10k_add_interface(struct ieee80211_hw=
 *hw,
>                 ret =3D ath10k_monitor_recalc(ar);
>                 if (ret) {
>                         ath10k_warn(ar, "failed to recalc monitor: %d\n",=
 ret);
> +                       ar->monitor_arvif =3D NULL;
>                         goto err_peer_delete;
>                 }
>         }
> --
> 2.34.1
>
>
