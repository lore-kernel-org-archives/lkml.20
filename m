Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793365841;
	b=Yjs/AcSHd/fB96eP4X5sHRUgDSS+eKKWWWX4WT09SjlAzqJhyioDqAdfvFhhZZdk1Phd
	 w7U/vhXsDkcVSg+f7P3TC76rHldp9QAW6ftgnCskNdWacH2ffMhKCo4qUazB1EVsdtTDr
	 bueCgh9O66/myI4kOqiwZ45ADBCN/SAVjGycrlhVrWTpp/XPb6G5Ez/7hqERnDKIeeUmd
	 YY3XXSGyCjidJ7U11Fq7INK2cxR1BmHCxSAP1tzzSF9mTEulhJZ7+jKLnGIEEw+sGOLWR
	 GYr7a/u7YYgSiq72pW02bRSxcp7dWUxfPW4l5inhXqJaQ75prFBzfzwzPwtWy3OVRAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fsCPpPD5U9nNBpuQWRCxqec/1B3N7vDFnL3Qo+9kNSw=;
	b=qqPLICOBp9qIke2LcqJ5T1+Yn7txAWxS1fp3veaNObrNyx06D5xCbtu9TElxRSIhSVs4
	 OptVbv9bAXDRopu8a6pVzsxxvtG27lDclgEliewi3cywubhn61w2zzKQ5WF/IRrjkgEvR
	 nIsYnCUoTx/xL/umwkunVmITZn+XgwhkcXLsn9MSu8uY8jKcG3L1wvZWpX0i8GLlNnXzF
	 lNvdZ+WWbOEpkIr4+yH7z7tr1kvyT8f6y4AFwrbxfYdkBNfk8DFypI371ywD+K0y2JkPj
	 Fr4wBXAlt80PeMA/b+KJjYUsJzyJMg6hsfZgloVcJE9T/sm5qR6M4nsY4NSKUf/YKaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kifoh7G0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=THl1cyq7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03823606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03823606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kifoh7G0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=THl1cyq7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGErQ2784136
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsCPpPD5U9nNBpuQWRCxqec/1B3N7vDFnL3Qo+9kNSw=; b=kifoh7G03Kc7/228
	GK2O2Kkc+AkuUb1qaMVS165NeIlZ89dp1r6GvJDGR+UxIZ/wM7W5KjopaNP2TtaU
	eUm8QRLbrVPBxV0bAJXrkDej8ARO6aIvLmicS8Or2RglPkMY9gfnyg4MG0NMfVoi
	QPbDgkqDalnLetl+B3fNejIcLiB3CqHfvnkOOJYlInJqrh1AqKf0WpYL01fOW9em
	hHqD8Q3ROl8BluZtdEKiwbAG9jzjNjxfKrOMTvQUOmW+kGn3Hst1jFn8GHym4xgV
	mKsIg3DjhTar9uT0IvJqx26thHAjmq4r9BEIKN8ufe9L2aWzngL0V7rCDVV8DWtZ
	XsFKfw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk56t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:10:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a064f294cbso512210b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793365839; cv=none;
        d=google.com; s=arc-20260327;
        b=Ztq4KAvjwhj5G3uzUg4cFJE4GzN/BMDnfqcRY/rduuAcCSMbQfv6rLY9qYMb6o1aGM
         nNcnXzGj9Dsay/279x6jo0tl4gs2AiOdKNBHWfi1G4HIjLdRSWLnp5PImvYIukb0DIOJ
         abGgaOL8F2bytsrZRcV1ptmGXCV3bulxR4hh6IchK/xWWoWdH0QwPAUnE4cK1he6VhQS
         5arSPAXry+9Q7OBFahwn/1wdW6COULTGDc8QSJ5QT8o1GjB4rcw/bBKuOv687cQZM4ry
         nQAOoeznRBCNgOC7IgK0JwKazzDjqiPAEs0Y9XoB0oaquJ6LCox71CI2lr1yfZCd4MjC
         DiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fsCPpPD5U9nNBpuQWRCxqec/1B3N7vDFnL3Qo+9kNSw=;
        fh=JMKnQ0qCmF7sy7MZi2kOrjXqEqyg+8fEX18E6wJIk3U=;
        b=Nqeu9nMCNJMZMfh3m0N6VILqH6v8XkjUL9jhKMHlygdTH8y68kxinp6x0JRsQxIB/5
         t0ZajuLbC4LXXC47lia/xlt37DN0euv7qzVWKU51gOPFaNI8bYzTbrHVeU47cI6J9HW0
         NrlkufbDbZ1/b6krVrpwVflqdUd7eXh/hLxcpLM6y4V+jYYUyPU0Jgx0uQ5hD+mqNhlf
         QznykiWIKpEtgW+h6DmrCDLyR7zvxJOusViLmze+MXOO4mgiSD+UNW8x2Gihf6bNdvQx
         EhYfv7GrihaOeh2mNMC2zayME4hlyJ8sM8pvUzImz9Q4WLSMNVBjPJdo1lHFv9EWs5Tl
         d0Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793365839; x=1793970639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fsCPpPD5U9nNBpuQWRCxqec/1B3N7vDFnL3Qo+9kNSw=;
        b=THl1cyq7k4BKQN2TP5BY/QiSiPjkI6ZfVN8L2I2UvLFFwOox8MgPFJmp9dyNA03iCF
         pbddaL/VPMVl4F9WBZUTQM/ojY55IuRDxbkXzJqGw5Rs/0YJZZ19OjPOfXQVCkhUdnfx
         8P00F1w/QTF+XsA34+g6XsM1MRFHzMyiY4OOWR/DrFw9Yo/hS+FWG6xnA8x+8m6BeLz+
         rXsKMD0WeyZQAux/X6Ic4A5JkWRYVxEukSD00FBPNBDumfeXOFjw8q6mih3U+lp7PmRK
         V+BWeyKhXiH5jJlP8eOjvMJzKNmsKeYEqZWV5jkSIapcQTkOjqf9J7ufcIh8JlnuSZ8i
         9BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365839; x=1793970639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsCPpPD5U9nNBpuQWRCxqec/1B3N7vDFnL3Qo+9kNSw=;
        b=YwGlVmAVuYLdbKRYKzkElDsl7J0mnX5mtKURajTZuo5IOGG0e80tZQhda1kcEvttiK
         LWilJHX8pNDcpxRPma7o0Ur+jkG8OwhRDs2zusV3llGQUsrLQHv7EgD+hu4Wpgah1eIG
         TpuyKt57wrgbpa1nguGQr2zWoeKclPA+4wKNi3cESJGNQq7kEPR3TndEokFU9QarhqGv
         Tgdh4VLne5IzyT6q5+JjwO5n3b6c+EqI1shPWr4CHpG+8nHPu5XQ/y6V2NNyUCyBAl60
         5ZUbA+KvXCucXYnlPJ+4fYP5T/YidDu0s8jpCKDWUPwY6RwNv7+lOzh7ZgP5ks9nGcYb
         Af8Q==
