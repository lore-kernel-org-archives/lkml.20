Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207759;
	b=29nKYWek10AMeO9yDK4Zx6S1pUh8wFkDRWFRsjY044a7iLoz2MOFWQ+5Ht3Cj3E+aue3
	 l8VE7n1xKz5OzJOZ2T0jJzefHou8FYsHUVu12H3jZiznJQkpZ5zAyUZ92gKriFuGYbE1X
	 Ug5l2MTV5GpLaPNr4is1PExEYCdkWi/wMznRdzpLMLu9ug1MD2kwnfsznQC8aGERNSqwd
	 qyWbg01cdo31nAkgknkU0/SxsyHSk1wOCnVrPnaAKa36TGBqgFX0XjEO4cITNdIyBOxEt
	 4oLC3/Ej0rMiAm6CzCOrjYxzhXCvbevd+T7UbBnqANs/ZP5tc/oeraxI0pa9ooAdqVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b7nsMJW7sValYVhjJXsfkawpLrM4V9tFf1Hx1aaRkSA=;
	b=UtJhGlZPmWwNUrVjNt3E9DsKM0F3qjv61P5fpAJiB3FICbbAWhbm4306qnxofOAbvj1t
	 tyLX8ToF+ESEXrok27dMeNK4Ifu0w8XIgj9XHGSSZH8hVbq+vRD6rnvNh1q3OrAQqAwAX
	 D1Hb72kHNMCQ2U9kA6ngRbaOxWpnziz9iOnacVOFM3OuxEMCQ9mXi8nneMpT/4lScmV/g
	 S8guSNelRzK2fhrjXa62GIYuBSz1ZDl3oHlOWZ3N7cT/z0lgIiLU1w2VZEHq3oeEJN7ap
	 Jzkd/16q8awSSTAeTBtwOM3nOrDhchfdALmaILPr806zMNXkKOrgT6pqvt+8AYj1C8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nzh1hw2I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORUwpGxW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2051A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2051A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nzh1hw2I;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORUwpGxW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB6iG2070802
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7nsMJW7sValYVhjJXsfkawpLrM4V9tFf1Hx1aaRkSA=; b=Nzh1hw2ILcA6fMGI
	UvDuD8hEztdN1udak9xdaOgMfqFj4Apx/POTfIW6zHY7jO0xUfF4pWqGGqM6WMer
	BvXP3cGL8ka2s9O5slyHUcx4rVUT2AJ17zuWVysfLXs7t/2krlr2CKKwosm2vdSJ
	y2+J0TNT3PtvKhxuJx3ZQxzIgi5cki+DzF3AfJxSTDOaFcIeJRhPFCYq3lArSVx7
	H3IPHBrMty9croHEqkOk5d20A2hWN4cPhyhCTfA2JJ04QRECuKJTakwEfGCTry+a
	jQLJQ2inyPcF7Ja+ltCx0w59kKRsV4B8DR4dOH+56Wbv0lZ32tSqwJXDFnwaPMZO
	P1e8Rw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7ke1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a08e315b5cso541281b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207752; cv=none;
        d=google.com; s=arc-20260327;
        b=ZmFgRUqpEqYlhp0+v6q57jyH4xXY5zTTfXyCLEmPOJrysq25Jh/BzURiY3YP4pVMkp
         4XdFd5UiO9y0GIyNWIGb0T3V+9NmLKI50JRXKlhTxI0cYPOZQKuMc4Kekp8zpftbHmOq
         JKSczu/BH3lOrK3fS6jUQGzGswQt4NxT8YLfzw+5abu5clZAo0CxTdpQWohUXPpRvPz1
         QHW7vrFLTDbTJK588EoDtLJ2lmxoA82/XXBkTJ3F9zvTUutf53ESAIZECAY6iP8iBUkP
         4natKf5+kezTrXHeZtY3FR/d/3OZ+NO3c8+EQwyXZU+cHqBkFKIwQgojQJkld0FNEny9
         MTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b7nsMJW7sValYVhjJXsfkawpLrM4V9tFf1Hx1aaRkSA=;
        fh=FS5VgAGe6rkGLVZXeeh1lnt5C0qqMlWUcx95+3E4Ufs=;
        b=VnnySBHoscJv4ISNI9uBuiDYqPYNrwfN2k1RiHqDzDjcDJsgBwTj+4rD/ze09dixEk
         apfDBns6RuriNQJYEbJWZMH5X6uL3tylOGwFAq475NsINdjBCs0YjqEcdw1FVnML/zFI
         1dIWpsW6ZnbpxfBe+dLYIRn8ULJ5KZ4xY3JIKSuVNuXTQWzrPZ9S6WSlNs+alcH7fEhe
         9mwETQxEkhvLYpGj/yUgiePg4qRC1YeurMz5F7wET+JrjyFmCu5C0eg8h3/c4kWJVw5c
         KoW99UXJ9N9bui7ygpxNwU8wwRnhVj34SGppR8La5/Dn+g58CEIsDZwEJP9tUs2icmzh
         xy0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207752; x=1793812552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b7nsMJW7sValYVhjJXsfkawpLrM4V9tFf1Hx1aaRkSA=;
        b=ORUwpGxWc8eiNaVIE6y8JZAhJ/4mQCyS408/JepFiY2YiMfW4U/dCEDUrwSRUxH8Da
         PhIEE55sZtp8JL7Tz0hIUyG/FG0gnxJ3BaEHQ6Q2ZxeOGWi5lcoU0/3Lw1bqeVbOE43t
         SVaDa74T7cJVs8f5ThVTS8GjsJr9k5Cq1fwk5/zoYI5zVO51X9nyfWb6JNIzUhAcc10+
         cWQRYUJ/X3gvpFGD3PtpUX8UussG8mVApsAdq5eQ00h3GUlhTCCyqtKUdDXpX+7B2PU2
         6smDqyrZ2RA9ATTfeeEhKTcXPbX3II6lwinnJYKumrN8Kja28myvzvsHvbGuUth4G8N2
         V8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207752; x=1793812552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7nsMJW7sValYVhjJXsfkawpLrM4V9tFf1Hx1aaRkSA=;
        b=flB9xDsODgiTOJqbqs8qSIS0DeL9Zv1m5hTHk10Cha7/Gb0sGcYGde7sIB0eUlqqTb
         3cBdQI1qWUzliV06lZ5Tn6nKlikmV6wyn6/zl87Ii0HzPKU+z9B0DV7LxF0SEw+IRof2
         uldZFf8HqGTo4EFIvy9q9Ktf/tjQodaKcIalpIP8goUQFN8QpC1l1nfTvA3CvoUJ52XY
         NHRV/xDdKA+0nkg+MGHBqZKU5M386eCj9uqNoEBy3dqFJSgI8aSPYf6Q3+yDoh3fgY6o
         jLx7QVtHSYLVvF54/+OKDHGZKBRQhDzYuC+JdEQA+zknzD1mQf9zasKuCdES5ZsbhFLj
         KI6w==
