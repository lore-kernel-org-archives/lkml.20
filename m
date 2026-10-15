Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8546F563295
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085907; cv=pass; b=B0O9ClxcJ+q+/7EVFNH42FZswSW1R8pEE/xnf4Ko0P9T2FHPw/ELRm1e1Kj4My0R4wOqIECtgkCg4uuR/ZeI+qxADE4VHXlL2Icf9hXHM5OyBFMH1WMcrSDl5Wrx3k5RVoAphO4moqFE6IIthD5h60QlwszQo4eEnY5CEuhxaNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085907; c=relaxed/simple;
	bh=bkxFv5PX8ujIxdonqIilaYDobdJDnLk8tXzGrWmcSt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XG/FDFRl8Q710YDlm49HBRt1oQen5nnwq3frgY29xsGyDulFSDJ3IpNDAc2xPZTNrFEddJuU6VooX8vBo1jbGZU5mg1h7AixvqsLx0c+/zkXMz6uEEkK005+UlAdeEaMwMKjl37YgVwGwfI83xefLiqiYm9FsG7Nxb51x5VGIGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdY0tTI6; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdY0tTI6"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6740e7ae219so4652564d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085897; cv=none;
        d=google.com; s=arc-20260327;
        b=BgUR9fZof/K8BfE10EuRA/UncuF5l2vlf2jiKiCirkDA2RLcL29iku6Idb1uzzcAAd
         g8A+KvYYHBhu9UIA15yYoH07iqjyG0BaTWe2vgRki8+RE/DxWU9tO3t47CTwFHPGDPsY
         myHlZUxRL9jhnM96edMWQqrQdGCVV9ajLYEKnQ0+1W+UgRaEVNHIZBT3hWMZ7wdw7O+P
         v1aeOtdmEWod3WDEJevf6hiGsTrJCfcAcz/J3eAo3RnChhi6DN6ww+CNmZiDzWz8cZj2
         AglWqmKr0/3IFLeWPRePTFAi8s1hp6B/lxNwhUot3vx9PE+1+E1P7p7NYDJxglRxsM6P
         9dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        fh=4LgpXSC+BSlWgxAzPIwmTaLPL+VrUJPGGC8vXhD2a3o=;
        b=h+RpSuf/w7bWwB/SVNJ6A4hI4pAjFK3BYpjK7KnAhgC6C9ctsnF0QTutOMigbyvncM
         1fLnfAE7mRIa5YlloM+jkczNlGDLtkolUh0r6OHHQLvjGxMPqtCmgXQFp+71uvx849zZ
         HD4LBSqP/KZ925Gi3GtGQ7u6IaC1WyL8eoqRW+r0c3ObzpN+ibY1YQJ6g5mX2MudjaR0
         UPIQJWGc8ounubIY95Xhv0Falthts/srWPNMWldZQOhH5pD76PzdtVGhrsOXcuRMnmfH
         1c/oZXdHw6wA2SnTAR4D4fJBMmTFtIJlTpMDJRmkgg5K3PKckvTV3JhN04erv1sSSDRf
         iKhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085897; x=1792690697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        b=FdY0tTI65LLFbSDM/PkmptpQRO/LkHkyKCAY9mHUMFpQa/S6Ox3Yk0ohOXs6nYBv7a
         LSgYooxuKothhty/g1dDYggLu2Iwfl4MufA0UGt+NuH52fQdUvPhJviJnAKKXCVlE6FK
         MXueZ5y8g6dGvYt+I1JZLjj4anjvLk9Y+v2jV6gHpQyvX+pVyu/UGw5m4vSBhwwXqpDu
         7+6Y+OAd4F1e3qja7s14n57vtS3/yjc6Fn7Y5Nl63xNcVLEDjC/ulSeHQXea0Y4wBzPn
         xC7EeuMmbwSbY1P8cq6KORdYHXYDpN/iil6Mj8ehEULWWhpE+ehGB0H35YSm1NC8cyKD
         48ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085897; x=1792690697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        b=MF3cvj0q+1/GfADfq+IOJyt7RYe6hSlKUwgD6Ad9GWIP6q4zO2L+VmmQV7NJfu53KC
         7R8PAKpB4XQoPr5bDKhgtjemtnyG/iMpfKp3f5uwrn4fvppigUol33YtM4D4Eor4Kiy7
         Qs0wTs2LRNgXOTxYP1wGwyV6Xij1/HE9SDSSejSAI2RuxwPI7mpitJFnpHqfTabA1KcJ
         Ms0FRjFZREC2ZvATKjfHIEWvzFm/Iz2n5wep2pPYa2pZnqMICKvv42JmA9bY96SDdR2A
         ZmoWiPY9CNM58OigX0nDRpiyC/Bw4AcINzcA/wtwxMUCcSzwfIFkIdwkVAS1LLXV5Tjo
         /PLA==
