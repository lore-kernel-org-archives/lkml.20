Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF84134B1AD
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668969; cv=pass; b=GZC7TZa6Qi1LvJpjkgWPmRBEEg2PpmdUn8AsW0gaFkEP6XM34JKDAsUOV/iebkn7h3cNOzuC8I43VN8eJ7ur+ibIYo2ma+C2pFN+dOuFuN/UvkJwCM8YRzsmYKXdgfG30Vs6stoJH5aEshzvTIXfPFjpjfvQ009ZkvgrgZqqEDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668969; c=relaxed/simple;
	bh=A0Y4JQ56hYy7CT2yG5PWBV4nnyzxHO6PK5CJvpXuWtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djQh9jM5vYRTj1BcibczjvT4BOgoFZIuvbc8hJnVOdnJLAzf+C/PWdb7rBd5YW4q4ZGhQoF/YIotwEe4jyqlguqcthySjIHHKX3UqS8gEb8W+/mBF03ieI1k5dutjc6Sv8wD1l9zCP5IU5wl0RRaoxQrIeex+X806dg4lV/P/B8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Qll2pCjS; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Qll2pCjS"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-677d35fd168so536109d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791668967; cv=none;
        d=google.com; s=arc-20260327;
        b=F8zJHz5GWObuNnlZHQVOOUB9wnvDyLvyviPF2THNkLyyUBVql6tIIHkojP2eZ14w4M
         /+f9sAlXm4dlDAybh4UWZ9iONBZsRq2Wa86MdgWIHMkzudR6vUC4kacBI0XARkLas2kG
         Ztpu7rWU4ih+E/ZlFxzMicZPCi6we95u1ssLAdAhZ0FDXIbYckpxw457GOSQngZufe3h
         xIEArz9AVXW4bbkI9CsXQaqcr9i9fx07vvWMa7vn8FHxAkEM4eRGt+nXak2AQ3eVniFs
         VNWKa0ASHUYot3BgTRUa5mxDlbmcdOctC9yD0scAda2YHi59Fj2uBNLOO5jgbyksFQn6
         nU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        fh=SNagIuNmXiLwvWRGpTi6FzZ+rccnyZiszyQ1hPmGBrc=;
        b=iPawSNFQXgQp0Ucyh3e8VeJJVvldWK4x6mx1pbeytgPgpJnU9nEAd4HW/zAiIVSMLR
         B/JhQdWl26trC0/q1xI2jiTNMcFEM/+9M6YvT5dL3jll7mTU+qYV02T+9vR1/IuJQjmy
         mPn2YObbB8DkGjhR0tfQlx6CLVK4XMn2+dX8wY0Gm047ugcL0GKhmOzvL7dvs45ts8Hf
         bT7rJkguT9/Lzfq/D6z6t4MsvMhL04BpeAZFs+2lTpmAKdSNnbVFc7seVeMNNtZ0XeJe
         EaAJBSDE9u7qZnQZYdQKMFiTsoJBfBe+zb71Uu7gM2k6w2a+JMXR+CWCEEqCi2gWeOM0
         Wvkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791668967; x=1792273767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        b=Qll2pCjSkh/nhoBfKEy2eQoAyHUjplbXiYsxv/cqITFnBsPdYmDAZq8EGiLDakDD44
         iiOmzeQaURIebYliJzKH8csF/MtC0KUrRtXy7e1Vn1fxR3Ko6dhWO9eBiL266/zmYJ1h
         5naHAERwhOuedj2Y6QfpG6ldjG7Zf0ZT3bm8otC2ik+6tBEFvn0sMyOgkYo/I+7YugDF
         HQgQfjY/ZNuG1TxUaJr6JBtGcSzoWf+fGG2TSpp4cznNnW+my/mLOvIiQyLnU5E+bOmx
         AKHXANyOiv92u+M3rIKgQ1az73M4GPFiuaPpVfvUQoWGDfyBWPcM6nQr5W4j0+4b5TP2
         cGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791668967; x=1792273767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6dC4+3uJJpM8gLS0TL3OI4kuVTFqrUhEB2NtLiC1S8=;
        b=MKOVquLWRmqO18F+EY7aDOYsMncu0hXAXyQV/c7SOfM0Hkcr69MP/O9mrJZ27CnxNB
         RAul/0rXI/1ijcX6z0xGAxhSMtEOwL9hz1UELLTOp7rLC4AVUD+cFK/vxSiuGtdLi2GV
         /a99f4kOBsEEBLdSaC3wMkCnFcBLMu3q2pFEXk47uiIbWX02CRRKpFjtkxFsajhWfL1r
         +hWSKy2rIQcHyNpJFyApyzlpZS74aVshL9j4w9c5F+krFzp3qlCvxoKqRBUxlR3BhSO1
         7MF8oTu/xYpa4sdvBx/qCiXIt7aYGZ+d7dXvH91WeKOU6qOEFmXI53y68HrECE6Bbu2r
         vdUg==