X-Forwarded-Encrypted: i=1; AKwUvBxkhDh2S4v2esDVlAwvr38BmUGn/yW/8moKcFk0aYIrTrY/nMsZuEHI1lH3n/0Dfqn/WViocED+idECZiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKzuvmkukvTTIzwEAgFOe4Y95s5LAPlMB83xnwpQxqs3iFduPX
	9YReag4454KN436l0Ul6PXOU/6r73qmw8ukyqTujAMOl+ulYJLiSyHPItnV0a3u1VgkJtGRwXXd
	/gndTu5FLv0OzlX8yVPrfrn95YcuzVTgn0M40aD2WFMSaOH+PWkpy3e23btns68dJQzX/dzZGmC
	k/dX/ZTRB2mnMYTi8/4Cxz/ylUbAnxAcIS9eT0HJ17TQ==
X-Gm-Gg: AYBFou2hljvB5OHLwruThgyy+X+Ft5myIIiC9HQ3kHt93bToGrIYEMJK7NUEBEKMWG2
	EAayBlmdUkohvakYGzzZDPueE0HppVhLXsJytDQSPuGhob5jWMwMmuJKIQh+TUSAEiHJ/R+BxfM
	gFJOsAwHRRpBndxds5joLVhokuByqU14m+oBsFpZJBAEObxRtWUl3R1ECcdA==
