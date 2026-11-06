Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970500;
	b=yRPDdDavMMAVkmTKTEl1AaRViTiWiDDAJK29fLJUSdiiCnHMpo5YeiTVuZ3gxYrWlJmH
	 32KNJoj3U7mSMymwMyeHfDaaKdlrn9ECMsYh6jrnyQLYyTc0mAYt42LLSiDGWoKAquXyk
	 vRpPNK0lXT5/YElz5Bg1k89lz9EjUAU07V5WctOzUkBM35fRT5go+T7dlAS1dt8JxPaYB
	 qlfXLc+xovqQ2uqMeRH9r2RLmBchvjC1HHWn5gJWdZG1iCiE3cLGcOMOS4d76WCE94sGZ
	 pPRQ0Bh2+Mkowa14C2/alM8RIZk9A4KkzIaqfjRZRAXgXxX5xsDCi0PVA6tu6lGs+6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970500;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Q2XxXyLnn3njFqADeLyzH8+KoIPL5C0YsaGXv/K6wvs=;
	b=XB5OVziGq/4LNwPc5SnQWgv+MAjkmkuwsYl1x6cbl0TL6KQn/yA0uayO/EWd53HOwqXh
	 lgfO3zlt1qYn6DY/aNKVrBhwlN62NGMP8mkMwrvKAuqltr2uleOfhMBg+V5r1t2MI53pf
	 v1WS3JInDfh25xJ/0HkzSul1mjb8EZvJzEOBBJYpl77SGX+ndu93WIkOYiySrgPgdphd0
	 Xm7JM1JuIVeaVANlZ08ToBW7UzkGlsDg/5KOx4fdfV5/nQYL/QH6SS5pMbM7+FUn10kBD
	 cSleP4ahWMEZAeSiYDDxCx98eq3aa0z186kM43pMGbLYe2iVmNnSvlDUVeEwCBBIN/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mt4fMWve;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AEA606A32D;
	Fri,  6 Nov 2026 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mt4fMWve
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8E71F008A3;
	Fri,  6 Nov 2026 13:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970499;
	bh=Q2XxXyLnn3njFqADeLyzH8+KoIPL5C0YsaGXv/K6wvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mt4fMWveWj0v2A9Oge2UgT7fZ7UY61uJ2ZMoiQBDerqOfUinryjl7PLJwSNgEP/Xw
	 RPJLaBoRF/l97fjF+0gae+7eUqjkSYq3ILZj/mvcrQFAqJkJJRlTJLEYfpxbI7SaKZ
	 DRekVGiSjTxQE+7BOZnUfG5QWWZvHVIIRy5RKgs0qRPoX51LwlWDTjS7PeWpkfFiXH
	 l9U/XHGHre1kQdTx78/aPTNHNaDI5TKtq1zpt2b0BoV+cNNNb11kFL44On9inLf1zh
	 nT2nBAyLNnot2uY3UVBrdifOEZU2OnAXJVStl/Lqda8KnLPuy4FlxELKRzokDkFpwr
	 Ui/MhHXJHxG/A==
Date: Fri, 6 Nov 2026 07:08:17 -0600
From: Rob Herring <robh@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	sean@mess.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: amlogic,meson6-ir: allow
 wakeup-source
Message-ID: <20261106130817.GA2526190-robh@kernel.org>
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>

On Fri, Nov 06, 2026 at 11:19:53AM +0100, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The receiver can stay powered across suspend and wake the system when
> a remote control key is pressed. Allow boards to mark it as a wakeup
> source.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Missing Krzysztof's ack...