X-Forwarded-Encrypted: i=1; AKwUvByQq081RwIfhuOsqfRfHMPyOo3NNKiLgAISxTPA089nNSAAAQviOHYRSEFI8ZiB6c+EjhVWPiviomRV9pA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpLcRkhrKBy66Sa6b9E//yiTsxln2B8oc58IaXf4aDdFJlozu2
	SnGZZR1b2+0+JU9npcAtnS2ZZjvthHycPxqhOJJLd6PVhkHjKzyJtrUuTMgHOE2D4QtfLHVHTQr
	SVb/xnbxL+JWG66/3xdHiQLZs1WKb/RkINMcmZ9iGbK07cW7yfpZDw/sdp03nblsorxsaP87/0V
	Tw8VoW3dqBZTrj7DjfPcVWo4Bfd5rFDfCWmG1BPztA1StDrZJPW45i
X-Gm-Gg: AYBFou1CM+0OHUxCQtZEjlUAv3/Tr5dU+SR+dGj9hC8tn+hnxor0SBoTu4RO+C/+cCa
	VI7UNBIWMs0LSndosNGf+93vfa+kkI4Er+GhVFUIi+qV9UOCVloQP376viC55Sf782m74gWJKtG
	0uipfvM95CzLLPJ+SstG4Mqq3wXszQPWoR9cClBamhAhrOAh/f0PLp1Wj/nQ==
X-Received: by 2002:a05:6a00:600d:b0:898:9b2:605b with SMTP id d2e1a72fcca58-8a9c079a97amr1958332b3a.56.1793365838949;
        Fri, 30 Oct 2026 06:10:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:600d:b0:898:9b2:605b with SMTP id
 d2e1a72fcca58-8a9c079a97amr1958300b3a.56.1793365838423; Fri, 30 Oct 2026
 06:10:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027122417.954133-1-rojer@rojer.me> <20261027122417.954133-2-rojer@rojer.me>
