Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794895389;
	b=vXuSbR5s4JVL2ZHW6jjP3jRrl2S6470vR4Ot3EX+7inzuonDqTKs9BvkZ8MfN7UC8g7a
	 Ht96/mHGsye4O0VCmrX6dxDO+bjqpO0yMS+NoMk9j7WhJEt1rFyidklAxaU7/5w4661m5
	 Ar4Sv2lAgYZND6Bhp9lB/Sk/7Fa744gUhYB+CqXzTmgTxu4pw9OGNUF8inLM3Mzi++D5F
	 xmOVumvoLvf69iNgBdnc58AofQWQLZUoYNtjR5qDvXgI2NRsJSXai3G+DUWWAqC8QALZr
	 EhvGa0o04qRomOe6wNkyooxS9S6/COG6og5HT8ClPxYeKcoRZd1t6a0i6Ckat8vnjag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
	b=VoRxJ7XBTnCOSKk3okYa5FOs49msGo0Ozbo1RUdsNUmvDNiwJQw7RyWJuJ3XziWDrjDj
	 bzsIogJd508aeXUTM7lOGWv/WeQQ5w7wDxzzZ3kQ1RnzOc2asc1wrdl9us2Rb+oB8WQe0
	 OsT7HU5ILlBYsllolOOg1/IrvtWnmTaxRx1JP7oLqfILBPC2gN7LymHLHrMu20LuoUSS+
	 Neh/Iw7dPidc9eSMy7dakoNDv1hpUZnDeLfiN9KxQKhW+KmnT2fuPnrHu8Cq98AcjyNF8
	 2/Sup9BzBbBxfX1vVOjuP+itQW8R72FUO1PnuyMatQfi06rD1Gqh+L4QxqSePTYZMqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxu+q6fg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C1D606A886
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C1D606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxu+q6fg
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b24f4b15c4so168928c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794895389; cv=none;
        d=google.com; s=arc-20260327;
        b=O9ly+TDQxsMwFGbyxZ9s4vj+v6X4dD85AYCmHTUSUIf1yEH85VSlPd4IMQDQcU6O2i
         zyVkWZB9Dte/pGOqeoZP+B4IQjDRGfjPUtbktRE6tHTS3KXYtaXTqDTvP7dDci68AGhr
         OaOqi/W2nw0SRDWcKF/VN/UyDyqV0dhFWMThVu8QGiwYJQg9PNwkwPvRrdE9JKZmwdCL
         kKpA1jcyGaQoqKw+2nME+i1nMsAoUhCpgHqs9iUk8OGsGKRuZ1+g0Y5B+TkvNI4tkYMP
         HVYhLT4k1BiX6Aw6fbjj2SzdZd19CeY17Kn1p6DQNlOToQZGs0GXWebPlji3e36ff5Bb
         QXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        fh=EhAx7YgBQGhUO//zhKWN2xPdmtU1cLJmzBOiUVGqUtE=;
        b=fpuO2OeJqFg5YsxD1ZUIKd1Bh4j0yOXBY/SghXYY7a1dVJQTWrdyHnfk/2KxrNVhLI
         8cUQcx6f3IxRVTx6KRBwR/2ys5VtAAV30nOBLDhnXvVe2r3ZHK5qtrNoJwhhQTPlM6W9
         2EGfnnCZrUbDKhaK0wZ3WXOTHQOYae3JFCbzf4G6Mo6JpNy28MonZc8CziUgC1dU/BPP
         cdiJYNyaBzrRZA2oQV0zhhs1It7DbP/bFRt1Ayt/D5qDY3lfOTVKj6ipZ6q21MZRNDZl
         OzSwgVUBQT+CicSzy+Ujly4RdUkhVwyoeppTOY/hn6JePWTV3E0WVVdSV1dowKmGx/P2
         OXpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895389; x=1795500189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        b=oxu+q6fgYWKxtHBHw8FvEpHrsqniQ8qJPoMRxryaL1MyrshMDryi758XSD277qDFDE
         6kQJ62qwIpdHfvwgQr8spoC/AFhwSMpfV9+iai3aUx0ROe87N+mIP3itcLpT80NDIawR
         jOjqE9ASRmOMDoROtB6AtMQBEIMtUDZIF0lpBpu1/MewronKUFiRIT3diqzTzylgYFC9
         pSHDQiLA9c/GONdGiNyXINVd26D3Bf2nK3FWnLoFMIjF+MR7LT8lMGuXmknfD8WCi9fR
         CygUu8XtbTumvS3Bvez5qc4mmqosPXuR8SsKIcokDd/8fXeaslqx7tFkFeBvjhRh4cvA
         AX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895389; x=1795500189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtMskDO3xi7yMmOKnTt+SllqsYFoqqAzPkEoXmAxvXU=;
        b=FlWdra2NCcgRQFXmCWL92mfcwYLjcDaKYiiDYT+/6X0wLtFCITs2yjaIQSK4KZV3bi
         +UKqETjzNhPNMl00sT9Pjb7YQDjOhr2Jm1vWGBNVOoPREu9P8QTl+74EnrhcTOmBfddT
         d/CbuHY42ZIGn5qAZLKsfCmV1Q+0dn3RlGCtKpurdoRHr/FGH2NtWfoxEzeUI+ahwb+N
         D1RriGyo9nhDs8iAHdKysqtm2JDFcZ6ICfAk6a8o5eCRLOBT+0N4GQtMI8rF/rrDscC+
         XRhYqVRS/YsI6GuCmJvNNbPMeuuK0GjAXi6SsV2nsjW0BFKQv6N1JiS/iybXq/NApz1u
         4bRA==
