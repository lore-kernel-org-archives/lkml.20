Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793696137;
	b=AWrpz+FN4uQcxXN8mQHs7+G25GqyxGF3JhyMxvyk6L7PbuqWjprOXToAz9J5VEkP7YHY
	 WGtL6KywalxWvqTeBBaGGGpbgCgAu8wHXwCHWGPy8ktAJBIllGExrV8TQScedDAfznNPW
	 Bgp9EubdE6KC8Pl8Jn2+HF0flHdA63da5eq15pWu1oPkuActwkIXU0n6wsIZyTQj8rNXL
	 st/gptmUU4csLiAN0x/jheRG9rJnQHDoBJAKpgp9tGoNkhfMdUMLeIebgMq8N+LD4CCw3
	 o8e+s7sdN8UDF9lHziMCygGY9PkSljxJql6VWUWypIj/MRYdKDFwuWEDDqSCYl0B/8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
	b=nU8GUa6g5Xk2qo5EqoHkIMRep6ILXGpnuiVOo753jhx9pZXZCdsN7zQIWituXm/HGSFc
	 xXqohGduC85YhLDdeigpt+UxM/QM040Jk/f5rwSfYlifDUa4y0m0YbiYrpbcHezDtqC/2
	 BhsZixtCg6+N8Z/Dlj7dbhMD/KqJmaFdVzp/nA4Jw9yyRvBJ8jcKnuJcQiP7INa5n/b/B
	 NvfGgzcwprM4K5bYxtLr/gjAbc0PUqC7XsXKgEOd1MgV5dnzPpsPSX31mlKr4mW/a8fJa
	 McKDwHppsLuhzYrT6EoUV2+FE5ig4wjcfEpo29Ke0S00sx1212+JKOZI3ZG5RGmUXzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWmJBZ9g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQBJlRfR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDF2606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDF2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWmJBZ9g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQBJlRfR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38bO0H1523063
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=; b=OWmJBZ9gc8nkZerz
	b1HG3TUo8MIzBBrnc4dE088yesRqksaRibt7o2ejR7EMPKLM7Sd+wr+prPDIZVwl
	Pv49uXdDmq2HLJMXKLwIKsL+mhOo8lJkCv4lGoLBRzEmzEeUP581zuX9q0KUlZD2
	zo+oKNv1sqaLORWJq1VbGjXIHmE0UTS4R5/AsES2rA4KftwMi6NcmdQUyurgGFaA
	2S8lf/Gz0dBh9bpxXBZbI/0Z+PTYEbDOvuEeu0QNPDDmxmfyp6lVSyXRCQd6+QMi
	cYe5cxo52UItq7Yv/2hPxg3PiCga9BvqtFeDnqs7EUGIkRbi6O9tX/WQvKQYPeS5
	CNW8/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5hss6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:55:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c71966998so46890806d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:55:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793696134; cv=none;
        d=google.com; s=arc-20260327;
        b=l4W/9aa0ikJ6v/Z/flVKE7NRQY8qbs3hrP1tz9HiPQ9Z2MWH7BqMeWbQ9tLZKNpzO/
         StQiicKzhchffEh4+SyiuhIkRaIk9SrSr0n1WU9lmOIB6kCNjRcGJ9bJwfzYHfH2dTIG
         kvJZYGRwPpUteV+td2RbFu9LVZ+WXM11qla+qEk/0HYTRyQL+EwxjEo8HgVCJG9FR7f/
         ePkU6wpdts2FXVjTZvf5u1+nCUhsrvs5Xg6pYhUhEl/ybxU/u+InS5MwwS7qYRj1e6VG
         EU5AZFIoX0ZP5AtlsLIKvDUH/TTTxlnnyhbAhOlTh/9Y936Y+u7sJtnTsPDn2BBXUdmR
         gG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        fh=UnG8tESGUIUH7KJGvG1g6XLnf4g31CMFmExSdEkWla8=;
        b=rWrYJ8+T/4e9K82P9Cfl5X0nWpHHBwTzP/+nSdDsPCdRcf/rWmWPJmisgNe2CnBiS3
         7Ztfz/Ju3dHoQd/yB3etjC2ftXa4AmVT1axcrp2dLoEnWeJksNI/hUOC7vg9p5WWOg8b
         +hJ7+y6qdeG12xVExntkurU+QJG4IDr6cgeeshvkugVGG3jTrtQDJsJif/pzSwHhp1Ww
         /SigtiPdw2Lbft5qWI1d/nH4F6zlrQEkKm434uD5r4OM3VybjgaANdLJ9fwlexZH01a0
         vhozlmjNi15BWIN47ABpc/UcVT1HiiZPZN3QNnjJiL6DMOaJmWz5UT3hI9V1ej2VQWa7
         yVKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793696134; x=1794300934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        b=HQBJlRfRC+4iLMd73Erbza31dHAaBeBRf1r6hDddFdZ93Xri3jZ4/KbuH9SbLZ1s3W
         UfW7WYqAybK3Qqo9QJoyenFBbCIIuwApCDIrxFzJgSz1Re47+eBz6Pq9pF7QITETDOl2
         aBfCnDZHEJb9zhTJX0oqf0rgPgtjKmBtsO5gDoQ5UOsazp6m4YxEkJfRM4w8zjsdhbdm
         GnixX7m65YBH8SB9EnJbFY9KuGEeFHQg0O/MFPM1N0fvUCfXaUrDUK6+5k/BrKcRy4q6
         Ov2pHvojv2Dkr1ql77Fq034QWJL0jfnM1wlaha0m3eDrCAehkXTU6Uo8I+3NAltzPcCK
         EcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696134; x=1794300934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        b=oLWJRXmr+iGEaKKx335pr7NYBo/hpbBFjsBefWwJL6KB42DKMIAvHgqtdRG/F/iUjZ
         62cVPSThJxzOcnbdVh0d6VtTYREHYjC06tKtLw0dpgw1azwSzybv/ffe6A+lQj+pXvRx
         KnVpI0qg/PloI0ekvQ7CJ6X/DxYPA/kOFW0PifCgOWxFv5jJs1zdo15wmpAYcvvCsZlk
         jAChpslK0fIVDvGNYQjHzhYXgSNhuS47lOeOCP/zoySozz2o/s6osh56jyyYaTzeqkjm
         CC/x7umqUHbzsLbfEg/alO88c2zYkOD6B/VVHXtZBKg43j+7EfE2hu4DOA59Y0VjTotv
         adDQ==
