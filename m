Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793198288;
	b=MsQj4f5pBsDEa0o7j1z5Z1jtcEPBMVB97NKlBsr678iMl1YOKiWVFz5VWOfJuUajimU1
	 8WvM8VmWiy5kypV1JJautmKRGjONZc057j5kvE9vChERObEG8HV/gLfP0RWjUy89NdSfr
	 MlQAA1aCKGH+/ugRAG13XF6q/cgP5YTWq1Dl73ALS2IVXFon/LBVdsOYrigRc2t2qEFEm
	 yrdLZgH1JXuBMEqtsP1vs59obToOHtOODzBfDTFx5uTPTp5/yWNhuT0HOAoYWPBQUDpcf
	 y0uVJ3rtD0zUdcAIO2ljQ7dE1/HvVarj0crO7yG03jRZdagHQLe0qE0S9KMZEAVESTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
	b=ivhNVzOLnAmqLVFcsSQPgfMT1vauloOHGt78pfzdhdSO1gecuXhfflwAuTaL+dJlqeP4
	 EK5yZKhm2vrRGDjXYmWxjNV3doXpXEnPjiZJgnkVQr95nqPMw3RxXo/JzH9GJEWBvmQU8
	 /UWbQ8sCwOToTOd6Ot/EP2Reus+kN3DJ1CTX8ypiphEDzNyQeGHc10PKwf0l2LAWe0tRS
	 Pkt/hShBDACXHAOBu5gJeJETfkHn2KkawcvdUteufniPqwUfGOQWgPIGEKaCwdjboello
	 5ah9oxVF4/VMcMWR1N6VJutNNqgiJbN2sjjAviGrFWEJbdrclkrBQmofBLDuhFiP50Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UxiT1FZu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kMG1Dc11;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C24606A332
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3C24606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UxiT1FZu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kMG1Dc11
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2s44154745
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=; b=UxiT1FZu7pXaIl7o
	afbL0i7301WPl6FFAPnWDGTppgTtxlQMznq69+HXhqgcglzlCKuI2hzF4QjE/W9b
	kGn5KwlnIYn6xmWO29jLhp8Gyxu5LAKSt5uYnQOYuEHPLCNdcKGwpBLuJ4VEzBM5
	87rMc+4AUE2+YV/igthkB1cmLRhCrtvZ3xo5MVMP7WLogsmJBmUpHwwVDor0xhEN
	zbbrvryFZfrcIal5M/OpZEDdYoD+w9mUfK3qrv5802WPJeyUWU7OSm11rgZcNY8e
	nTzKUq9jmM3ggDgD+FIk4eILZv+nfyjGicM/RkIGIv2jvR2o1ykLuaM2glzlfDuX
	xPVIew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1an2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:38:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c7bb3e2acso17634526d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793198286; cv=none;
        d=google.com; s=arc-20260327;
        b=bCZV39krIwRJ8pvB0Of8Immmko1wfshK9YUYkcyFLLPUto/dTGT8kh47peknC9C/tR
         X9OEdLily5uvxX0vCm1uJiBckTyNVin0TjtkMFlnBydK19nABEKyeR6LVpeeSe9VpXW/
         SDKgn3YATcIJTXG36TD0yCg3pmMWy3ILZyy0+EGBpvVQw2gkvpG86jjkNvzgpSaNNQGi
         4qu5TYSKSeka81z7rt3j8W/SWSr6ITS/g9Njm1sfJ4IpscBfcbhV/kHbqweP+SXaTpWs
         GefgiZ2urtqX6YZP5Xlg6xgJxbJmhwrhVC3LQ5gLoNRdSMHidbz+LkLsnq17oDbONsgr
         z7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
        fh=nrjnzMr5wF0Y6jLbPMKFdFOK787Raa7HF0vUXQH/A+U=;
        b=GSOR/c76ibia9TcpZqhqHHOr0WjwnXlZaANzPC1jigszbeyZ0qoG9yiXjkb1goQfPP
         AtBc71SRE5gBL5Dj3oxr10SgnF0Q92v4iHGstW24UIdM1B1FdNQjLGS1ZwfVFvOCBGBV
         UlHDdNxx5v4hOhmiKz/QlmfP51FEzwQisiOpeF9ICi97QBqcHfZqnmf2ScPsABow6M7m
         dWugAxntEAUb+fBt+Ut6DxAYJLzCZM8RpRnin83EO0Q/DNTkT9pIFbcTo/uLmMgUSZW4
         vrdfDvojD5Kb+uRd783PAkXOgeVUFK0x7fjwrMgSd68Z1HwOGgsCsGwHJH3Y79mRb13R
         hBlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198286; x=1793803086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
        b=kMG1Dc11cocpD5zT5txe/QmBhxyRePIg5LSls4ynKF+5XeKy3w4eeYGHWrszlF9d4T
         7AhWs2MD3zsBr8OZHA1u4csr7aAOr+vD7CUgo2abAPh5K6IuJAUszXzORLSAfYYh6xE1
         FqyqSfuY11Xt+b3YJVfO12mikR6k7jZ3G3SVgG4aojuV41+fcFZeKiKRt+9CglT+PGP3
         sxsm2xDCQO6ao09bOkgzXx5hD4OoS7JtJPoD6iK8DMfXM5IKrWEilCic0by2NNni3Cb8
         V/biY2ZVUpDWD5qkSnCVntReV+XS5mhTWxMt8hnz37OZFJ/HnZSeRlvedK3cfFEVQzPS
         Tdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198286; x=1793803086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAkaiu/+/uRR+ExsZZHjz0gNojx9DBeXx1mELGAsYXs=;
        b=PrOCYF0Lgs4Gi/dTKmq3s1QNJcjVFa6Y/yOhNwk3hypfKg42ES9HqH26cnzl3itPn2
         yKjdg52tKmOIMLEVtIU6Dy7rerP8QnQ7ET0Q5KKMO9vcD4wnzzFOH8mH+RY77OviL1n2
         7pwDUtN95N8GcZ7paT/Q5IWJcQ0lxC2BvAuJyn2xCUNY7fUH06NcDrn71ImxZQ+0+v8p
         6vNo0xpl7RE9uvOClcBmxP/RQbTnjf81DlKFKo9CRqSEZCPV/IlAKiUp+JM9fbKF59op
         5YQ/uLZStzQY7VFkH2qaoIRG8naj1WY4rRm9qA/4vMK7E0jNZ0/qwtwyfrIbaTGNPReg
         wvsw==
