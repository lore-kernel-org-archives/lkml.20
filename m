Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B2D43DEB5;
	Fri,  9 Oct 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529805; cv=none; b=Q8/YKRwGgDQLFiG9/Db1hOXXZwMQx4BTq6L9lgHoqxjXZXhtK+Lt9WdccBKrgUuxphOOxJkeZbkSeOp3AQnb2kNhwc7jzq6bEGki+9HZMq5ZdkrG0gpBtjFLm2eOkklcJN11SuuDkoKOvPX1BYwLzMDqOeq0M1tu0gY3LFzSNGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529805; c=relaxed/simple;
	bh=ApwHXccA13tThdbmTcUjBBn+h4UCN92jWt1cppruupc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhMtdw0+Pnoalj8/JGlGJ0P8FxDoSafAzv+mkb54LiB9WZQtRX8mlXa9rncJCLpWkn/pvnb+wwSzO/2IowZ4TqKEfWfvb8uSCTlP8NJhHuz9l8fiIAbWV8gE5setZwgYjtS9OOba2S5jwho6tJL3Uqc3bV1JIZQpjct//+gVxs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GfTAhvol; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GfTAhvol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497431F000FF;
	Fri,  9 Oct 2026 07:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791529803;
	bh=ApwHXccA13tThdbmTcUjBBn+h4UCN92jWt1cppruupc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GfTAhvolL0PePaww07ARO+VPbW2vNtdQ3Hc19seTkOtHisl3eCbEI5fohaRcN13eU
	 go2VESSFrPNFQ8KH/fervuaphvHBw6j5ozwDt5kiZn3tCzZR6SyXTj06avbvQrS02j
	 8RbDxHI6Ylw8otTr45RTgp0ObZDqYtLFIjYEvwWt6gvi6KraZU6p431CiYSyiN0nU6
	 wqZ+rMHzNHz+uiUtGcVsS1gbbOOIOn/GjH1NcVNK/0WQvnJ8WGLRX3Ju7f1rBA85QL
	 p/qhIjR+i+nEHiDrwcEspuSCx6lAHfrIeVnYoI89yBeMJNQYMLPvd9ZmAThS+U9rks
	 sXQwyP/2AncNQ==
Date: Fri, 9 Oct 2026 09:10:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip
 power supplies
Message-ID: <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>

On Sun, Oct 04, 2026 at 04:03:29PM +1000, James Calligeros wrote:
> Some integrators do not expose the power rails connected to the codec
> in a way that can be expressed in the Devicetree. Do not require them
> to be specified on such platforms.

I don't understand how these cannot be expressed in Devicetree. What are
we missing?

Best regards,
Krzysztof

