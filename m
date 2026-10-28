Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793197916;
	b=fwxbonJ7YMaaLOzPympBokTI5/2YvUGgaN1RoqaDXv2Q3pPO2YhW3gTL3hRWD0py5TZ0
	 DC5JAY9jqSmeflW3AfpQkRaX7szk7RCDHimZvsGudB16slyYc++K5zaLAl3whDI/IltNJ
	 xhLzBOmARmqq6E5QmOVHfAAJyfZabtB1M285FhFAVFsK3a24oMJa5q9CxaKEg/PesXCO/
	 WRwqTf04Ayx1jggnMDbOi9Za5kGZVvPdCxrULvrJhVUY7U5P7CCfy6wa/lxtOS+hZoQvd
	 XOwpxfh5Jt6L1FH+i6d9/L9TSPpZbrtQ5pqKw0mDJyo8lEvIdyHrS9UEpxxNNra1Ijw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
	b=FHODxhVEbalOyZwHo690B6Lb4h0eC6wS6i4hmYHT5Gd5DCh5EBFCdeqFCc4rcEumCYW2
	 dGXRpS3a+6C/Tua/G3u0IZCzs0QvUg/LGdtVH6aUS70oRBV2IozOBLl+EzcI8HIKNGRFR
	 ksXyMAE8Qnyoo5SC5lE3CwxzZb+8/DMzYsf7qeXXETimffVCGIp95GHYLsY7XIQ3zZJKD
	 ZDZn7YQ9+Zkq5B2BFQ7+2itWfgAYqk17/rI9tkBv5c6vnacJ19N9nNRdW/S2vEHutk+Ph
	 Q7M93SsHVwNo0LBhDj1JS/Vsu1h2zi7fEXcAjRyU6mLmE/t/WrqvqQCF1nzY92+lzJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ip5EjwMR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1CCQ8Wl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236D4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 236D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ip5EjwMR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1CCQ8Wl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeD2p1607030
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=; b=Ip5EjwMRu8GypD8d
	vmz7DbjstSvLvVFPMsypePAHwg8buUeQgw00rGjw7YZzvHjvzbQ2XZy/bAoqFp0n
	Ae1cxOec6EaoiBkw5orNHBN/+w5CPm4zhBaIdhYfCqRJzdyf39jsK3QKU4hCPwyA
	HuoIN06dyAi8Us/jvpJjxKSDXMt6ZE9TJmlwJ5V9fvUZw1Er96kYm+Z/Arn0HiYo
	bdtrUybRSJ1XBqfHAnKDV58ualIQYh42uaIM9vsVPwYdNjx0EIlDJFLsDpBs6rON
	cqrCVMcCqaMdY8nxbSn8FxIHeO5fM+Yh4UGTkunUzZVkB/mmHCaww7Fj74GnhkHN
	oc06Tw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jmyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:31:54 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b1a3d8a752so15755897b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793197914; cv=none;
        d=google.com; s=arc-20260327;
        b=q2h7DL6uVsjprFsOjDd6pn1LHlAQwS/dxfV0Bvv4yXU1d463eF7yDNssJGf9886R6t
         rh1qU3whX0rBMq7wKCZoEEJdbtH8W/rMJme4ivC8UXcMhNpoMuwdOxcocMqnnL177dl1
         AUBqTIdS2I+duqj9kHGM6Ys1ZzzppHUemiHJUhBtHxBYfnw01Ot6YHAORLiw9VOxAKmc
         HWOt0UiCLtvDfjs7bOMXY9e6Art5zYxwipQkekmDxizkWbGIBjvcD1lZMZthgh1DHSi2
         923ZjvrGVMeiEqrOw74rhZfcGlWar1lMEiuHuPg1h46U0hl9rzFOsuci8hGgoKehH9Nc
         AMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
        fh=VemaHX0RH84Dt12E1oG1Ohrsf2V9UFMD6S9WFdoDUPY=;
        b=YOrrkDndkKprhfAsA727q5jEC+c2Faev9BZYpm3fEUgNmhnA4rDKFbcr7/wPITt/Go
         rrZ0rIWzWZk9uwNOs1kUaplgC5gXUDsCNGv8llzzmXU5d/PSYhcFLKAtpPPdnr8EXw8b
         WD2nZ962H4L+4ey7y2V11w/uEJue2yAwMhHmBxAUwPBYtBvHEI1oma0OOnq5ox55vpH+
         SOC1YeNto019MR2AMsXpf2mYbEkzdaHs8Ckh8klOJjKQ+OOzQJ6pAf1gO6+wxFTgis0R
         gC5TsPUCh7/jd+ebamvJsghuLCtCazk1xK2xUVvuMQDVYYuDuyLcXcSTnOZr/kkiH13g
         Ul1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197914; x=1793802714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
        b=B1CCQ8WlPbHOxHSGlEQJHyf2cIBsnEazIur5nmeVCdJqSdObS9xpFYrVMMwQM+JqL2
         AgunTgJhBAxRDmN5gVxmcUfD8mU3YUJ2p7htl0Ri/2r+VB3G6svO6nDWIuUdpJmomXmc
         TZH76o6OnTp/b8HPK/g/Ix+UV5PR34YVXFmjvWm4FpVjegZIXPlgEb8OxCu0JM9Ybsgq
         ihePli8x7s9oL/QL4mw876BQfZFCxx00/y5ppMdJJpggQAUzzqAX3bDud0O17Ax/e9fl
         XloD73cJcnwYOygWZ9b/GFnp+dPF4bAs+meXkcaw9c3zeZypNaseVX/HICFYPwJlRjfS
         3wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197914; x=1793802714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
        b=P6O3IgiWnUELmSlMvfEyfSRfE7hWapYtI4EaFt8afFLWl16jmJHeuEv8ql9SHsCmdi
         DKejYwuwQQWyBkI+XIQhE/S3wNZtn5azVNXb9fLanLIA5FC+vUNgxgFBrdyWae4BCDYd
         7MQ8pfV+dpG9Fu79jGgrXgXJfq2CmzN+ybDMkJUmG21gvmiBDbQJ59BjyW1v5L6BwwuC
         KGhQh+WWXwBkytuTULEMlHWJTKlZnIx+6KDAIn9Uxcgl3ON7qnfdCe4ysQOtsY5fYOzN
         NaQKh4tXmBBvsLJY595P5rQEDxIv1HL+vp6V3SWaxf4JKIqL6jcZazaizeaxWewZXz5x
         550w==
