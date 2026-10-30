Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793341462;
	b=Fs50aQGa7EKs03QXIyLO82UkKXgl5eVwSg/MS4PCCs2x20uPQQ4KaxBUovq9yIRr/NGI
	 zE/rZrOW3axJFlQ07jrXS4cYU9gIJ4AMldLzf5MeF1D9BVUv2gTS7smRHnubzD3qG1c6B
	 fbYAs1t54bkqTIucHRFtUfNS7eLZwXq7uc8+kH7dY+MIz2A8VVRBvHmqCuTc1ESfp1crb
	 RjjyVOBiXziLn+ExHseaBIABB4u6kRcFUjx8//AFcSIbfTH0vxM9g7mnZLlg9dZE4DQVU
	 ERYiOol2x+YbZ6pO8BMfTaZX86Eyn5lvfcgEtRmOGtEPdP8OFtw0PTf27yoNYm1FvqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
	b=Yy+9rRJT4JYZfoKcwJG9M4LMxryHcT/9sb95TQ5YsGcZf/B4kpHidCMYZV/tyhaB0RsU
	 5QZDVb8AyDI3ZR4901SzzORHtV3VoyDRIrj6nI+9oc+uqNEA806w8hfWGvvUx/9IaiMEs
	 kNdh8Ksdj1H0zffYZZQupLfo8/KPwSVkXMgeLp5ZgRdqS4pH74jrD9b9Qsl20tqoRi3mi
	 8IqOSKHBfFY+Cy7tPsJq4KeWq3ztgO9Z3Dehq7sm5xEwKCiizE4iAhoPsw2q4O0904sz+
	 Tx/pjSZ8opjy4vj7GFsXyvXtxD9RJcvFJEaCuJuyErYrzzUEaovgak5UXyntJVKyjaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LuEHxYBg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAbj+QKG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A519B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A519B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LuEHxYBg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAbj+QKG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FViK2872285
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=; b=LuEHxYBgHQHc1NIO
	uuv5vmt2LgqZyRzjPVO9Q+0/Dt/10NaSUl5x6VpJD+N35waWAPSjPe6Qyt2o2ja5
	n+ZibBlzR4T+xRy+hEJeGWnpAyZTr+VX1uKe5TF5daTHWG+LDZOcCdEOZjQ6dp1k
	GryHYUwiYvDwf7Gs3lf/jWorIonIk0YoFQScQ+7w6p+OewSqPluAfOUE38xKZBlA
	2hhulziHffw6tDC5BJjvruIMBvXjC7Mq7snx+5t2okiLEDtW5e+pPC2EwIPKJoB/
	MTqSkXW7dzzopkA4J1KBM+2WCnH7D+kLH6BpGaRbJ7GOK16Cm0Np2h/tvXJdEyfl
	oIMubQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhjaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:24:20 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0a8c1b87dso6299267b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793341460; cv=none;
        d=google.com; s=arc-20260327;
        b=MEFmbJtTGjNTzrsa1VH77+kWgkQTRscb03YDMus5Og2cQ06q5JDEDpyjHqBneh3Dim
         MIydmdvDIAUQ3SW3kOfopWiQjky66VnQXEwS0zfEAddoG3jqOce8gL5GXxoNd6to3p27
         wBxdGZ3FTVr7XirzchMHQ5AUoLoP3zSxkNc2KLPJ0EAl/mIdVuxML43S3AsGxMDjsjtJ
         wR9q5tmBiIj2yKobzHJDgqn0F+LPoxnXf5jGZjHH1cujn8m6SHoyDxZG9/X+Klp6k427
         CRhoJ0K40LiVlDFL8XT+ZQyWjFFyRNqlGbZuDlyFW8aLbY7ycCZovBAgOihzlypJg/6v
         O3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
        fh=hzMSxkJElq7G6BdNU+kFmYgHUMRoK04ziKn/NnaC/k4=;
        b=g1SK72e+LkwpjgmyALIDcpchiooF4cFrV/0vm1tsxGGxO3Pe7UID3ZQbaqr7sY+Pbx
         5WJ2OX9DFzJzLlUGAhkvzJTLuXJ+jzEwfoQ8N+1DIzzA5YxDOjmxasTl//LVXKj8tNJG
         AxKNApW5L2pIaxIV6yNJpOpKNMNUvq0ZG55HTnK5SIm8iESHHgdcK42WlGnCMtQO0ue3
         7DUnxpHz+uBlHIXKSSutkeuwTDAuuD3dQ0ixZlt4D7tf+tKMIKBvzwAoj/ysvkwQVLPP
         RSfeLsf1kI1m2EYpO6K77vMcrOEHb3CELrkcP3NJANYb5hC3uT0pBX0mlGJQ2rofFGhK
         jaAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341460; x=1793946260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
        b=ZAbj+QKG7qF73GtYJQbKX6MGckqODOF5BfpqXC3yCY39XkHjx3MYULx2WtflowgwvW
         WpxczLViriSg/iWx91D0PQeftcVSWXuCdA7LVu6GLQjNJjNK41kXNzaIYFzPRquKAzam
         zwvo0+d9uyE+Tz/Xegwxju7ZtvuzShIqx9top3TPJS1Grs0/AzPWZSK38Ivt1vN8PjOa
         ai9/s9X6JDnihcfxftLGadjmwoOCaX2B8BBiIbIwdx4C0z/ih7g/NnyvK/L8k8HHtQAB
         QmZXvEnnU25jmji9LlFGbhM79v00E13bKcEwoEIMkOxXH+ySrkWCidhd75Ys3noBdP9s
         9AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341460; x=1793946260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvMsvABA/QJsOVYnU6uGadoDXkpngAU/Pz8Lc79FAgI=;
        b=OZQYlF+FA/XXYDJ9eHbfdkYJ897fRdWsbDs7Cqk8d5Ho91NCX+DUHlHWKjpaV27E7C
         Vu362ZwkhMEeiH5wny4J8RrgTzKHR6tnQeLSSRgsoaylaWjK+iakbkQujGsdu/LXhv/0
         Gzks1AOBRBQi6AOUnGz6MX4rCx4PZXN1zO5MnaxbnZ3MDUF5mDdj86Bhk7sZfgGPMBAl
         gr7IQccDD6wKd2NVsFFu2dje+Krf+36EWPmwPRWo7hYpKnYmSMgMy3glQd8ziVFp4maR
         Nh5Tur6mX/LOTGp/I7ycNtKKUr32nJlXdTaTDmktoHRkT+or1BADDt/PAe1zo8PePZcD
         ARDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzKOjefvgnxPwyCDPNi0FARBieL3EzhPA/m2Oem9sRntpNEMTRrcvvUag0kYvB9p5fRA6JzuEObbYCUYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZzy46lbKh6/Btdw46iCz7c3xnM7QYq/y21uj5OOMWBUAajvY1
	xfg2hayFu9y9OixAmz5U32c9of51ywidTw5ghSB8AKvhYzKcIZspPJgajOKJNFuJOzxT8G8Epqo
	0OlHMzYEc4oooCcqeaClu/JT6JRpMOaWINsGRLoKcX3gNg5rrA6EDLxrByww1NpB3WoR8piapup
	1yrJRIMRn9LbJKcHwTQZLh0Uq6Jjoh6V+ORKBbA9QR6Q==
