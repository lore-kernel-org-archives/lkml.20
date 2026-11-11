Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417704;
	b=0hqr8P1Yq7M1NB4hu0iVT0SK67snPfigMLvQ/NDOw5Em2gdgL6aU9Nh/ZXUcjWEupRHS
	 Vgo0G8JXV21jS1Dr7KNGsiV9arxk/OoQyXXgjuqL8IVo6HGKYPRFqV2nKOuCLDbjvXt2Z
	 c/+W3xa0LgciPT9CF6mY2qs328wm3/SmRo4byS6iv8CnJMB/ckj/bifZGlSuh+pUatqUD
	 kimwHJAugtSlCsqsqMrOEi5riv05LrKSfIuMV5NJzr9bltnQykPrxn97fYBGI7cMEBJPj
	 FSN749msTrF1VZAsWataqnkqSFshqGqvKQTpMh9gHHXyQaPOY3KqwhoUJQB8VmbEvFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417704;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4qCwkQDnBtxBbh7rhq6R5sT5K9c4cD8JwdX/ZdlMM80=;
	b=IuwyU+fPk0eK+4WyOw3kk4RAqEoW+vTaMCLB1gZ/P1s3TQejLzxWVPQ5Da/3N8D4ecUN
	 CoRVI90ukfR8++5qLmxcPxR4D5E4CAB8tgI8DYHKK3rbvITlFrl4DGhuSeaFBYn9wT3W9
	 MjwzV7ma4DjxU7JUVvMrwIRDpqGdPxboD8PZvCdjeF08uYkSslxDInIhKVbjFQ+BVS/vN
	 yKWbqLQMT1yf5y2fLsSE4oFP2CqnYDkgjhOXaLLIb7khNjyJ2CPp/9vTYxoZ0nd3o6ZUF
	 pO8xAG0Qc1kP0O7OSV/F1OQdJrvcFmVLDEOtrNgc/W7EcpqP5eNurCc6a0ZcAFlCyxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="icw/Semq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A26B606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icw/Semq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782661F00A09
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417704;
	bh=4qCwkQDnBtxBbh7rhq6R5sT5K9c4cD8JwdX/ZdlMM80=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=icw/SemqlYkSM0EoxDCEXEALO83kTWNNakwFTDrY0Bi1iLYSpzLY5vMLJbUtX1q/m
	 N/aALn0gNPbH6AL4sMxqmCGZm78cPS1rfs59XlrSlMD0JYfxTvPYprDdruemVHH/4v
	 Y8JJWRhsONeSIHKOSpGcDAE7UEF7t9FcNcSe6aXoDecf6MDaBscXCFj/ceaGrbLocD
	 QfwRAzlX9ACSeR5ksyf9Czh7AvLB1SlmmaP5WEjgHB8ciaIQ0gf30qAABbJP3TUkqE
	 v4iVSx3ui0vkw7mtyKtXhVBqsC5z/ekBqB1/pq0iG1CDABeoQ0gvifdxnu5mVGa7N9
	 I3EsgN/QkoNTA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so3191413e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:21:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGvbdKj2l48CDabfYh6O98PRO8tOZfBMKNDLFKlujCkZ+GGXxGJOKQbj7hU9dXuXxr4TYB/yhMeh0wMEJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jIprGz5/8pDQjnv6dan6kSIEJoh23Bzhn7Ay2/V1xqXKZXcnD
	4OUdF7ozxRbKXzS4KK5YX8FUKFe35ybCSz8mHexn/k8/arGeIO9L8TeKAh8fnfWivKdq7cJnWX3
	Hkh+GLSm741bqXEBlnGz2naahMwXhwuE=
X-Received: by 2002:a05:6512:3089:b0:5c1:4cb4:2810 with SMTP id
 2adb3069b0e04-5c15d5e777fmr1278870e87.15.1794417702887; Wed, 11 Nov 2026
 09:21:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084718.8222-1-paul.cercueil@bootlin.com>
 <CAJZ5v0hi_+FCGCXqV71GwgPDpymNZsUv9jRwjLK2BFJV3sqmiA@mail.gmail.com> <a4ed9e2914eff93e77842890bfaa72581d58c440.camel@bootlin.com>
In-Reply-To: <a4ed9e2914eff93e77842890bfaa72581d58c440.camel@bootlin.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 11 Nov 2026 18:21:29 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jq1yU9qmUL1=+9nAgL6vC+LFuANopRQEi8RsebeZoJug@mail.gmail.com>
X-Gm-Features: AclHuK-DPtg60uYz7aipP3S6W365TZGDc2q27pj9fE8jA8qdUb6h89LudX5mIQw
Message-ID: <CAJZ5v0jq1yU9qmUL1=+9nAgL6vC+LFuANopRQEi8RsebeZoJug@mail.gmail.com>
Subject: Re: [PATCH] ACPI: platform: Add basic support for ACPI 6.5 fixed
 clock resources
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 9:36=E2=80=AFAM Paul Cercueil <paul.cercueil@bootli=
n.com> wrote:
>
> Hi Rafael,
>
> Le mardi 10 novembre 2026 =C3=A0 18:18 +0100, Rafael J. Wysocki (Intel) a=
 =C3=A9crit :
> > On Tue, Nov 3, 2026 at 9:47=E2=80=AFAM Paul Cercueil <paul.cercueil@boo=
tlin.com>
> > wrote:
> > >
> > > ACPI 6.5 introduced a clock input resource descriptor, which allows t=
o
> > > specify in the ACPI tables what clocks are connected to a given devic=
e.
> > >
> > > This patch adds support for the most basic clock resource, which is t=
he
> > > one that represents a fixed clock. The new code will then create a
> > > clk_hw for each fixed clock resource, which is then made available to
> > > the device drivers, that can obtain it through a regular call to
> > > clk_get(NULL).
> > >
> > > Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> >
> > You need to look at Sashiko's feedback on this:
> >
> > https://sashiko.dev/#/patchset/20261103084718.8222-1-paul.cercueil%40bo=
otlin.com
>
> I was expecting Sashiko to send me an email, but it didn't?

For linux-acpi it doesn't send them, you need to check
https://sashiko.dev/#/?list=3Dorg.kernel.vger.linux-acpi

> I'll v2 with the feedback addressed.

Thanks!
