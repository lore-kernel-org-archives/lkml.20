Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793197200;
	b=L4PXk+svlDgRAxciXiK9lCi8BdXDpgDlNDJ2Ioc00RJBXo6c9ARoibFsVpCV1AOmkRbU
	 NHcHjStwXrImanQWMLnSw7VI+VX/FtdgVHzOfjvgcyPJlr8o1zcvVWMskH0Rs/WOj8+37
	 DsnjmTh5bb4s+Nv/I4A39hFvWjQARpnlmUFbXrtYuIEtMAhuwXRvH3TjA8XNuRuQDYReL
	 VvPuBCLVqhvlt54wX4TDClfL6uWXhMYLZqjf060JB3F5CEXUQSTwTPLijQcNUOnMGeYxX
	 4wig/CoMMeIqGTd7UKigIda07i+CJQcJZQjpxJ4zE+nzlaWFmUVnxVXOry94RF6/a9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
	b=p9wL+P3ZfBrxGN8hfJ5Nuzou/TF5Bo0VjfiTp0wfESNGiAyU1NZGvcravW2L9hqxdAMr
	 hB/Qk6/2Y9w5ykWiQQj7aXmQdJ6SR5Lsh94ZCF89/rLRQz7+f2CUcZruGP84T6u+oDuh3
	 Ce6+BligZ3JIgUcLhjRVYCU7iZBaS0G6gzr85YA4zSTV/sdgDLf3nAypWniGztaZMJ4R4
	 7Vgr3bM1++8sTJSrc0Ig8L3omjUJm/Fw0sElfdICfsmYr7XCDkugiIYxnTmS07gFsGOaJ
	 sfI3E6mJO2lsGj90gYJy4CF6dWXyND/Yf5Lww5UU7+w+jgdEoRByxDAKPcQHF6OoDbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XyW708ld;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGcjTesz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F8B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F8B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XyW708ld;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGcjTesz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdqcn137450
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=; b=XyW708ld3LtIxMLr
	pGg+XwKvx5S0CKMqGYZHMb3V9qIkQWuvgBlglaV3UsiCfBhSlO+BuPX7mlZRWVjW
	c3fek6v6x2cWIyTT04fw3ObhqkSdAEh41dcHvCOjqSbGAsfL4r9cteX7rZtkB4jd
	WmF3lqCQpqX1WrWFbltBzmTS9t9GpB2eWQkcLQaeLvt9EbHA0oiaXhJYmzugyGrj
	RY8FljuUFWljOLVLqBc+EH8cOwKDZpkK4npctZAxuCqb1wQYE1xSmZrDTyC+aZgk
	kP0wLrip1QK93OKTR/45CYRXwxNvlp2U3XTt00mHCb+O7TmmAudCh5g6Vew42sS2
	yRg0fA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92ukd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so95570285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793197198; cv=none;
        d=google.com; s=arc-20260327;
        b=gQoQm5X58uWsBudeYZ2EvO9pn5bkHgaqNXbCs7LSaiuVTpTEp5A1rzcRB9RxB3BOHV
         Yd1LmKlHcIK5zSq50+19/q/vhRhkKYY3BsR6CjwzsaY2JukGIaR1eh/zBFm4OG+5Am1i
         BOMEpA9GEmL/TT1pqjfIGxHAFH56t32XUtzCKD7jLG7dmqWzDRmkQXSQJYZGY8n30uxS
         oN3JfSwj+HuzKZ6T4U9Vmm4XQ33eU2KakLdSerxOm+Dolv1huWM8b+IFq5a2XogW3rOO
         EluYBPol9pZ//iaVbfL7zd06SESH9kLRLr5yy98aALMEJU37v+nQW+Q6t9AeNo3fFMWR
         VCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
        fh=pkuXnIyUcqF2FFM/sDexvwTZcdEXlkSJn5fIlcaGVbg=;
        b=rZsOkQsfmsqlqNqlNV1XlpJ8NbHsGd/oJZMnpwMl9kM2maCVqjTz6ypPNxHZxbNEB3
         hrqYNYLnj+ayGcI8AXCgFcc2O+aBVDMrnCcnk1tDCVUEnoNWnsUfmk+vqNxj02N8A8yJ
         Wg/ovZ0/qZDvsGbURXkb1KytGFA0F6HzIMMkejYPIoiHbXBYDL+d23St15mFxDroauMy
         0apbuek2WdU8AMxddGQfKQNnqKQGMXKHGol9wVPaSGcGnsL7GOnjzITmNjZS7yHnuTWG
         VEbHzDZVah5XiCv9T8ERYd7JkCFgGC9Cne6LlhiqNwYRT4QiJ/mvTNSTpcE2yZIbKl0w
         Sc8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197198; x=1793801998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
        b=RGcjTeszMwuhmSkMektefCJNwOTY2v51QGfxsRPAw0NHifXwLcQBUE8nVzFFPcWiKE
         078ymGmuYOep38t3kM4tz+SEAc3+UAc8ZyIs2F+ymzpY39KFX0iK8tOzebVubmEJRuXj
         0VBuwhnbhGlQZ09Z+KH8cSQn3G5wJ2LqM6Q8wsKvm6hUdJ7pvrz6jD+JUneMzQ5ZUgpa
         hAE/fL4buhgXyt0SxGYnx31iYKZNTXVrwQHiJIZOS8YTO20Q8nzfM13ADAm76p1i/Q7j
         J8O7cDSqSHGW6qy2NJ8Srw3AzgwKjDN7XB0lhkkxS4qX6SHRQv/4evnkyInAhquXVNm5
         +dHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197198; x=1793801998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
        b=iggDXEP/IjklW7U3xwuQxuwfBJ4gB4jmc95pP1QkDSErHT8JdKqz/X3KUBy0Htafkc
         d4tYXZxNpusXCAD8JOL0kpLXPmDbAbNc8mmwXn7/JR/UM6rQQk8Z2DOtBLUwqZ8LSS8A
         MOIwLwwyp+BEFJGKufYLhwiF9bSjVJXXCmNn30iVJg/ClqGpD4D+JI1+/wcf36APIGlE
         vl60fiL8fB/Lzbil7jVTW41ykXypLTI2ggx4VbPm9t5CB5ZW2gy64s9Ul9/KhuBe86j2
         o7JDjx0MazjTD2Mr0dMxlJRDc23E2rw8aav2N2heewZUkghZ7pxiBoVWMJTKNYs2dhTk
         5wAw==
