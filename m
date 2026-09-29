Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6631652BE35
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688866; cv=pass; b=eroaPmffM1WrrQm/7Lk3bGEAgJf5DCMZbaolqNAlESYOJcKWEnJyz4Lx672rwlfh/UVrvDDaUCYeweHOjo0qd/FJ5z6F9JmJ0VLQ+am0VENmZsnSG3HG2kCAyvdohlP9Hv6dvUvXQihetyU2PRYMrErd8qaBijkAWdD6Tq60iWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688866; c=relaxed/simple;
	bh=Oxke+nUuBI3tFzzh3rUkhEXkh6EDyem4J8N9oijfJyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSRYmaSl7Ia+OrtLWNFtC+bOugVy5H0eMhwTXueqtYypCdqQof04zNm4XJ4jAtxin2KNNxw2YSZIEs1cPhKJOQ0Woxe1q0lfEoAgokAy6x5nzHb+p+ZOeiecOzdMlwg0F1/qUEKK3OZbCeFGdOLVsnMBV7T8/8Zq93AlJWDpki0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6B7PzQ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhynAvsV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6B7PzQ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhynAvsV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw94j3301691
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cyq/qi3S500SGfwY/Y16YA84HAzf4qjNnDv4FUrmnpc=; b=L6B7PzQ95luu6NSG
	tsplhetaATkbBDwcRKq8CZ5b99fh0r7298NXSO8pG1pbyZRNpOtnYDPyY2SUlmIA
	DXpQFOPFgcEosHgzA1mWB8f5WcaOCvzpSOn6IDRGGxMiV/7B8zL1AlNys3JmH2Nv
	uegLL5iUVnQHi3cQ3QhYyLzPRbBILozBJ2IeXFv9P371N4f2sewC3FFbR08SkC3r
	vYyA+4ej2h0ZqsQ5lwgUChjLaaAoGy8mu+1i6WJ+AEBq81Sa3ekEgGOxZvEqke/n
	Rub++tHob4UusV6U6x8zH99gxPR3/Se0HtilbUTL5Mm+WzSssewmOqO9tJimULTn
	X3u6cw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx067q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc51591102fso2976501a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688862; cv=none;
        d=google.com; s=arc-20260327;
        b=KsAqt6+PhZGWNek7+aI7zpVDHijGg4ZWnk5/r18hMuEiv1/BL2CrjwWwPE4OAVKfr0
         PD06KeJ7Vd4QylQr76fenSNNhWHziLkHHkWJ9Xrn3vTvi03SsnarDpBqLolL4n93j0wE
         EyvvUgIxZ2arlncbs1ZC73y+kDQJjLaju5LD9SUxxrsBY7orEqyucPZQyJ96dwkoRrsB
         byjT7kl1bny9/watMKRPmDWHJQVmj8JDawcTZiuUMQFq5a8ObNkiOVlp+iFOb33ykHaF
         6pIc7gCzpr/YkOP2esCAHpFfpfNbWFPmb/IIM62uYSDocGRhkS27zk7ASIQ4yuOZN+7h
         wRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cyq/qi3S500SGfwY/Y16YA84HAzf4qjNnDv4FUrmnpc=;
        fh=YldvcOJQROTZbZfmGbCkbeKuIYHeX5RO82dMvVi5y+I=;
        b=fawv4/wDnpXCSvH2+DlQgZsDINj2kUn00XKMZ07iwg3YjPoysZ3v7Kmg3zFTlH/uc2
         DDhLwyTUfzo3//KwrOFqmK3ycPCIg7+ia/gx8vyL6vLM2AuSsRLjUYxkOmWCjsBqenTB
         JYaeyxQD6UWsOWOOPiaigI25ysq1JdVLqA7W1/QgkKb4oCPqoxfAF5QSNv/get/dJ7IV
         CUe03N0EkVMkmXhifATvbDZ1Yw45St7qfzFLECxWu9wLc36zypP6e3l9E0qRzsEULOu6
         1O45pFk9ymod6icpIWDSp8NxBBF3xrusDALa5bZSn/G58sh+49qvM5emXHSWPdbQIAhF
         jGMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688862; x=1791293662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cyq/qi3S500SGfwY/Y16YA84HAzf4qjNnDv4FUrmnpc=;
        b=IhynAvsVzsEkKcUJHYX2GE4gsSyCNr6fbkp18J6nwNT+QhRm1wdYrp9/3C9yLWhrrS
         BT7vvuh3OO0I19CfCib2fflKJLbO4QGqlQjej5GaGNXDinLMPCwZL/ShjsTmAFQPdvLz
         5a6HvgrAmxHhOOEuULU4GAOX3dRKUKQRC6Ir6h1hddXhneQOnIH3HNbhBQCwaCT2OTvZ
         Zuffg2OQlXLJNnvnSIB4+qC0AwsTShZFriKH98iXizpRQM7Tv7xAWcwPp+ZXmbbwnLuH
         87ooYLTdO0nxfcEAQLXau/PWBqmt2TxBLf06xzSDHOHFAemvL2gW4VaHuZfoPEHehxEy
         5/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688862; x=1791293662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cyq/qi3S500SGfwY/Y16YA84HAzf4qjNnDv4FUrmnpc=;
        b=RVStIVyT4tgeOlEkmQGKhlhL6VmUz7vbTUX2nOlbZvb/RuK4HWOX0Vb1qm9vI87ch/
         1bLYLUcEq79meTS/8bxhENLYdrKZ4Ebz1wd3QM3o2R7mJIlzPBJ3ZMsLBt8YdIJc9NgM
         VlcKhDc8wzjbk0LJqeUSp07IzmoKm88sWyjRHhsUrieYHvnM9yuBkoZ8xpWQAznZVrsY
         PyV1t367E5IGWnAzumXAY6B0sQGldg6P6RrmuwtGLtM8eT1Dse+JSYTZHYUzv2FbDO5l
         uMeu/QsLpQRINQxBUEFEAcaZ/GG9rT/Ql3ZlnvecrMowWTy03Xd5VhQUCEJTaA4ArDuJ
         dsRw==
