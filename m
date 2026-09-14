Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4883A1CEA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411418; cv=pass; b=Tj3TR0kZ+3NKnYkkyx9p1KjyVWet3S4+PxPQSMwUrxiYYRdHicseRmmMaR13uT3z1ARJVoKMjE1zZ9sg5T6uJpdqGp1x3t1FeVyCsXew15e6JvCj3qSCMYN97gdCSbBEAfxxtcDeka5avZv0y4wBpHojtvCsHg2mejbtG9Vh9qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411418; c=relaxed/simple;
	bh=D60AujOfPZ0xT2zKJkyrcq2Rg0wSz8afS1KCAGi/hDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sk3kWUi7QNJThTZdxrEnQ9j7O3JXKt4F6yv7m0uVSGur9I+mgp+s+v5yFNyVhzVJ9qNyzzK5l08saWCTQlSbS/gh9we5kSuY7WIRU/078rGFp817SGSe+q40Xz7F9L6NDx30osaCkf2A+cWKJltPk8WLnnXcO5tUFFDcaqe1pFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oehiCSal; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oehiCSal"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6714af30a2cso1485280d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789411413; cv=none;
        d=google.com; s=arc-20260327;
        b=BVYQw72kUV0yT4TLTLKacmfwNmuAycZLfFpynqYiqOFlIjpKxgr7DZTTkOXMmOQtVx
         kvzP5pZenF9NaGUN9YNGrGyoKDpInrSdMoJkC/BmQ20VTuegwCGWkDgZ/dZb3iYYhoNL
         IXPGXhbqSyo6hhvZ2xn23ASZ8BEu8uTDiY0/KrjZ5vMe3MTLdcZqXBSTP2iwVy6JEGRd
         9+O5sJkvD4791pZb4tydALpy2SxOr0IiX1CExCkD4cKY8KJgT/185jPMzoxNFYKGnf0n
         eXOzR3ZRsfZFp7oeskiz+bMIn0JXNzX6eSf/v1TYkAvPK/Qija/YUKVjMqqzEOF4FhAA
         Ek/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        fh=TYVlvyWxBBLslWaymrnmPOn1KM7HElx8RaSay/o7o+k=;
        b=QWPmqVaTVc+mqZz/BMHMC0PQJx9VGwGbUygU4iqeUFRNKBMzhIe/SiF2aG0EIxjnqU
         1XuyG9cWsto8bWDD2a5L77Vw90UjUhbeRTqffynPrXYguSjqaJBkmJc3fcel6L+1knBY
         nZiaeE1kej0I2NOKeEq5wmAv+5z2o1ZeCY3DLJglAcB6Vt8guZxPYnWHUh1ExBOX2Z+D
         jVRbIExD+P/02vBnPs7b/VbZP1eKD6JGJuKbfYZfTQEoGkHs0QZXhf+2E4uLEfFkNHXm
         c/SrysOqpmBbdvqlQERkHM5si/DtenuPDVgdiMkkApABuvLBwhYdreJVLNBDL7h5zqss
         MECw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789411413; x=1790016213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        b=oehiCSal6mkocd3l0eyyBhL6M49PFLZaKereHNIo5IKdRfOHE+M3YJIhgLtEKXbxE4
         m4YguuBA5Fjy6vxGvM9k2PVI2arPGhcAcUgIEslDJtyXnTt3VEqkcp2GyKBnxj5XjSoA
         OgprWDC8XQ7QSThSf+bV7qKJD5kV4KnCwHqm2OxnB8ryopEewVbE47kPodAssBGF9eD8
         X9xq44zO/4g+gewqab4YmfR9vjJB1JLxSvAPacrNyhpEFfGgfLWKyzsLy5epmVXyed7N
         UbMmwPWFdRr3c0XsPIST9/hhnsCiTqZYMvmqfLiuk81/7MEcsJupEhE4MbOmTFN+SV2k
         PNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411413; x=1790016213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        b=jKPpEUiUcnFlryQFIIxXGfuMZZCtTbyVNBaDN+XrXhUHg6J9jPbe4arqdMzPyOhBLD
         HmGqyxMS9xi+FchUVa7ZcuJDdS8V4/BEDDm4R8HMGGxJ1TjfuvZmXqo8qiPZ2u0bRick
         a8pbYAIfNtnI68Uoze8YmwzhMwiQE/qG3ZbqB6vhhWfJnqGImfQVWFMaPc9I7WhcZElB
         f51Oy3/Yx7JUY5hcbCRVSPhS92zmE4+7KSAcTjOtvD/QqtdHNmMAeU6jUAGoANt4QDaI
         axdVv8oMs4HXX0+VgA9uNVjFJWqkwDQQbSlN0ScH4vrD7JIfTN+kvJQZnLetXUB39Uaq
         uFEg==
X-Forwarded-Encrypted: i=1; AKwUvBxVFSETfBev7jDYpi/E3umzPZaeGzsTc4CceEphVolDkRCnJ57SVfO/k87tJfniRDX7y9gVXQ6by3w4rGA=@vger.kernel.org
X-Gm-Message-State: AFuF++kI6iy32+5tQC4suxK2iI2pWEUVTbWJ4ExXquXqJ/wemrE3Oqru
	5nAkv/lSvroZ1JxiaJEp3ugYDXcuqNMCeWgpKs2LnKp3q4Ua2nTCKNWXwqumxS+olP2M+cCViKE
	NsCDqad3zd8pxHj0C6FvJaEArfrS3QOyEwLJpsDBhDA==
X-Gm-Gg: AYBFou0I1beya/sMRQ2s5dbBeiCaS8P2U2rMyWAyXPwUaJ/L4thwo+o1zJoiEUfc6KG
	P0ovwqEpQpgzhzuh0q7AdgnXNKN9yurZgtIaf70MNphsFvYNcvRLFCElUOUxvXxpQ18hIVHFe5X
	indqvA79gT3VLsajFQwEXELPHlOdUvgKMLpd0m+GyhIxyFqgm19Y4SVxH5cG7ZR7jk8z2nOw/I9
	eAeTQMiLWXwrCphKzZjJKz4wgJXFXRN1q9OWilinh7ZWoI93eMlzhxrN2z6ASPd3F+AifdhkMjc
	qPn9wGevyK6KNflXJbcWfnvVFTZ/Xy2c+rXSwvvv/IoA1frrw8tvKDzB1owCpFSJbZUS4Nsq2sc
	xeakAfcts5QQJoERJlSfJEHef
X-Received: by 2002:a05:690e:43cd:b0:671:2d01:48e3 with SMTP id
 956f58d0204a3-6714dff5dd3mr885822d50.29.1789411412494; Mon, 14 Sep 2026
 11:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 14 Sep 2026 13:43:18 -0500
X-Gm-Features: AcwNN1X6rEhWyvGZGxC5VaFgYQL-l7UNaKIM-imvsW05a09IZ7DLJYvbUNRH2HQ
Message-ID: <CAPLW+4=5KqfFxUQ5Td6PXfoKG-vdTkzYDF-sDAyODdXKSripzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:58=E2=80=AFAM Alexey Klimov <alexey.klimov@linar=
o.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 911643008b9f..2128749d7647 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -176,6 +176,11 @@ soc: soc@0 {
>                 #size-cells =3D <1>;
>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible =3D "samsung,exynos850-acpm-sram";
> +                       reg =3D <0x2039000 0x30000>;
> +               };
> +
>                 chipid@10000000 {
>                         compatible =3D "samsung,exynos850-chipid";
>                         reg =3D <0x10000000 0x100>;
>
> --
> 2.51.0
>
