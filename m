Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718820;
	b=G2QNQwEc3dUviIz01vcEFVGNaNh9NpY3V0wa6f0slYb8KOcwnqor3z51hsVkkwSTHDvF
	 sWT83ZSLghrkL/FUjTs5M3WRG+0PkONoOfCWk/43fD4MpFmhD/xzAjPFnI/XQ6Gbl8ClJ
	 fsecnlbHShnEyIPIz6SRQfTlZnhq+ncum/x1baLySwIxTTLMBig/9pTeuJoYwLepWM3vM
	 QfpIroX4a1wTxHoU9FfyKIUwwpZnHrKyc9z6Nmedet3DK3xhJ8Q0pUsfN8aRkAPNrCI4J
	 9o8/VsjKOCYCK4/mU2pdyAEtdgo4pmGRtG6gzBu1dg1Nevkvzp5Z9wS3QZIi7vBizLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I8qVa7oSpZqMvWdcR4DKEC6yZTIuxu6met6/Uocy6ek=;
	b=YvXqFm/HwN70zpK2JLzswtfec4CEeH0VxVCopRhBUr+SZqo6k4MmaI5nvnd9OnClFIbS
	 vKOE9Sg9/BUOI+5x13mVuagyMVXk9/iZGdz0pvT8umTC+vXnAe97iA+11tEEbTQLGMhBK
	 a9MENIsT/9O2X0XwloFs1AJXDbf2e1YskLN5EgpGjwttKyQlNh57klM1Atc6ggA5IHrIJ
	 /2tU32v83rY4DCKkziVNhIK7EzErDnSKqzCY2utFrlMRvGKyFggWiBLszLIk2s6kbOBTf
	 ktv7pNO40J+KdGeRbjqyfQ1ldRs2Lce3J8eTF7WikVyTpjNpAF6lLkvxT9n2LkRm9Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WIjh0Kt4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W2Mfx9hH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68E6606A33D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E68E6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WIjh0Kt4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W2Mfx9hH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EADii3049110
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8qVa7oSpZqMvWdcR4DKEC6yZTIuxu6met6/Uocy6ek=; b=WIjh0Kt4ABNef2V2
	/FY9+JSGyNOhCrO/xZ8TBxCP18UqZzCNnSf0zEn+J8x9YBwdrAIwdHa2p71fY+M2
	7Mz3WdANa5J14E0v2crwFKXlfVK2M60b8BjhykJ8gEoAJCYCx0kgHuMnCdE/WOsc
	CvFqC0lGlLnOhUGRur+AJaknldn/SdA/eMGiwHyQPFT1jbI0zwqMlH2hyPpwet3L
	3FPo+WV7J5xSK32tXv8Xg3ZQ8ZxEfJc3O6KH4XWYc8qDb6qtJ/m9g9587AMOzYDb
	dIQCYzIB35XE5nBJzBGk8LUuKTOLBPuRY4pveOBZMKUg7Ei1W86NeIWO9Pi9LFcz
	t5KmmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5ka5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:13:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so735442385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793718813; cv=none;
        d=google.com; s=arc-20260327;
        b=T7VLfeYr2CLB7EAbXnxC6iyKwAV3hLUx7j7SwYBR9GkwjEwJ796FtzSLt6mDeUJuHQ
         983eX7ZpwVPYa54UbngGHvt1wQFGuQoRvCKGgZtjd2LikcyqN2dys5zp+E5EDbuL/tNK
         43MZVsGS/OUYviTga/KxaaUDpeco9rF/DrCRu3uvCaP/jkbEM6cG9Tebf1ffRkYNJyZE
         Ui/bZDicO//0qlXLMBaECUbU1W990mUTc62gDex6+tyH/0DXCC8bQhxARJd5uia4m1yT
         eli+xevJ6Z5zSVtbGrdFvkMUcAteTChJWIyAfc+evNQtFiLeTvhVBoz1ST1x/2kesBZ/
         vYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I8qVa7oSpZqMvWdcR4DKEC6yZTIuxu6met6/Uocy6ek=;
        fh=w6z2ZI3pEQw4fZQadNxtua9XO56wzFZiMYiMOdFHRzc=;
        b=pN2lK3rtc75sxwgMucnfI2rAO7+yY3jrLHLwzg3kVIMcymdQzfYwwtr4tO+BbYE44w
         acTdwHgOGtT1XJA1n6uBG5r9nUnt8Vtj5wi+fJcc2xEVHIF+kwA2wO+sgEBWi471GoN2
         UY9c0S9vA9OZQog6/ZR01feggVhmg3bNdfdpDmrIUfPZ1u4ef59+D35QE09jdxtv3y8f
         f5IS2873ixJVZpZbDDnM+miSHPBMC1Q7n+KuLhq+K41ZxpCdVxdNW5dz8bgzsp+ujG1y
         K+BgOZP/2YsooV60cJ6HmodRayozr2v/1zKOObFnI4jZeoB3ikzetxtfz3gfLGjynO5y
         aETQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793718813; x=1794323613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8qVa7oSpZqMvWdcR4DKEC6yZTIuxu6met6/Uocy6ek=;
        b=W2Mfx9hH+6Qgz3AhP5zJoiaRdw1mMmKM4KTT22ta4msWU4KbrVnXjWbUCO2+H/n2fp
         C8r4VzXO2P4YMCa4VJJu8X/c+kRGicw2KA5swz/RNqAtgW9ysxI1T0ZMwJmfiNWm11T0
         b/IJBD+RkYllnxn+f79D3U1S9fSexhq8seV+gD4s2OgmfO8OcmmXhYZTnNuzoe2I24DY
         0B738K5N+FlaED0s+Ni/YcRiLpN4JlwxMp1kU8zkiNl27h+XkUA87EcAm1z04XBzyapL
         8oFbz4eCOgIuGOWGmYozs0gon30tEo0yFfQMn3ivlZbqWC9QG+/wjDjaCgWNUTRxqx4y
         Gf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718813; x=1794323613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8qVa7oSpZqMvWdcR4DKEC6yZTIuxu6met6/Uocy6ek=;
        b=cKr8X6aLz+q5TYcro5qjWTLaF+ncnMFPRRMZEso+cP8Mm15mZLXjku2grZnWlPoMUv
         j596Ev1E4F1JjsPO3o9B/y5XPH22RPmrbojHjDQlz1RMF/qHpvZqXitfh31gEkTJCAgz
         BmphuqKCbVSt9QGmgvLsY9DAmdMkaxJNKdoIi2aqf1GsQF16PCFBITEpg016UnM/Z9gJ
         sfmJIwSHyXfn06UvNxN1O6F6fNPzw6uwtMmREGGaLYERFWq+8RJLD3M3m1Aqmju2CTJC
         40hjZjG4NVBtaeFubq+CTnvaQwxF4QzFA9H0ZjI4kUAScAdv2h9RjpIlX0dPghhtuUJ8
         6thw==
