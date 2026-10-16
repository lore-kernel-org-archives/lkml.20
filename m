Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A242AFBE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137383; cv=pass; b=fGKruXXAiXbWtStiNATKbYHWJsIh2EfB5ZLTcErt9Uvpx9bS4woGsOsA6sZTI9Hu4TStE1P82Bmg7o9mNukKRwJD4nnKL1Pn4tzggT54Sbhxex4WeBEj8yOrujn/sYEZZjMu/XVDdUFuxwuk0Nnc0zwy4CKuLLcPUjF2VzgzmpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137383; c=relaxed/simple;
	bh=VxP0hZ31lGhpRchEzyV+aetw22Q2teS81UDVEDMeCsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQVJdSHOn/q1UWfHoASwBbFIvdUIN3AATtQcDB1M44iufRasJ+KM9CtLkmigVdr/Gzd7HAaSXF+lQPe7wUciFrhCfjsdAMCORoo9jlaRHVroO7btjXppBh1smDAK7evnCiZsGvg7oV+wOQezwMRHn2AhDmz1tJUBr4OAhsqRGF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzYyKaVe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfMq1sOq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzYyKaVe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfMq1sOq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2TmsF405915
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=; b=hzYyKaVeBM0t6oN4
	OqbN14OwDGvh7/Gbx8Z6JXtEVWmqZ/V6E02Jytm44sRuu+SYlIYXZgU7tYeeyIWq
	BewuE2ei2LoXTKh9cydz7afjbXT+jI/rOm9HqUItKCdC9QiIt/2v0VXogxYvHjUE
	N+z5NR4yoS4L+16yWKBE5ADTaH/GPPppx5PKaSp7wmpRSSckQg/Rk5BC8SCgSEdp
	kfpBzQAwwtODE3Zt/iVQaqb9Ge2u+IpQKyNpFoNU2JVdoCVvIDqv35G/WFwhNs/q
	GSkDxzBK4gEG4SksIDGzbE8a3uJAXpSqWylygxkxwSjwix13qtaDykg0Rif+uFbQ
	4H3Usg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2p8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:56:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1855503085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792137378; cv=none;
        d=google.com; s=arc-20260327;
        b=F5o/TIXzH/Bn8dLP7EuV3SXC2a52atmZFuoiGJvtkU1Nv+UMTmpjr1o0X+B9ZAbLvF
         YbIv0lBI1FP5C3LobTBSOgLF11pLhWo/kG88AckPrtp1ZW1X1pMOmyTLljW4lP9byV4g
         7J3HkF39ak4QiEgcgoH7tdrBzEpZGS/5q20Ht0gEdPrbF5u429DiQfOWELayQ0QC28Dp
         Wkro6Tkwej+DhAxo7uueulvAmKiaZnbb8SNt+fAZFPshTxgcL0aaJoGznvDMLiyZ0j2+
         e2uJDA2HvUFVrYIQCyeoLQffaJHzOjkyOwE1i0tUwA7iiDTYeksHY1eZCBAc3ZhvgLp+
         aMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=;
        fh=n4QqTPmD96ss66v9WNPqUxItDzzS9D1cLRE9uA38m5c=;
        b=gaaguSk4Yvaz4VIcNrLX2hikgTgRv6IkrIQuOOywjVuq3r4bZNkOoTu+qOdOHRm4Sz
         LwG+t0Yr3FaKxid3W6jEAhU1bDWInBphdl92TsMocgzrxvJ2FRHulAbTkHklt22L5qvi
         TgveTyzaXLOUqJqHZvy3ler8DiFoC7lZakXXUgifYxY2GBMXir2YwOll7yrw6st3KUrx
         LyIt99ETTCrmuwWNkoOI75wdrBextmZxm3aVLsvobufefZfHDVDpXuzOO7GzBAJ3B8NY
         tGt1v8FiwtY4TsJs0/PSRgy0vid4isO8+YzmjHv/r5LW9+ouJhlaKVSJGxMAV/6660d8
         6mTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137378; x=1792742178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=;
        b=gfMq1sOqb8pg2AD55xHEQOts/sz3nW5oKCPLtUh/iZ3QB8AuLI6bDm57bkzhPTluD9
         Ur3AVRrIo1NcayCfymyt1++c7hXdWwTeSSvoZ1wXH+Qn8qRprB11nckdpkjc3Z13SwsQ
         1UImJqsonjm/8ikqSUl8IUB8LpCsFv6BUoQcej4MT9/+cPDBtWFoFXPP16ODtS60jWGw
         UWkjAyKLlXnEO/RPibj1K/27cvdc5/45SiaBrCP3JoeafW2w+zKKqck9EJgN9A9HP/+g
         3G2TWvUJM4kofH2VTUNExRWRqclP5wGMmnd7xx0rc/3HGUhAcPx6TR0NOsw+nE9hppE/
         LnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137378; x=1792742178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=;
        b=Qg21oTaKtEjKU1RayPTSvuFOh18h+3cbAqbYAk6BpiODNg3IIZkLwNYYvmLjO6pQuo
         OvZrd3EQzwzyL4Fl+IWhvxw5RUapn0JgWn+j8CivjS5ogsGCB01Umpwxw15CM82O8X+f
         JsGbpWjt2nZDP5wKTzrigQX17EjRGDVGkICr/o5u+qcfRnEX+i8ze1J3fQg/J/qc+vnu
         WpFcoZbub1BhTrUW239lpBvxAhNODwOOVBEQV3sxS1yx2Sl8WXJOgItvbi1FnWo9I1a8
         DmW42RU09QBa6CmQJVEYsu/g8q8quSP5GqqAXapdnWaUjFe4Ipd/4/wBP4gpUQPkdDGH
         NSBg==
