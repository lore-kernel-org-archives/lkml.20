Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C73137AA98
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788239363; cv=pass; b=TLVYHUP09eR44ufzsvnObap+/oUCCIpocC+Cxf//dCGVWRV3maPiwXxrgAXpe0XuB/WtA+9IDD7f0dj/sQ2vuZJA55DwGDNfJSmyy4hcWPy2/MV8+kIdq98e3MYpqkdBPlIGyfo93ZT1QD5tVDI5y/O5XQTcmXxNlkto8UGvDOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788239363; c=relaxed/simple;
	bh=7s9K1HoX9x+dEafgUdPowqAMD1KTmRH3WBaXqNwCyo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pR1pNOZCFlYqpSqq40z+AzzaeR/rySTR6s/QasBgJZwlq0b/8tnb7OV/Uy1rsmGyopDT9W8few4RCC0vTunjIthlif7bSFXkLD98nonnDyssNS7YjoR9t/kwrVFztebLuzektJkIPlhxXYH7OYaw9XVF4Ju5hCJ0d7trcDfcbY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJdt2UKi; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJdt2UKi"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441fa5c37so361710f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788239359; cv=none;
        d=google.com; s=arc-20260327;
        b=iNun9o9K6zdGk0wfMBcnfB6sgKrMTRl6p4NSO7bfhSS9+RzCCZES3M19AAd25Bh3xq
         BuL3OGWrKET0d+PVN3ALU8lFMQC4uJb2NJdhqd15XKDk1IU2pCorBJOGRx6DRFn+HcI0
         5dE06ImWu6PuGYjhQqOGAemk4ZycwzCjeFlhMerXRWn7iMoCPInR6zrHTeZsWTO1lH7R
         NCpTSKzM7H0kdju0zJCExlYmVikVt5XcExoyLpAdf52vr2JaIyRUefC9BTRKj2bKu2BB
         epSglIibje0y47v21A09MZVK5A+ruVx+s/2llA1JrR1NsDdrPw24ZlI0mxACUQQsHPBW
         97TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C2PUTgHcsLskwFoSohUTw+25rm8zLsVr2BA3a9dwt9o=;
        fh=ylL86aBUgziUnY7wEu48NN1sldCxmc66HGzByQ8x0M0=;
        b=LxwuTOHqvDI5Ugus1oyzyIcGZF045AlySi3CxOWx8AGdgQCQdOxcXLpdkObvUaOwkU
         JzvnSPvlgwTSqPHfpvIK+Fuoj+vBgZlapH4g8y5tUj4Ky2nP5hZOBcr12t/VUNbmsR1A
         aVAVxb25APQkodIXEu5jyYrI18qOp99dvK/oeGTGcu6doWlOCe+Z+Gb3N2vCX7sY0NQX
         ccBhzZy2L+CeK3D679plmNgN+MAVlpx5bv1yX3cH9YR9aePCXtQZI/W4+8Jy0NLrWEHc
         bzs5liUTPAp+Za6/aKtcSmLQM9d3ua6O1Wb+U4uQNhkCKUKWoU17IRSPQNkWRciy0OM8
         wzPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788239359; x=1788844159; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2PUTgHcsLskwFoSohUTw+25rm8zLsVr2BA3a9dwt9o=;
        b=kJdt2UKitBIJ/tlllxl1enM91Rrs6CyuiA8g5MQciu4xZlKdPq46ynuk4aIeLG1+OQ
         3RUFVFDuD/2RoLW6vixo0p6SEf1eSfCDyVVY0UbFqZ7pcq8YJQwv4LBP2xohPRq9dw9D
         6FAzXm7QiwPDtX0J6CuPtYMSfsWW1LIq/twOIM0NCMOm4ZKeDZrz9os6fSSs72KzKodw
         zbHxCUm+h3rWfICC3tKMyemiIKPwFYwzZ+b55DzvJp+glKAdp5ebBTlejZyxbXs/TXeA
         sQBPdWiTsZ+MrPQK7HGI66i4FCAkD/mbxdDVH8VJr1jDMTxn/MDQcEFTZIkOD8LPTOkG
         1DoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788239359; x=1788844159;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C2PUTgHcsLskwFoSohUTw+25rm8zLsVr2BA3a9dwt9o=;
        b=rlASI8anjaBHufK2hQ42VY3Uz584d32Q7casWEeuiYOdMS9g5TO/6q2Sp5B0t0Z83h
         T8MZWRjwd/J3ivlqVGYNJTKAvEabcgltY1Qon5ScmEHKhKIcnDfUMSozeJCaMwFXsTyB
         xCktAaCLwFXUlKVrt6G96bv6n3ERouB4o4RHOCr62s9D6u6EVOIMey2OaJg+gfbza54U
         kgMJweLPYuDVbcKkibCduwEvX4QaLrMvHlLooSHG4u2r8buShkYUSpUQivLLM+YrxERY
         Q9SCYqEzvRQjoQdJ6fT6pEn3P02s+ramiugFpTs6F2Oxy/U0ck5cLunE3ci4zwg6unDK
         zNow==
