Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589094;
	b=rQM7lLcFH5eaMSDJhBMrJv1UOcnQsB9hTuKZUq6YUqrO10gLvTYhc4wjYyvhG6NN6/3c
	 pvQTnxcbIzPYqVNf9jSKQnfKjAx2+dgSanv8quCv50SoG8z/vP/T72+5AXSOi/580gr/s
	 ufj6ceXR4jweNubWS393oH28bsLTdyRgxWNlT648bWHZFAWFNr+Abhe11arRt5cnN8V1Y
	 2L+WmE8ysuLXY3NzMCebwfRCO+FQZwR8hSE/ylGT/jq+X0HrYe3158gyNJKHbIuZpNP07
	 0Cr10nhkSKQVFmdVNgnrQYJya1ASMiJ/R75L8Y0Lvp9yDJT2jLJ/dvI01t9/tyNcYxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DfLg15d2NsC8WG4F+8NUyIDwq+mbAzZvSv8g7DgQuf0=;
	b=uuVpM63c/xueQiypB4TgXKxN46KqUaGDL2k7nEdwDc6LALrTlGKevQ5wmXQHTkhacmEf
	 8MZ0ZrFjK/dWFQdomMN61dihOZVFJ0i2a/hQLTS8kX5JtAbSI8fwV2/cggDKrIOHw7S9N
	 PEDDermmrjYxuZtVLbDgM0yM4BQb39bnPynywVaiB7YCWk1F+Y7k3ocA5MvhrwcU5ix2L
	 SViefGKckGu8swj/C+A7fIJayXfKs716X4PoMsu8dZFsM8d8bmrhmeFCFR7jM+RRv++TD
	 Pvl92uDHiFRKZd2u1oF8x02QPaULh57f7RB73KDKJFjLx+Xrz2CKz2oWvZudWjEbCiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DFN1tklU;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E71A606A330
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E71A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DFN1tklU
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c445c95d553so89896066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792589092; x=1793193892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfLg15d2NsC8WG4F+8NUyIDwq+mbAzZvSv8g7DgQuf0=;
        b=DFN1tklUulxevp5e23DDQwk12D6ac5gehXefCmPIk3ujm87X145Iltk3nXTTJy10Co
         18aFMXxMs0ITa744yyaA8coIk8ixafXJoH+P2cxkRvVolGZtNXcjQJah39i86ygQ6vDa
         +99t2ShsDmh/tvedHar6FjFJfigremGZZVxAJDG4o5coiF6bAcm6M6xs4ybCKGtgClnL
         l5OOZx+SjoAEToexQ1PuerbtVhpUdLGXFFshGdvMRUly8FwJwMta5oyLxtSTvLLGsP3X
         lt+BLgsYkcghrABTaGAGNrvkqd8/1EUZqnrVutMlXxygBFmBdiNYwNo5pnLVhrScVieF
         RAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589092; x=1793193892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfLg15d2NsC8WG4F+8NUyIDwq+mbAzZvSv8g7DgQuf0=;
        b=bFahiOH9kr+BJ5GI74OKwKHzj3LhOLFoEGWJ0RlAZ5x2n+J4uq0JjuQNWqRt6H6NzL
         A8q7Vh//VhmfSTG40QDyfdTrjqUoCRqujdNJT6pgljQ01cIsAtb5ayRTo6mVY0xw7oM2
         +H1aZYyQlnQ1cjY5GRNvVIKNolg53MK3VW3EbauWoUPimzbaAXaECCMhSuhNSAMFJqOE
         SKU7oAS/5uYs/yQu0ZjfmZDynBJ5DlxVKv3PAEDdXAwXBs5DhRCwRr4bDOqsFh9HpTFQ
         PVpGRKFVc3cWvt7kxh5klxwFH/s+X3MtVsykeo+6z63wFurNtQxNvuVHV+83nDhCVutZ
         GJXg==
X-Forwarded-Encrypted: i=1; AKwUvBx+rl9VT4zAOm2pOzZY/H1vL+1b8qzsKGGPwo9ywMzONyOzMPlSOXL369M8Bd30j8W6ewrm8ICToVUkE+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsnGlg4OeWos3S2TXwfjZgLvHkTk0rfoV3Jjaa1FNKsXnF/V9X
	tZquk0qq18aRMJLbX4T1BlvT5Y3GR1QWeFA1P2hJj6gahY8VR/Wy4CzT
X-Gm-Gg: AYBFou1yDp3ZtBhGDYsmb0wnpRuUJO3cIZXkfRfvfcgzmIHLgaDx7yOzicNhvYsQfBG
	ZPgXZJAadKvnIhZF4qknFoWPcA5im6VBlJq1ybST/ycSrZP8fkE3YVpgXyGMBjPEfHgAqJubZNm
	yLZ4TwbSlZjRU+uA0CLt3iu21lWwegMCNAfWe0elJAFbbsuZIXP6U0DVilVet4E8RcU1V/HTMZK
	AS+WTlM99FBI1JvktDq+wKUKprI7jT0Ox4IwvT7yjgKhB1gAjDtam4SP5vztcDyGzhK/PMSs76g
	fZO1k4ZqMX+MyEMNPMDOhUmCHSeu2oQfW6CIViUi92ZDwn+oe33A4ZizZwtND2O6zRteBhs2Gff
	bAxQKEuBdnAeUcJ1D8pY5/UqFFNaEm+Q2R28gcKCGWNZQ7m0aD3oQuhIJhIkirzJfh/JGXSvhnv
	w/5PmaWjO9WAo2H6S/mF/5fopj7j2t4AR8mjE3OFnnDa8NK6gD3fyds5Z1wwi66IEB8B98B32t5
	mMbn6/5pNEuIz5BrlrwDDgld9jV+lHLg+QK99Jn7HD1HoHER7K46mdnnT1Jd5qlELnZUcCAHjpD
	f3o4EE8pq2q9cPFm58MjzyCQuHEu+Fjb+PXcZS+FGUwDkmHYL6Sn8WcpRjLlW7Gm24x+Bamyqg2
	yOeo4ENnv
X-Received: by 2002:a17:907:608d:b0:c2e:46d0:b802 with SMTP id a640c23a62f3a-c46797af00bmr188075166b.40.1792589091580;
        Wed, 21 Oct 2026 06:24:51 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a592333sm1418266b.46.2026.10.21.06.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:24:50 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] iio: pressure: dps310: add Zilltek ZTS8032
Date: Wed, 21 Oct 2026 16:24:09 +0300
Message-ID: <20261021132409.3742735-1-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019141646.49599-1-zoone.rupert@gmail.com>
References: <20261019083620.1285782-1-paulius.zaleckas@gmail.com> <20261019141646.49599-1-zoone.rupert@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026, Rupesh Majhi wrote:
> Tested-by: Rupesh Majhi <zoone.rupert@gmail.com>

Thanks for testing on a real DPS310!

Paulius
