Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE914BD352
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827868; cv=pass; b=R27PVGGv8Wvbbeasdvlr+8N3TiYvMa1Su8e/22n5KJO6PW08qf+3AKgghY7P37kdi2sDt5+uDSzTQLV0BDwFuzbcl7nwPly2RXEGMrNWPef40ZluFltmrCS/S+voflN3j9IN0Cw5pAcDJHz7gMFK5npk+shcC8nIIyW2GrAH3Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827868; c=relaxed/simple;
	bh=tKHEGCY6r76koL/l5S9mzJ+wF3wLymIG9V6xeMYDS8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Muaij9uowk1v/iJrfCHsTvYlmdjkc34jRzUpMusGvALM55FPzKwVJsFhDWllgV6+8J4fLr7Mdfk6LkD7q7wtqhN9LM4MBx7Ni49oD4ZjenpGF/RUKrnL4z9QTQoeO1VO5njDMRQeWrB4UNOLZuL3o4XUxRuCDMPj+U5pZglPaVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSeWntSr; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSeWntSr"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so267702766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791827864; cv=none;
        d=google.com; s=arc-20260327;
        b=Ee6bLncT8ZYUCGon1he60FH5ovGxsXgdHvzOiGWH1G7lCqsuxo+6+Mq96Acct1Xqjx
         mkWGqf6afDXcVotM9NVimYyZj3MLRZCv/9EeurSoAFgfcFzVf5r78wKAylbgO5YyA5fl
         Lmb74b5zxmTRSO0DOBGHP51Kcmudbn0QHPorkpm08nbEo5YqccLnjUlTUugWgAt+Ln1r
         YPTFoBokwJcmHqQfYa8J3+7xQNFkNfhHBtkc+Qc3s3djtDFKkhFOWK3Hy4u4+ZbtWgqm
         x4O70H857oH6P0sfIrmEqoXUz90+DjNnmYYcs/LEyOh+MSy8Rv2YjWOhXtfng7+BGx3j
         XpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rvsjKUEKpCMLc9hcdJqN8gh1y0AqhQ0pFlm8r1MXE7M=;
        fh=1s6nt6/ywCqfC0o/9A4gOUkruNx7WPJC4GDI0SyZbzE=;
        b=EznJRmo33TLhWkQ9zHn7GbIfj12ZTGvtF6aPE013f7yCVlmug41qIIQYm0WGF8SKiP
         QnSh5ia+Q+ugVavFgOKy/RbpF5M5JShOmhbFY2dHPjRpxXQawAq6bi25SCr3QXr3TnJo
         +wpIILGgFeM3xNA20Bv2cB0awwAJZlEuz1/eT9pyMPIEjGFMAGZVoqPoGTksEOcIhz5p
         QDhh3oeQTfeHHFM0iTA97TgH/GCPcvv9CEFwaaRtz3utZ9twf5m+zK7V9isw/V4+UPOu
         RsdCpgwKYs+CjprpBK/wcwoKNLSr8rRC9MVQuhUGi3uyYbeRtbwJY49dPIzDWRtstWoo
         hagg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827864; x=1792432664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvsjKUEKpCMLc9hcdJqN8gh1y0AqhQ0pFlm8r1MXE7M=;
        b=FSeWntSrHOSQmtqhA2Zf+5xUPdpWguecrw/yZ1wuYkRszorVNqLrzCC+zQo/dfiajU
         EhyxtZaCOY1NRRRabm8Dqi1jcdtWnMhHs+NNZV8R4amLCn/1/Nuy2166r8iK0Iy8ghEB
         Ebduk6xv1+hA9HRC54TiouJbL9YD/sPHHBAsnMr3sxE9EaoAQiYCzvNYUv+36CYL9eMY
         QXkfkgJ3B79o31e0MLmTGraYUVDGVUT0idHkhiWfZra/zPY7TtmtM0XGso+yBPUa4Nae
         FINZb0e/W4NENQF4ez0pCiFJl5Yq1NqOfJqXUizou6eTiZRJwDpTGVT05b7r4j7k7gBr
         avkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827864; x=1792432664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvsjKUEKpCMLc9hcdJqN8gh1y0AqhQ0pFlm8r1MXE7M=;
        b=yxm6kBBmseB6qQG9cKpyJIsGdY/yA+bcGZXGdGNrMOitDtIe/BYb2sxjqU+JwgPyAI
         QA4K3ZH+owOSzz302zJ0FKSxTIC3hn7C9XXNu+eC50i3j2Wh2nb4/FX7PeSXgyTIkKkd
         o/VNdiVQY3pkdVmx7qJPe+77Gnlffx3+tpl/XCnyBClxoqfBCEXd/Btq0ZGWOONpanHq
         LRYxDZsEGA/I122DzyOe3psjFQMuV4k3oWLsINtV/4WZqp0RAFAdvB4mCJv0K/a7obhC
         fa6OdVMI10n1HhTPvK5ldibxGneWPIEX5yZjuP5SE0nRktMaozIxdmtnqVrIDQ3JlFs5
         z6HQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcJTnWi8E4QjRVyxMmGxq/Ef+KOamGRTq8gQ2plDXtwZZfZfG2P7d5GBOMjxxFcigzClkuiKpVEs1q4Fw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa3TqH93zKhRFCK0q2IuEF8LJQ4RiXp6CeXwKQTjvE1RlDhyh3
	Ikx/gnDaKhYM5nzfAcy9mRL3kdQRtzuC3A0flHY7Ux/Le474iUjbgg9dUMo7yPba3o4H1qAaasm
	lJHcOyoOvLNJF+0MY2gYwjUr1LGHj+RMetpSYK/MIzF2N