X-Forwarded-Encrypted: i=1; AKwUvBzkSQoNhjvqP/kVvtW+kOfCF0chgzvQA9Vh3TVIx8Axbp5IZdEnuCDXR/CNlpG5y/XcetovL668TItz7Vs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/esI/QqfB2+roKr/DoEKasJp7HEG3BGKsuWscwrSKIUXmGis9h
	ALxGOCnQzzReRIHS45MAgLW31/HZTVuuEcHavduK1TqixljOvp1VZlL4HdiMnq000kWfl46MEPR
	6Va5kYs7pmNJ0T6YhsSXTG0BnEbEb65j/CeDqL+Oc6GERQ1eOK3vde2HJAWU7pfx7vD+NLO7f+8
	EopV3DVq8J7Py+SfKTjJ4mxYxuHoxH1cN6SOq6zyUMQQ==
X-Gm-Gg: AYBFou2ohcl9HMKD3C+w/8EXJbyGsNXqGkIKmFjgvbn8F2RaQycRhmoYrRL1BdPfjbJ
	dzUGCGiB/I9t2yEnUMz+gacSnUpp/Eri3LX+r4T2ctlFlLoA9xxVgJZN4JWSH1XfsvfTkjVTyjC
	kB5GvdjI/bMzI8x2uKY14+9ykWrgpyqrqh//k80UUIStlFyLj0jt0ENTur9GiweTsUI/hKk5uDm
	gxP2Hup5eugeoJjKd8y3kcVlXiySzw0l2lEFkixBkw+8uZMkwKPPmd09+LKxfYjE6wm161nNCg=
X-Received: by 2002:a05:620a:4707:b0:93e:dcb4:c73e with SMTP id af79cd13be357-94421588073mr2330908085a.5.1793718813033;
        Tue, 03 Nov 2026 07:13:33 -0800 (PST)
X-Received: by 2002:a05:620a:4707:b0:93e:dcb4:c73e with SMTP id
 af79cd13be357-94421588073mr2330901485a.5.1793718812516; Tue, 03 Nov 2026
 07:13:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103145925.69981-1-fangxy@xiaopeng.com>
