Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793057320;
	b=seU7VhV8D98/WymLVnHeLTIIdRGd4pCQ/wJRj5hgmxd2RD/r7MnMPqzglkJvchZo/cCP
	 74vTkSXAxZ6kklx1vfcs1JcAGq9QGe4lvxeY8g2EQ+Dyi1bzQjlcgdt0fQ+hTMepV/T6m
	 6TeDzILy/xZ7BO7xLpZWznFbas6ELmcdsKQj+znhQOZXRCkaoJboqDS3cnELi1kkMYkmw
	 MBD/hQ1vu7i+n5NAV9SLeHm8rc/Udxuiiwq7+3Emuq5+SSnZOdMp+tD5tPuSG+HdZraIX
	 XOnR8hi9rP4VREhUElh2qExTq26c61MzMxlDb3/VP9f8pdfsNBB4aGhnHmAhFbMNM5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o+I2AzBdqLn39dfVG95T/n+D0wibJWJbOKJL+qKq03E=;
	b=n7HP9RdaeNW9/XiCrHhYaHufKALWfgieL1pWGswEAgz+RSQcJRSIuHN7DxEi1D/qMrWB
	 tkTrVp72Cm3dirZY8Den+DJ1Psiz6GMgpQFM2Es75EMZabls1m5dg8UDFgt81fXPzq9sc
	 M41HEdhq4iEGuJJ/5OGYgGyCueNYe8G7qO7WlIMM3M49L0WlWbKmjSGcquTkdFmaByMzY
	 zBTyphPQEdxAyVXZFRVewcxD0dPGDILdsWRJClJtvRB1F7FIJEDve8EsiXww96uArnt0e
	 /+k88X9MmclGWMVN+DJpZZILj3DgcGvD2aohU3XJI6Kk+2Mue2zMl/mBqfAC0jjNo+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1uzXT4s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZOPjNcyo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E5C606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3E5C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1uzXT4s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZOPjNcyo
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QMP7gH869091
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=o+I2AzBdqLn39dfVG95T/n+D0wibJWJbOKJL+qKq03E=; b=Y1
	uzXT4s/NaOckjuhPCvanJCM72ZakvhgacqOIOG5CF3d7ytYsAYVWIs/DugT2Jji2
	JcQ3HyW94/UCBRH8nor5BcXg/Vk11qju23fFuR2vza95jRzZxd6pKFmik6oLMloC
	jDFLWeGqWKS7WEKniyBNpLg3etS5OZVzqXEgNxZXBNgkC+zBBiZqiBShyLY36mPU
	Tx0Dh3Dm9EaKsTpQpdbi+6uqV4kRdbX2v4XrZtCzuocXmWxJj2acYKOvqyr57bz7
	Q1nNHMrDJxvWRAWelkS7RyGrcbhoI4yQ6WX1tDwfwKiwVKDd9fSPVBlE+tQVNr+g
	TRaDuAGw/BtLa6zGsjjw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s92w4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:28:38 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4a68926c8c4so4230738fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793057318; cv=none;
        d=google.com; s=arc-20260327;
        b=kkP20gD9+CyN0lFfu+2Feb2FZrnjpPm7ASx/DWlGgePWHfFLRyzjhkmPvQRuEAl2Te
         PFjl8p1eZwBLS+yAOSaQd01rPUAn2hVpkzhBUpIbHGQ/WJGgBiwl+gCz63XmgoH+KSiB
         2itykn8Xqthq2ash7cydofZpM8+kOkMiphPSoHhGDXqSGimMtdRbSf3CcL9Xbo/O8KYX
         ShNj/kZ3KELRms0q3YG+F8bZIPnIa2G3zBh6tcgXVGzUIE92H0iG+Y5wOtjwdNfBE/L0
         I3FX0hrPDCF96kRkDyADPo7iX5Ik8Y8T0mWSyEfnqBPdVhc3Ap/Fq61kv24lV2Zer7tK
         1guA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=o+I2AzBdqLn39dfVG95T/n+D0wibJWJbOKJL+qKq03E=;
        fh=t5klHM5d4EOR4h4E7S3a371gcLIV+E81ibYpMAVrYN4=;
        b=d++6EqdEz1gZ6uKsfxu1+4dtrNC/2R9/cEN5tNgv1OjCwk3AqrST/pvOkGnBi+O5VQ
         VKZZoOVR7X4alJ4gprPdwWo0XF4l0Hh3qp838KkcxMq4p2EUpJN1AzMXjsmfzJc1vpC7
         0234L97Cb7F+awQwREYUCnqJWJ/7GmzzODZ6lvdGE/NfrDhH+DSwTVpOv7W8dsbCq2DI
         3dKsVBHWbIJhRDcU/hAIJVgTyTnApR8XWjMgnFlJIiQ2Gb3yo/uuhWvB1knmOW5bA1f8
         /cI4sSrbYtOwm/aOsW+derZZrmFzmYi/29pv5DWfTN9KiYGuXdPkvIWTCSqQl+XT0lhy
         SV2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793057318; x=1793662118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o+I2AzBdqLn39dfVG95T/n+D0wibJWJbOKJL+qKq03E=;
        b=ZOPjNcyoy3mFQ2+FWiVTqlSq98pOk4rNHMNgcuq22xURgd9dWeCVBOnv3PNVZvF1vF
         Bz7SmxdeksTrVrQ2Ta1GI11SVoptiNmdZdfiY0RZh6GE1KsgpkGOefciFtqzYTaXS/83
         zbt2I8zzBh78Rv3wSW0R8Q1adBd3bUWeoexfMg3um/ZefN+TSJQWAsnqHryMp4nXNPM7
         XmJETjaziteNmx/dUvW2qJNv39+2Ox1B2wqVHP5beRgT/G2ZPgiBieUjBWonzSHDb597
         GHTuYlUzLC+1F4XsshDY8m8CAbZLxyNdbxOIwQpAJuDl1QbJpDZdghrBjSKaELvhMZui
         fr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057318; x=1793662118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+I2AzBdqLn39dfVG95T/n+D0wibJWJbOKJL+qKq03E=;
        b=H3nA12WSfTGsaRh9S3Jyw9tp5yGTj3KdYPn8lB37eZHA0KgAAs95TW9jAsI53x/iGI
         eAhDojYJb2lkVQ3eaLVcfP0QZmVtC4mkRY4VAVTM2vIf0feoXlIGcWGNZ/3U7myU4Iu9
         rx5Cv9R/IgO7GbaNpGzPUyfI1i402cJo7bnfxZCyqh8FwsdMew/l85LEoewRnS75qUw7
         sxOEeDvQHa+HESY1hbNLXKFlnJezm8bXAnX9+HWUsHrwiKVWt9U2+sUl6IinJsi+jEhK
         raRXETcT8IFzQ+vj4ro90Rl1ENSfwva93kJ6e+ibAmCPf2glcSl5cl83O/Q2oESvkKrq
         27Xw==
