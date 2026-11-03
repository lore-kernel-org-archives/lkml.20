Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793709468;
	b=o5go5bVFvcCB7wjNRaJQO3HqlpDjJnAJZdUnZ7QHQzYr18AnK+PxNzZRsNVwoYDmtZGI
	 dF5vhxttrqI6OnmHtS0+FddOQY+sX3QviWbUnyGbb+cqGL4iIS/YNuMgFXKypXTili4QQ
	 q7OO0xvIPRuMff9AoGq8wpxETvPazKlifTUHEpF1KW7Es01wL9b+pQ2Gij2mICMN7SMlM
	 RGQtDpJFG5UMNinnoogxXnXY77THY6+jawMrSQPp8BEFwXpBNrCxJvifUMybFXcglcNtM
	 gOQY+axJyZXlpgcTTLCGbqkiMFn2OZzAiCw09A421/cjwoH9tkR+3dVeUkn1SeF4Xsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709468;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=+ddua3xHFhX6FiIfkiObbdYlqZmTz0MU5HceK1STVTo=;
	b=5V7AL7DTce0b1zENB14eQEXLfsLV0C7diHhKtRUVYDi53XwWB8ymZ3maBiLA5ALvB5aC
	 owBbOQA4tc4QGeHq6fu8LlCesAOVgMvkLTRoKlFxoRJu3whmOcHvEzO4eSoD/3MGRa5tb
	 njbFbgHeW/NaUHBZvWMDbbal9eYvsjkTSqcy38OoPVDochmrBNxVyIywmlGuToWEJG+wI
	 5bvGFDbVoqhVQOjMvmrpvJZ+Y+vlW8pKItqfCpELWYssTWmPxuXHw12qMb4XlGJD/gJwU
	 aqKSLXgY9HcfgXU7jLdt3caBnZut3lC7ziplaIbpaNNmKr+zQ4rEQh8x7Dqsg824Few==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="BO/H0i68";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E938A606A32F;
	Tue,  3 Nov 2026 12:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E938A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=BO/H0i68
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1D424200AD1;
	Tue, 03 Nov 2026 13:37:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793709465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ddua3xHFhX6FiIfkiObbdYlqZmTz0MU5HceK1STVTo=;
	b=BO/H0i68wnKffwPtCpOD28vFuxXGLOE6+SqqlnUIRiE/XuzyNf/bsAxu7IEhrfPs4YKCHU
	uyEKsUnxjCqYuvTkDTCepmAogSzSsbNAnbNvDFgda36hRn8NjZYpxJWWc5HrY2q2p1paH2
	U+va+p0gvZSD3oJfFCdA4RQ0ChFwodcC5pMSnqcdEzjV+NyNry1NH2DPC00QbgLm98Ky3k
	hBleSvCLYKsAptESHRfE4J/cje/WIrR5ghh9D2g4TzQ/UbO/vwin3FGLb9/HtIO7mQUOzm
	RDU50Cl3RE47U0qwMHPnyPJ/Y368IIg0pEWK37AmD/IUNKxuDO3xitwrF3/KpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793709465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ddua3xHFhX6FiIfkiObbdYlqZmTz0MU5HceK1STVTo=;
	b=OU2X9azv4quqjYrbkCv4t84NTC/QSo0AFFW49W4nhCmBCkkY+xSZPPJ8LnOA+PUDGRznt1
	YH94SdJoi3dKufoTveBwVSkbrRXSBnK7QgqlRJ1hn6TinB/b4UBA2a84UXTgHCkM/b2NrA
	r7bRoB5W7qDV2fi48cmDYivnyj+29wEhsiLQwqJ1O2WvdBQZMvGOgz//vQqOa49zIlo6g2
	5Mt5GC4zaE1RSx2el2ZWRvFXU3U5PqYBzJXgx/kUFOQUNxoedw+lc0BSORKb/Ahxv20chn
	guq8fcPQgxBZ6v0mlG3NuHDyIxjANLFhy1ZShFr2XJTxHY++LrjL0/ZOKHHruA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793709465; a=rsa-sha256;
	cv=none;
	b=gdYsOpdQxS4Xku6iSh8ljCqjr7FfOy1Zx3Ars2dSklNgHuPwvamC7PpVvypInvPMFm9e3b
	XURFtbXHuRqxBkt44rMLdNMXRrDFdc/WZkDa2iaLTMdrw2Dl+2WTv+J54+zHjx9paAbvh8
	Z/vLSTmJJXX1pqesuCA82LihJU16NsI/dh8LQSFZhD0WWTpNgJxLcGi1ASvLhG/wSdWKjN
	Qdn37ZIDREwYXfv1aDBMGD2dmu25n7iKFSd4LIvUj7t5mL6v8Mvnb6FCt/+QbzXZyjLFYD
	wcL0vaJokb+L/ywjs3IUDlTvkBj3I05NFU82CYBiL4TF4FQxQkrZt0Uhv6AmmA==
Message-ID: <deb80268fa29d5e9cf63f6760c659b707ee6c5c0.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] Restore RZ/V2H(P) USB2PHY reset and VBENCTL mux
 state on resume
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, Peter
 Rosin	 <peda@lysator.liu.se>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>,  Alvin =?UTF-8?Q?=C5=A0ipraga?=	
 <alvin.sipraga@analog.com>, linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 13:37:44 +0100
In-Reply-To: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
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

On Do, 2026-10-08 at 09:44 +0200, Tommaso Merciai wrote:
> Hi,
>=20
> This series adds suspend/resume support to the RZ/V2H(P) USB2PHY reset an=
d
> VBENCTL mux drivers.
>
> [...]

Partially applied to reset/next, thanks!

[1/2] reset: rzv2h-usb2phy: Add suspend/resume support
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3De7915fe110d8

regards
Philipp
