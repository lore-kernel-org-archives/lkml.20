Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794060394;
	b=zLNsFg76jpGWfOKoNTLiZuW6QAcF2HhMSEqdOsmt7w2ipet5nxazENwt9FZPdsDil+PM
	 egiflkDbLDRWX6EvpXqdLEuCCeacCv9p1BQ844QT+eZWkYcAoZ1K1m6N/OEjKgIgFI/qt
	 lltuL7pRHkJMuF1lAvbWn4l8phNbS1KpE4cvCSxi3Y6uJE9BWboMrVR1xknU2BkWOfLAz
	 +y6Chs+NuIy7qznHfmDL7LJrB8Q+k1gJcw62kwcJ7t+Yfn7wC9kfltls9O//4T4Dfa+ng
	 jzfWKJi0iU1SECRLwMQHgQ0HAfsCwm9NAV9JoId7xDAFpPKge/dfpMayAYuL/ru1FTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
	b=KlpGLwyFtELU7z6su8SjEIo0pxtqeHtMLn87IeC8ny/LWyk1fGeQXZ4VTAubAmIrBojb
	 ejgXvFmlMq9L6RpHpK8Q8nGn0/7v+QvAtNg+e7sx7sfFQnQ5zO3a0xHp8gRkgkokgzjfc
	 HjwRcHG6TZ2eDoylB2Z561eyU1iy/brO5k0R4xuUuiZzT8SYmIp0ABYNQ3GOiQKz+vh84
	 JNoc8sIEcGk2nTdCH2Q6QFsSFcHuoybX5w1dE1wFCHqTyLdeMy/qMvQbLYfk2Qc/fpyTq
	 kJbDRQe09UfnLa7GjReMRkzxWD4u9ITWKdLDn06+xxVbMTMdWAJL8cVyDTsYyPEec7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDBlyIAS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD6606D81D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDD6606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDBlyIAS
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so971587b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794060393; cv=none;
        d=google.com; s=arc-20260327;
        b=mFpqpMHGYFAfVyrNUma4lJeaY2Gh2rxn1WoT/HUqhYL2oFU97f3c6MjwgSbhrGOeQV
         CjFw/DGvG+YreUqzEn5Pq57nFjohellyELj5DSW44m4Xv3h6QU5UofAsFi4Ont1Q6SyN
         zBgy6l0wHK/eTQObRObSl4KXILS81Lnjb/zCzZdsYgHOPJP+OzR8Zgjar/k00Suyd5tR
         cmlxIwHXM6iJhW9VFSUVpoWSSF2e5Ltcm/gzWxD25JXQlzjtPPngWHnUMBDWfT3t/BSi
         25eZxSDdZaHsn19NW5RL1UwI5IkKZUa/K5aseCMEtQ/6AbmOltNd/eqG86Mflhw9lz69
         7MXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        fh=dg6stKcxh8/G2fNPypbU2ubuX/JR3SjCaANw1NSBm5E=;
        b=X8aM6mugguLyhqLie/4+qlV+sOpgEDUvp2pPuUPui0H4JcQHC5g4BfhrzzClT8gJyT
         ksmk3CoQcxMf62J6WTDEkOl0ro7JhBG2t2NFGjR7ZqJ5bclgMeYMdZMQJdGZ4AblEaPh
         TUC8SeKhMks8qSkukjOpEPN0bf9Mv/UGklVRkOKCzR12/5+Qz1F+1zVzhmOWn8D8esE0
         p2kNpTlXXKvUt3iTZHUypZ9VgH5Sois+tmkP+CnC1fFI8AZ0D7uqFf0YE9tlzZnxpupq
         DuCdTRnJsI4CProFuje7TPM1PLmYavJWpC2BuUfCB7njNFQJFHQTLOT0nGI6Cx8tziJe
         7hLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060393; x=1794665193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        b=dDBlyIASGe87airtRsC6OYAtSLt8d6JrbobgkmqzvHZG4f9MUAgKofmlBTqz06bmf7
         X6/cLnOfY0szRdLNS3X2edK4IKxHbjdDSXYPSt31ow1YyWXi1Kqjjm0QF8nHW2t4qXvA
         0NYnlBfL3p280jC12DBHa5hRcP3rn5qi3RG7leKLPOtEEwGOwBz4i3puzoxLu0A/ERDn
         tEb/Fe4tigaNJLz1eYJOyd+QMI2kRSEuRujtP7juCjFLv+Kx9QXavedEeGOPrXGBfMZd
         CXpWZX3fCI3edsCjV2z66r0g7h11SLsxjerD+lVx8K9D+fefPaf9swx/sLCRgFYnFBR9
         wFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060393; x=1794665193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        b=FGz7+iCEaR7ay6ETzxlcv6myJQHsQSR3yg4dtFCPUYvwMJxul2mPgdSz3BLhkLGgam
         WJthXy0EZJAwUKR4Oh7CeqOZwa980+Wvg/QDuP5/DIsczRd8wBbvkz0rpi/QlN/A6RPH
         tpeVmgLbV1N+w7l9vdQ2cQow0piRVy9rJ+JLCbYrIXkNJwQZAdFCQMlmr1NDyYCOG+AL
         dowPt/KGFyPdXgUbI2iD7IDeEZC9I4Qu1qDYHmKDqEfpcMlXrasWhzh7CVSmvG4X36Gi
         2VvoJrx5kLM55/DM0uMgPtvyD2DFs8gHcCs7fRGk5Yrxfskf94G+JT+Aj/gpp/Mdp1YP
         utZQ==