In-Reply-To: <20261027122417.954133-2-rojer@rojer.me>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:10:26 +0100
X-Gm-Features: AclHuK-f04QOKVsOKTCid1138RFgbSpIdyKV4SVuLgzWJk-mOLcmCEvz3IZlzQE
Message-ID: <CAPx+jO-SrC-8DKEfOC9KTMY=zHyiNVqNwiZyf7ipvX1=ZzZ1iw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: core: sdio: retry without UHS if UHS init fails
To: Deomid rojer Ryabkov <rojer@rojer.me>
Cc: ulfh@kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawn.lin@rock-chips.com, llj@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae49750 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=s8YR1HE3AAAA:8 a=KMjSppSA2jvgilID46QA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: shNQPNlBCgPRz71VhbP-7075C_PmbUk8
X-Proofpoint-GUID: shNQPNlBCgPRz71VhbP-7075C_PmbUk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX+5SqOp0muqpq
 JIhBC0kKqsME9Sy2djP9DRb6arNSYAfXh57BGqE//azT3B5miSVktbYSknyOlysgiUBwLHSxuul
 bzqWt8slum0WPfjPqpgqSI41PMtjFUJnRhaDAl4KYPvxFPosqwaPaHyY97hYElM/H4rf1g1JM9M
 hIbXFEP8tC98zdl4WgreEQh/dTKPjlvvRn3iLbjwlhF+AFnbArvfLM3R+HonWKoVANPEWp/uKxK
 DQfa5YYRh2ONgyiiUQbaxfJ2LnAY/EOBqEFPwrBGIQle87dZmovaOePh+w9udg7/I6a7qqE2vLR
 sMcvHtd7NABiNDK6XIwkikF3Ox/72l9CMHlWMTstvtvYqT5xmQNBrB/XoQxqHQ61BVXH+l735bt
 NTv+MUR7hA+knAdmTy72INuMgAGK6S8Ad+4ULY3xDqC8UaU2YNLcM/FbNF9YYv2A/PYtDz/JjyM
 MRj3otIjiuJ0VVf0SRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfXzbg0IX6herek
 ZuKgM+tfCwjvzEnp/zVvIratm71KsuhdaPvItHUuknRPcDXoJ2yKAeZx66h5+EZ/LHL6axHrouW
 4ptUe+jj8waKct75rjpHs444FUnEdYM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300052

On Tue, Oct 27, 2026 at 1:24=E2=80=AFPM Deomid rojer Ryabkov <rojer@rojer.m=
e> wrote:
>
> If mmc_sdio_init_uhs_card() fails, e.g. because tuning finds no
> working sample phase, card initialisation fails and the card is not
> usable at all, even though it would work fine in high-speed mode.
>
> This happens for example on the FriendlyElec NanoPi R2S Plus when the
> SDIO pins of the RTL8822CS Wi-Fi module are left at their default 4 mA
> drive strength:
>
>   dwmmc_rockchip ff5f0000.mmc: All phases bad!
>   mmc2: tuning execution failed: -5
>   mmc2: error -5 whilst initialising SDIO card
>   [... repeated for every init frequency ...]
>   mmc2: Failed to initialize a non-removable card
>
> There is already a fallback for a failure to read the CCCR in UHS mode:
> reset the card and restart the init sequence without R4_18V_PRESENT.
> Do the same when UHS init fails, so that the card comes up in
> high-speed mode instead:
>
>   mmc2: UHS init failed (-5), retrying without UHS
>   mmc2: Skipping voltage switch
>   mmc2: new high speed SDIO card at address 0001
>
> The fallback is taken at most once, as the retry doesn't request UHS.
>
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
> ---
>  drivers/mmc/core/sdio.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> index 83085e76486..6787fdf1c53 100644
> --- a/drivers/mmc/core/sdio.c
> +++ b/drivers/mmc/core/sdio.c
> @@ -867,8 +867,14 @@ static int mmc_sdio_init_card(struct mmc_host *host,=
 u32 ocr,
>         /* Only if card supports 1.8v and UHS signaling */
>         if ((ocr & R4_18V_PRESENT) && card->sw_caps.sd3_bus_mode) {
>                 err =3D mmc_sdio_init_uhs_card(card);
> -               if (err)
> -                       goto remove;
> +               if (err) {
> +                       pr_warn("%s: UHS init failed (%d), retrying witho=
ut UHS\n",
> +                               mmc_hostname(host), err);
> +                       mmc_sdio_pre_init(host, ocr_card,
> +                                         card !=3D oldcard ? card : NULL=
);

Is this really correct?

If there is an oldcard we should *not* pass the card (since it would
be equal to oldcard) to mmc_sdio_pre_init() as it would remove it.

If there is no oldcard (oldcard =3D=3D NULL), we should pass the card to
mmc_sdio_pre_init() to make it remove it.

In other words, how about just:
"oldcard ? NULL : card"

> +                       retries =3D 0;
> +                       goto try_again;
> +               }
>         } else {
>                 /*
>                  * Switch to high-speed (if supported).
> --
> 2.53.0
>

Kind regards
Uffe
