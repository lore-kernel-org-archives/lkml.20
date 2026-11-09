Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265880;
	b=s+K3Vi7lztUpcFnaunDwTmIRrkMj6h5aex1A1XRuhTsvOjRcO6PIkDa86oSM8U8P4dDT
	 9Tm0nhVQGx5HLYVTk5gVPXAlL2ursROsvT+sSvLzW8ImJwa/UXsNR9WlRGFmyvkvi7Uoz
	 2ogq8imCvKq692gkM3rcfqdF77sX3HEFY3t0LbvEi7+NeTf1g9CISJVyPd+Drh5L/KUxr
	 SrElnfVY1GX4YIPiJwBCYHvFzd1HmoKU+6gGXnjiO/j0LpMvCiVl6D+Xxa2w8rPrM+kCS
	 9ERL8ywcTZ1lVYGfTxFCYC/EMawgtaMHQPsVRx9Aio365bR+ROQcSfCYQkdXp/Ql7Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265880;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0ZzhA8P/MwJkQ923IuSSABpNpVroYxBof1VtaoMqg78=;
	b=IgBwM3VsCwm/4U5NGsXzEHT2yeR63VnkZbfO/HSEfYeb5ftmtxnymBw0dfUVK7UrZ48L
	 N31snkUECQoDS6yawmdas2yqgHbd+vAgbCQIKy3VrIZdjkHRF1935FayY7zLN2T0BAwA0
	 bPlvBe7wQgH+ehgN+J/KgHY0H0IfCLYI18t+SqML3k+0+0oCEHHlmoW6zdGm4mVO1eD0p
	 j5TDW8xQnwRlelUKhX7DbmWZgeSVpj1DwwmhE3WY4nmBNBt2hcnvTmRuhIw0bYmEophmi
	 TPAl8usfSn9C4ss3zIKt1asQDSJz7G92qsjScoy2qP6OezV+/TFtmvo6OT/XSx42JZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jidGIvqT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144D1606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jidGIvqT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C9D1F0089F;
	Mon,  9 Nov 2026 23:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794265879;
	bh=0ZzhA8P/MwJkQ923IuSSABpNpVroYxBof1VtaoMqg78=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jidGIvqT2MX27/C6nnnMtjgxDtVuXTMxbnzFtAP1YiNCC9Xg0fGB6nAyS2vFjc4wo
	 D/cLrcdAdSZXhkoA+yRa/SkxZf5LaIT4vznNu6T/gKIIXXQX+AJOUy4GjRt446KI03
	 pXX7cMieP+FakuIfPN8ya6Vsn0vY9Ju3xzOJOlGQUVRzTdLWzOYmB5h4W3ft5gcgh0
	 ghk/LJeoigtJTqazwTO21NgbmEOAPoIj7upsfB3AdEDJW7s9MSzVlo21bwA7aVRk7m
	 jB9vjj8oGn42jQiNqtha8RCr8DNXCDKtCB12oWv60mG/Vw4B6Cd5bDdAyW/zndqs2d
	 xEzW/orzhtBBA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 87E553092362;
	Mon, 09 Nov 2026 23:04:53 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 0/3] Add support for the TI BQ25792 battery charger
 (regulator part)
From: Mark Brown <broonie@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261102-bq25792-v9-0-65f223e95fbc@flipper.net>
References: <20261102-bq25792-v9-0-65f223e95fbc@flipper.net>
Date: Mon, 09 Nov 2026 23:04:52 +0000
Message-Id: <179426549236.3711751.6417012163300457231.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=391; i=broonie@kernel.org;
 h=from:subject:message-id; bh=r3qf7O26eYTEIh5aekFIACf470Iv4ehHh+sptjjUt/g=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+BU7lvbvrvhkz05+gkr/TlXxNHm86nO2pKG60NUPk9
 SNO46OuHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhI01eG/+lHXgZfZ0u0m3uz
 TvdN1hGf7iNdtS/rTm5ieCxVnHbkpjjDb5aQGT9D3S6cXitw5h0rNxv7imBF5yDt/QsDXH6yrqh
 X5QMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> This adds support for the TI BQ25792 battery charger, which is similar in
> overall logic to the BQ25703A, but has a different register layout and
> slightly different lower-level programming logic.
> 
> No cross-tree dependencies here, as the MFD part is already in master.

This doesn't apply against current code, please check and resend.

-- 
Mark Brown <broonie@kernel.org>
