Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ABC4B66F1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558517; cv=pass; b=lUhg2MJd3M1KvvhWDhUs0bQzFJM7Oxd4qqZuRvS8a/aq1LqZQiiBPqVhWR2aNn/5lWZO9YRiJ/YXQuE3NwtXeGTxOKUHfcPCw4SG33v5Dh+HYB0sfaLtNkfKbah7Z0eKgFuhlTnHuNWJbmXMQkPEO+zeFsnHvK8dJRrv+3W1h48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558517; c=relaxed/simple;
	bh=sOzw2zM+saxLCKn1n8FrkmOltMtz0twy/n/1jq7OZ7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsW8V6ikPdQjbzjqeHG6/kZGglL4N3vuhjedAsfAVxD8JrooDZ061R8YVrE6kxf8DgqQvxNzD6zGzmw1zohAgtjTOalJoUv2GPsr63Y8DH8DBCxU2vfuyaCVy67SYQTzqj2aDuc7O3u9C1Fb2uUAatrz0mxklXL1g4J1rixP9XY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLRFMEgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0LgVEsh; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLRFMEgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0LgVEsh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92uPJ1553080
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00PLRbaZlcE4ViAM9gkHo3TXoe80Nwm/jvHOjI3lpvA=; b=iLRFMEgP2FzH8dN6
	XGP3KUPuGt7FzVUF1xo/bL5z7ZdzCqhLDmhjp5tvqdNbG55603pP4mWiyEVfJjve
	r+N6Prsb9amp6W2bbvnLLBZx1nEz7pAmpfrTrhCNq25gsoJMzfAo5brXR6mI28PL
	uSvuEN08oFnPWlZZAE7JjDxLqFa5sgLXekMyrzaHQb9m/faJOBbfop06b+qUN4IX
	gNiblV/IeU+vuHu8UaIuOyhcZQVaZUnUg8Dz+nluSwp2Y3sbAtpFd07o4kaPKEmc
	nX8lCPg914X2F5Ih2Cv3U1TF35MDClN9OXvfbjMPyx3KnDtNYO/yF+3yxYPj+GN1
	DgtMKg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n64ch1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:34:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc44d708055so9246917a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789558487; cv=none;
        d=google.com; s=arc-20260327;
        b=qEvTPjX7qCD6c3MS2g/cHctwhC0vV+VaQgaAwjz9J2XZKAesLVKAsHd16s2LGsOw55
         DKQ6+ZDRFvRDSH0cL+zbVfS8vnrOlB2FolANPvsGNCDbJeX4nyiIwtm97tI9Epobxo+U
         dSYVxYfx9lajO9FTgOGqK7JTETwukV2z5Mm4XdVE+gv5GdZ3j6AFzsvZydLqgHbZblNw
         Vvq7rBZHryeXGIXD+5VJoMTWV3AN5b7+s6Glm1YzOv/IcnaAlKrz+EovQdAqlWtfqHH7
         QL9CjZzMdqyxp0UdXwo3KIwIPbznETDM3Bsagf6cUItb+OoOULZXDE0vQ4OH3/YSxlGL
         fpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=00PLRbaZlcE4ViAM9gkHo3TXoe80Nwm/jvHOjI3lpvA=;
        fh=aM5HZR/DEQg0xoRBM3EqZTWNj27rPa0dVN5f9kFb0+8=;
        b=bBcAIW4u4FKBQics9WXRS/7xo6VdQz+iSJxEmSl9FK89bcp4eiagTTmCHRafcPLypP
         CtcstVWVL0qDU5LcC/Ji3zJVUN7gwiTpgFDxEG7uuLW2xqRgAv9IHpwqVM8AhU5pN9V7
         JZ2XZk0dQXh/XrqogpJxj5Z2MC+Xwu0wA2vSSdeOqHTYTTwlWFpsEYN1VLzFhWGGVbnz
         Jlg1wa+s/URePDDYZ0QCq5EYW+UqUCplMQHy3QIaFRr1o1DV7mM0NnrGtUG/KCuFtUDW
         sQGIrdlTYIEm+ZxHyTiLR3PaHsfz+2TaDdsaBB37KE7DAgDyLIAIGrc+qp3RBOpOSfaS
         ZKbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789558487; x=1790163287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=00PLRbaZlcE4ViAM9gkHo3TXoe80Nwm/jvHOjI3lpvA=;
        b=F0LgVEshd1kgiFs+wFxIHvHlS46UhhNug+4edoyQWQLK2+9xd34kTWPMMKQSznF1iN
         K9Licm6hkF5abwfjInfAUHhpAKg0A7rK7na5U5mdRHu+EVFpzwJLNpxcCgXKO4FPpcEg
         WXfcFMCMnOfVDpZK60QZC3gRVvwzfDEWa0MnxfyxCKNYhFIwX92zaoAZRw4EJKP3PKLJ
         jJdHbdZwGJ3BH4bNwvlEjwN95ZZzW08P8bprdpQnX8C36ahasPkpuF9DFxFeyk1Zlc+9
         iTqyp6Icjz1HqWCTMrWzUkml7sdvf49ZpzUGBbIMMwGKVqxHS1l1iWt//HLReTZ36mZt
         K/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558487; x=1790163287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=00PLRbaZlcE4ViAM9gkHo3TXoe80Nwm/jvHOjI3lpvA=;
        b=iy9jvFfmqAzjbz3ozXd7lP9xaCOXxWMCFWwd9NTvYjxj2tn9iW+zWp9ENjCxmNwknZ
         rKYmFgq30sNbIVzlRbbVKAwNbi871qUjqfAReszXKBqRKe+oTO/oNWe8xpZm8E6VwJhm
         mLITgq9SasjYJyl2TbbzXkJoIW3ZweD6vn9BuhKxUHEX4rsjhQQWI6it4Vw3yPu49s6z
         6nWCGijo6J15aClbjV3QtgIVZheUf0ofbKkZxHpZ95sPhCmhGEOzbkhx76SKZsUJ3n3V
         ExQIqYeM1vAAiMGfFuqnImoKKUujSsjqkd0mvfb6H/7Qr/Pn1xs+U58HQ056rkV0mLES
         8Ehw==
