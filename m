Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701883;
	b=ktMUr5hzTXEvY0gAzxbiK3veVnOcLTiBb/N9hnxFPyMfOtdzIn61zzlydP/tp8erkjqG
	 ZqGl3XFhcSsApjTcmQdzy8Rw2YnndfsPZL7F+DaxX/Zev2Y/KfGQymgY4D6tKJ2yMLHNH
	 sLDPNrgYU+yXICFJ9HmaTwjcI75pGjz5UQlCawACkGTH/xqRwp9r+dSM6F06tGv1lnBcl
	 ordtiD5csjxl1Bvvmn4LNU9NM2ns48JgE+0PYV0981YbNJnSvPShlaTZzeEuu4F+FeBFO
	 /ne7YT4uA678UZ6p0fz8UGESXW0ueytr2ccoAM53iZBUkWMG4eguw3xZab/gu0hd5NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701883;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=Rs9aptcosfl4sxU2wNHY4NxTkHzvKObUn6UWa3h+nME=;
	b=ol2c0kw7MI1iVaSOHA4g0N1h1oh9zmTNh6iXJXcSNezrhAsPDPwCcGFMtUiIpMogFSZM
	 bfh5SmMBvpMsmPIjX5l9j6lzsB7JsAEZgGUkHylD2Qe2LexuJGadz6EcCCUF04+x03iSj
	 860mg3mc3coj5cm5KwMFTSCvUXe/wSZIm89Nos7mxQ59eYGHTuLYLaZfDQNq9+IamxXgN
	 57QSAU6mEXc8PzmqF994MoL9z+fK9MsmEB64aurAklJYHsX94LRtqlQd5KWDkAi8YWwkF
	 WAfYyAyGTzyPM8ifNkrf85jbMGgJLDfkC8SPF5LQl96SyFrRgcJkMSvmQQFFb23ru3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=P6lRlmH9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F738606BF8B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F738606BF8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=P6lRlmH9
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 541C9201BAB;
	Tue, 03 Nov 2026 11:31:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793701879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rs9aptcosfl4sxU2wNHY4NxTkHzvKObUn6UWa3h+nME=;
	b=P6lRlmH9+WI0DCxkFoj8+JVeDUwNQq46p8ivdXxpyxLjFpDBovUBdaNPBKP/SXODzu7YS9
	5+15x76kHftK/KnEZZpLOUVsagkWhEThHgICYy50tiXWA5vSaIKDYSdoBPWSZD6u8qh+aC
	SoSGafZ4w/j8g6aOEGnGnCMKv1S/rzJU6dN3Z4NL/uvs2wvzLuXv2rYHZ34533emQ8mX0v
	Qxrxq6bz6etkutKUHYRGny4mlJGdeXoU0oHyduGA8ITCuTvULLhj7aVdhtzdHkxYgDjbGN
	/ex6YyeK0sJubPFPN2JtzdFXzzNwpJv30wgrRaBrfCKAbBlSyj0cpOOpPEHcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793701879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rs9aptcosfl4sxU2wNHY4NxTkHzvKObUn6UWa3h+nME=;
	b=FubyZAbmQq+bPiRMDFmiDkVNKV71j0fzbjidx1vr3xHI3EI5YX3BQloJ89gAMldjG+hjkk
	MAQ2DuD87/sgJwRem4E4o0bl0u++8mfXWThb2xhRr7uzCuHgLHkRJ6pZAc+BKd/JrZ9jMY
	oPKXohFIT5Sl/fhcitKu9R1pTioqlmHIUiWLANE848XKlF5btWAJRAmpIghaPBnwLMdHtV
	qJIB1bknRPV28OXMA/U6PuAQiOPaFixU0uJNSz7if8LmkJXRdnw0zukWTn65VZE9d7A6DB
	n1b2m0P/Prf+LTq9GPpBJ4BOeAM6oRhQHx2p5EmpEyoaErJ9d0PXBlF5sy+A0w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793701879; a=rsa-sha256;
	cv=none;
	b=VUsRnU+dEyTEWmeRWoGndG1GfUBiXbIaSKttV4pu/mt7nuQWBvquwQ7Wbu4WY2lEAfwL6f
	TwT3aYomUlDfVzhzkamXghph/AaZ/0Od8Hvf4mz4/PndK7UhZOYqAjQw7ZvHynTmxASLxp
	jMwnWQ2l6GIKH+LkU5Em75nq4QcLX73EmE+7qM+fCisi3E/XBBSoRUfGBxnE92Yu6GqE+6
	jTDrzZucTTJCSfjOosQmpfEnYEExl7/G+xZLaZwhP8cu3KWZ5HnVHNS0I3ufg25UoxDRNd
	chES1gYvOu8uRuqqWGdN7kXz/WBmTKzVWPZMz6ahdkyCLa50RNqp4kCW7KCSpA==
Message-ID: <494e3f11c03c9d7a58bd334b899bee1417d7e122.camel@pengutronix.de>
Subject: Re: [PATCH v4 0/2] reset: Serialize shared resets whose ops may
 sleep
From: Philipp Zabel <p.zabel@pengutronix.de>
To: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org, alvin.sipraga@analog.com
Date: Tue, 03 Nov 2026 11:31:19 +0100
In-Reply-To: <20261023071609.3795354-1-shengjiu.wang@oss.nxp.com>
References: <20261023071609.3795354-1-shengjiu.wang@oss.nxp.com>
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
> For a shared reset only the first caller runs the hardware op; the others
> bump the refcount and return. When the op can sleep, a concurrent caller =
can
> return before the first caller's op has finished and then touch hardware
> still in reset.
>=20
> [...]

Applied to reset/next, thanks!

[1/2] reset: core: Serialize concurrent deassert/reset of shared resets
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3Dbd357ffa1145
[2/2] reset: gpio: Set can_sleep for the shared reset serialization
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D526bed2c313b

regards
Philipp
