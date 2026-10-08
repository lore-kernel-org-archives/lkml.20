Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A00B4B1CF0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482960; cv=pass; b=rA4DMfbwW2M2uhk3L8m2zjwFBRSO9qOvAzusaQOcQ0Lzlf1l8EtOlasplGj1rpFYU9wQTCwBWrYagq0jAWmSY/wjvtscpFd8hNruieqjxn98WkzCtWUNrPUUKAyB8ggA84ShlkmrZ2yCnEan9eorR09WZjiq6VnQFP/2Mb0b2ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482960; c=relaxed/simple;
	bh=KxT4Y9zsXQgJ59xrv3sKm7LdhwIRRi7xOKRS1oy5H7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8YITRVq8E2HKmr3qVjBD4gHBJKxDWta2BNPwF1vNegqpj4/REdsvFGROKRp/ILm91L6jFPDVUn3Oz88x1i2UtWQ8Hwehw/4rbCh5p9tFGRbdk5GW97Lx7OcFw4LN6HjDbLXrPKGdfeO6I89/o9GF0immnxwkzy8iRaOwP/HfN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQGHAgkI; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQGHAgkI"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso40572391fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791482957; cv=none;
        d=google.com; s=arc-20260327;
        b=ce17ANrwvQ09wm6Kz4BUuvoTR+v1DgtjrEAir9bKwVAe6kD3AKzOLZd4ezl92ojmqq
         ntOXKxmlMI2/Tgie7vfHPp4b9sX245GjokXmXovc1g6hefEDtghyk2oC0mMYutbKDLlj
         6j1p6SOFO4ULTy7APkKiJNNu/tc/0jdRjColKbTFfNvMNEWySL1zBTXcy3CsXoElWZkK
         8b7DfDmQOBnRafeEpJYdBjh7J13+BlSrPweRt1uHgAw8R0hjIX4crAjSq733BtHmwUFc
         9z1W7jo1B6i2ZtpZAc8YioRQdhCMrMdJ+m5wwaLHoUGg/3gcx8Zhr1Oobk2qXd4WXq4S
         o7ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RPxkcZCoQwWe8FOKls5JzyPuIfhWZh8MaKmpG5RE1mI=;
        fh=HwJgtpSMBlXbH/SSd7+fd2OGtJACc/AuzNht90ZgEU8=;
        b=RO7uZm3qedthRRzpSN+LLIKmQ4hwgUyUWyEQQniUZsMKRTi14NBI7QiTm025SLv38N
         w3zwMCCoXtrJEVRUysueHeGm8zs7BDoWagvYTBpFDWBe8a3gGLWLYxymGX9Z5IhKkZiD
         eyOSnH9t8MECZxg//THxYGLvfmiB8n4QI6toWuMDo9iv7n/QaRRMSkNJ3rKwQgBpnhG4
         /y9pu0SDRSK7cMmXV1cL0g+rngi2y45mY8SPZxamCJDacn/kY4ooCCTwuqtopcxRqz5e
         oEwZ7MWqmG0hsqkgT7TL8FJbGQX/QZ5eB/b9QffV3BnlNBfI+I81Jkr8DKG3s54exaGq
         lMKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791482957; x=1792087757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RPxkcZCoQwWe8FOKls5JzyPuIfhWZh8MaKmpG5RE1mI=;
        b=LQGHAgkIle+871IGi/V9SrdL7Uuy2mrMUedtxpb6ii9+vHWLxVEZIMmzKxeLlAPwBW
         a2+39MhUtsUQqjCKo3P4c5WGalRsTxGrcwEoJRWUq95+Hku9YmyDyGVm0FEurjupGEgp
         ZqgFxExiOYdAEJKkfbuN9BFv+Vy+vGhpq003c/taWoU9Ae2ERHM2UVF05hIlleQoGbE/
         ZVeI6MoqrgwNh8rRRjh7suEUzWEH3/ocNVAUXBXist5w2l9LHLHye2w5GZDe6uDEV+tE
         lMHSgPKbo8BD93vaC70nDTM3e/DUns5I2rnO/P0HVJOd3gFvkfayzuHpa20xhn4CYBb8
         YKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791482957; x=1792087757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPxkcZCoQwWe8FOKls5JzyPuIfhWZh8MaKmpG5RE1mI=;
        b=IJPVsJ38LqYhMWaItyqCy6gabkSQiIvMnH04LADp+HAT9ynMNRRbsJU7CKsqmPUYHn
         4DSuA57LavVNj3PHTML/1VQVlvFmxKLhMjzXCqH96bemgy+YGNJgZJ0rp5i35y4DQ0XP
         m/7G9nYtLZPT9WXRVUO+euzyECM4wzu0vEufeytFD3mSWXXTfFsDK0FguDfi0LzldlYq
         iQ2oh32g5O1Z8r7zS4x/ECFt8AVU8NhboTmUFhH9Ydo0vpB+hbNIEGMboypb0tNwB9iz
         WarFFNh6FlEq45NtQYkP3hpwtCRJFe3lYOsfk8MlsfSpAKM3DuOujdAEqo+YDHFHDpix
         KU8w==
