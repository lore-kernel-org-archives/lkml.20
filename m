Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546B3B634E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775096; cv=none; b=oKTQ+OOFbCUb+bXX+cCNEBRGxQ+4ffKWvIR4WdTyUR9gsJljUjaxVkoo8T1JsKZZ0JMpvy/xXXbL19RgT9eU96Eo2TbXy1ja7UojI7PyUpfUxn/z1Ou7GWTzBZlNf/MoCDa9CcxdWIl25g0MtGgRzFXO9f20Z8hOuKHs3hXEtwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775096; c=relaxed/simple;
	bh=ZGmye4k+YlaE682WwEkiugdda8o32numJuLT15EPQAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLjdi0dzFdvHlzl0E/pa0Q39FSJerJt2//S7uP2tXeyzZRFEFWcQHakytfco2JAYAX9QKH8Ga+Psvzclc7zZ48lccwGs2M9qMMEoaX0k8j/skOAY0rtpM/IBsWehxhDgNCi1XZ15x+kM/0b3M5EGvgAdD5lD5ekTu1Ar9HLBU9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GT1HkxCU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GT1HkxCU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0DD1F0089A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790775088;
	bh=ZGmye4k+YlaE682WwEkiugdda8o32numJuLT15EPQAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GT1HkxCUlq5lAY6VxX/VR22i15kVTEZ489tua+CacZrypSkAw0YcJK/YX8Hqzb+Iu
	 31nZZcP0Ih+F7CgmPu3JamZBDfZy7PGyhT8HdyYfM4uT8xIrci6gBEoRsErLUTZmPD
	 WaDvOc1l9GwjnM0ED7anuoGBUFPS9SlPIcC/plKfzrQgu1uqwBCFPBfQ1X8LTGo92v
	 e1uLtDysTPZRc8G77/R7fYClmkWXDMkhCXcvygmi1ORfV3eZuSqXgZhSoQXVT3VH42
	 nosREihsZRWXU4V5Ui6odRRC8feZir3YU9OZPAzAUqH6FYFfFJeH/Hv5iWZaRgkQ3I
	 QQPhaRASusdyQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a771ad2a9aso6752061fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwscO/7kZ0BLOhJ7KkBaR/YcHjfYxViR9sAcDTqOWw/BYp1ltsdr9aXKfsri19zsQTGzIHj/f0xajkjE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMV0QHHKiiD8WT9rEcDjU3NpNOhIsUxFblsDET+7LlI3kM15Rf
	ERs/LrpzLywXpWjuSnTNAa7kLxhkLOvVdsMae79Is48qPmVinemvFYuRFqh+czxIGx7kPKB5II4
	V/ySiNwHZyDjxVQiwJJEAxKyoYz7li68=
X-Received: by 2002:a05:651c:2121:b0:3a5:a1f1:ac2e with SMTP id
 38308e7fff4ca-3a77920036fmr5378151fa.11.1790775087724; Wed, 30 Sep 2026
 06:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918143846.30458-1-linux@fw-web.de> <20260918143846.30458-2-linux@fw-web.de>
In-Reply-To: <20260918143846.30458-2-linux@fw-web.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:31:15 +0200
X-Gmail-Original-Message-ID: <CAD++jL=vfpwSv+HORuqjcC1y5-dUZAK+6Fex-=an7voV73X3Jw@mail.gmail.com>
X-Gm-Features: AclHuK9hmbqqQ-iAhBFOSqKzQS-M6vgJ1tGQehJYCcgvkhZw-sBpo6gT2urSL00
Message-ID: <CAD++jL=vfpwSv+HORuqjcC1y5-dUZAK+6Fex-=an7voV73X3Jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: add names
 for i2c-to-gpio chip
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 4:39=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> =
wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> Add line-names for the PCA9555 i2c to gpio expander to have more
> information in debugfs.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
