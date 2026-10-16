Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F747361DB5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137039; cv=pass; b=czxyjc0vq3+1o9GmTtYB+KSLEzNSf8S1xheVPMtNt0erdBSogHnxKsC9Ivs4ULNgUpytJsmdAH2QjQiJVvfm15lZO5iYPIsUylTg7V32xXQMnM2qR/Wi9BGhhki6+4spX7jd10vv2WXvainH9Rz/2hyaSYe/EXH43Mvu0WKvccs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137039; c=relaxed/simple;
	bh=HdaXDt7roetlcl5Z7zLdM7ZLqhcMX9rkrRQiOIl8xO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Friu0I8c7kmdDssV/ybjBkSsIaqYc4w7jRvLtYHcKjldcdwOd/M52t8Y2GUDG1CeflIHkMTasZ6+cbkcYO9Ybv+6vh1iI03wvyDKVZTnG/6na/bCTSKDLKrm/0tvutIKDUP3lfcgMP2kE0KmrhWw48+r6oDSrEef7OY0Ho9B7Oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqx0GIUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8ioKYXP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqx0GIUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8ioKYXP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G4Nsnn3800192
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=; b=bqx0GIULVEZ0BXv1
	od54Q8iEOTBmD3qGKcv+wqjM/h9tX+TNbRdLnyAafGBPN17aJtZpM76ETsMAwGtI
	OL7vWqbx3UFGLeeBxNyVo06XsH/OViVlUVpOciNF4pF8aB3fJT/WI2CregIoli6m
	DbBQEUA36k5tcgudCf7tkh+McX1s19USm/p570neMhabLO7GYSVGOqaSI/LNhfyS
	A78pZiRih1DjTGVM/KWd8bIBn7OSpGeRXzjF0vc2g5Kdze1vOJ8mBUi1mCXPK5Ek
	G+VbQYVPZcrrBQ0YRbnrAmekABBPJpQ+4QoxuZYM+ZJQpE0pZlJqeW2iNsdZUycT
	gsJBbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5sea5xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:50:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so1301845885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792137036; cv=none;
        d=google.com; s=arc-20260327;
        b=QTqTuI50Ul7VNKoe7m2NqJ8lGXkOxpwHQkGm1k1X0PSKB4yOiXH/tJEGroz/d/BuZG
         /K68Yhwgj4kh+rMkgxqSAWjXFXYvV5cKHNk3oEWvSdEN0uzl049QkbfDmggtmpixfNpT
         +fXZ0CIdOvZI1ER/iw9e20hOtJdpDVikUJinlHEG34giWH6nG+Z+d5J3C6H3CtinspFc
         cHyjNWOJM47Zx7n13cumPO8jrVwLYWaBB+LvVVr5IS10XkMnhlc/V5R9TPLacRvgJCm0
         K9MWopTQ00qnoueXUnoKoHF/fxr4INRA2Lgto0hccDtJdRyWpWs2zmbeyourXFrnnqdL
         rbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=;
        fh=X7ltUfdbv3QNUx601q8B0SzIbnINX46szPHkLcRdpKg=;
        b=QVjdWWuvmtly/wkNpeV0alXOgHGhT7P6iJVTZM7d87UYJ9/0Kn3ryHdll03DzwyigM
         JHBUZcFuyGr4nxmlfIJBUs/l4fOzVf9xBf/Tv1mVz+OrWc1vczZpkgEOd8i9OG2HYtDf
         O6lTWvIUA0A3cdr6ys36FT6iuVqcUAAx/K/SnVCdlx2jRTGhyZ5lejX2jyILfEbMYMOG
         XXYzJMmARZgol1sE9o9YYY5YD8V5sGLki677FXRdmEXgmILgsQ23lFW8mWxJCbsC81d2
         88svZAO960GqfNuryOIidQXP7IQ96ALu7LhqHGFI0v63i6N1edleCksIuLM0Dn0V/j1+
         l7gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137036; x=1792741836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=;
        b=F8ioKYXPwXD0vyF8crg7z04qpvNs3BO3ANwEOZrHSQPRTsaYs8eIQVwOJDs5giZZeU
         36u/wJo8y0UIofXsgHvNd2jWX22W6nr1HfCp5VD1zOKnGHPAc/2Gz7HIiOeqM9LVFt4c
         d96HrPhdA1fbKgEJyCnRLYHofCFy+TXzQxz0PtvxIER/O3zLxqcMnyJzuYpw+6ABYimT
         a2d+zOT2tqnDbU86w9L8XppiiljC+b+u5gFVnkQoMSl4M6FvfiM830rwvPCZL5HNGhME
         XlqT1bhGtGjDyHEvu9ufqPqNIqpus0WO3UNQNGLCZm1b3TQNV6JxZsEdWBCPT0bDACmP
         RBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137036; x=1792741836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cac2SsbUpbTX58DTz0jrcqCuNi7ZOkA7ZgNCrxGWe8w=;
        b=XkHHMBF1jAt77KVsRRujV08efLj6SQ2Ljs6Al/3D8DN0uQejb08LcGYfKc0Puo6IFm
         twTBV5+poBpieR3mZl9tI91MDvaXP5aZrV4JPdJAUrH7C0UwQA1CJmJjZyICj9TN+xjt
         Kt9P/bdrrIU6jkn/ooIFoIJgn8J/rJV0qQG6UfpmeblqD/MGtyQN46ZsY+d+qGcjpjVP
         u6Z4s5piigXsG0togzs/0+zh7iZ4+bR75JrhHhiT5KAE2eDXtJGeSYPDdMulK/deTwn/
         9n3gE/hMx1vfyw/9YmHAbdCSBMbVM8snTvos09UBn/X0tzsOTgK/zc5AWUJI1RvgMhDR
         pwAA==
