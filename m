Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E732EEE85
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789087375; cv=pass; b=VVRRmYkHv6VglgXxHcFB0ZUyWIfp6vv/Ir5dex8vmhCs1JMad5Ltu069tUadSzbjDGeTYxCsLdVU7TzvjZs0EPCOXmOHiBNT57xXJ3C1CE9F7ypzGkClqyYhvzst8IKQCybY909PXSqnkYtGiy659dYV/WwxLDERhHheZGoZG0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789087375; c=relaxed/simple;
	bh=s9iYiLxHL7U/2B3sedn7a7chFI9A193m2Bj539bDZyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/ynushkt3LExyRxOsKm1zCD/GU/1CxIgI5WURZL7OkL7xu/Ywm5EpGcvjQQVJv1sK2ml5tow6YOXOOyyfPWBJiLNUO2RnWjXg+nuo4PgyR9vlmOUmgM2U1/RC4USxAwqML3gpeoN5/8j4tsDcMGaPwlGGqOnq1HVV4fTLYt0WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s9Hhm9x+; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s9Hhm9x+"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-866e57f63a3so2949507b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789087371; cv=none;
        d=google.com; s=arc-20260327;
        b=d2xo2pDywd1umjSGcmPj7zZvOXiiNzO2EK5iF7HzSTYFejyR8sSuyPonEuw4IFRaP+
         yslUXlqLqqU+idFmFI9N3R6At6NiA9gxJamCodmNXWgAGdYIIDEKHgQSJZRSUPo7UZ4n
         1Tv5JwaI85BjAI8dOj6k48e/nPHBG3bdqttFMb2Uv3fRxbg+QzrhVrcSvVm+iaLfwlOz
         Q+bIcLWdfMLkW/CYoKG1NM1puQZF8Y8XBNjOdSZYzLFO3a8u9nABAq7F16BV63c6k3ta
         ZiopG0UrWoufuEDLkZhcqxFmyS4al1n7rVZ8UbTt8C3aUpLN77Bgm+dQB64Ypguf74DT
         5MIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        fh=sM7nxPUoCK/h1ogRXlGcHrnhW4aw1aOPsuZuyyJgv8g=;
        b=iAbkCba4dQlpvASxClQd0ScfQWKSJF6odF71/hBinaURAJtbaYISmhlzjtnfqP5gb6
         Dbckbcr3ooHoBu67YfX1ltyVfxKskMVcuk8F+RdiICY9i5TpNx/6G+X7bbo2KTLO+Z7A
         WvIoU98FoYCyYp6oMuY018RT5cRDOezqj3ffbSnGTwKVI9payEKEFJho6Pvpk3zk0cRf
         9oIhSWOasQEVEB92i1sbvr24oO9LctEaErUURf4ExGr/dsUSjsZoaPr+AU6i+hiGZece
         0n9e3cA86qfVqDKe6NnwpGMTDK72s6yDere1tvBYhAxkAbFvMQ5qCs61FaYdqiozpvKZ
         ML0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789087371; x=1789692171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        b=s9Hhm9x+YDQG69tX0j8jBrKCIJKTZdwzTvn0Y461nXRP57BUQt1qB3MWpTro68tKY9
         mf6K0M6ThgvID8jGDZe5K8gPjy1urNMD/t7WQyREItsQi8rVeCWb55uY58yeQ4Bb9HqC
         BEVeEvOc8CerQqH6KtvRzTTpJC/nEenzz4qD2Jf1+BFeOtVTVokuzYfPBf5izs64nl+e
         J5ngxdJnsEqLv74TN2LFgWJG0h0eJsSQ5r2dml4UHMPvIjSnUlFeppxX8Sh/d0i7/aNx
         OtomYnEQDg7GQlnSXaLbdJnl5ItAraMNCX1ZNUNnIGfWbz2J51PLDselUWrwVquUrv0s
         m5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789087371; x=1789692171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        b=I3DVWzG1iBU7HnQKzb4EqeGbdwbh87pOR004DdJHAU5oDlPRjpKOg1GqXGYHo/P87n
         dgcZNE6zAyctcV7/fCK7MOZNW4sNB5lKHpMwuXefzeCpnApY+nLWVHXO1X7oopqx1n0S
         d2wm21P1GgBI8xR9F0RKkyR02Y7KsN7cSaWT/gK6WXDTzHmIdRZ91/bo0TjdWgkk0rxu
         b79SOLsKQfzbfEcp86anCGvVpvLprwm4yBCHWiB7aMfOjPEGoMsjMh4aSoFs36E2d/hv
         KR7/HBWBcgucYnL7JHJU7cES7d1D/qyfzVobWwxZk7TCkIi7R29Q8Xo4/lCIn3XMYmhs
         bT0g==
