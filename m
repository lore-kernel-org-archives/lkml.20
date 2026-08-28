Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A407A449B3E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923518; cv=pass; b=DicCuAOohcsgGyZMlsjmNqJpoo0GrPFxOJ5nPEUWvgyCb4Rvp0DRXV7nzuzk5i9SoNOUaaGhIdY2L1pEXxufr0JV9BoMBl1SoFtcX29hf6lSGMROAzARCiq0Q7Wvbnx1Nin3cPaa6qjZLFcM6PvaAn7Ni0Ema1maFu4P24aXcXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923518; c=relaxed/simple;
	bh=jQCuxAKLPuTjC4o1Qbb81zb0BP3Q1HL9exaqQR2Uj0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xj65qQWqCfAfoNrQXAEXWOD0CI1nxXxu5kEWJRXTuM8ieZwFNTqkH+jm4jOD7A89KRqEqoqO4I2I/1rKnsCj/lrezLb7H09wANwEFYzhMjMUemKsEdgk49qQl34F9gYTGghcf5zR339zlFcXL4rNita11AkgJVlXJb5oGaZWNuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRo1nLs8; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRo1nLs8"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2531f453eeso161786966b.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923515; cv=none;
        d=google.com; s=arc-20260327;
        b=UVGhki487LKxw4gj3lWlJMUFCLh8BCRj1havObOr7MF7KVUDq9b9EA0m7yGpsy3w3R
         IEYWT/970SD8NuTJ3losluKHLrs7ez1LQKyx5HUr+u7i2eRyzf4fnifMOcTCNr+XYrS1
         sn2AmvNddvBqhmLrWqXd0iCIS+n6XAd1aZ8P3hQlLH/4/EYc+S0CcysM0i3CCWSjM+Lo
         Lar9ScolFDM69v+t/c7NhNYyT3Z3meyakAiw6UXQCUmbuPewHOkf5V5Kq6kyiTSAumjY
         5swOJXoOg9im2d6jIZY1Bs3727nmpqdKxdHSqikqsg4i8msgPbSKXlgW/VRV70MIQEHR
         9lsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFUxAfXixoS8jLZk5c6tfvBN2oNTN504XnBGH1O9OrU=;
        fh=qP7UwMAe07dxAp2CrANIimaO4bwF9bbevKdI8HuLlT4=;
        b=hr1WHdL1cYVWGbRc0/jRaLfpeU/MgbI9FaLg0Fy/Ug2buFNogf2SBWagEZIkGQIDBb
         S8OhNxZ435EYoeHVpDQ8p7Jtd9uPamVM/bOmBpaRcd9nTszXlOxPdWOJkfo4+wynxkPM
         cVYhzm4b6aMLXYQGr7KXSfPHZQmKjzobKVHH5NXodTdZEjPFxnj99IKPDt88sb9Khhmh
         R70hfNQCZa+Ke6EDae66MRWzJWBqaUI9M8pZWVBDob32ozOJ+pHkZfyHpKEmjZ4cMF8c
         lGcO0H+nd9RWhBsY3lV/4be814gxcIpvkKMOQiymBt+SwrHEZEVVIDpjEJA1xSDWJ6Oj
         2h9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923515; x=1788528315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zFUxAfXixoS8jLZk5c6tfvBN2oNTN504XnBGH1O9OrU=;
        b=WRo1nLs8LzVuvvB2vaKCWd/tJcM5pvkaO8tPZkJILHDJovxnOsqenZVMbZDFYmsbCq
         8otLz3qQkZu2DnE8UT1knjq7DmM6wo585l2kaH3qQw1yIfDX61UiGH664jw9ksHhWpLz
         K5O7msdiMFNjObW7K9TM0eBPPfhgcOzjQVDuhroPesadrjBqbCscsJNlTQEY/oz6SW/r
         95rTx94ZDCvcJbZDXYfdasAnr32B1TsYQGf8PrF7dBhOoY25uvIsV+X1bJW9qKChZbOk
         PucKX0/SCf6ESLWu4xmIfIZ2dBpr9VWXm21j07fLnkrdA2yRmguLdQXltBSfpCapmYD1
         ErkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923515; x=1788528315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFUxAfXixoS8jLZk5c6tfvBN2oNTN504XnBGH1O9OrU=;
        b=naOnuJMZEDKxOnWRDLHKm7EHwdvCmGhwrcmzvVRDBk8SbmzXB3xuHUnnwJhM3SxZpv
         ntlcbalA5pnvWifY93XImujlO69xz4w/kv2t5dDxoXDiRJe5zlwa2gp2FmUVGewLbJZZ
         /pNzIM0x5fAYm/YfVxdT9I7gJRVMdLnEL6WnqnmhfEBvQIiZ/hB8LWFXOCJr7/+rEqQZ
         AJ39sq3VHSLL4Vg0qxyqfsE6D77KN/Ez2cGK+QTimBiNPe38tMQNJdIilHAn/uPlQSna
         Ge+bo9EKkkwwN1cK/fJqBOYSiYt9DIMaE4NZwzJ2zKMZH417u8bpHOpSeSK+4ZJ557rE
         TFmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpyl0SiLDhZX9lxTr8hbrbyKpiIbOAAsUZME6fkOL+cmHMpS5eOmPpSunScTIJ8/LCD9CpaFeij8fHBIIg=@vger.kernel.org