X-Forwarded-Encrypted: i=1; AL+hErFcZerMT29gX0G1O7SWCLhEFCAumI6LDZ9UtCkM1Awa1Gnlb2MNw91Q69OgyOwk8ykCUhUB5/O+EN6kRQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eoRahJmD5ZzQYMXxa66Vkp6wrBRvOKvQoqTi9+BhTX0V9juFu
	a8/aS1Kp4dE32cNJqI1XKamzm+x+Y0YrdnW0FrGn5SNg+FuvCrtiLRuaBTzPoWgVmHgmyWlk2nQ
	dHuRmmgCKw49ozMt0Dt9QZZ+fL7+lVO8=
X-Gm-Gg: AYBFou2SVKn/tJSYNtWO4ZAgVKBqAYrCpmrB9gBVK9KLAQq4aA0hSYlp+yY8gzFCfiu
	Q5YzppMF7IcHSf4LAH1qamNliYIzX+NtgDtnfB4/q89X9IciQNRmPIwCNn0YmL6o84csjMPm9yo
	LxgWaPiNIN68QX/IKykG4loLqE9IqN10uPWg9PjKeMe+CZCUXIRFyBt43gH7WbZq0Xy01gXT9IU
	fpAJOSc3Y8Lt/8Oy3BP/7GtpqoCS4g0VCIdk6qWbCsp7TJOSCgx8MnQlMI8lDPJ7x807RMnDuZr
	4vNfyGB39DCWDY69oGiWDXUJBW9WYwbce+U35SHomfBA0piB05PjmURQjWE1AXn3zJ14OnfRE7f
	Sp5RulrM6WVXTWGY4LUoguao8t3qaEVAwOPw44R80umg4X2fggbJBMsOHFf9nZaQS8iD9fVgzvO
	LkzFXPKTo4DDA3T0vdsyIJjMO3bu7I3meVxT9XK8yWNQ3emifkqFWJqWj5IIucthW+OJdeJ7fjI
	zkCHXI3ueduuNx2g7v7Ewkr1oj8Q+nOm1skTqWOdBxNKnCTaO4Z23BLYFwKRw==
X-Received: by 2002:a05:6a00:13a4:b0:8a0:21b2:7c7d with SMTP id
 d2e1a72fcca58-8b37525709bmr5141902b3a.0.1794060392907; Sat, 07 Nov 2026
 06:06:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org> <cover.1793882260.git.alx@kernel.org>
 <qwpovcqznx6eltou4inmj3v62qhh6ouvihqnze7bobnd7lmcbw@rcri4e623icb>
 <auyOkL1Vb1iKicS9@devuan> <auyV47xUCr1EJ7A3@ashevche-desk.local> <alpine.DEB.2.21.2611070239050.17804@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2611070239050.17804@angie.orcam.me.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 16:05:54 +0200
X-Gm-Features: AclHuK-WBq_EIF1I_SsYN7csCkMj3s3jbsrjUQ08xBHpkztbklIxJpPZrjAee2s
Message-ID: <CAHp75VcVT2kQO+URZbrH_3-A=4DMZU1KfcQsjDf6bNdtjf=t+w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add strprefix() and fix a bug with it
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Alejandro Colomar <alx+linux-hardening@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alejandro Colomar <alx@kernel.org>, linux-hardening@vger.kernel.org, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 4:42=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me.uk=
> wrote:
> On Thu, 5 Nov 2026, Andy Shevchenko wrote:
>
> > > But yeah, I can send them as separate threads, if that's the preferen=
ce
> > > here.
> >
> > Yes, in Linux kernel majority of the maintainers (a bit of speculation,
> > I haven't counted, but it feels like this to me) do want separate threa=
ds.
>
>  Cf. Documentation/process/submitting-patches.rst, section "Explicit
> In-Reply-To headers".

Even better! Thanks, Maciej, for the pointer!

--=20
With Best Regards,
Andy Shevchenko
