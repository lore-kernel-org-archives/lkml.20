Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792760033;
	b=oPa4l/zypbvoSfHgfPT0giVgrPE5a6Vx5DN4kU87ZFbwazOL25xeCW4WwYuzL9InIqJE
	 5rO4kguNvvNTOr1jIDC8BGO/vO4HILs0B852Xt0AFtINJyXD4h3fB1OijDcKpkT4Ara+I
	 LfsaEPdjXGyWyRV63CKrF3Smcmf48OqKY36rvGyQHdyQiYjRCfKKZqntzA3YzpcmbR8Y4
	 km5yCA9+EwUGfUAce9eSoIdjlDYExl1zcHkPU342fOPM+Or904zJ/3qCgFJ9A864zySUr
	 aLmWsYwhAbLTg8KCcpc/dUR29+leEj6stsIFsaS9ftarxAfnxpEqX0sSLgOamAdUHMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
	b=1HBY1h7N/YHnyaWDgylOInfcA5ewMESzM35BPZw8oXuyo95YChWr3AZyqtXHO9T+StYf
	 EyMIrIBt01Fell3RSHsVC/F+YrxvRUqShw0U8/s1QTRzc74kNv1QFEY9qSjwxlQvWnW5B
	 PJIhCPsUoQ97zxl/s/Rv2gOdvgWTha1uzKDoRuFROUpNA/xfVwCAtn7HWY7dEilvo844d
	 Z8IEcPqoinC5Jj7cIF0+EvDZQ8dD7A6FlIIZu4McfEU7q7KWmjPmh3nc23U4tgx5xWCty
	 RC0ElUIpVDIq0VRjpMJOcT/l8qZeOxJA26+YD8/HIUScqTyMR1QoLqbYlGbAiorGNDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k84ztsh+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXls9Rvn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014FF606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 014FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k84ztsh+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXls9Rvn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NCAvmv3823142
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=; b=k84ztsh+ot53pSBG
	jiTg1dSaK+oMQc9D7xA+HgHuOZWpuLp3Bvqo13JWoqTssTxPnu3DiCT7aw0xyXnE
	RT6y4OMl2AuO6bb97phV2Q2m27M9GBi+txFNJy1PnbrbtbWgGuBBy1jGT2o2Glyj
	VtnyZKcroVaq5xaitlEzPXctl1jOXjsw6ATbcxQefKFGiZrgJnoA/18skPLXlTuh
	i4HYKYHjOLvMbY5rmQLJ8C4xlHxY5RgSJoXH9e8lf1AONUjVv0nvRMQ6P1Yh8p4g
	c5EmDXZp6s25pmBjf/L5xFz5xkwVWZ+6gPkBsrb/Ycyhvxa0apN/1TYNBwIMdN95
	ff14Kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw04fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:53:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so148534685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792760031; cv=none;
        d=google.com; s=arc-20260327;
        b=YcTIasRTGp682jt1sTZwb9FypYxApQ00e0cp278d66TNVLL6NxX6TOU90V9z4ucPpV
         EGGmXIZaeVzij/U9by1oS73J6nx55eRlXsfQ26NT2f0womMdf7Dxf5TyCY6osOe4mu7o
         9/+XsQ4A8wJ+9WGeiD2pW7T7MzUrTistArRJOfTvtwGZUi3FAybUkkdGH6veSFI2omXB
         gXcpAjWoMaXpztLPmV8t1Fn0VlSbi7rgBCAxYosr4MiPtSRMP4LwDYTW5xwBXd6yBWwh
         arPKGajhiKkUCWhFtgdlqz24h2QFqnonwVyOosZvzwS1TomhokE0y+l2J92QuyKlvuOE
         Nl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
        fh=z1V75HwaMkbdWT5ia6fuRt9Xd2P7oIQNTFZfiwSflrg=;
        b=sQGZUB/hv+n7BA2fMN1QA6Ta102OJqJ0rjyJ2uPzM85woMj2lEo4U6DO8ltEeyDM0E
         FccAA/defM5WSUO+j0S/MRzUNfZ9DyBv6QvI7lDK+E4cPz6noGz/cV3n7cd7whULFB8t
         JZC3yr9YfrTlFNxfShOvlT6w491MY4BAWIzHUoaWtjcbIb+Iug61/uyapLuJhoC0fDrq
         9H6+I1TNvuwZtlWjjAtT4qztBcJEH9YA+ZwoiIq0wdm8v+hgFcU4nzSOy3j+bf2OY7IP
         d5j3LWkflejntxKAbiLNPq4o50XLb6J6A10VxthEksjGy++k/DD7Zz3kFToRjUnxUj0T
         VcGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792760031; x=1793364831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
        b=gXls9RvnIYR2YK5cmUlO7e3CR8/MOnt1zZSp4Py9+smXc6q/yEf+3cA7UNdcAvtl1z
         4mTmhog5wJzLRPuL6fL79LbvMHtJxMq5jKJDzFHPN30fmTlGssKoMYe8iaSV0pqELicK
         zjiQfjKajbOkIlNR/miwiSjSr57KDQzYhYC8qEw4oiaLO4Ni7CEOJkTMrvhm8zh2FMr4
         h8u/pD7gZMQFDHJuLfRBQhQ5n++Ru+3dUKVwyjW7epYIEkUR1ZqenmYtx+bXJyLw3ytT
         zC/UbzFFWX+BFsZXhIzh73yMbKpXQnQCb9NsfYF9RK7pKqXsn+Zie9geyE0xn6Jvr5Kz
         zB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760031; x=1793364831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
        b=mPzcnwPqc6wM6ZDGcwUdO68d500R9R0hnYzGG1tRiQo3lMlLn2SqlXxjfkUxGzXQu8
         IsWSTWMFnCQd85/beIXO+gu4xMtT4U5aOPVxiEj445p7VdaqORkCkSkDz7GIb11uvWNm
         42iYnIsKnNHp9zz0W4FvzMt0jTPGzWFOve7qSPabblEVSzY3g3caXCN8QCO0Uo06Ir+5
         71KPJEFWYQ7sQ7ZYr82vgRGjCi5BEDbEbTFfYw/gWl2Az8BhthGm/hr/Shp4gtiWXk6x
         oe7/emUdr61nLIvWWJx9pYgIBGsXc0M2LFpIgH0d/Ft4OrPfpliIA3PkKkKeHYjo7nU9
         EAjw==
