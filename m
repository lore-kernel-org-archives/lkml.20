Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358036;
	b=VbrjO/Avhdl/1lbAMkufjQm7QL2G8Qd+4lfoTMOnd1pPbdAGs5aPVL3O60vJMSVvQyKE
	 kiVuA8FRaFXIwQHF0pYgjtWoqNIZlp16nuav3sieJ24Z4B9bs8quBfbvUOLWzGSmeNRY+
	 f/mnSl/1AkVFq3h6vvqyxdskEXAlxbkm4NB2Bxd0TR1HeALGe9fDPG48xbOT4vIr/J5E/
	 7DtHz9Anszw9Fta+EZUVwS/XV8EJX0L3gp6OjSABSQjSVMePmA9qDYQnGffZGgKdvBcAz
	 vlJmvVcqLQzfZpal30mGu2fCMeIiVE0OWzVlUtoXnHrL+xri/FRw8PDVzJKXdM7Ti7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JcDbmSXB55pbh/pDj+0+0hVcgTy+254XVZ5pIx4rYQ0=;
	b=a882yUN7gBvJGHy2anatEIJRQwkUQ9W9qFIQne6/6+i6Vk4z/hhXXLX5lD2pm8HUdvWs
	 V7Mf+icKcy2+3Ie1V1Tgj1HKEJiR9o61w416WetLFmuZ0puyh5X+fNb53yNsvV/BgB/bM
	 Hk5tH0Nj4PpO3SBzHuze9/hu5TvSQVkms9RZB25poH78afgmGYD0eEdQcwa7tmp/UWxUC
	 xCLzXUeU9zg03P3IcjUKiU9yGL87Gp4JHky4tFz6avWaFrXp8xQFkv2XreRCr5PItPUBp
	 ciho6HugiKLAWqP5SN6tlMtXCQdA5yYnvDKq00UbnxM2R9KRUalKhmHZKH4rO02qHnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CsSXa91d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzNcfsnC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D11606C6F5
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D11606C6F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CsSXa91d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzNcfsnC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F0Sf2682250
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JcDbmSXB55pbh/pDj+0+0hVcgTy+254XVZ5pIx4rYQ0=; b=CsSXa91dpCxyvxj2
	fCDh+DquoMmfC9cuMNT/c2dEpu9g9t17dZ844GpG1h05rpsfBunpcqRv54iiI3u6
	NimFHerF9cplX8hzp6E8RWHuhHbhNoctgXBUz/gvZlyPI3yJnM3LVnhUhW/mNKTb
	XdCDTW8g+hBvmixKT/Y7gE+BIWyUwJVumOujq/s2ALGLz+Obu5SsGdTVuOkeKRMK
	wCSfuQFpo/6F2wHBo43dPJRrt6dsHc54spYvVpjnMprPB6FjEo2PQLhzHPPhxZ8E
	zIOaKP7y6mhOEwmZ9t6cfcVU4XhrIcIKugPgBVeSVUqTjLoVHZXzYQiO2dCT2Jq9
	ZVVeXQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjkd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so729791b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358035; cv=none;
        d=google.com; s=arc-20260327;
        b=ElnNyTzSE5uSGrwJE4tEOwfFpDq1hwzD+vjCe0ZEErATRfA/UOHrQa2Ficy3313Jtp
         Wtj+YHxJ2SkYlu17pDILpSZ9SpeIKp+c113mYa1OsUd0VL6gnvcgr4Wu51PrE/XmRztu
         GttqDCoXr9tEyauheXnhen6IelDh13ircj1mbBS6IZaa6MNBpvmENCK5o/Po6hKC1hW0
         LT6tGp0fstgOpuCBDNSMUyDOhhD7BSBB0QEeq79iyA73Fni7Xu24KW+0P1dcF45dQbGK
         1kdN+hf8CjDK6toijmG02fjvmUlAWFk5pJ9NSwoKFjgS6mfDzj3BtNzL47cuyAIA7zsD
         1dGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JcDbmSXB55pbh/pDj+0+0hVcgTy+254XVZ5pIx4rYQ0=;
        fh=yxCiMjkNZL8oIa4cwSVWJHzmRKofFk17YeX+3unxqG4=;
        b=UuW+UmoR872dYpEn9FXT4wRYBgDKI/yE3zQctLfGqAtpukRhJc6HPAfvgvXhjRlCYQ
         wu9idOrFh80HQuHGPNx+AV2ztoaMQtPPKHDskuSDecvl0LJcvIVlu2AzqnL439vb1dDj
         cVp3vkbkpRhcYBL2pn/cT/k0wkGYiYatdnIsVC3YOx2Bg4YKHq2SKg1DzQjYMlzOpmOR
         DW/RsxPIYahk1+VxZ+x8xTpzuJwmD1nu9sXKERfjblSUvTZguHX7pQtkTO0Ll7VA3VGx
         GJXTUPsmTSUUCiRz5OSIjsmISpcOlPXS5L0ZeusmfigcUVkKkraH2uKHMbDsMo4YKMvj
         9Omw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358035; x=1793962835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JcDbmSXB55pbh/pDj+0+0hVcgTy+254XVZ5pIx4rYQ0=;
        b=dzNcfsnCTHFvM/87eonfepAJtGL99Ttpn9fVunVrZatzbz3RXK0jQ6eWn7O6lq/GPt
         P5+znCAcsH2vFkSpg5KXFoTTlAoQhurHSThqw1AxXH8CxyDTEFtd+Q93pB/pHIKugUaq
         3mkwNXgYSbAAVeYr3EB2flG60CFFyWa7J3qsgzntgv7D3wpNP4ELWI2sZYdiGtakvxoD
         q4OBa7kW0GbMwQTn6rYDQlTvcgZ1ma+7HSEBq1YDIEL9HzCx0+6x1gv3vCsLZ0HpnqRq
         36XnS7i7GCqFcR/BolE3R/ybHxPIwlUx/LnFsocwx7RQo4sGQY/wzLE3QrQbQTTCWNE9
         Xxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358035; x=1793962835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JcDbmSXB55pbh/pDj+0+0hVcgTy+254XVZ5pIx4rYQ0=;
        b=Y0F7uZOCDX7Uem4VvjMwEe6PVVvTMMNWZbL6jAODhHBsonbIxoFFPbahTZvWcCnpSe
         qzFcBGR9c1mxGfhpmGv3yfWrdcwLywEH/vUUBdQUJTRQN1GVVz0AHL+hk3PqbPDPjQwz
         J8lPXLneRoTaWr55nWVtMHm/9ZJVNT5jvT4Z9rqZsuQV5aRQ0X7n+xRd1YhMIzk2dNM8
         iStQzPpwIN5Rb+oeToDNO7T1ISyD2fjsTZZ53SFDxS7+7FwcmjHfxa5t0pqm4mWF4Ucb
         JxXDs9Lv7/EduBRhHGeqN29QiiTxQQMud30mMPiJyFUHHjCJi9F+ifYfVS3B25C/o3Mz
         78dw==