X-Forwarded-Encrypted: i=1; AKwUvByJDFcQPYMHrAyGCEd8chSnAqQc+uX/aKAnCFLUwUkd+Z3m9N61dIv6IkHld/1ZuZ7Y9z5CuZ+9YTCWU5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxCyyixSUim/z5XkuuTHwzQ1TX11MlRguuQkrVMEAaxM6abJvQ
	Om74gtmIcdFL+Qw8D0tQgKQur17/ey0XmEffJsfvCHieZDEPCZbfNvn9Xc0bVB9MsCIX9nGlAU7
	TkRzc3OSDUrzLhyv6Z+UhA96ZWgs6pYoXuGxsKVrCZ0Fb87OAOSMU+jIzy0mWb+yE4NfA0WB45d
	nO43WEghqorzgvy3mgusfFeOqMc/axFFtfjoiWXA6V8g==
X-Gm-Gg: AYBFou1d6LigC3NaKhim1G2ggZDgTCeog5ht6ITKGeeybbp57xujUkMW/ZXdCGTqIHi
	WrFvKfLzf1uPUAMKOT3Y4Qq7hHwt96uv8mu9WL/NObcZYW5P4YaZxgx5YdFCoqZDmmSeMhJvHhd
	6Sck3+TFqOkxxCOFteHe2mz3pTbPNaUmjqhGMblSY80sZsTOLqxmvfI5gMGMW0Bumvz4QJrEXDG
	6Yxt5x0yM53ZLP/O42tty9SzIoOtNhxJ1aOVYN0bOqZ2rL6Tj0ygBxqrG8W8o1i3sDVsi0ItjA=
X-Received: by 2002:a53:de12:0:b0:67a:693a:b1c1 with SMTP id 956f58d0204a3-67a7bd37dc9mr1723995d50.107.1793197914331;
        Wed, 28 Oct 2026 07:31:54 -0700 (PDT)
X-Received: by 2002:a53:de12:0:b0:67a:693a:b1c1 with SMTP id
 956f58d0204a3-67a7bd37dc9mr1723945d50.107.1793197913680; Wed, 28 Oct 2026
 07:31:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com> <20261028132403.3505037-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:31:42 +0100
X-Gm-Features: AclHuK-ZetXLnRlYyVA0Aar_ekVy_y16swNN82xfp1QmruhUCAZreqlcaSWQtgI
Message-ID: <CAFEp6-14LzGwZmX19fGP+TTBcUft3=_JahLjg5P1SC4sW6euOQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX+tM5TkWZCPpy
 5QLy0MJPfoEoAfKdcwozprLhU1WlQcZKCj28LRj++bs1U2NcMOmkca6vDOoljmmc+uTbbQUwxgu
 DZvvy2n3VC/8Rg5YpEZGeWByJOeUWzA=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae2075a cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=04hEKUbGTPlOapuoViwA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: gEODaWKz2qooGn1stqC_z84XVHQTNBX1
