Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054459;
	b=wyRQHDsLxnuJJAo13tole+IjTbf1Vuwnbg/BYbNNYyYhNNqH9AoI5mK4MYcmp6MprOLQ
	 p18jrOgGFoUxRRH8oEdEhXiBMeU3b+xsM67wrv6KtvfjRdpdw1fKn1xQrnmE39jTLVelV
	 XoyDCm8s1aD0naCR5WMkAKp4dfuovKoPA6aECf6jy+Mhs3XdU5fStIC5lipN1Z2gOwYmT
	 aE/LuMoSf2Yebl/sTJP458Irf3e1SzeoEERlOvfrWCVJXc0bqpRhPCRyRHlUT03xAXP5Q
	 9MUudFZd4kmnKna6qcqUb6SlwC19p30nvpQDcZfjXdJq21P5ZUV32K/cmOGfPrV42WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054459;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=r+mb1Rc2WcEfAKXk63Gi4U4GW9zoasUMxFtV8WLn0RE=;
	b=C/EU4pDxV9ht53PAgyWI1YTzuP8NRkb4RT6FtU2MV+O0FZFlPPRjZRC7PF1jY8SlAV1X
	 uicSn2WSVflWjN3rSNrGfK6rYFvTNOMLb4iSfMgHef2kxEUfrWxo9kLd4OfufNgLGDn6x
	 GtT24dGcWu74NI49rUIpVxm/7eilNokW84AV2T1W2K7kP/muYAdU3WtGxhD7nmDvL7o8c
	 L6FNeTl6quJE3/ZU2pfkVBLOrS8/1xrrpqdjpkOCh4qQPfSPR1IDALWJkfY5Z2XcvLSw9
	 MvovAl/Nn7nkl78xvZBA04aPB112ZJPN83h7jJMCrgM9Y4TCI/FqvrrUP4ODWBhEk9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=WkiHRsyH;
	arc=none smtp.remote-ip=185.70.43.102
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91680606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91680606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=WkiHRsyH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793054456; x=1793313656;
	bh=r+mb1Rc2WcEfAKXk63Gi4U4GW9zoasUMxFtV8WLn0RE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WkiHRsyHHgW9lgbeYQ6Nx0zzQ/j3nyJdAduwycOaoa6UhCaWqm0riJdqJv/Jvv7S4
	 9pTHkTaTJGmDU2rjPGky73P90hdxvadko7/ESUa7SeI1AXln4TkzmE5k7MCrzm4/hC
	 UFsc8o5GT6guhWpvhjIW2a8ialSPR0+jTH233/bWH2nsY/oSLbjNUdNaDnOMs15o8K
	 2Y0P41BjUJZR3n5hNoCGB00hXdA4BorjePacbrN5Fw5dpWuOwZyarefEZA3c+OLc/L
	 PoNmWbxmQ8ANrXmS9d9iRWK/TtB+vZi8HsEnp9XPfXDhbss0GK4SROAzJWU9yH27ol
	 HvLE18V9jyBDA==
Date: Mon, 26 Oct 2026 22:40:54 +0000
To: Takashi Iwai <tiwai@suse.com>
From: Sinan Turunc <enscrpt@pm.me>
Cc: Jaroslav Kysela <perex@perex.cz>, Clemens Ladisch <clemens@ladisch.de>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: usb-audio, ua101: oversized packet copies overrun PCM ring buffers
Message-ID: <20261026224036.657-1-enscrpt@pm.me>
In-Reply-To: <875wyo60q0.wl-tiwai@suse.de>
References: <20261026001003.1067-1-enscrpt@pm.me> <87tsm86fzy.wl-tiwai@suse.de> <20261026122855.283-1-enscrpt@pm.me> <875wyo60q0.wl-tiwai@suse.de>
Feedback-ID: 48393780:user:proton
X-Pm-Message-ID: c177420349a6941e19584f2ce4767d44ffff6fde
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Takashi,

Understood, thanks. I have resent the series as v2 with my real name,
Sinan Turunc, in From and Signed-off-by. There is no code change.

v2: https://lore.kernel.org/all/20261026223543.620-1-enscrpt@pm.me/

Thanks,
Sinan Turunc