X-Forwarded-Encrypted: i=1; AKwUvBySr3ia8nxuOzUnoBJ0So4okqwIdVjXzPbZ9HDMU4yux+VpQpYPjQdYctvLYxLLItUs5uMY1lbP99/Ydro=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GmurzhOGP1bYzhRF5R0mBWgDixjVuI0B+/Y7LwmwhlmbnBBDT
	UYe32yPnk7GeVLpSB2oIJX63AkUpf4Q41tpFN/+YNyAVc3b5C5JS6LV4M+9MwUqjMGoHmIfKYpv
	y0XBlno8zw/RQsjruQbuhp8rkf40TJG2ubGV9YxXnw4UoqQiSedX9ysOrWiRfvr6cjpKWIrRoxN
	gkZCmxl0SvUc+FdDaImCWOkoVoAZRwJDcwldCdyycM9g==
X-Gm-Gg: AYBFou0/uSfpFQ0eF1lfHHljJZ+UT5HstdKNGO0ecfM1H+2Pn80prt+WKY0CR2/gkfw
	ygcN95rDpXcYW8E23Q2xhj3a2hUmUPILEGnmjMKLcTOlws+gr0vbzAkj4EUaARnU3u7XE5u4TL9
	is7u7E1khbQj3RbIhAibuUSYu2evmKl1W+qbVPWhfx05jFZIp9EsVcVtr5cQw9+O89QSzhmjBcx
	Ggo18kWmO2vpAr1pJAhUYXU/V4kY0gbVjP5XdKiJK51aIGft1xJR1RbZfwSqhRUrBsaaGRV2CI=
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr2157959585a.28.1793696134279;
        Tue, 03 Nov 2026 00:55:34 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id
 af79cd13be357-944216b1af2mr2157954685a.28.1793696133721; Tue, 03 Nov 2026
 00:55:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:55:22 +0100
X-Gm-Features: AclHuK8MJq-s56wdtunEmLoEql-aTRrOrw2wQVU5g0yE5nW0xqWZNoiPrAFZCeY
Message-ID: <CAFEp6-0CkkoT_xP+zvJ-ffVQnn2E-9AuiC0=cer-Cm1_s1dZ4A@mail.gmail.com>
Subject: Re: [PATCH] net: dma: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>, Frank Li <Frank.Li@nxp.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Li Youhong <liyouhong@kylinos.cn>, Joe Damato <joe@dama.to>,
        Arnd Bergmann <arnd@arndb.de>, bui duc phuc <phucduc.bui@gmail.com>,
        Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
        "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        imx@lists.linux.dev, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: a11AJWKtdUz776QMNa0eXVoa5FnaIC8c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX9Wm87rD7ywQ3
 Rx4Ww8HojkngHq7yYrfTj8y4osqzf04ukvsYsX+n2O8h02IpBkZ/+sVHPZ6Z8j4nshggIoxnFf2
 RyrAGXlYkAowl9e9H2KoM5I1DT7Mn0atg1PqKf8SlbOwWJS7F3n49gEs4bAoxneGvUbb3bLiplb
 nIu1MD8g04h5pgO0bOjiTbMaDYsupwT/yWDMj5wYT1TfjgazcTXEqD+4z3dM7ZRiMg8Fy40pxZi
 Jic9AJSGO7nOWLdSjZYzzG6FF1Xvid/T6YYr3gBuVEExtd2SqkKL4O3lXXKKBFQtNkmsApUXHIk
 o+l+lL8x9qvBPUUbY2W3zKNgaYjuanh9mIgkl0DxcI2N3UJcoxe/DjLH+ULO6GeXS0UMNlfyJGh
 a9GTveT9KvuH+HzUhBhMe0Ks4ZnNy/4Wrpp9ZXo4499/xWT0yK9CW4opFF20oU16koIuDRMQDFv
 fs+NsWhlCz5rsjfS1hg==
