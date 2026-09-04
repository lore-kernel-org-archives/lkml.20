Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812224854F8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525636; cv=pass; b=po1FE1gyRIfEaAduBFVh/Ub+PpqMDBlMFBnR84XKBp80b+BAOQkDUDoIkvqVW0akbwwXUxHseESrfWOQUL8uS9Jz95e/WdYMTOuDfwW8u6aq6W0N18KqCqaA7XSpb8jWdO6Bl50cVVxmpYLQH2UF+fDkMDua3vPjJu0ruOKSJE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525636; c=relaxed/simple;
	bh=tlSwqxAiw604cpb1dgd/H8C/UkaGdvxpywU0LdEuBW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ue7/0n4Z7t3h3nm/0CGxOkNZ7tyiKTAm3/DsbxeuVdN3ACdiUUzsQdsfmOQE3UYICqQGfmFTukMs5n00DLs2I5mD34hXBnYFpwrYVm+DDRN9oBeML72TMQm4ZQ2X07dLmsaGXxLjsDmeXtYP8uv29iWOOP3uAUM+mjZbGHNxCyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+XeAnzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKyAuMJx; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+XeAnzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKyAuMJx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIUSw2756555
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 12:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j0+GeMl6zOe/BFRxRXazQ5C0aLdugDFg6DqX1FNOkk0=; b=a+XeAnzcyW2zl6jE
	UY3r8ydj+u+BsEl/DKXlOKXvLl/iAfayC+PwBPzqTLuYa5rmvdHqY293PJK9tWWd
	Glyf15PS/3SszWklDQ3g+ELtYfYXfUVk3dZZfPAzo0oMfPHz92AHb52eDEpjBApn
	LkSLbb7k1ZZIJm4/21qWDRB0L9ZarRTzsJ5m2NDSNbrC4GuYFQOlVmSZ5UdDtyyu
	3uxC7uR4ICIKvU3kWlmQXAVmjJm0vPKaE7P0naEJ8qhUMoc2aF9rUUG4B0lgLfPp
	xzwBwJJk7QmMeDCqU75FBLiEsPqWUdwG7cjnm8kKMXHpWsIKjQfXp0/fDTM52aDs
	Iz6whg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk92256v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:40:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso130586685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525632; cv=none;
        d=google.com; s=arc-20260327;
        b=BXmrUTBVqO9teCzUtbCQoQ2SKu+z9yMKGkiRBhoQxrGTh+MzbPvwSPSkI8oKfdAe8b
         Ug8LqsqJ/sCZbDQNGS9O6uvBKkh/lNW2fS2+TIfji2rU+s7G8NuKGBqPJV9b16aMSURv
         dqQ+x6VARrk+TQKq18VmfO13lXYQfbbDL8xmLLFZNFBrCFhR5/IyoPH9wLJINI503mDT
         FapvylynQ6zfMyNMbTLE+theGYGX94+LtoGOX/BvInEdbWlJKTwZ028kl3BcFwIj0o54
         4muozODxWLSoFGivIjpsKDtoTjFWTIwnNwB7DADwuz/c1UGmMQGHbN+NI7ej+Qlb4SCs
         lXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j0+GeMl6zOe/BFRxRXazQ5C0aLdugDFg6DqX1FNOkk0=;
        fh=tgYyE0n+U+kRSkeGLofxCqHp3BuxMm4P89RDKBSmt5E=;
        b=aOS9S51g9glM8YKQgx4g3fDbOVxEulC6aS00aUg1JeRItc5Cz6hCc5tlLzLid83iOK
         COdBvjCf7ohzm2ucLXwPWnYpu9LjOhiJ5hzTZhFrXpn2+60tPJJxcrpKavTc3EMOIGgx
         PWAS2RLBt50d1Fg7go71BK7BWDSIzIIROON2BiCXVrINCaTNEQkj+WgA15Fv1rnzup/L
         NdyDy8uGFXr8C0FXVeSrAhl0YFdSmuLrvcEOQNGtft8B67trdXH3v/mJQECNRO5Whg9d
         iiViTGtIjZPlCkozizSyxeTKd/67EMyqCNzeN4JLPMarMY5lFrJXf1j3P1kyq6JLyQfK
         XkBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788525632; x=1789130432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j0+GeMl6zOe/BFRxRXazQ5C0aLdugDFg6DqX1FNOkk0=;
        b=dKyAuMJxvGnZTckVi7wt1XPguEvs/jlQTUmMTZ6rs7Cuk86PucQjB4UgsCCNZVw7dJ
         AK0SMwgNmk7WKUHsB9fu08EctCT8l2pUhBMnTkZUF6sLvDDh+BVXGw7v+t6GZAnuEJn6
         5ClOxSdMy1BkoGftPxm+7PK63d8ug4RJeng7WWX1CphB77VTCNi28d6RZHfx4Kr0RfRP
         7/zGCvWThqjpTJRHxvyEiO9ffIYsX7ifx1Otv5+pQmruCXjXiM7fqRrE7dH9Ddn3dmtr
         b7E/WImqBXC3ZB1FseWZ8zteWLCe+Jfcl5ReiF2ztnmOHG4pGU/wJnFKfvJX+vGHjEgM
         Eo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525632; x=1789130432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0+GeMl6zOe/BFRxRXazQ5C0aLdugDFg6DqX1FNOkk0=;
        b=SN+hmit3TU6MxbzXDqI3gEAY/vulKandkM2cSCpiFC7nWSDQBCFSEMBTt5deKHmGyk
         oVaQg0vx7I+lWAnJvVv1qkxNwdK85G3TcLfOYRg1HFYh1bbKrDfCfwYn1nDIvMi3ARdN
         SThcHSqB0wFPayxRr71NnTH2gP9lO+hy3SGtKf+mEwhH/9BBLzXvE5F8CI/A3+KnCuK+
         tW2ykfXRfn7Js/jmzz1dkHc4JTbpdLss4AlyIi6TnhlsqvuLqCH8FB+2wET+fkE4awUZ
         hG7XM/jngWsoZxLIQDCL4JLk5QT71h7+DQdAh69VxkvndJMAKygCUMIcFDYUoUQcdpH0
         0K/A==