X-Forwarded-Encrypted: i=1; AKwUvBx8rhGVrTrEYTUoC/OTMWtliBVLIEnktcy/lpeqhyX4nZhEJLpnszC2HYf2wgvACURKFBvxbf4oi4SFWrw=@vger.kernel.org
X-Gm-Message-State: AFuF++luRenSlMhLb5nlKjP+XlwQCZwm52nFcUnYoNbx5jlG6veq+UMh
	cU13vcFi/ytzJll4EJInKhqwOU2xDczV76S14zNcqLuru2NPMVSMlXC2UbI7/Of06s8J7wyJgyc
	6V2FfcAD2O9dNXtjmILa1CzA4OnmW8W8=
X-Gm-Gg: AYBFou2YLY4SnDSCGtebbgQ5oO7hg4bKD93vhubMpzKKC3XWH0PaaxropCXJ07q8NAQ
	+70J290nNAMylpUSSX1pzo/aO613OBvUOAi6xhzXmmJhH9QLKjMJBi+5u+4pCWGpy4k6bu02Eg3
	YwoyIWD004aFESzs+sleRoBjhgDhr+TCrjqcLJqbWrnfAcPN7/sB+3zczIoG4VL7TP6rY9mbSFM
	MYUrV6bW78wI4IAKBVVgKxkPRr2d/58gEFHSIpEh6Fh4bA50Q84VT51IvAVfYMV7dV9zu0yEG2H
	WHtyfqsiNGz3o+85zCZJNwirwP8g4Hy0qFfYaCOV1OiPj6jk//5iFftZsOxAlxO9f8aZkABip8D
	shMn4wLWpkOYNsHtV5ewefFy1AiaMIwrPt6AnvlOU3yfHh1DbaasN4XwqBLoqay3SmVI8NtoW7m
	8X9882YGIHxcq084jMZGY2LX2DxBqvSSuuvcijU+t+ZgVYPWbs1nILEQmcWD9NItv041f+gv1KM
	qxTqNgfw3WoUje1xDQWNWmH8xz1exD0RE13veKHOP6I0T9t
X-Received: by 2002:a05:6000:4b03:b0:484:3311:4bfd with SMTP id
 ffacd0b85a97d-48433114d72mr35032962f8f.26.1788239359463; Mon, 31 Aug 2026
 22:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
In-Reply-To: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 1 Sep 2026 07:09:07 +0200
X-Gm-Features: AcwNN1W6wa__J-okjdxCBU1tskK66mBKa1zmpVquZePN-PuSotqSooLrbKb2NAY
Message-ID: <CALoEA-wDkFkKVLCkQOvntnw-cD76Gz=MVW6qNJL21Obn+s-wEQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] iio: temperature: make headers conform to IWYU
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 23:13, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> This series removes any instances of kernel.h in the temperature/
> subdirectory and cleans up the headers in order to improve readability
> and enforce IYWU instead of relying on transitive dependencies during
> the build process.
>
> I had Gemini generate a summary (a bit more verbose) of changed headers
> under the --- in each IWYU patch to improve the review process.
>
> This is part of an ongoing effort to remove kernel.h entirely from IIO.
>
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
> Changes in v2:
> - Add missing headers pointed out by Sashiko.
> - Swap <asm/div64.h> for <linux/math64.h> (Jonathan, Andy).
> - Squash small reordering patches with iwyu changes.
> - Link to v1: https://lore.kernel.org/r/20260822-kernel-header-removal-v1-0-ee31b124be11@gmail.com
>
> ---
> Joshua Crofts (11):
>       iio: temperature: iqs620at-temp: make headers conform to IWYU
>       iio: temperature: ltc2983: reorder headers
>       iio: temperature: ltc2983: make headers conform to IWYU
>       iio: temperature: mlx90632: make headers conform to IWYU
>       iio: temperature: mlx90635: make headers conform to IWYU
>       iio: temperature: tmp117: sort headers alphabetically
>       iio: temperature: tmp117: make headers conform to IWYU
>       iio: temperature: tsys01: reorder headers
>       iio: temperature: tsys01: make headers conform to IWYU
>       iio: temperature: tsys02d: reorder headers
>       iio: temperature: tsys02d: make headers conform to IWYU
>
>  drivers/iio/temperature/iqs620at-temp.c |  9 +++++++--
>  drivers/iio/temperature/ltc2983.c       | 19 +++++++++++++++----
>  drivers/iio/temperature/mlx90632.c      | 10 +++++++---
>  drivers/iio/temperature/mlx90635.c      | 11 +++++++----
>  drivers/iio/temperature/tmp117.c        |  9 +++++----
>  drivers/iio/temperature/tsys01.c        | 17 +++++++++++------
>  drivers/iio/temperature/tsys02d.c       | 12 +++++++++---
>  7 files changed, 61 insertions(+), 26 deletions(-)
> ---

I seem to be having b4 issues as this sent v2 again with the same
mistakes?

-- 
Kind regards

CJD