X-Gm-Gg: AYBFou1d9ziUfIxvvm5TfpN9bdKBP82WsyGY2znQXPmch2vNETAKEtGG+jwjUYZem3y
	FSedyMhkRGY1APRh6XU3czR41INSJKNASKqzz3576hlJETikL4CCxyj5wiWTTk9tAfX2c7d/ALO
	zZvHfST0Ucgq1dZh1XDaz4SNB/MeaItOe8/OSZ8OItrwzWEkVSUmTGvrk+jg==
X-Received: by 2002:a05:690e:4550:10b0:679:b0d3:9f20 with SMTP id 956f58d0204a3-67ba4fb3d99mr747478d50.34.1793341459849;
        Thu, 29 Oct 2026 23:24:19 -0700 (PDT)
X-Received: by 2002:a05:690e:4550:10b0:679:b0d3:9f20 with SMTP id
 956f58d0204a3-67ba4fb3d99mr747471d50.34.1793341459389; Thu, 29 Oct 2026
 23:24:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:54:08 +0530
X-Gm-Features: AclHuK-1O9kBYPNB-LqEIyi8GfpH3kBHDVYJZq_uPVEaaNQf57NjdphrRbcepus
Message-ID: <CAGptzHMSY-fZh+0eOqvU9kX3hyUh5HOH91O9RX40=az5YLWqyQ@mail.gmail.com>
Subject: Re: [PATCH v8] firmware: qcom: pas: Make MDT buffer retention explicit
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXz4xAVVa8cm4M
 IsCiO/teWtqBMlHGfyvRWX19EimtafyPhCgdRCl7sACtF1OwFWkqNrYaMvH2wFnsUuS7pnqCr5f
 Lo1AJ1ppCQo4NbU2lwGhRVMlPHdY14lHUAyp2BGt2HYs3DPx9U8vPqBeV5ZEfWIgKzMmuWVhgpy
 FmPxlvQn6uxHwDTlCtZ8RyH00aNgvFu+uK5ovga8do7ryD3RjvFD3Y2eeYaEq30Zyg3WvxnVAVZ
 IXeG2myxXL20FRydEhsrSzfO1oY+u/3AqU0SMrz10ic4kTh7HcyCEacKyyGkdYq/LpmweGvxphv
 b07wvdiwf/7kVktpqM0QuwrXdnWRWuOTH+nt7NUrnEQiPybSZ0dLPs8wt5ChNMzhtmtdzNoV7Sd
 xQTSJjeKJT4fnKDdz5S93XibMGzq1gHvK+YnpDWdUDmhAxYUrRw6oDv8scUh9CAZuS5V1SQA0Xa
 ia57z/O5geXaZT1IcVA==
