Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B8A3D525F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507944; cv=pass; b=ODO6siro/WmsG0xbESxN/zTT3nymLulZ6lc6zq0Av6/iRBM2KZvxrKTvwf0EMuHH6deVszMb/pqnghOxNSDDij8jZAxsNWUrPsvoru8c4Ksga6MUPOPhZb+YTljngxv/x+bfl4xD/TbVoi7SAdZ8Jfh9Lhcd0wVZjgrbxY9RYmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507944; c=relaxed/simple;
	bh=U5ApS72uEjKEs5mPiYz4Sb9WyBZ+8Xb3wknNXul3qjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIM2dKKPUlmUUYwmG1fwPrSBFdlg1SMaEU158GjwReSlkMhhP6jQ5SB8FDxPsqLi9S0METVxJTnURafojz0kahFi6TAphN7XN8lEivSXA/CnMlF7Vg35oz27LKJJNShK1iicXPKDYjq1pcXfkNR7Z8IMkRlMucMaJ2ZqQQ5v8jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBgs5nlb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6Aullbr; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBgs5nlb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6Aullbr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462ml01545575
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 07:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=; b=CBgs5nlb0vyHXZHE
	CfDIHz9bdopunyqpjuPfCJiVyzLGJTJSSuXdV5NOM/FWd3auNC77Od7xTOIObTxX
	m2AK68aaHGeFD/nMxdZQPcoTxmfAgXD1XVPahvQoV4XeooE131fHZ2nYRLedLXSb
	7O6Zsqly7jU9cIKtCQGjyVH2YNWzIgdW8AOnOQJrn4kK6Gw+x1jO9+ahwAVPD14p
	3sSuHwykqgQunS8swd02Ls+1I0iMrbcN//Hu9iW86cjEGa2VgLR9JIEsH947YNxp
	5V9ZPGk1e+q7i4k7WGR0+I3zs7LL4SAbQ0ODb9LzNfWiDpePeRGGGPU2T8JaeZz4
	xA+raQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqrp4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:45:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so122377185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788507941; cv=none;
        d=google.com; s=arc-20260327;
        b=Tz5s4ONbbushpHibk+0aIssW8NLJmPbYqk7GiOgfu7CD4iup6KIinv2mkzm6IYeqwc
         EeWj6tkYrFAboSWMc88Sm9DZb6QyrejjpU7uJAV0e+Ih1o8aHY3LshyhMJI+2bHgAM8j
         /hyvWvVqPRk87jrJ9WVR3+2nQbaPUDByLwThrfLE7olQ0StShtOnfJ3L9gER8/wFg5gF
         xC+igrnKMrii3nNUHh4Wm3ELEkmR+Kj4VQmucbykzNj59xB6OBtaTofQfN0nR3qgGd0/
         A53vBe74Z39VVTD+Cz7ijjuz2vyN/a8HBx3mcw0p/SFz7H87tczViw4+R8itOLcILhvz
         TuwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=;
        fh=XfsfsGEHCWBpO7CznW07DCF1LPVCuc3PHpBXep6Zjsg=;
        b=npFbYbFZ6qmgfiJT5ZRtMd10lzSLn0112X3FbN5btuzYlDT1K6Jrhu85C27W1Bp7KW
         z5g+iEaObvPeCRBtuXp10Ke17yiOeS+UadjYWNI8ibiCt8ZEDcw+Dq2ipWroSbVm2w5q
         xZ9175ZPoO18kF1M/rhvWFOtspeHCkhxmPE/Sq6qaQgVlkRzLyHlx2aEpJQOLTaVGzLo
         EREt2Dh/XupfQj0SujON2PREGVW5mvRquiL+QbiQTjodcwelRjlBpMVR/gzbGZRLH3rE
         l8g3fUC0p0f7PKFemLBwwMcRSFqQkdbpWDUOrFzZ1PKHk3a/r5pXJeM/MtoQndNlcKvH
         1HSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788507941; x=1789112741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=;
        b=D6AullbrfQiasS7lzSqRVaXsKOzCh2zeEySlTnwnUhTNOKq6vkZRaVFGtWwDOTJp4R
         Q+yK3w89OM7KTYUsnbsynJU/cH0qtIvXN6zGAbe905KD08CA5v6rNgLQhrVgIC028AxS
         kvPcbszGwSpscKirwyhQMJ8HCKI1nYxS3kJOA56SfU99Zpmjw0srNqxXA6zoscTAVz8L
         CHfetgs5EydP9gG2bjQZCMwkURGlpJfDFvSxTV7F+nQuBU4VT4RHhov68IXM/Xi3fnW5
         n/zyboDkq7ZwaCruPVYMuaz5RDJLHOoUnBaEwcluh21P+4VEjhUkUIHpUYYgVLCU6WcY
         pLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507941; x=1789112741;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6qZ2VR8/sUhxooIKjGel5j3+haR5Iv/MA+vGmwiZbU=;
        b=qTL8xpsAAs9Wzjdn2xnGdW7uWL9E/zeSjZhB+S8CYVK6cd0YLeUFPjhmiQDSNu/Fij
         u/n0wlt22zuJnVcQhmRWwd1evLORh0ElhirFYuOVfdJrJ9HH5S8v7J3J6h75wKChKJ4U
         wcHGkodtit2N5jUgv+4gEkeGj0osizm09ErYZh5+WNeTZMrXyHJ1y4y2KtcBFU0fUf0m
         BOmoS1hNqYiGC3qsaO/CYAAbGLeaxmn4cw6c4szIQKgF00q16CLVoLJaMpvuCPv6zb1l
         iA0ec4ZNHpuaepkajlcXLWkwNIDs+1JhLiJsy9qQolTjW6Sf0kLOTck6PMmMkCVd+VoH
         I7Yg==
