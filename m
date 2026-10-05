Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5F52D249B;
	Mon,  5 Oct 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216221; cv=none; b=UMErh0zSCBb0EPgl7N3GDdclNVY21YEGoRCehQxSyHXFfM3zttNTNBA4rciTqOuETSIlwUgO4jyG9dwwteXcpSkSNTGzdx+BgRSL1hbWw6Hw83TRGxi5RZ2kVAYjnD9+azEMa5jNqKkV89N1XDYWqUiBBHRZDYEPUh9eSfvXSLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216221; c=relaxed/simple;
	bh=BrgvY9C1AO5zWbjnc6fnpMokKv5Jds1/AAOuj/pA5OE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tCH7SqO5GuFOu0GWow1xkCFblkdjzRK1Mu1OHq5VtNCuej9nidsLO5sWE2DovaEzt9JR9EZjMj+4UdCHMIYyxgQzSFq4gPrQxGYSgK1V3ryn6s6louxma4qoTxMY7mqjLZspSHUJnRwytk70gasQt9GgM4GkEbmDN5SxldDvVMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6hfV9vw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6hfV9vw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A812A1F000FF;
	Mon,  5 Oct 2026 16:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791216220;
	bh=uy9Q3tbdz+bui0y9VTIEUWiKdTD1iXpwWnnbF74qV50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=N6hfV9vwAAcjKw6ywFISMDvvnnopeXYcUCWfAn34XnUogNcOzMktPYH+pxXOdM3S/
	 1jumCjNGD1Vh94w9SFOm3XxGDWSxohv94SfCKIfoeX15wrSZGeAfw+W+E2saz4ctx4
	 +BpuPUwwiCZUeXFHGr73EPPaWz8taS13cqMMVbCyBF9T8w0sEiZtWnypEq/zah9m4h
	 9VEKAmcLyPt/EpdJEJCyXcSc7wnuJseIUZPlxNapLYO0+eW0VD5ZZ0POAxM1sKSgAI
	 eKrGa1ErfyzAUqEP2ehgUqEkma6GSevWzsps12D/tYaI8lyQ12fMPpLtO2ojxKOMle
	 9VCTamkP7vm9A==
From: Mark Brown <broonie@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mizuno Miotsuki <founder@crepuse.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
In-Reply-To: <20260918125711.94361-1-founder@crepuse.com>
References: <20260918125711.94361-1-founder@crepuse.com>
Subject: Re: [RFC PATCH 0/1] ASoC: codecs: rk3308: add support for codec
 revision B
Message-Id: <179120561124.150114.10537889348334092855.b4-ty@b4>
Date: Mon, 05 Oct 2026 15:06:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BrgvY9C1AO5zWbjnc6fnpMokKv5Jds1/AAOuj/pA5OE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqw8pVUf4HgHtDb0Aiz+dFRtFmIeYir8Vg6yi3P
 6fSkGw1mTyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasPKVQAKCRAk1otyXVSH
 0PV8B/0QM7bHgOvqLr1t/W4Jp0YQkUQP0fuX3bM30P11974tTYC1yOxEvb6nHQC1IL+fxcpLT1r
 k/9i5uAxtlhJPs0bfVqkggEI1rCMuJHy+O0LMJdBGn0jcFWs7RaLJGrI1cyXrhkTzufffM1rdoX
 vgDYPDDqB881h8GDF26/LRB4oEzh+w7RVjpfDtnBiI7a4rV4Ox2BtjOOJfPXZ6C9ToQQEAIh0p/
 ZSLLBKcP67iBUSAdaqoJMBkIgABzp55DKVsr8XIcLdhuEzP0xj3fJD80mZNumhH4Tfj6dNK96Iw
 6Je0apFoibi4lnMlkvICYq4XIFrgjD+TAr9GsCMPkAF8mFqW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 18 Sep 2026 12:57:18 +0000, Mizuno Miotsuki wrote:
> ASoC: codecs: rk3308: add support for codec revision B
> 
> Hi,
> 
> The current RK3308 internal codec driver detects codec revision B
> (chip ID 0x3308) but explicitly rejects it. The initial 2022 driver
> supported revision B with a monolithic power sequence; the later DAPM
> rewrite left it unsupported.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: rk3308: add support for codec revision B
      https://git.kernel.org/broonie/sound/c/157f7cba77a9

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

