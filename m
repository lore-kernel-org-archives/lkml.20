Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B3F4A13A4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956837; cv=pass; b=Wl6Ee8xItD3NzncmyLzZpBvS03Wt9ky1EmckkvrUI8fKKA2CkEeMiQBAQN5MeslP2cNoqF+E4mJOB5CqVBVuIQzAaA9ouby2gM4wVd9HWLuOp90Fw2lXsIkp1ZfiEm7ep0ssBA9lWbtaDJRQnyaKMpq9lfX2J03OVLMSpePPZus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956837; c=relaxed/simple;
	bh=BR5LtnGdokv96N++opizZQCJinG0uSfFlTai0D8W51g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myw367SPnZ0Nhlde8ew9MdnsYk5aDm87nk4SWILNhyc7asprIMKlFxrobszcVtfnxtvccBRjjAZKa4nmwvnMgL+gjXQdujUpkIDX7Nll/3iwzwumxLMyKJZtiUhldSP+TE+1mFsX3/gI3SdTbjlvJL+eXXYT+5qr3yQtsKru3a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcJab6co; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITBRZG7h; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcJab6co";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITBRZG7h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUQVc2376525
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w6POWvgl6bcpUotGMBVj2eKP541dNH6aQD7LuDR78bU=; b=lcJab6coVAMK7c5L
	o6qQ9KLWXuJv7EFl988FHcoPw2ICpn1Y+3wOdy668RrsIQcN+wWu4QhnbJ/fsgbg
	nZU5HPNpQ3HzrEgzPOA0zOOjqa4p3Cxne5y23uj5en8qQAtLNk6NTRJTzTdW+LfY
	HWrlAlWQUfZb8CCWN+6+XjK7nPVbKcI+Y1Lhl6xawjNZan164FstDoOmCa8zQi5I
	Sng8kUydP/hl4j3jJcIwxj9b8u23RGFo+8bNdhxuWcagDQiws0EFKSpHEmtjeA1J
	A8KrDfPP4xPT75qg+2QrQcNkdhocUgn2nTbJg0DzwUxG3GYxporvh4kjCBjoSoQt
	wIPLDw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru0d7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:27:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd03492f9fso6085105ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788956834; cv=none;
        d=google.com; s=arc-20260327;
        b=lSc5z22Uxq4vJ5bxkEOqM7yrNy2zQmG0UsvR8Ds3vf3foQlK/SJMJMIAcBfQArTFG9
         bgbmzZtRYjoTIhcmdbnUNaSc9Pw4zh3DSU8LXNTTKyrZQdiUTzh0QbLrT7CBplfFfx4s
         BvDVS5izMc5GcjP7MqqPnNRH+ZAFmO4evR6a/SLSyUCMGd+SUUlvJrMttFXkaMWUbvea
         gt5AKEiAcHsWhykG856h/Un6nW2/94YMbU5SK4z9qKSYkw9WPpR2KSAPZlLdiQcqtUQd
         c6gan/o3n/jIjJ8S+0oq2q0SGuH7ZHpWoKfcJdWXnR4s0YA5VteymaHrpOorwTCgFuBd
         iXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w6POWvgl6bcpUotGMBVj2eKP541dNH6aQD7LuDR78bU=;
        fh=1SfKBh4aXpzqtmoE3RuaNkjzreeqiIPzufxqEvD7AqQ=;
        b=c3/2krmA1AmuoqJ0V6Znl6mbT//rj0VgUWryGZLuwy4RVkefDJ13ge5fOU4Hop2w7C
         asVTWOcIes2YFXwUjGiTnM/kTr41JpdVM8wrphXFDLzT/Fe4PPiDNMKTRKwRRCgDR0Uk
         tDWGQYR2NSv/nYSW4YPP36tXkUUUk0PIGGlDgarCzat7c7GyKL2wMewzr29YW7YCbnDi
         KIVEd6OdXHIwG5K4jDT2k+WWaboZOg4ZSzjdLinEwazqzQncS7jnRqL9d3M0i2Wu6B7A
         wZ9ihWHv+dJ+AwgaTWRv82i7x6ON/L9nYkgStowzVW+f1dJSYpcXESm9k27m5DtqDl0L
         HaKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956834; x=1789561634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w6POWvgl6bcpUotGMBVj2eKP541dNH6aQD7LuDR78bU=;
        b=ITBRZG7hnnhbqOeXFjh9NEW2IKAfrshKRRwIFmBo8nM8de0WUBOLeP+i3KKaHLYTyt
         FpQROQ6DUVj5hD2cqpZUUYATV9gPSdTuEMbzSJuoqZEGwYtCqSFgKKHRV7mIQmpGsV57
         DYLEEXMTa1dC6o2n8qFThZGh2OtRJc1kPuZCSc4WfdzPZcfmWKq3kRcIYImHbObRpHcy
         K/mrIfBRWlRIN2fTdtUawKnnHpblJmczfUV+qVkV+7FYnW+8JaSdrmxs6dFR7QSvnQaF
         b1EeFtSq/GorT5e+qfiveh2mvQe6XdXA4zCpUxNw0ytdakRzfBIcJjuDqqpXlHbQ7gi3
         c1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956834; x=1789561634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6POWvgl6bcpUotGMBVj2eKP541dNH6aQD7LuDR78bU=;
        b=riokvv2Y/BXYEP/mf8NPDsScpPbiRRvE+Y53nqOnaiMi07lcGNjF1FopDEklghdC5r
         ePFEAXvgutK8TkpKPE7jpj4BxFHffhL0btEXTUlAbPTvp8KdEh4wQM4lEJqAM1XeU908
         Cna7eV7Ai02P2MDvcANZ+lKH4C2RrB8ZQOYAA32DtE7KxH2BN8Qb2TDmaxAHMA7AHkZa
         q1jI2Ntv0MosqPTuI4Y3v8f4tk+9fuaVY6LJzPADqxC8JsqGsn1gFyVvjZk2bKYF0gSJ
         2xwK4wUuL/GSpXeW1sJPVDyJ9y9l/8V9fQ+S09LoJoO/coJe7drNhhzJ6OhHUlm65YF2
         EKpw==
