Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6D3184524
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477213; cv=pass; b=gbEjwRmqBGqBrT+STS60HYUgnsts4Ua+1GLq7k5QIxUWRXtGyBw2lGmjVHN8ityBmpESHRVlSRqoz24pDiqULKEaFcdXbg60ZTHjtsQMtydOzx1eEKzcqLTplLO8MlrTEbEIomSWk+gsbAdpx5jymZXxG4SitGnlvBdIRNdVHQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477213; c=relaxed/simple;
	bh=gsjyJrh07JlDH9AvGcFVcXgZkOakK3WLU3t0Bnw/WuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcR+hWBnrj5QFpxbtjr4R0N96I/bGmLTXttc7Gfnl8v+Js0auYtIyjooTQQVzWi9+vTlBhIGNESgolvOppVCcEJaDgQ/h+F/5Cy0Cx/zaZYgWJ57GJFoVOOsGXRS4axXlHQ2efU2faXyUK7Gw05R6maMokW8NPE+yhQ1nItgZIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jj0o3g7V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aj5aJDGj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jj0o3g7V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aj5aJDGj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0Bnj3015924
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=; b=Jj0o3g7VHs529msO
	s4GUSHT7/qFtDNIpVy23u7/aBez6cIjA5NnWpG4ItziwxuLr5TPEEqO5dx8czYP1
	aUt3hJX8dechE2d7fj0C9k5p/pORyPy+NoR76Yl65bHkhnZVZcPEnEu/W6OLkbGV
	1fmf2PQLZFlBgXyDpnaegKzS7vTK834D6HgG2fwwZWsPWjygqMkMVstg8MSCCqEh
	Utpa743q2pTi3u+MKRFbJOn8lUtt1VSEb4oAE0pTqle3ukLiS/krPe6dYe6GUcOL
	OuQzx6z2sXTAzVJggHt+R4c8u7mFRfnscLahNDaZiSWXscLgBeUxEIB7QTWq3AlY
	braKFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4sa3gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:00:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fc0097865so138758531cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789477182; cv=none;
        d=google.com; s=arc-20260327;
        b=oE9xIJFvO+X5wbm/eUASiqHVdRw12FFnNHHtw9BtYG4ZgSbALSRCUyLS1tpdZLurJL
         cwRDsqntCFy8irntnCQc5SdQYV+onykrb+MCxn2LspYR7lGbPs1Lq0flYL5fYJow3+Xz
         4lFfni8FE7o8e3QJJ5JdO8otNS/g2vV4wyedp0oYJj1jf08Sq4QJEakZw/KB3xNu0zZ1
         Gij4+Ha4V0lNw27Z6TL2azeuaA60mlFt4aOr4MOG0c9RxglkLMA07DnG0Dqs9gHZ/rhn
         1NqISzrJQ8fbg7mNVn7/ktuomHEY7uLO3nPvlFZW6reHLgxF1b7C7q7JliPSla3gUTcv
         dC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        fh=aUjqkzLQQFRneciM959SB/3pIR5BjQvCUtwGxZQI97E=;
        b=T8idRyWh/5/Ci3cROPIHFQe4goZLhti2iilIETny7wBUUpi2WTAC52xA3iI3XH5nU4
         YL75YCzyKFkPWml//tArub27YqH37xIid1vRDtmMVpnsG0x4GDkey7rqX5QM85Xbcrfu
         CZ3ynCiLfiSE0U2X3aEsHSA/w2dbS7GlgDOfxoOcD0vKKRybz5qnTQLZXzLOMsgkjPqG
         OcnOPjZADxosQrHX3eGjgAlKPcCzJspTAXHUPFwTWmbT1LnY3cvZR6wd+lhwO+Iy7Uic
         smdkXQZUSj6Pz1phrKa8Y/dGqOr8AOQeBuGZAxXrRvzXdUpr/gcbH7EtB1nkCvmEHr5x
         vZfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789477182; x=1790081982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        b=Aj5aJDGjQVk5DHANNpJAmnr1KoWh7aL06u/iubGDdBy4xoWOXOMO+u69SJhzJfC0A8
         dst4wmsRsh7N7Ibq6NILnZmk/+qVVaYOt/vMuSevAo28HqmdMdfxcLLLBmnhjr1uzwMi
         yJqAY7t9ipFpZJ8d29bpyb2bAX0QlkK8UhXrEFb7fOIcSrLjq1Ixtbn/UzgXeohbDYJW
         4i9EBqCpABrBXdrNFJ2FIK8cm3pBdfqDKkQiHkFlJvg/+Qwi3Q2esLj9cNhMYuuPMoLY
         Qgy/2BWd1Av29pnFoOCKvyaCLFoR1E+eaeVUt9e1YfsdRqhTC4JMmgaDZXIpsOOQRdtu
         yobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477182; x=1790081982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        b=uSPMAUDzVG8X7iv0JPG6TtcucdhZIpuHmz2Tm5TbHZmAcBRO1KUoC81JzhyfHdlbKg
         NBTyqibU6mlAnwk7YRtaq6kRFDM+bsrU+aOnmc+6/KTJNwlIpbdsIgr/MEWDIjrXvk8w
         FBndBiMaUTtgnPXcy9Ay5+cpLE/Flc1Xx1FYItEB48UvbQkqH7F/gANiGXmF7c9zc5cZ
         DvIhlmpg7DxeS6JYZnzH/cka6UFVhY71RV6x4BiRv1zbrh8o2Ssu/EXeQ5PvM6yW71+4
         Td/lF4tvMPcYefsvRRMXrPJn+SzdxsfB3W1ixTGIXhlRvMZfL0MPC77k6v7nAczVSjeV
         2RRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkYt64DRMf+PyfdOZUNoN5UeYrLZjBxKIu49QgvsPI6M5DlVnCFLwdgSfMXee7skbHa7KW5gVa/pJDbvg=@vger.kernel.org
