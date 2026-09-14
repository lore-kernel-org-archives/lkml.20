Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B360842124F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380572; cv=pass; b=EnX+SmnKUrYymRQiNVD33GUzXKgG7g2VhtO/5CJXQ+fdMuxEMYfwRC7cPW3+YRBbYHn/UmEn8p0eWudONY1sullWLJWTGXDVoe7hRlWVVsTi4R+rLKlHNUoUnjVO/TTug0emTvbqe/nt+75Z5bvULxBrX/8VgJX0vMtjE1hYIhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380572; c=relaxed/simple;
	bh=lYGwUA2Xxra6KgKrHICgQUeDiCGOArIbNNRe9D84Uc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KL8PAW0vN1XehGsfEs6lbDvYTr+HTGD8QwFgyxO0O8NgPVTOHkx0+/LSz8u0X9wzC2kE0iDIxnFBletIiYBbm4iFFQ4m7NC3iXTVawWM7To2UL3Fi7+XSO6Qfp1RVxB4+U4dtmUD4IJkGqkUfnpgw+dnJ0EK+WelUsWMN/FmqpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTJWsWax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BloN282o; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTJWsWax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BloN282o"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nwDX085634
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUkfAr3dLBYHJ43VED259V7T5siL3Nd9v9HANDkn5BA=; b=DTJWsWaxEWcyQxd7
	/zc8B2l8YfzSEJu1xocwPAoboX3DoCDxB7PEY/LideHUdL2MgdUoVbBdpcMPVOTw
	MkZaKJeoGtDfgrYhp6hhfa+UxAZHNucMsblfD9392xgKUn2zeJRsSBDqiy0vPgOy
	CbEwG0IG9SMgIm9j1VvH5sEUvFB0KRdW4DIRQ9lXWGOXWl0unTrNuKRmulXkK9xP
	YJzQn4VyPMOs3Pz1QzyWl9nV7XFlRZFJtakhVP8s0a3pF+qB9IcD4Z/AdhWEWUeC
	Hdc/rlib/HRq8aq7qFrtZwjWCE0nVAV9ZkeR3LOBZ8aRKxjViixoDuZT0cdq0zBd
	0TR9fQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9de2yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:09:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso40953945ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789380568; cv=none;
        d=google.com; s=arc-20260327;
        b=qFDQ0BGbn5gNXM+RGl+bMP0QjK0rSGqRrMWaSr8uk5j5zkjE/PBRug5jergCFSUu8o
         HjkO92oy3sROUdH4L/d/QS9idBqVRaBHzFHwRlgOsKUOwBdexze5waQVSqpZb/yTIs0i
         XFavUtiuqpjV1+k5JuPhoOGX/SrM5r0FWPgwkA/hjfUKJQ9urY1IW1CTbWVgDHgq74Lr
         VEvVh3rV4asxWzMA08cB0FV/pkhFBi2P/tCAoBHzmCmkgi2yBOeCge0mHQckU4ni42ws
         PAg2LXI2IwVmZx8k247BV7HxhNFUC2MBH1csJrjbq+2/zh5nb8qTVgLWYLy1eUaG1olT
         VIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUkfAr3dLBYHJ43VED259V7T5siL3Nd9v9HANDkn5BA=;
        fh=87HkJHU1aHzgZib6RuoLErWWgGDkQK5zBhHG5tQI0DA=;
        b=UZYawYK/ZCqn5SaG5YIIApqmbvlrbx1ZnfsHuf3/MG4NGoPaQWShy6ZILFiGe3xP6t
         7O5JnhKlQmoadJw/x2DIzRIeA0xYrzpiWJE4A0+4IizXAD+GGh5QpQRJC3wx6sOTPPkQ
         VUbj9tbb+wEN0rEyDATw+KuHx5M3npUv50HubXz1a5ng+u3EC1ZUOWOoXRRKL+5C8Kh6
         hiykIqzeZymkwS1qhZKLikurtcugZ4fo1I5Bn6G4uumNy0DNAYZEATtDfeHD4Iy32OFg
         bkaFGMWPoz1qAk3kPJ8G1VO/D/oEzhjQkXL/umLGrAK7IO2fwZK/JAJdbsn/mLiaP0XM
         SpSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380568; x=1789985368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUkfAr3dLBYHJ43VED259V7T5siL3Nd9v9HANDkn5BA=;
        b=BloN282odbzzEWbr6yDhSvGJIOYXvMlbC/n6XlxwdewmvU3pEggpVAHhmnex+t/Syj
         v8IveSQ9PqYICc17oLIn3SZlLCmsU/aZOGK2MuCsfG/AsW1g0cTaqf+jGnipk2RUN5CU
         fWvxs1lNv4zxqRoui2jSLRzAQ0xsa/yWxjRV1JvobFaR4Z5IjrQH1tVPXYG9OpxEYKrx
         gpRMS9e2mLy5gsiT2DQsArm/EMukKvYW5sT96hcU7xJSHRNh90UoWgHjyxBh0yco/cND
         lGZT4JdaGvMvW3cRgNMjpcoafQlPVNmturgCAK1Oa+Iaf0PC86Ecj6DkgjQ5e5Kxeu66
         TpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380568; x=1789985368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUkfAr3dLBYHJ43VED259V7T5siL3Nd9v9HANDkn5BA=;
        b=mSki3El4eEzo99jm3PQYU4axxYA1lreDdycqAPScXxvHgNanmPSsLsp+vbUO2Z05be
         CC3PwOK+LcQueO3ienijsHMe8qQz+edPc2D4mEnN7vtSMTvvFVenAwWChbuPICMbjcq1
         tnu7D/4exkPCu7N2Omcg84SrYYZszIx1d4Gzclvd8QSpPkJQ2iz6nCgBai4fF8iCdoGO
         PVknOzHhOajR7omvw/mBOD6NCMB94TN8s+nyoT+P6B7tkXKUcqL5Xa6H2297f9Tg219C
         3nbFQx4cLllVn4oTTUdafUUn32Y9fQNrKmcW+AFYjmnNCv0bU8jrPthxwwNyUndezAdc
         hVeA==
