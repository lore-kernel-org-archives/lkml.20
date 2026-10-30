Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368115;
	b=QtI4RhiN2w5r/5p/V3ZMHs6Wk7h310RaFgt3KPre6GkKBA6MBu3d/0yknYQfzI9ec+1n
	 3tNPvF4w4WDBnxsZdlTP22JeIbSeQekRTQOXJjm7zYaTyGWmkQTsK61kXDHdikjJ/gX8N
	 cROCWOWnMkhKM9OF5S9M0++RKQy6Y0DKTsTMU4SQBD/DTqyjwOyS19vmQBVijty4Ktgwn
	 62AIy2D34mReynooN++6eRem125gpmgnDndWbZNhi/3q9HoVne+xCaHQNNCbmKxtFWYHI
	 0hqnjBGGuCBjf0aVbRLZZg6T7vLTchSEjXJkWFh97IJ4cOYqgVd5Ee2aZysrGw17HIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=;
	b=WWIG3xHi/SjGshK5/UdwrY0899HQXLYpeLOTE0PgdV+LYDoJ6uKKQOvoAGiQ6yZZ+slH
	 wvDJd0SLIij5unF+VLNYBcFk67kJhEhe8PSKlJqBYNDDI2XnNL8bahrFKwhGOGRX4Z8EL
	 cQFVG986/WFSdDQxp+xLajTodVIspCeohhV/90PSuD/0/5Nwhk3OVIGecfM92w7wUmHYe
	 QsdTCgrlOG+Y7wQvc8YsrFT3AfNp1vTlDpzj9O4wk5ofowVuaixWOX/jc24WIvoT2Ncqy
	 Y+phNfdnXEeIQ8UwKJhEuIISncDcLY+hUaOYQBF+UK0Jq+hCWPT7Eym/6Df/gwfrqjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="c/DM/FsE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PHP/3giT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58281606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58281606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c/DM/FsE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHP/3giT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG8eM2541703
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=; b=c/DM/FsE/PvGatCB
	uHka36ASu+RBqlZXDh5c8v44vLCvMz2Fnr+EuIlLGWP2mMLccbfKE+cOMDb3uuQz
	JtFSPlJv57t9N87udPL5JGi5jaQVD37tfqZsJVQSJzfgyp9yKJpmhaJH0pT2ndzF
	S7A2M1SDtNhxRq8PXeAw23yGyoLTMp3sfAWaCWi/ZurIet2YDe0WmR68qfxlJ+XS
	bgrGbP522PgSkVI85u73Z60H3ULAg2bgQ8e+a75pK4Dlisjw1S9yAkZO0jRgNEex
	ZY5Nrsi/BKmyhc49WC5EQl+1lyMzNnRdz1I1yn9zSusITE5lyA0PEOH9neHB4RVX
	BGsZ1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qka0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:48:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06750c74fso628302b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368114; cv=none;
        d=google.com; s=arc-20260327;
        b=OO9EPU1g1MhBTgZjMG1QdloWUwclL/gysDziakb9LR4+PQeAtVURrr6c0hzisGDUx3
         vKnvDiIvom6tmbqBJ7teo9Af8dMqcbqwD25YTwCYU7/p1sL8kAr89tRLSwR6mNI2j0CE
         Z23vnJrSRzZdHQUjlxl3CPlOjdcvZxFY2YF+9twr6Ln5qBFknYwRTyoFyEdG/V8zbyRF
         QZgtGI6n9RrNnyHHJZbF6hTdJ/bHdFXhR7K6XwUa+9hQxbiaFL1E1aMSyQRHVkf99jln
         1Or7/pkM0Hn61k7aj7+z9h6wuD13vGsHEcf7+LT6fxSRRLqqKaETj+jmX612vm5eo7IH
         8IWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=;
        fh=ILBlpZSlouxl7wPPNi1GJdtJr8cJVQnAmzOuZQQKgCQ=;
        b=KjwJaIIdOBriw7wxO16ZfjvMDf3DWjzRZTjAEWYZyEzNNVgT1nysEwGu80Y7hC71Fk
         SGEJNIKpH/dkWPwPFooif/tmSFMfh2G9+YXdu6auJ/mwa6k8gw+qZpKMCWB1h5/muwkF
         StbYGNYGSf1LoU5h9dzRGaeZzbVNGyHZs+k+M0V+GtcEThHhC977h6h851yQFvRdjUPq
         CYTicmFplB3qWgSN1FFMQRaSgF6RmFiq+LAUT+J+gwsc+GXsHYfatjSGbdr+YSPYotQj
         PyqfIhuD/YxwDn0kUAvBYZ4t4hC2skTvydaJR1OZ0L/mFzKTDrjKJdqQTaLYW14yOr6D
         h/jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368114; x=1793972914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=;
        b=PHP/3giTjMF7lKWza8bh+CiK/BFOIvtrR+339gILA4p1/LALnjUX2e4K7B6LcXSlVM
         R+G/uh+XluMWaYMFmZT904UKTJvGWDd+lEvapAKIdNf+8/UP3l9lfor2sr4zSpaLEJAL
         LcDr63kqNW5OY+xig4kbPGqOfwBaddFNRVBshFx/J2IWVmKfYVaR2rKcscVCrtQdB8Nd
         wrE4LpTyKZFWHrCgmUSsNVjuv9XUpVTrTqXm3B97Ca+BxggO+W8RJhBCYSP27aIOoPrX
         52zTkFCP8LZ8N4AiN1Wv2EAJvJ4E9HsCD75TKbOJlCtN3hPUSn/l3miVbRBfH/X28hMT
         0Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368114; x=1793972914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmUXIOYlZlxH85m2DVy0bxyeuAHl0OHWFMsew9sjAhY=;
        b=hmyC8UgKaMNu62MW6/Kv8tIT6+ZOKOvkNhacDWkNx0RQSw+lq3dr0m3kFy+MhwLAzP
         n2ThSDrmYgVxm/dkEYALBZ5zeTMYHYf/T9jx4O7+Mfj0EsWs5SK7MXXE8q74JaLkkdsF
         +8XEtzGZZuuc5M0DtY8pKyOXcRut7nfQBMLhe1syWjw28FIbTBpXwxc1EhL3Osi2rbbF
         YwdmjPEex/HM+99iwJFmuhqhg1D+Erlzva05QUzm2Q89mpVJDE8nnOyj4WSnxImraA1Z
         H6VjV6AgiUiGo4mIBB+00uZT0SPO+76JBbGL/Fyfx/hLj3SUyLeRTM8Lg7+t3Pl/MJM1
         coDg==