X-Forwarded-Encrypted: i=1; AKwUvBw5Bifhvn/HonB79FA10WZKokU78jJskgeIWOSCVmPfAkbvuJQpnMhmXNyPdmQ4fdsLAgyoiHrYh7hjNK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJM5t49OMWl8Vx1YVULogKS4hGPX360G1/h0XSzbqUkJJ69Czg
	5X7RgMHwVfvI+VeT0/SFxU8iOyZTuifGJwNiPi2P1L3FokrtBW0AG9jrDkdUPgCGqP4/ux5TLqC
	FET0M6NCDtWepNuFVJ5uU3A4lk2REAJ8=
X-Gm-Gg: AYBFou2yJc99b6OKzyJzo5ADQ1sygF5rnDvX1Bydy54XQWTpObFx19eia0l6cFMcj3g
	QyYvXNf1SrELi/kp3VFLhT8RJGN3weIL9Bzbt7JqoGUFcL8hqfhKY83c3hqWymX7pAaf0jDAPHq
	vio6Gcot6r1kJ9yz3/OxxOjOGvx4+VJeOIs6/nw06SfZQVVa3+7UfH5nV9Go8T9kM5UsXBdiSFI
	ltIH/gYwTIX5BeCl/DqIl704AWzrcaQQocrUj85zfaTyaMkGQ0wj/9SLu+35Po2taldxJWLKjhk
	YFgJXYcrHYJ2/Z0WRvnY3uNguXzFAYTv4C7LkjLDNaMze8pd9fv3WNsDUf2r/V9tfnk=
X-Received: by 2002:a05:690e:1c07:b0:679:aa90:d272 with SMTP id
 956f58d0204a3-679aa90dd58mr432536d50.108.1792085897078; Thu, 15 Oct 2026
 10:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org> <20261008-04-k3-pm-support-v2-2-6f778a53dd2d@kernel.org>
In-Reply-To: <20261008-04-k3-pm-support-v2-2-6f778a53dd2d@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 19:38:00 +0200
X-Gm-Features: AclHuK-mkmvLNzpAloyGNWEU1xEwlRugYfUHBOpsjJVuzj_o9PRbUr7KYWotes8
Message-ID: <CABdCQ=PAHxwH1+1OkLiW2ad+PTxNY6OmmPwOwAR3EoDe6Mt7Zg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El jue, 8 oct 2026 a las 5:45, Yixun Lan (<dlan@kernel.org>) escribi=C3=B3:
>
>   SpacemiT's PMU (Power Management Unit) consist of several power domains
> which can be managed independently, depending on different application
> scenario, each domain can be powered on/off for saving power.

Tested on an OrangePi RV2 with the PowerVR GPU power domain. A few
comments below.

> +struct spacemit_pm_domain_param {
> +       int reg_pwr_ctrl;
> +       int bit_hw_mode;
> +       int bit_sleep2;
> +       int bit_sleep1;
> +       int bit_isolation;
> +       int bit_auto_pwr_on;
> +       int bit_hw_pwr_stat;
> +       int bit_pwr_stat;
> +       int use_hw;

bit_* fields hold values 0-15, u8 would be more precise than an int.
Similarly, reg_pwr_ctrl fits in u16 and use_hw could be bool.

> +static int spacemit_pd_power_on(struct generic_pm_domain *domain)
> ...
> +               dev_err(&domain->dev, "power-on domain: %d, error\n", spd=
->pm_index);

You could include the domain name failing, that would help identify
what's causing the problem. You are already including the name in the
"power-off" error message.

> +static int spacemit_pm_domain_probe(struct auxiliary_device *adev,
> +                                   const struct auxiliary_device_id *id)
> ...
> +       pmu->genpd_data.domains     =3D (struct generic_pm_domain **)pmu-=
>domains;

This cast relies on genpd being the first member of struct
spacemit_pm_domain. Reordering the struct silently breaks it. Consider
allocating a separate struct generic_pm_domain ** array and storing
&pd->genpd explicitly

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
