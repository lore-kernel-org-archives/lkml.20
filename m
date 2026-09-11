Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F0D2147F9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789086543; cv=pass; b=TpetnsPD2v0Sy12QkB7vSQr+Yfzl4h1vSaNAH+vIUxFGQ3SArBAi8SH2da5Cg7felesgnYzASKWi2OH8QVVuah4I3YWAXOZUXmOfj+Fi6nsvTVus6laYAREDYRzGqT/aRi8bprKT/dlpVNArHrk24CAnwvOGsmAPYnNd6juNlVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789086543; c=relaxed/simple;
	bh=CA+fAMW6xZEkmh5ZL75MipQ6Llb2/zi+5i1YmY8+u78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMm9JV5ljv7NY6id2nWehJy8X+KXPbsS7NYzbQFzNYqQ+EYF1MmxwYkxB3RChpC78OooU/xCQOtdPffmkr1c5qH+xLSjDrloWkl9KCHJJ9hyhwus/ZQtug7Kgw+jdazAXtImfwQWAVkTVQYoBWKAvlKiD4AlUcy9y8ZVlOhWPIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uRDTKmys; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uRDTKmys"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8565d77c277so3736267b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789086541; cv=none;
        d=google.com; s=arc-20260327;
        b=Z90UPTh6nP5yk/L/khl7DmjStKkhPoJnIq1hBaffw8kwhpNL4AGa3U2yQdnkTo5iRN
         5kHRfOj3FJ8+J99bTevvfSQe9qnARaI5Zv/PMyCe5QtGZGxQyOl1mS8ZR2bpFfimDzYR
         5LeyqXuvRm7kN510I7Ws2A30AyUmlUA3FIGGPdgg/Oxqn6cvDsn4bCNrrhhYTWu/RS5t
         okhz7N4OojN++jqU1rSBdqKY0N2CPmgKnf2FYEelN1977E3STSnX9OCfmxDshxZjHRE7
         VyCN6dZbTSIJ2UVpiXh+ywqlfOCVmgfcsG1YNcdQzteyHQl1OF1YMAgV4+gE9T4leMg2
         kxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        fh=oIgIspI3wdBk3YC4X+VGOGUW7Lc+z4agrUyoz5LXVaU=;
        b=ZbhXvyWFNbm+WHWUxU0eBJGT59kmChtboI4zTjxl3cmc2JLx7Hcl6nRAkyegskIVln
         MX8i5N6b3CM087qeCMBFksRIKLg6gN0RhwKom0dY39HG4iQYXq5f9lfowFfOJrJRCUPD
         SeLveUMAdrMJ4nlpkoLi17y1ZYkgvMzNPG63GbCLx2ADyrbpNdFiNIwOIrVMEGBpyfS4
         8vJy4xN1iZ/5j6/7WAS4N5TB0FH1Y9dLca3+Gx19qiyzHfInz+U/4Al7jgRegOz4Up9d
         L3yC0EJAiVtS3V/uIqgOicP6tvbtM7M5mGH4RKLmlq7rHnyQ0bVylCBSYeoGOwgew9l3
         vQ1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789086541; x=1789691341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        b=uRDTKmys62AZQyCrwvHqMtVuMQsbm5Y5hzwsaPqljHYaWF9yYbs6LYi5Y3hPHyn0c5
         itJhPWxRd4qFlqmKPlp4n/GqRN73hCN/VYkyQXY4OvQLZafogsurHnZqoGKyReeslNHg
         Rp+IP0JDeAQ5duvGzuzHTveWebWdMOXUVBNohIZ1jWcvqb6HXvzWbVtlcQU3t+mKJSmP
         ZXTQBUkjxp9x3pAkkPzfNjLKlVehAftUh1tFtb3/sST6hnwXluQqVsctSDq5kFRNVhOU
         w21VwHhxcJIu9yTaFxGjlndW1MU1GOwkk+nMrue1Equ+BudNqZgTJenJYb8JYUSiQXyQ
         8Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789086541; x=1789691341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNaJ99P89gFCs2TVtBIq90Gm0zDitWd9KVflfuv/aNU=;
        b=m7IQR4WcoyZTZxBMIzFHkx9mtMAa7NILhxL7ghXaxrfXnjgFDhqqLty1kjmEWllmYd
         oVFOeOJP1qO1nejILf+inlEleOu4SMGjg4Emh0cwnGW4whX6kEMqCR/oNlAFMtsZFc4m
         DF9+zOkNSiM4UwS1BihjI4CZNntBi6sLH1lCU1ubqfNR7Dle3Inwqa3dbJO58cMyMkdt
         Axv6eZiiTcZm/GgVajsX1FspplmXgZiAbASIjZ2pWwiMoR7QXardJxfC7gjKyikjLC10
         WoEujTnluhLUxHqQhW8+Br16lCJCHYgWP1C9A90oOlWgc0TATBy9Od0HbtumeXVkvdrf
         5KlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhqiceJoDNLMFkxS6D8NKClCcj0nyuhNY3ME64xadg2+P2diZpwqhL5BxpWlm9gNeXy2IBKq3a/aPRVS4=@vger.kernel.org