X-Forwarded-Encrypted: i=1; AKwUvBwICdX/4+FnaPMr+IWDCumz9b27JcXQb+E3xN34VhUTy29/4HJMuHACetZOvzupuFIGgLKFNDZTjlTFDug=@vger.kernel.org
X-Gm-Message-State: AFuF++lmokXKCxHGnapiV3avZenT/4MWcUofWUAQYI+AGWybdjIteG80
	xUSjlF3Ld5bPxECl9ZJet36CUdIey3C40s0b9vv8GJEXLxM/hSQMWEEl6cXpgAhm/A5F3ixzGH5
	IAKP05VTQ6JKpigu3i33dCS1w4JgokdZj/LUpzRKJ3EK/e/phu5Gr/BbDXbTdwG2BHIJJf/y6Lj
	BMPeC9DsNG+k6ionKSfIsIlGuKshNs7g2uoOg2VEpLPg==
X-Gm-Gg: AYBFou1G5zKEY57KltRpHcc7HwHfsMljfLM2Llw49PUZAyeA74C55Nl6xYlYudu2H9n
	Qm7e2F67mYNYCUBIQBtbIeSHbCbvr8SvBhs8f4KoLnENIOQkmemD5RsdeXfK0B5u/aIbQIgwuux
	rDXdcK6FBt3woI5PVFxSk4j7jE64HykFKsoUMVD+nCXZrZI1ApkYim+4kZbQ==
X-Received: by 2002:a17:902:fc4c:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2dd6c6db8b7mr42625975ad.14.1789380568304;
        Mon, 14 Sep 2026 03:09:28 -0700 (PDT)
X-Received: by 2002:a17:902:fc4c:b0:2d9:123c:8c49 with SMTP id
 d9443c01a7336-2dd6c6db8b7mr42625125ad.14.1789380567732; Mon, 14 Sep 2026
 03:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907064632.8926-1-hemanth.selam@gmail.com>
