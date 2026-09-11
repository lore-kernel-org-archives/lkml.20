Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB9B3D5676
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141240; cv=pass; b=sxGUeI20GvLLr4na7P7Lz3zCJ6l0Xi+xVqPnyf/4aosNANA0NRcN5rQ4CN2U21fDmKmwMjd3lORkfV61Cj42T9ZdlxMq1C3v0oCcSIpv2nk30iNPFMCe9L4lsmeyHEPgQeLD8TWlekTkIYXUqvOAg4VI/IypRjH5T+6tYPjCs28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141240; c=relaxed/simple;
	bh=HAP6L74icTVzJ0dCR51FcYzsHJGr69hg5OgHxlwgWdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7yM5rnpKnIkE2VVK4Jj85hUOvhC9g4f7C15+OnDbmL8+7kMZcZnZLwf1TLiT8GtJiFlfFYinprqzOE7dMKnVJ+7TMZV4klsBWLAGGxJaMUhHVUexJ6U1DmrWUMKD6B/pqfCeTHtWBAlnQNlq9TtzQVLYUAtn75x0l3WiumgAo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dh7vnSPq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRdwrEMw; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dh7vnSPq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRdwrEMw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm0FP269276
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Jan21eA3GyUwCuy2Q7YzdFAzmFXBmSiFZ1DmXstvho=; b=dh7vnSPqtsWxaE4+
	Ps2tqSHD+ZRoYBXWMZfKClD/YHgyL761YpgfqBUNstGdgSJgg1q30+Z4zFOmQ2L7
	tOWhn8ymdGkTiaq1HDwgjvv25nsxmxGVVxELpqgm7WVJYkB+NSpBdwONh05ppIDB
	CpONodGUG/NPr7U6rjNwmor42oS3PFUkGLydSPTbLJk1e5mDw+we/QliP+BRVGxi
	gcDs7XNQkQhjlonuVMczBWnyKW+V1iFp/17BZ9jXmn+M/g9qC4hfXsuFuhwn/PdR
	dQpE3cS4S9VZkMyIZozlI0gboc6Wz4YzoCx/0nbcJmp9d6NcH6/J1upeO6SyfUT1
	/sbabg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd52j52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:40:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1007010a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141233; cv=none;
        d=google.com; s=arc-20260327;
        b=aeiaV2Wy0Oxbk2Lk07FTU32mQ3fTk12QZEP6fZ9pvfJVe76XZTC9ej6sMNnwARt1xW
         aRGt87i/78zoLhE4o1FNsU/cG9mT/KxZGDzfX8B75YvWu3w3XMPKznxqwOcKzh+/uzM7
         XbA54qEAZ1q3qgr9NWWUvVORFdT7ToRKLAY14mhoWRy1R2h7WbcMyX0o3v0cV74DpUZr
         LNBW+csTR2xYevduq0RxiJ5edU0IQdBEKduChlkfAqzPyuTAO5ZEXGH5Osu5uVUR9oqE
         EtkvNvw2yzvc/yRejIfmWkw2kUdJmk/G/6lo+YcIZ7GJBrRfOrNhbVBcl4/VEGB+XYdj
         zXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Jan21eA3GyUwCuy2Q7YzdFAzmFXBmSiFZ1DmXstvho=;
        fh=JFTXmeGKiHKMsMe4Shlk3+x2PdWxdboTVQzuHyglXiM=;
        b=ZeDlIvRrGspAl47TU+YBAmwzsbSpNcD991HLxS1etDj4BdS4iHzd6VIBGdS0E3/Iec
         6E0kRfx5SI6SGgy2hqOugxopu0RNzTlHHtPp/sqzQaP0JA6dYxHYnZxIdLWiBU2dlktb
         75JsaWIveKpIuvP3WkSyLxJJCvChYfkywAiJSD2okbqBKyE935/XJ7GvX+0lRoQFneT8
         c/UUFno2fTrZBV6ND6HgEHVPewqpQwJ9CSjLB6hy2KiUaCu8S6RH6CSoZBosTX1AGUeW
         IMn6wkrEfqvuhinyUE/Zg8zcafksP/MMqDbes6uP5h1kz+5ihMpTNR2ldRgNTF5t+jtF
         L2Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141233; x=1789746033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Jan21eA3GyUwCuy2Q7YzdFAzmFXBmSiFZ1DmXstvho=;
        b=fRdwrEMwGBBHEZ/fQMmKs7g9k08ibdPNGvJyhjKQ/DXl1abud1HzK0ZfpSi1ZITWA1
         5en33W+OuUxC8c5A8rpSV6FLPxMwUOnFicVckbrJiWuis10johrbDCIRwSOA3MMnK0+I
         rstQOtcOwAZtgMfMyuS3dj+GgWxYuNRixtcOw+4ZRuVmbloFje8oNAs3dxVbvHXU7nU4
         zfnSFrKHHEz3Tw5oG3KS+2cSKHs56EEQyyLaZ1P85Fk0EJ3qvmcNeAaw5ARuNdGmI+qQ
         1tsE5duzHCFn684AdlWb/srK+sgl6WDI8P4JWqiN1geEQdO9pOCTwJbpPXiNHhYW+nvn
         8p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141233; x=1789746033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Jan21eA3GyUwCuy2Q7YzdFAzmFXBmSiFZ1DmXstvho=;
        b=tB+Vm2N1AzdnSbakNZykYlgtoWvwRkStWL/eLinJtrArmFERSBSkE2drpQQLzabM5Q
         M2E6HNFVJ8oZGz0eC6DcFmmrlH80/4UyBOhP9o+hkh8+45Zh6FTpfSTp1BFRJmbR99o7
         jTM6wrL8rhk+6hNeId8cHxCwTDOgnWCdNhB1EZUTdS9msfrv4rOQzAAfnXpMN9+pA9lb
         x77gApQEDpFxdedeD9lCVL+93idAGvA3cr4IRiGhAin8XWmiL6LlpwaFE/bWRFDoFxwd
         bs6p9737qiXpwh8lkj3GDVcpPDlWgiTxhHvjZNkkTghJ8OGweKGXWXFZBle6d8GPXya6
         Vk+Q==
