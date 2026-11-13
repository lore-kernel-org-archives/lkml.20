Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592148;
	b=Vz5nF7mCOBkflJbaZ1cDm4JOeDSU95+qV/dsIi+ffY+s1MhYaa/Rp8TuugCD0rwSLd/7
	 KkDFiq6vsDYCzuJ8+WTg+NfE0/3xDgqXeusKrmGH7wimlHLfYMtWyd96eI327zaSsiGMZ
	 9E3fUzfdLundoD5CHkj9NuVK7XUvCUODCbAt+QOJVE+IKySdOFc0xapCH2FUhbKdaCdha
	 caoaSoMiokZkqu26S8tLiJ3u7YLr5TFGF/nuBZWmTrohCdX+eruLETjBdZknsOpI8G9Cq
	 HthHin71h5VZsTU9IwFOk+HZywskLohKni7U8OqYv8GY6QKA3D9HRXXyGJCgh+hxVIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592148;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h7ZMjOHZnub7I02GGs2+ZNq38w9ZfRd8s4DzV2qSzx4=;
	b=Kgn3l8oWMe4qPpbXlW+w0vasWQvj+C+Aj1w2T6ulQ5CeRfYatrcWipWfd5uwSB1w/otn
	 0rGmuR/oAIfqf6zVq1CogdgGD22ijTZnc1uBa7DX3xhIWYPdeQr8j6vKqU1jRgihG9Bzk
	 4XX8fSVee0vTZO3N/CWTdEMDIf2Gii3c3YKEMfao0mWdUMyWTpwjOK8Ae4wvQ5+3q3nD0
	 UwffWMpxjH3tmkA0DeVRCnT2NA+x00gLM5IrKB31JuOWBnMp70uP89COv4SJHarPHpFOt
	 WDznuRj8X/tuubaXfSVW52hyqNvkE/YGVQidGjGtFZKlNlTLLQuTI2MlckCPgJMR0xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dd2YORBp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZKgA8Ux;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5EA6079D5B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B5EA6079D5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dd2YORBp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZKgA8Ux
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR1oR1011383
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7ZMjOHZnub7I02GGs2+ZNq38w9ZfRd8s4DzV2qSzx4=; b=Dd2YORBp7MJYX8GR
	WMxdTmllHObR7E31WjlBbKI/1aHD9DXvwhN4/JFeb9FOinbvyqhZzG9w2U2krmuf
	U5L9GnSKOmR3KbR67NLZpwtNC1yl/9DQVus402t3tDOVbInxwsfvsujM/rKo6oR6
	nzzDC3r/Jyy5vw5VS7ol+iz3dXp+mX5XRvgzMPL0ywUzDgf81zCbt5Qj8vr+DZLH
	hggBhc9r+rTrBQITwdOnzIeqXfzkrqNZ43BtLiosV5iheoX0+JvsHSHkt6nxJNKY
	nYm2koN3rnjwYAgXvcC0vk4p2S2W1/tsdkCDfTVZh8mTgj37DFuj7ZwY0T1tMXNM
	vWWkiQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdm9w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:49:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b09a466295so937479a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592146; cv=none;
        d=google.com; s=arc-20260327;
        b=eN37tRb/gq03qN+esxG9sCyjRBU4X4huRUXrMv3um8yS4nnZoWVUzvo7//epZm4O4g
         td8CuaYS5amsHHrudOeskWkKmnE56LFBMxr2C9pfLc785JNRguczcAlIWaGf0tJzREKG
         IJ+SqbK+/Cj1ZH9PvPpRrIYctumfVfU7QVkprR2njoV66mHqChhgKWTH4LhtJHx0FeNy
         b3XtQrNePygUMkoyRS0n+uM5Mxvr3nFXr5YzkFFN8WnCrR7s7YJXqbN1COiSo3T2KHsw
         ivdCl9Fe19xnE+WqyPtEu+TkJ9P9WYfYMz3y6C6f/QXlhZPGTKgEm1qVP9G/FPsPJZqG
         2nEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h7ZMjOHZnub7I02GGs2+ZNq38w9ZfRd8s4DzV2qSzx4=;
        fh=36rtdYK6d2yTDS/lz399Z42VbSOqr289SN7q0Ystz1k=;
        b=f6t0Nd133tR5TFsKRYpD80QTQwocNf1AnmAHwO1hvdxrwls0nnGngt3dWGsp4yR6Mt
         gxwR7aRGLsYOytyiYAoQr8LWbv6kJ7a3qjoP6SYE9028iE33NV0i0B6VZFR0SLGic55d
         06hTFYtCpjV1PdmkyTpEKggHnNOFRpgwSc0eWedWN8ia/mkhoTwqEDW+RCkcVCxyfhfQ
         NTiILhAsRCepnNOdmoGVGd3bNT+njA91pM09ZU+zAPjzKC1QFWJKEe+zuYv7UUo28lWo
         qz17GolEvSy2aAUBsI8FciviXzlfmvbDBO4cjM1iQR1IjoyX/D6DmeKFVqBhByUqxzAk
         crzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592146; x=1795196946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h7ZMjOHZnub7I02GGs2+ZNq38w9ZfRd8s4DzV2qSzx4=;
        b=eZKgA8Uxe9vc+C7/19XrPKEOsprszcU6Jy4jahhbXaNGqOrIY9g5eDfoNnjW2fmy9s
         s1EcDnnY+PF41b/HdsOaqCcaqywMkx7vOue9pqAyP9WB+6iKHbkuPKYjgX8H+J6XvV+a
         LIwssgclUOseCBPJpIXIGuCM0ngYesxKL5Wj6r6EpeuC4BUwgvlvJ2mJtSLdje3EmUTQ
         rIBofXh/dRyeC+Al43zcPQ61RevdKt0/wTNIfGpCLkAeCwSZMz9RMWqGRhJ34+8dtIqJ
         6xX6p2bhTp16B41TkqJTMbDxDOauJBfPZC/Ow9Jb3RhQm07pbk1rPN5KIpDTUjGaNcFR
         BKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592146; x=1795196946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7ZMjOHZnub7I02GGs2+ZNq38w9ZfRd8s4DzV2qSzx4=;
        b=Xoaywog818tplzhWV6sSu92QQ3vPtDrWQSJbRwPeCHDzz7E8jmqh53VgGmhVtJS5SZ
         QgSdqskmCVAFu+N296rUcGWoU0Ea7dNMEgISB9fPX31cXtwfAdJdM0ppZFrIBDSRfEPV
         Wv5LBL8O416Qg4fCEKIHikKXsZFqOJAw+z+Vd/1L6ijUtMaWY3QhwzEcArZSYJMG5h5L
         9zfV5XTwHqPhXlmwmPBBtUpLrGq5gXPEhxRAAqJDRjrbMEvXIzKBWIty9iDUJ72W9naA
         0bHZgNpMTkpuMWLpcHeZynrxI6Ebkg66gT0xtLkM7Xsq6Qbw8zeMqYJQfeZgyNVEk55u
         BjZw==