X-Gm-Message-State: AFuF++kepLgB1qscpU4yloyYPYJvqSobaJcjmUdoHUPfAzo7jxuylfJo
	Wew+hcOF/QqaxyjFs/2Y4UQNOfBinwRDwUrcUpUtLuLzksmz4B2nehJTvcDpH0+30yYre95MygF
	QSRTSC/SSYXms0H7b7IcH+glf2Nhkw/o=
X-Gm-Gg: AR+sD120fkGflOl4phsYN23lXocRAv68UXt894nQI5OwAKQNWKYUieHcV9DGS+2xWw+
	xGuPhc+xEG9sUjhXto6dTdxWq8I/EXn9VJd0Xy+3gk03K3sT0P8oEwSunDoY8IDgU4nq042qJ6J
	LMrHHJDpkkRd1yY5v1YYGmUcY39YL/7lTbzLn8ijwtMtfUTFbPq4nbbtKfLtJN+eARqKIMUmmq/
	1E6gaeqkk8DDGc/HKaraoN7RPlF0fF+sNpMCmgMGO2fbezCrt4yo/DbkHZ+3PTJvJeQiRCI2+PV
	YsIs5dnYKGF0LDW8zSiQwc8H613HJ5+gu62RkIUjhTU8SdWdd05JIBoGr/iPDnmyHJQmGpHrrlb
	8xNfyV3M99oyv3CZ7oOt7Z1/wYroBJa3Dh17vioe7XTnFmOTFC2UaNe9q5qcdi3jg71/EWalC1k
	IQWAxD+Fjd76TCNfrkx0L0Kdtok4GXBgH6qbvGwCGxfw==
X-Received: by 2002:a17:906:1004:10b0:c25:5faf:b22c with SMTP id
 a640c23a62f3a-c255fafc38bmr250324266b.21.1787923514497; Fri, 28 Aug 2026
 06:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com> <20260827181756.2430054-6-mauriziocasciano7@gmail.com>
 <apFvSlkU9V1f1mrZ@kekkonen.localdomain>
In-Reply-To: <apFvSlkU9V1f1mrZ@kekkonen.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 28 Aug 2026 16:24:38 +0300
X-Gm-Features: AcwNN1WSOvUbreDrgg0-EtCl4ZwrYgBo4_tspVEmoj38PFDJAeL2DKx2J3CIroo
Message-ID: <CAHp75VfOba8pSw-4NhTOyzJxjEB97qfE+w+RjXEtdMrNEZMOOw@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] media: ov8858: Add INT3477 ACPI ID
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jose Maria Martin <jmmartinf@hotmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:21=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Thu, Aug 27, 2026 at 08:17:50PM +0200, Maurizio Casciano wrote:

> > +             .acpi_match_table =3D ov8858_acpi_match,
>
> Please use ACPI_PTR() for this one. (Also see
> <URL:https://lore.kernel.org/linux-media/20260828084328.257703-1-sakari.a=
ilus@linux.intel.com/T/#t>;
> this won't produce a compiler warning then.)

Why?! What's the point in having this?

--=20
With Best Regards,
Andy Shevchenko