X-Forwarded-Encrypted: i=1; AKwUvBz3QRCZjuGXkEL/3DPJVdF5+ZZp8HZa0pK0HIogAzNa4Wv/Qu/PXzHcs88gxMyKWxWArv7vSrYoLETAJ84=@vger.kernel.org
X-Gm-Message-State: AFuF++kEwsmYOGEdSKIcOcpuUA8wRj4ZIV3u6hxvqZLpSI3nSkCbOH+j
	vkXohMw1vz6+JhcE3O84ABodg09YT8DBC00lJjqy8bSNMq6R3lpHXoKMbzY6gBuIGH9JduBEPC/
	YTnXIZhehkBUfy/p3Lt+lBz75Oh3H2wzrBjQCZb+sxgdwRniOHcWHGkENEzousI414ptNcsloRC
	PrrhbipxoIvCbj/RICOT/IUmzq9fTsnfYd/5XPGV5LtA==
X-Gm-Gg: AYBFou0cC9fgqn8r+m4XbM43vG2BLgbtPvxTYe0v/cZ60BN0uLg64+OVPv3KFWsepE2
	HZ7skJ3n3xxRSR97VUSuTo/C74sCc+6m73LZS98PRY0Dc8+yrvXJoa7mBeYqzeqpc+IwfPlfrFr
	JsbHyC06mRnIYvxUBiCldW4LcZ69XNc68WUxG/IHRIvpLlMh+zILJ4TCJIFvNYNkQkmvkFwPlvT
	DzILlkmTazhG/Y5u2EdwsM05YCweoQhTklzrSxaW8FcwgleLnC425LaKZLdeqJt6Z8PMXhyGrGM
X-Received: by 2002:a05:620a:690a:b0:936:dc16:206b with SMTP id af79cd13be357-9398043f64fmr553873285a.26.1788525632377;
        Fri, 04 Sep 2026 05:40:32 -0700 (PDT)
X-Received: by 2002:a05:620a:690a:b0:936:dc16:206b with SMTP id
 af79cd13be357-9398043f64fmr553866185a.26.1788525631793; Fri, 04 Sep 2026
 05:40:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org>
 <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-1-68b7916e7a3f@linaro.org>