X-Forwarded-Encrypted: i=1; AKwUvBzSemle7jUVoqtT08LpzSi2/IJODeupdSSLQI6xJxVQ+QXYZENU7XLnLUZruIi5lB7cOkkoeszg3lLzGc0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy3I5X+QzzfdtxC/GxwN1ly3XG/ObsHnW6ux+w8Rxw5OZP0Y0o
	bYEjUGodE5YdTK3SDYFQqlktx0b0QmOUo5HjC7ba1ZkVRdBbCnSw+2ukvr7DBynB0tCrWqa/QcD
	dioP6iSwxdxD2IT9Gf9MBe0hsCLaW734lz3ccJI/nX0MLiz+yUI5xb0WkOI7FYWWoX9AWLfrAEe
	XTr2Y9oiBZ7I54MQBVYO+7IWYgiArIgU5B4HAYNdyyCA==
X-Gm-Gg: AYBFou2btntxpUXIMfV0Q5foKf9clTwndpvnKIr8TVr81qLgTBCPLJ/8EVsU5jTt9+H
	Mt4CiXabugotma71hmEPNeQmCVisq4rxdF3/aDGfx6KJyuqitiCW527Rs5a+5FeMWTbmLao3qp8
	Wb5KJn2mP0PWjk9VCE+L1i3JalsfPsfxsIawmbeEl7tflVxrC3/UMNXuoXrA/3EDslYLoxcrLLZ
	MmQb0ByJgCMfgcPOqlqzAKT5+glEQvqa6FwlSYvMN5XiqVY6xIeWe60fTqfhDvBsszXC4/6MYaK
X-Received: by 2002:a05:620a:3947:b0:93e:6325:ae6d with SMTP id af79cd13be357-93ebd248dd9mr3909709085a.40.1792137377656;
        Fri, 16 Oct 2026 00:56:17 -0700 (PDT)
X-Received: by 2002:a05:620a:3947:b0:93e:6325:ae6d with SMTP id
 af79cd13be357-93ebd248dd9mr3909706785a.40.1792137377058; Fri, 16 Oct 2026
 00:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-4-1f3fa9af940a@gmail.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-4-1f3fa9af940a@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 09:56:06 +0200
X-Gm-Features: AclHuK9EtofJ3KdOY7tsLgDR7QBNZwZtJcvmiZFhadgSBrUvuUDEDEKnQ2RLZCs
Message-ID: <CAFEp6-0GrFoMFe8kqhkOdvf5_XkuZG_AmrjTMxxfBABda7132A@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] media: qcom: camss: Configure C-PHY through the
 PHY API
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX0+qVxbDL/GGn
 irsJuvWoKvVlH7W1RPO83qmZV7rBWg1CtvCV1feXAtadg+xfX6Y4oERiPYkCe4xOMwIjRD2zwcc
 LJasUPNQNXsE9avQkc2Ma7Vx7XdZ/4M=
