Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192A343890
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465476; cv=pass; b=S6oyCH5/m+Drq24GHqx+WC1BzBxNxpgHiKwCOaKt24U0QrS1oP18BVkL7nNJOvqsNJWmAXgpSB8ciMCm5jwCgU9y5FDvzg6uugWQpOALH0oMZ9AoAunkbBYLEUavzYCQp7fNXWjAaNw+gX5F+oZwm5gHGondHATngz+x0jzOh1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465476; c=relaxed/simple;
	bh=bnMbNVVj2v7D9H53XLbDJbbR1wetYWN0pnhL4iZAsKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qh8mWudMc8MezdHQ/GTkQ9Hc4ZSGi1PF+HJJfLP0He3/xJPLgDIvob9nA+Bni5H9+sph67PILDal8WpQgF5IMlVgdH3kV1jUhhw+E7oH/xSRvRH4k395X5kU5k/EKnMfE5p+1C1baFtMoZkk+vuZAZQr0itrncr5U3G6/gt07oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CswX52JO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BqO6+CL0; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CswX52JO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BqO6+CL0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hPnX3742097
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=; b=CswX52JO4Piek7S1
	Nh5bNU4VoO1KLQKJHZi2GoNsBO93uwTsHWczoWdD5kh+m9XZtxEd23AQrjfDPOqB
	tX5Cjr+nIN1hQekrHcniYNtSI7eA+CV1XEJVBv9UwvTrgzNsnyjK9evluCd9rGjz
	+DkpQKne67MJuncyzn9NhnAmvFCbziH8n3MzIJ9uckeogat1TJEpjZHYbk5E7GFE
	hnkRb8LlCj/uwSTXPsevc+/qgw6cPGOY0d0/N1akFR8jVQ/8lqNtqBc/KHR1wL0w
	7WxbNJx8Mp54CGlfZ+XZn3I5piX949TDmuYC234iyBEY7w0iWqTsMCg78sI/1IXC
	z37DOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux1233-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:44:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a05d645acso725818685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789465473; cv=none;
        d=google.com; s=arc-20260327;
        b=eekoHfb+mOpqWAt7hRjOFUV537fubA1I3bk+wEsh7cf0sSsrEzihn4lcpgOqg5/nm9
         7MCKELTic2DTfWNRMjTZ90OXioCkIRjiOV+RI27ht85x2dvcdNbtAO/NPSXRLzoPbNU+
         h10e+8J2ekWpVdfcsXtS1UGjU0Ibm8RsX3u0b+7wbdbkA66TYi3sXEnzIa2chj0AhTMd
         i94WnoQGnFKWpXV5M2trSzgAc+mj6ST3mxQfaoRgLLxiFHLKrSX65Zb0VJ6XdpLc8t7y
         JNZXaWR1+DN4HsMP505MeYYn58kayr+a1Q8Um2IwkS/aCMzCLG6kg0KeZjxwuIcUevIW
         h7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        fh=bv/G32+CsUHZquceNAhOHuJHj99/NN0KqRnhBR6vbWs=;
        b=b8SFocnrnSCGTKG4Gf0XZGYobj5bWbQPuq/6bs6xCIavmB9fQJagLsq9YwU8Lg7ZS8
         QS5qql/qFEDCgCQI0KFYG3d6YdPsJcJ1KXr0IAGu0nuwEgwHt9LfAR+X5ZNE45NU3u/V
         1IMOB3tEO1tUk6HoGYugu3N93ViMDCj8xzAJshqJomq0VIR8DY/z+xHsCvdY4wqi6NkP
         8MNE89qARrOctksnHhhjsDSA3DMDCQJI489ow8/GwR4845DKxP7/gVdInv8i7E5D8BEh
         BT47iXTcQcQRijdyYA7JKt/rW9ArEY0XtFFxwgskCeUC4sx6bg7uJ42W2PZVwhcTCAOl
         7nDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465473; x=1790070273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        b=BqO6+CL0bnBgpS1KoPFMfcK3hk9hoxkrNc2XYwBLMu14pNQTHeeR2OMQd98FD4vpJg
         vZ/lrPhoaEgsekh7SyNuP+wx/1toQyIeZLR9WJCeavjV2DfV66q1aHYLsT83oKAGvdT2
         ZP5Vd6eJA/k6EQ/CWpGYkJIX7TPJos0MHHBXon7x+E/Xx3MAxFwTnwmSDDi+Y+/mLsm3
         4AGYO3DW70kx68QyNv2dirIAomy5i0hl0UcWmTaMLboU9PcrRpag4PUXtqPlaUEKg5rd
         /iYf/vKf2G5b7AUoK/bhcExLygqWoa7ck92fChzWwtr6VrHgI0H6T/W8CB5ObCp5gZA2
         DTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465473; x=1790070273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        b=ASeA+4qIeIyG3iPl6pHr4tIJFj88PvKYM/Oks1o8GZEUhPyCHHHelcgMUBmYdyghCL
         SbeXUhyap323jRXqRcG+DpvbQW6EUwtM5Aqo3FaFxIk5J+wL6vMYVnrhxWSiHa9UCxep
         QpFLPUS4XmRThMdHUv2gxZrsjrK/BfQMIGOwBdbf5PCigZvEfNAAPHjOHj/MHVaIOxAd
         lTyVzzU1LWc2BFbZ7IX12na+Akw8MzFPXHZNqyfXNxTCTFQEuIwKtI0dHsgiEBYqZtvl
         Ye42fTmj+bYDmkE9Zgyn2KxoeoWUngdHmXyIxCGwuMD3hUDNIjeDdX748TsmLl5lqxqn
         khkw==
