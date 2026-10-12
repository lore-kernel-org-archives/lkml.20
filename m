Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF68426431
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831938; cv=pass; b=HkHRPv5s3v4tW1NQsKiFs5xcRDnS3jEMgpaxRiUZBxk9HDC4gjk+s89YsnrMcfoZv9PcXldb02gL92aSs+VyZpibL6Bzt65sDJA/04B2fQ0KSwMNziT+jHVVK6Mq4lgVl5WE247hYOJUrBTyhhGK3CFkYToqt20XRTXAYi0mcV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831938; c=relaxed/simple;
	bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cu8cKOuFTACWSG/H5t21752p5l3MWrEdZq4Fj5oceJYoVdm6bMg4/JUFmZMKtBP9y50tB1SbJyAqG4IOwM3bdT+tjAvSF9VdABPF/OCfc20DwqtG+klCa7Lg9Gqu5M84VozKZTpijf1wmCTVb5coxOBULn4M6kCaEP2SIL1LD54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAqr3BUU; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAqr3BUU"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a1981228f8so14693911fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791831935; cv=none;
        d=google.com; s=arc-20260327;
        b=T5HBL1q7uS0anlyIQg4BsXoKmqUIWQ+8zKA8JpD7yeVRe8D+I9pv1Blro4elEoN6Gk
         esV8qxvp/PeLwwEt8arwii5+z5p4LqMRokYxRA/UN1ghB/hid7rvXMGHYVxiVXmDPJJy
         GozNEfXdr8JGE4Jzee1dpPfa89zT8TvNaSdZUp99fyhSbG/DBZydXEnKbiaFDF+Fu4Oh
         XNSBGMufcxlZwKQmGMfeIHcI2W4yGild/T1Hr55VPZp0y9TDPavJC18FHq+fH8EL+nsq
         pD1sBOAqNQgQCVlyFZWZezY8/20PT+Rrkwmy1zj+ZWP3QYK/uhWXvpY7rGnJu5qmmoq9
         3UzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
        fh=ICnbRzkIjMKbt4aH4BgkHN/tA40vPVsqbI9qjlpEkmY=;
        b=Tb71JGYaM8gaHGPiBBkPdN+jAnJGAQUGzl5gVbK3jE94LNGh8Iy7Bbw9wy67dEUV7O
         C+GQmqwPjHtRnHmJMZQ1pt5corEh5gvRfYsfdsF6Wewfyd/OwVAFHtSS4M6Vi28d4M9f
         fhGkeohyh5tzKwqs+kgSFByXl4uLeni7YeIEII4AsL/QBmSoVnKtRlyx3CW3cuA8yMPy
         Qgee2XPGhw7RjO/KOm7Lp7NJZR3MfKsIvskL7ITBAtUIkrS46qaJibo9/yq033jMQxa5
         4WJW9xou1oXGuZ1Rv6cmSveCO/1p2xHcOV/dx7Jm1rikTOGB3VYpcNThhO83kRg4mm9O
         m5AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831935; x=1792436735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
        b=FAqr3BUUMWJwgzdnWGvrciVz3t/J6zYXWtgtyYCUqqXpfRWh7EmMTWsJmvl2cEktON
         9+Hb0yjeXZZPHbGO2ruBWCOC4CGgyCHNXG1tXx2g+rUy4EgczB7Di5j9TUKRd2+CDOM9
         /2Q1AVDQqjIcanDav8/OWdYgn3/nxJyE+jzQQ4a+qQxjYY8hchTEm3W9L6goA++QH58E
         yCrBiHZa/1agtlIrPD7UJZSf9F/6WUpTh476BC54kTVVSvKtqDQZ+TEc1x9GrohCcm/G
         HvwgzqWyRZm+i9gg2vM+kwCaAkt9+uNgsXOkYN8D11wMfe7XSePAsqIYostMpScuNh8d
         yrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831935; x=1792436735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aqi0un3hL+gNhz2+Wwi0ZammzcYe8ZTBCivH1kqaYcM=;
        b=2HU0WTvr0hGtz/Ih5gXqm3XbSq2YAsecz9tbDNNfJy4KTJ6d/Vy8x49RmBO6r2BqWj
         c++O9w+wvPlZV5EJh9djWjZ/tOXF5XwfI6P/XBqi6IfY7SRyD8rgbFcjcrBXqov3+zdQ
         i668Ob/AXMfY/iGDpPmVMsWP7WPyd4fzHq9KRdTGFuRm5XXH+nwynARPVlmc4F4atgVV
         t/VORxthu27bIhOFWs0WOXHXcnhCLE3+p7WKXv+745SWS25AeAOjtKyXikr0JoUPV3zB
         V5DubMCxL/6ku/h5GlOaKL9pPEj/i1bGlW2b8azEw/BAArQmEbvKLXGoYGVZ9H3XdfMd
         gJMg==