In-Reply-To: <20260907064632.8926-1-hemanth.selam@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:09:15 +0200
X-Gm-Features: AcwNN1UHbb7Un59MqnfrrdPT2h7Y8EIzqrVWafIOztdgL3w_NXx4_dDPh0RBRQM
Message-ID: <CAPx+jO8KoLW+dpKrgdAnwDpWxNn-uJcUGS_j-VUGyW6YPTXoMw@mail.gmail.com>
Subject: Re: [PATCH] mmc: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Shawn Lin <shawn.lin@rock-chips.com>, Nicolas Pitre <nico@fluxnic.net>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX98+MmDbqnI8j
 kQ699qOd6Qk17aQ6pYiRyf5jbNvQu6Abcy+Kh5bI0eUg7m6EDSLapCIY3yPyruwAsN6hqV5lZpr
 7Yao9Uz8820NOUEtdbFngG3RqSMOGNWJAB8pyfCatkjfUYhrgjXtiycPHfDj8XULJeKwh3g+Mf0
 O0l8dzE31OdUZ2Kw59ZeXBg7w382Wriv5OHGms78HCncWRFu3Di9y2dG5DcR3dXAwf7IlrkIMCI
 SYxIHKzTnbAxs9XwhvkzpvoM6rlXrETMO2H7nmN6ZXlE/lVefnLtHYglD4QGqtlb4JnbrbnvnMB
 AsMMLHL8eSiKH3maQ5Zkh/1wRmwxOTGX+YQ60u0cUMvCAOySD/fu7DFxx1MsHc1K+G1d3xgcKMR
 3KSv96uXB+cJfYRzxyYBy+dlHufiwDlOazlDooSOSVakHc8OQGTWuvuTl5lEyOSGTRL7N3kyVRh
 32CmkZZ97EBQUciS67Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXztW6vUkXuZnp
 6E0OxpwVU61/Vu1XIcLHIswFyaknUVNNbLn5QamYkUF/0Tty51yCaMzrFeKFRCph7UGLxoOYX12
 Bm3iTwYTO67Bad2VG1HegOf6Gp0niEE=
X-Proofpoint-GUID: zjTvlFjIinna11LohatVja6YD6AdVZKe
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7c7d9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=_vvJFgV3Y_p9qj4_XX8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: zjTvlFjIinna11LohatVja6YD6AdVZKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140145