X-Forwarded-Encrypted: i=1; AKwUvBwwxH4iLNCKRwFNB04M9nKHW7WkwAi3gZsvRkcCNm4BI8fLQncsPRtRCoIVEiNfIIXL5aB/KntkSr6wXfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB6+wQGa0/RRnVNgUXOwy5o8fIcnGV6/JhBGfDsemgiWkNtB4w
	rZ20cmLJjHBCtmhuBFHbXZlGN8/CT7ETzxQUDYa/FHb/N6bQrWx1RSxtS8uzuDJOtQCkK4OsS/0
	9wnXPtJJxetdG7WoTV1F8SBFu+yIMpBPTLfOYscgUYnzYrFHQgiytaoWxtDY+KnpBYykxz6G86l
	Genm6PLufAbsrcmObOYEon+LbnzhWMylt23O3XQWXECw==
X-Gm-Gg: AYBFou3efGLIR9IxJdVnCbvpTaG5uPUdranXV1sXqYh3PPiESjIIFreY1ga1oOg0SrY
	GTUgQu02R8R0q/WBOKPtYbzs807CnWjnPxTuPU7DhHkrRA7xu5Vp9INl3PITT3Q90ra/OU8OUu3
	qNVVY5IJlIreMSh5fUVCVFh+seDyaEaL5h/WfOGDdDTh6aQuYG7L4AwY1LPbVk16LsrzRRrQDgN
	vY05S+xLIYBSGmuEzfKuqbAthy+JAwax7kYOTnLifsGtyH851CQphLz7s0kS96n3kB9ld8Ma74=
X-Received: by 2002:a05:620a:458b:b0:93f:237c:1019 with SMTP id af79cd13be357-94408d08e5bmr375731985a.62.1793197197447;
        Wed, 28 Oct 2026 07:19:57 -0700 (PDT)
X-Received: by 2002:a05:620a:458b:b0:93f:237c:1019 with SMTP id
 af79cd13be357-94408d08e5bmr375725285a.62.1793197196764; Wed, 28 Oct 2026
 07:19:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com> <20261028132403.3505037-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:19:45 +0100
