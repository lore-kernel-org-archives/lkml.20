Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4792C21E8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133449; cv=pass; b=kx4JlpRzcMk8uij8kXX1WO/GVSol6aeKDyzUaRmkOg+arFVAf6v7d7KWPjffTddDEA+ZCBoUfWRL5Kkx3+D+QSXOXtq1dTMMdFoCwl8o4CRSax4AkPmUrvxbj6gvGLU29w7XmyCmuIc46LURTOaQ2oNwNseHzIzpiEJ/hbPR5vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133449; c=relaxed/simple;
	bh=4lD+fdIkCpFrkvaEllxA62fuWDDC2r/xs7a1CL8i7mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWzMCSJj5tx4xHS0U8QXeA9Q06hFLxHQF9+cV5aXwOPY/H1Pc5mefGj+3ohpOowSAA7czWUOoIPkZzPzu1rdI/NgvdLL2shyFK2ZQajRYD2rN5dzE1OJvhetTAYL5p72E/KijiEbd5A9yc+ML3nhXACnT2soFWhAizXhJ3nnIq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q57vn77y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsY42Gk2; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q57vn77y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KsY42Gk2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCighi3505567
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30SEfTMaiRRo/hZc6zQhITJ069QvU7ya8k9UFADlIU8=; b=Q57vn77yH7mItFiN
	HbECHovYkfHNaKUsxRSiapPrLtThlaB+VungMusAMsSE1txNsazgymFPBdWh2vaH
	KuH/nefzTW+NbE3279Ns5I9XNIArPzDiWdilKr+2+JdtX8r/mBr7gtkaxR3+cruw
	I77qF4ASJSp8IZN6HXRt31ZYrGTTOPTmZNphFwbp/y4rXaR8qNRTAefstFYs300S
	CtQwXOsC+W5/vvkiJ+JZOyzcLwbazL8GU+Va0V62KREMUQcnjN/fOIU7Z1ptwxJE
	fEy69jtv5krdtGF/J0VKRzl5RbtuZNfBF1Sm3T6cHvaySz/cn4xfonJP2FavEt3I
	Gzm7jw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfhp22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:30:46 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-456b5122c7cso3027768fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789133446; cv=none;
        d=google.com; s=arc-20260327;
        b=Aqwc+A0IpvJ3nRqRWmR9jPz33SMKsCtNnvoZFYOfSD+W82c8Bs80IzMJj0+OmulgGj
         9FjNR3y7JtTRA9fMLofeQ3BpILqbK/JhtIu5MUH9oOLnEI3StfAL377sGOLMSMuv9gcs
         BQosifjLM6hPwYXIM4+oCC1/9PVwDHDB4l001CsrAv1uUsyZAJh8Cn+pERboy/JdicQF
         +Frhd+aa/XownuwFVZoaiCsLuEB0hcIoJXMU70Lpa7B7O1PxvyBXznKVxL7+VaotyePW
         j3SUlZeprk3DIHsFoHbNxOKQklcdo7fyWWszSW5OW4JjG5tOXeaQIH48SkJCkGF37g0m
         EnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=30SEfTMaiRRo/hZc6zQhITJ069QvU7ya8k9UFADlIU8=;
        fh=N7y57X1Hig517zUqHYK7DsTPQa0NZs49ZCyw494rUSw=;
        b=HEdGi4VqmgRrZkNilFmRF0/o24YbJKOxU2jBjgqDS2nFh6VbXx5VcPH4nJq0n1+2ir
         n0MJuwpyUCY6ZuCckFCDglRMSLtlDUVS6dfY1LuX2i6+NjzK/O+ADTxOm8G3X3n2xkjd
         Rdw9zrAjo44bQSCl2FrsM8jpUeJXfp8k1AuGnAeoUuc47Y0dTSqVzYdc2hjVK/YOrB8N
         ve8Q7pXkHHqvuQm9VA3RE7rAhWeb4u6EOUt7TGdjoJQrV/dIXR5BnmZg5VcrSO7aAi8Z
         2S0jWWKs53PB0bHjzNX0fBw6GQoUBlPeYWgEtqOlFK+4mKpEDsGvPpgQ5GfxN5Z/NxBi
         QOJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789133446; x=1789738246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=30SEfTMaiRRo/hZc6zQhITJ069QvU7ya8k9UFADlIU8=;
        b=KsY42Gk2UMVjMINpGxN/HbSFAmuIS3xrGe/BfTNhHfa2JPozDkFLB5JQPMuJ9SeWCx
         /twNdPwY62k9nPHhpAXSSEJzmoUSIuIJgS6G+tbkMc9WGygaq6l0gFhGduW8O3r4ZIIG
         WrQELxaEH8DxbLqHDw8djYRrJEYxPxEnxud/RSPnTXpYxCTBFTo1cBn4TzeaJVuuM2UX
         D6/9Q6sWBMgysEdt4YVV0OTCDsEE0TF1+OdnP2pc5PjmZG6vdckH9UdRvXbcY6LYoDSV
         r2ZhrOYLhyy4m3h737hG1IRpqelFBkjA7oNtlhPFQiCvCc9xzEkapyiPTmEorhYnp3DC
         y94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133446; x=1789738246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30SEfTMaiRRo/hZc6zQhITJ069QvU7ya8k9UFADlIU8=;
        b=j5Q+IJOV+iKRZfySDonCohZt9nvf1amogzFNlsXK2E1cbzFdvVujiDjPUfrT+2K/lx
         2w4o9Ucw6nIF5MLKBnzpPM8GHcD3/tC10zdWNw/rZezKLMA+54Z6jSlzclo4aZxlNVNd
         eX1m2KGoubh6ETW0vNT/elQ1v4pC0Yw0UA9gXG7tPHeXpruDghhOSzzENS/ruwX0ZwJ8
         9DVes3WzqR93PjoIDGJ8d/LyGOj8zeVvbHFxnC+H0OJ8fSbRgAOWyf8lFbMaGan/9Shm
         no0xoKwv6GDucuk6bDK09OFGaCaKcvW3Vd/iG+AE4fbi4i3xOazUnnxy/osqRPLMoM+K
         Db+A==
