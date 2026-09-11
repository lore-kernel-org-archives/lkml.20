Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36703331ED3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138166; cv=pass; b=Oa5IsjzX5P1NmBDAUgWSAu1XkbaCXrNstIVY7JUsOuBf3w39JW/lp5Xh0WJnKZP/UauwXtgwkpCT3ndD9ELv8UVkgKho8g8QogEMMsEEkRh1RESrcwkwQ44bukQPmhjgjc3LVInzdWeQl/Zy7GnrpL8WQKfFXoIrqcnpHsXMaj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138166; c=relaxed/simple;
	bh=m872b0c2+jN1AVrAPPxqpCoSml3+3YNDaRJrpIv899s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G820RUnXw3oVyPp3jyOD5ZBSyJO5jjSa9N4LBIRi0gNsmdMg7mh5gtemP55b/uVaXTQXN7Z23rPSdSxtOuEDKWNg5p+F3mvem6uWfSfBm0OSrXmLNNZJyRY8S6Qfd9nHvsv1KZu/mPki4YM3KaDP1SYXwuH0XM+9Pd/CJTtTXys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KffUmjay; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mz0bmPDK; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KffUmjay";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mz0bmPDK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmJdQ606455
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wI59Ig6wXv5MiB372ZI6ZUIZhW9q90Tp2bwYroJio+Y=; b=KffUmjayb/CgWQc8
	yw2xlLfuDeDIBenlL1tENnzsxjWsdxpZQzPMA2pYpHohHwmft6KNt6k8Na5L3eiL
	YJPxWuprhKITWGs+rEm0Sii4SLJiw2ncFIRoDzqpkG2OlsOAKT+3BSwLdpceREEo
	6ZFC2lxJFyVHKG+8txgT3COXqvaHi73oDs8xMo4cUgL1cIqNqgqD/znSJ1GbNsx8
	n1FtxGfhqm8EseKLvhrSjYmdTGwYIP3iJMMDP8p8w1D8iVMr/WunmD60k69sy2Zy
	+mr0sF2kBGJiV8q5G1Pdl1d13TJh5cuJMo2hBUfOivZ9WfjffMvIzqYafL/QDa9R
	OGeHKw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q43g6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:49:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39906175917so1306875a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789138163; cv=none;
        d=google.com; s=arc-20260327;
        b=JeW6Ofrimz9+W+xnAXZNfYzXzXfEJrxNU51RVLF1sY9OJtsHWQJToyS5r6zKdyjXf5
         BvsPbRnVTu8Wy4qpkW35MbpN/iI+d1DrEIbE5AEPosFWX+RR8sz9ASdpKG4jAgavOX2K
         qq5nnWVzFHW6mA+E8+3i08jvcEpagkfrwdWqd4jAAb35G17bJHiPuJy6cdPVjqwT/ied
         ccc6vc0Na6K6NfIdXQW9Qx5kBpSYsa/pugMQWqpKD8WXC/tmSv+S8IDEZcRuIuoThga0
         8auBmqdrj9cEF60oKKr/3wEIYzJzqVpBfT/OezE6PRcxnHRjdxLraUVkjDOhaYF4C3J/
         7ong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wI59Ig6wXv5MiB372ZI6ZUIZhW9q90Tp2bwYroJio+Y=;
        fh=1UK2b5zUMBQs1XbYRQRdRtQWpMdBQYzPwtjdKOLDHr8=;
        b=K9XbyzjTHcm2kQ+flsxJzu8fkenFZkyjWkJqRjkB6FzfcjHWai3WyfiLvrjgkcNI70
         hO1D41EWh/SpBlx8XXj2nRPiugW+DuUkX4Qdgto4qocNKLvVHNuPqRxnj1c3SXTTSZP6
         HCYF3uAKoacl9XSLxTwz7XVl333vzLgFHhPq0svV1JDumV86gLuNStXNi2qArttc0QVk
         2qi4lea8tWCOMpmsvAJUr3O5l8nCDM9c0EbRzFnKoV9sfDFw+vCXoeTgce/A4ehojtg0
         Zf/GGcMtqTtjTYFlzuNvnwmQk+cEz0/OqKMd8thmjucSyvTzhSfdabHaldYAl1RvG9mb
         ZqBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789138163; x=1789742963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wI59Ig6wXv5MiB372ZI6ZUIZhW9q90Tp2bwYroJio+Y=;
        b=Mz0bmPDKNIIb/5up7HkwiIzNBg0xVhScdTbWoeo9fBniTuKFJFj5JpK8mSpp2gEEPx
         2yNccdBIGCVFyiX3H+Yp6loVlVI0P6oNuKQSLBf1pHDUxQqNfBuppjhx/IXFQ6TnEtHm
         ++QUpWrIc0rsApn+T6XWkk90Vj63OZvxQi1X19D9bMCtmILl2dJJcp5lSQYmTnWH0X+L
         LwXMCyMkiFaIc2iLTA2Ns17rG/8d8wHIpOGXgLSxC4fovPCsiwBKCA/u7K2uOrxBtIL4
         ygauNdN1o3NV7WvwRM1c5BuEL6tzBwj4kxV7BZrs0XXOUgio8Q27r5RfE9W1/VJdI6pr
         60cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138163; x=1789742963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wI59Ig6wXv5MiB372ZI6ZUIZhW9q90Tp2bwYroJio+Y=;
        b=WDPkJMNg6mfwJznAS9eOm9Oe1b78PSrJLSpZdvIslXLh1c0dvZh3q+ecdat3Ri4wwf
         i5J8z3BO4QknzuEFJschvhjsm2vEOmBwYe/9ALXtaWyWLt/SxvHHcjqn3FzAgqTSwdZm
         M45mVb7fWh5rtNlLZvfHTorFmgfGbakynOzO/5D4TEjUvTxyjJ5BK9caRloLFJfQ/fDV
         EEaVtVkX665Z8i7WcsEwGYeW8bud15Zc+yzY2X9t6LWIwD+6zqCb00sA/EMZQy5c/arJ
         yTljAkAX1eZ8SICQHuRMgarSOcRLPV3pk6GFRbuhQ3uQh9MxUmRkb0vgsITNfkg+MOH2
         2+Dg==
