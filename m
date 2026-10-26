Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793007696;
	b=C5QWHN6pwNygmME0fMW0pIXO5s1MeI3VTqP03Bq3NvIo9VssuPIVkFpVWScB20ghM1pu
	 15yfUL3Iedx0/O35ed0/WGrg7ehkRB9pIOaIRjj2reeSCnvZoB49B1hUZLRWGIovvAWX+
	 RetHXd0s0kc4hp0an/GLn3co1gej4megqAl2sAPPIS6g5162dTuiOiiXc+LFipMDQiJau
	 yIriyTPUvY/fvrL3Grf4gfPuauWuWQDddaz6D3Y1t4zgTff9V9usz8n6k7GkGjI6f638K
	 oucqEIkjwarWkzSS3JJW1+YMSaRiHEtAXK4nTFUC4cCy5e9nfNNmZNRcuWbcU9s6D5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007696;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=GFa/9AhpktP6FOXsCdm6LvF/HzjXgt12PVZ89+MSLA4=;
	b=nUb2oK/WmIHRCU9Aw7b6PQusOfeUNA4ixIQS6W/MufnfDlFIbW2Rf2Rn19+yqtgvQyQo
	 +Wm3txwQXqlvBHS23msova2G7FZ9MR7wpvXumnWNzAoPleG5gjEfHnhmnx0cBJsU2kMAj
	 qevQ8eCsa3YR4O8HzmAfYQkVCEzIgfIz42Kx8UUuynzdqOseCv8ymetaRriubzgG+8Nk9
	 lPewzgn9hTKc6+8SSdNpyPFpzQxyXuQmeXZq9nxY+wa+q9BM80+U4IX60k69ZjPIZ5fuH
	 8BsaRbU8FV/mbNU7jvO7jKwQTcWHViG+TrlfT/rfaN7YQBe3P4Zz+94wDkAcaZfjVcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SdKpId4d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD42606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD42606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SdKpId4d
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A160C200582;
	Mon, 26 Oct 2026 10:41:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793007692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFa/9AhpktP6FOXsCdm6LvF/HzjXgt12PVZ89+MSLA4=;
	b=SdKpId4dTJbgYyxzZbNN9DugHjNWEzkp9IMzbfx5qVgdUhQTkZLjlsUcpJFVB9Ak5ql1ct
	1qJLNgpvM0OXaoUGSQoahePQy3uw3pNMhjZh7ULgUfwYIFawNI0AEYWomVMiiAcSGswpRo
	7aemvBJhhSY1nwYYUP1lkLb7OS8OfgOHtrGhjYyuQW8nRml7wFN3frFbptYzwX0B5Qobjn
	SlaZz/Qik064EHNr0p973G/2ygUxv6ic8/WGbUFaO7Tcw31ZPwP5lErEINDy7ypASNagAn
	LEFV6lFlpqd2Y0EMmFbGcYa8bRq+P6t8tB+5ub0IkObWsDqo2B4ulPlrUxjlEw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793007692; a=rsa-sha256;
	cv=none;
	b=aajC+xUVBsTyyd/PBwB/UNdgA7BQKYuk9Og84AWDeQEpxarXNAyow/IMyh8p4VXCWArC9H
	TGEaokZ+KMTwRUhX9xHWUhTLKqHSM5J5ko2DSThDw+XpLPSNKrPY/U8N4x3/H1BilMavdZ
	j7wHx4tB6H4cexPp5fXIYr1qALunboMJz7y3HhR7VOVYCSylDVafgxSxzclvpsnfC2zHnZ
	b47KB5b4ZNX1U/O+G9RWEBavWnPWrKUGLR971DAUuuAKPXudu4Yky9X9LcPqj1VEjSfXg2
	Ieb8V7AWvjNRJ+GkLIhKx9vdrvCcu7w9VFoI5caXRDJphAOAlOHdd8ZqQqPh3A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793007692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFa/9AhpktP6FOXsCdm6LvF/HzjXgt12PVZ89+MSLA4=;
	b=Dh733mwdJ/iCWDlRpE1a07iUA5ctJgDxe1vFDY+OdZPjaiUFlx0GCPv1TN6T0HHuVLfq/V
	XmZxzkcWhv9Z+KcOvJNUFRd1aViK9EsEDYhMAkrD8kHekPCR8et0CdRKGQ2RLq7gs2Y4Pd
	YzCS8lPXphDM32dhJdc128PpYHVrnzrPeFcUj+pMxraqx1Op/AupsYd9TSlyUlv2O6K9DU
	HhmwYoW78Wyw+PRVClNFpQAuL1RmNJVPu131qq+LUQhaOYyJSmhlSvYj2suH2AlZShto1e
	8rxTurfzRNkqs1CyW5MGrgr5rnv+2iBAmmJQWk6xEh/tIPCiVy7so9Ra6+DdMg==
Message-ID: <98198337c909563214bd156c9640402663d08137.camel@pengutronix.de>
Subject: Re: [PATCH] reset: fix racy acquisition of exclusive reset controls
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alvin =?UTF-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>, Bartosz
 Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 10:41:32 +0100
In-Reply-To: <20261022-reset-acquire-race-v1-1-adab083d7274@analog.com>
References: <20261022-reset-acquire-race-v1-1-adab083d7274@analog.com>
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

On Do, 2026-10-22 at 20:06 +0200, Alvin =C5=A0ipraga wrote:
> A given reset line may only be acquired by up to one exclusive reset
> control at a time. If two tasks with their own exclusive controls race
> to acquire a currently released line, only one may succeed.
>=20
> Since the blamed commit, which introduced more granular locking, this
> guarantee has been lost. The mutex rstc->lock was introduced to
> serialize the internals of reset_control_acquire(), but since this lock
> is local to a given reset control, it achieves no synchronization
> between distinct reset controls, even though they may refer to the same
> underlying reset line.
>=20
> As it happens, there is already sufficient synchronization in this
> function through the rcdev->lock mutex, which protects the controller's
> reset control list. Under this lock, the acquisition logic correctly
> validates that the line is not acquired by another control. But the
> control is marked as acquired only after the lock is freed, wherein
> another task may race to the same point and mark itself acquired too.
>=20
> This is easy to fix: just mark acquisition while the rcdev->lock mutex
> is still held. And since the rstc->lock is only used here, and achieves
> nothing, it can be disposed of.
>=20
> Tested under QEMU (-M ast2600-evb -smp 2) with some driver hacks to
> provoke the race. With this fix, the race is no longer reproducible.
>=20
> Fixes: 8c91302a29bc ("reset: protect struct reset_control with its own mu=
tex")
> Link: https://lore.kernel.org/lkml/atnZWUA9bc1btCix@analog.com/
> Signed-off-by: Alvin =C5=A0ipraga <alvin.sipraga@analog.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

> ---
> Philipp, this will probably conflict with Shengjiu's fix for the shared
> reset race. If you want, I'll gladly resend after that fix has been
> applied. Just putting out for you to check now.
> ---

That's fine, the conflict is trivial to resolve. I'll pick up both into
next after -rc1.

regards
Philipp
