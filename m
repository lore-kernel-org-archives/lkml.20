Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0783A310779
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001227; cv=pass; b=h71PunpRvudRxrdPuS7iVkqYJCytoJtPt61L/bJhCcpRNOmAh8UhOMy42KBxxvdz7GI6pOAHYe00MM1DitmB8p/lMxvCjMQafaj0lwtAA8xbVs5pHZIsRRL9fqnZ9/D+QO4P7lYCFrujtySZMftVNDgKG1JtY2dWOFZl0/ca9ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001227; c=relaxed/simple;
	bh=E7JHempOoUCSYf/9xUmI8va2uJakicZppH2wJWczR3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ml6UxAwPr5LZJ5uj+5C3UI50Sc0ELPeRR+Yp6155yGVPY3iFIR6Zu0rrF1weEre167vzxOK2kt+aUBs7Ir2KB1Wkes99yYZf+wrcvBdBbuq2q43eQt9AOd38IxlnuU0MJd5Ip7MiKMnIM+XZwmcEYtoWJKIWOf46JT5x/NRcZf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCHPwwRs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZDW1eS/; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCHPwwRs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZDW1eS/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGX8o1316628
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UajCiuu3zKkr8y3fzShjkyeSWKdl9qrmasKBAqFtM/4=; b=XCHPwwRsHvCetjwt
	Mz4BCA0rIHDYQZwOB9/UlCEk4Sb3l5L/PQ5E9rEJWg828oBEKPxaW0C2qb1Z9wNG
	N4lsju8ExbQ7Ju+JUOR/6tI4kWF49ppbJ01slQyTFQyXeoaEkBM+1UCOcqsCO2jo
	PwgWtvlfOv/ABZo4NCl6UTZYTjFBqlniSeBh1vXcuUP7no/1YBDbtyWUAfRuNI2H
	LgpDcfLWPjMonxxsPt2bGQTigWQ/5eEcyr+zsXBV//DluWjLz9sg7I2Ciy4fdUDY
	hVN6K2Feg4XRBRPc8gAWg5U5n7q4sMtFEguWLZb3GV4ZaQ43Z9iipT/ir8Gax4kZ
	iZmnDg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5jbb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:33:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so3035035a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001224; cv=none;
        d=google.com; s=arc-20260327;
        b=E0/07MT8VACrfoLrwy9pC/TiimSwnxxSNW1SPcdDEYL4eAJ5Q5CqRLmEJ8pdoLUSdd
         uB5yE9p8hiJpSQE+xo7Z7VRvFyv7sR54OH7ylUECbvWeNKkIZ2Vtc0b5ASVnYYH9nJHJ
         WHG08jgO92/bh6Cvd6odu1qBJlEGlp5Uq3dU5f36E0ZUkPX+/1nqiorc4k+T2nV+G82C
         cFmHcC3NqzdNurnZcgoAkEVUZol4+EFJ3L+j0znRy8thKy9LjH1PfFidufYCw6caA4d7
         nDmxfJhvu1rPvCA3dySY63FRgkcl/tM3WY/0bqTdN3LTAYisR6ubhdmp4V2QtQ8MQOG1
         LmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UajCiuu3zKkr8y3fzShjkyeSWKdl9qrmasKBAqFtM/4=;
        fh=rzBJutuaNA/9k5wQnSYtIf4Mg/ld7mtXWbq8xVRFKuE=;
        b=Sa+Rgj2TWyUVOU9BkziQBYuw1sReHc14JHqelhhohe3UilukMdPyszVTKGTBvzWY5U
         nbGplZ27hTqy57q91sNQniP/qUCJqpFN/5aui03O84+x8r9rSoOqUMGS2S66x2lqo48K
         PkOiK2A0XLlWZcxgazY/R1Cfi8Rr96hrnKsMKgI/wKnQDqH9RmHmyXjpSeitfTK+FUwe
         InnAaVe9QzSZ5uMTJO0CAK29bauk69Jj5QedAw/Vhyrpn2sfqmH/Ju6dV/yyPAavG/AC
         8pBnoyR+UojKmQMV6X0LQxPr7msC10JdLxzCYOQfwcPmxNcIy5hyuQ/kHbWI0f0LYumn
         QDyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790001224; x=1790606024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UajCiuu3zKkr8y3fzShjkyeSWKdl9qrmasKBAqFtM/4=;
        b=BZDW1eS/IU7SmG6cCd4gKHeZvQKpHh+LmcF+u23pMY7KZ+VS2LXEHrEZmHMG+sj61L
         Kub8AfZznfGHCu/HUha8KIgre9oPJup9vjHUa9Lom+2gRX7ocDXHupHTWq3woOv+wZMX
         x/ozyNRVM6R3jlph6e7E9IECiXRGtFCZeyAiwGT/F/vCw3PfoW4OywIYlWlajaIk0iUN
         LYNIPnjAUwIEJNjbG0LWST1biQkeh+IcbRFNR5OO0JurwPM8oi5Xv3Mw9vSwLG7PcgEY
         31yRHdHOAAmnPVduKdbDZ/GIz1Ayr9cN6O4kjFVd0nh5pAq8f2QtMqa1Btg9DlIpLvCN
         KAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001224; x=1790606024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UajCiuu3zKkr8y3fzShjkyeSWKdl9qrmasKBAqFtM/4=;
        b=WlMWqWGZ0Hq7AM0Lt0UBHsp4WIDjKvn9rslDbxD5B7Nqxspio3NNhf5duLz11BKZXJ
         bWEsqi5/5LYnRbK9zzJ1t7I11ObJjmGgLV0bFfRZT9cCm0qSIJUbxyef3yNFSjeC2/ub
         dA5L6iZkgZyXdMFN+gyDNhIrDDQ0E5AgokTwPbjcHIm9Az845rfdEDKaUA8x5aooOq+e
         sermcQbMnO2KbO3mawlN9DgH4ZF6x98849dZxTjZrwcdKxKdVItVC8vul/RpymAYhLY5
         gvf3TM6r/xxC3rLyTzZj9OjIiLeByipeQl6FCa4CDpnZ9qc1GvCBlnpfpZ21Bg242L9J
         xdTg==
