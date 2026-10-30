Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793402626;
	b=vvMEWMnL+am5pOGygbB4bYYirSVXWWSHSwJ7PerUQ/FyEDio+UP114MZfz0Q/pgPiK9z
	 6Kb8sAkaP7lvTV2voekoEzwQhIC702IPqhYBpatjlOYr9loRLKy/d2ws/7Nlr84w9wHw+
	 Wks7Lq0baS/mlQx0VmgS0rwHzIN/KzBll4Atk8EU3TqZ+eGDt5fpGfINDMlQIEv9R1CZU
	 AzksLFuDCloEE06E9LRkyk/WdXOjQIJIrLQtXxy+7CPtqLiYss598R6SM8I7prfAmOkGA
	 mtjIRBADl/XH0BxKfkQwinDzoUE9mnOVLL7OrH1DJSSTfTC/1Uk/p5OvLx/9w+Buf6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793402626;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=YX5EXa8MqOda9IpysisRoAlrusnl/F2jkf7qR97dinE=;
	b=MQA9MXGJk6LDKGTZsmxiA0ZxTMK0Wo62kjqz90m7JzTdxChzqsOjAG3qfC7pK1xdmztW
	 DzpSjN3pSoaE2Ln9s485rCMoYhPteFvaqbRU0w5wmPb0Ek2cQWfP4jfst0Wv2DeYQtiZf
	 ttcdk4qnmAI2Lri4pSmBXLHCLgJj4mjLr+cKgAT9BJQ1tQQxiJwyCoXuLIQJ+x7JBFQFn
	 dStaEC5JIS3iOdYvu0ZUb/YzKrZ+fRVSuVbXL0SxH+h4wNhDFWz51LdnTHQAK+jUzvBAU
	 AnTIDFgPPepkB+MWaXsm4kcr0GRLYsQuMcJdEICNU6lgnZ799TVKKpm5Baei7maodEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="d5pK/Kob";
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A7D606A31A;
	Fri, 30 Oct 2026 23:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A7D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=d5pK/Kob
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YX5EXa8MqOda9IpysisRoAlrusnl/F2jkf7qR97dinE=; b=d5pK/KobbOtuQpDfxp2yT2Kf5S
	l9hJX3nkPEjZu/TW9TDA1PZVuxX+eI131lrZFcSU3TUAxqLmfwED+9ZCRMD9WVxtGQdcAfu8z7WAw
	1ZoPZVMwNNAutn5gl7S+b86mz0BG3uWC5SIVZ96ejws4jo1UqRp8jXsfc5PScuuA6i89pcgMfl6os
	qMZvQDAmQln7oI2BBm/Cm8cJrXD+9G5gWfpzZCSFcWZCIGMPahsc5OxZzVbrHrwy5fQtMb5stvdNt
	EI82iTKnGHqc3nXiQbRU+dZoiQ4S2xj60C1VYIo6OQuPHOJzn8we40uJW8O5rOfGREj9lHlBxzvuE
	KQNEodKQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>,
 "Deomid \"rojer\" Ryabkov" <rojer@rojer.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sergey Bostandzhyan <jin@mediatomb.cc>,
 Jensen Huang <jensenhuang@friendlyarm.com>
Subject:
 Re: [PATCH 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus
Date: Sat, 31 Oct 2026 00:23:35 +0100
Message-ID: <4193517.ZaRXLXkqSa@phil>
In-Reply-To:
 <CABFmFwrWL1sej-=xCK-opxn3B9VVy=TaCyRQU43sw=6PY7bcmQ@mail.gmail.com>
References:
 <20261023235959.2988087-1-rojer@rojer.me>
 <38baaf87-4d5c-48bc-a11f-a5b6c04c20a8@rock-chips.com>
 <CABFmFwrWL1sej-=xCK-opxn3B9VVy=TaCyRQU43sw=6PY7bcmQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Deomid,

Am Dienstag, 27. Oktober 2026, 23:10:31 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Deomid "rojer" Ryabkov:
> Hi Shawn,
>=20
> agreed, it makes no sense here. will drop in v2, holding on for
> feedback on patch 1.

No direct clue about the board itself, but I assume the schematics
should be correct then?

So no change needed there and just send your v2, I guess :-)


Heiko