X-Forwarded-Encrypted: i=1; AKwUvBwNKmzgOYDS0lBqx1qZPHG/IlL8J8nY2whFftXTs7gQOdZWafhEnoQ6aswYuE4oG02P+HUG9xYVLnl8mXo=@vger.kernel.org
X-Gm-Message-State: AFuF++l9aRLZO/CDytJSTxI6I7zyrgbRNSIc/9bEaAlazueZJUJJBD/z
	gN2D03NP2lDmvTSPx3exCjLcDmAoROh0lrQVF7k470IMn29hjaWo5elC4oXX7pMi1wHUBule2T9
	7W4ECatiGKa/FfR+Bc4KFQ7XbDWhUHmu5Ee1ZCfNwDMOiIDtADAb88a8pqq0bgrylWNYkqkMXus
	N9dIyox0UyPykMnrmateGzCk5PKV5Hd4uWCUpGE5GrhQ==
X-Gm-Gg: AYBFou1693TjJP+jzQqJ4fxC3jsSgUxJD290chKFamLTydGty1JK37STqdrzm3nLrSb
	HMnhW6SgLb0+MB5U3r3EGmf8z6lbjk6Fq6Fphi72F/2Aw76hi3AN520cIbVyNog38PmN+R/OuGu
	+0vV0J2Xr5TVu8MmrlL5/6BscmQuC2r1PzRZeoRyO0duE4gsBt5vCZ/t7snw==
X-Received: by 2002:a05:6a20:ce4a:b0:3dd:a196:906c with SMTP id adf61e73a8af0-3de0e906a84mr14829047637.54.1790688861817;
        Tue, 29 Sep 2026 06:34:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:ce4a:b0:3dd:a196:906c with SMTP id
 adf61e73a8af0-3de0e906a84mr14829018637.54.1790688861357; Tue, 29 Sep 2026
 06:34:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918141810.3023069-1-peng.fan@oss.nxp.com>