X-Gm-Features: AclHuK8kkq0Gqe5D0rM_tGuX-UB3ViZblls9exEieIKoK6z36eZPswD3Pd1PIYk
Message-ID: <CAFEp6-3-B3ub9giiSu5G_jJtDxv=D6+kxWqRao91GgjyumAp=A@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] media: qcom: camss: factor out the VFE minimum
 clock rate
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae2048e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=4dG2s3dy74NheT9wN7EA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX4pvJ2BiAq1sP
 d/8zPMq4RKt3sE3EH63wAG4ri0SLgpPr+cEBBKch6QGzho8pJK+aarvYozGvPqxMNDEcpNTrd0D
 fbrxwF+axP20wbuegy/dfqfP9kKtrCc=
X-Proofpoint-GUID: vaZRnrtfIH91SkgcTpZi_LDkvdlIonhs
X-Proofpoint-ORIG-GUID: vaZRnrtfIH91SkgcTpZi_LDkvdlIonhs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfXyR9hIzt89Cf2
 qEQYVxmPED4DfO1BSZHPHns4vySDLP2+PwZ/hYssmN/ZHf0mW2wNWQaOLcH16pnh6SkYmjWuzjK
 zOMdggYaBhCej7O9WQAYQyFmszSqQ74pZK8YiHT/17FDTUrxdvfREFRI+03Nl98EfNTDYj+WwrH
 J54vXcNOtxX8Hakdr6Go8twl/F7BJyzClnSQN11ILkeJlJMrtENEklzmiHQfcuQLXqbhuYjD1pW
 p5Yj5MLkvDSTwDQgcexVkDiUJLPArttgGMqM9GdLMn8kNdL7+z46VLgjLI37xDgGPOmC2LCI4IC
 Xwg0gKwq2r1PxH3Shxsz8YEgU1wDuC1hUOUTbCfOmsZ8BqD25a74s1KeP5qYt2A3PndtaEJSkPG
 Het6bjv4TlneaYjOjVvcR+yRMFOOmUahwPAYJVDzr9TJzBZkpSd/atNM3YwqaKL7tw0VAUPHTYt
 lYjz6lseSNGYZkpARJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280057