X-Forwarded-Encrypted: i=1; AKwUvBzbvm7BhCuiMW7aKmUOgIqrZRzdpBu0UYdD9abhS9YiypfLlslzPygdIP3p2w5r1PDDGtzTlc2aRHB9YSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+UDcFrak9btlHCo4x+6hYwhnzpUbYSK7cA+6ogM4yVE8lzUXY
	v+/ZgXV/yYlXifzup9S1UHJqDcHn2r3x56hwFi8EQDjR3DIYldGQ/5JwDaM6E7qPY3a+p+70p1z
	bEdff+tGj0/X3Ei/YRcxA+qdWATXTy6My1F/+gIQoOhcSTFzfCVgzhDPLe/58OCv6T7dCtTJmPv
	5AkkraYho/3IUqcQHWI/HtY5fDBl+omZo89M5cotZbpg==
X-Gm-Gg: AYBFou2kDvK8LsrHEq4+62fJDXlGw58+PeRynOIngXiE2v+IK+OgBQV1fQSdiYB+mcL
	gDturTvY25ptYaozmjven6aNoGI65uuYhPjzQZubDe0X/yKk5xYniwMcgmbEJ6dqErO7JZs9KqR
	85ikpLAISkRXconqas68gvrjWln5Ev3TdAFNnLGiQHiks1hWh7RRBfiKmbdA==
X-Received: by 2002:a05:6a00:419a:b0:89e:e781:eec8 with SMTP id d2e1a72fcca58-8a9bea6ab26mr1853272b3a.27.1793368113519;
        Fri, 30 Oct 2026 06:48:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:419a:b0:89e:e781:eec8 with SMTP id
 d2e1a72fcca58-8a9bea6ab26mr1853252b3a.27.1793368112912; Fri, 30 Oct 2026
 06:48:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179318778660.81375.11263258280496155344@manyhobbies.com>