X-Forwarded-Encrypted: i=1; AKwUvBzmuGOsYHK5MINc7LOlpGS8JkzsmZpdamMq/3a1LY2S8jN8meD+L93vWSR4LVViN7zhXb5qf+64Gag+9sw=@vger.kernel.org
X-Gm-Message-State: AFuF++k++yYmGuFkt1eRMOqhcj20ElS2QecZKoOaoz472y22nqu/mkVG
	Tk07ssCNoceVTT/mod03aLnXdkb602KWGDXJArr9WE5w86foL46m6XQfX0hIti0qQtUjey2L8dz
	ZovqGQgTryg4skSNUr8C6v53NJ6Vi52QOFsegcU14e8jxU0oQGyHdUlNr9JyYKpvfp+7rHbE7fH
	pmlv0oBfYULENb/Mpo0YQ0RM7TpsREhvYM1V4LjJRHcQ==
X-Gm-Gg: AYBFou0LpgGkFeWjQxKhjMgledOALXu4IZir+b7claa/6pnBqa4E3+JoSiyi5wO6p3O
	Ek+zCAeY2nHdmuH24AEcD/ys5V58zZY3GAcEU0fKzT7NV0wRsZrCxswu/myxAZPnsxxVdiP7JLj
	tKHXhKhLgD/f3Z2eD/fz5c8vTxc2MsaEF704t0l2SC1f/qH3DST9LpNruKWA==
X-Received: by 2002:a17:90b:570b:b0:398:9be9:ab92 with SMTP id 98e67ed59e1d1-39d9c3521ecmr7776822a91.23.1789138162578;
        Fri, 11 Sep 2026 07:49:22 -0700 (PDT)
X-Received: by 2002:a17:90b:570b:b0:398:9be9:ab92 with SMTP id
 98e67ed59e1d1-39d9c3521ecmr7776761a91.23.1789138162081; Fri, 11 Sep 2026
 07:49:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901044054.346524-1-hrushirajg23@gmail.com>
