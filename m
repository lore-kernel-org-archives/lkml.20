Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794766043;
	b=CSC0JTu6r43ZabvC7hSs6bcBE2d7tOwCRQvTEehkTT5PlOu9O9lB3WQFveQysqlrGWUc
	 peiLUXas60SvC4P6bXROhaaxbiuWYdbwa5N9KQJR8fu/3uloemW2QiNDZJIos5V5U38Ml
	 IPXkd7wLRYwIvfRQ0xXbVB//qK0ZAKg+Iti6Dwxn/ISR+Zbshsw6btHasnHuUFTkOzMSc
	 MJIPA8EMe42pKgnkraSAwYJ4XYsymN2nKy5uIvlpgTdIVYhr66OaZ+7pk64pcU4smwYfK
	 x0CtnrAYXiNf+/VNn2Oefq9Sr4OsfkKoUkAbzan9+IGeMHGrxptSuVaJMP2yFdbsjVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766043;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=l52lI99/u0xLVXzwr8zRMu9sPhDs2lTdZmlj21zNAjs=;
	b=oA4T5LAIbSFpa7dDQHl1bqj8xy11KFeg1tGELmiU5n3yw1xyhvaOux0stwGXFKR/IEeV
	 Z8QWwzTKv6tabYdnyiV+CgDortpdyw7b31iCrjO2NHdHztJonGiqnouti/9HMzxnjbvY9
	 0EuY2sYxnV8JzZ8qzVRUBUD89Wm3gENYFRpMpY84R3HfetxXx8ELqHNY81V+RVXePreDR
	 +uBpTi6vfbvue8mCjjZZkipX28qmOfq41e+GzZC7hVtgiqaek5tUPMpVCvw+KtFHfgrsq
	 JW/9Hbhz+RHa+qn7Z51G9OTbT2ZPbDbghzj0RCGxMOg3FIxd6EDTK3iMG+4CoEf3Clg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MuMFYA2z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEA9606A31A;
	Sun, 15 Nov 2026 18:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MuMFYA2z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7851F000C4;
	Sun, 15 Nov 2026 18:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794766042;
	bh=l52lI99/u0xLVXzwr8zRMu9sPhDs2lTdZmlj21zNAjs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=MuMFYA2z1Y2oba2gPNcM+zLsP2IUACKuanMnCLrN260zUZnESn85Z40vT22j5b6xc
	 nACu68Pg8AhhMNoGRfXFwas+reHN1Du6ib6Z65hBpGbcxZtmh5bidPRyscMphxzlZW
	 AGh4J54081G2eEjo2ipnC2lgl2r3B6kUk1jxu0o4UV3Ok/WoQnvgF3eVIZbmv8N1hz
	 rgoZHTrsi5C7Cb55VBnya2/jWTEgAkIFz6hxwn73bycIF8eme6s5qX9NOVIFXZmuSJ
	 KWI9n8zW9uiKC34D028T69IuZDbFO7lmzrdOapo1eVAn/sPIRzTpHAccn5SEHCru9Q
	 9U1t+wfcHbieA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 21FCA33BA091;
	Sun, 15 Nov 2026 18:06:15 +0000 (GMT)
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
Subject: Re: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion
 control
From: Mark Brown <broonie@kernel.org>
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
In-Reply-To: <20261103133935.2892210-1-romain.tisserand@gmail.com>
References: <20261103133935.2892210-1-romain.tisserand@gmail.com>
Date: Sun, 15 Nov 2026 18:06:13 +0000
Message-Id: <179476597358.140154.17606905713832103924.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JgOmomTwucmHGBaErYnCPL+02hVS1hGD2s2sgscCOI4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+fpl+JKtdsfh+mP0xrYU1ff+61NW5mvkvzQozvvjmy
 EOJi1L6HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhI01dGhluTWo2fXDxisKTV
 +OyTR3nfn1p2PN7zZdfql3z3XHKfL2Zk+O+vdl7807Rn4pYhl17yLZb0npt7UaKl/XvrNNupt5Z
 w9jIBAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Bits 1 and 0 of PAEN_HP_CTRL (analog register 0x07; LTRNMUTE, RTLNMUTE)
> feed the inverted left output to the right one and the inverted right
> output to the left one ("Left HPOUT Negative To Right HPOUT Mute" and
> the reverse in the A23 and A33 user manuals and the V3s datasheet; 0 =
> mute, the reset value). The driver defines them but nothing can set
> them.
> 
> They are needed when a mono speaker amplifier is bridged across HPL and
> HPR, as on the PocketGo S30 (A33): with the same signal on both outputs
> the speaker gets almost nothing. With a mono mix on both DACs and the
> inverted left added to the right output, HPL - HPR carries the signal.
> 
> Expose them as one enum, "Off", "Left to Right" or "Right to Left", so
> that the two outputs are never fed with each other at the same time. It
> defaults to "Off" (both muted), so nothing changes for existing boards.

What about the configuration with both set simultaneously, so HPL = L-R
and HPR = R-L - that's fairly standard with an actual mono signal (ie,
one channel as opposed to two copies of the mono signal), doubling the
signal over the speaker?

-- 
Mark Brown <broonie@kernel.org>