X-Forwarded-Encrypted: i=1; AKwUvBw1ztfCL+cBdcnMC9zLgEuOg1J9Dt5deRjr4I6OomRJ6GN0eJmF3e+XYOXJcxmqsotgcnIOX4B2H4eNpIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXqMMXq8FgHrYb5HGjnRZFlyly0da1KFnJ9Q0eHfzvzET7Xup9
	MFHNRdKnp+3guid7wuPjSONDDjuhNOyYxVU0HdmvlMrQbTNgNJBDrS82rSxEhKyQAtuUY2T4zY/
	u5vIkIL/bpkDGXfMlXqZ+5vamKJ9jIbA=
X-Gm-Gg: AYBFou1/G17FVJCHy3QkKhen2IC6B2mfvj3ZGUQFwjuL4BwbVtXr4l6pqhNN+TbEE0k
	NxLFWODeM6HgzprqPezz+Iwd9zMX7OFkf2k8zjDD7vDHuiTb+NMf8SMvkilXUXBZfCOl44mqAjS
	p/F2HTJtlwlqPgK6yCq1ZJ6MGBG7Hwd7YooGr8URF9/23TpMai4KumhVzwtQ2NUDnCjCcMpMHeO
	sVa9w4tlGB/4cpFjRWozJ4ZwtB8M0l4upkFnC3LDCLgTOoxQmMAl1QAGFN8QLbv+rahC6NDLIvA
	h5NwS5UXYBPlk1NN4v7q0Xd7d/OxRTAQLigtNrFMn5i/R7G0Es8pcDK9jacFIPL5yGL0CZYB7k0
	+N5ywjw1yKAGg
X-Received: by 2002:a05:690e:5:b0:674:17ca:25dd with SMTP id
 956f58d0204a3-679362cb227mr1431918d50.78.1791668966625; Sat, 10 Oct 2026
 14:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-5-tanure@linux.com>
In-Reply-To: <20261010105900.247342-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 10 Oct 2026 23:49:15 +0200
X-Gm-Features: AclHuK8jJjUAGUEE_RiHqUn3ZKgg7qAYmUp7tVzhoh46a9QNl3VNEK64s0Xinno
Message-ID: <CAFBinCCpo28jZkQnup2=iofwh02GOMzxJ82hGHWctiWzcKTxUw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays
 the T7 way
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

$subject caught my eye because I didn't understand why there's a "T7
way" for adding RGMII delays since we should be following a standard.
Patch 8/8 in this series documents the standard. Can you please find a
more suitable $subject for this patch?

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
>  static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
>  {
>         u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
> @@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_devi=
ce *pdev)
>         dwmac->dev =3D &pdev->dev;
>         dwmac->phy_mode =3D plat_dat->phy_interface;
>
> -       /* use 2ns as fallback since this value was previously hardcoded =
*/
> -       if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns"=
,
> -                                &dwmac->tx_delay_ns))
> -               dwmac->tx_delay_ns =3D 2;
The 2ns default value in case "amlogic,tx-delay-ns" is absent hasn't
been necessary since commit 093d23db4fff ("ARM64: dts: amlogic: add
the ethernet TX delay configuration").
That commit is part of v4.12. So boards using RGMII and a .dtb without
that property haven't been updated in more than 9 years.

[...]
> -       ret =3D meson8b_init_rgmii_delays(dwmac);
> +       if (dwmac->data->mac_applies_dt_delays)
> +               ret =3D meson_dwmac_init_dt_delays(dwmac, plat_dat);
> +       else
> +               ret =3D meson8b_init_rgmii_delays(dwmac);
From the discussion in v2 I couldn't understand the overall way forward.
I get that new compatible strings should not rely on old, incorrect
behavior. But what's the path forward for the other SoCs?

[...]
>  static const struct meson8b_dwmac_data meson_t7_dwmac_data =3D {
>         .set_phy_mode =3D meson_axg_set_phy_mode,
> -       .has_prg_eth1_rgmii_rx_delay =3D true,
>         .has_pipeline_clk =3D true,
> +       .mac_applies_dt_delays =3D true,
This should be a callback function pointer (apply_delays or similar,
to match set_phy_mode) unless there's a way to make older SoCs also
follow the "correct" RGMII delay specification.


Best regards,
Martin
