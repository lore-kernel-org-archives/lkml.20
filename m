Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793006691;
	b=0Hk2eMGiyLcj7VPp1VgHWHVLoeMIEsVlbWNu+PLOfZ6/x7OLMELYhWkv+2aL6uufKxto
	 0nm2EyrhK5q3nt0hPKumbqESeNTh9w+QpTUZ+Y+SHmXjcwqphzSC5Ytpug7erWT1i16+p
	 pTNLvgSEGWGYkT5KX2G4zJ7DEkVUIoZIZglCgZIslIIK9QpR1JYtBKk5RGflGEjiwDEf8
	 MjbcutRDhYAZKWzjUNQqAoP6p81Mnn4/+SJtdMtsAImF3vZfaNVoA5uoGv1IZjl0l/5BK
	 QYo2iU8ljbpcEFtWjm0uvYZwAMh7hPb3wsBaMGTe0F4iHqtdKaQG3sNqS8/6HAuTh8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006691;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=Lg6XI+8K9pvkjnx+SeSWR/YM2/gsXFi7GaWG0PrJeu8=;
	b=KKGoS9jiANwWFhxlqjEzTqdZT3op+4eK1n4ao0ZPik6ePU0CfHw6TG3j3UEWYD0syolZ
	 yTEP8DnEVQmn4EtvbdOD1OfrDRCNWfrO9N9VMwwMH/5VTyi2UkwZEnhKORvLoOHXelTkZ
	 pYfGOEjptYdDRBcBcx949hPTSHdhxXqTUP6w7w5J6F7fubS3gXZpxWX2FctljEIxh/SNB
	 mnuHQkjVgPMLUAYRfzVj34qCT6lgQl0RBmtU2bIr+F1rPtnXl8tEJim+0dpo9outyM9Bs
	 f3uTK7hOMqYsmSOyXyoWl/O52WMoVaehH6gxT2Xb6cBCeXfPWpUsjmG+ZCjCzvq1bOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=PTLh80nx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BD7606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70BD7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=PTLh80nx
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id AC36D200B1D;
	Mon, 26 Oct 2026 10:24:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793006688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lg6XI+8K9pvkjnx+SeSWR/YM2/gsXFi7GaWG0PrJeu8=;
	b=PTLh80nxY1QPZi8wIcTrvP+syHbINljcxKLZStPzXXM18whry4sfkndumwMXgQ+2OmHxHm
	6TZWA2pldjlceqCX59b1yqqPHBt9vLWs4aZOHH4XxABpDjHDDviLvzTjA7BMmO4KK25uVh
	v+e9A4TuQ7Or7QM+riWz3wX+KTi6nFd57u/yseitxyvOC4yR7hRjelGuFfE1IiU3ePHTAV
	qHkKrgSeVA0+ag3mHKtMVXKBfNShTUwUnGE/QFBmvc67TWa8qAI7xfpXi4Yq5MICaFeF7y
	69XQaC/oNWIjRgcFmHaKUx6meifrA/nS5mR01p3CC1H4yOsJ4YULrbzQKQF0fg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793006688; a=rsa-sha256;
	cv=none;
	b=QHpvNye/xZc1S07MueqTm+zFbt19KjSToLVucI6ZSJqftJpM3H9CoLWe8HA2hSG/NQC05W
	7Jzq/RKG7JLzm1iUNtATFMISySQqCjyEqakt0p0ufaDoVwJtnG0IiWp42JuT4EMmYdmliY
	O/UZFWJkxVlv45hEi8SYJzF9PRNb0KFnrwfA/T3+w6fOMjRRFOizuHekW1aFfDrmxQtXwj
	dxQQQ/AjQxqE4IJDwwAfzXuuTXeyIZ4scjTQzI5r7j3W7xp3WbbVBWHR2uazwztm5ZeMzK
	eVJL4FZOHwYjkCCMYoLYu2YWE3l/lm8VyADlUrt5kwVUGuCMC3gKWPUozYwzGQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793006688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lg6XI+8K9pvkjnx+SeSWR/YM2/gsXFi7GaWG0PrJeu8=;
	b=fglCNAzwzIGoQmaZ5OhE7wo7hbAdo/qJSyh3+qPwkwiLMIMHgp2RnN8UutAL6BaK7lz702
	AXUvk3flOnK853nrUYRYUYuviS/1T3U4ZI7heIt2Mi6/HsMNJXo28qY8+d5I9ekUCzxIt3
	NknaX49NhP9NJtsaknb3zPmIwmph//HjaZ7K2gAuadZo8LLJWchcXvZAGo0FWc4d4dmuB4
	pG7N0lQ1HE/bDefTWF5m9TPjDma+BEf4425KkVJf+SvAlJkxQKTOHHBWHhFraqBtsNNhYr
	8zjhr2Fdz9YDb1yVPxGwBX/+o8ObIB2AOjQHMEqcDuzFx8sygD8V819v3lalOw==
Message-ID: <9e181c3bf6a8292996c010904a0890d69910e6b9.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/2] reset: gpio: Set can_sleep for the shared reset
 serialization
From: Philipp Zabel <p.zabel@pengutronix.de>
To: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org, alvin.sipraga@analog.com
Date: Mon, 26 Oct 2026 10:24:48 +0100
In-Reply-To: <20261023071609.3795354-3-shengjiu.wang@oss.nxp.com>
References: <20261023071609.3795354-1-shengjiu.wang@oss.nxp.com>
	 <20261023071609.3795354-3-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fr, 2026-10-23 at 15:16 +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> reset-gpio drives the line with gpiod_set_value_cansleep(), so its reset
> ops may sleep. Set reset_controller_dev::can_sleep so the core serializes
> the shared refcount update and the hardware op under its per-control mute=
x,
> preventing a concurrent consumer from returning before the op has finishe=
d.
>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
