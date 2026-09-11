Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635CA47606D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143726; cv=none; b=t5yLug8HHnMoEo9MvadJNpExIWsE3REQsHWI3NO1eBUZEgsPoj3ScCTujcA9gkulekOtlS8MIkeqKnnOMWQS/4gBV1XDYf328WZOjStimtx9s+53pcRou9IVBDfELi/o2IfYpLIKYdXd6mAiFEsfnPOFoGAp4gG+TJKFUn1nRk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143726; c=relaxed/simple;
	bh=GxfLvy1lNLqnB7cOHn1e+wG0w1lu+LJsHvlm3Jjb4j0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Awplz5IGkUK0KnX0V/1Trc1rnRiEj+6/rP+jZ4XWz2EDnhS5utUkiBHQk3byoP1uiv3bav9OUYFTxvmGJEo/qa4Mzmif9JxmMNQrC/tbidS88LxxzdbjGX89l7KUs1uzUl0tiS5b/M2MZosRpdfDQ+6uP71MnQFb7KpCRIw6EV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZwQ0qhGa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwQ0qhGa"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so12287905e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789143722; x=1789748522; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2u8iyN3q0EUKLYr5pleadR3LYPKgReYhURZxG75dAWM=;
        b=ZwQ0qhGaV6/PT65RDyP2g6qHmcWxAiCLfwzjGYgsaASBEHR8L8x5HdunFDG5OZbNpB
         78yGcMELWwm7PB6xD8CsIzzDKlaUZUYTXeT3VLBsaab0am0mlb+PR65D7IuaVSgETA2u
         jOKpYVLsfO+ZD0hHUpj8AD+FpElOyIVAoZJKmeLqN8qTuIYDvMeAdbcuD9yC1ILYMbyB
         G5dMJwLhJ26rumxuZwI+wh9Y8kiyFk4Pmc8R5mTbI1c4bMHGfCDYXC1Ni8uxObLxE48S
         vGX+cyHIrZEwSs0QXKqy6s+IxOst3rkYnR4DQlcFWrLZnM5+xa6sHjkMTcPW/QSncVN6
         Ociw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143722; x=1789748522;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2u8iyN3q0EUKLYr5pleadR3LYPKgReYhURZxG75dAWM=;
        b=doCFEtXVt/3Hke08bk+PYWc5g32RLy33sQ5L1aqGLOlMIfD0M4DAdFoBMfDWd1jFWK
         MpmFKZ/rmJfsHyll1SWM03cKrZ72opHub4eFFttxPET7R5aNTZLH7H7QrwM04pu0ypnd
         cqS5vOxNX7IBUA3HUWfMbvqrxuynDvMIIbMb4UQTkd02PFdMwhJVGNrSz2bntIIR7j32
         a2GZaN/h64Nx4HR3Y1Zh0vbNk3gacTB/GzwE0kC/IGBCYlFvPwieTfde5Qw368YvEt0Z
         gKS0BSjO1Sj/kaoZ2q5beo9Xx94SR4iRXmnt5/XXxjMYkzDBfN0VLq1/CmIiSOaXfsHu
         SGpw==
X-Forwarded-Encrypted: i=1; AKwUvBz6q5c73MYkSl1SU2CVgeleR3qWWYTu1MTrkIZOhH85C7eCfbfa9yKNpZwJ+vgaBh4LLxYQWyDejm3otTM=@vger.kernel.org
X-Gm-Message-State: AFuF++lcHkdt/qIZhg9+/4iyKDdwQcGgVAff/68U3kSGZTZ2w3prr1V5
	34RM55XaziPFr+C/559YbxtMIW7Ay9SiFzOEX3W1DLg75NdG2Ql/mp+W+VB0BZU0L+A=
X-Gm-Gg: AYBFou14vvzqp4CUDKDZk+hKtNr7fzE+lhjI92t/aAeFWduSorhnRQz0ucIHhX32b7u
	qFM9TVfNAusC3GqmabiiQKPxjjTAbTB/Qgnx3wyWfpIGwewQOVXo1tv2DTaA0h21eEjTLk1UITB
	prxjSw6RphWwFvNvBueP6iKPGNmUgslRmeV4EzKG2fnFebhzxflf8s5bUktUOgWTwJNj9Mp6Mn1
	xgRIpAT3B3sTxtAB/JDaetbrc8Rj0EjsM0Vwruhjqx5kIAFuAVGhQvvabfUxfOV2ivm0HIYXZel
	MWUXEPfIEKmU6GtR3AZQ5esqHqAkHJ5XG2GNjDdAuzjcCPTHLjNfVMvP9yMcsGgfZveAaS61zXx
	GEPdiLpKgAmZJYMdjpjok/wE5SQQp0SQJSmvJDqfrHPI9yZaYmlpgRSkfvrbYxXE6ArS/UtYj79
	Yx7oOm80yy/S9W9cBsH1uVy7xg/mvueX5rVvbILH0DiTlB+D5zfCi+bs2cwfRmum5/JT/6wcdTC
	zhLErueGrxllFJUG7l4EkDiCSNXed3pAIWbMY5CJbkn/jBYKYSKshqOLp31Ipj4Xi5mb9kK
X-Received: by 2002:a05:600d:6414:10b0:49c:fc6c:be16 with SMTP id 5b1f17b1804b1-49e619c64cfmr43100325e9.28.1789143722456;
        Fri, 11 Sep 2026 09:22:02 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm75330195e9.2.2026.09.11.09.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 17:22:01 +0100
Message-Id: <DLCMIMOI4D23.1YB1F2148RZE4@linaro.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Peter Griffin" <peter.griffin@linaro.org>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos850: Add acpm SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
 <20260727-exynos850_sram-v3-2-8627a49188ec@linaro.org>
 <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>
In-Reply-To: <CAPLW+4kBHV=pcK1WyEerQ=yg-_XcR+FMXe1W7OmrMX3hxcXo_Q@mail.gmail.com>

On Fri Sep 11, 2026 at 1:28 AM BST, Sam Protsenko wrote:
> On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@lina=
ro.org> wrote:
>>
>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>> information and configuration data. Add the SRAM node.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index 3881f573ec08..0b614caa411c 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -163,6 +163,11 @@ soc: soc@0 {
>>                 #size-cells =3D <1>;
>>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>>
>> +               apm_sram: sram@2039000 {
>> +                       compatible =3D "samsung,exynos850-acpm-sram";
>> +                       reg =3D <0x2039000 0x40000>;
>
> Why it's 0x40000? I checked the TRM, and it says iRAM APM area is from
> 0x02039000 to 0x02069000, which is 0x30000 (192 KiB). The downstream
> kernel (v4.14) also say the APM SRAM size is 0x30000.

Good catch. That's my bad.

Thanks,
Alexey