X-Forwarded-Encrypted: i=1; AKwUvBy5Og2N4RW7Sv1MRhTW/Xy3mJiRGeH8OgzFpF0nBB7QqPp7J0FNADUIdfdmpVvkpAO6c6KzTE+3bi1Z/EU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw40ET7ZQsbekTB3Qj/goZbDXht2WQUd2YJLO/z+DOBkNrfnsU
	YMxoSjp6gvye7GbD4PiLuSAlwg7et2QZ+lvklG4OrZeVXePQth2MeIH2HTDGcg5R+n32EpUGXEV
	oDk6UJYGLdRY87i3R9lsIIs9EBYuYPLrxN05I4s2uMDJzIr6IS2B7b4cyzJkhx9roXOfZdT8zv7
	WjV7MPy1TH4DDtfcymNa8X14oNzrpnxPgQkRj09za4gA==
X-Gm-Gg: AYBFou0sL8L95/paArOXiBwUWT3T2eet4ydFDUbvlD5egdY/vFINw0y7nUc2Pkgw2o/
	Dz1Yy9l8TkfFpfrwf0X+ZZABsdDWK7fKKYMBVEJ5gbL5rOGqLMwxrUIIafpr21X5Jgdk7nhNluL
	9HdP5q6gMCQiE0GX1VIlkb2j2CnW/2u78kNRqKlxF96GPGLNuPuKJpx3uM6w==
X-Received: by 2002:a05:6871:7513:b0:494:b8f4:9a22 with SMTP id 586e51a60fabf-4a83f4a246bmr4938656fac.28.1793057318029;
        Mon, 26 Oct 2026 16:28:38 -0700 (PDT)
X-Received: by 2002:a05:6871:7513:b0:494:b8f4:9a22 with SMTP id
 586e51a60fabf-4a83f4a246bmr4938635fac.28.1793057317392; Mon, 26 Oct 2026
 16:28:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com> <FZvwtKTpIxRNzjzcqFf6bTw12mNTJvJZmg6j9lmi8MehHBt91NogIW8oQd5yFHN5DSL8yIWL8p_b1cJPAJC57ZFkoe2BOAh_Y3kwph5SV_A=@pm.me>
