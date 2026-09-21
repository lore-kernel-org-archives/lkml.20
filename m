Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C64825AF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001197; cv=pass; b=ZIoFgrdThRP91RcvIr6alBfKDcZfYdpUoLTcGVDE4fSMDK23KD0rKVuej2anNHXH1BFESfAPL1dp6+sf56vvCEHwUytf6ebng4e3e/v/GdM7y1q0BrqO+P6j7ePp6EHj9NIZ1jXOknAGTQunwLyk27/5ls7viGDOWmzt0A9SUGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001197; c=relaxed/simple;
	bh=V3VrbB6jf588eglCgxMX73QpjqOXaCmky/I8c9HrzKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PoWP6sBZUXApdnhfoyGsDieXD8+/QTwi997pybiYWCcpE4iKMDdQLuKDW/3kZKQR9TmwFxnRooWs6mhmK81Hh84BnTbBwc6BUGNZ5QxGYkqGKskHybdlJO9y1FZAuCv77a9VUg9C3TDoE9vnp2firUT1tEckTClnXVe7Ta6NlnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+QKy3Uh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFCiwNg7; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+QKy3Uh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFCiwNg7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGYA4894539
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=; b=H+QKy3UhNAihHc5Y
	1pf07KnUI2Kp20ZvSqQ4OhyXB06gEN9hy1AUzLFUli1/snEjvDvCcJKL6PLz44AT
	IjqSdg32U77FHY3S+FGW8l29866cCIdfYINWiJWPq3G2sAC0fnyMUCvb1OjTjxpz
	ebiEIT7vtkUgfyJH0cacmxXDsK39H7QZgOfjfziBN2b1eZRrNucJjTXR+LNzsv42
	p5geUTyOnTTXZkT+P0j2NWSn5SJmkEPcGKm2AXzVkLrO0xPxTUKiRQqoowi3AAmh
	UAocMShAMwK/m+X6M4/rxko1Gu1WCdreYQkJQUxhcME9cIuXIWA79NFxAoq1YXcc
	9q3yrQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq9ruv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd188e16a2so34339495ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001195; cv=none;
        d=google.com; s=arc-20260327;
        b=UAXjN78AZSQMjfNBi945YzSEOOX6IsPC5iwFnRlJZeaV8KP3K0M28FnrI0v27+TWU4
         5NQ02pe3N13tH4sRKdEoCL9Tq/Mzet3YwJ6L1r4wLHdS1XL1i8FCeQc9HcvjzBMENE/f
         ZzgEkmzrQXKk9i4j7UhxjuhUEyiKCDV3zp8QLYeYnI/iYdE8ZSqkwXa57DEC4GkVH9PU
         YXgpa1o9+L9CdkiUR5lwZYqYkpYdQ88WbH5Lc3iX/I27UL4IbNKeWf5vssXdd9OHK6bB
         z1JhIlPRUMA8QNuDtQIsQ3mNbctcEVtyppaJokgWj4M1RAq3zMNrDcEXMKx+d4Vbfozh
         ze8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=;
        fh=KmrohrDAHqOdfpBsMrP4hr5YvxcRsApVqLc5RIzVrKs=;
        b=MHsTQd1C0HBSsIg9rwKoYa1tEsmayrWaxt9cKKdGmwWKN/0Ldg93ghqMOuUKwYE8P1
         RFMH+wevO2gfVZVw8P3Z51lLkboLgRd5gLMd9LRB/OVyMY9fwBujIV4B2rmxeWZIb1RJ
         DiOUoHhydMOFAkqGH+dja+mW41NEp2EIXVO5IezTXznLUSp9Jcknw5GyjImu9G4CYegJ
         jATlwqVVvAjLem/15xIE6YRp5iy3nKqhYrwBdXyAdSLgg1n1QfODfOMGmNLQjFYBNTjZ
         IM/ZnkJA0Mb6tCbBSu5J5sBtTc+iq8s1hUFdgCrf3TSArsMv/lsamD2Mz26B48yIT2U3
         FQJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790001195; x=1790605995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=;
        b=iFCiwNg7VdaKtxGqkEtlXMA0eRwIbWPNe/IxIF/nzbOfNx3MqF8BnjpgDjQBJ0SgSK
         Li3UsHTkxhVuN3zQ2a7T8oi7ij6VRiyZB5RNa/rrrPVSHkpKhXkjwMISAU7uvVPikfxf
         uh3sELSEsPrMhebXH00A5o2LcpdSflnxwiFjcQO068zEXrkmSLnjJsoItAhJ5nM7OFXl
         lejIjKYXGgST2qq6w0F53PUc4sfLu2RxGrzwknowZTkyutGhnnOljDB/cNGliN3J8gQV
         EWnBQKZy1eO7SpIuq8V1NPl7Jkl3QpfD3FuAfCPv8yn+WphOkmnAbS4zqTZahfNfXXLd
         pwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001195; x=1790605995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=;
        b=AHYYVB+1QXInl+U6KbeTb2Zt9Lw0lYMPZ7Bd4bQHSbD8LtWepqoO6tADcj8XUQYOkZ
         7kfYMLf0QG8ma8BUiUCRy1icGQZQtWyHGLT4Eh2TzenJVZN8pzwIwu1toB523h5Ie2a0
         vfBrnBYcDLWSB1/tJfX/cSLldwruUkMIIbdP1gQHRp9P7eXDw50VL4orS3GdAsbDQu0S
         j4bOg95niGGiJJ+DOeYLUgTdy3POFDVCRUyTk96ZVmAm9E6V3d7ukWvDkaDLDTcvIhRp
         25CvExgIjwQ0YTvULHSOSk0hoW8uiNt6Opk9POe65vSl1fqzY1EWNFJIswoIQJwl88nz
         8bsQ==