X-Gm-Message-State: AFuF++lr/yaYzrePLGta9slk7JNTBDxh/esGbh23z25mv1Hgd+XAWArM
	bs+xGhtWPYFV/rzlbI57MiCc0RkKRiugYsw6H6boyIZrywAi5Ign7gXJrrwsHO7ewkmNgvCKxZn
	hAFZ6tmhXSlWU6UyAD9Q9uFs35c45sHYbCLk4+43YezymvCXc7B3RKqg=
X-Gm-Gg: AYBFou1e16vtcNavPSbkOdS6sTzpfUiQB28PmX9U3YCf/13EJTtof4XvsSxDbIWGycr
	MluHo/gtTorrg7lbgM7deJeHxcxAyFG6apJrqhmhPoOv0mi9SG987TyxjIEIIr2TXxBYP6yTzQw
	X3gY4KK1fd6mm7VW3HCFP6e0y8XEmhy+Eus52QryVfMRhW8w5UbQ4ARBjeE6WaWGisF6sjaJdPM
	xILtfnuS8SGRZkVmQuEF9lsKHY7vZ5HNjwG7KtJPA6ahVZG2ABivCIQJ/MVd6m4IXV4JAQNa6RJ
	Jxifjh6MO1kROQVG4xcFLuCaPw/gfWaLEDLIxcXhXwdrBATWsnyLRxQYtgFN2lgjh3wrwaG0NYE
	XasxU5X8p96lW4g==
X-Received: by 2002:a05:690c:5805:b0:869:adba:625b with SMTP id
 00721157ae682-884af36088bmr6196187b3.25.1789086541234; Thu, 10 Sep 2026
 17:29:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org> <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 10 Sep 2026 19:28:47 -0500
X-Gm-Features: AcwNN1X6TqUaxW2SYT093nOASK8ddNR0F67KzkQysIy08gGg7L37ANaw7yFR2e8
Message-ID: <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 3881f573ec08..0b614caa411c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -163,6 +163,11 @@ soc: soc@0 {
>                 #size-cells =3D <1>;
>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible =3D "samsung,exynos850-acpm-sram";
> +                       reg =3D <0x2039000 0x40000>;

Why it's 0x40000? I checked the TRM, and it says iRAM APM area is from
0x02039000 to 0x02069000, which is 0x30000 (192 KiB). The downstream
kernel (v4.14) also say the APM SRAM size is 0x30000.

> +               };
> +
>                 chipid@10000000 {
>                         compatible =3D "samsung,exynos850-chipid";
>                         reg =3D <0x10000000 0x100>;
>
> --
> 2.51.0
>
