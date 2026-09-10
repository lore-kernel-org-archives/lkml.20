Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080C43AEF55
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056339; cv=pass; b=VtQYwO9ugGrTitOLGoyJJqW5yKxK7JVQPGWnTEKvLsxNjEOBOTo2RNz92YS9aRjs8U/DOXgIW8wdP4ghEcbUCZ2BRnfrLeHNpE1RlvWrZOxYL5wJmyu7m9GjrNzX1l6MLW82MqMKKx7xPcsRFgzZyhQylzedIvUOXOlP3IKzR4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056339; c=relaxed/simple;
	bh=g7nac0T0X9UeGOZxw4guHvrAN2WDr1u+ybbYZk0AUJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sfUOhXGHT70aSjTxfmos8P13DCyrV4iJvp0SCdQwjhqTyvyUdA/q1Xm/tYBvlfTUvRILRqvGAU0FUt65t5nqMKePKnCfeGtnG7ZX5kponpgT/qVbG8jdamNSExZWEsbsL8ihJNCV7Iw2xsI0wcqRCSwstKAADkU+nyuA+ER0fbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZlNZ24py; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R2L3aBHP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZlNZ24py";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R2L3aBHP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4YkW1186643
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoxqy27byI+/wR2v7osUw7bvc0LF57CRxz5b6DL1pSQ=; b=ZlNZ24py8MkFeZO3
	YnE+ujzXoEKddHVM4q2uTunajtH6GljGHbALN4EhxX6SEwcSLpIEwOgCPyBTTEMo
	hLSBDq4OsUKVm4rfHzEfBMtFuph3vHr1fY6evCs4srZkqJ0qvrknt6/y+cwSPhEA
	RSNPP/oVF/+1eXQaO+NtfCCgMvPG3M9K61R7owLRouuaBQIcKENa+P+bDeMGKCWl
	mRKyDoIoRwnUzIqKFT3vl7wkDT2Tj5gO452TmvmWWC6HeU/iytlQmtmxwphpjWhP
	m/BPm7ldMXy3fXQejhb05P+ZXEb1DyrtB3lq9VHizDeXz7tEsTkbAZ7vQxaD/MU4
	NUj0pA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkraka9d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a63cca6ffso831859b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789056336; cv=none;
        d=google.com; s=arc-20260327;
        b=i2iwMg4RCZ15FtuYIO26mOnHBq2N+162QRwOJums96XL0ElsoKIGABix0eQNx3cUfq
         GA2sQ56fJ11+tlQZh6t7dske6WCaJAMspL5TqAMGy+s0S5W5myXBRsAx2VcZ3hwXcVq/
         eY3prcelklYZOqqmIMSowuzu6TI6UUjAZjAk6XwT/3kZ6+1aS5UqmRqdDjpyjBclV4gs
         w8XgIOlWg4g1jPsTw0LUgzZN14cUSplxM1iH3EKWsFW700DU5WhU4YAPXvCBK+dBBES6
         F/g287Ky68ltPaPc8RtTl5kMatl3VC13bYY5ssALJSJzjWcT7sj5VU5M9MBI8gxzrn3v
         J7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yoxqy27byI+/wR2v7osUw7bvc0LF57CRxz5b6DL1pSQ=;
        fh=H9wfOPO6zdJJo7UQqlqAK+Xewee0e+xAjQ3mNgDMf/c=;
        b=Qrhd/IObA0t3+/TnXkHBAyTv2d2/eG+3CgdyOoTBPbzjJjRp4D6DzGlTqBNVxuSjed
         ynSwpDpfZ+eRfysgFOGcQetAmXlOIK+5g1U3883jkxIkXP7ag6kX7CQMtTuiDnFHBmvZ
         L1q8fx98A9I63fIwt64a9HA6vSCCa0Lv1f2duOR8rgzW9NrzFfD7KDHAWFlrYDbm3fxs
         mD2DRDXwo5YBJEmdmg9js08prvCiLq8fgnbZzt20AooPxsf0MbzVt6qrnEiHNgGMA3nY
         Ht+QA7D5FxQKKDan/yfIbOXc7Y3P+jnJ2us6iZ2I3/2XQwi2COWEKKnBpOWX0apem5VL
         r0OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789056336; x=1789661136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yoxqy27byI+/wR2v7osUw7bvc0LF57CRxz5b6DL1pSQ=;
        b=R2L3aBHPFSGQKu5srRfviqbzKoTy6lPf1OYFwEiZ6k0joYW8i1iGOxZFGY9m12KP4j
         cKB9UIBR2AnUhlyiW9x686zL5dr2lysXeFtMTPN0xPJIqFRUWBX+I17fcM/6p2pfD+Kl
         SLFLE+tUpoOj92JFzTjw3qHrtguk0ubfHORsQtgSgw9lSWTLc7kDavHXi/3L6RUExSf4
         qzxx73UImgUw/zLSfH5Ao+oCpSC2n8cMC8yZWuCPtWoWPJNHoilfKQgXfY+bSC/xYqcv
         TmxGvor8X2Q48gZMjouoDqsVnJXU2bsRGvg1HMNgSz4GlP/O2zVm+KEY6C/kh5phEZdf
         /Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056336; x=1789661136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoxqy27byI+/wR2v7osUw7bvc0LF57CRxz5b6DL1pSQ=;
        b=rSauKGfl7W60cgCaLX6mEIh0fVtkMJs5gzj6RhE+yrXPCWgcZGfN2lunVyCaq05lcG
         t0mXVq52vlAZUduNXjP/k1fWJQMdgmUd0X4q9LCm3Klpj/7I8REkhesvghbWFsIXOA1J
         5EGjQWesV3xkwijc/WJSH7DEeNeFFh1zEhPhjnXyPmFeY1c8AgfAqHmzgV6sE+8F0OSE
         OPliyPmg5ymHxt1OghAKTmg2aH5dHOeujFdkT3jOUjB6xLxy9O5tXeI8vD5rRKHyw0iN
         +hU9CNmrdnJ8TvUAs4NDsCNAQ+RQqJxgc9Fe5+S+Vtbla7HTjI2OQO6izMEdwChMAbvc
         UhKg==