X-Forwarded-Encrypted: i=1; AKwUvByuTn6N0IhJggL98cVKZh9uWWV/tNC4gGWI0fmxtjYz3+SRajaARdHZDhIpa45Vhq3MSzusg3bY5X3wN+U=@vger.kernel.org
X-Gm-Message-State: AFuF++mcSOma4wX9nt2FSnhUp9eu8lCzFsdMQlRP6di68kefmkWaofRo
	Lo4bMshBe4lbbFbjVvQCZRHRAsTk21R8g8OlR20z7NO61EB7auvzflU4/JkdlixZu5mgjzTGrPQ
	APEB2UL09x0/LuBM91Pc2XMA4ReZi7XtC7k3iUlIsOrMrKNGbjZXpVc4ccSjraccOYMO7c9PN8u
	IQMWHxw0qs0asFZsKG3Y9dE4vHEQpLFAQudlMaFqqn5ldWKHg3Zw==
X-Gm-Gg: AYBFou3hZiau0GZ2yC2QcnVwqQr4jzl5ZmtK+4VznmzKaihy2/usp7aYQyyC0ZmJgDF
	6Twi3HauTO4jPkFlYhnVpo2xDhucj+NehPeXB5Sw4xsK3qa2ejH+m/z1xLPyBCd5M+14yVWLOIJ
	Y79jFnFYc+dUeIAZPI7vm+OVu0BvdUC8Vy9RP3oV1rRWCjjIOj6Y+sWcPV4w==
X-Received: by 2002:a05:6a20:d70f:b0:3dd:85a8:cacc with SMTP id adf61e73a8af0-3dd8c47d05fmr18470891637.35.1790001223692;
        Mon, 21 Sep 2026 07:33:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:d70f:b0:3dd:85a8:cacc with SMTP id
 adf61e73a8af0-3dd8c47d05fmr18470839637.35.1790001223087; Mon, 21 Sep 2026
 07:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-pmdomain-idle-state-name-fallback-v1-1-e4242c409a0b@oss.qualcomm.com>
