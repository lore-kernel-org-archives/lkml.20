Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D799042AF82
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976059; cv=pass; b=o/2gwyQdR6CByUD/Mjk/duPfI1acwpoReGYkqyNzz+iZEjDdGbCBux+ybtWP4wb/CDOwH3K3ukM6iV2HrD0Ga/bfNk6hQdO+EzGG8G7/2nO/deXHr5H+y4bedbtQ2ulvkVLGD4yNutn/v+JPXf+X1mVlBVDh4ZI9xWEoGtHPm7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976059; c=relaxed/simple;
	bh=57Sok7jJDa/57dP/GDfeHEhYnwuYZlpWnaikd4BSZrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crniq+feB5WmMHNDANb/c2OA1NuEKdbR/FlV1v4ni+xNe8bWgkwedSTmGmruPKR86QphKorQx0b0D8tStmDP2lU26xxYWr5+qyoVEDrXgAfyCRwvR9L6M2BUViUDyEFf1qBqzM4nLZQwVod6GofcsaSOfsF93zOhexxBggPAeUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRho8oHk; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRho8oHk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1878745a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789976057; cv=none;
        d=google.com; s=arc-20260327;
        b=cj8DhaQRq3JLfaZrD3owLHyVpgkINOU2reYYytZQn9SwKPy4xWXCwjAv49RTriRPFi
         GD3otiAhUdf1rVVs0PkrmfRgfBbuD2mHWC6KQe5qiACkwn1BPPglIsHkri8XZQ/HXxCD
         ZZuXtpPKwEsMN+yHq9u2ln9ZtoqDmfN1gRe2MxqFwPR4l++tCHvfrTPD5F0tNS2qBS6I
         HNFpUOwmcG3einDdAC5NzV4DoQ0gIRjJEhsz5RjeloW/p+OmedbjyTlG+yk0cyECft2L
         41dUAXakB80sY+hgw/9AgSk0fmXiLCH1eyk4BppPB4jtrIsXYzg4YqC0UFlAQwxpUxzU
         a5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i/KB7XKvlLtdNPe51SuZ6hkHW35ikyi0W/vUmCBDQwM=;
        fh=6/2PpRuUhKy2TqXbBXBMkPmNNXSUnNwDoPPkS324TzQ=;
        b=pGFY7KuAcWDkxt6j9CLNrtpngRNVbPcMDd8zhfZzmZp4Oec2LSZjMsHZmM4sUn0sEM
         0/WLN2teq+hR9CTKk3OVhqd7i1ARd5VPIfN91yfAUiVpawbQ9jgS+aqgYxr+Au/Vc7Cw
         Z9mRVzpINp3JQAn+HajzM6ab9PFsI2fn6cyfvvYxNdEVA5K4WMytdctmfOMwHFZSNHjb
         cvGHwOuqHT0UlIjV8xmvTKiiMD8HdVwONfkvlcf8QTYM17KEsR0ZO+YYWMRjbBBAWd/8
         VAoa7ACal8vHUODL+JH6Nqxfd/DyTI1tIByvUSl8cr84DUpgGxRSyOluzgGMk0RTmBHA
         tvtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789976057; x=1790580857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/KB7XKvlLtdNPe51SuZ6hkHW35ikyi0W/vUmCBDQwM=;
        b=bRho8oHkSZ6eNFFlMVFarqQ5ou6tGwP6n0eX0AMCacl0jOnq/EcGvM7lHBlgkmMQP7
         zLLh08JXmiwSrxOeMNy0Tw7uLfdHnUz1OHewAdYTttaeLiZZIRbpdqKAm1exhBXt0SJ2
         uwLkghVLI+wKYXaKcDPzLNu4LmatZLIhyK9LSr7vpCufUr4zYs+7bCeFlZ0tLLW0hSZD
         TgyIWK0sBY2F98z5zFIvPOsTthpcp0n1jNIxNiXIZlkb07px7TcCrRNBMw8uaYpQmBZT
         ni3Oas86iQDAeF7bEgd4d758qslkBQczuds/1ZuAokt+/PN415MLqRAZdPxSP20gQeeM
         UVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976057; x=1790580857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/KB7XKvlLtdNPe51SuZ6hkHW35ikyi0W/vUmCBDQwM=;
        b=0oqZ7imgTc3k8TqX7llwDFMt9Wg5GXJLjqpGvGh09TWEU9zAEgtATYfysorj63+lHw
         t1iEjdtowyZSA9MUKBrO7IWDCGhxLE6Tmrs3Lqa3w5JflZ9IH3Vy1vIxeucG0vYNYLFk
         k9BLy+MI1UkwEyaOZ3MPKem0aQkeFQEkaG71X9USbxnjZ2vlBrzx0PPXeXoGaHoLvjY8
         wkS23sSmhnB3VeOr+deHaWdaFv89guMIYkYpxB51a7tVWLuE96A/ZT6ls6pNOq3Ak4+z
         fEUzQsCKeRj2iGNewyRBdbYAUqDupYO9hl4e49wQztFBgseLl8H+tx27HRy27EZXLJuT
         Fuzg==