X-Forwarded-Encrypted: i=1; AKwUvBynAB43nfegiYeiLrFVx5E7/DWXPKoZXBxm/nVfVsMUvhziE48TCrVnBSJIvhBCBMq3j5gDYqbfCZAeDPY=@vger.kernel.org
X-Gm-Message-State: AFuF++mslJOdgQZyUS9xG8iXLFkWo+ddnz7mkjz5Ro5TdLDa+kYge79y
	ExhJbL918I7yNklSfJfOlbuipjU2QgWjQp9b8SwfM82lhO3WQoOIwie8/W4XJYGiCy9hRF8bHUC
	cAKe6nwJY08bzAjGixZEHUZFpbRQdDeYWaps3NH0vNI4kVZWaRM82mBYvoW8LVhPTTf2LcNzw31
	cONI8Zl0Ph4HiVIudIT0fEqkV9Ds37eEzLLYTJzoanPw==
X-Gm-Gg: AYBFou1Wu6Jr15RQ8ZWiVQt27+MsInMu4m9NUvjhlCo4s8BN5DeA4QOOduTCRM8C7VW
	CYOZU+mdU0h/MGCP7yD9W61hYvsaU6xPa+KNBgnh88hMp3DBZY86y5a7sbzKmcuctYJTwSU4y2T
	Mt5J+YHi7omK4cPEk6yzPyUtBIG7QGYkkVwYJgnmJu/1bvSuRUof4FAluF6g==
X-Received: by 2002:a05:6a00:aa85:b0:857:7384:b5fa with SMTP id d2e1a72fcca58-86948928444mr10182752b3a.22.1789056335736;
        Thu, 10 Sep 2026 09:05:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa85:b0:857:7384:b5fa with SMTP id
 d2e1a72fcca58-86948928444mr10182588b3a.22.1789056334935; Thu, 10 Sep 2026
 09:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824065755.35451-1-florian.maillard@mailoo.org>
In-Reply-To: <20260824065755.35451-1-florian.maillard@mailoo.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:05:23 +0200
X-Gm-Features: AcwNN1XQeUn5yu0y7ja5J9fxlitv1JADg08KH-qf2e76LfTwNbg3W-ZRo2dn4tY
Message-ID: <CAPx+jO9HV_L=Dn5nmWTPXUoA4Hy91uj5S1m2y5fvVaXh+zPbqw@mail.gmail.com>
Subject: Re: [PATCH] mmc: rtsx_pci_sdmmc: ignore broken write-protect on
 ThinkPad X260
