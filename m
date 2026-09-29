Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2D64F4059;
	Tue, 29 Sep 2026 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673532; cv=none; b=TG7KXE13Be7m+QSHgeNSc72zJmbS5CtQU58dauvrZqTUKSU9O/Bgh31hSP8d4LceKu7HOBm4HHTEXYLK/qviO7Xclgsbl0gcWPG2GISqBGhXtOD9426ajkJkLIQZR+CmU7YjNJ5FYbV3anw13KQJdqZSDHW1AiGDTetShpxdHDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673532; c=relaxed/simple;
	bh=5gzsnxWAMQdUr9M2nZQYxTjWqLNxo6IxAtVsZ1WihM4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ac3IRnBT8fqFbtciHleWk9XoPYab7QZAr+k+XYKOtfylVY68U/F3GhOhDaNceD+/Vuf0A+UA8cKtzLURVdM9zZGqVntIWThCKiRSp1I6l00TdMaNN8fCMVYuHjQBvbZLt5qOcZAMJjSC9JJbp7PvYo1dFZE9OmakqjlkHiGbc8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QoCdMzJ5; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QoCdMzJ5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 014FD4E410B7;
	Tue, 29 Sep 2026 09:18:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B70B6601BD;
	Tue, 29 Sep 2026 09:18:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 522FC102F1EA6;
	Tue, 29 Sep 2026 11:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790673510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qr6GEM1P/G02DuVCkATOLg2fw7cu7Y5Iiewjk3jJhkk=;
	b=QoCdMzJ5OaVVh1UYRPTB6vo8UBVnM0g4qpDSUI4RN81vYgQKD6Air+FU2Q7ZeSld68F2tL
	1f/PAgdup2Vhhhd6sYJTnloua7fHaJjKHiiubA/oqVekbJToQDtDKAMGgNg9Vd4ZKQAgAq
	ORfzv/uuOfAHz0rvNJu20OtK0fekST9o0uyTZtcuIEiQwU2jY8SrzSnpsIJ1Ou+jpVIcHV
	AQOiYnx5BTJVoHdQXYDcsoZU7pD0iaNBBGfS59S2rmi0G3gDrG3wDf6kO8WXIcLfnd5oqv
	/GdgsH037JQ5B0dApniDFlDAC40ijPwnSBZ/3h6e5nGlDTAXUsi8CO3CqElfVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Louvel <paul.louvel@bootlin.com>,  Borislav Petkov <bp@alien8.de>,
  Tony Luck <tony.luck@intel.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Geert Uytterhoeven <geert+renesas@glider.be>,
  Magnus Damm <magnus.damm@gmail.com>,  linux-kernel@vger.kernel.org,
  linux-renesas-soc@vger.kernel.org,  linux-edac@vger.kernel.org,
  devicetree@vger.kernel.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence
 DDR EDAC binding
In-Reply-To: <20260929-brave-mouflon-of-enthusiasm-df7efe@quoll> (Krzysztof
	Kozlowski's message of "Tue, 29 Sep 2026 11:05:47 +0200")
References: <20260928-paul-v7-3-rc1-edac-v4-0-4646a5b7cac9@bootlin.com>
	<20260928-paul-v7-3-rc1-edac-v4-1-4646a5b7cac9@bootlin.com>
	<20260929-brave-mouflon-of-enthusiasm-df7efe@quoll>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 29 Sep 2026 11:18:26 +0200
Message-ID: <87cxtw5sbh.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Krzysztof,

>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
>> +      - const: cdns,ddr-edac
>
> I doubt this can be used standalone, so I am not sure what is the
> benefit of cnds compatible.

For now it seems that we are not using any Renesas specific
implementation detail. The driver actually matches the Cadence
compatible. But since we have no other user, and since we know this IP
is generic, we preferred to add a Renesas compatible to match the actual
implementation of the Cadence IP, in case we later figure out
differences with the original HDL. I thought this was the correct policy
to apply.

Thanks,
Miqu=C3=A8l