X-Forwarded-Encrypted: i=1; AKwUvBzM7Jt+O05kUL2INJPu0JtYjKGzq3+o++zSqRSCLHE+rIwrcBcl6Y2+N5yi0AN33694rWX/T14GdLu1PyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpMJlb/WJ8ym374vBeDEzyXxzmxUYqQ+ljiUYirllEX3CPMUiB
	b4hADiFqX2wVCywtSebMCSGTfUyAiDg/L6y9nIgBHLgAnPffXCkVDYJ5HS4xoCrOv+0i8c9CL73
	sy16eSeaYezX2hLJb9ZA9NXFw40FJx0+kFTIZayGKTGyZx06fW701JyrSHs7awCCsCMsBEIBZUq
	SjEcjYYtthP9l/O+/NDnh7jDSEKl2bnP4eCfL9L3U1+Q==
X-Gm-Gg: AYBFou2BWBajESwNU0I8DZbbdPpwZNCJ0zELWSVYdOFEuNVlWWMgpN2pERY9u1nYuwj
	A7kQm+sPaGcMs368A+GdjV8dcTAXGHPZNYpAx3evzElQyJ45BbM7kdFD60uu8Jl4MGfNly5Hh8Q
	kOBupAfiP8FCf5eiR3n5OnVel06RwiAhjLs2SEAAL1mNGScqfwqFCgwok06QMj4Ms9/fpMZ3M7N
	IXkkLGiA+JR/qanI6AY01SlvDRXStEg/hPcoOgaP+F7anJn/vS9A1WZ5P3xUJRIBqmtApXsHWo=
X-Received: by 2002:a05:620a:2608:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93f6f9b51femr330274785a.57.1792760031092;
        Fri, 23 Oct 2026 05:53:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2608:b0:93e:7ec0:7c63 with SMTP id
 af79cd13be357-93f6f9b51femr330270785a.57.1792760030624; Fri, 23 Oct 2026
 05:53:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022071418.26895-1-bjsaikiran@gmail.com> <20261022071418.26895-3-bjsaikiran@gmail.com>
