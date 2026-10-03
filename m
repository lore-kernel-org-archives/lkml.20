Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C4834B1B0
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049762; cv=pass; b=iw8dA7IkYrPVHBMa+VnYjXlOnBeca0C2PuX+4phmL9/whBO6t4D+kbjWRVygEyZefWVdNDJLtTBvob8zyopjlnnVTtB8aGvLPq2+6O+BPhlzlZOJ5yVSXpAtITRh6+Nd6fQT3jywJRNOTls/2QddD+cM0SLMtgNQY7bIFhh3ycs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049762; c=relaxed/simple;
	bh=YD4inc+qwfxdmXNsGOoWhpIhRzxHQkYvOht1VXxPM9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=By2QWBtb4bFNOFKZiCIXuOfG1hZOJTTakt/MiBqg6GkeCs6eshhd+F+6R4GjoShxv7WWMYbheWeBqYUmoVW83WMKV8LIJUgVhb/ODSURMZpmuLeMAkFVQFnOyOnGW5c4rMs47nm08FXVu1bRZhY7qfTnvPb7hfBj2TqKgLFBDjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pv9Nrqtp; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pv9Nrqtp"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3dcfe205so108482566b.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049759; cv=none;
        d=google.com; s=arc-20260327;
        b=FqeaMWaxc8b0VFT+iU5ho+AVBysFooeklNNsglw/0OeF1Kf80H8KBnHh+HpYaqQcIl
         O4+KBrDkptNIcuGr2oFkWTl9i6LhpvZlPu26YCVo9ltBh+sYMqguVBgt9O88IM4qGojG
         OXV3pVYJBr6HNnBqGx8H8bn7GJx8esfHn/R9MaD99j3nqTHcDyWx4VbmhET8W6JnyCJ6
         IcpL7ZlUex9ONT1kSQtr1QxYcO7HT8berJni92VbJZNXoHcRBlh2H6Sy+sq3L1mXeKd7
         6yrL0cbtE1vaZeAeOuWTNMnXkkGdEADrdBlFIf6RbpUlbkRoPa/8iyd2XAHEGMBm/h0v
         bOmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        fh=rpRQf2szdeVdCBdjnlZeb43US23Za67tcHqhdtF0784=;
        b=ZeHSsZklAJ+BPcFCpS1E/uv04Q2+RU915wIC55tYG4MuCC+fHc+TClHD7eh79lqc3+
         q10OYDMLMzJ67+H8Zr2sX+lnQYwY26Yvm6c3ULTHvpUef+IjTWCmUEwuy0YKBKbMy4WY
         C0wIpUBLotIljGP7HmwElAw7wOEfZRgzI2xwZqvpqvVvg5yV4GhnWsVvAqUGFlNcCRJ0
         zQTUoz8ZuR0xbL2BcXyRCiGul1HS5vlq45UbVUXJ8UQWPFb0Eq7VUxqYRZ4mxOJjUirs
         myyFtbwem2m3T1r0OCVt1nlASqbgoGdUPPvsRgtv8BaG+O8Wkow9Xr5ngnJ9S7YR9uvv
         TUMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049759; x=1791654559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        b=pv9NrqtpWHXs9VGhJNtru7n5WDUWWlSVGJkmbowOiAPz3nf9gyf42v5uzkhk2v2zHz
         boBHY+sCvQ3fCnxCCtS3f51tYR/EGy/ucNWpSNCoM2UPq+r32b6zXmxytUOpkuDyPHWD
         IsLyywZcDfpSAY4yIxgjOENLwk+IqhGv//cG0iVje+Tdkp/q3z/75WK0utih1cmGg3q9
         VpVpjnOAW9YPZj9T2eVdALvSV7oAzMOKhRzS8T1Hbl2wCszNtXLY5W9TX0cRhg/OaUS0
         uTZQ/YqlUmYNsACz7vpGz35vITPIND+ey0XSQHWJmZ0WUlfCp+rrMV20kaHzahCPtylH
         UMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049759; x=1791654559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        b=uVnL/206NIgd2kbOLLkoOcyvwiMIcjcfmyH9uVuJEezuELPyN3/liEglpof3aTlpZo
         ANEAu38Kdal4pk1G7g81sCzrIelrTlSo3yj73qzGjP4z8ohdfvILZ+XD1XrdZHkviRkA
         ybxnyzWISbPC86Fw7DF9K7pAzrjeIgA6Zg2v28mXQ8WrxZoIsHjbyaiXkfet60R+qgM8
         EYpZLKOb3iIZKltzSwJdO3vO2qLoU+yoZsYHXUOwec8DGlzmE9rDE9QuVw3RcyRKgLc4
         lspsNbZdvnQKSBQN4KpRfNgRKzLbMbbNzrU4vEzdxmwYFxNHrtelBcfBwWq3vSaTbdvb
         bJKw==
