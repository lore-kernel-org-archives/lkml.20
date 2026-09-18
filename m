Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE74F2E62A9;
	Fri, 18 Sep 2026 23:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789774751; cv=none; b=d8ON1QuD2ILUYLh7FrjcB5qlsc79E+q5ITqw64K6+x83HeGzN70Pfp7yr0w2T+T3EwIqj1ZRtfO4lco+NtvtOvkjkR66uvi3YTbJXJdvn/FOxUFX//VgJxkvA9rduWb5O2geNKsr2gENfRB6Vq+5YKKWdBsvNXZ+T5jnQFR8Rrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789774751; c=relaxed/simple;
	bh=sBVKnxQf1Nq4s2Z0zBVbNjUBDDqg6SVX6zVK3AC7mug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=igqyQ5y/ZZeFkVVN3Xr05vOQ0SHMRw2QfRwMu7yq9zxf65/yem8wCSUqWtnzN3sHrZEsI/GWP2QTIRIIMgthmeWaMKXUWUgHKz3ouyFwUhhh21lBSMVP4JKomMd1MUtAq4kwqiG32LbydTfTrUsZ3QsrHw2+XVPoKcAX2n4lb7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJZwv+BF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJZwv+BF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DED41F000FF;
	Fri, 18 Sep 2026 23:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789774750;
	bh=Gzczy9Oh/Ctdwjy86C+yXfHBllDVWWkUhPIAU447dO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nJZwv+BFbzCoE1zegouQhnbxI2cUDm7aLsjAusRLPTrOEv07wWyCwiQrOc8n3Thq5
	 SqLUTStwImmtB37FjJVuFpZ3epW2hgwiBjkotEXBrm1Ie5pGHH5NSIvcF9LmJ9LbNj
	 yNJsGvoIvzc3KNY4MuPWybXnXusR/w51+6NIQT0oAyvEW+HHR1GjOPfh+VrFWR1Kb2
	 cvO9hIPy7OvUL9vLggPEsDhiyddaCYL+uqT+esi4pP27zNdxzmTIeDFsLo2h593xSz
	 vNLp/ywP2+F2nX968ilS32gS3haupyRRzPw/xawEwqCaq/5+SW9Ynw4kInIhvvge4w
	 AqH5Ch2G6DpfA==
From: Yixun Lan <dlan@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
Date: Fri, 18 Sep 2026 23:39:02 +0000
Message-ID: <178977466389.1115729.2520600398672212403.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915-kx-i2s-dts-v3-1-cf0b90882a97@linux.spacemit.com>
References: <20260915-kx-i2s-dts-v3-1-cf0b90882a97@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Sep 2026 11:23:16 +0800, Troy Mitchell wrote:
> Add the six SSPA-based I2S controller nodes for the K3 SoC.
> 
> i2s0 and i2s2-i2s5 each have a dedicated per-controller sysclk
> divider, so they use the published 7-clock layout (sysclk, bclk, bus,
> func, sysclk_div, c_sysclk, c_bclk).
> 
> i2s1 uses 6 clocks (sysclk, bclk, bus, func, c_sysclk, c_bclk) because
> its sysclk is driven directly by a DDN (ISCCR0) and has no separate
> divider stage.
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=c37ee906b45bc06782fa1b69f3a53bace67ace66

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
