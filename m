Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5344E21D00A;
	Sat, 12 Sep 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216901; cv=none; b=MEqsKmsJh/OkSmjm56Bf+HVpr2qdZDrizTmPwFXHjJFdxc+IHJzqTpyjmcO2gnzCVzMK9tAdwdQs0QWE0elJCEBhRktskBkgYFWPYNYqeECGLywn4INOk5UaRUlGw5/JaAK0YNHCIOX2Lk3uE/JycAruawt0lyh9hAu73I2ITTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216901; c=relaxed/simple;
	bh=g/pEqhnkpHm0z8rgEAHyFA5daCvErBvF4/BNaXixSoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hnd+LQ/UU9ZpEGj7hVKKJNQW10cAiXmKOyJwhnD+mg4OWcg0wBStQp148tbdMVekbMxfifaPNInnsZHa3a9XzwexTQ6UtLw9O/5N4qmqGeaZuc6p4eEnWWagUD9IGRGkqPhM+9StaOHBDfiElcHFaCYkFjabLHipIIE/b74Yl2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=YUi0DHbq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="YUi0DHbq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vcYxdHFVaT3A3UhEJHDH4JKBcMrG+Bk4FHzp8MJW9wI=; b=YUi0DHbq1FTxQjpS3c8/wRf/Xv
	HZHktQqIgqe3hnLAURzxfaJnJY9kgm4aE4fWVmP23VbsnkdwErBetYiisLpdDTZVsCXR4ZqyIJL+5
	5R9UE5xmokeGp9rX62xphcRPYBjgjjlJ+Hl+CBzQjJTh+N92yprp/PZ8XG1fv0sTo3PSwVKjOruUe
	wvzYtJ3b9w5HlL48Z5EKWY8jbwDJcl79+sPEW722V5Lz6tUyG9oU3XmDkL4XtZP2xJWcXPXHljn63
	P0A4trSTeWklI64l+GCLIUbRuPeXhk0/wP1KLXRtYzPmNfPEovNbbzpQ1bQRair6imQp8KVqQQGWZ
	z3CsikYA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>
Subject:
 Re: [PATCH] arm64: dts: rockchip: Fix i2c6 clock-frequency on NanoPC-T6
Date: Sat, 12 Sep 2026 14:41:32 +0200
Message-ID: <2071782.usQuhbGJ8B@phil>
In-Reply-To: <20260911152911.2088363-1-diederik@cknow-tech.com>
References: <20260911152911.2088363-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 11. September 2026, 17:28:33 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Diederik de Haas:
> The i2c6 bus needs to run at 200kHz, because at the default frequency of
> 100kHz it may fail to find the RTC resulting in warnings/errors like
>=20
>   rtc-hym8563 6-0051: no valid clock/calendar values available
>   rtc-hym8563 6-0051: hctosys: unable to read the hardware clock
>=20
> But only sometimes. This should not happen when there is a battery backing
> the RTC, yet it does ... sometimes.

I'm confused, shouldn't a slower clock always work?
Like I understand how a clock that is too fast can cause issues due
to hardware limitations, but running the bus slower somehow shouldn't
cause issues?


Heiko