X-Proofpoint-ORIG-GUID: K-lo4BhfVgerUoG-DN2BaigO1EGiHQ_N
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae43814 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vt5zk3HvMIXgJkxpxWcA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX76LieSCBb36p
 BI04w4HXRATfFLWwnxMKYOtEdSMRKAp3vNDDG7e5ZhJp0QvraEbQGQ2aNlWNBByVV34i08ihOvr
 5pgpADRxeIOO/99mqv6ehF6NkdTTFe0=
X-Proofpoint-GUID: K-lo4BhfVgerUoG-DN2BaigO1EGiHQ_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

On Fri, Sep 25, 2026 at 10:22=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> The PAS image initialization path retains metadata whenever a valid
> qcom_pas_context is supplied, although callers may not need the metadata
> after initialization. This leaves ownership implicit and causes unused
> metadata buffers to remain allocated.
>
> Add keep_mdt_buf to struct qcom_pas_context and have the generic PAS
> wrapper release metadata unless the caller requests retention. This appli=
es
> uniformly to SCM and OP-TEE backends, while qcom_q6v5_pas keeps metadata
> for subsequent PAS operations.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v8:
>  - Commit rephrased a bit.
>  - Make the commit aware of all present backends(scm and tee).
>  - Link to v7: https://lore.kernel.org/lkml/20260920074919.3338358-1-muke=
sh.ojha@oss.qualcomm.com/
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> Changes in v7:
> - Since qcom_scm_pas_context is removed, v6 needs to be rebased removing
>   the changes related to it.
> - Link to v6: https://lore.kernel.org/lkml/20260805133759.2790755-1-mukes=
h.ojha@oss.qualcomm.com/
>
> Changes in v6:
>    - Other patches from the series is merged.
>    - Removed dependency on below series by adding keep_mdt_buf
>      into qcom_scm_pas_context structure as well.
>      https://lore.kernel.org/lkml/20260702115835.167602-1-sumit.garg@kern=
el.org/
>    - Addressed minor comment on the documentationi.
>     - Link to v5: 6/6 of https://lore.kernel.org/lkml/20260724182858.1868=
271-7-mukesh.ojha@oss.qualcomm.com/
>
>
>
>  drivers/firmware/qcom/qcom_pas.c       | 12 +++++++++---
>  drivers/firmware/qcom/qcom_scm.c       |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
>  include/linux/firmware/qcom/qcom_pas.h |  1 +
>  4 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qco=
m_pas.c
> index 24485dd0fa10..93d78a5c1201 100644
> --- a/drivers/firmware/qcom/qcom_pas.c
> +++ b/drivers/firmware/qcom/qcom_pas.c
> @@ -60,17 +60,23 @@ EXPORT_SYMBOL_GPL(devm_qcom_pas_context_alloc);
>   *
>   * Return: 0 on success.
>   *
> - * Upon successful return, the PAS metadata context (@ctx) will be used =
to
> - * track the metadata allocation, this needs to be released by invoking
> + * If @ctx requests metadata retention, the PAS metadata context will tr=
ack
> + * the allocation, which needs to be released by invoking
>   * qcom_pas_metadata_release() by the caller.
>   */
>  int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>                         struct qcom_pas_context *ctx)
>  {
> +       int ret;
> +
>         if (!ops_ptr)
>                 return -ENODEV;
>
> -       return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, =
ctx);
> +       ret =3D ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size,=
 ctx);
> +       if (!ret && ctx && !ctx->keep_mdt_buf)
> +               qcom_pas_metadata_release(ctx);
> +
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(qcom_pas_init_image);
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index df20773dd754..dc57c87870cf 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -666,7 +666,7 @@ static int qcom_scm_pas_init_image(struct device *dev=
, u32 pas_id,
>         ret =3D __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
>         if (ret < 0 || !ctx) {
>                 dma_free_coherent(dev, size, mdata_buf, mdata_phys);
> -       } else if (ctx) {
> +       } else {
>                 ctx->ptr =3D mdata_buf;
>                 ctx->phys =3D mdata_phys;
>                 ctx->size =3D size;
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 879c465c4a7a..ae93f693358c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -733,6 +733,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_p=
as *pas)
>         if (IS_ERR(pas->pas_ctx))
>                 return PTR_ERR(pas->pas_ctx);
>
> +       pas->pas_ctx->keep_mdt_buf =3D true;
>         if (!pas->dtb_pas_id)
>                 return 0;
>
> @@ -751,6 +752,8 @@ static int qcom_pas_alloc_memory_region(struct qcom_p=
as *pas)
>         if (IS_ERR(pas->dtb_pas_ctx))
>                 return PTR_ERR(pas->dtb_pas_ctx);
>
> +       pas->dtb_pas_ctx->keep_mdt_buf =3D true;
> +
>         return 0;
>  }
>
> diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmw=
are/qcom/qcom_pas.h
> index fb2ec3be6a16..1d132e89536e 100644
> --- a/include/linux/firmware/qcom/qcom_pas.h
> +++ b/include/linux/firmware/qcom/qcom_pas.h
> @@ -22,6 +22,7 @@ struct qcom_pas_context {
>         dma_addr_t phys;
>         ssize_t size;
>         bool use_tzmem;
> +       bool keep_mdt_buf;
>  };
>
>  static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ct=
x)
> --
> 2.55.0
>