In-Reply-To: <20260901044054.346524-1-hrushirajg23@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 16:49:09 +0200
X-Gm-Features: AcwNN1VmOyw7Dk484tfmp9gq84sBGFP7-EPIrqoVc-KnAJ_XfthdFn7XfcHICBE
Message-ID: <CAPx+jO95bxEi-V463L7sZS-uxVaET2FPd3Q4AXNty=VhGxewzA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdio_cis: use strscpy() instead of strcpy() in cistpl_vers_1()
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: ulfh@kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: WuaWBiPbja66w0bRJhDWAUcL_kLb3W6w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwNiBTYWx0ZWRfXx2PNKhqiWMZo
 Sr/zTzR8bKWAPeyl1ki84ShnHLUiE1mbqCfZyczVqT98K04NH4+a+yj+Y4sTQpd7htK4ZxM4fCs
 xXcuDNC6/OclLIMQ9VVW3VYSxQKPmlI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwNiBTYWx0ZWRfX7DRabxF+QGDu
 x6mcOVFY8ceXD+t95PifcxIAdEvPUGBOqmJiFzYaO87Ncrf1FrgSBnt9Fe3iByg/LxQjbrqNaIH
 uxbC1gENK9zybahr7MWz2blRkGnZGoM4GHwTH7bfbAffXanuPV5k0p46KR2MniOSAWnccxTIk5f
 597YaeGZ/m26yWXynqpW9wc8RqGnQzV/sfQW7AwmU0jyWf7U+BjOU7uCNRUzyCc5VtvUZlVa4n9
 jUXUT0zlqwcgoV5s4HBq5LkT/TAeEKZD4jIORNwEg5ONM6BFjzgGJh/BCLWdT/Tp4Ao2GlNDpA9
 nnkHO0yb72ly8dThlA1JdXbx1tWjQ2203k2JTWjEcwqWw9fqC6ZtVlVbVkESSrYKufxQ28iuZuC
 43p1i0982FecwbrCeYzmX9YV2Eijzl9H60oJSTzFp5zfDnYOOjuPrEwPH6B7mJ8s1NlnmSc1raq
 jSp+3UZ0ZTO+93s8CyA==
X-Proofpoint-ORIG-GUID: WuaWBiPbja66w0bRJhDWAUcL_kLb3W6w
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa414f3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=JhKy0a8qOCa0yG0nV0kA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110206

On Tue, Sep 1, 2026 at 6:41=E2=80=AFAM Hrushiraj Gandhi <hrushirajg23@gmail=
.com> wrote:
>
> cistpl_vers_1() copies each NUL-terminated string out of the raw CIS
> TPLLV1_INFO data into a single kzalloc()'d blob shared by all of the
> strings, using strcpy() with no bound. The strings are already known
> to be well-formed within `size` bytes by the counting loop above, so
> this isn't currently exploitable, but strcpy()'s lack of any bound is
> still worth removing on general principle.
>
> Track the end of the allocated string storage and use strscpy() with
> the remaining space as an explicit, always-safe bound instead.
>
> No functional change.
>
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>

This doesn't apply on my next branch, please rebase and submit a new versio=
n.

Kind regards
Uffe

> ---
>  drivers/mmc/core/sdio_cis.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/core/sdio_cis.c b/drivers/mmc/core/sdio_cis.c
> index afaa6cab1adc..24f670a798e2 100644
> --- a/drivers/mmc/core/sdio_cis.c
> +++ b/drivers/mmc/core/sdio_cis.c
> @@ -27,7 +27,7 @@ static int cistpl_vers_1(struct mmc_card *card, struct =
sdio_func *func,
>  {
>         u8 major_rev, minor_rev;
>         unsigned i, nr_strings;
> -       char **buffer, *string;
> +       char **buffer, *string, *string_end;
>
>         if (size < 2)
>                 return 0;
> @@ -57,10 +57,11 @@ static int cistpl_vers_1(struct mmc_card *card, struc=
t sdio_func *func,
>                 return -ENOMEM;
>
>         string =3D (char*)(buffer + nr_strings);
> +       string_end =3D string + size;
>
>         for (i =3D 0; i < nr_strings; i++) {
>                 buffer[i] =3D string;
> -               strcpy(string, buf);
> +               strscpy(string, buf, string_end - string);
>                 string +=3D strlen(string) + 1;
>                 buf +=3D strlen(buf) + 1;
>         }
