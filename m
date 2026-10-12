Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562034107F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802626; cv=pass; b=lVC35GiVZDowGB3xt286TV8EvSiCl/efDOywOtS2e7eauQ69yfEtS8DT8LnSkRk9TrpshgXSbc9QZKzWqCVbxHEU+PaCF4cmxTj3hZYSRmKdXU+qo6Wxuai4r2B4Xi/Q9quGkh7X6mpklUGJZ0lTs7su24iOPOyqz0Y0BbXkqa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802626; c=relaxed/simple;
	bh=+kueSqtDkmmifGfg+cVRz9fNJOmsRyFdj0JLziYDbAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afwZelrSxwk7PH6q9lvBO27k5ztwhia6AnnUtIeACKi6u8lOTVdf6uH9t14mbLbi9A+3e+riO2F7kQ9bwZBcWzNvmG1kYAbS3Ezvqoq0qA16J0RWLmK4ku5gmDuvivJh/njYJV3vsr5VAXm95A3WXWgBqc4qEWV2G+BgLR59IjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/4UMKz/; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/4UMKz/"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2533d83e3bso274917666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791802624; cv=none;
        d=google.com; s=arc-20260327;
        b=pHthqTSoZI4vDLLPzUJd8p8Fb6RCgzRglIHQeBR7zG750orJCdAraNGbhste0dYlGc
         egUr4tv9KiHX0/jCOPAPZ2VirFBhOzCw6HvZvs3ZnlILy9jn8cVzFeT/QuCVc4sOZS16
         7YNAJHHLN6W+dvDa9DlcA4oWu16jj6of3ZLa2hqRaHITM2q5gnGygYhm1MsJt/NKBf3q
         upbgxsgWUxuDppCLPH6/0f5S7XYmdUaEeGn3KGEHUimhfMwk6Q9FXyGdGIkD2vSCIrF7
         WlehO1CNCk4cV1jZsqXgr71NZEislgWQkjtqzYncgAnFrt7h9JxrPABRlm96SzDPbabj
         nRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MTJutfJA4EZWAG366GZlUbyhAbT/TlSiSk9Yh0EFsdI=;
        fh=JILmmTwhcSEa7bRQlGDN86s72Y617iFrTu/ZiKFVwmo=;
        b=Oys6pfXo75OdJorE4IbcJvCq0uX+pEUdEbU0dLnqNcFpQoG3vOsil/NqYUX6PBoOtb
         KO8r1t8qiaJQ0/v66cA1GVdGaohFMIJseFWr9vA6bu+q4zs8bT0XjmZp2fLUNxLBevLI
         /HY1T6yGes4RguPVoJqtNlP2zNil4wg3OS7Hq9IJLRd3bI720I//KbRjPc/uZ5D9Ipub
         EUPLWiRw73wcPHlxW+7VQhRHtw4PTmNX5wY/dVd+5kHgJmcRTNgDtW7W6cxAJ7rtv0PE
         fhYkHSdzs9uGv6LnOUTXxjrOFC6j5g7UmGmdLU58AawbE9jrib4leXSf7lPwX8PL/5G0
         Ye2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791802624; x=1792407424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MTJutfJA4EZWAG366GZlUbyhAbT/TlSiSk9Yh0EFsdI=;
        b=F/4UMKz/k/J+nvY9qJtL0iFliLw51eQwsSvFWhRQ7E7GvumHvQEifOuosxqrUmFOw2
         z4fKtvAhliQ6VqQZ4spvsNH7jcioOvnM9slRCLAgT2GWzztWqUnoX9KARERu3ck/0Yvs
         jqevguxg/dTYcUubBodXYff7Y1UDnpHTeFn0/6NnXFrWkwTb4XDG+WyLhqXYbJFuZGmi
         xeLBp2Sib+351Yu6eivCgeTnnkTJMeIAF5WMmPqMQP4Y3UXNcRlkqz6wZhrsTOQs+swJ
         qaNm/4HdTuEJLPFsxe36D0xZ572gnTLPvGaBnHsQcrGwGDS3WJA/X81zUlDgjqGy0DeC
         51gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802624; x=1792407424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTJutfJA4EZWAG366GZlUbyhAbT/TlSiSk9Yh0EFsdI=;
        b=WLoNBS1mCzeBkGM+4XJc+3WVIhoNz2HijVTxOgzXPcID1GsMd4Uro4QX99Ahob8dUI
         L+R0FE9QYx5s3uYmGhBkkPeBV68w6bouK8YOXBcpYtef+nkAMx14CJAe2wgKcPB2K2ls
         dk4Ge88PF/41rLzlMW+G/dRjmhqq5yuI56P+ZH1Idw7v4R/FTd7zee2L2q9Z54TRx+yG
         ETYEpskP4uFWNfHajiwR3hEsdgCf0zd8ghuzq/CL7JqSBi9xSTMxqRYkPthUEUcfr7sS
         dgolO+dY1acgA+YQTAzFqRfQb1toZWHgDX9R9eUk3W5LywzLUax6NHNXIbjYwwm2/4gu
         psbw==