X-Forwarded-Encrypted: i=1; AKwUvBycqTAK+zKhWbyZJamwQvnJZOMznM2ahkl3K7GBIoXXg4AT19z4Ts9d3NRkY1GbgEuC163RbFH+2gEIwiI=@vger.kernel.org
X-Gm-Message-State: AFuF++nliOKBE3VerTmy0SvBe+Rbk/7/CvxobkCC0NTYT0jF5AXszYHM
	mDuUxSkZ/U142WHjUaT7kU1Jghh3Xcuq8+qih2FLUm070Dmh+kPGos+m0PGjyUHCoQq7/95vS0u
	XHrlnxPX8mcetDNM0AbNJ0yE2K5tA/z0EIiWRVYE1JStlBai6t1Iml3bU/JeC2CvzWkgUAZD4Ow
	CmRYyobeVj1hYNe3IFiAztVEMbJNjxmRqroSP9X/9gGQ==
X-Gm-Gg: AYBFou2o8dVkHdnemj5TAyOcLtSwmVczxCeUnPWDKZbNAsfkRiDbiUVvYdtXChysRio
	B78RKkJVLIi4UpYVK8JDYlGDp0o9+gNcpFa/lQZjbkPa5XngQ6urwJK5deHKgqgJy19TeoIB5Jb
	SNA6CcHEEcYbDVziKV+scVZWSvLf/asoXU18xCmCQYKp4tVWrAqC82bIXezlEuLb4TY9s0IUqGo
	LamP2eGlG+iFBGiRAYMTPpS7OrQCqONGyN7kLSQp2xrkXlR7J2yGSONxIfC2QAoKCmpFRmUOcc4
X-Received: by 2002:a05:620a:1994:b0:92e:4927:2002 with SMTP id af79cd13be357-93a299edea9mr1021969585a.39.1789465473220;
        Tue, 15 Sep 2026 02:44:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1994:b0:92e:4927:2002 with SMTP id
 af79cd13be357-93a299edea9mr1021965685a.39.1789465472779; Tue, 15 Sep 2026
 02:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 11:44:21 +0200