X-Proofpoint-ORIG-GUID: gEODaWKz2qooGn1stqC_z84XVHQTNBX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX/m6hk6VvDXqU
 hRqS0t+HyIbveDwhoWPXQ1HfVpLWoNDVXEE/GOgpFitRPmxldi5xPwmUj00Camtuj4SBfqZCgUM
 OaHqmBlFGm7YX2vc72yKJpOq+zNCMxFf1D7vaOWQR20vybus9U12B795cow6a7lt5WZp1Z0gpkV
 AiPQGdVqKRO3uhJmBM5cfk9KyvI5fBmjJ/TPCz12iCmI5lmqyU4SB8aYJZiHi2QGgRRaAiRrTka
 RZ2gwu0HBjGgtrKWgiP46EYy3sNqY7xHgFW/K1GaRugvGnYL7qB7F4T23ecnMWS3bxooK4mzOYJ
 QJ1DltGZsEbn+SIkLSuI2wZ4X08wXxcg8spBKe4NZKhhR+FYzpNVXxePFUnUSnuBKyRZur2wf6r
 oXLaPF+wq7EUFiTXoNguIAGzynK2DvptEpPSUVXzdaiXTv8/JDBoK5ugiSSCXQsP0erfYzDJvNV
 mxRDjmNLazpzKzTOVAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280057

On Wed, Oct 28, 2026 at 2:24=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
>
> Keep failing when the pixel rate exceeds the highest rate of the VFE
> core clock, and clamp the other VFE clocks to their highest listed
> rate instead. Take the clamp into account for the other clocks when
> another line powers on an already running VFE, so that a clock
> running at its highest rate does not reject the request.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Just a minor style nit, but the dev_err() messages could fit on a single li=
ne.
Anyway:

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v4:
> - Keep -EINVAL for the VFE core clock, clamp only the other clocks,
>   drop the warning (Bryan O'Donoghue, Loic Poulain)
> - Dropped Reviewed-by due to changes
>
>  drivers/media/platform/qcom/camss/camss-vfe.c | 40 +++++++++++++++++--
>  1 file changed, 36 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 59be37f83df3..bcc2c1929af1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -918,6 +918,20 @@ static int vfe_match_clock_names(struct vfe_device *=
vfe,
>                 !strcmp(clock->name, "camnoc_rt_axi"));
>  }
>
> +static bool vfe_match_core_clock_name(struct vfe_device *vfe,
> +                                     struct camss_clock *clock)
> +{
> +       char vfe_name[7]; /* vfeXXX\0 */
> +       char vfe_lite_name[12]; /* vfe_liteXXX\0 */
> +
> +       snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
> +       snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe-=
>id);
> +
> +       return (!strcmp(clock->name, vfe_name) ||
> +               !strcmp(clock->name, vfe_lite_name) ||
> +               !strcmp(clock->name, "vfe_lite"));
> +}
> +
>  /*
>   * vfe_check_clock_levels - Calculate and set clock rates on VFE module
>   * @clock: clocks data
> @@ -1001,9 +1015,14 @@ static int vfe_set_clock_rates(struct vfe_device *=
vfe)
>                                         break;
>
>                         if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for VFE"=
);
> -                               return -EINVAL;
> +                               if (vfe_match_core_clock_name(vfe, clock)=
) {
> +                                       dev_err(dev,
> +                                               "Pixel clock is too high =
for VFE");
> +                                       return -EINVAL;
> +                               }
> +
> +                               /* Other clocks are clamped to their high=
est rate */
> +                               j =3D clock->nfreqs - 1;
>                         }
>
>                         /* if sensor pixel clock is not available */
> @@ -1045,10 +1064,23 @@ static int vfe_check_clock_rates(struct vfe_devic=
e *vfe)
>                 struct camss_clock *clock =3D &vfe->clock[i];
>
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> +                       u64 req_rate =3D min_rate;
>                         unsigned long rate;
>
> +                       if (!vfe_match_core_clock_name(vfe, clock)) {
> +                               long max_rate;
> +
> +                               /* A clock already at its highest rate ca=
nnot go higher */
> +                               max_rate =3D clk_round_rate(clock->clk,
> +                                                         clock->freq[clo=
ck->nfreqs - 1]);
> +                               if (max_rate < 0)
> +                                       return max_rate;
> +
> +                               req_rate =3D min_t(u64, min_rate, max_rat=
e);
> +                       }
> +
>                         rate =3D clk_get_rate(clock->clk);
> -                       if (rate < min_rate)
> +                       if (rate < req_rate)
>                                 return -EBUSY;
>                 }
>         }
> --
> 2.34.1
>