X-Forwarded-Encrypted: i=1; AKwUvBwuNN5C6MdctfXx9R8enEcStPhPf1niKDcer6C+mW/f3v1Z8rp7CaKMRqZSMJdzbEsZSwVYV67iXAF4Iak=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc6PjY+Ic9z1AIOFIMrWj+7Xuk6Bzq6VI5MokDv+62LMXha9Al
	cl+oui3VBwHaySNxBG4biwETT9ZA5GKVp+Om4SBvFIU5D3BGDGQPIc/JibiFfL3JwpICMHefCwy
	9v1pH1Qbrbj7Dkarys1sO0X/tqWDR9oU=
X-Gm-Gg: AYBFou0TH5hVqgvsWBa9DobQL12C16b7BPanRLNpoGDPwtVwmWClrEh9zMQiWisdPQ8
	c1HlLt1bRjof7503vke8Aqq15ySqqAH7DRJKlM3/XkaWNTwfN+RAtTXNaZJlWPT0tBPm7EKP02Y
	hW66B3Zhf/wMVuXXjqbwbXLJj3D5QjYoFaLtTNNpD2NdMXrxPY/8lwrKpygpmECmwcmpTqAW4at
	y9OMNNTgvuHZsiGPdUpujBADgSvyRZ1KER6QQJuIxAYm3OHl0k0Eat0tfMxACxoCypl/HkQEw39
	NAreYR4NqvCbIYQRgdGrlLzQU7t/WzTxJuPKOSeW0VblHnS9bx0KzzwGf585zi5zVzjlGV79jud
	1neKKUouwoNs/IsAuycrEzCxfX0O4DrQ5KVJpL/V78JfLtxTCQU5yVbHoqP2SRYhjUvXOsEDYSh
	X0nVtRKcXTcIdFfUOBEkP5VAhE+qaFnl/ixGa4TF1U
X-Received: by 2002:a17:907:3e8d:b0:c2e:7da8:f7b0 with SMTP id
 a640c23a62f3a-c2e7da94cddmr75113166b.30.1791049759013; Sat, 03 Oct 2026
 10:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-4-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-4-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:48:42 +0300
X-Gm-Features: AclHuK9Bi3Crqpp_pF3AiMgGWXYXjjoKWwAR4Jh6xG5aSPocrJMAmDcagVfOoRQ
Message-ID: <CAHp75Vfy7pbHaANK2pv6TSWctn9phVwby1vMjY7akeFPaKn2-A@mail.gmail.com>
Subject: Re: [PATCH 4/9] gpio: mxc: use devm action for irq_domain cleanup
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> Replace the manual irq_domain_remove() error path with
> devm_add_action_or_reset(), so the IRQ domain is cleaned up
> automatically on both probe failure to eliminate the
> out_irqdomain_remove goto label.

...

> +       err =3D devm_add_action_or_reset(&pdev->dev, mxc_gpio_irq_domain_=
remove, port->domain);
> +       if (err)
> +               goto out_bgio;
> +

We have devm_irq_domain_instantiate() and the respective wrappers.

...

>         /* gpio-mxc can be a generic irq chip */
>         err =3D mxc_gpio_init_gc(port, irq_base);
>         if (err < 0)
> -               goto out_irqdomain_remove;
> +               goto out_bgio;

This is simply wrong. No devm_*() call should be followed by goto.

--=20
With Best Regards,
Andy Shevchenko