X-Forwarded-Encrypted: i=1; AKwUvBwWcFB5Y1V8MQBhPUsbH3ZwDSqsGaDjpZzZE0u9D/upFkd2j5GcBgUBUQk73C0KqKSwddskR3JJccEBMaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l9Tx2u0bIPFId0Vqcm/Rso612UoGhNcoIkzWtMCDeiQ93bHUIc
	7GUGOMv36iUhMfhDeWt9WOBbmDasM8GqBbmRt6AD4A4O1AAA8tarq16v/768InPruWZ9gZv/dj3
	IQYk2VochmTzi+1FgsJdH9p2QAM2UXddhEMyU5q01SlXRwdjTK/UsZsq6gz5jWBL4eehz3dWCXh
	cfhSZ8xVzqPSp1zjRL2xUJtDsZaiW0YpBnjV+iIR+rwQ==
X-Gm-Gg: AYBFou0m/OEPHKHBKIYI7+O5RZzKNvMZbVBzAQFbS53BVnGHC4wCR1FEzpUT30tMwd4
	+rRqCN5KSrql5e4URW4HC51ETR5i7J08oOffw3FTRX6G62D5mdgYQBSJvOZQ0Bd0vci9+1QLWZK
	TiqmL3Gzx8vdGqcXjkZAts7gQZmnaFmdraU/v2KlYmVeXbnTq0LF9X4maLOQ==
X-Received: by 2002:a05:6a21:3a44:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3dd5f7adaa6mr5895944637.24.1789558487191;
        Wed, 16 Sep 2026 04:34:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a44:b0:3d3:ae50:97cb with SMTP id
 adf61e73a8af0-3dd5f7adaa6mr5895856637.24.1789558486699; Wed, 16 Sep 2026
 04:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829195105.4173953-1-joshua.yeong@starfivetech.com>
In-Reply-To: <20260829195105.4173953-1-joshua.yeong@starfivetech.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:34:34 +0200
X-Gm-Features: AcwNN1WUIqVDgUhzyDXl1QcU9iqF_p0H7ZnHb6m--NRBgYnIObrjnuaLwlOazm8
Message-ID: <CAPx+jO_Wk6ksDLHfxP3oJ0m8qBY2+2qR_rPSH67MFDU6y-ANXw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Honour pd_ignore_unused in the sync_state power-off
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hiago De Franco <hiago.franco@toradex.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa7ed7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Bq6zwJu1AAAA:8 a=p6MmSexonW_CJjBW_Y8A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1NCBTYWx0ZWRfX6njBk18tj7Zh
 gFC0RZzehJkvvub6KdmSnoCu4hrjPK9/LtwF6e+daBdkwjbpHobT9e/8xaQ7QUtXQoPqq8b73Am
 Jpt3kbADaEDXB8ePZDibnmeuwSyBTBcv03PoGZImrOpu/frhrdvn26PTe1TSKy1vkdwAYUklr3S
 Sl3eQHeF93nWkpsCyaSb/IVfGARGvR98uewpyi5GKmDWFnq0DoSRYMNid0KWD0pNZooxvlzzI4y
 sREUo9HoPjHwuN5kvtWXGM04HZquwDKe0sP87T3VDU/UjEpB3ziuGH4/CEY325AHtKad2UdaCvS
 aHBrz8H9nuy50s1rmOShfkZTK0Z8xZHnHo63AZFpzPiZ2UdVLqgnFFzdvSNO44h5g59KIpCKyKf
 LVzzLhLmiqOSb6A/iT1zrdTntAog/e11wxxlRl5RiLPzmkwf8M26IWo7fXnkqBhKYgDvQM9XxBZ
 sOHma+Cqc/J2njruavw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1NCBTYWx0ZWRfXx6fyAdZYEPbu
 4Cfe8hhRFDoc7hDaj187AfMquG5TzWr/mUhKHtv/+heIXv4BvpLV+CI63e2nRluVOc+I+UV6gmk
 nJJ0A7Ai1WFCOHPIiGjLhGsvn6VqCYc=