X-Forwarded-Encrypted: i=1; AKwUvBzpLYFPQqenUJkhi5nOa6ew4//3vzHSZbPjiGTB4/7p9wKLCdwgap0may+9RIqy7Gi0t0TR23c/nbfiFME=@vger.kernel.org
X-Gm-Message-State: AFuF++l00bIS8+dAJ1qJgGmWyxGdDgdBlL6fGBT8ZFDM6GOHLxOMl1tt
	lewEs/lRmBdt0KfoctyPQQxFwgZK9+SePkRqqRezADMlaS4/tWPEGVrc2EI/4JcbpI/373ppnms
	VrdPqt75dzg8EvztmC+F5qWUuXiOtpDJOIjfRqCNQ0k+MNVJnSwLBaO14VWVgXdT0/KgfYdJJbW
	qpqphklLiJjrlspN+YjYymk6iKEF8tVuklTOe9kqpYCw==
X-Gm-Gg: AYBFou0oZxqWnW0jt7C2GMYEejLnVjGX5h08Vyr1rZuXKTsZnaoGSLWCWMONvuK11zQ
	z3aeUe839Cb91Timah/aUa7cEleNdNkaGQohg93yeL1b9TLU54os5j1pxKXFzZr/6lVimi/NPO9
	jPW3EinNCDlAGI40ETjn7glZ3fdDrxUB7VtqNuy2AR/Y7An+iPzM5BWto+2A==
X-Received: by 2002:a17:903:ac6:b0:2da:e634:370e with SMTP id d9443c01a7336-2db125ca3e8mr496798595ad.14.1788956831948;
        Wed, 09 Sep 2026 05:27:11 -0700 (PDT)
X-Received: by 2002:a17:903:ac6:b0:2da:e634:370e with SMTP id
 d9443c01a7336-2db125ca3e8mr496797985ad.14.1788956831402; Wed, 09 Sep 2026
 05:27:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <90559C11-0553-488B-B3EE-DE769D61847E@stasiak.at>
In-Reply-To: <90559C11-0553-488B-B3EE-DE769D61847E@stasiak.at>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:27:00 +0200
X-Gm-Features: AcwNN1XXIeyHzosNeIdvMKUaR-ibE5S1SqUytt2CkbtmSqypwu3GXPxXdP9yIww
Message-ID: <CAPx+jO938WKsjQcjhvY_9pyKQLAL0f-oNFUiudt+pxDHHaoRPA@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Sanitize CID product names
To: Jakub Stasiak <jakub@stasiak.at>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa150a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=gCbLCUlJNUJLTi60VrAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: iBMPQNTGmrQUnomiIhsO6zUjCexPPcIH
X-Proofpoint-ORIG-GUID: iBMPQNTGmrQUnomiIhsO6zUjCexPPcIH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfX8j9I2t6nVe19
 +eV5qK1t7Jrv/a17TkBWp7XSEJ4Um41uddqNC9u8S5hKsCKuk4G2QTljJ6sRD8o1ZH3GMswR1Hh
 B/zpxsMRIuwmkaShFjWD/pxFX4x1UoQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfX2GITk+mQ5gIh
 jpJyd6QhJegkkz/xftTyUW+b488bk8r9JujyPHpal1BR0aKoauu5HJ7hwjZO1LmpFb46TKJepMj
 Qi3Ht74V2+pL7lyxGmefzdfBQAJjhxxdnv9pajDibmLJ0qTBgjrONTCTf3dUVQPJb/3XHTwOQHn
 GbFtIswfz2qNlR6KWHg6j+Wia0/oZzOvDq2Wl9T7ZpA2MueRdsYWO7b+x+2Sd5NOqU9KrHpMYQJ
 W+STygM6pGziMAlykdyhSj5oiA/mJ+3DEPONCTfp62K3r3XlXPw1k7UpW+DUjXp/sO+3OvuMgch
 C3DN1eYPBdWRqqLlxtHlA8YRsq31a8XOKZGbuorQtFn8aNldLKX4T3H9rT27N3SGS37YZzM9fd8
 C2tFGcNVWzsT4utmgN8UqGOV42agPnihiBkzbIbtvMIdSB1Gc97hVyQ3iRmR82lcDgSE7JNdyTx
 GEl5oCKiPO07PH/WiZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090138