In-Reply-To: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-1-68b7916e7a3f@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 14:40:20 +0200
X-Gm-Features: AcwNN1UPiDdyGKcq8V93lMRdj7jZ5WTUE_ubspKx3Qn_j0cuDTBr-ZQNMU5Z3Uo
Message-ID: <CAFEp6-0NyozWY7DVoFbNNuDkVY3nmHsvys5=84mM7OVH6cHfGA@mail.gmail.com>
Subject: Re: [PATCH v15 1/4] phy: core: Fix use-after-free in phy_get paths
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
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfXx5zWuCyyG3dc
 FKroKH+Zf/YR27mjZRJkY7KAUjE7tQU9wQF/wj5nx34uS4qnCFoLdtpFzlCqmOix6h0BDbYCyBy
 w6jXefT2VDY1W2dwctarpg5T+NqKvCZ+gm9Otn+Vdig5Ce//+TSDc++2PHBOEtNGjXdsbWUoNEN
 tXk/sgGhOGTvHWImTisAIxa7GTOZvZ4b3WgOs7Q8g+f8PwFxV/cELh6aQgs2a5MMBlLYy6hvFwU
 j723kFZjbZjRbTor8z0zkPL8NvfqY/2QHmrv00DACMNSsF3dVMm5EwPqJg0ETxcIAdW9Fcs1fNY
 kWhXaBA0MzDxxHHkr4iNsFRPJ7CYcR1eC13cl/GduyOdddZxRqdArSd5hXyxM5A5P4g/ESq7QQV
 PV8kwZTAQ17CDZlVPpVgxHmsdcgYg1gwM6UuZiA7bKTzw/xVvZrXvRik+sbMg4dvsVy8ZsYqaqf
 zpdxa6uuFHJMaft6kJw==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9abc41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uuK-gh7oNHpeqQh_G3oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UizzUbj9eFQaCjxLo9f8PduaAsV24Ori
X-Proofpoint-GUID: UizzUbj9eFQaCjxLo9f8PduaAsV24Ori
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfX3ZfNjFRTfVgW
 czFjp2cHWSZm2eM/RKMgd0BOPLqkJZTJ/r9vp1V5u4IALCKACN1vjg151k3eUmwmqcI1IQD6WoP
 UkcSpQ3zu7HHyl1/ScdxvElG/Jv5YiM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040114

