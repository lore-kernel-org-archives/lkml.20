Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ADA3EC6B3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083444; cv=pass; b=RYKF9dBCQ7wikvG9aotLzo4fIRtGd9EPv35fb2CJQSgXXlsdzBkMNvY5tdDSQx8CR1qkLVvDoYGSiT5Kc+T4kxYSQXGmRe9sR6jNpjB6FNadjEnmqfnT1SBlWQ2Kq4FKR5mMgHRUb1KvvL6c8RiIQE9/qyl5ob6VYiYKO5evqKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083444; c=relaxed/simple;
	bh=Wcbn2GcvtLQUEORhzyW6dd22VWzNNL8fogxMLhwJTug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pw2bUHsmIxSNFacdwAQIUUgTXukCkvoUFlR3mjR0Lg1yvQumiGRcDoGEpZV1dOAhVdjjGnaixJyCAFmgRleCY89dhi8p/uKMXxDnmObeBNjhxFNcMU8Mnm2PH3hdB0M6f1XxaEnQKvWnDVQu5khBQTObZe5V0h+80Sto3VNLLmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br+RCbLR; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br+RCbLR"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab38a051aaso47914517b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792083433; cv=none;
        d=google.com; s=arc-20260327;
        b=i0raCQP7ATzHMqr1KC/p42i/XpYlFp0rtwWDOZA5mx+upEvr7JjLjKp5p6D8McgMWj
         zpUvFRwevuyCc55M99Rrba74dBLdzkWPNwLn6v5/3ICjwVTBSMiLpSPhwKGHbHTxkDFk
         VzBRaLcRPMPHVgBju24sdVAxHA76syW5lBSd9E2bj1w+aUSX11PaXXQhChXcvbH1vjVr
         KIZ7EA370WgGmNiAbaCJ1zrlrT7oxC6Y6akeu5oTo/nRvuRznvE6hQSLWSw4Knh7EUT3
         Ln5BDLjgmkcj6FPYcFkA6HEKREQDsbZVVSTQK4lB5xI/PTMDvMkHy3LTygWtjCLycCtA
         tPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        fh=Wk79VkZ8MmmZgbPvqPSVW2fvk2zu78l8WHpJet3LoWk=;
        b=ZVripFGSmbheP6t1q6lCYwCctyXpvemqFrDIRkzFSBKqGU4mzDg/tCiohUiQeZJz8o
         slsUXXNHSh12J+GWQo1bWdNImFOynFgZb3CP3exLV4w6i+f1r+uOwxZrD5VPlkfpJJiu
         ypvEWKyacu3Jxptgudtnt2yRBAJFTp1DMtraIZ32v0yiKI2dENhSr83E/n6PQqKF0Pez
         Ia0faEEcLmJqy1Zs3dWD+jfSFyiPLMHr12cT8qb7TL9Z5ehNyqsydWMBq6e7ebOnwk/d
         yLhDcFpcO9SHZrEI47ZCLgn8EXHdSvXw5w1gKVehuvMTkMElm16StLGab+yLGV0+INyn
         NDNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792083433; x=1792688233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        b=Br+RCbLR/6rPCXJJg4Oo88Zqq8MXiDJVoz2Ueqs5o4orhvEftl2XOsWOQKNpH3NPhs
         mDI4hXSKyiKvNJoFIRtL1exi2pqxKZ5fsSiN1hn/La4gzq/sKV/H8q31Dle0FIYlnrhI
         vwwdiTy8pOze5g/73tJWlCBuB3nObg4CN8byXxh+YH2Zy/d2EkDWYbPisLVLggRJuZy4
         jYQyTfH9w5HiFTZulDhkbmy7Ghw2IEzRrZhOJBiejB9S7lC3O9A36CWEIOFULKu6QmkG
         UbKyRTbAHEcB/K+kBqmcCKmGtKhrArb/X1FPtORMf5P/ThH4/gsAjzmQMOtSZe5JfBLi
         R2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083433; x=1792688233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        b=YbCp8CGnrhmzdGr9BgvxUQHW77mGNOrb3716EUZEt1+q27ElmpyaNvIM9yVOg/mbSD
         PhOsNL6Wx0VWteihCZ+xA5d5AzjjzW89qKzXgpknjum8+Zu1FjuDqqM/ur2nT5ruHY2n
         VJgEdZ/4L+PWMtxXxQFbPv33CmJ4V5MD4fM6ao41eFUYKfX/3PwQWHew+9893xwaKHzV
         usY7Ubx5NzW2IZ+ojMeM5M2ZTfH4sQXPRGCcbEy6HxJjr5+RJt2nHXLcOwJqsfsnBdyR
         z83tuF2fCvRWeqx2NdIP6ahu1JpCp1ZVv38NQlSYiO7lRVaUXPbRcNYSzEINFxpqn/cQ
         RtDA==