X-Forwarded-Encrypted: i=1; AKwUvBznCLKDWyBvMwiYpiflk71Fv93RIVoi50b+Cpj5Usl4gtolaMEow4WeDt95i7HacKXC1XaSxOukOAvN+1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeGa58ywyc1KInucrPFZwYhzXlVaRlZRUGeENK6GJarTezbysC
	jen47q7P9TLSM6z5gc4cXxSlIVLZFiXb9E37Cvql/1yf7MHVFrh4YKtTEtn7lUatGX4XxyOn/K5
	nDqUNKu2gcVffwWutFvOfT+EPiGNF8JQ=
X-Gm-Gg: AYBFou0wHby5H15gql9RLRGhRRyb3PSdp9PXgJRBM9Uv7B9gs6dICiKuPETy0ZupkAb
	G3SFjJwrwg87EwsvXaztYxUbXpOCbXPEDXz8qd7VFL78QLr1ZBHGsga6lL7r87RptLPsg5qQ5ii
	fJePIExJSch8OEMR9vBQOjZNp86JSsCiJ0jaMI75GyOPYknq2GmnI33Hrvjjj2utakp66K4ROHE
	JQNe+qNcRaY737ZUxcQ5dP5r4vSA7kDnkEKwCcT9CftynDVYhtSd4mMkYvEo/Cq2A4w1bWa1Plg
	QR3O0Pxt4m+BVA9hyT8oiwNkFiFlrGHqFYffVdEu/LgQy3G/i8v9tnSddE//z3fU51KhjTsWT56
	BwTVgSfBGTBsz
X-Received: by 2002:a17:907:3f24:b0:c29:f5d8:9c78 with SMTP id
 a640c23a62f3a-c31aa097abdmr895867566b.39.1791802623456; Mon, 12 Oct 2026
 03:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004154456.145362-1-clamor95@gmail.com> <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
In-Reply-To: <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 12 Oct 2026 13:56:48 +0300
X-Gm-Features: AclHuK_ZqxpgUVqij2whdQ3M4VYrk50vnAb18U15iemeFvFo2pCGgfBKHQG-j-Q
Message-ID: <CAPVz0n2SmOY3Cw2HpnpYd8eFXw7B=2mjP6LMhKCu5niN=KnOQg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices and fixes
To: Thierry Reding <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ion Agorria <ion@agorria.com>, 
	Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 12 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:5=
5 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BD=D0=B4, 4 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:=
45 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Add nodes for recently supported device (ALS, LED controllers, haptics)
> > along with minor tweaks and fixups.
> >
> > ---
> > Changes in v2:
> > - added USB configuration update commit
> > - added p895 power LED trigger update commit
> > ---
> >
> > Svyatoslav Ryhel (9):
> >   ARM: tegra: lg-x3: Adjust WiFi node
> >   ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
> >   ARM: tegra: lg-x3: Lower supported suspend mode
> >   ARM: tegra: lg-x3: Add light sensor node
> >   ARM: tegra: lg-x3: Add flash LEDs controller node
> >   ARM: tegra: lg-x3: Add haptic engine node
> >   ARM: tegra: lg-x3: Add backlight LED controller node
> >   ARM: tegra: lg-x3: Update USB configuration
> >   ARM: tegra: p895: Update power LED trigger
> >
> >  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
> >  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
> >  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 ++++++++++++++++++-
> >  3 files changed, 127 insertions(+), 10 deletions(-)
> >
> > --
> > 2.53.0
> >
>
> Hello Thierry!
> May you please pick this patch set if you are ok with it?
> Thank you!

Oh, you already did. Apologies!