On Mon, Sep 7, 2026 at 8:46=E2=80=AFAM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
>
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c  | 2 +-
>  drivers/memstick/host/r592.c      | 2 +-
>  drivers/mmc/core/block.c          | 2 +-
>  drivers/mmc/core/core.c           | 2 +-
>  drivers/mmc/core/mmc.c            | 2 +-
>  drivers/mmc/host/bcm2835.c        | 2 +-
>  drivers/mmc/host/dw_mmc.h         | 2 +-
>  drivers/mmc/host/mvsdio.c         | 2 +-
>  drivers/mmc/host/sdhci-msm.c      | 2 +-
>  drivers/mmc/host/sdhci-of-esdhc.c | 2 +-
>  drivers/mmc/host/sdhci-omap.c     | 2 +-
>  drivers/mmc/host/sdhci.h          | 2 +-
>  12 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_=
block.c
> index ce33907bfc24..e2bf563ccbe1 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -720,7 +720,7 @@ static int h_msb_parallel_switch(struct memstick_dev =
*card,
>
>  static int msb_switch_to_parallel(struct msb_data *msb);
>
> -/* Reset the card, to guard against hw errors beeing treated as bad bloc=
ks */
> +/* Reset the card, to guard against hw errors being treated as bad block=
s */
>  static int msb_reset(struct msb_data *msb, bool full)
>  {
>
> diff --git a/drivers/memstick/host/r592.c b/drivers/memstick/host/r592.c
> index 605b2265536f..dc3de63901be 100644
> --- a/drivers/memstick/host/r592.c
> +++ b/drivers/memstick/host/r592.c
> @@ -289,7 +289,7 @@ static int r592_transfer_fifo_dma(struct r592_device =
*dev)
>         dev->dma_error =3D 0;
>         reinit_completion(&dev->dma_done);
>
> -       /* TODO: hidden assumption about nenth beeing always 1 */
> +       /* TODO: hidden assumption about nenth being always 1 */
>         sg_count =3D dma_map_sg(&dev->pci_dev->dev, &dev->req->sg, 1, is_=
write ?
>                               DMA_TO_DEVICE : DMA_FROM_DEVICE);
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index e760d13ee325..a02bb2fee874 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -86,7 +86,7 @@ MODULE_ALIAS("mmc:block");
>  static DEFINE_MUTEX(block_mutex);
>
>  /*
> - * The defaults come from config options but can be overriden by module
> + * The defaults come from config options but can be overridden by module
>   * or bootarg options.
>   */
>  static int perdev_minors =3D CONFIG_MMC_BLOCK_MINORS;
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 29e80e5f928e..08d41f0996de 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2004,7 +2004,7 @@ unsigned int mmc_calc_max_discard(struct mmc_card *=
card)
>
>         /*
>          * Without erase_group_def set, MMC erase timeout depends on cloc=
k
> -        * frequence which can change.  In that case, the best choice is
> +        * frequency which can change.  In that case, the best choice is
>          * just the preferred erase size.
>          */
>         if (mmc_card_mmc(card) && !(card->ext_csd.erase_group_def & 1))
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 05444ecf3909..a02b04938e1a 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1015,7 +1015,7 @@ static void mmc_set_bus_speed(struct mmc_card *card=
)
>  }
>
>  /*
> - * Select the bus width amoung 4-bit and 8-bit(SDR).
> + * Select the bus width among 4-bit and 8-bit(SDR).
>   * If the bus width is changed successfully, return the selected width v=
alue.
>   * Zero is returned instead of error value if the wide width is not supp=
orted.
>   */
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index c949a3eaae79..efd1903c3ccd 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -1095,7 +1095,7 @@ static void bcm2835_set_clock(struct bcm2835_host *=
host, unsigned int clock)
>         int div;
>
>         /* The SDCDIV register has 11 bits, and holds (div - 2).  But
> -        * in data mode the max is 50MHz wihout a minimum, and only
> +        * in data mode the max is 50MHz without a minimum, and only
>          * the bottom 3 bits are used. Since the switch over is
>          * automatic (unless we have marked the card as slow...),
>          * chosen values have to make sense in both modes.  Ident mode
> diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
> index 38610c89d54a..d500a419e2cf 100644
> --- a/drivers/mmc/host/dw_mmc.h
> +++ b/drivers/mmc/host/dw_mmc.h
> @@ -69,7 +69,7 @@ struct dw_mci_dma_slave {
>   * @cmd: The command currently being sent to the card, or NULL.
>   * @data: The data currently being transferred, or NULL if no data
>   *     transfer is in progress.
> - * @stop_abort: The command currently prepared for stoping transfer.
> + * @stop_abort: The command currently prepared for stopping transfer.
>   * @prev_blksz: The former transfer blksz record.
>   * @timing: Record of current ios timing.
>   * @use_dma: Which DMA channel is in use for the current transfer, zero
> diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
> index cf705b265e21..7d86426c6001 100644
> --- a/drivers/mmc/host/mvsdio.c
> +++ b/drivers/mmc/host/mvsdio.c
> @@ -717,7 +717,7 @@ static int mvsd_probe(struct platform_device *pdev)
>         /*
>          * Some non-DT platforms do not pass a clock, and the clock
>          * frequency is passed through platform_data. On DT platforms,
> -        * a clock must always be passed, even if there is no gatable
> +        * a clock must always be passed, even if there is no gateable
>          * clock associated to the SDIO interface (it can simply be a
>          * fixed rate clock).
>          */
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4aff965f0e2e..b229545d9db5 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1770,7 +1770,7 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_h=
ost *host, int irq)
>
>         /*
>          * The driver has to acknowledge the interrupt, switch voltages a=
nd
> -        * report back if it succeded or not to this register. The voltag=
e
> +        * report back if it succeeded or not to this register. The volta=
ge
>          * switches are handled by the sdhci core, so just report success=
.
>          */
>         msm_host_writel(msm_host, irq_ack, host,
> diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-o=
f-esdhc.c
> index 8345e2c5a034..1ca3562d8f73 100644
> --- a/drivers/mmc/host/sdhci-of-esdhc.c
> +++ b/drivers/mmc/host/sdhci-of-esdhc.c
> @@ -1381,7 +1381,7 @@ static void esdhc_init(struct platform_device *pdev=
, struct sdhci_host *host)
>         if (!IS_ERR(clk)) {
>                 /*
>                  * esdhc->peripheral_clock would be assigned with a value
> -                * which is eSDHC base clock when use periperal clock.
> +                * which is eSDHC base clock when use peripheral clock.
>                  * For some platforms, the clock value got by common clk
>                  * API is peripheral clock while the eSDHC base clock is
>                  * 1/2 peripheral clock.
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.=
c
> index b5d7c1a80a92..7a198fb26628 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -332,7 +332,7 @@ static int sdhci_omap_execute_tuning(struct mmc_host =
*mmc, u32 opcode)
>         u32 reg;
>         int i;
>
> -       /* clock tuning is not needed for upto 52MHz */
> +       /* clock tuning is not needed for up to 52MHz */
>         if (ios->clock <=3D 52000000)
>                 return 0;
>
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index f0fd81409a86..98c1fe20bfcd 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -409,7 +409,7 @@ struct sdhci_adma2_64_desc {
>  #define SDHCI_MAX_MRQS         2
>
>  /*
> - * 48bit command and 136 bit response in 100KHz clock could take upto 2.=
48ms.
> + * 48bit command and 136 bit response in 100KHz clock could take up to 2=
.48ms.
>   * However since the start time of the command, the time between
>   * command and response, and the time between response and start of data=
 is
>   * not known, set the command transfer time to 10ms.
> --
> 2.48.1
>