X-Forwarded-Encrypted: i=1; AKwUvBxkTq8SBqtvfbtp2OJjf5MU2mTJbRQX480OBL9fAFA+k9Ya2pVaXUxIoBOBMmNAZd6ekPiKE+884tVS3fE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTb1ugn9tHo1X5Ji1aYLJbY1g1PEMk1c+b+t/+P4xXfCwvjV4y
	zGaMFrgWVZuvAAL65ahieZXijEfrqmv+s9KJPT80gxaSQ6LvkOJZIpKY5NMLcyxneXFq8WC+dfk
	t6sjtkf7Z81xbv9WiHGEVW5SAGOQ71VsJZ8um
X-Gm-Gg: AYBFou3Dv4YxZQZgqf9d21F4D1+hZILILFqhklaO+Mlr/P55tUdRLHS0zJq5F2HQsZF
	GTg9M8KPJt+AQlbzkckHfuaMk67EVE0mYm1Jnsm6rJGsQR8bZljfJsG3+KM+F3+EP/PlRoEbdBe
	zhtdlGvpF9eOpo4B8l8a8BJFfrRjYaQPV6426j2hHOyALmHvTgL0UTDVk1Lezi5R8HKK5iIyAvI
	nBHtX+u1ILPXbGEJ9x1lni3HSoI6Pu+q3VMJ/rXq+f4N5ZlM+4/imtm3jWAH5sZxM1p6UndRN+Y
	veAvar/N/iX/Pyh/I+oC/R90eSiFuTlXDGNaOF/408pQfcd8tzI0BBTwZ2drZJmdiwy2n8h5LVB
	kTbPgwiZPMG0Et8jeEoUgBdWRclBynOpwNZSDvRutDRXCT+/qqPayN5Uy0ZHaUeYudq2jqgn+wy
	+UsTDwnJTljXTqzY1oSvJOeiBSRVFi+0E+34LN23Da
X-Received: by 2002:a2e:a7cf:0:b0:3a9:d937:7533 with SMTP id
 38308e7fff4ca-3a9d9377a0emr13474991fa.8.1791831934709; Mon, 12 Oct 2026
 12:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com> <20261012161322.930099-3-johnsingleton@google.com>
In-Reply-To: <20261012161322.930099-3-johnsingleton@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 22:04:56 +0300
X-Gm-Features: AclHuK9f5aLsO6tRB8JPOO5i8tyqnBzEGNnnFSk4_j7LARmv2pkfbPldrYw1a8I
Message-ID: <CAHp75VdjeG2kNzfRRAmHZp=++gOz48ifnKMCu0oPK=nZBewHPA@mail.gmail.com>
Subject: Re: [PATCH 3/3] staging: media: atomisp: Fix parameter indentation
 and block comments
To: johnsingleton@google.com
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:13=E2=80=AFPM John Singleton <johnsingleton@googl=
e.com> wrote:
>
> Replace leading spaces with tabs in function parameter lists and
> format multi-line comments according to kernel coding style.

Please, read the mail archive to understand why this patch is no-go.

--=20
With Best Regards,
Andy Shevchenko