X-Received: by 2002:a05:6a00:2994:b0:89e:584:bb77 with SMTP id d2e1a72fcca58-8a6e85a35f7mr2132744b3a.58.1793207751599;
        Wed, 28 Oct 2026 10:15:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:2994:b0:89e:584:bb77 with SMTP id
 d2e1a72fcca58-8a6e85a35f7mr2132718b3a.58.1793207751082; Wed, 28 Oct 2026
 10:15:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1791292726-31978-1-git-send-email-shawn.lin@linux.dev>
In-Reply-To: <1791292726-31978-1-git-send-email-shawn.lin@linux.dev>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:15:36 +0100
X-Gm-Features: AclHuK_ZhOCJb0opcJpYE-Aw09i0TqaQ7aFbqYnwFkLhA0o6DOoJbAk9H0bxz7U
Message-ID: <CAPx+jO_ghSFY31SJWngfhhEFGmmMxe0cw5sz=LVOadP-Y8wSLA@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Fix max_dtr passed to SD drive strength selection
To: Shawn Lin <shawn.lin@linux.dev>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX3hbz4WPTf5IA
 bvEKLaGubQHyC/qY7RAMAtAJ604IADH2E/h/fDzB0tQTKShR2t4RuiaEJd/aF8mRiJ8k8pSwlDN
 SM9iCs96iqgqnQSY2T5QagJ28XFpMQA=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae22dc8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KYw6s9bVYVx17uabgLEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: OU8aFKVWRLDouH8fLMfd3yBmoViYj5TN
X-Proofpoint-ORIG-GUID: OU8aFKVWRLDouH8fLMfd3yBmoViYj5TN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX17uEyl4Vu6av
 txH7LsPm9L9at3xspMu/OsZiqqeUDx+iyUv7GwOa4YD6wrRafykblzKKrprHxXxppqXwVE+1z0J
 OcTja5CF3pKRVll+VXVaFSAdU6OLTBAo1wWaoT2VgP2kq8eefxYKUSZXFP4qNJJoa6MroCMI2S0
 5G+ti9KMSz0rZhkN5iocLfYNKsLa4olnJA+2KoTEYm5iLiAjtgyCoQV30NiJLJdDgldLoXooGCA
 othbPZ56Ev8NEI8ufV0VpDT2+8V0ECZ/b+WcVthCSypPVBiQzsbpd5g5KxzdqmYouEPrMZ9mJTe
 4/1O4Wi5XxMuLfu0vXVMJIzqD2l9GfzA0GEPybnAzfb53ROLH9XJfQWxaZ67Cdyq+z2ImJgXLLI
 dOwKLUGR5ieB89BtpRSr4NMD7CqP+Wg+ihlQtI7DtUkgry3pK3qDPSyoFn69UcJiaWA/1Ws5CS4
 dm/jJhHQhwNcrn/2UtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280068