X-Forwarded-Encrypted: i=1; AL+hErEpNtthYA649K8MRrpk8qkEdzkJLxjiQaAUoWXD+bRGVQunCRvfik3CnvB6P6YekyHJ2+VQuhm9LHn8SzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8itJ2defYznhOu64vv+ws/PWa6S7Wav+5N37QM/TmchopfrE1x
	b0yI4lcYItvZph2PqtTKiLaOM62J+IinvQyM1+i/3etD5IAy9p5i8aslKhvz9nmrtojF0oNDw8q
	vLm3heZYT2h9J1vczLTt6+3YtQ5imbyo8hNo607rdI+CMKyzh6d2S8wZZGGbgFrHMVYLoh06Qm5
	A6y6uS2WZgChS0uetVJNJAjfYw3qkqFNjZMmLBULdmfw==
X-Gm-Gg: AYBFou38iq+ThbZaxpvF3HR5lAdQbB6FuMtfhCuEgllTE3uLz8BxkW7iFaagX4Vofmv
	pMg5fb8jjDcsquTSSqDLRRAP1QYoafOyyGPJlaQtv0c/3DJMm5rpjpJxqxg/2hiTiwPeQXsNZ8J
	1Ll/xbXKgKmGwFvhVSKA9d0YnXcvmi20tIZCxsl82Qz38HmyVSMqQ90vSuOw==