In-Reply-To: <FZvwtKTpIxRNzjzcqFf6bTw12mNTJvJZmg6j9lmi8MehHBt91NogIW8oQd5yFHN5DSL8yIWL8p_b1cJPAJC57ZFkoe2BOAh_Y3kwph5SV_A=@pm.me>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:28:26 -0700
X-Gm-Features: AclHuK8vaIH6p9w0eeJAG1ndOcuOZrOVoVMEyv0y1BXqKWCwPIOx8bBDbK0rbpI
Message-ID: <CACSVV02x=GDTH40C57B1Eg8_CfmCgDGD_BE4f1auwFf=3eQNCg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] drm/msm/a8xx: GPU state capture support
To: Alexander Koskovich <akoskovich@pm.me>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA5MyBTYWx0ZWRfX+UU5E+/VdyMy
 JGATHz6TjyxyM8VsI7CSbE4mrkLmI7xs1ZCiQxB+BST9KU/ip/QAgSdpVu6KCKrnSzz2DWnNDDL
 8AedrrUbcwkLxWdR7cwlhrCqWdeoLnCGzJxRmh14EmZcQJlwJRn8L6h4RgLUcGgy+8hWUTI3pgi
 PAboyVv3kB+EgHPnzkAQU7aaUnPvXKPJ5lVK7yv56Gbpr+ae+DGGlnvUd7EU/aWzxfCB98WQ+I+
 gNV5rMDAuPag40AOSVpmTm/3pCVGnUPZ7HyzBHikUPQAaVO/8wEu3UQumQ3uvYYmbkyBZUAKo3N
 mgWFFFZK8IAtbPuKNKdbi9iZratDyBBYMfg/z8DfeAUPCh09BiblWdcNUuU0t4dV3UZmkMl0zeu
 K19nSOh1uuks7bpY041Wef/NilQCF1QU7P419iaPry6f9jk5U7F6if4MQzZkAfqAim1nqXIKTKU
 Rb0ZETy7zHBGruno2Ag==
X-Proofpoint-ORIG-GUID: hJFwFfJXiArEdjJnSxocSIOjZcnj2QDr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA5MyBTYWx0ZWRfXyD134VrH0i7Q
 z8iGAnqkd0tKfo+bhP48gQLEETRMabBiJwWlH1gmLcVj+XYv9XuIAiC+SZzPQ9gZM9dYt0OUtzq
 Iys2jNNjPb30A/6BkiLyTzTXj3YPLVs=
X-Proofpoint-GUID: hJFwFfJXiArEdjJnSxocSIOjZcnj2QDr
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adfe226 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=oZfsDU2LrdIIkRBWPnYA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260093

On Mon, Oct 26, 2026 at 4:06=E2=80=AFPM Alexander Koskovich <akoskovich@pm.=
me> wrote:
>
> On Wednesday, October 21st, 2026 at 4:54 PM, Rob Clark <robin.clark@oss.q=
ualcomm.com> wrote:
> >
> > I'd appreciate tested-by's on Hawi, Maili, Milos, and Pakala, since I
> > don't have these devices at-hand to test myself.  In particular, do
> > things look fine after the switch to generated nonctx regs.  To test
> > devcoredump, you can use the msm_recovery test in igt.. or just:
> >
> >   cat /sys/kernel/debug/dri/*/gpu > /dev/null
> >
>
> Tested this series on Milos, series as is works fine for initial boot, na=
vigating
> around GNOME & apps etc, but when I run 'cat /sys/kernel/debug/dri/*/gpu'=
, run
> into an oops.
>
> That is resolved after removing 0x20400-0x20487 from milos_gmucx_register=
s,
> and removing 0x0f000-0x0f002 from milos_cp_cp_pipe_none_registers. Not su=
re
> if access to these is restricted by TZ or something isn't configured righ=
t?
> These ranges don't seem to be described downstream in adreno_gen8_3_0_sna=
pshot.h.

Thanks, yeah, there seems to be some things blocked by
tz/hyp/something, which are not blocked on glymur/el2.  I'll have a v3
soon, but still chasing down some of these details.

