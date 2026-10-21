Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792588142;
	b=nuOTYFjCbEawrLklOZ6nkFDwYCmSz69LcUFOpb/l/mNDa3X4mnA5PKJX9j6MkiezCtSY
	 5+KabpbMeCEF9hQlL5/tx1NNAc8joSUT8Z0NVcY/48xjAapewzU/6P/yGECRpwKdq/5BK
	 ivTmBMm7i9/wA7BgMBIMseswcXhjnQHfaHahhE4vgWx9HXt5TXMPnkl7fNx91ovg7zByo
	 QwRO/HJCeT6hxu85Ki+xQCEVtOh209dpILji9zeuZPuWFXsE4MbutZ4wwqyWLGbJ75wRh
	 SPCfJx7xQomenIb2NKMgeM8pkSZDhOkAa0JYk+/cacdrJK9G8QID3XqLyOnxxn9qI0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588142;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=NACHf3MpA2Z29v6RpiB327pgryw33carefl3Um/1JYc=;
	b=tI69taVgyO02hgy1iIrXHJ/m5l1DVqJdcpVKQcR0XjsgfGm7l9rX+ahIOubbXit2fn9h
	 /JhjxQVCbwm6m1s2krNoFChauz99DCo6NuFq3RDTHtwXgy8uKQbhNTWKcjQOeWsmBhha6
	 6BPerpoy5nyo5cnetFaGYRyBQvtYhQLLFrn1WQx3KywVRRQ4WFSB4+SRRwoL5lJrA1q1F
	 Z9DUMbRu0k9IVyILZXnAaZQR5cLWSGi0zsg+0xGYs90relfnCZkFZFIzDuvx7e8IYZcPl
	 8rbCGBH1+d0xZnsxDXE8OaRChe+2rImCvlF06PWIKsNGQPOF6FYr+TVPfAbOSeUf26A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=R8uGqCm8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4796F606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4796F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=R8uGqCm8
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 543852017C1;
	Wed, 21 Oct 2026 15:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792588138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NACHf3MpA2Z29v6RpiB327pgryw33carefl3Um/1JYc=;
	b=R8uGqCm8/MGbuHjf7MIF9PQsjey3ZRTC+XBg48O8PIjxIHqJ1yTYne6gDmeiK0bzsSc8Ep
	nQ27t/ShYxl+mJXok76eLztPt7FmTPpem96nxSFVRQ9x5YLkTu1TtMOMG0H7evWEjyBSDa
	iIXP2GA/MzycPxckYuNqhZP77r9hP6095sKGVMXonKP3yIORX//xs17GdpBBmr99aSvXxh
	DGC+qZfRsN0S52/Mv0t+VTEOT7qgZzVgelPl7Um4OW2pmJl1QnDhCF9nH7os7L7Sb0Xv7Z
	PHapo4kEf9CMUsu/xf/j91kRIqbkdiv2vnhRU2NpqpDn4jeAaaI687oM5PwiEQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792588138; a=rsa-sha256;
	cv=none;
	b=S9IQz4z8979vZ6MEZIPMXQIOlMi8oGhu9HcjMk1PQdxKsnXNt9PavqnItUZRKwc5bxRKWi
	pPQkCSCGm9pv1HkymuqwxJQiggWjS+BCicB6X/j0ngpAYbArY2cjbBIwOvfBiYHAxeyEXp
	MI+QmLgtrcAJDnuZ5IFmHXuAMg2iILFRXT2zZhFVujVRdFo7k223jJsU2YGvS7otG5adnw
	Yk23AWn9ZKh7iR9nXT+Sl8cTKqKChXPDNirPNQXJdM1jSfDPpP26/Uf17JPB8bs68taqLz
	iyFFTYzq+jZ2AZ972Sdw2MYUDA+Ijp0FUHcOUIFqy12dO5K/lT3U7AZgsDWnUQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792588138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NACHf3MpA2Z29v6RpiB327pgryw33carefl3Um/1JYc=;
	b=MbUI2xy/T2JvUfljrMMoGD+NaxevJ5ArDj3fnSudjSm1Zzp2mpAh9/7/XKc/07JIQXBwhQ
	ple4g8cTZ6BIbTmtvKUE79INCYUa1o/Rga1HDlbLYV16hBBNxMNdSnBzrrTxvkCXK/xLtV
	l4Kv4qDgaD4Itzug/Po7SngurSI5Hb28jtODZjSmV8s5OXG6QzTXGLSf9gTZEKEbaFMA+x
	7S0+rLktSUDSmgY/6yDNRKwtss9alTDYcmQOOAzxzcPyL5bAmMlGlWa56npUyp59lX/wh2
	IYsz4cn9E311q5/KauA8AHkm2WK9E2c1AG5RAURyeZrgbTeirci7hKTXa315AQ==
Message-ID: <5bf7f29d89ecc415ac5d7a3d62d0eac4c46e3a1f.camel@pengutronix.de>
Subject: Re: [PATCH] reset: spacemit: Fix the RCPU2 PWM reset registers
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>, Guodong Xu
 <docular.xu@gmail.com>,  Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Alex Elder	
 <elder@riscstar.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, 	linux-kernel@vger.kernel.org
Date: Wed, 21 Oct 2026 15:08:58 +0200
In-Reply-To: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
References: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
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

On Sa, 2026-10-17 at 22:08 +0800, Hung-Chun Tseng wrote:
> Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
> or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
> instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
> 4 * n, as k1-syscon.h already defines.
>=20
> On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
> for the fan, the RCPU2 registers read:
>=20
>   0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4
>=20
> Only PWM2's register has its reset deasserted, which matches one
> register per PWM.
>=20
> Use the matching register for each reset. No in-tree device tree uses
> the RCPU2 PWMs yet, so this has no effect on current boards, but it
> would break the first one that does.
>=20
> Build-tested only (riscv defconfig, W=3D1); the fix could not be tested
> at runtime, as mainline has no RCPU2 PWM node to exercise it.
>=20
> Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU reset=
s")
> Assisted-by: claude-opus-5-5

Drop, see 1e035297ffda ("docs: remove Assisted-by references").
Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>


regards
Philipp