X-Received: by 2002:a17:90b:3eca:b0:3b0:b64e:1e34 with SMTP id 98e67ed59e1d1-3b1b0ba6480mr3020201a91.51.1794592145880;
        Fri, 13 Nov 2026 09:49:05 -0800 (PST)
X-Received: by 2002:a17:90b:3eca:b0:3b0:b64e:1e34 with SMTP id
 98e67ed59e1d1-3b1b0ba6480mr3020179a91.51.1794592145385; Fri, 13 Nov 2026
 09:49:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-rbrue-suez-upstreaming-mtk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com>
In-Reply-To: <20261101-rbrue-suez-upstreaming-mtk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:48:53 +0100
X-Gm-Features: AclHuK_o-18EjhupOpQOHXsSHQhEk8A1OgSO8CQWrvzqq3tyYIcyEkcdDS0ZD6Q
Message-ID: <CAPx+jO94U8b_PNJbbuzzFtF2HFeM7sYaT+oZoLJUfvThXkFYjA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: Don't power cycle domains on probe deferral
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Enric Balletbo i Serra <eballetbo@kernel.org>,
        Matthias Brugger <mbrugger@suse.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXxrIx53aFoj9x
 1Ai7FB6bJf3wheOPUg8BZGz07juwzfxKuRSrdhj/S3lILaW8hMkhuk5hT/mwzQ7axUbWP7B3YWV
 OkDF0laOEy3ME2Azr2OsmezTuG4C0Us=
X-Proofpoint-ORIG-GUID: VZpWTMNCH1zsBWawSCKrqwTfrN8KiMFi
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af74d92 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=qXiDfWie0P3iMaLS2MUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXwatZ58KA00jw
 /hiFGcuJzrzkpAuXy8yfH7oWSrwnexmRoLycdOpVNDzULObe5VUMeZ+nI6pLVxXxPtNzelWdHTw
 1YSgdXyDuIpjimLzWyM8qEu38OWDkwoilvdMdyPjH209CLDzTZjecETipvRAU0zQHioJsGUFJ5X
 Hygl2SrA7dt6qZhQLux13Kfn9yLPDxr5zXrCuQNZ0tPDIXhDASsvZgqJwvEtN+54Ee9pWG53KbA
 osmF2KTjFyenYsraBylcxAqmAY0YJ64zswT+ubQo6lDE7magEVHOVUZjbm7/7poY7cWk7Ebmz8s
 WPMvKhH995VuGSbrSWAsrGtHVWE4wn0Jx2cuk4fKZArJ7N2/1qKM4oCSBG5PjuDtHzDg4cpRsL7
 n8XoyxWcEZ/4S4wAwUlGtx3/AmFUBP+msXEKsjH7PD4rQtmNtDT/q6j/RKtHMzaes3h+i6WnJFT
 zPscuFl0oo0jQOfWBmA==
X-Proofpoint-GUID: VZpWTMNCH1zsBWawSCKrqwTfrN8KiMFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

