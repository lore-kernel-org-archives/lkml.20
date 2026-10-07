Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B686F2D8385
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 00:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791334197; cv=pass; b=ctpf96pvdAfUljrI1y6XU1EYIOZuAJW5y66tErCtMHmymzndLFo4Ru3xOtlrt11j5G+zuA/D8rYOnhupegaDLMOIlJvUtdbe5Km7gnY/yqpQdHJK13p2J4gyCytY513dl8tSTrkMtfA3EDYrZb2BAOHLHMIlrSIpqXrEu9MfKFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791334197; c=relaxed/simple;
	bh=jibWeNECBJ6nGuuVGpXMaJ411vpC41Hnyp5ZlPjaFrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sisbc+z5zA2w+UkUiA2KhEO6gHVUDaI1YrtQW2At6kXsG7zstm5P433MY7ZpNARoR0+3ppgsRO4Ye4M5jq6151TKgtrmUHhkx5YLKtCTHXww6PLer1nsHZ1y9wY7pwc9SnOUqFtSmeiHlHiDHP9NQl39brRs8FU22WXli0oPuGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjL8i6Tg; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjL8i6Tg"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ab3d3c5761so13422017b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 17:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791334195; cv=none;
        d=google.com; s=arc-20260327;
        b=cQPnpU0bkIE9gsQC8K+qH1vdL4kr4t8kYu3FAdQagMenFauvyqMENMq+kPvjBmSABa
         rJWyFgkbH+/cqGwaOs8mLOen6m6NwiQwzYnwqnGYLE8MK7WhJJ6xkkQItF5XOshXsj4W
         u2FhK+piiPYNx2s66B1FUGCuu5Kmev/e6h2y2zJhLqDlFxvZhqbbr63Zp/YP/qk+d2WA
         LkTRl7aLPnLgLtFySl0TPB3rm4RweB9wlWUAm6qmxP+9l6HkUqJ0xd5w4P2CpsciLc/l
         3860Od32HRiHetQMArtG6KcQiuX88ufksvj8ClIyU4bQjta2HRD6NHKNDBAz9fD81BW9
         6RnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        fh=FeW3/ZMAiHTwUjtaUQ/O/WQtuXpLHUMFnlZi8MV/zUw=;
        b=YQOBRlHui3gaHqh86pRHxFbpfT6PS8Jz3f+vIZY6SQI/SsP3puf8XPEbfUW7M5Q+WI
         fFXHmwo5H5JjifZMuW3hwUJcWEQKqd4NCcJDqyfKXOIyTkAAoqG2uOc2VaJsAgHgVpNB
         AJ3l43f2F97jQzP2L5apV+Cur7CdmzvjxvP0rkghtvR8tJ0P8jmKdImOxIl5eHW3Lssl
         5A0UeNnDGxfg5EKazBiLSK3QIlvVCFE2Pwq199zfKw87RTgmH1sfJZ21rax1/NvI27SV
         qJ74a25tqcP44CJ/i2caL6SX8U2NrH0/3eFpLSLqpxYSF2lHqN9jPFegPQbd5pTJkZXf
         qr7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791334195; x=1791938995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        b=QjL8i6TgtAjF4wRVO56FVrfHK0ABEELBNmCB0IwMtSycsCrADIs3aK5itKSXyK94CQ
         fAXkGoYnepDWarPf7Ey5mwLC5LdBWCH/WbEMIz1qtYfDsniFZLxJ4dEp89xhxNWML3E7
         1znmSyX/1VnIjWkBX+F6IswLM70b6ffqlK6/vQZtF4D5wdEPah/Oa41R9ZTnRR82iBRa
         oYMxDW4ARR5Z634FBE+/LWz/QG6viSIT5Ul/D3D0I3HBio9aa4IwuO1yIrDfvgUMLldz
         lfzqal7L0BBGnckD6CKlFpHqgg0hbYrxVr2JEAo7ySNoSmMHoSFn+z5fsMtyKQqzvxfs
         x2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334195; x=1791938995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        b=jABIrY06zIThWOeTBOCBiMlgcbBgGxPUkQkdlsL5iyqSR7G8AcckJmZ4kzCJ7S7xFk
         uuobCYPNS2jB65X3NiqfeMgH7wCb9PcQkd0PFqHCun9ild3vXMpry0FtI3aQUH6Hx6z8
         8ynSZcP9aKw+ki5hCMfzfOxEJA8DfJ/zvUcY381aONZmiZkc1No+EczfSHhGZgXj8h0r
         s9ZsaDjhlNFSnCMBKa9HzoEz2kDRV01t1EOdcRFOdneOT574HwNPDXSw7Cdnhn6i6pVY
         C+dURx8jnHyAsy7ClTBJ9oiVMi0CsCCvkbASe5yS+3s7Q2roPvpqlM4Uu1wnBzOigsY9
         bIEw==