X-Forwarded-Encrypted: i=1; AKwUvByw33oA96QYmECWtg+RD+n2L5fFF1BkNoXqQmvwMPDQLEtbIVPs8Og/cZBgEOU1LWp7yiFnqV5wTUGpjmw=@vger.kernel.org
X-Gm-Message-State: AFuF++kZlsVUve1FEhGn3MyLEwC9cycokKEEItZtj2IpQbxmqTvLDovV
	4RwYFP/6tDoQCxKsvK87fCur7hmCqDyz0JkG2fqO2rPasxknF6UjFW2kxgTYZDRt9r6pMS9pp8K
	OkTvdwMEo8RE5QZEclsfN91ISfWexFZiKdYxNbqoK08MFTmSPlFrWi2FKH9+NRKjiwYVEZeB2cr
	+pJ0O2Zb7Jp3U3dsiIe/VdVlNPaN0Q8m3FmnXIyD1uCA==
X-Gm-Gg: AYBFou1A2omUGMMlBGozdekvXitsvysJXLu8MVU8PO3r/R9XLXdqnRR4T19lPW48+F+
	hqmho0zegm5xj0yWlNKxYGxJy7zGxoSVIyzFU6vbz8tEDCchEvk+JbFv1TxPBn9QXC+3J/uUhyi
	vrxIBLuZiaEpjWaFqdAIAXsvqoOi8mJbs3v9Prhgadru9Y0X0WU62f/xXynA==
X-Received: by 2002:a17:902:db0f:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2ddb1ad911bmr168889515ad.11.1790001194746;
        Mon, 21 Sep 2026 07:33:14 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b0:2d9:6db:9fcb with SMTP id
 d9443c01a7336-2ddb1ad911bmr168889115ad.11.1790001194225; Mon, 21 Sep 2026
 07:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906033806.84671-1-hppiscas@163.com>