X-Proofpoint-GUID: a11AJWKtdUz776QMNa0eXVoa5FnaIC8c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX7WvyGrhtI6OX
 QLDcGYerkpOcfxKOkmRNZpDabXRy9GA2Q3SMabhVkZZ0GmTor+zxXqDCd/8LbUoKuiMEWc3Pqcb
 GWAW8VjehzwSMGjwe+Ay6TxK6zzxv8c=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9a187 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=OV43vvX7PjCfZyRFssgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030035

On Mon, Nov 2, 2026 at 8:19=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across net drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
>  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
>  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
>  4 files changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/et=
hernet/allwinner/sun4i-emac.c
> index 09b2abdfc9e84..d7ee42b2c1976 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -303,8 +303,7 @@ static int emac_dma_inblk_32bit(struct emac_board_inf=
o *db,
>                 goto prepare_err;
>         }
>
> -       desc->callback_param =3D req;
> -       desc->callback =3D emac_dma_done_callback;
> +       dmaengine_desc_set_callback(desc, emac_dma_done_callback, NULL, r=
eq);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/net/ethernet/micrel/ks8842.c b/drivers/net/ethernet/=
micrel/ks8842.c
> index f0d6bfc6025ca..c68abd4643e72 100644
> --- a/drivers/net/ethernet/micrel/ks8842.c
> +++ b/drivers/net/ethernet/micrel/ks8842.c
> @@ -453,8 +453,7 @@ static int ks8842_tx_frame_dma(struct sk_buff *skb, s=
truct net_device *netdev)
>         if (!ctl->adesc)
>                 return NETDEV_TX_BUSY;
>
> -       ctl->adesc->callback_param =3D netdev;
> -       ctl->adesc->callback =3D ks8842_dma_tx_cb;
> +       dmaengine_desc_set_callback(ctl->adesc, ks8842_dma_tx_cb, NULL, n=
etdev);
>         dmaengine_submit(ctl->adesc);
>
>         netdev->stats.tx_bytes +=3D skb->len;
> @@ -567,8 +566,7 @@ static int __ks8842_start_new_rx_dma(struct net_devic=
e *netdev)
>                         goto out;
>                 }
>
> -               ctl->adesc->callback_param =3D netdev;
> -               ctl->adesc->callback =3D ks8842_dma_rx_cb;
> +               dmaengine_desc_set_callback(ctl->adesc, ks8842_dma_rx_cb,=
 NULL, netdev);
>                 dmaengine_submit(ctl->adesc);
>         } else {
>                 err =3D -ENOMEM;
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 8a50cad1c104f..7e83c4b5f1931 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1014,8 +1014,7 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, s=
truct net_device *ndev)
>
>         skbuf_dma->skb =3D skb;
>         skbuf_dma->sg_len =3D sg_len;
> -       dma_tx_desc->callback_param =3D lp;
> -       dma_tx_desc->callback_result =3D axienet_dma_tx_cb;
> +       dmaengine_desc_set_callback(dma_tx_desc, NULL, axienet_dma_tx_cb,=
 lp);
>         /* Claim the ring slot only after the steps above that can fail. =
 The
>          * completion callback can't run before dmaengine_submit().
>          */
> @@ -1565,8 +1564,7 @@ static void axienet_rx_submit_desc(struct net_devic=
e *ndev)
>         skbuf_dma->skb =3D skb;
>         skbuf_dma->dma_address =3D sg_dma_address(skbuf_dma->sgl);
>         skbuf_dma->desc =3D dma_rx_desc;
> -       dma_rx_desc->callback_param =3D lp;
> -       dma_rx_desc->callback_result =3D axienet_dma_rx_cb;
> +       dmaengine_desc_set_callback(dma_rx_desc, NULL, axienet_dma_rx_cb,=
 lp);
>         lp->rx_ring_head++;
>         dmaengine_submit(dma_rx_desc);
>
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371..1479f8362e04e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmu=
x_skb_dma *skb_dma)
>                 return false;
>         }
>
> -       desc->callback =3D bam_dmux_tx_callback;
> -       desc->callback_param =3D skb_dma;
> -       desc->cookie =3D dmaengine_submit(desc);
> +       dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb=
_dma);
> +       dmaengine_submit(desc);
>         return true;
>  }
>
> @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmu=
x_skb_dma *skb_dma)
>                 return false;
>         }
>
> -       desc->callback =3D bam_dmux_rx_callback;
> -       desc->callback_param =3D skb_dma;
> -       desc->cookie =3D dmaengine_submit(desc);
> +       dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb=
_dma);
> +       dmaengine_submit(desc);
>         return true;
>  }
>
> --
> 2.43.0
>