>
> After that 'cat /sys/kernel/debug/dri/*/gpu' works and I get a dump, did =
observe these errors in dmesg after though:
>
> [   42.891106] platform 3d6c000.gmu: GMU fence error: 0x0
> [   42.891142] platform 3d6c000.gmu: GMU fence error: 0x0
> [   42.891157] platform 3d6c000.gmu: GMU fence error: 0x0
> [   42.891171] platform 3d6c000.gmu: GMU fence error: 0x0
> [   42.891184] platform 3d6c000.gmu: GMU fence error: 0x0
> [   42.891198] platform 3d6c000.gmu: GMU fence error: 0x0
> [   42.891211] platform 3d6c000.gmu: GMU fence error: 0x0
> [   42.891224] platform 3d6c000.gmu: GMU fence error: 0x0
> [   42.891237] platform 3d6c000.gmu: GMU fence error: 0x0
> [   42.891250] platform 3d6c000.gmu: GMU fence error: 0x0
> [   43.640122] ------------[ cut here ]------------
> [   43.640137] msm_dpu ae01000.display-controller: [drm] crashdumper time=
d out: status=3D5c00bd00 (-110)
> [   43.640222] WARNING: drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:115 a=
t CD_RUN+0x20c/0x594 [msm], CPU#3: cat/1929
> [   43.640419] Modules linked in: rfcomm q6apm_dai q6prm_clocks q6apm_lpa=
ss_dais snd_q6dsp_common q6prm algif_hash algif_skcipher bnep snd_q6apm pan=
el_raydium_rm69220 fastrpc qcom_pd_mapper ath11k_ahb ath11k mac80211 hci_ua=
rt btqca bluetooth qcom_iris cfg80211 ecdh_generic msm ledtrig_pattern vide=
obuf2_dma_contig ecc v4l2_mem2mem drm_dp_aux_bus videobuf2_memops qcom_q6v5=
_pas ocmem qcom_pil_info videobuf2_v4l2 pwrseq_qcom_wcn gpu_sched ipa pwrse=
q_core qmi_tmd focaltech_ft3683g qcom_q6v5 drm_gpuvm videobuf2_common drm_e=
xec rfkill drm_display_helper ubwc_config cec qcom_common mdt_loader libarc=
4 nft_reject_inet nf_reject_ipv6 nf_reject_ipv4 nft_reject nft_ct nf_conntr=
ack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables uhid fuse usb_f_ncm u_ether spi=
_geni_qcom evdev libcomposite
> [   43.640750] CPU: 3 UID: 0 PID: 1929 Comm: cat Tainted: G S            =
       7.3.0-next-20261026 #3 PREEMPT(full)
> [   43.640763] Tainted: [S]=3DCPU_OUT_OF_SPEC
> [   43.640770] Hardware name: Nothing Phone (3a) (DT)
> [   43.640778] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYP=
E=3D--)
> [   43.640787] pc : CD_RUN+0x20c/0x594 [msm]
> [   43.640972] lr : CD_RUN+0x208/0x594 [msm]
> [   43.641155] sp : ffff8000891c3990
> [   43.641161] x29: ffff8000891c3990 x28: ffffc3ee34aef850 x27: ffff00080=
9253000
> [   43.641180] x26: 0000000000000001 x25: 0000000000000001 x24: 000000000=
0000020
> [   43.641198] x23: 0000000000000000 x22: 0000000000000000 x21: 000000000=
0002114
> [   43.641216] x20: 0000000a28796b5c x19: ffff000813d7f000 x18: ffff80008=
91ad078
> [   43.641233] x17: 3a74756f2064656d x16: 6974207265706d75 x15: 646873617=
263205d
> [   43.641250] x14: 3fffffffffffefff x13: 0000000000000003 x12: ffffc3ee5=
c6649c0
> [   43.641267] x11: 3fffffffffffefff x10: 0000000000000003 x9 : 9e14538c7=
7bb2600
> [   43.641284] x8 : 9e14538c77bb2600 x7 : 2e30303031306561 x6 : 207570645=
f6d736d
> [   43.641301] x5 : ffffc3ee5cb061bf x4 : 0000000000000345 x3 : 000000000=
0000000
> [   43.641318] x2 : 0000000000000000 x1 : ffff8000891c3790 x0 : 00000000f=
fffff92
> [   43.641336] Call trace:
> [   43.641343]  CD_RUN+0x20c/0x594 [msm] (P)
> [   43.641530]  a8xx_gpu_state_get+0xdc4/0x2698 [msm]
> [   43.641714]  msm_gpu_open+0xc0/0x134 [msm]
> [   43.641898]  full_proxy_open_regular+0xe0/0x1e8
> [   43.641913]  do_dentry_open+0x154/0x4d8
> [   43.641927]  vfs_open_consume+0x40/0x114
> [   43.641939]  path_openat+0x440/0x6a0
> [   43.641950]  do_file_open+0xdc/0x198
> [   43.641960]  do_sys_openat2+0x88/0x118
> [   43.641972]  __arm64_sys_openat+0x78/0xac
> [   43.641985]  invoke_syscall+0x6c/0x12c
> [   43.641997]  el0_svc_common+0x98/0xf0
> [   43.642007]  do_el0_svc+0x28/0x38
> [   43.642016]  el0_svc+0x4c/0x1ac
> [   43.642031]  el0t_64_sync_handler+0x6c/0xe4
> [   43.642043]  el0t_64_sync+0x1a0/0x1a4
> [   43.642056] ---[ end trace 0000000000000000 ]---

Hmm, not sure about this, other than maybe whatever is causing GMU
fence errors is also causing the timeout?

If you run something that keeps the gpu active (or disable ifpc), does
that help?

BR,
-R