In-Reply-To: <20260906033806.84671-1-hppiscas@163.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:33:02 +0200
X-Gm-Features: AcwNN1URykOcgSM5mzAR_6Hv1HbdZSOKSvNjzwgzfex8XAPfx0E_X-1XkjOVQ2o
Message-ID: <CAPx+jO_-ZD2We5Ap95YZG9rinGj40YXxCbf=fZ-g4MKexbYK8w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: Propagate SCU provider registration failures
To: Pengpeng Hou <hppiscas@163.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        "A.s. Dong" <aisheng.dong@nxp.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: nq16g_dLihJKZ3mhZw4bDE8mW5Is0p6P
X-Proofpoint-ORIG-GUID: nq16g_dLihJKZ3mhZw4bDE8mW5Is0p6P
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab1402b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Byx-y9mGAAAA:8 a=YTAltBPf13rpVPKIVk8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfXzjdeaaY2WgX4
 RNWbAGhMm0FT+d1kM6QMr6WMEduuzGBrf2mjiZd8kmBkOzxhr1bVzETIc1qa23JtZWdyUNMI0g6
 kPDsZrhA/sqolPmEKzusxOuJ5HN6sAXoFHWLE9sa+6odc44rBIlzoENA7rgPmaAnkVJXXAnCF7h
 e2l/NrGUNXKF+GgevRyhbSl4LYjmYLl0DHWyAdPQ4F1HVyB8/ZRFGsbbn33r47sYa7ljcWwqgY5
 l6O+doEFE4u+sMrhfngfdSwbncuPxRdccAhSyVcKR+AaXx02hi32dtkHBcdG3S3gtoeAcHiE+ZD
 arFzX35tm9fu6AUHcJJVLFwpEnNKJonZNoeeuFb22rKMXRQ94xskPdFeevmXFcdV5ALfLKxsd2c
 j4rgMPTEYXIZWYmSSQ421IWCN8fkDT0VXenaToAdQuxJTSx/f0hX83V00tcvT+fS4OR83WG9B3v
 2yPSB/RykBxuadvldOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX/wli6SsI6dFx
 IgfngsXDR3qCwX5qs5dXlOTd4y2OeO6tjXALqc/2augKgeSlRWiJMeYYCLuL0BdKgcK4mwhGhB4
 5vBPUbQfvLuZaipm8nrOVA3MyMK+eao=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210211

On Sun, Sep 6, 2026 at 5:38=E2=80=AFAM Pengpeng Hou <hppiscas@163.com> wrot=
e:
>
> imx_scu_init_pm_domains() ignores of_genpd_add_provider_onecell() and
> returns success even when none of the initialized domains are published t=
o
> DT consumers.
>
> Return the provider error and remove the initialized domains in reverse
> order before devm releases their backing storage on probe failure.
>
> The issue was found by our static-analysis tool and manually reviewed.
>
> Fixes: c800cd7824bd ("firmware: imx: add SCU power domain driver")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/scu-pd.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.=
c
> index e3f9e741daf7..05d4364f34be 100644
> --- a/drivers/pmdomain/imx/scu-pd.c
> +++ b/drivers/pmdomain/imx/scu-pd.c
> @@ -474,7 +474,7 @@ static int imx_scu_init_pm_domains(struct device *dev=
,
>         struct genpd_onecell_data *pd_data;
>         struct imx_sc_pm_domain *sc_pd;
>         u32 count =3D 0;
> -       int i, j;
> +       int i, j, ret;
>
>         for (i =3D 0; i < pd_soc->num_ranges; i++)
>                 count +=3D pd_ranges[i].num;
> @@ -503,7 +503,13 @@ static int imx_scu_init_pm_domains(struct device *de=
v,
>         pd_data->num_domains =3D count;
>         pd_data->xlate =3D imx_scu_pd_xlate;
>
> -       of_genpd_add_provider_onecell(dev->of_node, pd_data);
> +       ret =3D of_genpd_add_provider_onecell(dev->of_node, pd_data);
> +       if (ret) {
> +               while (count)
> +                       pm_genpd_remove(domains[--count]);
> +
> +               return ret;
> +       }
>
>         return 0;
>  }
> --
> 2.50.1 (Apple Git-155)
>