To: Florian Maillard <florian.maillard@mailoo.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfX5FwRV6Kk4gWm
 ZCGt7OjdgHLENnnFhg29xAiu5aPEtVVS7dC4wZvlTESOxqHbom6vTL43uMYZjpC+0ybB0wQED6w
 q6UXAW7xD8VmEDR3x5yHC3uCQVU3PrU=
X-Proofpoint-GUID: kK_uvr2Z3i4WZUZCufuhXwLdf1nJtqGh
X-Proofpoint-ORIG-GUID: kK_uvr2Z3i4WZUZCufuhXwLdf1nJtqGh
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2d550 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=TqukyxIwAAAA:8 a=XevV5cechEosMP0pQycA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfXyy5QfPQ1hf1H
 Ny6ChP9XAOpBJ3CuOCPZiGbzyalk6lkgubYdAKR0vcVxMCEdtmSR/pHLswaISInMrc6GP3qDahu
 eOAzjKbS6QR0Y2UrEymoSHS2BbI0CdU/RiNtN8gn1gIuPng817+eYvIW5zJbRGr+mQ0RpTIqU+9
 6ajFz79eowa+1W9prE80HztZFELbZjHpoNKhiKZxsIZz5/Kxl0HneUvEjhmaOA45vugOwcOl6Tn
 Zvrose+enpEwVTTLPyvMeTCaK3iOKp1zgHUCLONtSmw5iClknaPHDDWJEKwuMomTT6UuCrvKTEr
 CFYeJqGsCVfuUdZkzfFB46i4aUplLXpFx5cw2kQ+vpMc2xhypYsmL1aoeRFdhJSXnMzhMbB0F7n
 0AbK7yutB4WleDk3FXMm5rQSG0K1Vi4mhIdCAOsbz5xHesC0zSGOwiYh5ENPbZF/PQPWT5VKdm9
 E3iJYfaUFsFZJZ1iZVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100195

On Mon, Aug 24, 2026 at 8:58=E2=80=AFAM Florian Maillard
<florian.maillard@mailoo.org> wrote:
>
> The Realtek RTS522A card reader in the Lenovo ThinkPad X260
> (subsystem 17aa:504a) incorrectly reports inserted SD cards as
> write-protected.
>
> This causes the MMC core to expose the card as read-only:
>
>   mmcblk0: mmc0:aaaa SN256 238 GiB (ro)
>
> and /sys/block/mmcblk0/ro reports 1.
>
> Setting MMC_CAP2_NO_WRITE_PROTECT makes the card writable again.
> Limit the quirk to the affected Lenovo subsystem.
>
> Assisted-by: ChatGPT:GPT-5.6 Sol
> Signed-off-by: Florian Maillard <florian.maillard@mailoo.org>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/rtsx_pci_sdmmc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mmc/host/rtsx_pci_sdmmc.c b/drivers/mmc/host/rtsx_pc=
i_sdmmc.c
> index 8dfbc62f16..d25d4cb59b 100644
> --- a/drivers/mmc/host/rtsx_pci_sdmmc.c
> +++ b/drivers/mmc/host/rtsx_pci_sdmmc.c
> @@ -1425,6 +1425,11 @@ static void realtek_init_host(struct realtek_pci_s=
dmmc *host)
>                 mmc->caps =3D mmc->caps | MMC_CAP_AGGRESSIVE_PM;
>         mmc->caps2 =3D MMC_CAP2_NO_PRESCAN_POWERUP | MMC_CAP2_FULL_PWR_CY=
CLE |
>                 MMC_CAP2_NO_SDIO;
> +
> +       if (pcr->pci->device =3D=3D 0x522a &&
> +           pcr->pci->subsystem_vendor =3D=3D PCI_VENDOR_ID_LENOVO &&
> +           pcr->pci->subsystem_device =3D=3D 0x504a)
> +               mmc->caps2 |=3D MMC_CAP2_NO_WRITE_PROTECT;
>         mmc->max_current_330 =3D 400;
>         mmc->max_current_180 =3D 800;
>         mmc->ops =3D &realtek_pci_sdmmc_ops;
>
> base-commit: 388b607d107c07aaade04c7f22f344cab6bdccd3
> --
> 2.47.3
>
>
>
