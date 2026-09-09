Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603CC57D215;
	Wed,  9 Sep 2026 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969216; cv=none; b=eqvILuVQQYkJjil9/PvyX6YNpNTIyp083jn/RYCjAnkEaV4u7Le188OST2AhsllEWInTIVpwXWdw4wpBReM1qtiE6TkIZSBMSx8QkPVF4IYv22Ke3CHC0Ys2axHvPjGgJlxhh/w3K08/MSU5/WtX0vCc+Ycli1v+/iGZ4WFz2lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969216; c=relaxed/simple;
	bh=iGJPAj/V67BbVXmV2Ju4rX/PFud28VjwzEtTnJwivqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hcBvpiZ170TcZW4XRz/8PdND4xix9+p+RFK+Az15o1IhpEVJcjmHw5oNnmMyx3/F75q01Ic9+VyQzdjqT+4mFsdKxFfkwnP6I9SDwcflE9PfEfWwnr7VnUF7/VIW/nWAFONtOeEHyVVzBBoQdKf2564VHDKCy/PwZKoUnoLXyKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHgFnKBx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHgFnKBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56631F00A3D;
	Wed,  9 Sep 2026 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788969215;
	bh=N1xYCSvxoAh0TwMDMkjpVQHuszzy3lQk1Ry6iw5bptc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NHgFnKBx6CvfF2oBxHalmk3JXI5oYzmjPeChM9yw6kow6gi1N89jCycvhbfhAWDMl
	 j6s0o3LvFsgYkk9DfVBv2Tx1ljTPxUMxKxBdZ+Tu6I4az88smO3Juy3agcTwQEFIBP
	 Ab4z5KFYp3XKIQPKSjKbn0LhCYbd+OTrda6eaTrqwryM6KMxIY2WTx6COGgkohj59o
	 C2xaz+uTAPPF5YYhhE0eg54me9By5sjClA0yMmX9pnb90wZGORP8UxhefIfOEr8JQs
	 4hhGV/9s8QDr9dhE2fkuLw6SBMOPSsJgGAdveNnXBgJTfDghIeRpUmJw1jmgt9mUc2
	 Q5EWxYn/lN/kA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260824203024.15574-1-rosenp@gmail.com>
References: <20260824203024.15574-1-rosenp@gmail.com>
Subject: Re: [PATCHv5] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-Id: <178895440427.87467.10964819103544860147.b4-ty@b4>
Date: Wed, 09 Sep 2026 12:46:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iGJPAj/V67BbVXmV2Ju4rX/PFud28VjwzEtTnJwivqU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoYD710hcE9cvZ0xKQ3/7pDaOXY5+7VhGkSPEI
 l/J+I3Y9vSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqGA+wAKCRAk1otyXVSH
 0LCECACGkPl6cqugEYTlF3XuP27hk1tNSGISjB2KkwvReRi3HFoWkP3fOmYVey9FihSXLM3Kjwe
 qNhTp1IJPwhsQSrzsszuSjJYRO4yR6KMskBeDNQ9vi6e8x+HFqMU64z14r6jwTVAY0ST3ElOy9e
 +wpGRF0h2KA0YOXKj1Aj8WMtAXvlHB5jrsSZk0HbquQ44tihObGjijM5wDttV7sDIzia67T0pJV
 mW4DX8EU9JdEWUYNhraRXeDvk11z7PyJHdcnhkrW5Q+nZUODw69js7tLRxlKNLBkgygfbl6BP4h
 6PN3b4imEQicQmJjW4v5nhzNR+nJiIphZO7O5w4RYfo3+olZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 24 Aug 2026 13:30:24 -0700, Rosen Penev wrote:
> ASoC: xilinx: formatter_pcm: use more devm in probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: xilinx: formatter_pcm: use more devm in probe
      https://git.kernel.org/broonie/sound/c/3df676110416

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

