Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176179;
	b=kGgImZvGdLkNM5fB+DgmneJ6ZOHLEuyOTOEAx5hJN3mpYnFBFGi++aN6LbZaZ4F5c9fx
	 4TSjpWxRKcLi3EangTgOFmMw6UthIuhDutTsHb/f2snad51nDP6eqseFjjfbasYCQVZ8b
	 0Tu8Oq3KJ83vE+I6F7xWNcHa8fKV8LPWXXzMuW2UfcZq1qEDm5N36CUllB0X80WJ3sCiM
	 i4MqEEsDvqD0aSxwrMp4QmfjR67kSRJqkKjH5kF2dogtfTiJuvutIyYqIp0NQQNrEzxXE
	 Wl5UjKml0Q0NlWOu823EYPUOgMpEETbkcBtnZTAW66kb2N6pE97wE3UbUZyTgvTatqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176179;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=h/BXNV5KmnftMz4JbY+xYVAt+31U1Mno5Ert58DSwbE=;
	b=RRQKtoEKijGgbc/Ph5WR4cMa0B2Aona+Tcjl10YLBQ9MBmCyTF+r7QHxu854GJAo8Kl6
	 St9spHoXI8hSvM7TsOaiNSvSgYG/b2vcvqD1A+fidsgIm63yUtdc5XnBm0FndX2/5ttQJ
	 De3DZt0nnZb4PE1WqXrNhVrNiLIYKK9E4c+2tNKe+xV8arpknRhjwae1XyhZzo6grOuSq
	 igc1i5jTGv6yaQCEIftPq8d5EI7Cr9JS9wEjNvWbGgJFVWSZDapTg0OKwaT4AKTyj0fvY
	 lZ0JS/4QMydyP26hylO6XdEPI91CnbYpLHYQtzQLEoBCgqLV2hG5VIWG9SDljHuwbug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=lUt0kdQS;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96E2606A31A;
	Wed, 28 Oct 2026 08:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C96E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=lUt0kdQS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793176175; x=1793435375;
	bh=h/BXNV5KmnftMz4JbY+xYVAt+31U1Mno5Ert58DSwbE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lUt0kdQSS4nc3g30V5241BayPjShY+BHQEYKoDdxdL/1KG0FrZtMHVyTCifCxQOjX
	 VcOfV5MzXoySVZCOZ+EANqaYLdITcNzBH8GLxjCAUtwN/H7FnfdtLazuBuwZVeMHCv
	 mXXmLPT/Ii4dcTE7MY1hZEyZYIiNOOZUP/Gpo+ImvPWiI4MIVgfEuJ3KKe+UXKA9Sy
	 Y5rjBKDz2b+fPkX41/hPGGrvalq7gqDDD1Li64W3Oe1sWAarJ4E32vIIsT6rDLWCXF
	 t/XO83f4XmPNh2v3AQhw9mQWxzCcICtuSm3IND7bgrrUmXZXPey9/LjunJ4wDtQj/C
	 bAmtRYAezEq4g==
Date: Wed, 28 Oct 2026 08:29:32 +0000
To: Marco Ziliani <rylos78@gmail.com>
From: Simon Kruse <simon0x+git@proton.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chris Simpson <chris@nilk.net>, "D. Manresa" <dmanresa@gmail.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: i2c: ov5693: Fix mode changes, flips and autosuspend
Message-ID: <20261028082920.63853-1-simon0x+git@proton.me>
In-Reply-To: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
References: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
Feedback-ID: 50827409:user:proton
X-Pm-Message-ID: 400b86fdf90199f6f45c4cee69955c781dc19203
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

Hi Marco,

On Tue, Oct 27, 2026 at 09:29:44PM +0100, Marco Ziliani wrote:
> [PATCH 0/3] media: i2c: ov5693: Fix mode changes, flips and autosuspend

Thanks for Cc'ing me. Your 1/3 is the same change as the mode move in my
active-state conversion [1], and it stands better on its own, so I will
drop that part from my patch.

Unless anyone objects, I will rebase v2 of the conversion on top of
your whole series rather than the other way around. The conversion
then also moves your flip/Bayer window helpers from ov5693->mode to the
active state. v2 will keep the driver mutex as the state lock, as Dan
asked, and say in the cover letter that it depends on your series.

I will run your series on a Surface Pro 9 and reply with the result.

[1] https://lore.kernel.org/all/20261027074933.21921-1-simon0x+git@proton.m=
e/

Regards,
Simon