On Tue, Oct 6, 2026 at 3:19=E2=80=AFPM Shawn Lin <shawn.lin@linux.dev> wrot=
e:
>
> sd_select_driver_type() passes card->sw_caps.uhs_max_dtr to
> mmc_select_drive_strength(), but that field is only assigned later by
> sd_set_bus_speed_mode().  A card initialized for the first time thus
> gets max_dtr=3D0, while a re-initialized card (system resume or
> hw reset recovery reuse the card struct) gets the stale value from the
> previous initialization.
>
> No in-tree driver implementing ->select_drive_strength() (AMD and Intel
> SDHCI) actually looks at max_dtr, so there is no functional impact
> today.  Still, compute the frequency from the bus speed mode that
> sd_update_bus_speed_mode() has already selected, so the core doesn't
> hand out a bogus value, and use the same helper in sd_set_bus_speed_mode(=
)
> to keep a single mapping.
>
> Signed-off-by: Shawn Lin <shawn.lin@linux.dev>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
>  drivers/mmc/core/sd.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
> index c763efb..5ba4e2d 100644
> --- a/drivers/mmc/core/sd.c
> +++ b/drivers/mmc/core/sd.c
> @@ -417,6 +417,22 @@ int mmc_sd_switch_hs(struct mmc_card *card)
>         return err;
>  }
>
> +static unsigned int sd_get_bus_speed_dtr(struct mmc_card *card)
> +{
> +       switch (card->sd_bus_speed) {
> +       case UHS_SDR104_BUS_SPEED:
> +               return UHS_SDR104_MAX_DTR;
> +       case UHS_DDR50_BUS_SPEED:
> +               return UHS_DDR50_MAX_DTR;
> +       case UHS_SDR50_BUS_SPEED:
> +               return UHS_SDR50_MAX_DTR;
> +       case UHS_SDR25_BUS_SPEED:
> +               return UHS_SDR25_MAX_DTR;
> +       default:
> +               return UHS_SDR12_MAX_DTR;
> +       }
> +}
> +
>  static int sd_select_driver_type(struct mmc_card *card, u8 *status)
>  {
>         int card_drv_type, drive_strength, drv_type;
> @@ -427,7 +443,7 @@ static int sd_select_driver_type(struct mmc_card *car=
d, u8 *status)
>         card_drv_type =3D card->sw_caps.sd3_drv_type | SD_DRIVER_TYPE_B;
>
>         drive_strength =3D mmc_select_drive_strength(card,
> -                                                  card->sw_caps.uhs_max_=
dtr,
> +                                                  sd_get_bus_speed_dtr(c=
ard),
>                                                    card_drv_type, &drv_ty=
pe);
>
>         if (drive_strength) {
> @@ -490,28 +506,25 @@ static int sd_set_bus_speed_mode(struct mmc_card *c=
ard, u8 *status)
>         switch (card->sd_bus_speed) {
>         case UHS_SDR104_BUS_SPEED:
>                 timing =3D MMC_TIMING_UHS_SDR104;
> -               card->sw_caps.uhs_max_dtr =3D UHS_SDR104_MAX_DTR;
>                 break;
>         case UHS_DDR50_BUS_SPEED:
>                 timing =3D MMC_TIMING_UHS_DDR50;
> -               card->sw_caps.uhs_max_dtr =3D UHS_DDR50_MAX_DTR;
>                 break;
>         case UHS_SDR50_BUS_SPEED:
>                 timing =3D MMC_TIMING_UHS_SDR50;
> -               card->sw_caps.uhs_max_dtr =3D UHS_SDR50_MAX_DTR;
>                 break;
>         case UHS_SDR25_BUS_SPEED:
>                 timing =3D MMC_TIMING_UHS_SDR25;
> -               card->sw_caps.uhs_max_dtr =3D UHS_SDR25_MAX_DTR;
>                 break;
>         case UHS_SDR12_BUS_SPEED:
>                 timing =3D MMC_TIMING_UHS_SDR12;
> -               card->sw_caps.uhs_max_dtr =3D UHS_SDR12_MAX_DTR;
>                 break;
>         default:
>                 return 0;
>         }
>
> +       card->sw_caps.uhs_max_dtr =3D sd_get_bus_speed_dtr(card);
> +
>         err =3D mmc_sd_switch(card, SD_SWITCH_SET, 0, card->sd_bus_speed,=
 status);
>         if (err)
>                 return err;
> --
> 2.7.4
>
