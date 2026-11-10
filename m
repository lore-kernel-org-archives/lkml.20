Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794308113;
	b=XSJoDYhgKvhh29b37HVU/JJRZ0HPCrKax8EvBYB3A2606L8hTmHOzGOqnVEMAJ7Q+ft0
	 PkTXj74T6x3+zuIoeuSXPoYU2oyOfwScAmnw10AGFPaXrXaAPcQE5wNjFOaI+L4qDqrUS
	 erlE5n2SDDrJEkx3LHMgjUhDNCpFw99CmnkCjA5jgZT5Z3Ohu2SQEo8OeeJY/lonbLow1
	 TlgLCzCapyKVJ6Xsps0fhjFmXbg7IaXg7ZvfN7WzzW64NClzQ57ehKHw4zxzS/uS/swda
	 i3wOXrhGXVugUuObk+Yrf60RjjwQxCV4ZwuzqYXTevWuB/I8ir4zDdcbUhK9LXLDZ5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308113;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=;
	b=XXUc0HAwZC5cTgH81VONW+2c8jhJQ7HTuVfdyJ6/MBNiUQMMhs1cdLyZbqiCcYMD6gwZ
	 11xUpPVVsh0qAPXns8Sj6Y6PB328pRSlEn1xB7Br7pPryh/saLiar6/SdXh4oVWAEpn9c
	 pKTGffQpFSABxTAAThxULnjfPBphjVkDH1T5j30rkqi+4CHM1Qw075b+Dzy0BRKgsG6zC
	 /SUNT96Gndty53GcBJxwvWJfVO87816+HOr55jWvKJjD4sXSuyWecGktrBMCKR6Lh0QW1
	 wbYq38B9lTjKp+OdUwLr8TbAZF0EeoF0TC3IDY0meLgMTfRxLjR6qm5EZs24K7Zp7vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d27fe/gl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bf3ZGGGx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E7E60A260A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E7E60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d27fe/gl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bf3ZGGGx
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lFHX2240837
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=; b=d27fe/glQtKvSlKW
	CAKbr0p3yZ+zq7kpWozN7Of0wddOy+GbY8+15C74oKoRd6X8fM/xNQfXPyA2eF6c
	70y54o1E5S+YPwH+hVQkiQWDpXyviMaXUXWBWdcGYfZRdhBj2IDPVPvn1f26O9WH
	RcRE9boj8DQnBC5yoRcDxl435ldSMAPqY4JrLiQ0+7bBQB/8m7qwhQzr3u0BiaVr
	Jtyle+CtQP0IIxB9fbJbou3IYe/4rSFaev5s43I7bsNNtIUCFPmq2nvcqNcE6C/g
	YZneFWIHNazWtm00fYAEalEeb7Y2NL+Z4qUb87sEQ6plV6Ev0f8jGcwseKsPdWic
	ZRqm8A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp1mq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea446ea8c9so13056715ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:55:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308111; cv=none;
        d=google.com; s=arc-20260327;
        b=fsm1VlSoSTgMLamGREg9HZ/5lvjBXr2Ptgqc9cY7ujsulbqY+riSvJ47DuMIYfe8jI
         juS+ZZv4Hxc0nSJL5Z3cWKacRe2CzfjHg/ZrbRVyCpzVj4MZ54MplL8/JLRLlIoNBxij
         Yer2HCA+dlN9KBwITlSlIXJx5AUyXD/OuZP/zcjfxF9avSTgAfHYLVtKA3dahZxyUOfC
         z+KYKov25zbiJMiGR4rvZ5QZKHFLcpkJ6oMzDCyaRYYLrAr21DcJAE4ACJwVuWvsIKWN
         rFbX7Z6RUiM5NA5wEdaU9eu/MD4rRG1xnyWA4aeStNp5Kps9U1aUFFP/449qkPhwOvEA
         jfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=;
        fh=iSbPu296sc4o2kNQzzjgRB8ifM0V9u44gnYjy+GzFes=;
        b=XcHegH/JAK4PGgCqM7QlDF4xKt42SI/v324t6c7r7/1Nn/mIlA+q1+G2VcRAAGonl5
         pLZPmLMGicOF/x/RJs0ShBJNgK8um6raFjQWAyCiSL8t9T178NtTpPQ9UYdBJoBc3wSI
         jBvLMeqfuv6TyH1goe4PmPUGJwCcDRIo9GrvIZ0iHlJ5Gm0bep6NfVE/rfyHYq+tr62M
         YkfkFyrcdCxZxHGgyT+PouMMrUfkS7VYmVHiV6rA8n3hwsYCgXbmA7azdS/GrvxxIti+
         sHesTuN4WHdv0cE6+N81M/7U/ZsOfLsCbgxQQ9gNEEppL7jKqZf5M/EiXz2HQl1sutE+
         mjfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308111; x=1794912911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=;
        b=Bf3ZGGGxK8PohCuLdp+XsIW9ySdOljx5IfeCJjwILBRmKwnUfFQRLhijFUGI0iVKi5
         a2W+aBzvVPZdiSi3FZ6ohiskzTG3s8ck8SzRMXTbDnBWuP478dxZRZdoyM+y1WveofSx
         iFNIoAhn39XqTy66/3rjiH1aCCtxnckoHHaOvG1/CmhegFz/Y7vuGsE8zEE9YMY0Md4a
         iBoAZkVOHmqfNqtCCEYOMmA3j4saBX1xXXpiBndqXwei1w6CcEiT8q0mzh+oK3FMzJhp
         L9llN8u31otA9I8DA0c89hF5Rr7pAIWn6thVfz9oQtcrMMapNdFHfcsSqKF3NUgAYSa9
         /y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308111; x=1794912911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FbM2beT/ufH5KYufSNvf3zwpdmcVzR6lfg5amoABbYM=;
        b=RiewLfugy7l3f6csYqplfU7fGQ10Cu8ksZXo7MYBv7sNWcngZnorXR7fYSzDFCSKNG
         EDGPIvfQaZqvlbPiAPx7ppBPMHRSDDtkXf0mqCiGtPWd8hBmPB8y9XkJNQAzczzejYDC
         Y4WeEG3H8MJ7qOiOShakXhgS9Lxn6dQojt/5gnXfWZ4rfAXw+w5qlq8YO4KWGFJG5JY2
         hlMdRQ0t6cLaOuZvZ7PCDeoiLD0Dq/S0Mieh0SeJPEoK6C3yTovXgOPEbM/Ql74W+T7Y
         2yirnlDccGVzfZbBRh1tE9EIHpeAY6Nidq/kir+E56Vw5QQk9vETdXlH94Qwlwu5Igjn
         Fc/Q==