X-Gm-Message-State: AFuF++kxI+1YcSNmrDEgPM2vvgttJCOKoDV7bvt4fnUQoseubuB3ka13
	rdgie4V2j5trejtMf0WUm+Qp2qC7U1fEhW0q8tSuDf43AhY4qLSP4iX3xEMiA2NLojmx0HpkrTq
	dwdpwetf+fOwYFDilEZimSwnQKh3LerBIgSntMNkMqbUbZSVXpwXz52TOV2cjCYPZ4K+FqclulZ
	Gy1d2mW6rW/VBciPwmrtDOPYwZPxDoR9pEQeJ9HbMSxQ==
X-Gm-Gg: AYBFou04VwHkY8iJpD7ZuwvYBp027QjapJMRnt/TpXueogFuJG1NPlFrgZiPlI2YFCy
	Nolnqo7ybQKpttM6jDVXBvfOlQM9gsiB6cVRBKBPRnS+ePTE9Iu7qbx1xIHRXlOK6GO4dZPs2Hs
	H8eYVitiQ83+0RkbYYlrMLw1dZeYbzH2rsvbJQ6rFRD4RPg1mSF+14AP6UK8fk1/jTWlufjvXaZ
	2dpOLshf5Dk9nrTl3aoqQRtgc+3OcRCxrMyFi9/LV19ryFVAAc3u1K3osb02L67xW/GXizhk+uo
	ScR+Pzpk60/59HeHNewHIhy3Yd/g
X-Received: by 2002:a05:620a:2707:b0:939:d675:f166 with SMTP id af79cd13be357-93a29bb3b5cmr992163185a.48.1789477181832;
        Tue, 15 Sep 2026 05:59:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2707:b0:939:d675:f166 with SMTP id
 af79cd13be357-93a29bb3b5cmr992156585a.48.1789477181359; Tue, 15 Sep 2026
 05:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com> <20260915-kaanapali-camss-v16-3-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-3-c9f3f6f4180c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:59:28 +0200