X-Forwarded-Encrypted: i=1; AKwUvBxZiZc15zGe8SnlaeTAH2h7V3nvIU1Wh0lxsXyAApr2DhQ2fbaNHl1S8bl6mFYMyVmkHJ/pVD/gXrP1HpY=@vger.kernel.org
X-Gm-Message-State: AFuF++l7wPsk0d1IKE4bbb0Cn2uA5hy7993dcgz7UxFzUyib9VE1R3we
	5bZU15N1JnKADtAM/U30nQFlktToXpp2xXk+Vtq2/522VYgZ8E4Waqfk6UiY4lsaceA52RQyhtp
	5ae5PV//M+zvf3JkzYZsCALM6+vz+gzq0LBsrF7k5PpH2PBtDb8BznSqNylFtYfb+Zbya2mJplk
	C5m5uHsvASrS8XHaB/C1OxnvLymix9pKbOg4cNLuTLPQ==
X-Gm-Gg: AYBFou2y0o0v6bdObdT7FMkXqcbIF2k3McUfVaN3skKK26KrtJaCIZ3CEAwFnT4js2O
	baIc5JaTR7rqWWRBfHO0phcX6MlLzf/NCOYSgOOj8NUAyh7krpOBbooXw8bgFfgEOKk7VBzFcE5
	CRyH06erFAuzm5ocAKvu6m1XfqR6saignX9g94Rxndv3v24yVLKytcyP2/R0CUl6GjHMcERzflw
	qHoyXXScwwncR48Ea0VCBRupmKQk7XswHfoRLcrxKilGsjwVKLmHdGEr9cRRGKmDwuFrZq6pB4=
X-Received: by 2002:a05:6820:811a:b0:6ba:34ea:ab69 with SMTP id 006d021491bc7-6bf47581f20mr3882177eaf.40.1789133445724;
        Fri, 11 Sep 2026 06:30:45 -0700 (PDT)