X-Forwarded-Encrypted: i=1; AL+hErElEP4B4izGlFsvPm4dmrk+d2k8H8RnhxWSOvb3CqUxza+A4YKTRO5GaKdyu5RYRVW6TEOxWeohVrDeVTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QxwqCRGmjqh9SoF7QXzE4IrnEQ0U8IEiCLbzlo6BrwGfBUpbl
	1hT+HXtbEDKke/7EsaBOxswOzh4FQOSPT3aO5ZH1TusVPMne+cvhSlu3zK+5UOK2L3R61lOrQYs
	a84RMq+wR6A15gBiAjjopoD/F3KabIkXAisWOfDH5W59Nv1NzqqNGq+pvNf2/Hdk92oUNCb3z5c
	ZIA21dJaWqaxeSUsf7yvC2eGBuSCYGlnkRo2tJMm769Q==
X-Gm-Gg: AYBFou2S3FncL6qYtyL7wbZWg8ZmUfscE20TZPj6cfaLqxsols70gvKjRkdKEwtGtTP
	A1SuM15rdLdMA3HLdULS0oAuPzqlFCBGYd3QhR5X4ms6vAoOw6oo1wEWrUwXnCogUlp+IKZRi2s
	uDeQbBpgHwNAElmKFNlV8Mlfo1IMSnnDhqRJELmD78q5r29bpnDLmxIMHfig==
X-Received: by 2002:a17:90b:534c:b0:3b0:a757:e370 with SMTP id 98e67ed59e1d1-3b167a3863bmr1285322a91.42.1794308110754;
        Tue, 10 Nov 2026 02:55:10 -0800 (PST)
X-Received: by 2002:a17:90b:534c:b0:3b0:a757:e370 with SMTP id
 98e67ed59e1d1-3b167a3863bmr1285304a91.42.1794308110234; Tue, 10 Nov 2026
 02:55:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006025318.503422-1-nils@buechner.me>
In-Reply-To: <20261006025318.503422-1-nils@buechner.me>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:58 +0100
X-Gm-Features: AclHuK-yZm3sakUxzv0BiFEttCIYN0ZmBsfWxz8lFwhcgpjwm5RE5v-I_qmF6-U
Message-ID: <CAPx+jO-18BxWDeKWrib+GaKNiy_DAjUqtT2-s2d9YgYtObJgXQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: Don't power off default-off domains
 in probe cleanup