In-Reply-To: <20261022071418.26895-3-bjsaikiran@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:53:39 +0200
X-Gm-Features: AclHuK-A5Hp4e6c3qITTZozdBZs-UH-SXsDSTVo8_muXWDLKvdme3VTjvVNKGIQ
Message-ID: <CAFEp6-0cFMSRcTsgOSvep3unzb+vwFGTRaQCyt8eYrw=Os2L=A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: ov02c10: Fix sensor power sequencing
To: Saikiran <bjsaikiran@gmail.com>
Cc: rfoss@kernel.org, andi.shyti@kernel.org, sakari.ailus@linux.intel.com,
        hansg@kernel.org, bod@kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org, jishnu.prakash@oss.qualcomm.com,
        birk.skyum@pm.me, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: gnSh2zxwahBRCgtlBQEPhDX0m-6dD6qP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MCBTYWx0ZWRfX7oxFKSh8fD+N
 k82Cd4+EKCyr5C2ztqPbByulyCYFDHVyQOPFkGd0vFolNJrK7QQp1aCIXjLTWvixSpg5CkA8i9B
 I5R3RsKLv/ksH/Xyvy0XwfdZJgHcVCs=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb58e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=WXF1KB85Zuouuk2w01YA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: gnSh2zxwahBRCgtlBQEPhDX0m-6dD6qP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MCBTYWx0ZWRfX91YXR3u//OIo
 +teBYJxkYJGM9Q1EQOTL/X0pPCgaowOuKb+Z+oiEBowS13QUwiO4mHTpVChJc2T1vpELOYQrY4M
 aXMt9lWs9kiDAtlbAOQ+TE7a8ezWrBu8JJd0m3ZqPhLDMxWNU5k2z6S7IngxMLfMFwhk+WwZOJY
 4e1uYrZfZIVG63E1noMtRC1HUO7PNR1fp6E66GJoOUvHQQNJeyf1ZQE6r6CMp0oqSxFNSd+PBgC
 PJ9wY2icQybWAT7+HkER+x8M3LDjwLjzoiL9hEKUOY+YdjBtockNVxZfd4XEKWuJE4UCsSFOnz4
 f7eyLkGkVL468h+rtb8D8OQ7nA1tywplat9OvBpHIItkVBPYVUHJ8ANtCUwhR1l6TCoprhHdzZJ
 TEhjNrJ8utG1cwnoIEu/9/hrvJJf9Dc8ikwVmO5W11ljcaMVW6E7Gk5CA30YCzSZcJRuHiCpFRP
 GTY/05QbQuP+xJf9P6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230050

On Thu, Oct 22, 2026 at 9:14=E2=80=AFAM Saikiran <bjsaikiran@gmail.com> wro=
te:
>
> The OV02C10 driver enables MCLK before the sensor supplies and disables i=
t
> after the supplies. This can back-power the sensor through MCLK while its
> supplies are off and contributes to camera brownouts on the Lenovo Yoga
> Slim 7x.
>
> Follow the power sequence used by the firmware on this platform: enable t=
he
> supplies before MCLK and disable MCLK before the supplies. Hold reset for
> at least 1 ms before disabling MCLK on power-off, and wait at least 10 ms
> after releasing reset on power-on to allow the sensor to start up.
>
> Update the power-on error path to disable the supplies if enabling MCLK
> fails.
>
> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>

Should it come with a Fixes tag?

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/i2c/ov02c10.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 221cb93126ec..42aa43ea0a22 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -661,12 +661,13 @@ static int ov02c10_power_off(struct device *dev)
>         struct ov02c10 *ov02c10 =3D to_ov02c10(sd);
>
>         gpiod_set_value_cansleep(ov02c10->reset, 1);
> +       usleep_range(1000, 1100);
> +
> +       clk_disable_unprepare(ov02c10->img_clk);
>
>         regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
>                                ov02c10->supplies);
>
> -       clk_disable_unprepare(ov02c10->img_clk);
> -
>         return 0;
>  }
>
> @@ -682,23 +683,24 @@ static int ov02c10_power_on(struct device *dev)
>                 usleep_range(5000, 6000);
>         }
>
> -       ret =3D clk_prepare_enable(ov02c10->img_clk);
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
> +                                   ov02c10->supplies);
>         if (ret < 0) {
> -               dev_err(dev, "failed to enable imaging clock: %d", ret);
> +               dev_err(dev, "failed to enable regulators: %d", ret);
>                 return ret;
>         }
>
> -       ret =3D regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
> -                                   ov02c10->supplies);
> +       ret =3D clk_prepare_enable(ov02c10->img_clk);
>         if (ret < 0) {
> -               dev_err(dev, "failed to enable regulators: %d", ret);
> -               clk_disable_unprepare(ov02c10->img_clk);
> +               dev_err(dev, "failed to enable imaging clock: %d", ret);
> +               regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> +                                      ov02c10->supplies);
>                 return ret;
>         }
>
>         if (ov02c10->reset) {
>                 gpiod_set_value_cansleep(ov02c10->reset, 0);
> -               usleep_range(5000, 5500);
> +               usleep_range(10000, 11000);
>         }
>
>         return 0;
> --
> 2.56.0
>