X-Forwarded-Encrypted: i=1; AKwUvBylbq3PRmbXln3FcMLxSUjUChcWytISDE4L46RgBoq+K36USa7FLNwT12XfJZQgbAL9jLaHchTjUciiyts=@vger.kernel.org
X-Gm-Message-State: AFuF++kPUWPClnILdtkzhYQPO6R3OWUTT2jZf5LI9QEE8KK04trXQDWy
	rDchIG6RNBzbEadShKckbUFhZD+wPZV82fG01en3OlI0mL/2GiMUo2Q2oqhIBe1aOUQ2TPKdbZ2
	0Fy7IMvbucihmleGe8CpOCayiBA1TFg5tuiKiN+sj7MsymkpE6/aVsaglGpvakIYaxehBAqKBKl
	UFnPnt6zSodE5cAlDHYEb9LZs7kugCZslW4q1eu4k/MQ==
X-Gm-Gg: AYBFou2qUAzTym8z2PK3eP4u90vo7DX2scYU9/okJoR5UmbCuS/SiO03NrryBBVGdIm
	de5j/MK/fz2ygYAWybT+cygKursyilc+50M2TxRexA/WUmPjhyTwi/sJb1Bl7l5fY+GIyuYs2nw
	fv2aRbj8EAX3Hrwry8C/WzJn9LpFgAGY05iu8bw17TdyT4TUnNCgq/XNBSrb5bhcSeZ4Xj3a2xR
	qfZ1LzstyqNskQ6TEoBS2syMm/ssuNdY1qs0wkER2b6SuBNiqNTmF8b2mXN7oDkLoFXxqBPbbrt
X-Received: by 2002:a05:620a:bd5:b0:937:4550:96c9 with SMTP id af79cd13be357-9396e0e1302mr1054105085a.21.1788507941555;
        Fri, 04 Sep 2026 00:45:41 -0700 (PDT)
X-Received: by 2002:a05:620a:bd5:b0:937:4550:96c9 with SMTP id
 af79cd13be357-9396e0e1302mr1054100585a.21.1788507940986; Fri, 04 Sep 2026
 00:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
 <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-1-01ef1eced075@linaro.org>