In-Reply-To: <20261103145925.69981-1-fangxy@xiaopeng.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:13:21 +0100
X-Gm-Features: AclHuK8DIjXpRf1kb8U2F0fW682errUhejBgNhE7RvKkKRDQvd3zpOgJNdiispY
Message-ID: <CAFEp6-2mpTBGNCOhJzaNFMyH1EUxBGbihEhvOYLhp3+VSVZ-pw@mail.gmail.com>
Subject: Re: [PATCH v2] net: wwan: iosm: drop redundant skb->data check in MUX
 DL decode
To: Fang Xieyan <fangxy@xiaopeng.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Guanglei Zhu <zhugl3@xiaopeng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: VMq7Bcb9xrFP5NAAckl5Fb4KiFVlSTb_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MCBTYWx0ZWRfX0xKO6SXadd3P
 sLUFl3w7R8dJy3kHS14+LN7+cMIj5z8BtDQAKfAMP5x2opjevYTy6TTTcLTETqFtZXyFYQr7WGS
 sk0Uy4ewUX1tXJfxyHpiHsMl9oBLIINWNULu59lNiZhZtDHZZaE3Wew/LIxA6axMAwfOAZlx8Gs
 u9/wjXVdwxUPxgibcKQWjE/yu5WQnP9HdcGXIXNs5ImYsoVju5wiCIr+lHkk+iD6kQTvulGUjmB
 sQzNw3e20mNYMZj3dIwCZPWevYuP5EBkgxB3clWnH+Oy9E5IyFRfCFKZOr6bJOpYGTNJnAQWo6m
 xDfrnMFD5EfbuPbfrv16PnDMEL02rZeytiyBzPKOI6codY9b8M48zr3V7ej6TT5EX3Pp6uLRZm0
 Si8yk27d/fhC6tbLCRq4C9MY69Ce4dsaeAUW/UV0ddaLgXRXDUsfKq4pCNl9qadZOxjrMreDGQX
 VKeYLrqQWK+BOW2F1Lg==
X-Proofpoint-GUID: VMq7Bcb9xrFP5NAAckl5Fb4KiFVlSTb_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MCBTYWx0ZWRfXwn/v2Aj9QORs
 fjG7ho/Mh6mkRoaaUqU1E6vgRnn44CxUe13bPNTg5jIeDOb/jWlNwzX5k2tzRA/tfRKnXJQ+Xjf
 Pk8WGCKn0PCjm24g+kdGH8zWNsWhrWw=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9fa23 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EgahoUkMAAAA:8 a=EUspDBNiAAAA:8
 a=52d6GeA0XoVMxxXrUM4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=D2SkTF70-_n5gOfERQdM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030060

On Tue, Nov 3, 2026 at 3:59=E2=80=AFPM Fang Xieyan <fangxy@xiaopeng.com> wr=
ote:
>
> The skb passed to ipc_mux_dl_decode() through the current RX path
> always has a valid data pointer.
>
> The only caller, ipc_imem_dl_skb_process(), checks for a NULL skb
> before calling ipc_mux_dl_decode(). The skb is allocated through
> ipc_pcie_alloc_skb() -> ipc_pcie_alloc_local_skb() ->
> __netdev_alloc_skb(), which provides a valid data buffer on
> successful allocation. Allocation or DMA mapping failures return
> a NULL skb instead.
>
> Remove the redundant skb->data check.
>
> Suggested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>

On top of that, the early-return branch does not release the related resour=
ces.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v2:
> - Drop the "fix potential skb leak" approach. The skb->data NULL
>   condition is unreachable through the current RX path, so remove
>   the redundant check instead of adding an ipc_pcie_kfree_skb() call.
> - Drop the Fixes: tag because this patch does not fix a reachable bug.
>
>  drivers/net/wwan/iosm/iosm_ipc_mux_codec.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c b/drivers/net/wwa=
n/iosm/iosm_ipc_mux_codec.c
> index 0bbd41263cc2..2b8a22980c87 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
> @@ -693,9 +693,6 @@ void ipc_mux_dl_decode(struct iosm_mux *ipc_mux, stru=
ct sk_buff *skb)
>  {
>         u32 signature;
>
> -       if (!skb->data)
> -               return;
> -
>         /* Decode the MUX header type. */
>         signature =3D le32_to_cpup((__le32 *)skb->data);
>
> --
> 2.50.1
>
