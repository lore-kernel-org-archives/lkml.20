Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519697;
	b=L1Bwx4iLWuM+6UTBDbG8BBP2aw5y6e0oE2Vl+foRk57S/yfzpxyiz2iNHMLjeqzyaour
	 JLdC1cPRnHUsJv+hnEqvRclfCw1+warSfhCmi2P/wAaH5JyV7SjEPfWdG1/D2kuPfxHLm
	 2svogKARrzgFKSo5jst1hiHupSxyNwCBS8YRU04bvYiia2RW7fYU6Q3DJKi698jmMQMq/
	 /mNak/tTz/nVnKQJXbgocP7Q0Xy70IF1nsMugY9Xnc3+xXFZ55W92EWnx76dk24WeitpL
	 oGGTaJ8hLtLM4ybfcMMUaIjOQOU4Kl8i4Ctao6HkclTFvmFYOpvmqdCkJwYQCS3T+nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519697;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WItnU3JphMlTYMOTnE4Pme0y21QgJys3MMeDqbhdRdc=;
	b=ai7IDgvKkpVjaT0rdDYmr2BZxJk/2T2jVVykBfrh5nyTYjwPkn5ZEuxq6R5d3zT3x67V
	 lJKK5tArpZBu5FGP8/5CvhwoSxex29kc67Y5nvDeGExDKFaT4KekMs533L358rKYl5kZu
	 IbNyEXvaaE7Ov4BZwTyfAfALRqLzLIfQQfIXBv0rY0Shr2436P8ufiYRvnCmD7dO7BeKu
	 aGpwQhDhQVwcWW+hOuuVbCdllFf93q5Sd7HjtjYh7xdjPiJWHnOwLNPG2DJYJBV14+ZNE
	 0kiCw205DVQG1/k+EAVv4woB1da9NQPjUErGnMfQ8Qekk5evQluom9/fmxMjamkV3aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EVnB/wDG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B7B606A31A;
	Tue, 20 Oct 2026 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EVnB/wDG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83191F000C9;
	Tue, 20 Oct 2026 18:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792519697;
	bh=WItnU3JphMlTYMOTnE4Pme0y21QgJys3MMeDqbhdRdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EVnB/wDG4mN3TskeK4yB1M03z9fyCLZ0jiRa5bppasg0A6IJcd5IzD2n5R2X8zayf
	 O6n+E7GfsJBO/K1GIlbmvtziDKWg4bVjfRIjl4nlsoPnQ0Y7MG2++ldFmMPVjfKHZi
	 JqqM5IDpsWGnINpNvoaXp+9qhkQXb78wDM5hiuKgjxzoSz4sFbEqFO562BnZYhoZL5
	 uzfUg9u22Cv5oyQH1fVKMtJhmB2sLORSY6WEwYv+XTlMqaT7tGYWGWKFpjRiMvpwDs
	 bHIQV2bclzJ/BI93BpMmrgtgj3jK7tbamq8kBl9JPgVge5uVSjVaci4A68/85FkV1G
	 bTpQpbwgtg4Ig==
Date: Tue, 20 Oct 2026 13:08:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: joakim.zhang@cixtech.com
Cc: linux-kernel@vger.kernel.org, lgirdwood@gmail.com, conor+dt@kernel.org,
	p.zabel@pengutronix.de, broonie@kernel.org, perex@perex.cz,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tiwai@suse.com, devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, krzk+dt@kernel.org
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Message-ID: <179251969565.476022.15302211349293373026.robh@kernel.org>
References: <20261019122048.1107179-1-joakim.zhang@cixtech.com>
 <20261019122048.1107179-2-joakim.zhang@cixtech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019122048.1107179-2-joakim.zhang@cixtech.com>


On Mon, 19 Oct 2026 20:20:45 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add the DT binding for the Cadence I2S-SC controller integrated in
> the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
> controller supporting standard I2S, left/right-justified and DSP
> formats, plus TDM operation with up to 16 slots.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,sky1-i2s-sc.yaml       | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