X-Forwarded-Encrypted: i=1; AKwUvBxXuZnzydGS0IprQ8ffYf7MOFDqm4LimKXJlSPEm6S4bYJo2Pr5EOr3v+QAbMPDyM0M1Nj0gnPKi0tH7Rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSfQqCy5iYojQFFColkQgbZqTIoYzKhjS0ZAFEWmN/kEPTq+YS
	sdWRQCn46U6Lzv1G+JYdryZle4uVrzPb0E94BUBAeGUtjv3V+j7g5SiVjUn/genTm3XqEgXS9SR
	tXvNOziEo+qWzdwjmqqtF/Gu+sqNHl/SDAU4JNUeSHPDgWhtUwLtquQWnsOhMR/LdoXPCONL821
	rhPD3kLHGNkFFTaZB/xh/69MsKt8RSemZovcCltT+t4UtVcFB8z2wE
X-Gm-Gg: AYBFou3Hq+/s4YVA3LZ07dPqit+cp6lfZKeHYtnBQ5grG8Ym70kOcGMhZ6fZd/LDDPI
	g2zWbBDvelS3w+gNk7p9qPS6qjNKbknt9ysc0ZIN9GRE6kKvsyAYNDFTb/m0RknCr7sSTrP+lff
	btniAOA0WP/eZQWVc3HC9Qw8PDFDSxfMyBPhbbfLMgaSTgPlxrE47JSvxQVlavZWFbuC5ZKOE54
	LrU/IaQK1o36oqb4Dfx6uVNl706KAC066XMvZax2Ydbhdk/BzhwAlM460TN+8wIC+EZl4WNBEw=
X-Received: by 2002:a05:620a:6847:b0:93e:bcbf:4ad with SMTP id af79cd13be357-94408ca7bf5mr334750285a.33.1793198286117;
        Wed, 28 Oct 2026 07:38:06 -0700 (PDT)
X-Received: by 2002:a05:620a:6847:b0:93e:bcbf:4ad with SMTP id
 af79cd13be357-94408ca7bf5mr334746685a.33.1793198285631; Wed, 28 Oct 2026
 07:38:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com> <20261028132403.3505037-7-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-7-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:37:54 +0100