On Fri, Sep 4, 2026 at 1:53=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Sashiko asked during a patch review if the existing usage pattern had a
> race condition; specifically in of_phy_get() if it was possible between
> returning from _of_phy_get() and running try_module_get() that a module
> might be unbound leading to use-after-free.
>
> Looking at the code this appears to be so, there is no linkage between th=
e
> phy and module under a synchronisation primitive.
>
> Using the phy_provider_mutex in phy_get() will ensure there is a link bet=
ween
> the returned phy pointer and the module_get() bumping the module referenc=
e
> count.
>
> Amend phy_get(), of_phy_get() and devm_of_phy_get_by_index() to fix the
> same usage pattern.
>
> phy_provider_unregister() must take the phy_provider_mutex so amending
> phy_get()/of_phy_get() to take that same mutex guarantees there is no
> use-after-free.
>
> Fixes: ff764963479a1 ("drivers: phy: add generic PHY framework")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/phy/phy-core.c | 45 ++++++++++++++++++++++++++++++--------------=
-
>  1 file changed, 30 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 21aaf2f76e53e..89addd732bff3 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -124,13 +124,13 @@ static struct phy *phy_find(struct device *dev, con=
st char *con_id)
>         const char *dev_id =3D dev_name(dev);
>         struct phy_lookup *p, *pl =3D NULL;
>
> -       mutex_lock(&phy_provider_mutex);
> +       lockdep_assert_held(&phy_provider_mutex);
> +
>         list_for_each_entry(p, &phys, node)
>                 if (!strcmp(p->dev_id, dev_id) && !strcmp(p->con_id, con_=
id)) {
>                         pl =3D p;
>                         break;
>                 }
> -       mutex_unlock(&phy_provider_mutex);
>
>         return pl ? pl->phy : ERR_PTR(-ENODEV);
>  }
> @@ -624,6 +624,8 @@ static struct phy *_of_phy_get(struct device_node *np=
, int index)
>         struct phy *phy =3D NULL;
>         struct of_phandle_args args;
>
> +       lockdep_assert_held(&phy_provider_mutex);
> +
>         ret =3D of_parse_phandle_with_args(np, "phys", "#phy-cells",
>                 index, &args);
>         if (ret)
> @@ -635,11 +637,10 @@ static struct phy *_of_phy_get(struct device_node *=
np, int index)
>                 goto out_put_node;
>         }
>
> -       mutex_lock(&phy_provider_mutex);
>         phy_provider =3D of_phy_provider_lookup(args.np);
>         if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))=
 {
>                 phy =3D ERR_PTR(-EPROBE_DEFER);
> -               goto out_unlock;
> +               goto out_put_node;
>         }
>
>         if (!of_device_is_available(args.np)) {
> @@ -653,8 +654,6 @@ static struct phy *_of_phy_get(struct device_node *np=
, int index)
>  out_put_module:
>         module_put(phy_provider->owner);
>
> -out_unlock:
> -       mutex_unlock(&phy_provider_mutex);
>  out_put_node:
>         of_node_put(args.np);
>
> @@ -678,15 +677,21 @@ struct phy *of_phy_get(struct device_node *np, cons=
t char *con_id)
>         if (con_id)
>                 index =3D of_property_match_string(np, "phy-names", con_i=
d);
>
> +       mutex_lock(&phy_provider_mutex);
> +
>         phy =3D _of_phy_get(np, index);
>         if (IS_ERR(phy))
> -               return phy;
> +               goto out_unlock;
>
> -       if (!try_module_get(phy->ops->owner))
> -               return ERR_PTR(-EPROBE_DEFER);
> +       if (!try_module_get(phy->ops->owner)) {
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
> +       }
>
>         get_device(&phy->dev);
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(of_phy_get);
> @@ -786,6 +791,7 @@ struct phy *phy_get(struct device *dev, const char *s=
tring)
>         struct phy *phy;
>         struct device_link *link;
>
> +       mutex_lock(&phy_provider_mutex);
>         if (dev->of_node) {
>                 if (string)
>                         index =3D of_property_match_string(dev->of_node, =
"phy-names",
> @@ -796,15 +802,18 @@ struct phy *phy_get(struct device *dev, const char =
*string)
>         } else {
>                 if (string =3D=3D NULL) {
>                         dev_WARN(dev, "missing string\n");
> -                       return ERR_PTR(-EINVAL);
> +                       phy =3D ERR_PTR(-EINVAL);
> +                       goto out_unlock;
>                 }
>                 phy =3D phy_find(dev, string);
>         }
>         if (IS_ERR(phy))
> -               return phy;
> +               goto out_unlock;
>
> -       if (!try_module_get(phy->ops->owner))
> -               return ERR_PTR(-EPROBE_DEFER);
> +       if (!try_module_get(phy->ops->owner)) {
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
> +       }
>
>         get_device(&phy->dev);
>
> @@ -813,6 +822,8 @@ struct phy *phy_get(struct device *dev, const char *s=
tring)
>                 dev_dbg(dev, "failed to create device link to %s\n",
>                         dev_name(phy->dev.parent));
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(phy_get);
> @@ -961,15 +972,17 @@ struct phy *devm_of_phy_get_by_index(struct device =
*dev, struct device_node *np,
>         if (!ptr)
>                 return ERR_PTR(-ENOMEM);
>
> +       mutex_lock(&phy_provider_mutex);
>         phy =3D _of_phy_get(np, index);
>         if (IS_ERR(phy)) {
>                 devres_free(ptr);
> -               return phy;
> +               goto out_unlock;
>         }
>
>         if (!try_module_get(phy->ops->owner)) {
>                 devres_free(ptr);
> -               return ERR_PTR(-EPROBE_DEFER);
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
>         }
>
>         get_device(&phy->dev);
> @@ -982,6 +995,8 @@ struct phy *devm_of_phy_get_by_index(struct device *d=
ev, struct device_node *np,
>                 dev_dbg(dev, "failed to create device link to %s\n",
>                         dev_name(phy->dev.parent));
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>
> --
> 2.55.0
>