X-Received: by 2002:a05:6820:811a:b0:6ba:34ea:ab69 with SMTP id
 006d021491bc7-6bf47581f20mr3882147eaf.40.1789133445219; Fri, 11 Sep 2026
 06:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com> <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 15:30:33 +0200
X-Gm-Features: AcwNN1VovD7pUCq37SmPVPwwNaq8BfJG5K7uCD_DMBZqK3zJMYoKlf3viX0P7rk
Message-ID: <CAFEp6-1+g+kpevwUyXb2+0M4H5NPtz=2bc-CRfzyhOukRAn7VQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: qcom: camss: Implement CSID streams API hw_ops
 for gen2
To: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4OCBTYWx0ZWRfX4yeKOnmacd1b
 dHwiivDKPUnhMTWmob+pCv//n2AmH07h/BXLfBt7wf37IoPMoCnmIm8x9XWe7o7X9xJxHYTVuPb
 b0euvIGWcpO3GQ+3Z1ofSIPsDHKkXFHmJYZSuDhiq8AcP5oNU7W0rE8IT6awISWUObvU9svvbbA
 vxgANm5SWggyf4uur/Md1k1Goi2QyioxwzYjgzFlIUGERRo4VBeEijX4WFE43CQfc+8GqSv1sMP
 lt2iAtsmagiKncITMBTf09cSXaPcH8nZ3/ALgzz2Ubt3TSJ5lAmSxd6XQcj49K1wqyWmvT9Wyi2
 XpssmgdaSruhjX3Ng0bPlgBqBf7zqsDyhIySKUjBSQnK+6XHR+guR/HQiyi6s2diOJkqwkruxBS
 u8WNXd2mvQzWM3fxgISLertjSqHCD41UgNDmlWU2BZJOJY9QH0tH1dI+jjZ/9m6LkqNMHnnuk/2
 3/utTM+RX+DttfP64EQ==
X-Proofpoint-GUID: pGAx-UAofQMgTN5k_1r1BdN7r0P3wpYw
X-Proofpoint-ORIG-GUID: pGAx-UAofQMgTN5k_1r1BdN7r0P3wpYw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4OCBTYWx0ZWRfX6xHWesgbhbsf
 XptFPB0io+rONXCUX8cgvnJXurpkJhdoofjkm5gqAdGYKWZni/JRKQMKyTL4EpbJ3K1iKrs9frm
 djdWk6fhkCzo0QY9AcvJZlBaHuQhot4=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa40286 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=PD6HDMPEw9IjBIrcI7IA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110188

Hi Gjorgji,

On Fri, Sep 11, 2026 at 8:22=E2=80=AFAM Gjorgji Rosikopulos
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>
> Implement the configure_rx/enable_stream/disable_stream hw_ops added to
> struct csid_hw_ops, for the gen2 CSID hardware backend used by SM8250.
>
> __csid_configure_rdi_stream() now takes an explicit data type parameter
> instead of deriving it from the CSID source pad's format, since the
> streams API keys each stream by stream_id rather than by pad. The
> existing configure_stream() path is updated to pass its per-port format
> lookup through to this parameter, preserving current behavior.
>
> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> ---
>  .../platform/qcom/camss/camss-csid-gen2.c     | 59 ++++++++++++++++---
>  1 file changed, 51 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f7e3aa..2512cdb16d94 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -253,13 +253,8 @@ static void __csid_configure_testgen(struct csid_dev=
ice *csid, u8 enable, u8 por
>         writel_relaxed(val, csid->base + CSID_TPG_CTRL);
>  }
>
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc, u8 dt)
>  {
> -       /* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, =
Pad 2 -> RDI1, etc. */
> -       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + port];
> -       const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
> -                                                                  csid->=
res->formats->nformats,
> -                                                                  input_=
format->code);
>         u32 val;
>
>         /*
> @@ -281,7 +276,7 @@ static void __csid_configure_rdi_stream(struct csid_d=
evice *csid, u8 enable, u8
>         val |=3D 1 << RDI_CFG0_TIMESTAMP_EN;
>         /* note: for non-RDI path, this should be format->decode_format *=
/
>         val |=3D DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> -       val |=3D format->data_type << RDI_CFG0_DATA_TYPE;
> +       val |=3D dt << RDI_CFG0_DATA_TYPE;
>         val |=3D vc << RDI_CFG0_VIRTUAL_CHANNEL;
>         val |=3D dt_id << RDI_CFG0_DT_ID;
>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
> @@ -330,15 +325,60 @@ static void csid_configure_stream(struct csid_devic=
e *csid, u8 enable)
>         /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>                 if (csid->phy.en_vc & BIT(i)) {
> +                       /* Source pads match RDI channels: pad 1 -> RDI0,=
 pad 2 -> RDI1, etc. */
