Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799326;
	b=km/VIlqqD5wyXhcb4lLzCAfhuHoLHOrPWxwWwSkImGSDkncBxY+N4sNM2KF0X5xtnpsa
	 xhpyHvP/PQ9Zge8OkXxRkMgTs1L9ExIYvY1G2PXBwWwI9LCarSSK8+ln6n+ihlw1XCD9+
	 5S5PSvtnlWRAzN29sq1VQgtXBlEclFibFP7IuOoKVz+Iu3rNT74G0n06L/hTqLyR0+OIA
	 pRL/25mmRNL2scLCPGNvTRVASggzVCchn3aR+4Jmn9pIZQ7VIyYBwlAU0A2AQpzgrRzhF
	 c04YkVghtw6Nmq7v5VJNb3ZVbyRUbZnSQFnYOjECj0yGPLzeQUP37PQrdlapQyQbZbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799326;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wQ2DQuZujCN0+Kyae46DtEB2+ByGVe2zWqmti4Oq8FE=;
	b=HMeqn7LxHl5NG1TMaxbn8yCthKOKcxdfudd7vcWo9+6ByYdgpDbxWBuz4Yn/Jjb6U43V
	 GfaaqegFYuuL993MHAT16HaRzo++kfk0kyUHvsMV8/LcQ13mjx0GrmuNwyrgIou6UEcUF
	 EM2XQPYDQ0u0Ma11yDSYqxCRjOmCjetMIj5w0H55vShIE1HdaHypVJkV7qAzHEFvhaxpG
	 VEHdGIUPno8MYcD7H7CEpeG1PbNgM+9GcmHv9WlwnRO9JEjv4B+RJgCRtIWWPzQ2Mcve0
	 +YKwaGJqJnWAK4SondTYI7eX+BKWLRuLpMP+rNOkB9He10ZPuwOhQjD1PsV2g09c6VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRQT11lp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD41C606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRQT11lp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72ED91F00A18
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799325;
	bh=wQ2DQuZujCN0+Kyae46DtEB2+ByGVe2zWqmti4Oq8FE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bRQT11lp4jELhMDanVhWxxaqAnDFtBpqKiA3RNTO6IlAYMZ1e0TDHUjPtSiNxfSWM
	 4VbNUC9pQ5SIFXGq/n4ecmQRE0KWMLxjn8CI0bzcAjFvnJKoKNu2FvczmXlDsa+lN8
	 8IK+UKyefYKznvaIYKPuJAsuBWRQX6Ys7B5bH/1nyFyejvXFTIkla/5MxXWdlkfKQ+
	 3jkUMnuQoRpZSp5tqW8LzvHpanWj8769B/BUTQMvwBvSh0OUvddXDDr85sXquvu+NU
	 gkZv+zw2wEI063W6XI4P+F2N50S+UDUS66rqO+wNyL+FPI8cq1iA8oKjXtoMsDAGC2
	 65uQ2i/Mbdtvg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so708583e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:35:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz8zEqQKnYflyoi3EMBbW9NTd9V3XaLE8+jQMm2L++ig5Clyo1Xx5d6ggb2Oik3PaKYBWV70iD74b9AxvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z88mv4t9+ak1tdpUtqaqg0UciOHxF1Z/xnd5g5q0M6o2jK+8Ozi
	nqGut8F0jIECAt/7DGoyTcHsAi9NdLuonSj8DXwYfJNsMo1lNIeYn9n3pMpK3iemf/gG71hFFzD
	XbQepvOMfnm/xzAQ9LF08Shg5fuIVj5k=
X-Received: by 2002:a05:6512:31cf:b0:5bf:b96b:bce6 with SMTP id
 2adb3069b0e04-5bfd94ccb81mr5298607e87.0.1793799324268; Wed, 04 Nov 2026
 05:35:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024051639.67806-1-olivier@mgcrea.io>
In-Reply-To: <20261024051639.67806-1-olivier@mgcrea.io>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:35:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkYXYkqk==52CZ1gNPV+eUf+DC8NFjoQuiOcALQ7ip+pQ@mail.gmail.com>
X-Gm-Features: AclHuK9C-S9DBBoaZ5P4feHaKF3nMSq1BJe9p_BTWVci8vcRZ0ncVj6tNlA8_ec
Message-ID: <CAD++jLkYXYkqk==52CZ1gNPV+eUf+DC8NFjoQuiOcALQ7ip+pQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ingenic: Add the X1600's 32 kHz clock output
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 7:17=E2=80=AFAM Olivier Louvignes <olivier@mgcrea.i=
o> wrote:

> PC26's function 0 puts out the RTC's 32 kHz clock. The vendor device
> tree calls that pin setting "rtc32k-enable" (function 5 is its
> "rtc32k-disable"). Add an "rtc32k" group and function for it.
>
> Used on a HiBy R1, whose Bluetooth chip takes it as its sleep clock: on
> a cold boot without it the chip does not answer its reset, with it the
> chip comes up. The clock on the pin was not measured.
>
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

Patch applied!

Yours,
Linus Walleij