To: =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: bYR2lAw71UnuuiGknNuzQstRqfMspPg1
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2f80f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=t40qi2bwvM8u8KFdrioA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfXxqM6Pz1+VLnG
 7D8BPg4jd91If9WLlyrB2RJs7iH3qhxGR7SzMvwhigAq93OC5pXi+KfcGlBuivC6nuE9uQ7JAej
 ilawxHuFNQUGK+Ot9+u0OOGxDI9/aSgyk6Nmns6WIjeIYLWKbttoFMe43fm2eGguJnwLG2rh6zH
 UQTDtj3viUk9Trch9nqd4DEytMGhgEvY2fDKWlB/D7X+rV1hbCFzN8HnROKxUiNPBY3b1EDe2tm
 vf0epKYrxx9VDM/b+/OH3eQIfhmNz/kdYq/pveUrztmHSiADgr+4m9toB/OLI/wNPxDRWPt5ls4
 c/U6RgazQ4aUHdnSmlL9wRFWj+94T1ziLOQkuIrEI9cQHaQdIEtURC9PwCZGGYwAJqvDdIZ1aa1
 9jBB5gxqwphFgG6WcJ42ce0ydE2itllfzRnJ8WRJvKyxC3YWx6wLMRCMua9batPbbMDeymw8Z3H
 LV3qj1nZ9fVunYwlfNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfXxCcb8yF1mDeu
 uHOnM8LYsmXLv5Gxq9m86nhpFgLDSTSLNTIhY0GJ1EzqsTMf2LnCpT6I0CRgOTUHp7nNEjsbGS6
 YFnFNh9Ct08dPTxy00r6a8THVf4XRs0=
X-Proofpoint-GUID: bYR2lAw71UnuuiGknNuzQstRqfMspPg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100043

On Tue, Oct 6, 2026 at 4:53=E2=80=AFAM Nils B=C3=BCchner <nils@buechner.me>=
 wrote:
>
> scpsys_remove_one_domain() runs the power-off sequence for every domain
> that reads back as on. Domains with MTK_SCPD_KEEP_DEFAULT_OFF are
> registered with genpd as off and are never powered on by the driver
> before the provider is added, so their clocks are not enabled. When the
> bootloader left such a domain on and scpsys_probe() fails (typically
> -EPROBE_DEFER) after it was added, the cleanup disables those clocks
> anyway, triggering "already disabled"/"already unprepared" warnings from
> the clock core.
>
> Seen on MT8183 Juniper once the audio domain is KEEP_DEFAULT_OFF: six
> clk_core_disable/unprepare WARNs with backtraces on every boot.
>
> Skip the power-off sequence for these domains; only drop the clock
> references.
>
> Runtime-tested on an Acer Chromebook Spin 311 (MT8183, juniper) with a
> 7.0-based kernel (the hardware is not set up to boot mainline);
> build-tested on mainline with W=3D1. On the device with the audio
> domain marked MTK_SCPD_KEEP_DEFAULT_OFF: the six clk core warnings on
> the deferred first probe are gone and audio still works.
>
> The change and this changelog were drafted with an AI coding assistant
> during a debugging session on the hardware; they were reviewed and
> tested by the submitter.
>
> Fixes: c1f3163d8ff3 ("soc: mediatek: pm-domains: Add default power off fl=
ag")
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Nils B=C3=BCchner <nils@buechner.me>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>
> This is a follow-up to "pmdomain: mediatek: mt8183: Fix silent audio
> from premature sync_state" (sent 2026-10-05), which marks the MT8183
> audio domain MTK_SCPD_KEEP_DEFAULT_OFF. With that applied, the firmware
> leaves the audio domain on at boot, so a deferred first probe of
> scpsys runs into this cleanup path on every boot. The fix itself is
> independent and applies on its own.
>
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index f0fa79e01..2b41bb8ed 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1100,6 +1100,16 @@ static void scpsys_remove_one_domain(struct scpsys=
_domain *pd)
>                         "failed to remove domain '%s' : %d - state may be=
 inconsistent\n",
>                         pd->genpd.name, ret);
>
> +       /*
> +        * Domains with MTK_SCPD_KEEP_DEFAULT_OFF are registered as off a=
nd were
> +        * never powered on by this driver (nothing can use them before t=
he
> +        * provider is added), so their clocks were never enabled. If the
> +        * bootloader left one on, running the power-off sequence here wo=
uld
> +        * disable clocks that are not enabled.
> +        */
> +       if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> +               goto put_clocks;
> +
>         if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_VOTER) {
>                 if (scpsys_hwv_domain_is_enable_done(pd))
>                         scpsys_hwv_power_off_internal(pd);
> @@ -1108,6 +1118,7 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
>                         scpsys_power_off_internal(pd);
>         }
>
> +put_clocks:
>         clk_bulk_put(pd->num_clks, pd->clks);
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
> --
> 2.53.0
>