X-Gm-Features: AcwNN1U5ctkEm4DwFkBSfEfQg9_gGH1ZHa_iPM8quhRMcHD1Qgxe4V5aAf56VIY
Message-ID: <CAFEp6-3wmGA77cKaOgDUxsFSFaa_q4StNkVPrz23jN8r2HaF1w@mail.gmail.com>
Subject: Re: [PATCH v16 03/11] media: qcom: camss: Add Kaanapali compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfXzBzH2dLcazdI
 Lrm6bP5eH6CpOjpOs0BJGiN+Ku4DKzvyDv9LP+BJDZK48ZHR2m/DEPt8ugKzEdcOx+1Wn3oFQFU
 qNQZGJpoLY4x5xyJ4JZGDbQjoP4VJ+8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfXwFsgYdM5ernM
 dw9v962QUVfGyMAjdbKFvSycLoKySZodrQZyiykkVsuiPq7ykuImib0UKGyju9iD5NSA/QTzgm1
 eILFgDDYTM26eHEaHYMX4VpwgT14mbDyG/d1fn2sZ4VKqizOhr3CWLFW5s6hZB4+gJW215C6D6M
 JHOX1X3iF6rpPZ2uN2Kc21Ku9V0ttQwdgLDUTHKj/Tf1pGff+M87B5vkDLxpnqgSP8jOhanjAhO
 zcCSm9egw+bGslcmj9oPQx3aTm0pBMeB0XIH3qHIdskJg2PiVHDY12GR3Z0kvPBuqKzPNOUKk3a
 Z8OJGo7L7TbkPOuq0BYJTZrZXigZDnByH9wMdB7bgabsYC7u82i8L4F1jcR4uFokPAHDBccrhTL
 vQeOPFLqWtB4MTd5JVXzfNvpu7tZqdJ0fLtGczOof4VMeIE8Nd8rX8BB8yGJLg2xW4TJZ6pNAY3
 aNYQxITwzFT68SrlR0w==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa9415a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=DkjGjKK6HQ8r0z3qK2QA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Tx-RHM-qVnYLtryEte_16JM12d-DpGhS
X-Proofpoint-ORIG-GUID: Tx-RHM-qVnYLtryEte_16JM12d-DpGhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150189

On Tue, Sep 15, 2026 at 12:10=E2=80=AFPM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
> private data, the private data just include some basic information
> now, later changes will enumerate with CSIPHY, TPG, CSID and VFE
> resources.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 23 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 07b3cddca584..2c9f02bca809 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,6 +34,20 @@
>
>  static const struct parent_dev_ops vfe_parent_dev_ops;
>
> +static const struct resources_icc icc_res_kaanapali[] =3D {
> +       {
> +               .name =3D "ahb",
> +               .icc_bw_tbl.avg =3D 150000,
> +               .icc_bw_tbl.peak =3D 300000,
> +       },
> +       /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +       {
> +               .name =3D "hf_mnoc",
> +               .icc_bw_tbl.avg =3D 471860,
> +               .icc_bw_tbl.peak =3D 925857,
> +       }
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_8x16[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5596,6 +5610,13 @@ static void camss_remove(struct platform_device *p=
dev)
>         camss_genpd_cleanup(camss);
>  }
>
> +static const struct camss_resources kaanapali_resources =3D {
> +       .version =3D CAMSS_KAANAPALI,
> +       .pd_name =3D "top",
> +       .icc_res =3D icc_res_kaanapali,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
> +};
> +
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
>         .csiphy_res =3D csiphy_res_8x16,
> @@ -5829,6 +5850,7 @@ static const struct camss_resources x1e80100_resour=
ces =3D {
>  };
>
>  static const struct of_device_id camss_dt_match[] =3D {
> +       { .compatible =3D "qcom,kaanapali-camss", .data =3D &kaanapali_re=
sources },
>         { .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resour=
ces },
>         { .compatible =3D "qcom,msm8939-camss", .data =3D &msm8939_resour=
ces },
>         { .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resour=
ces },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index ba3d51d9c0bf..fadba57c5efa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -96,6 +96,7 @@ enum camss_version {
>         CAMSS_8550,
>         CAMSS_8650,
>         CAMSS_8775P,
> +       CAMSS_KAANAPALI,
>         CAMSS_X1E80100,
>  };
>
>
> --
> 2.34.1
>