In-Reply-To: <20260914-pmdomain-idle-state-name-fallback-v1-1-e4242c409a0b@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:33:31 +0200
X-Gm-Features: AcwNN1W_UJfHVjVR0oSQdsskNOV92N_jUt6A6zCRPYhZu23fhBxykd6yXGRbgA8
Message-ID: <CAPx+jO9qYJfR+mAN1=5rWMWWrp9STZS4HB3ArGfKadhS0D4V1w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Fall back to node name for idle states
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab14048 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=c7lPhTKDuvdyFyChvsEA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 3MHYhlkKKcQZ9KjXRyYoBoW4pzSQMzK7
X-Proofpoint-ORIG-GUID: 3MHYhlkKKcQZ9KjXRyYoBoW4pzSQMzK7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX+wJ8TF6SKrh6
 DxwKvv+L/FJ6jg7/yYRbS9/Xb+44akbwb6ImbmpjPxbgJu7GGn7LqE3U0u9+mDhiwPvXOUKmjK7
 YO2kaTvyHauOWHkTOrq079/PWGoYP3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX3aMqzRaZ92xk
 l+Yh1+Xm7KM7CB+okYxwLltqXz4d9Ok399R93PW17pGyOPIR13bXBjUB7p0499+dso2knq3berq
 ZSV/l5Wxj9SDTB/lNmjWAMobF7o0z5GALxAtE7bCj90uVAAYRIyGS5uWZOy8qwfj1PTyEi9HKHY
 V8/VE2Zz9lUQfKxcnns6tx8vQQpmBReKOCaAshyQRKMXEpmr2IjKRA0kHdJxiXKmjTbR/7lENDU
 hMpRvL21H6NgB0yNWaCX8XLDpJcvOfgXbzMHcjQKuY2eQD00JNujPxZEMbAHYk36C0zbes+44la
 T+RT8a7QOpeRt4OWneNcoWYo3Uzxh9ZAbEiIcsJ9dq4clYESYp6vg9FShfiPYI8OlRyXaQ0bLGH
 7JKMESdDi8RUt7EMdQY19+/Doo9EP10xaZE4ucC/bPTPQqtKucVVpMcbLHHa6+4fLRZeJv7OFA0
 h0kC1fOKDACCEaSzjZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210211

On Mon, Sep 14, 2026 at 8:54=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:
>
> The dt_idle_states uses idle-state-name when available and when missing
> falls back to the node name. Do the same for domain-idle-states.
>
> This lets pmdomain idle_states_desc debugfs show a name even when
> idle-state-name is omitted.
>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pmdomain/core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 052ec478dfcc..d0bcb4897477 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3583,7 +3583,10 @@ static int genpd_parse_state(struct genpd_power_st=
ate *genpd_state,
>         if (!err)
>                 genpd_state->residency_ns =3D 1000LL * residency;
>
> -       of_property_read_string(state_node, "idle-state-name", &genpd_sta=
te->name);
> +       err =3D of_property_read_string(state_node, "idle-state-name",
> +                                     &genpd_state->name);
> +       if (err)
> +               genpd_state->name =3D state_node->name;
>
>         genpd_state->power_on_latency_ns =3D 1000LL * exit_latency;
>         genpd_state->power_off_latency_ns =3D 1000LL * entry_latency;
> @@ -4006,7 +4009,7 @@ static int idle_states_desc_show(struct seq_file *s=
, void *data)
>                 snprintf(state_name, ARRAY_SIZE(state_name), "S%-5d", i);
>                 seq_printf(s, "%-6s %-12llu %-14llu %s\n",
>                            state_name, latency, residency,
> -                          state->name ?: "N/A");
> +                          state->name);

As pointed out by Sashiko, state->name may still be NULL in some
cases, so I decided to keep this as is.

>         }
>
>         genpd_unlock(genpd);
>
> ---
> base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
> change-id: 20260914-pmdomain-idle-state-name-fallback-3bb5db520a30
>
> Best regards,
> --
> Maulik Shah <maulik.shah@oss.qualcomm.com>
>

With the minor amendment above, applied for next, thanks!

Kind regards
Uffe