X-Forwarded-Encrypted: i=1; AKwUvBy1jW1HtNSJ13d5QpWDfzAzqZ/3qCfLGsiV4uRgRR92uIHBDlDR4xiCzVLeAGQpl4d1y6XDmCE6TZgzGAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9ldqXWLN1NdFA5BYIe54cFTBD4xM20+4RXqbQVceCtS3MMlBr
	BiPsqS/bpyk7QDP+cGfpYIBsQgUElS4VBcFaFW+rr3e9e+wYaxB0abONNA5/y/Q5Y+k3hFVSuGl
	tKg3kxa97LgoWsLSIJ0JS/voWd1+80kleDI3MPo8Lfg==
X-Gm-Gg: AYBFou3Ol7gVT9NZgAyENU019JJK3IfghvH+ufGZ+b12MkF2jIlrimHvj2DLFA6smic
	8Yvnz/pRloRJJ24kf/N2Vl9PgEXedYFWv6q8jUqF/nqKYFhne5dmdSGEpLFXnU4oZukG3qDI7tP
	Vc8JX0iMhWCaaZwdVUES2F5VyyQlbe/tOVvdDxRbIM6XDrNlSFjXKyv9dJd5K3VOrxgyJ9y1hnQ
	/6skA7r2PiianGBDR9pdC/nep/0vSGGMl1/XW6RR0QkmK3VDplXplyBvjDCYBqfRWTe+1RIJkLA
	kxhsDU6T6PPAC603lbE6b33pRowvRdsm3aQcuIneQBMKJ4j+1sEAhrTSQW7kQO010iasXxTZ9b2
	JZh5AuATcfjpebzw=
X-Received: by 2002:a05:690c:ec6:b0:861:a2ae:8c6b with SMTP id
 00721157ae682-8b05ac458e3mr9173847b3.2.1791334194577; Tue, 06 Oct 2026
 17:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 19:49:41 -0500
X-Gm-Features: AclHuK9KAi2YbRrGI4BgLSa88-aMtBCudk5hm_jOIiAtHKuwiCVmb4TkmJdVAQo
Message-ID: <CAPLW+4kQ2M11VbUBkr6ktjfRGRnbdUWRuOK=ek4-3MJxSwGPAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:11=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> The Exynos850 SoC contains an APM co-processor. Communication
> with this hardware block is established using the ACPM protocol,
> which handles IPC messages for clocks, power, thermal management,
> and PMIC control.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string along with
> its associated match data. This includes the specific initialisation
> data base offset (which differs from the GS101 offset) and the
> "exynos850-acpm-clk" device name required to properly instantiate
> the clock provider.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/sa=
msung/exynos-acpm.c
> index 942a2e9f02f5..5a16665e941b 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -39,6 +39,7 @@
>  #define ACPM_POLL_TIMEOUT_US           (100 * USEC_PER_MSEC)
>  #define ACPM_TX_TIMEOUT_US             500000
>
> +#define ACPM_EXYNOS850_INITDATA_BASE   0x7000
>  #define ACPM_GS101_INITDATA_BASE       0xa000
>
>  /**
> @@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct =
device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>
> +static const struct acpm_match_data acpm_exynos850 =3D {
> +       .initdata_base =3D ACPM_EXYNOS850_INITDATA_BASE,
> +       .acpm_clk_dev_name =3D "exynos850-acpm-clk",
> +};
> +
>  static const struct acpm_match_data acpm_gs101 =3D {
>         .initdata_base =3D ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name =3D "gs101-acpm-clk",
> @@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] =3D {
>                 .compatible =3D "google,gs101-acpm-ipc",
>                 .data =3D &acpm_gs101,
>         },
> +       {
> +               .compatible =3D "samsung,exynos850-acpm-ipc",
> +               .data =3D &acpm_exynos850,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, acpm_match);
>
> --
> 2.51.0
>
