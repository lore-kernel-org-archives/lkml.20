Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD23E4D9F88;
	Thu, 17 Sep 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644729; cv=none; b=ivVRQxWh7QvveVvRceJWnqLsvhupumOiLCUgZ9YrKiLj4//hqPiiNhFKqE683IWTBNZ9GdTsJFwDWbob2dqN5HFYAnK2cSkTO5f5P/w51hpL20Z6eHPrVt0hTa2y09RzZMZzG8EHOKBwDCRrR9mFlyiYGdua0whs3vp7bpkypg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644729; c=relaxed/simple;
	bh=aJAupMsPNRfstW6zItRZVJiPfdlytRV/2c9Z1up3d8Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TXP+JcgA+xxz0xndi424vJk7QH+RWfN1j5qrVvff7uXwYWy82rEuKVpmu2FstIl2k/1nOSlmZY6+OKE4hve+vtXMKnyP5lVHW5seF9Yk37kWmClYtBTGIN58hEXlxtUBoXCMGJiG1ZQt2hbjhRUpZyrqjdzODU21hdlEgVMxrOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvmYycwf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvmYycwf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E963A1F000FF;
	Thu, 17 Sep 2026 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644727;
	bh=OWEyyZmQiK0Upj8DT+N+93cO2Iyd/cP5MAXPEjfPHxo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DvmYycwftE6Bdw1mJ5Czs5SmxyaXpVnC0AC1D3P20BpR8HbO3rU3VQcyMPFVsJLbx
	 lpkDpJiI7vCF1hwLOKq4dzo/Ig51L1AeXfP14ThIHmrI26pGw6svdPoF0d1LgejT9o
	 fm3o7nWWuZxqHfuFNLig4ZYa4j84UbL7bcFS9t2q7m5A4OU0lnKVlM8ymm0gtosvut
	 eNm/UIEg3VE6wICmDGoQFp4/+U4CZU1MnBMj20/pktWGAeHBms84Y+ASYTnZg2UhXr
	 Bi3TqUjbqCZn6Odq7bVpAzI7hrLXc7f3gbiS6xA663V3JUA0P/ckyxux6OGvbNJrY5
	 NP1sV9NBJxZnQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
 Sasha Levin <sashal@kernel.org>
Cc: kernel test robot <lkp@intel.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260913173132.1172003-1-sashal@kernel.org>
References: <20260913173132.1172003-1-sashal@kernel.org>
Subject: Re: [PATCH] ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT()
 arguments
Message-Id: <178958547795.100121.8133262642029282689.b4-ty@b4>
Date: Wed, 16 Sep 2026 20:04:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aJAupMsPNRfstW6zItRZVJiPfdlytRV/2c9Z1up3d8Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqq8+z783rVTcb2UPO/trJ5ijO2IALVfvyLry8p
 DyX9GkS8iWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqvPswAKCRAk1otyXVSH
 0KInB/9lGaAuhKwhY5ZZGDpbTyqRdoGIB/eH2Yb+L7ll1CclFODJbAjx4tQ4neFRcQmS0RFkRYo
 323KXwLMGBKDPWozECoPSjf/rES1dSm5Si3xqDXZEg19HCqPyxjVD9+JG3g5BL5YfDEWDEiIKjg
 J4tuY6HhJVq0aV3Frvzkqm6L/U5G0oJVJ50hN9fQD5eISCQt4xMM8K1yR6H8cEH8KI5NkfsLrup
 KQ6cKaWSo1H/T9T/SUwt3j/SvEMgcDxQUrBG8Nzio4kdy80Mxz6RmJLs/OPPY2AFhOoVLTYdemt
 j4Yk6gC/xD3HzxmL4SH8umdWXikZQjZmz1nx6Anaj0/mGXaZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 13 Sep 2026 13:31:32 -0400, Sasha Levin wrote:
> ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments
      https://git.kernel.org/broonie/sound/c/11fc0048a693

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