X-Forwarded-Encrypted: i=1; AKwUvBznGIiorIOAlyLFRWOfPBKk6F+ITgwcZPENsf7SGPRs1TG6ar4qDicbPo0PJ6PVokshtzpp5aqTpqSlNVg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdMfkBovARxALZCAjyiwFoPPiWpqRKvBSXj/i5e5eDYKhes5GC
	XrvVfLv6nNpd5YNV1CnGpzbrFUEt1WQFzWQQu5Vickrwb85gUUXXdgDJnVD3tbeMFjBDJX2dWv4
	BywpbP6CQ1Af2VhBDpugo2rYuMhWrZSjejjtqxFOJjcpSg4h8CZwSLEDsNljTu+8EsbWvH8on8p
	LUXE2jQMWBQxyRubft395M25b7WVDDRs4OoYrQLq/A7A==
X-Gm-Gg: AYBFou11DLz2J1JCXxL5jzvgFwKUGbP78OcYLMqFQmS18s9kpXtRS+4vUHnyHzBzg4+
	YsE9I4a6yGyBbf6wUKFRYn8CusSh6+tqRASbMxq8M3lGupaTU6OrFY7UPFKJ/zDF7sHL0LuY8Al
	rOFfX3o/dtbUIoXL6liQ6wm4t5Uivk/cKqhEov025m24SSnYq3O61vIRC7iLOcsdwTvlIf1eekz
	hmb3j0cXXOObmh3JTngQUKqac1Jjeh5qSgziF7IQ58P43DdxUL+hvBWB0DBzcAqOt7trvmxmJlb
X-Received: by 2002:a05:620a:1786:b0:93b:ec83:80ee with SMTP id af79cd13be357-93ebd25d1demr3398992185a.57.1792137036371;
        Fri, 16 Oct 2026 00:50:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:93b:ec83:80ee with SMTP id
 af79cd13be357-93ebd25d1demr3398990185a.57.1792137035856; Fri, 16 Oct 2026
 00:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-3-1f3fa9af940a@gmail.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-3-1f3fa9af940a@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 09:50:24 +0200
X-Gm-Features: AclHuK8JKCvyx1h6mjiUhNqE7WWuH5Nj8DI463hKl1Pcfxn_BS7ehKW2f4RxCvc
Message-ID: <CAFEp6-17SySt2t5HGYGeQ0RRf6DPQDz08JjsAJicaj2R1KDD_Q@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] media: qcom: camss: csid-680: Select C-PHY in the receiver
To: geocausa@gmail.com
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX1v7NuMNblo1z
 Zs9NDuyLaXsJuP893YqQ16xjGo9bXZJnhFODsQ09mr9FVPecEl2zGzIUlz9GPApRxdiCy0NB0HR
 xSd51nZ08wqkamzIguHDAFdodlkiSbg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX0d80H0iXKVia
 6ZvZEPLFOrWOtipcTWFYtbgCitr5IhBAVue1/4wSr8FoPVaSl4GmrOlwm6mGjAtIljDHOFwiah+
 iZjn8ejEUC4DF6prhgHl2eh50mytRmWLSuYAvBBUOwSMOTw6xGZqeRPaKZf6zDyyfPnnmN4FLnS
 MNaeI2cldLl+IoXEKFgDNxm1Lt8KLuYHOXABanHBz1RGGSoJhIXDKSsWPlHwkDnnGI3zXcef7E8
 XqaVqSC/+rbxBwrVdW6SL00xdAt3zRd9pp1VLcS1q7vmQnHYPHGh1lcsS1jZ5RM5a0X0gPXvuBK
 UYXXt/6RabB4bxz6Ga1Er/7l51+zh/tqbcxLMMMG0a9yFenyro/lsMtuuUnV/CzPyE+4wqQf3WR
 GUGF5TI0WzQZRQxdmAf6KvqNKVHdTEXWIzl4xJGjEBduI9geyvTnvFt1I5+kKNhEAsuvjn/O8/C
 Cdh5oCRxZxe/l/4K0BQ==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad1d74d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=LElf2VvS5UWv9C91Qe8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: OFhl5If2isFCfGwJ7qG-ycRrKUj_bZss
X-Proofpoint-GUID: OFhl5If2isFCfGwJ7qG-ycRrKUj_bZss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

On Fri, Oct 16, 2026 at 12:20=E2=80=AFAM George Neacsu via B4 Relay
<devnull+geocausa.gmail.com@kernel.org> wrote:
>
> From: George Neacsu <geocausa@gmail.com>
>
> CSID 680 has a PHY type select in CSI2_RX_CFG0, next to the PHY number.
> The field is defined but never written, so the receiver always decodes
> D-PHY. Write phy_sel to it, as csid-gen2 does for C-PHY.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>

It would be even better with proper masking/FIELD_PREP.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8f..16b199f06 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -202,6 +202,8 @@ static void __csid_configure_rx(struct csid_device *c=
sid,
>                         << CSI2_RX_CFG0_PHY_NUM_SEL;
>         }
>
> +       val |=3D phy->phy_sel << CSI2_RX_CFG0_PHY_TYPE_SEL;
> +
>         writel(val, csid->base + CSID_CSI2_RX_CFG0);
>
>         val =3D CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>
> --
> 2.53.0
>
>
