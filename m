Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793006681;
	b=33BgI0CYkBHftdYVipxGTNgbpM/NrAnYmW4ceD8qrzpHGinBjZFqab7wXQEPHx/3zARr
	 JxGQ854+fbRIGsorh+oBJL7OrZJxU57BzcmgsY89Ec1a6Z2ztUcqRK4Mu+J+/GnrqtmLl
	 yslpJBrxUBoYPng0G0BCDEBSk54QURu0+rphncRwFbyTpSr9F5qYuDaZ1MakLQ07XW5Rm
	 gq7RSkjFpDP7bbZwBBUuLEbrsGln8CQNAzZZ7XI2aZXTV5/VrrOHGmGQVfqgk44sKEK36
	 wen/BrKa5JpQyhw8YhbYh6Nrg8C0inE/AcQlmoa9KuySXEgXyi3r++yzAxE/Sf5cjwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006681;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=ljkgYSSqUVNlSRlN0OwHYowt9zrJ7++/rJlr53nk23A=;
	b=Dk4LuLS4RNc6Nem8aQT8jA458AwdRucHCjvOCBUN5VCCJfZWu/HvG9q1vevXYLF0yq2f
	 dOPop3AV3ygXvB99pdgCgGqlAvqm8frZvL6/gvaw8NdSdgO8/Ln6hJSzKoLlB9sducLxj
	 IgIRsDktKcIki4FkWD6J/xeMKZmOkthsKIVY7zmbBUe1EJexamN8cmYI4fLkbR+tAmTh9
	 vX2g5bQs+YfunX+leIM+tRIN6eqIKNx0MZZdUVLmIP4DCMubIZ9IWdqim6aJhRkIq7Vsm
	 TUKOI0+bG/Ct2Au3yyrQGq7ycZMpP8OPx3uGtCpJ70HPpgNAsZyLRWz0TFd0OSAwuAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=f48njdqK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92006606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92006606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=f48njdqK
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6A73D2005A6;
	Mon, 26 Oct 2026 10:24:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793006678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ljkgYSSqUVNlSRlN0OwHYowt9zrJ7++/rJlr53nk23A=;
	b=f48njdqKD86E+O7LXTb2kdSI7bUBJPlKTW5cUodXLnKL6vctr9qZOw6Axg+d4Iv2vgLCB7
	4Zsxe1U/ftUXOeJrXxCRdQoSFCcB8MTQKfkIRD6VawQ0lFulFo1fcV28apC7uBAw1mLv33
	I7z98njPFaIuFFkwl4PpVBF3KMuchjyj6Dke1tXIEqsliF5IYT4Qx6azQRr+Cm/9LKdTH0
	GoOOHZ1Y1JOQIsyFMLT1MUDV486wjEYB+3RyIbNC67CocfcjDFKP4mGXh3ywaY/jbhIJ09
	Y18044UYGCad6XyZbjZh+Kpg59v9q0bWXM/QbzKN+cEIyWxGm7qWbF8sp4nQiw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793006678; a=rsa-sha256;
	cv=none;
	b=OP7/7C9gp9+yLD3O1ilqzXS4YsZv4+81vy4VyXALogicwIi7+2V5vqHM9QHx3n+3DGsfYe
	0QRL+AIYjayqHmyArkeuYklEj/60t8HUMGYE+JeEBojZ8Smpfsh9UeJQqEbOQZbdslXeyT
	23RjlHJ0GjmYYEV/VrOugb9a60WhwL4CUJ+zwCb9mJIjgLNNiIz9bvQqvyinbfqacVHHR7
	fkVeNwkY8Oj6lhbdher2vVHqwyf+LtKQuttWYMCYApeLMEWyqg+mFFpOfNP3WZRGtgvCNo
	hZS/quBc9e5D2fDTgHJaIf2XGgKB5rf9orNMhGxkZ+knwuG1iCmTTgwD2PcqpA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793006678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ljkgYSSqUVNlSRlN0OwHYowt9zrJ7++/rJlr53nk23A=;
	b=cIe9UxPpXv33lQVGBG68UzyFxxXr8dA8gva5s11zaTlNSRy3gUU1xsCtZ5388j+YqYjCoD
	pdJAxKShRf7+1C84Yc+VFu/LOc9ApTHVgWj1TjmWwPjtrIFWnjf8IubKB3sOCyDg/6XoIS
	h5ffookUiC1fVJMyAtum+B0kbAQOuFHKbqPINkDiTmwdHbAnADa2PlpkPBsPVWkD0SGngT
	uM6gQsI/g0CbtWk2e8dZd5O13pQlKKthKxyzGd7SUf84dcHlIXC7BYjr3Y+3iV7W/zEe6Z
	LX02H5R/IqQONjGm9zGiyFPL/y2JgtkG3v2bwPEvARrYzwfNaet+JifxV9kzvQ==
Message-ID: <0ecf3ca284f6e9301d2c44a9df8fddf27aebab58.camel@pengutronix.de>
Subject: Re: [PATCH v4 1/2] reset: core: Serialize concurrent deassert/reset
 of shared resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org, alvin.sipraga@analog.com
Date: Mon, 26 Oct 2026 10:24:38 +0100
In-Reply-To: <20261023071609.3795354-2-shengjiu.wang@oss.nxp.com>
References: <20261023071609.3795354-1-shengjiu.wang@oss.nxp.com>
	 <20261023071609.3795354-2-shengjiu.wang@oss.nxp.com>
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
> Add a reset_controller_dev::can_sleep flag that a provider sets when its
> reset ops may sleep. When it is set, serialize the shared refcount update
> and the hardware op in reset_control_reset(), reset_control_deassert() an=
d
> reset_control_assert() under a new per-control mutex, taken inside the SR=
CU
> read-side critical section. Providers that leave the flag clear keep the
> existing lockless path, so callers in atomic context are unaffected.
>=20
> reset_control_deassert() and reset_control_reset() are documented to
> guarantee that the reset line has been deasserted, respectively that a
> reset pulse has been issued, by the time they return.
>=20
> For a shared reset only the first caller runs the hardware op; the other
> callers just bump the refcount and return. When the op can sleep this
> breaks the guarantee: a second caller can observe the bumped refcount and
> return before the first caller's op has finished, and then touch hardware
> that is still in reset. A reset_control_assert() racing a concurrent
> reset_control_deassert() can likewise interleave the two sleeping ops and
> leave the line asserted while the refcount says it is deasserted.
>=20
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