X-Proofpoint-ORIG-GUID: soVGRNjifljA8jIU_2tHGXCrd1U1G9U2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX99Y46HiyWV0f
 qcFZIUn7Rg8Rtty1pZQ5PM8uMSv+WCMHgfG8PYm2te9iAtZAXNU3l7DpxxVSpuyLKRL6hS38DLM
 wRJfqigZPOz+hsnpx9H0D2owGWQAl7flqWBtMIv+XTntQc2/inTJu0L04+4j//FW3jKnSUo1DUs
 ZFCjmg+clTE9JnUcv/YKW4MjWAXuSjw48InTEAr6TDWIP92ir1+/ZRt49GwQPwzlVZHpDd8eq/a
 cyqMtGMc2YCKmMws8HoxtG7i80aMfPb2FsR01dqZQvHluiTLWmHWME8iVzqtpkRs+5kBUyzJOZ5
 Y/wRkJThiVhsEeQwTc8LOm5+l9DStwdjTr+7rAj3nD0cXPOjJsdwrqf8ta+V85cDJ4DX6WKqW/4
 4Lbth/tWwm19JNqNRoJ1FSK8u9y/y5l8Vc55myaq9EgtV0ZovzDavgrtW8Gka3xJ4aw05zwFndQ
 fKVVPKd+xPa1PnrfcCg==
X-Proofpoint-GUID: soVGRNjifljA8jIU_2tHGXCrd1U1G9U2
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1d8a5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=jTXrqqeG4OIbzDD8fVYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

On Fri, Oct 16, 2026 at 12:20=E2=80=AFAM George Neacsu via B4 Relay
<devnull+geocausa.gmail.com@kernel.org> wrote:
>
> From: George Neacsu <geocausa@gmail.com>
>
> With a PHY API CSIPHY, csiphy_stream_on() always asks for D-PHY. Ask for
> C-PHY when the endpoint is C-PHY, and pass the trio count and the symbol
> rate, which by the V4L2 convention is twice the link frequency.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 35 ++++++++++++++----=
------
>  1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f44f2aeb9..8e1b4335a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -329,17 +329,15 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
>         u8 bpp =3D csiphy_get_bpp(csiphy->res->formats->formats, csiphy->=
res->formats->nformats,
>                                 csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>         struct csiphy_lanes_cfg *lncfg =3D &csiphy->cfg.csi2->lane_cfg;
> -       struct phy_configure_opts_mipi_dphy *dphy_cfg;
> -       union phy_configure_opts dphy_opts =3D { 0 };
> +       const bool cphy =3D lncfg->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY;
> +       union phy_configure_opts opts =3D { 0 };
>         struct device *dev =3D csiphy->camss->dev;
>         u8 num_lanes =3D lncfg->num_data;
>         s64 link_freq;
>         int ret;
>
> -       dphy_cfg =3D &dphy_opts.mipi_dphy;
> -
>         link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, nu=
m_lanes,
> -                                       csiphy->cfg.csi2->lane_cfg.phy_cf=
g =3D=3D V4L2_MBUS_CSI2_CPHY);
> +                                       cphy);
>
>         if (link_freq <=3D 0) {
>                 dev_err(dev,
> @@ -347,23 +345,32 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
>                 return -EINVAL;
>         }
>
> -       ret =3D phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num=
_lanes,
> -                                                        dphy_cfg);
> -       if (ret < 0) {
> -               dev_err(dev, "Invalid config for link frequency %lld\n",
> -                       link_freq);
> -               return ret;
> +       if (cphy) {
> +               /* A C-PHY link frequency is half the symbol rate. */
> +               opts.mipi_cphy.symbol_rate =3D link_freq * 2;
> +               opts.mipi_cphy.lanes =3D num_lanes;

Wouldn't it be cleaner to use a similar helper function as the D-PHY
driver does:
Introducing a phy_mipi_cphy_get_default_config_for_hsclk

> +       } else {
> +               ret =3D phy_mipi_dphy_get_default_config_for_hsclk(link_f=
req,
> +                                                                num_lane=
s,
> +                                                                &opts.mi=
pi_dphy);
> +               if (ret < 0) {
> +                       dev_err(dev, "Invalid config for link frequency %=
lld\n",
> +                               link_freq);
> +                       return ret;
> +               }
>         }
>
> -       ret =3D phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +       ret =3D phy_set_mode(csiphy->phy,
> +                          cphy ? PHY_MODE_MIPI_CPHY : PHY_MODE_MIPI_DPHY=
);
>         if (ret) {
>                 dev_err(dev, "Failed to set phy mode\n");
>                 return ret;
>         }
>
> -       ret =3D phy_configure(csiphy->phy, &dphy_opts);
> +       ret =3D phy_configure(csiphy->phy, &opts);
>         if (ret) {
> -               dev_err(dev, "failed to configure MIPI D-PHY\n");
> +               dev_err(dev, "failed to configure MIPI %s\n",
> +                       cphy ? "C-PHY" : "D-PHY");
>                 goto error;
>         }
>
>
> --
> 2.53.0
>
>