X-Forwarded-Encrypted: i=1; AKwUvBzRstFA5Y5VshuXiorllRI0tSuM1ZXWwgUY6XbDsj4FM1rtKlX0377Rn6gc2b2Vd6pX5eyekbdC04UnWpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoFovJigAYKYPTPX3peqi+sQHQXrP8/Jn10e9BcQDRZ08HwXMo
	3ZpGhpPnzyl+FuGn6L2fqUjY33K22GFqVM8bo0Ot7hK+634+xwB1VUkb20zA0djTH9v6WSX2WsY
	c+XJIpHdYcab1hE7jGJjUuzg842dhtVo=
X-Gm-Gg: AYBFou02Az19bMxBN3IPqqpwIAfM5wQn2uIBqcvNGlMSmFLuyvEBxCxlH66uT9fRFlg
	6k2HXWgu3ORO9LxiV/sCBMlP7Cq/YvR9NzUj2/15200Kb6Ddsgl+eao3gyoQzBlFKmSgpVTZU8c
	+11Ijvc6m1g55vqkRyBwvfJ0C4X3r6W4UH2MaGFgeSdybMmzFOR9W0FWXV8bkAHKMx+Ipo93mfp
	olEE4p6OQ+Up4ut3Nht1/xtc2iiuU8sMvygXko3sYwP7InE1cg5u/627zghTkCQTeilQKSKwjoK
	X47bEuUEXHTeFHmBqKl0CReug6hP8Y9L7OcFrrDvrXQptaLuYBNSZUoM
X-Received: by 2002:a05:690c:fd1:b0:8b0:dc44:9258 with SMTP id
 00721157ae682-8b0dc44944amr6439537b3.10.1792083432951; Thu, 15 Oct 2026
 09:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org> <20261008-04-k3-clk-pm-aux-v1-1-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-1-8372d7307694@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 18:57:00 +0200
X-Gm-Features: AclHuK_UaTV6-y66kPO6og4udDg5dfC89mcLvyhiRip0upObtlxnkinWliLQi1M
Message-ID: <CABdCQ=P3bTmc=DX9zG6ELV=zsTmzDFsZyWhLCWnSwSeHP101og@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: spacemit: rename to generic ccu aux register function
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Alex Elder <elder@riscstar.com>, 
	Icenowy Zheng <uwu@icenowy.me>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested on OrangePi RV2.

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El jue, 8 oct 2026 a las 4:58, Yixun Lan (<dlan@kernel.org>) escribi=C3=B3:
>
> The APMU (Application Subsystem Power Management Unit) register region
> block not only provides clock and reset support, but also the pm domain
> management capabilities, so function of aux registration is being renamed
> to a more generic one, in order to prepare for future addition of pm
> domain driver.
>
> No functional change is introduced therefore.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu_common.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu=
_common.c
> index 8696bb9cba2d..56f3d081857e 100644
> --- a/drivers/clk/spacemit/ccu_common.c
> +++ b/drivers/clk/spacemit/ccu_common.c
> @@ -79,16 +79,16 @@ static void spacemit_adev_unregister(void *data)
>         auxiliary_device_uninit(adev);
>  }
>
> -static int spacemit_ccu_reset_register(struct device *dev,
> +static int spacemit_ccu_aux_register(struct device *dev,
>                                        struct regmap *regmap,
> -                                      const char *reset_name)
> +                                      const char *name)
>  {
>         struct spacemit_ccu_adev *cadev;
>         struct auxiliary_device *adev;
>         int ret;
>
> -       /* Nothing to do if the CCU does not implement a reset controller=
 */
> -       if (!reset_name)
> +       /* Nothing to do if the CCU does not implement a reset/pm control=
ler */
> +       if (!name)
>                 return 0;
>
>         cadev =3D kzalloc_obj(*cadev);
> @@ -98,7 +98,7 @@ static int spacemit_ccu_reset_register(struct device *d=
ev,
>         cadev->regmap =3D regmap;
>
>         adev =3D &cadev->adev;
> -       adev->name =3D reset_name;
> +       adev->name =3D name;
>         adev->dev.parent =3D dev;
>         adev->dev.release =3D spacemit_cadev_release;
>         adev->dev.of_node =3D dev->of_node;
> @@ -165,7 +165,7 @@ int spacemit_ccu_probe(struct platform_device *pdev, =
const char *compat)
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to register clocks=
\n");
>
> -       ret =3D spacemit_ccu_reset_register(dev, base_regmap, data->reset=
_name);
> +       ret =3D spacemit_ccu_aux_register(dev, base_regmap, data->reset_n=
ame);
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to register resets=
\n");
>
>
> --
> 2.56.0
>