X-Forwarded-Encrypted: i=1; AKwUvByCU+5f+c3ag2ZEkLHoYINiKruBitJh8qgLw5hFFtsZF2AdOTCHS+ozFSPUU+cDE0BCtzDJZyy/BTA6jMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqb/A/8rgors+Ubmxyg9bx9j0tC/wp1tj6LXyNNpv18luOJGsp
	yMRK6Z5okj1QHkFDHl0EcvwuS723kNL8uUeS0Tk4sUnCX4TtyKReX0q6ttovMFiwo1Qt0jZPuPz
	24o5wnKJJoVTI1TMuMvnEhkTFOpdRuaDY2awL88wrgkl7sKyi+thNa2+J6EOEnloDv6iZco7wtS
	pFNhMt0XwKzru05Hr5UkOJW4GowLuGoxOvIsN9Z9Je5Q==
X-Gm-Gg: AYBFou058pE/RVBM49Cr/rowSL5dNvRsZMVjFBBRZZab+6sPCS8n+RLIuE0saxGiLZX
	S1XEI4hrpj+qbBGd6rLeWRnANK5nvUJv3TgfNenKCIEv02kxlNdumeAkF1GBSXJbZnbjiG0n4E7
	pE9Rp6UYN5Ivu2NlPkuw30WhZh9yrgIYHL0DaA3sSr+rr3f9MTsxHUx6RaUw==
X-Received: by 2002:a05:6a20:7343:b0:3e5:6c93:2500 with SMTP id adf61e73a8af0-3e9290799a3mr1931064637.57.1793358034452;
        Fri, 30 Oct 2026 04:00:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:7343:b0:3e5:6c93:2500 with SMTP id
 adf61e73a8af0-3e9290799a3mr1931033637.57.1793358033943; Fri, 30 Oct 2026
 04:00:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019143317.2222236-1-bruceli20040604@gmail.com>