In-Reply-To: <179318778660.81375.11263258280496155344@manyhobbies.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:48:19 +0100
X-Gm-Features: AclHuK9CCkGJy9uu3I3U-z2HN0uRBI4HDWUAxzxMZ9SG5mkVVBtQ_beC3L-ge70
Message-ID: <CAPx+jO_VxJctXCZMVdzeq4CX-Ru7ACM6=wQ7GMdG2+4F1pOcBQ@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sunxi: reset the controller after an update-clock timeout
To: Tam Do <tam.do@manyhobbies.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX0I9gZ1KRnBG+
 Aj+NF7dzZAYXvaffxamjEszunrPt706ap8Rx7qvhFGH7v11OjJxjTLv9ToDGXs3RStfee6PnRjU
 A8ifGBqRzx2tU1cyuQS54B7AAapiHMNxNIj7PUY6WHQeE8Q93Q229+s9qo/ibNayN2lBouFLImY
 lwlHnLg7hetQnZAkqbB3eoF4hv08dojEEwAzfNFZT7SPKG/CRK0u0/Dl6qjKWLlNUQcm5hLtUXZ
 IkxEPVhqyBT3Tfvmt4Du0tc+WTraWrI9970m4iXxiTTQdG4G5TIGAtUBGmIXd7I0rbkLS4Egy4+
 UOCfvYnuhODO1t/fqPbqfDOj+X+qcGV9QV9uJLI4ZqQaPbQ9WHRKUvFMHzh2p9oHBNlu5yiCXXh
 D9g16kpNvtd2AD+8+BOxHVfbyPxOqvTzItWECVU5BJX6HxE5rEc0Ijr/l/Yb0/MnwTySjTrGc4e
 HdArLtRt3w1CKyFUzvg==
X-Proofpoint-GUID: YPDKccmGq3gRRm3OOrHrD9iIHb1YbtDE
X-Proofpoint-ORIG-GUID: YPDKccmGq3gRRm3OOrHrD9iIHb1YbtDE
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4a032 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=w2OPf45SAAAA:8
 a=BQrJblB4Y1Zt2l009CUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=-iXIJKm6ftRzmWoHelNS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX6RlAEwwMBwCd
 f8FaO86Kit9Hi6BSNI/olnsL50TKzRtZVxtuDfecTEHbeBhHIB1unJErZfOXLHjCefurTIKzMIs
 xMvdxaR+2kpn9+6necwnqLig7Pomgms=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On Wed, Oct 28, 2026 at 12:43=E2=80=AFPM Tam Do <tam.do@manyhobbies.com> wr=
ote:
>
> If the clock-update command times out it stays pending in the
> controller, and every later clock update times out as well, so the
> card cannot be initialised until the next probe.
>
> This happens on an R16 board whose SDIO Wi-Fi holds DAT0 busy while
> its supply comes up during the first clock update.

It would be nice if you could elaborate a bit more on what goes on here.

I assume it's sunxi_mmc_oclk_onoff() that is being called and it's the
loop in there that times out. The question is then, under what
circumstances are sunxi_mmc_oclk_onoff() being called when we are also
waiting for the SDIO card to release the busy indication on DAT0?

>
> Reset the controller on timeout so the next attempt can succeed. This
> runs sunxi_mmc_init_host() with the interrupt enabled for the first
> time, so write REG_IMASK from sdio_imask under host->lock, as
> sunxi_mmc_enable_sdio_irq() updates both under that lock.
>
> Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Al=
lwinner sunxi SoCs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tam Do <tam.do@manyhobbies.com>

Kind regards
Uffe

> ---
> v3: take host->lock only around the REG_IMASK write in
>     sunxi_mmc_init_host(), not across the reset; v2 polled the reset on
>     jiffies with interrupts off. The return value stays unchecked, as in
>     sunxi_mmc_runtime_resume(): if the reset itself times out the
>     controller is wedged either way.
> v2: held host->lock across the reset (not posted)
> v1: https://lore.kernel.org/all/179307312104.39863.12372814163472848752@m=
anyhobbies.com/
>
>  drivers/mmc/host/sunxi-mmc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index fe4c0f6d73f3..55313780d06d 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -322,6 +322,7 @@ static int sunxi_mmc_reset_host(struct sunxi_mmc_host=
 *host)
>
>  static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
>  {
> +       unsigned long flags;
>         u32 rval;
>
>         if (sunxi_mmc_reset_host(host))
> @@ -336,7 +337,9 @@ static int sunxi_mmc_init_host(struct sunxi_mmc_host =
*host)
>         /* Maximum timeout value */
>         mmc_writel(host, REG_TMOUT, 0xffffffff);
>         /* Unmask SDIO interrupt if needed */
> +       spin_lock_irqsave(&host->lock, flags);
>         mmc_writel(host, REG_IMASK, host->sdio_imask);
> +       spin_unlock_irqrestore(&host->lock, flags);
>         /* Clear all pending interrupts */
>         mmc_writel(host, REG_RINTR, 0xffffffff);
>         /* Debug register? undocumented */
> @@ -688,6 +691,7 @@ static int sunxi_mmc_oclk_onoff(struct sunxi_mmc_host=
 *host, u32 oclk_en)
>
>         if (rval & SDXC_START) {
>                 dev_err(mmc_dev(host->mmc), "fatal err update clk timeout=
\n");
> +               sunxi_mmc_init_host(host);
>                 return -EIO;
>         }
>
> --
> 2.39.5
>
