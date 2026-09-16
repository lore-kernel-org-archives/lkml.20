Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C3B19E992
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564185; cv=none; b=h5kDwmW9IVNArvhbbs1mhRiQ8DI/6NhH68XMx4YmcZUsMOH2YMq1W9EIjJ06XKmwxQBzF7YndqoEk0Ed13rqe5gdyGbgehUAhN+UDp17VcqkgOu+6aWGC6jiyn+uwVdbAc+Z+TR35oSXyjjzVCmsKpCY13r73hwxJO8wv2zxn8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564185; c=relaxed/simple;
	bh=zIAw7Kn16IWQF6hkJx9eCMLQYGdj3O74UJI+LU92OI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slgI7NMZYCu0kTcWDzhvR1w3VoFTQuZbnvi07UrDA8YtheDErYZvRVapCr6TS1rkN8FTmNYl2gpFmYUTWYvI/G/RFYWi3iWrV6T2/0tq4pIbpnN0XC3oAj6JMrJX5W5wlpRfpeU0fq6VrmFgqMx0ZQTdwjz0GcUCP8nWDKvw764=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1/vgVdN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1/vgVdN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1F41F0089F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564184;
	bh=zIAw7Kn16IWQF6hkJx9eCMLQYGdj3O74UJI+LU92OI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O1/vgVdNSNRZux7bqrCEv+QnLOu3Ftgcc6gWuAp2cJ9KFba8ZpnRJ3HwLl0+SQDFT
	 r1oGRci5xVxzBeiqj0/Z1G/8Qc7UBrkWrtjoyoOSv7e8YM6Rb61DNWDfnNvu/0cHsx
	 1PpWtGwzGpm+Qvas6gbfXtmkKbM8kCNZmuzjZn7Vg6keuWc2CyCgPwtWj+7mcazOQ6
	 yCFHgfKj0hnUCqHqPOk7K1efhXiyxcch8PmHMURvzlDpDbbe+Mur+5n+B+EXPR0sza
	 vLuHMhyvR+ABYZs1gyHz8zSuCds118nvqHNSil0ohxUYzWRcxMXOSkAZKLXJSCwalV
	 FTHBCI9cxXOkQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so814090e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:09:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByI7D5BgMQY80N26a822lIT0vtcOHzwSIu4IWK9/vZJSQfLYIWA5Q2YStJM+yJiH2yVA1q3JVJ50pDgwhc=@vger.kernel.org
X-Gm-Message-State: AFuF++nXsmMErxhkIOnVGLVr9YkFHjTqg4ydYac5HTI0FVP0UfjrXNJl
	bc1GcmV4f3GIyUHsRRNrWuWEC+ZKuz/habGpAei5cdO8uss34cOzyU4WoGRdqmkwqC9dmM1YVLx
	+TuLhiC7F3Kc0z7z64wUbfFMdK9C4hes=
X-Received: by 2002:a05:6512:1284:b0:5b6:183c:5c9e with SMTP id
 2adb3069b0e04-5b8b665ea6dmr774447e87.60.1789564183210; Wed, 16 Sep 2026
 06:09:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
 <20260830065118.51551-3-changhuang.liang@starfivetech.com>
 <417251d0-c2cc-4e10-940d-b75ab20acdec@kernel.org> <ZQ4PR01MB12022D97EFD74D5A80DBBE34F2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ4PR01MB12022D97EFD74D5A80DBBE34F2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:09:30 +0200
X-Gmail-Original-Message-ID: <CAD++jLm7hQnCHACsZH0LVnXuCJm0dZ6Bq0hAyOTvVomy6WVRug@mail.gmail.com>
X-Gm-Features: AcwNN1XPJDe-2PlzHCjv8cbib3jJOcjtWtHbDxVqBmwqzDlHLJ8Gwuhb94cSH7c
Message-ID: <CAD++jLm7hQnCHACsZH0LVnXuCJm0dZ6Bq0hAyOTvVomy6WVRug@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] soc: starfive: Add JHB100 UART Routing driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:35=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> I may have misunderstood something=EF=BC=8Cplease correct me if I'm wrong=
:
>
> I have found two subsystems related to multiplexing so far:
>
> /drivers/pinctrl and /drivers/mux. However, neither of them seems to prov=
ide a
> user-space interface for switching multiplexing values.
>
> Do you have any suggestions on this?

Instead of making a "fix on the side" locally in a driver, improve
the existing subsystems.

If you want a way to flag certain pin multiplexing as user
selectable and expose them to userspace, work inside the
pin control subsystem to establish an ABI for that for
everyone to use, no local hacks.

Yours,
Linus Walleij