On Wed, Oct 28, 2026 at 2:24=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> vfe_set_clock_rates() and vfe_check_clock_rates() both compute the
> minimum clock rate needed by the VFE lines from their pixel rates,
> inside the loop over the VFE clocks. The result is the same for every
> clock.
>
> Move the computation into vfe_get_min_clock_rate() and call it once
> per VFE, so that the clock loops only select and check rates. No
> functional change.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 108 ++++++++----------
>  1 file changed, 46 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..59be37f83df3 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -935,52 +935,66 @@ static bool vfe_check_clock_levels(struct camss_clo=
ck *clock)
>  }
>
>  /*
> - * vfe_set_clock_rates - Calculate and set clock rates on VFE module
> + * vfe_get_min_clock_rate - Get the minimum VFE clock rate for its lines
>   * @vfe: VFE device
>   *
> - * Return 0 on success or a negative error code otherwise
> + * Return the highest rate needed by the VFE lines for their pixel rates=
,
> + * including the clock margin, or 0 if no pixel rate is available
>   */
> -static int vfe_set_clock_rates(struct vfe_device *vfe)
> +static u64 vfe_get_min_clock_rate(struct vfe_device *vfe)
>  {
> -       struct device *dev =3D vfe->camss->dev;
>         u64 pixel_clock[VFE_LINE_NUM_MAX];
> -       int i, j;
> -       int ret;
> +       u64 min_rate =3D 0;
> +       int i;
>
>         for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
> -               ret =3D camss_get_pixel_clock(&vfe->line[i].subdev.entity=
,
> -                                           &pixel_clock[i]);
> -               if (ret)
> +               if (camss_get_pixel_clock(&vfe->line[i].subdev.entity,
> +                                         &pixel_clock[i]))
>                         pixel_clock[i] =3D 0;
>         }
>
> -       for (i =3D 0; i < vfe->nclocks; i++) {
> -               struct camss_clock *clock =3D &vfe->clock[i];
> +       for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
> +               u32 tmp;
> +               u8 bpp;
>
> -               if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> -                       u64 min_rate =3D 0;
> -                       long rate;
> +               if (i =3D=3D VFE_LINE_PIX) {
> +                       tmp =3D pixel_clock[i];
> +               } else {
> +                       struct vfe_line *l =3D &vfe->line[i];
>
> -                       for (j =3D VFE_LINE_RDI0; j < vfe->res->line_num;=
 j++) {
> -                               u32 tmp;
> -                               u8 bpp;
> +                       bpp =3D camss_format_get_bpp(l->formats,
> +                                                  l->nformats,
> +                                                  l->fmt[MSM_VFE_PAD_SIN=
K].code);
> +                       tmp =3D pixel_clock[i] * bpp / 64;
> +               }
>
> -                               if (j =3D=3D VFE_LINE_PIX) {
> -                                       tmp =3D pixel_clock[j];
> -                               } else {
> -                                       struct vfe_line *l =3D &vfe->line=
[j];
> +               if (min_rate < tmp)
> +                       min_rate =3D tmp;
> +       }
>
> -                                       bpp =3D camss_format_get_bpp(l->f=
ormats,
> -                                                                  l->nfo=
rmats,
> -                                                                  l->fmt=
[MSM_VFE_PAD_SINK].code);
> -                                       tmp =3D pixel_clock[j] * bpp / 64=
;
> -                               }
> +       camss_add_clock_margin(&min_rate);
>
> -                               if (min_rate < tmp)
> -                                       min_rate =3D tmp;
> -                       }
> +       return min_rate;
> +}
>
> -                       camss_add_clock_margin(&min_rate);
> +/*
> + * vfe_set_clock_rates - Calculate and set clock rates on VFE module
> + * @vfe: VFE device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int vfe_set_clock_rates(struct vfe_device *vfe)
> +{
> +       struct device *dev =3D vfe->camss->dev;
> +       u64 min_rate =3D vfe_get_min_clock_rate(vfe);
> +       int i, j;
> +       int ret;
> +
> +       for (i =3D 0; i < vfe->nclocks; i++) {
> +               struct camss_clock *clock =3D &vfe->clock[i];
> +
> +               if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> +                       long rate;
>
>                         for (j =3D 0; j < clock->nfreqs; j++)
>                                 if (min_rate < clock->freq[j])
> @@ -1024,45 +1038,15 @@ static int vfe_set_clock_rates(struct vfe_device =
*vfe)
>   */
>  static int vfe_check_clock_rates(struct vfe_device *vfe)
>  {
> -       u64 pixel_clock[VFE_LINE_NUM_MAX];
> -       int i, j;
> -       int ret;
> -
> -       for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
> -               ret =3D camss_get_pixel_clock(&vfe->line[i].subdev.entity=
,
> -                                           &pixel_clock[i]);
> -               if (ret)
> -                       pixel_clock[i] =3D 0;
> -       }
> +       u64 min_rate =3D vfe_get_min_clock_rate(vfe);
> +       int i;
>
>         for (i =3D 0; i < vfe->nclocks; i++) {
>                 struct camss_clock *clock =3D &vfe->clock[i];
>
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> -                       u64 min_rate =3D 0;
>                         unsigned long rate;
>
> -                       for (j =3D VFE_LINE_RDI0; j < vfe->res->line_num;=
 j++) {
> -                               u32 tmp;
> -                               u8 bpp;
> -
> -                               if (j =3D=3D VFE_LINE_PIX) {
> -                                       tmp =3D pixel_clock[j];
> -                               } else {
> -                                       struct vfe_line *l =3D &vfe->line=
[j];
> -
> -                                       bpp =3D camss_format_get_bpp(l->f=
ormats,
> -                                                                  l->nfo=
rmats,
> -                                                                  l->fmt=
[MSM_VFE_PAD_SINK].code);
> -                                       tmp =3D pixel_clock[j] * bpp / 64=
;
> -                               }
> -
> -                               if (min_rate < tmp)
> -                                       min_rate =3D tmp;
> -                       }
> -
> -                       camss_add_clock_margin(&min_rate);
> -
>                         rate =3D clk_get_rate(clock->clk);
>                         if (rate < min_rate)
>                                 return -EBUSY;
> --
> 2.34.1
>