> +                       struct v4l2_mbus_framefmt *input_format =3D
> +                               &csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
> +                       const struct csid_format_info *format =3D
> +                               csid_get_fmt_entry(csid->res->formats->fo=
rmats,
> +                                                  csid->res->formats->nf=
ormats,
> +                                                  input_format->code);
> +                       u8 vc =3D 0;
> +
>                         if (tg->enabled)
>                                 __csid_configure_testgen(csid, enable, i,=
 0);
>
> -                       __csid_configure_rdi_stream(csid, enable, i, 0);
> +                       __csid_configure_rdi_stream(csid, enable, i, vc, =
format->data_type);
>                         __csid_configure_rx(csid, &csid->phy, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
>
> +/*
> + * configure_rx - Configure the CSID Rx front-end
> + */
> +static void csid_configure_rx(struct csid_device *csid)
> +{
> +       __csid_configure_rx(csid, &csid->phy, 0);
> +}
> +
> +/*
> + * stream_id is used directly as the hardware RDI port index below. This
> + * assumes a 1:1 stream-to-port mapping and should be revisited once
> + * per-platform src_streams data (stream id -> hw pipe) is added.
> + */
> +static void csid_enable_stream(struct csid_device *csid, u32 stream_id, =
u8 vc, u8 dt)
> +{
> +       struct csid_testgen_config *tg =3D &csid->testgen;
> +
> +       if (tg->enabled)
> +               __csid_configure_testgen(csid, 1, stream_id, vc);
> +
> +       __csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
> +       __csid_ctrl_rdi(csid, 1, stream_id);
> +}
> +
> +static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
> +{
> +       struct csid_testgen_config *tg =3D &csid->testgen;
> +
> +       __csid_ctrl_rdi(csid, 0, stream_id);
> +
> +       if (tg->enabled)
> +               __csid_configure_testgen(csid, 0, stream_id, 0);
> +
> +       __csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
> +}
> +
>  static int csid_configure_testgen_pattern(struct csid_device *csid, s32 =
val)
>  {
>         if (val > 0 && val <=3D csid->testgen.nmodes)
> @@ -425,6 +465,9 @@ static void csid_subdev_init(struct csid_device *csid=
)
>  const struct csid_hw_ops csid_ops_gen2 =3D {
>         .configure_stream =3D csid_configure_stream,
>         .configure_testgen_pattern =3D csid_configure_testgen_pattern,
> +       .configure_rx =3D csid_configure_rx,
> +       .enable_stream =3D csid_enable_stream,
> +       .disable_stream =3D csid_disable_stream,

Would it be possible to leverage the existing CSID configure_stream()
callback to implement the stream API? This would likely require
reconfiguring all CSID ports whenever a stream is started/stopped, but
if the configuration remains unchanged, I do not think that would be
problematic. That said, we probably need to address the current
ambiguity between the concepts of "VC" and "PORT" in the existing
drivers first.

>         .hw_version =3D csid_hw_version,
>         .isr =3D csid_isr,
>         .reset =3D csid_reset,
> --
> 2.34.1
>