X-Forwarded-Encrypted: i=1; AKwUvBx/RUdh+w+/0EW4tK322fyR76O3Ds18p1E1wYT591UFyOM2tbxpS+G+7wrOJxMuOzZ3Rsd9QHrOIiUaUDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPwKIe19YGt6RH0dp+s99HQTL2NDiVYix2lAEDXMTgotobbiCw
	4VDFz5wKg/caCxWk2+j3UF0yzYPXStYY1jYOjinLw1t4/0AaVTxYAyFjt4OaFhga8Na184POyrG
	+aJdcfe5WKEaD4kWAet90I6/F9m8BhvY=
X-Gm-Gg: AYBFou0caJmYcNeg4mYsuvexw5ZGcNXQ6Jlbdjq87IE0OmDPkkucAh2M35C6K3YUg1d
	yPCp2u7+8640WUn287JTYLFGJM+3CqRQqFpsWPFT1/rqcEIxwwLV2PthejqSlnUoR4/UhXPArsq
	5Svtcrhll6rAIBjMnTt/LMsiAV0IrHy5tsfgrvo4D925eu2E0iS/tF2lM4dlAFdQlsUsjoALwDh
	FymCVrQffdQc9trTpz7lLZByKsK2SgB8/H26h0ZDOwrpRlrBk7dTU8kjtyXnSZ73X9zoCcpSMWG
	s4EYUPZsvXJriliOPUMFTkaYpg2jn0x3TedIa3Yrp3jSHHVmihhH/ae6MBAGNDNkjZA=
X-Received: by 2002:a2e:be0e:0:b0:3a6:772c:2763 with SMTP id
 38308e7fff4ca-3a9a2a7c465mr14671291fa.0.1791482956655; Thu, 08 Oct 2026
 11:09:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001090250.3395779-1-anilkaushikwireless@gmail.com> <20261007161806.5fa99d43@kernel.org>
In-Reply-To: <20261007161806.5fa99d43@kernel.org>
From: Anil Kaushik <anilkaushikwireless@gmail.com>
Date: Thu, 8 Oct 2026 23:39:04 +0530
X-Gm-Features: AclHuK8xmUT1LGXE2WjcPTZEqVRcu9RuW3ne0HEDBQ7q3YatP4qwo-Y7j2eoXtA
Message-ID: <CAG0Mgm8xRFOvRobAV+fRwyiZ66Jcv_L2-UN5scTKQ8dpMWS-cw@mail.gmail.com>
Subject: Re: [RFC net-next] netlink: specs: add genetlink-legacy spec for GTP
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Harald Welte <laforge@gnumonks.org>, 
	Donald Hunter <donald.hunter@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jakub

On Thu, Oct 8, 2026 at 4:48=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Thu,  1 Oct 2026 09:02:50 +0000 Anil Kaushik wrote:
> > The GTP (GPRS Tunnelling Protocol, user plane) generic netlink family
> > has no YAML specification under Documentation/netlink/specs/, so it
> > cannot be consumed by the ynl tooling used for user-space clients,
> > documentation and selftests.
> >
> > Add a genetlink-legacy spec describing the existing family: the PDP
> > context management commands (NEWPDP, DELPDP, GETPDP) and the GTP-U echo
> > request (ECHOREQ), the GTPA_* attribute set, and the "gtp" multicast
> > group. The spec is derived directly from include/uapi/linux/gtp.h and
> > the gtp_genl_policy / gtp_genl_ops tables in drivers/net/gtp.c; command
> > and attribute values match the existing uapi one-to-one.
> >
> > This only adds the description; there is no kernel code or uapi change.
>
> Do you have any plans to use this?

Yes. v2 adds a self test that uses the spec: it creates a gtp device, adds =
a
PDP context with newpdp, checks getpdp lists it, then delpdp removes it.
Writing it also surfaced a real bug in the driver (the get/dump replies put
the family id in the command field instead of a GTP_CMD_* value), so v2 is
now a small set of items: fix, spec, and the self test.

> Why send it as RFC and not PATCH?
I used RFC intentionally, to get feedback on whether a genetlink-legacy spe=
c
for an older family was required.

Regards
Anil