X-Forwarded-Encrypted: i=1; AKwUvBzFwdJDRwOamKMRNCdfvy+1CcMVRV7swWa0SqMD/K5lq8khV6d3AKRySm9AkrV5r2zkp6b4I/oWjpCHS1g=@vger.kernel.org
X-Gm-Message-State: AFuF++nObZyylD/2kEresJ7j391VwpR0fm1Yf+IoHJCZuWgy/HrgkM+t
	qvBzagDhLaqNbCwcg/4bJkaCxQ8AAGsNh0trf9eesUlWYhTnIUGbIVKZfdXPk5cILWTSo09nVPw
	jn0aHJgMF6MG9zwjKKNaFUZ2zZwvrw/PYs7ncpqHNQw==
X-Gm-Gg: AYBFou0ICx0cD/Kz3WHcCqIlvLNeu0sTkVQ0XpGURcCFXpaKn8q6gJh8oqTeSsNVgR2
	bqFytrGIVJ5f5xx/W4WHfvV7Dc44cgEB1BoHR2HG8a6+rr90Lnw2kRlCB3BUo3iuULa8Hpf+H9N
	dbbBkMtMrpOyLjacs8dD2Y6jGciYfANPMWjD/O+Zy6FMvuCopHc13PDvtnMgtJ8vG3/09FOa+Mx
	Q0/UbP/Lsjname15U94VTa4ytm9nlpMLAdZOVIzqCbZ86cAxPw2xBSoN/dJBDcTQMGMXkXAw1RB
	2qIiHb/qMBkrnv1lJhrMwqO6sDw57fAQJToER2IcYsugVXaNzaYfUqZng0vpH4iqQGWU+xeydgI
	qRH71IVYLNlqkYw==
X-Received: by 2002:a05:690c:660a:b0:873:5ddf:d862 with SMTP id
 00721157ae682-884b3873114mr9013287b3.45.1789087371068; Thu, 10 Sep 2026
 17:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org> <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 10 Sep 2026 19:42:38 -0500
X-Gm-Features: AcwNN1WDjFTgB-aBDySNIcrpUgOjcJa8lLtJJ127JD23ekWYTtDiP3LdRVUZsB0
Message-ID: <CAPLW+4ntx8qLy9jAYYdT+XwxwKHjvisutqEi04oPEQny8auD-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region us=
ed
> for ACPM communication on Samsung-based SoCs.
>
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documenta=
tion/devicetree/bindings/sram/sram.yaml
> index b83fc6831947..b9c4d4f3199b 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -43,6 +43,7 @@ properties:
>          - qcom,rpm-msg-ram
>          - qcom,shikra-imem
>          - rockchip,rk3288-pmu-sram
> +        - samsung,exynos850-acpm-sram

Is there a reason we can't just use "mmio-sram" for Exynos850 ACPM
needs? I can see it's used in the gs101 device tree like this. If
there is a reason for this, I think it might be a good idea to
document it in the commit message (probably in both patches). Also,
should "mmio-sram" be added as a backup option (after comma) in your
[PATCH 2/2]?

>
>    reg:
>      maxItems: 1
> @@ -159,6 +160,7 @@ if:
>            enum:
>              - qcom,rpm-msg-ram
>              - rockchip,rk3288-pmu-sram
> +            - samsung,exynos850-acpm-sram
>  then:
>    required:
>      - "#address-cells"
>
> --
> 2.51.0
>