In-Reply-To: <20261019143317.2222236-1-bruceli20040604@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:00:22 +0100
X-Gm-Features: AclHuK-5lepEJ6hbXHm1qJZsM8pIJhTJ4sodowpFgQQ3XyT_SGsEkcNO1TTf7hU
Message-ID: <CAPx+jO8FYgO-p4kph+p8Y0M=qHz_We=k=eVYO=Smd5KJ26xVHw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: wmt-sdmmc: release DMA descriptors after stopping
 the host
To: Guanxin Li <bruceli20040604@gmail.com>
Cc: Alexey Charkov <alchark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: EpB65-Bo1ZspdzttLEPQQP2i5_g93Ocy
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae478d3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=byypguvoXFTbGjyYA4UA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX/QCGd2I46sUL
 QfhJqdf350M0zmyrU6nTZypHR60GwaYYxAhnaUETDmuJlWnorZgIHt8+OS/zlC3XuLdyzDA50ox
 HeFvBTkbrtwkLZyMAhekN2sdVWDeM/TIs0k0caCGMd/Tza3dWU1Fk5tgGxOZNnFmVS7zFZY1vBT
 /AasERxf72lC6dH5O+y73PKTaKS3TOzWfAdxW1fl65vAWFNAaAEdrT29EU6cX9geI/Jd1UV7fUm
 achWejHDDYfLGaV6/d6ybkmGg+G0xcNnsPlwFFqUfpX4xKFTfngb1z/BEAh5tMeKoA769+6Jwwk
 i/RTvcpdfbkr85mssneKNMxpZ3foUWZ0H25DA2yaDt9COBYmRRjeM8aDzsZZfIwvkPy6QKlySMp
 dZ1pR0ALfAsDl5ZrIsVQTGxlYNCM8n3xY+ij89erhY1599TpRRqukKpm8mMbK9D5cTNxqMXe5WB
 2/klgZBWMI6A5iIRS7g==
X-Proofpoint-ORIG-GUID: EpB65-Bo1ZspdzttLEPQQP2i5_g93Ocy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX/7Bjfq8kFkll
 a90KD9I27eGNeSPSmVy3nPUf9fxVnDhDoHXG4Z3+CmG39imuvWu3IRPJKU04guO06Z+he8wphbJ
 Krih+JybfEszG1sWFVv0FyPIBCQDnuQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

On Mon, Oct 19, 2026 at 4:33=E2=80=AFPM Guanxin Li <bruceli20040604@gmail.c=
om> wrote:
>
> wmt_mci_remove() currently frees the DMA descriptor buffer before
> calling mmc_remove_host() and freeing the controller IRQs. The
> controller may still be using the descriptors, and an interrupt
> handler may still access them during this window.
>
> Stop the MMC host and free both IRQs before releasing the DMA
> buffer to prevent DMA or interrupt accesses to the freed memory
> during device removal.
>
> Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
> - Wrapped commit message lines to comply with the 72-column limit.
> - Moved the DMA buffer comment next to dma_free_coherent().
>
>  drivers/mmc/host/wmt-sdmmc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
> index 489daee4f4fc..55675aa8d08a 100644
> --- a/drivers/mmc/host/wmt-sdmmc.c
> +++ b/drivers/mmc/host/wmt-sdmmc.c
> @@ -895,15 +895,15 @@ static void wmt_mci_remove(struct platform_device *=
pdev)
>         writeb(0xFF, priv->sdmmc_base + SDMMC_STS0);
>         writeb(0xFF, priv->sdmmc_base + SDMMC_STS1);
>
> -       /* release the dma buffers */
> -       dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
> -                         priv->dma_desc_buffer, priv->dma_desc_device_ad=
dr);
> -
>         mmc_remove_host(mmc);
>
>         free_irq(priv->irq_regular, priv);
>         free_irq(priv->irq_dma, priv);
>
> +       /* release the dma buffers */
> +       dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
> +                         priv->dma_desc_buffer, priv->dma_desc_device_ad=
dr);
> +
>         iounmap(priv->sdmmc_base);
>
>         clk_disable_unprepare(priv->clk_sdmmc);
> --
> 2.43.0
>