X-Forwarded-Encrypted: i=1; AKwUvBznVYoVxQbEczT68Q6Dk30PVXZT7OUoRR3j+IbJl02TfGFmvfjOZT52RByjCIEMQAFhwoQhHCRa0josZMA=@vger.kernel.org
X-Gm-Message-State: AFuF++lAVLflmG+GCHQ1fe8J9hOF9qZI3F4Vx2HDGN0kfYHkbaedKN0O
	tZXLbtVgL5xvdg3UiNAOhAeR68GtYNdoToep2kNkupoaemj8fKkjXzCtR0T4LCYZpOfyxXG0yD5
	jEk3DPojh6qX0tlXJ0saDWfbOWN5UK2f8l3IBDyTKVBHsOIE78XjAW5sP0DgGywtTH7yhEnkaB2
	FySQ50bPlFHw4rWNQXoFt9nH6s5NYeKdT6ISMJW9q4iA==
X-Gm-Gg: AYBFou1tMRTC+8Lg5vF1Bnnh9n8sewm+yHQwzB4G6URSkcaIqomafQv0/48FUIOLHLP
	Q+eLZglFl4YbPF3rCcEciBoSv5lF3ZQuAKhQHsYc4e8+xIqxxrFJICzbAByCld3rnLAisBWis25
	zUSvQ4kuaiSgVrH9puhMHSKhksDCOMgFt/HB2FtJ+20cooChBKzafd7mnrpw==
X-Received: by 2002:a05:6a20:4309:b0:3cc:c7cf:5a44 with SMTP id adf61e73a8af0-3daed46aa80mr8064996637.2.1789141232874;
        Fri, 11 Sep 2026 08:40:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:4309:b0:3cc:c7cf:5a44 with SMTP id
 adf61e73a8af0-3daed46aa80mr8064954637.2.1789141232471; Fri, 11 Sep 2026
 08:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901003816.48460-1-rosenp@gmail.com>