In-Reply-To: <20260918141810.3023069-1-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:34:10 +0200
X-Gm-Features: AclHuK-HxDdPv6ZXo6bbLEOpc-R3pQ2RLvsBtUn3eOlCmwt_WjOTqzddYREOXeM
Message-ID: <CAPx+jO_L0HKe87FbLcM_VBEqrqz1gLCUwAV+ZE7CWU9v-d0vTQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Kees Cook <kees@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX9TFLYAXd+SGc
 +Jhq2sMyXEh8nzKWnGOkaBmsZI70JLnYrRXuFUEbEXpPyyjUb1ktAQNb/Hf7z6HQ6gn/U/hS7Yv
 0Wh/WbOJMN8pCpRNWwmvVCtPv51+1KXKrSc8+/vwmpgYwxngJvCovlVGMKZMiBDdGHUZhC9wazo
 eWx2UqxVufiXmcBq8wfg5QY9G4eShs3iy5rXjuQE0Zp0NnNkxUNur0/TvPkKVwczSkecU302hKJ
 /BgDAcgZQ3Swi/RlxjoseysN4gpL7XI+cochqFkaB84tz5vgUTPOQ//9MM9QpIm1ry4rjLtpy5X
 6fgmDefKDEJYeKXeN9qE9E/iPiTq+qsT5l0rd2BivYulqfaPSN20q6ednCst/uivCkOp+2RY1g6
 vUC+qmOQkAavsjWiJ5IGv/q7XAbz01YNqpuq6W8+E9WL1FdUFp8kwfMln02U1giegdmzWdKKmi3
 HfUitYA5UE0bIuJUqkA==
X-Proofpoint-ORIG-GUID: -4O7Wnz2ou-DvvJ_pB3fdj5vsApqre43
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX1GgZ5da+svfQ
 HnyOfaKQlv87rPNsycbM0KsvIDeApOuAS0cU9sQPFt2QqOlhJWDRoKIYjyQPHzI3Z01YIWfd1RD
 3CAyy6qdjadCzaDidGAaOKpDaYBXecY=
X-Proofpoint-GUID: -4O7Wnz2ou-DvvJ_pB3fdj5vsApqre43
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbbe5e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8 a=4RwzDxXCS1lGNT27iAEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290054

On Fri, Sep 18, 2026 at 4:20=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
>
> Done with Coccinelle semantic patch and manual fixups.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c | 5 +----
>  drivers/mmc/host/ushc.c      | 5 +----
>  2 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 8f4df250a77a..98933be5f174 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -1677,10 +1677,7 @@ static void atmci_detect_change(struct timer_list =
*t)
>
>                 spin_lock(&host->lock);
>
> -               if (!present)
> -                       clear_bit(ATMCI_CARD_PRESENT, &slot->flags);
> -               else
> -                       set_bit(ATMCI_CARD_PRESENT, &slot->flags);
> +               assign_bit(ATMCI_CARD_PRESENT, &slot->flags, present);
>
>                 /* Clean up queue if present */
>                 mrq =3D slot->mrq;
> diff --git a/drivers/mmc/host/ushc.c b/drivers/mmc/host/ushc.c
> index 7e8af5a06ac9..410e5bb62752 100644
> --- a/drivers/mmc/host/ushc.c
> +++ b/drivers/mmc/host/ushc.c
> @@ -388,10 +388,7 @@ static void ushc_enable_sdio_irq(struct mmc_host *mm=
c, int enable)
>  {
>         struct ushc_data *ushc =3D mmc_priv(mmc);
>
> -       if (enable)
> -               set_bit(INT_EN, &ushc->flags);
> -       else
> -               clear_bit(INT_EN, &ushc->flags);
> +       assign_bit(INT_EN, &ushc->flags, enable);
>  }
>
>  static void ushc_clean_up(struct ushc_data *ushc)
> --
> 2.51.0
>