In-Reply-To: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-1-01ef1eced075@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:45:29 +0200
X-Gm-Features: AcwNN1WWU5FRzvZrK5fq_LzdAaGftwm82SLjDwjNGTlCYX8Fb3yJIL48uBH_wr4
Message-ID: <CAFEp6-2nWfjF18R9pw0xFt92GcPORKKa+ix8czQ=m512TYuP8Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] phy: core: Fix use-after-free in phy_get paths
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3MCBTYWx0ZWRfX5Fl7cNlASUV9
 4zcnPFV6MroXK+rwoEnVhkfFxJAj9/IbT600GFx9Cnu8r2YzOtrIsbtjcoTLg/c9MAvQbMux9Bo
 8xxwyxu98jN4Czhh74IZqeYOvQQV2/I=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9a7726 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=j3EoGy_XDV5ESBrvTGYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3MCBTYWx0ZWRfX3caQD6rFRRKD
 HuzXktQCLQs/4O9LT3qIaiQC1lSfpUPKzvcmaaEbxF26pGzd4NOAhanNHO6UTUv5qr8HJ47rP2M
 aDEi52ldmmnvx63EoU8+FlvNTiePl/CxwwMVVIZ1vGyTTaxC6AOF//Bpub2OuODtt4+N2dOsxkO
 58XqeLJR7Bg0Nj9+9TPtvF8n9fB3yVEiO+2WGinks9OweMELydKoPk17menVwWYjgRekf8EfztI
 II8RMo404Rwob4HYhIrP5U3jaZXxPZ8OWhM27JvSgmtyKZC72dBTIjoWpGKOp9SqcjkDKWhFnq7
 NAr0YF2ki+0qnMVU2jMmhXE7OUl9TPFYjf4TdTJRikJVwknVAC9Q7VzFxKV3vUZCnf1rmdCIVsf
 OXgJ39zG2Jm/obKLY8KHxeN8ur8J/ElxqqRuizStI3EX2W3bsfN7MhgeydHvggqO3Rm09+uxTVs
 3hMkntN7FNi+eAdlujg==
X-Proofpoint-ORIG-GUID: 9tFP_hLum2JkwHIYzRGGrnZ004zkaukc
X-Proofpoint-GUID: 9tFP_hLum2JkwHIYzRGGrnZ004zkaukc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040070

Hi Bryan,

On Fri, Sep 4, 2026 at 12:59=E2=80=AFAM Bryan O'Donoghue
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
> ---
>  drivers/phy/phy-core.c | 41 ++++++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 21aaf2f76e53e..cd9ace125567a 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -124,13 +124,11 @@ static struct phy *phy_find(struct device *dev, con=
st char *con_id)
>         const char *dev_id =3D dev_name(dev);
>         struct phy_lookup *p, *pl =3D NULL;
>
> -       mutex_lock(&phy_provider_mutex);
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
> @@ -635,11 +633,10 @@ static struct phy *_of_phy_get(struct device_node *=
np, int index)
>                 goto out_put_node;
>         }
>
> -       mutex_lock(&phy_provider_mutex);

Then, now we're moving the responsibility to the callers, maybe we should h=
ave:
    lockdep_assert_held(&phy_provider_mutex)

>         phy_provider =3D of_phy_provider_lookup(args.np);
>         if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))=
 {
>                 phy =3D ERR_PTR(-EPROBE_DEFER);
> -               goto out_unlock;
> +               goto out_put_node;
>         }
>
>         if (!of_device_is_available(args.np)) {
> @@ -653,8 +650,6 @@ static struct phy *_of_phy_get(struct device_node *np=
, int index)
>  out_put_module:
>         module_put(phy_provider->owner);
>
> -out_unlock:
> -       mutex_unlock(&phy_provider_mutex);
>  out_put_node:
>         of_node_put(args.np);
>
> @@ -678,15 +673,21 @@ struct phy *of_phy_get(struct device_node *np, cons=
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
> @@ -786,6 +787,7 @@ struct phy *phy_get(struct device *dev, const char *s=
tring)
>         struct phy *phy;
>         struct device_link *link;
>
> +       mutex_lock(&phy_provider_mutex);
>         if (dev->of_node) {
>                 if (string)
>                         index =3D of_property_match_string(dev->of_node, =
"phy-names",
> @@ -796,15 +798,18 @@ struct phy *phy_get(struct device *dev, const char =
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
> @@ -813,6 +818,8 @@ struct phy *phy_get(struct device *dev, const char *s=
tring)
>                 dev_dbg(dev, "failed to create device link to %s\n",
>                         dev_name(phy->dev.parent));
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(phy_get);
> @@ -961,15 +968,17 @@ struct phy *devm_of_phy_get_by_index(struct device =
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
> @@ -982,6 +991,8 @@ struct phy *devm_of_phy_get_by_index(struct device *d=
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