X-Forwarded-Encrypted: i=1; AKwUvBzj8UYzI65vGyQZK0ghpUZJucTcneNpoBx9FsWWBsXuc3ncTPupTdjzK4T3iFBU4PBlzdM3QNid0Uf9F/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mUF5bf9SFomfQ1wxuhFjF2uQly+86D55N7eRY1ep8aSVO5QWs/
	lFHbFW5wx53uPcewP5Wb6FjBOB0yjknb+UehXvDb082umHu1zeaNQ3AWMFnWaU8fK5Xz9Veq5G5
	LPhb3XglwIcs4a0szWmelb48qJdvg8vc=
X-Gm-Gg: AYBFou2wv5w+THfFWDP9h50Ho+SkoEojyrMtlFMawiPz0NnTQjoVqEzGrdLzbG0F3E1
	wjPqXqeU5Hq9gBtJoS4i1pPaPbX4fV0llztVO9uGQuPk+hT/PRsupfWeOQN9/Rhs4YTCkfy4MCb
	uEp3Y3lgTlpuCpFlHPReUqUFk00S23DdEQ2EbBMTkNA7Spm4l03zbGGWmiSIQwZ/VUum6v6ZVzq
	K4Om7Swb0NvvNzbmZKLXbGpLj/6O8tJljR5q4fs1z4zcgT+CPy1J3W9NSrroa29asPLUbszHfaO
	d2LmOsQ3oA/MSkWOSMGVxVbBdjx5/bEaQqbAoeTbNqgsy1jspJEanQF8kOaqoOPv9/EOG/y0nP7
	0Ws5My9AA9qoK
X-Received: by 2002:a17:90b:4b87:b0:39e:345b:3323 with SMTP id
 98e67ed59e1d1-39e54fb121dmr14066759a91.22.1789976057124; Mon, 21 Sep 2026
 00:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095233.420823-1-clamor95@gmail.com> <20260721095233.420823-5-clamor95@gmail.com>
 <CAPVz0n2rhZk0fjM06u=C5H4LgVOsN6ACriO1o+byx0dyqTwGzQ@mail.gmail.com> <CAPVz0n2mzwp-ffUu7tw5ojXgM=+G-PT3V9pHN--dT=dnYw5hHw@mail.gmail.com>
In-Reply-To: <CAPVz0n2mzwp-ffUu7tw5ojXgM=+G-PT3V9pHN--dT=dnYw5hHw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 21 Sep 2026 10:34:04 +0300
X-Gm-Features: AcwNN1W6gcxmcfy1bLN5jucC74BzWiaaqHA32OWE3YHnq2Or7J12ypc4KJW69uA
Message-ID: <CAPVz0n2ZeYk8WbWfW7L1kLsQN4e0mdQ7nM4Lozy16z9X8kPCWA@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 6 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 20:22 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=81=D1=80, 19 =D1=81=D0=B5=D1=80=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12=
:20 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > =D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:53 =
Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > >
> > > Add support for multimedia top button row of ASUS Transformer's Mobil=
e
> > > Dock keyboard. Driver is made that function keys (F1-F12) are used by
> > > default which suits average Linux use better and with pressing
> > > ScreenLock + AltGr function keys layout is switched to multimedia key=
s.
> > > Only Dock keyboard input events are tracked for AltGr pressing.
> > >
> > > Co-developed-by: Ion Agorria <ion@agorria.com>
> > > Signed-off-by: Ion Agorria <ion@agorria.com>
> > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/input/keyboard/Kconfig                |  10 +
> > >  drivers/input/keyboard/Makefile               |   1 +
> > >  .../input/keyboard/asus-transformer-ec-keys.c | 310 ++++++++++++++++=
++
> > >  3 files changed, 321 insertions(+)
> > >  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
> > >
> >
> > Hello Dmitry!
> >
> > May you please take a look? ATM only ACK on input patches left.
> >
> > Thank you!
>
> Hello Dmitry!
>
> May you please take a look? ATM only ACK on input patches left. I
> would like this patch set to move forward.
>
> Thank you!

Hello Dmitry!

May you please take a look? ATM only ACK on input patches left. I
would like this series to move forward. Thank you!