In-Reply-To: <20260901003816.48460-1-rosenp@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:40:20 +0200
X-Gm-Features: AcwNN1UVsaCMkJc3XkJnrU1YH17QTt9kMbRXVr6xSw3k82HcyEzVtLhG8fPyhIg
Message-ID: <CAPx+jO_3vbgnGDs=_C3LJy+4H=xMK2GdaHaNvGcgG35uC1ds6Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-pxav3: disable clock inversion for SD HS cards
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: iWVNL1LeTkXVMQlAlqI2cuwzTHlrziGF
X-Proofpoint-ORIG-GUID: iWVNL1LeTkXVMQlAlqI2cuwzTHlrziGF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX1Pzc+yMxeGnx
 bdbBWtvv74i4avRuCQ13CU8uvU6Tm8YUWrln2Qr3YLMrVb0pjqteTX9k8CjJUypWsktdqbZQHvS
 chJ3SFRKOcdWvxL6D60Osae+guvFasQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX3OfFIRw6wLDD
 9OXdBmeSOSc3o2ITZyMOEC42fcqQQJmSNOTnA76e1rEDM0WcdrkgDhNHfzfOhl9rHl2mAs0ubl2
 +XIctXRBnC9obIdeVVU9ttna0Gewx4XkDkL/e4btgVYCjRLHr0TRBXycT50qfrf1zYcDjEqBzyj
 V4GalAKtRGmFEEiSRp//avQruE7hGwQLFij2kpGaRVIMCaf/npAbI4e2hP6mdnJ3Erq8j+kmpzK
 t+hMfyDFhf2xB/ehEJZnYE4UjoFy7pwbui5iejYzGrOaKwXUwbQkvBTk7KyXT8ckvr2DIj2uMR3
 ZW9lt/0A+rHJ7SpdY6zcHBrH0pF2F1NdBDjF3EfPxB3CSMzrTzecJG9A+EyL1mNDYXeC3uesbMc
 WlrSt0mt3VoKWWmQNxTtny7qfV193QQRPJ5raE7oVl1C1w4llleTcTW4TQzBylIE6mW451/EmpJ
 HiZJVKB04P0SkvJIfgg==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa420f1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=5KI78zpO6hwaGs1b4KcA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

On Tue, Sep 1, 2026 at 2:38=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> The SDIO3 Configuration register branch of pxav3_set_uhs_signaling()
> only clears the clock-inversion and feedback-clock bits for
> MMC_TIMING_MMC_HS.  As a result, MMC_TIMING_SD_HS (ordinary SD High
> Speed) falls through to the default case, which sets SDIO3_CONF_CLK_INV
> and leaves the feedback clock cleared.
>
> According to erratum FE-2946959, clock inversion is only needed for
> slow frequencies when the card hold-time requirement is high and is not
> required nor desirable for high-speed modes.  SD High Speed runs at 50
> MHz, so the same timing argument that applies to MMC High Speed holds.
> Treat MMC_TIMING_SD_HS the same as MMC_TIMING_MMC_HS and clear the
> clock-inversion and feedback-clock bits for both.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-pxav3.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav=
3.c
> index db9dfa92cb57..9e6703e005e2 100644
> --- a/drivers/mmc/host/sdhci-pxav3.c
> +++ b/drivers/mmc/host/sdhci-pxav3.c
> @@ -284,7 +284,8 @@ static void pxav3_set_uhs_signaling(struct sdhci_host=
 *host, unsigned int uhs)
>                     uhs =3D=3D MMC_TIMING_UHS_DDR50) {
>                         reg_val &=3D ~SDIO3_CONF_CLK_INV;
>                         reg_val |=3D SDIO3_CONF_SD_FB_CLK;
> -               } else if (uhs =3D=3D MMC_TIMING_MMC_HS) {
> +               } else if (uhs =3D=3D MMC_TIMING_MMC_HS ||
> +                          uhs =3D=3D MMC_TIMING_SD_HS) {
>                         reg_val &=3D ~SDIO3_CONF_CLK_INV;
>                         reg_val &=3D ~SDIO3_CONF_SD_FB_CLK;
>                 } else {
> --
> 2.55.0
>