X-Proofpoint-GUID: Cy-cavMEM4HUl2zDxSP69Z8WekgQFOcJ
X-Proofpoint-ORIG-GUID: Cy-cavMEM4HUl2zDxSP69Z8WekgQFOcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160154

On Sat, Aug 29, 2026 at 9:51=E2=80=AFPM Joshua Yeong
<joshua.yeong@starfivetech.com> wrote:
>
> The pd_ignore_unused command line option is documented to "keep all
> power-domains already enabled by bootloader on, even if no driver has
> claimed them". On an OF platform it no longer does.
>
> Powering off unclaimed PM domains used to be the job of
> genpd_power_off_unused(), which bails out on the option.
> Commit 002ebddd695a ("pmdomain: core: Restore behaviour for disabling
> unused PM domains") stopped that late_initcall_sync from clearing
> stay_on, so it can no longer power off a PM domain that was found
> powered-on at initialization. The only remaining path that clears
> stay_on is ->sync_state(), and it never looked at the option, so an
> unclaimed PM domain that the bootloader left on is powered off there
> regardless.
>
> Honour the option in the sync_state paths, for the PM domains that have
> no consumer attached. Those are the ones the option describes, and once
> genpd_power_off_unused() has bailed out they have no other power-off
> trigger, so they stay on as documented.

The problem with this is that we have child domains too. A child
domain may be the only consumer of a parent domain, but not
necessarily having a corresponding device attached to it.

That means that we may leave parent domains powered on, while they
should not. Maybe not the end of the world, but it's not consistent
behaviour.

>
> The stay_on constraint is dropped either way, leaving the lifetime of
> the constraint unchanged. The PM domains that do have a consumer
> attached therefore stay under the control of runtime PM, which the
> option has never covered, and a PM domain that gains a consumer after
> ->sync_state() is not left pinned.
>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sy=
nc_state")
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>

If this is solely about bring up, I wonder if an option could be to
add a device node in DT that acts as a consumer of the power-domain(s)
in question.

In this way, as there is no corresponding driver being probed for the
consumer, the ->sync_state() callback for the corresponding genpds
will not be invoked. Then, step-by-step one can then remove consumers
of the power-domain(s).

Kind regards
Uffe

> ---
>  drivers/pmdomain/core.c | 36 ++++++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290..c49d13b3068d 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3673,6 +3673,29 @@ int of_genpd_parse_idle_states(struct device_node =
*dn,
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
>
> +/*
> + * Drop the stay-on constraint that kept a genpd, found powered-on at
> + * initialization, from being powered-off during boot, then try a power-=
off.
> + *
> + * The pd_ignore_unused command line option asks for PM domains that no =
driver
> + * has claimed to be left on, so skip the power-off for those. Such a PM=
 domain
> + * has no other power-off trigger either, as genpd_power_off_unused() ba=
ils out
> + * on the same option.
> + *
> + * The constraint itself is always dropped, so that the PM domains that =
do have
> + * a consumer attached stay under the control of runtime PM - the option=
 has
> + * never covered those - and so that a PM domain gaining a consumer afte=
r this
> + * point is not left pinned.
> + */
> +static void genpd_sync_state_power_off(struct generic_pm_domain *genpd)
> +{
> +       genpd_lock(genpd);
> +       genpd->stay_on =3D false;
> +       if (!pd_ignore_unused || genpd->device_count)
> +               genpd_power_off(genpd, false, 0);
> +       genpd_unlock(genpd);
> +}
> +
>  /**
>   * of_genpd_sync_state() - A common sync_state function for genpd provid=
ers
>   * @np: The device node the genpd provider is associated with.
> @@ -3690,12 +3713,8 @@ void of_genpd_sync_state(struct device_node *np)
>
>         mutex_lock(&gpd_list_lock);
>         list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> -               if (genpd->provider =3D=3D of_fwnode_handle(np)) {
> -                       genpd_lock(genpd);
> -                       genpd->stay_on =3D false;
> -                       genpd_power_off(genpd, false, 0);
> -                       genpd_unlock(genpd);
> -               }
> +               if (genpd->provider =3D=3D of_fwnode_handle(np))
> +                       genpd_sync_state_power_off(genpd);
>         }
>         mutex_unlock(&gpd_list_lock);
>  }
> @@ -3719,10 +3738,7 @@ static void genpd_provider_sync_state(struct devic=
e *dev)
>                 break;
>
>         case GENPD_SYNC_STATE_SIMPLE:
> -               genpd_lock(genpd);
> -               genpd->stay_on =3D false;
> -               genpd_power_off(genpd, false, 0);
> -               genpd_unlock(genpd);
> +               genpd_sync_state_power_off(genpd);
>                 break;
>
>         default:
> --
> 2.43.0
>