X-Gm-Features: AcwNN1UBt5xNb7VDMYWD4BT9h_axCpKQfZrvwQ0bvr4VpK98SvAM9POncAzr6Lc
Message-ID: <CAFEp6-1meC7+XV3nVUiqivnpPQwDnDBRNCtmDZ-OMG=sLkxAvQ@mail.gmail.com>
Subject: Re: [PATCH v17 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzOSBTYWx0ZWRfX0/V/C50hYuBt
 jF8jJanAD4nyxzDNzl/IXOGZ99Ajrxr7ZsMn8Cyde5LOIfcCtdaFINQ8bvRn4tl0jlUndzVFQ3I
 GNP7/b+AzCEW6/0hpW/gSIJDSS7cqSegt85ceFwXQ6YUKKI6nLQrxseHXpO+5hbMwWfz09BIQfZ
 w1UKyGmy4rZ4WuGhLfCeGOVD2gUIGyb6KUGIg0Jved5EYLhuqkyJuAHn8RL7EggC860nQYy5kmA
 h7MiXG5B4+tdskxg6rh919t+hI2HNtt8qD0wQN5yUoJnIxYCYD3WXiojQcNKN5Dj36Ws9dbsiO7
 ZoSihVo2fQ66drpG63chKqYwB8En1RA9AZP6oTARojdtqIUUpIqtfOoJFd8WmAzpy2W4GTQdmhD
 B9aChvZ7ikMD8h7/ETZjXu4jeBqk42hPyHimsWWPEIbbgk1WCuBeR3g1VZMoF0S+DX6N4QrYcVM
 qgdwmOGckigXIw9AlyQ==
X-Proofpoint-ORIG-GUID: b3y6l_6Vzz1VJbhdb70DpLpLm1RGWLQJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzOSBTYWx0ZWRfXzxwYua6rsLaf
 WguVCUU6EAbMnBWEJ91WbTbg5UoNXsrv0HglwPR6R7LdHFq9xyDbcDVrM3LPIJsr5XcinjH9SZW
 w0pjz2mtVkZnBTIM9/8kqDbOWY5VKUU=
X-Proofpoint-GUID: b3y6l_6Vzz1VJbhdb70DpLpLm1RGWLQJ
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa91381 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8 a=aw8XXKZHl-0D_llVJ40A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150139

Hi Bryan,

On Sun, Sep 6, 2026 at 4:17=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Introducing a dedicated CSIPHY driver community feedback was both to move
> to data-lanes starting at index 1 on the PHY side and also to match that
> indexing scheme in the CSI decoder - CSID.
>
> CSID consumes the data-lanes property to determine which CSID lanes to
> switch on. For indexes starting at 1 we need to amend the logic somewhere=
.
> The PHY side code normalises the input data to register level meanings so=
,
> replicate that logic on the CSID side.
>
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.
>
> Existing bindings are not affected.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 84097d82d99c9..07b3cddca5840 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_o=
ps =3D {
>   */
>  static int camss_parse_endpoint_node(struct device *dev,
>                                      struct fwnode_handle *ep,
> -                                    struct camss_async_subdev *csd)
> +                                    struct camss_async_subdev *csd,
> +                                    u8 lane_base)
>  {
>         struct csiphy_lanes_cfg *lncfg =3D &csd->interface.csi2.lane_cfg;
>         struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device=
 *dev,
>                 return -ENOMEM;
>
>         for (i =3D 0; i < lncfg->num_data; i++) {
> -               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i];
> +               u8 lane =3D mipi_csi2->data_lanes[i];
> +
> +               if (lane < lane_base || lane - lane_base >=3D lncfg->num_=
data) {

I agree with Sashiko that a used lane index can be greater than the
number of active lanes.
So perhaps we should remove this test, or compare it against a fixed value =
(4).



> +                       dev_err(dev, "invalid data-lane %u\n", lane);
> +                       return -EINVAL;
> +               }
> +
> +               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i] - lane_ba=
se;
>                 lncfg->data[i].pol =3D mipi_csi2->lane_polarities[i + 1];
>         }
>
> @@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
>  {
>         struct device *dev =3D camss->dev;
>         struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       u8 lane_base =3D camss->legacy_phy ? 0 : 1;
>         int ret;
>
>         fwnode_graph_for_each_endpoint(fwnode, ep) {
> @@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
>                         goto err_cleanup;
>                 }
>
> -               ret =3D camss_parse_endpoint_node(dev, ep, csd);
> +               ret =3D camss_parse_endpoint_node(dev, ep, csd, lane_base=
);
>                 if (ret < 0)
>                         goto err_cleanup;
>         }
>
> --
> 2.55.0
>