On Sun, Aug 23, 2026 at 3:22=E2=80=AFAM Jakub Stasiak <jakub@stasiak.at> wr=
ote:
>
> Some devices return nonprintable or non-ASCII bytes in CID product
> names. One example device reports H8G4a followed by 0x92.
>
> This led to downstream problems like in pyparted[1] or systemd[2] where
> the consumers assumed the names were effectively ASCII-like.
>
> Commit 3b791214c8bc ("mmc: core: Trim trailing whitespace from card
> product names") established parse time normalization for CID names.
> Extend that normalization by replacing bytes outside printable ASCII
> with a question mark after the existing whitespace trimming.
>
> The raw CID remains untouched. This patch doesn't change the lengths of
> the sanitized names.
>
> [1] https://github.com/dcantrell/pyparted/issues/76 (already fixed)
> [2] https://github.com/systemd/systemd/issues/42930
>
> Assisted-by: Codex:GPT-5
> Signed-off-by: Jakub Stasiak <jakub@stasiak.at>
> ---
>  drivers/mmc/core/core.c | 21 +++++++++++++++++++++
>  drivers/mmc/core/core.h |  1 +

I would rather see that the new helper function gets declared in
mmc_ops.h and implemented in mmc_ops.c.

>  drivers/mmc/core/mmc.c  |  3 +--
>  drivers/mmc/core/sd.c   |  3 +--
>  4 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 29e80e5f928e..0de2a0133f13 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -8,6 +8,7 @@
>   *  MMCv4 support Copyright (C) 2006 Philip Langdale, All Rights Reserve=
d.
>   */
>  #include <linux/module.h>
> +#include <linux/ctype.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/completion.h>
> @@ -23,6 +24,7 @@
>  #include <linux/fault-inject.h>
>  #include <linux/random.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/of.h>
>
>  #include <linux/mmc/card.h>
> @@ -52,6 +54,25 @@
>
>  static const unsigned freqs[] =3D { 400000, 300000, 200000, 100000 };
>
> +/**
> + * mmc_sanitize_cid_name() - sanitize a CID product name in place
> + * @name: NUL-terminated CID product name to sanitize
> + *
> + * Trim trailing whitespace and replace bytes outside printable ASCII wi=
th '?'.
> + */
> +void mmc_sanitize_cid_name(char *name)

Nitpick.

We have an eMMC command called "sanitize", which makes me think we
should find another name for this function, to avoid confusion.

Perhaps just mmc_cleanup_string() or if you can find something even better.

> +{
> +       char *p;
> +
> +       /* some product names may include trailing whitespace */
> +       strim(name);
> +
> +       /* Keep product names safe for sysfs and uevent consumers. */
> +       for (p =3D name; *p; p++)
> +               if (!isascii(*p) || !isprint(*p))
> +                       *p =3D '?';
> +}
> +
>  /*
>   * Enabling software CRCs on the data blocks can be a significant (30%)
>   * performance cost, and for other reasons may not always be desired.
> diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> index a028b48be164..0ec5ad66fb7c 100644
> --- a/drivers/mmc/core/core.h
> +++ b/drivers/mmc/core/core.h
> @@ -41,6 +41,7 @@ struct device_node *mmc_of_find_child_device(struct mmc=
_host *host,
>                 unsigned func_num);
>
>  void mmc_init_erase(struct mmc_card *card);
> +void mmc_sanitize_cid_name(char *name);
>
>  void mmc_set_chip_select(struct mmc_host *host, int mode);
>  void mmc_set_clock(struct mmc_host *host, unsigned int hz);
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 05444ecf3909..dca76be9f0dd 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -117,8 +117,7 @@ static int mmc_decode_cid(struct mmc_card *card)
>                 return -EINVAL;
>         }
>
> -       /* some product names include trailing whitespace */
> -       strim(card->cid.prod_name);
> +       mmc_sanitize_cid_name(card->cid.prod_name);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
> index c763efb10f64..7dc2b791f44c 100644
> --- a/drivers/mmc/core/sd.c
> +++ b/drivers/mmc/core/sd.c
> @@ -97,8 +97,7 @@ void mmc_decode_cid(struct mmc_card *card)
>
>         card->cid.year +=3D 2000; /* SD cards year offset */
>
> -       /* some product names may include trailing whitespace */
> -       strim(card->cid.prod_name);
> +       mmc_sanitize_cid_name(card->cid.prod_name);
>  }
>
>  /*
> --
> 2.55.0
>

Kind regards
Uffe