X-Gm-Gg: AYBFou1DcoSV9FkRC9gvjUFz3OcKxbnILDZ5oKj1afZWSRpO6xXkw8xmpdRbkBayL1w
	KM1ECIi8kme8+A5a4rIs9gT6DXQXksDKgvyqv04aVJ512nQG4t9pLRx7GDTezMS3YmeVTTSPAXY
	tFqytqJ40i9vQ9OJUObq7U3J5+tCs9WuJsv/jMrtoq0Q0Rwy8vYjGgN904gw5Ig34II3jqiLj3O
	vpzM99ThGgWIgLio+3opP/4DeifbGlsrEH+eiuy980cC46vgoESaJt6RUs7YQTjaO6mNXHeYNvI
	pxFXyRzBRI3eCcQGFNFrYZWJmSCydljNyfxOUGuMu92IwkloNHP7l3S20pQPMdk1oyX8afhS4iX
	AY3IJQQAUBOXj
X-Received: by 2002:a17:907:eccc:b0:c29:7953:6c06 with SMTP id
 a640c23a62f3a-c31aa0f72bamr946074266b.49.1791827863579; Mon, 12 Oct 2026
 10:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012170014.68898-1-pavankumaryalagada@gmail.com>
In-Reply-To: <20261012170014.68898-1-pavankumaryalagada@gmail.com>
From: Jeremy Clifton <gservice341@gmail.com>
Date: Mon, 12 Oct 2026 11:57:26 -0600
X-Gm-Features: AclHuK9ZnaJO_VOcPMtAKRiGApXxopBu_93ZaUEgo7I2pXSxZlLgJ0Tt_dcxXaQ
Message-ID: <CAC2RYzLMQSOi961mmyNkK1aVuMDafXdvRj_mCEAZQnU37sKA8w@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: replace PTR_ERR() with %pe in error messages
To: pavankumaryalagada@gmail.com
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org, 
	elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For this patch I have only one immediate suggestion.

The firmware management case (case GREYBUS_PROTOCOL_FW_MANAGEMENT:)
should match the other cases. Found around line 96.

You've changed the pointer variable to display and this seems correct.

For consistency, each should match.

On Mon, Oct 12, 2026 at 11:00=E2=80=AFAM <pavankumaryalagada@gmail.com> wro=
te:
>
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>
> Use %pe to print error pointers directly and display their
> error names.
>
> Keep the other PTR_ERR() call because its return value is
> needed for ret.
>
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> ---
>  drivers/staging/greybus/fw-core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/=
fw-core.c
> index 2016a74f137f..7053afa9ab3e 100644
> --- a/drivers/staging/greybus/fw-core.c
> +++ b/drivers/staging/greybus/fw-core.c
> @@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>                         connection =3D gb_connection_create(bundle, cport=
_id,
>                                                           gb_fw_download_=
request_handler);
>                         if (IS_ERR(connection)) {
> -                               dev_err(&bundle->dev, "failed to create d=
ownload connection (%ld)\n",
> -                                       PTR_ERR(connection));
> +                               dev_err(&bundle->dev, "failed to create d=
ownload connection (%pe)\n",
> +                                       connection);
>                         } else {
>                                 fw_core->download_connection =3D connecti=
on;
>                         }
> @@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>                         connection =3D gb_connection_create(bundle, cport=
_id,
>                                                           NULL);
>                         if (IS_ERR(connection)) {
> -                               dev_err(&bundle->dev, "failed to create S=
PI connection (%ld)\n",
> -                                       PTR_ERR(connection));
> +                               dev_err(&bundle->dev, "failed to create S=
PI connection (%pe)\n",
> +                                       connection);
>                         } else {
>                                 fw_core->spi_connection =3D connection;
>                         }
> @@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>                         connection =3D gb_connection_create(bundle, cport=
_id,
>                                                           NULL);
>                         if (IS_ERR(connection)) {
> -                               dev_err(&bundle->dev, "failed to create A=
uthentication connection (%ld)\n",
> -                                       PTR_ERR(connection));
> +                               dev_err(&bundle->dev, "failed to create A=
uthentication connection (%pe)\n",
> +                                       connection);
>                         } else {
>                                 fw_core->cap_connection =3D connection;
>                         }
> --
> 2.43.0
>
>