X-Forwarded-Encrypted: i=1; AL+hErHpZcnnvKYU8pbNH4xeqbmlfmcj22i6bCvx12+O9YK0SGvrwlplsmm7DbqndgOD07ROZSgvor7gCXkcmwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rktrfeDcqpLsGnYsnXiOtbLA2CtIcP4H4gQCzR4HhwV31Iab/
	b9bokqZFuk5Pce+bNZu7C2BbQ5UFP3hSVAhIVsVZJnU4RyDYdge70GwacLdI6EvkcagpsN3Wa1Y
	wi1Kzk+hruCMDBjTfr2UgPDhzj4R5F40=
X-Gm-Gg: AYBFou0E/7kf3LjQXqYglMNUnSTxO3RZ6hMKmUeH9FJ2T4WDtzlErQNNhE3hkPovn7g
	S7feE6kovBNkIsTQXsAX/4t+IT4PAeUfQMfGhlbQfzFgDP6w+ZMF+W1LTDiDxQSkCBSVtD/Vie8
	ApLweOcJYs4F7W5ylW7G+v6O1WAXS1qIiOR7L0NQFNweql+822TNy3JxXaSYAkcukxID02Ovhfg
	6Ypw4aJe5b0UiZ6mNyWzaDpUb19QucQ50TMqwGCpNKfBzuoO7M4EgeL5KWWFk0glTv7MGAjJnAa
	FqFkPQfNBvaYjheLAhDdgy7twcakQw8NYEpqfUr5cLny2QhZQMzoK8TShY+5/OgUIycQcFdn31L
	7brFZKPLzBJku2j2dsPZNtyaWA8+C/AmBxaIRbLw=
X-Received: by 2002:a05:701b:4586:20b0:1ab:cbd0:1c96 with SMTP id
 a92af1059eb24-1b53a429876mr1337313c88.4.1794895388323; Mon, 16 Nov 2026
 22:03:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com> <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
In-Reply-To: <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Tue, 17 Nov 2026 13:02:52 +0700
X-Gm-Features: AclHuK9yy_ki_wzibjw_yQRrzFByvuyKJxJWKjlXJNrv02S4I5fFrI_oRWpsa90
Message-ID: <CAAq9HC6kCspxX8DyDXp2RuhFSXmU=1p0s6xdOmjhGZ9gZgmj=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode switch
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 8:14=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.c=
om> wrote:
> >
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
> > mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
> > NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
> > probe is aborted:
> >
> >   psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain faile=
d
> >   with error -95
> >
> > Add support for the "skip-suspend-mode-switch" property. When present,
> > do not call psci_set_osi_mode() and continue with the topology that was
> > already built.
> >
> > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > [Reza Kurniawan: split out the patch, added log message for skip case, =
renamed
> >  the property, added property check at PSCI initialization]
> > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
> >  drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
> >  drivers/firmware/psci/psci.c          |  6 ++++--
> >  2 files changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cp=
uidle-psci-domain.c
> > index 5722365b94..cc9f14769b 100644
> > --- a/drivers/cpuidle/cpuidle-psci-domain.c
> > +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> > @@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platf=
orm_device *pdev)
> >         if (ret)
> >                 goto remove_pd;
> >
> > -       /* let's try to enable OSI. */
> > -       ret =3D psci_set_osi_mode(use_osi);
> > -       if (ret)
> > -               goto remove_pd;
> > +       if (of_property_read_bool(np, "skip-suspend-mode-switch")) {
>
> Rather than reading this property here and in the psci fw driver, I
> suggest we just do this in the fw driver.
>
> In other words, let's make psci_set_osi_mode() to succeed when
> "skip-suspend-mode-switch" is set.

Right, that makes a lot more sense. Thank you.

Best regards,
Reza