On Mon, Nov 2, 2026 at 6:44=E2=80=AFAM Ryan Brue <ryanbrue.dev@gmail.com> w=
rote:
>
> scpsys_add_one_domain() powers each domain on as soon as it is added,
> before the probe has looked up the supplies and clocks of the domains
> after it. When one of those is not available yet the probe defers, and
> the cleanup powers off every domain added so far, whatever state it was
> found in. The retry then powers them all on again.
>
> A bootloader that leaves the display scanning out does not survive
> that. On the Amazon Fire HD 10 (MT8173), mfg_async's domain-supply comes
> from the MT6397 PMIC, which registers after the power controller first
> probes, and power cycling the MM domain under the running display hangs
> the SoC on almost every boot.
>
> Power the domains on only once all of them have been added, so that a
> deferral leaves the hardware as it was found, and on cleanup power off
> only the domains this probe has turned on.
>
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

This looks good to me. However, the patch no longer applies to my
fixes branch, due to other related patches being queued.

Please rebase and resubmit a new version.

Kind regards
Uffe



> ---
> Found on an Amazon Fire HD 10 (2017), an MT8173 tablet whose board DTS
> is not upstream yet. Its bootloader (LK) leaves DISP_OVL0 scanning out
> when it starts the kernel, and the MT6397 regulators register about 50 ms
> after the power controller first probes, so the probe often defers.
>
> The deferral was forced for the A/B with a local test knob that returns
> -EPROBE_DEFER at the first domain with a domain-supply. Each boot attempt
> was counted from the host's USB log, since a hung board is reset by the
> watchdog into the same kernel. The hang does not happen when the
> display is stopped before the power controller probes, which is what
> our downstream kernel does today.
>
> elm, hana and the MT8173 EVB also give mfg_async a domain-supply, from a
> DA9211 on I2C, so they probably take the same deferral path. Whether
> their firmware leaves anything running across it, I don't know.
>
> Only MT8173 (direct control) was tested. The HW-voter cleanup changes
> the same way, powering off only what this probe powered on, but there is
> no such hardware here.
>
> This patch was developed with the help of an LLM.
> ---
> With the deferral forced at mfg_async on every boot and the bootloader's
> display left running, 61 of 63 boot attempts hung before userspace
> without this patch, and none of 5 with it. With the patch, the cleanup
> left MM on as the bootloader had left it on every boot; without it, it
> powered off all seven domains the probe had turned on, MM included.
> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 60 ++++++++++++++++++------=
------
>  1 file changed, 37 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index f0fa79e01f9c..6a81aadc18f3 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -982,12 +982,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scps=
ys *scpsys, struct device_no
>                 pd->genpd.flags |=3D GENPD_FLAG_IRQ_SAFE;
>         }
>
> -       /*
> -        * Initially turn on all domains to make the domains usable
> -        * with !CONFIG_PM and to get the hardware in sync with the
> -        * software.  The unused domains will be switched off during
> -        * late_init time.
> -        */
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
>                 bool domain_is_on;
>
> @@ -999,15 +993,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scps=
ys *scpsys, struct device_no
>                 if (domain_is_on)
>                         dev_warn(scpsys->dev,
>                                  "%pOF: A default off power domain has be=
en ON\n", node);
> -       } else {
> -               ret =3D pd->genpd.power_on(&pd->genpd);
> -               if (ret < 0) {
> -                       dev_err(scpsys->dev, "%pOF: failed to power on do=
main: %d\n", node, ret);
> -                       goto err_put_subsys_clocks;
> -               }
> -
> -               if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
> -                       pd->genpd.flags |=3D GENPD_FLAG_ALWAYS_ON;
> +       } else if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON)) {
> +               pd->genpd.flags |=3D GENPD_FLAG_ALWAYS_ON;
>         }
>
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
> @@ -1085,7 +1072,7 @@ static int scpsys_add_subdomain(struct scpsys *scps=
ys, struct device_node *paren
>         return ret;
>  }
>
> -static void scpsys_remove_one_domain(struct scpsys_domain *pd)
> +static void scpsys_remove_one_domain(struct scpsys_domain *pd, bool powe=
red_on)
>  {
>         struct scpsys *scpsys =3D pd->scpsys;
>         int ret;
> @@ -1100,11 +1087,10 @@ static void scpsys_remove_one_domain(struct scpsy=
s_domain *pd)
>                         "failed to remove domain '%s' : %d - state may be=
 inconsistent\n",
>                         pd->genpd.name, ret);
>
> -       if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_VOTER) {
> -               if (scpsys_hwv_domain_is_enable_done(pd))
> +       if (powered_on) {
> +               if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_V=
OTER)
>                         scpsys_hwv_power_off_internal(pd);
> -       } else {
> -               if (scpsys_domain_is_on(pd) || MTK_SCPD_CAPS(pd, MTK_SCPD=
_SIMPLE_PWRSEQ))
> +               else
>                         scpsys_power_off_internal(pd);
>         }
>
> @@ -1112,7 +1098,8 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
>
> -static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx=
, u8 num_probed)
> +static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx=
,
> +                                 u8 num_probed, u8 num_powered)
>  {
>         struct generic_pm_domain *genpd;
>         struct scpsys_domain *pd;
> @@ -1124,7 +1111,8 @@ static void scpsys_domain_cleanup(struct scpsys *sc=
psys, u8 *domains_idx, u8 num
>                 genpd =3D scpsys->pd_data.domains[pd_idx];
>                 if (genpd) {
>                         pd =3D to_scpsys_domain(genpd);
> -                       scpsys_remove_one_domain(pd);
> +                       scpsys_remove_one_domain(pd, i < num_powered &&
> +                                                !MTK_SCPD_CAPS(pd, MTK_S=
CPD_KEEP_DEFAULT_OFF));
>                 }
>         }
>  }
> @@ -1361,6 +1349,7 @@ static int scpsys_probe(struct platform_device *pde=
v)
>         struct scpsys *scpsys;
>         int num_domains, ret;
>         u8 num_added_pds =3D 0;
> +       u8 num_powered_pds =3D 0;
>         u8 *added_pds_idx;
>
>         soc =3D of_device_get_match_data(&pdev->dev);
> @@ -1436,6 +1425,31 @@ static int scpsys_probe(struct platform_device *pd=
ev)
>                 return ret;
>         }
>
> +       /*
> +        * Initially turn on all domains to make the domains usable
> +        * with !CONFIG_PM and to get the hardware in sync with the
> +        * software.  The unused domains will be switched off during
> +        * late_init time.
> +        *
> +        * Do this only once every domain has got its supply and clocks,
> +        * so that a probe deferral leaves the hardware as it was found:
> +        * the bootloader may still be using a domain that is already on.
> +        */
> +       for (; num_powered_pds < num_added_pds; num_powered_pds++) {
> +               struct scpsys_domain *pd;
> +
> +               pd =3D to_scpsys_domain(scpsys->domains[added_pds_idx[num=
_powered_pds]]);
> +               if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> +                       continue;
> +
> +               ret =3D pd->genpd.power_on(&pd->genpd);
> +               if (ret < 0) {
> +                       dev_err(dev, "%s: failed to power on domain: %d\n=
",
> +                               pd->genpd.name, ret);
> +                       goto err_cleanup_domains;
> +               }
> +       }
> +
>         ret =3D of_genpd_add_provider_onecell(np, &scpsys->pd_data);
>         if (ret) {
>                 dev_err(dev, "failed to add provider: %d\n", ret);
> @@ -1446,7 +1460,7 @@ static int scpsys_probe(struct platform_device *pde=
v)
>         return 0;
>
>  err_cleanup_domains:
> -       scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds);
> +       scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds, num_p=
owered_pds);
>         return ret;
>  }
>
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261009-rbrue-suez-upstreaming-mtk-pmdomain-defer-0cc87eb8240=
0
>
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>
>
