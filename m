Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253273;
	b=fBYu8Sdf7Rp0jnNCCchnfij2W99AlJMq1h7xr7Kfjcq1WDc6n0gaY+Ml7pzTDlBi9hK3
	 mEx+kKhXvdfrixCUDFnJPkmaEk8d1v+4ztJ7WY2oyr+1m3wkLt0jkoXqW5yXq2Ys46pFa
	 fseAzOUaS6pwewtAVt2+tOwsWkDcEeAkDMFWpiTCd2FogGaur6fevHfBqZc/UREO/yAD1
	 G719K1ZAu/E58X8UlH19X30Tl4ARjDttEjmUb33bCSlY597yJCHpiXYMcrva+dtW3qTMS
	 CMcPHT3N8Iy3H+d1zrFq53yjFLAHuhtU32yBUcoxWd0PrQStQThIuTYW9A0b0fhYPQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253273;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fHpmjgsECIJi25ho/DxnUi1oX2Fy65R+OMp2li13J7k=;
	b=LEibYn0P/BErHziCcAkHVlpwazthXSx+QO6WrehuB9VsXaCBtGaKRElcuJZwOhnqSsYg
	 TUEFbiUxTFsdPo5T1g6At5Io3iv/qFSRFN1AGiTgy2t9DSH3m7BfWfpXH5eCSogQBUYn1
	 LPYvhiVE2CVMHFnDGybg/+dlrOHemkNScrRrfYbdGmuos/q2j+dYB5LsdFwtsjuIaqE/z
	 PiwCUo9mw9denmsBKtXiJwkSvtRzW8KiD6SrFiFFDlztp7LNj8N6jFUtLDxbBp7toIL0L
	 rDUFzzTZTwYpEcQB6f0mZPyULDYybm0EADFbLQUHIdBnjMe2ONdCVwdRyoPHt851Edw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MF4ck2Pc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EE6606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MF4ck2Pc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BED31F008A1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794253272;
	bh=fHpmjgsECIJi25ho/DxnUi1oX2Fy65R+OMp2li13J7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MF4ck2Pc8I2KKygXZ4b4Y8mXk/y40jXRg8bD3N9msZKjNKjBygyDmfnRprZ2l559f
	 cegihAQrUpbeJcpuO5ptXxqZ3+6SlKRDEyfk0CMKR5mFoRfBuTSjtT9lYAJpHj7pOB
	 Zyrl1n/zLOGLz0kCHdkQsM5e24WKs033u0hvs74Bl9oUKJplsrLEbaMf9dSUFnzOPY
	 dQ2PK8IflS/TsQcxwjx+9i9px9Ehj7ZFad30L2LTPXzDjhJ0XJXFk8fpfQYoWdyCTX
	 KtNJnx1hlxt6kOk6BTzTX0h0GxqskUf5Ew2sYE0KEvQGZkQPMxsyPhiN7UXunEKX+c
	 Plujqm2rGEomg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so1172498e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:41:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHNirPxmJyZfcrrmSGI44wPtY+1x7SY4/BLR+4yNBnoUNCQH5i9Q4/ymxyZTjxy/1neuRcdPN6J9QUgZYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8nb3HeZRYcNbW1Di/8lP7uCNeWcPt3WN/RiK4X451WZXxK9+F
	AhlZUQhtvmwHbbeuxiIPSYbIwxGDFZnivWM3q3H9K9Oa31i93a9weAQpipLN90AweS0VNcZpVhx
	wt7Re32q3LAWcuuIE732Q2UPl0O6ovuI=
X-Received: by 2002:a05:6512:3d91:b0:5c1:5006:9e8e with SMTP id
 2adb3069b0e04-5c156e8b6e8mr132729e87.29.1794253271030; Mon, 09 Nov 2026
 11:41:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027161650.59170-1-mail@taterr.org>
In-Reply-To: <20261027161650.59170-1-mail@taterr.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 20:40:57 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gJGTY6F4gXPvaAPYQdA=3hqJu0+TyO9GMugQM5UQxzxw@mail.gmail.com>
X-Gm-Features: AclHuK9zrMj8xCWUkjHiVZslksOZ0-hUZelgJ8Pb4AIwM2FFKBbdpep1khz9AuM
Message-ID: <CAJZ5v0gJGTY6F4gXPvaAPYQdA=3hqJu0+TyO9GMugQM5UQxzxw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: fan: add missing MODULE_DESCRIPTION()
To: George Karagounis <taterraster@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mail@taterr.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:16=E2=80=AFPM George Karagounis <taterraster@gmai=
l.com> wrote:
>
> modpost now warns about modules without a MODULE_DESCRIPTION macro.
>
> Add one for the ACPI fan driver to silence the warning and provide
>
> proper module metadata.
>
> Signed-off-by: George Karagounis <mail@taterr.org>
> ---
>  drivers/acpi/fan_attr.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/acpi/fan_attr.c b/drivers/acpi/fan_attr.c
> index 9b7fa52f3c2a..6b3d91c14f5c 100644
> --- a/drivers/acpi/fan_attr.c
> +++ b/drivers/acpi/fan_attr.c
> @@ -15,6 +15,7 @@
>  #include "fan.h"
>
>  MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Extra sysfs attributes for the ACPI fan driver");
>
>  static ssize_t show_state(struct device *dev, struct device_attribute *a=
ttr, char *buf)
>  {
> --

Applied as 7.5 material, thanks!