X-Gm-Features: AclHuK8TGWhwGUOmuxjm5T5HEecDdKCuF6DqZY64SaTBhWSc-y-SxMf8zRUIXkY
Message-ID: <CAFEp6-1v78-5v_VL2WbboUgcV6-unT7P0D38p==y2k84wfoesw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] media: qcom: camss: sm8250: set the camera NoC AXI
 rate from the VFE
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: qQFNh0dk-6sP-qI8Si_Jf9jeP5l2q7hC
X-Proofpoint-ORIG-GUID: qQFNh0dk-6sP-qI8Si_Jf9jeP5l2q7hC
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae208ce cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=bqr9HATVWjL3CuKzvf8A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX/Vp6OOIVZeZ0
 l2fnuv9aBY/XWhtdgyVfKGqMMS5LBKQA/6HLijy5QLc2bOY+lkPmAwIEjSAjR9wWva49d+AsmY6
 FCOPRN/sjlhv2PIY21IrD72sZeMZ4Qit3lupJQ5Ik+b3zNA9a5qfqjpo0V/Y7qTdYDufSYWhbz2
 Awiw76HwAs/nBdHGDIiVcvNukxvZWEwwSP8IdQxFn5M/zzWjBiaLgXxw71vJAu6F1GohgTLqVhH
 nWTzRZmS/hOxjcd7jkP48sG7bjaTgAX5YXLdRovJtvncMRREV9VdOgQJwoXSCI9eCyDkEewp7zP
 likGEsiNHtqHTpwPBH6eYA2DEjWwI4gGzlmoNQxeL4HZyCq8WcTchTsFHDFtuhu6p55L5gcba7K
 8AL4KTLSJbtSsrBww47QmDb3sTaFJ05y1XRTaI6N8ANWUH6tjKkOHCgqw0e/bT14Rw+PfWwtaVl
 E0AEsOznmJbnCHu3icg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXxN4LAUO10xDe
 d1meNEMlFS0wSqP77mNq7hhAki/O7pxxfBWbVZTvhQOIEqG6UiLUM1by74cxYbnpyQ+gdQSCC3Z
 1ZJn2BpHNr8u0VJ1D0HdXB+Sta3OdV8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280058

On Wed, Oct 28, 2026 at 2:24=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The SM8250 VFE resources list both the camera NoC AXI RCG,
> camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
> are never applied, since vfe_match_clock_names() does not match that
> name, and they list 480 MHz, which the RCG does not support. The
> camnoc_axi branch has no rates, so the camera NoC runs from XO and two
> concurrent streams stall.
>
> Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
> its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
> camnoc_axi branch, whose rate the VFE sets through the parent. The four
> VFEs share the camnoc_axi clock, so it runs at the highest rate
> requested by the running VFEs.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

So, as previously discussed, we'll probably need a smarter AXI clock
scaling/aggregation scheme at some point, but for now this looks fine.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++-------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 9e29b713288f..6c3e00e043eb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2120,13 +2120,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE0 */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
>                            "vfe0_axi", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 400000000 },
>                                 { 350000000, 475000000, 576000000, 720000=
000 },
> @@ -2146,13 +2145,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE1 */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
>                            "vfe1_axi", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 400000000 },
>                                 { 350000000, 475000000, 576000000, 720000=
000 },
> @@ -2172,13 +2170,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE2 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
>                            "vfe_lite", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 0 },
>                                 { 400000000, 480000000 },
> @@ -2196,13 +2193,12 @@ static const struct camss_subdev_resources vfe_re=
s_8250[] =3D {
>         /* VFE3 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb"=
,
> +               .clock =3D { "slow_ahb_src", "cpas_ahb",
>                            "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
>                            "vfe_lite", "cam_hf_axi" },
> -               .clock_rate =3D { { 19200000, 300000000, 400000000, 48000=
0000 },
> -                               { 19200000, 80000000 },
> +               .clock_rate =3D { { 19200000, 80000000 },
>                                 { 19200000 },
> -                               { 0 },
> +                               { 300000000, 400000000 },
>                                 { 0 },
>                                 { 0 },
>                                 { 400000000, 480000000 },
> --
> 2.34.1
>
