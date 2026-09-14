Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C0B3E8326
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372238; cv=none; b=lhhMU0pPt9PXfasXSWdxYSNbjBM4/WQwJ54OgqWj19df7HM981fdv+rqzCHlTkYZO8sI1fB0ToRFXEZfsGtn8DlGmlG3MsNCcDge3X0wbilAEncWH/adGFrfek2Rki36QHyr9loNER7qfzOxQDAi1/5qY6plDcWCtPwYT3UOYiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372238; c=relaxed/simple;
	bh=p1bf26cpBtPB0U9zcY5DDbUGI01ckW+n6knuU40RmMg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QSj1zA4IhE87HeZ5rKfnZgPqNZShPmhbwfCiWLqzLNB192uubP/QZL3TA82oyD+w14IlDA0kAEp2V0n0U7+gJ5w/d7c+HN2IQ3F+SoRLvucRe9xmOs3qx2TWKfZzk3YiUy8eM0dVkYjG9oSB1a6hP0u7RcTOh91JbsIDMzOrlw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jwMwFz4X; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jwMwFz4X"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E1494E4059E;
	Mon, 14 Sep 2026 07:50:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11FCD60323;
	Mon, 14 Sep 2026 07:50:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E51811C7AFDB;
	Mon, 14 Sep 2026 09:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789372227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nNo7XDqMJw+rkLiTqc/p/okr39fN3u5yh+iKovJ2F50=;
	b=jwMwFz4XP+UO4+cMrG+2gyvE28PCmwIYETEElLtIYpkfNUiqQZw2aIordFGwIplwLjZbjY
	Ft77nm8+tnnUNzkoABkncT1NnIqAw+x9QMJrKdHJSgXtKf+0bKbEm0xiEskSzlaa8nyUPM
	ZKBE5Gg085H9fMoQ1SQwDPFr5QRwYghDWJsGo6CyqNsklacTnBsTtNpK9rLHZEEXXs2I4K
	1yYuqDoo8/UkiLwdRtR3zTdeTtbXpAoCHK8TNT7EYdEtV6rkSBklUoqfOcuYF9ITJOVpNY
	KlEShqAGV7eeY4Jbpl5c/ZtuO/2qG0HdV2boznUvXfcUvLCF7qXdXN5it2BMIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,  Daniel
 Lezcano <daniel.lezcano@kernel.org>,  Thomas Gleixner <tglx@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>,
  linux-renesas-soc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  Pascal Eberhard <pascal.eberhard@se.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
In-Reply-To: <aqeWkVB4SWuD4_tB@ninjato> (Wolfram Sang's message of "Mon, 14
	Sep 2026 08:39:13 +0200")
References: <20260911150456.893761-1-herve.codina@bootlin.com>
	<20260911150456.893761-3-herve.codina@bootlin.com>
	<aqeWkVB4SWuD4_tB@ninjato>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 14 Sep 2026 09:50:24 +0200
Message-ID: <87mrtkp8zj.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


>> The Renesas RZ/N1 timer block controller is the controller in charge of
>> timers available in the Renesas RZ/N1 SoCs family.
>>=20
>> This controller handles 8 timers:
>>   - 6 16-bit timers
>>   - 2 32-bit timers
>>=20
>> Each timer has its own interrupt, its own prescaler that can be used to
>> divide the clock by 25 and all of them can work in either one-shot or
>> periodic mode.
>>=20
>> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.c=
om>
>
> Still dunno how much this helps ;) But I successfully ran
> 'inconsistency-check', 'nanosleep', and 'clocksource-switch' from the
> kernel selftest on my N1D board.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks a lot for the testing, Wolfram!

Miqu=C3=A8l
