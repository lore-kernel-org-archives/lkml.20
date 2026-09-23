Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87A43D34B9;
	Wed, 23 Sep 2026 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185731; cv=none; b=Ip2eW75shY6S+uTPWtemDGZVFmGaH8eFnoznDy2Bp/zmb/Rg4zEyQwnTKl9wC9eljafczsNeFi89FKXjlrZrTl3d3/v7Pilq3U3Yxj/dP9Mbjp50DY7R9FjVpVpjiiWGCX6bQGdaE3whOBdu42xnTdOqw8CXkaYPlhAHxZ9pRQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185731; c=relaxed/simple;
	bh=csBgz0UvlGk13BjkrknwcaDES1Io3HiNouEVa0NHMo0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s8vStvPt9uvCebjMOFiw8BFrVRilEruSbHzs8IW3TlOB8tYTxt3zt5GV/Vp/D4wadok28kw7TRUi+rOXOo4XeZDQm+ZflIfgEaRHdOFT+XqTZCIyBE76GE9d4VMx63v/RqRuusXwndgYx8SqhunnJL+smmPY9zSzfGH1Whk+3OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBE34Eew; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBE34Eew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238241F000FF;
	Wed, 23 Sep 2026 17:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790185729;
	bh=CckaMEVy4rBtm+MXQVmSU0YYsqGjTQ9dsOYaa56zuX8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UBE34EewctOoaFl/jGAasB6iOrwZljRTfFJf1t2UTUHBey9b6QOXAI79+YrRUHZnT
	 Z+wEiHybC65Jr8nW4g1s6XgUI8vn5wqzHFGXOOOHeODkPit/Cx3AfXyEXRXnnIW2L4
	 6NSDLqpvT4ILhil9svj2SeensSxOzIvKm1CaEh6Wdgu1Xqx6fkZLuwe0nWB9skaWZ/
	 SSAhlWy1vSmDt/tW+pb8gRnEOu0v74FQLI6oLKTs4zXcKnhAtSwAk4zXWK8DphlUXP
	 qhnmY3ZUZ9ZTd0M7BAEmfYu2SFYfzKTXnrpNnEiZId2Zjk0iVMh0mp0GRryGTrAXp7
	 RXsczxxGRL9aA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Oder Chiou <oder_chiou@realtek.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Support Opensource <support.opensource@diasemi.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
Subject: Re: [PATCH v2 00/21] ASoC: codecs: Fix resource leaks across card
 bind/unbind
Message-Id: <179016644123.322763.10859857651424691180.b4-ty@b4>
Date: Wed, 23 Sep 2026 14:27:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4140; i=broonie@kernel.org;
 h=from:subject:message-id; bh=csBgz0UvlGk13BjkrknwcaDES1Io3HiNouEVa0NHMo0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtBD7xaK11m4j67QQ2n7B8ZODXSN/OJh66iRGz
 Nk68xSENxuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarQQ+wAKCRAk1otyXVSH
 0D2+B/9sg9JSB9eSoS1RsIuyfhGl4EMtUDE9BGoe4qRFDmmDyidjcw7ahNVQwyZeB/DxjKRFDrC
 DR9maazSONVtLduf3sLvWIjwC1u4rk476dUDMKfcAXc6eH3gmfdSUYOGl8oUsjs+fd3iTF4CFkU
 LYYjSZmzrGoN+Czv7S29rqPxSCN0hsYmOPphjiB29JEdFjRi/GVLq2s8+BcbnP7AuCioTe5NQjJ
 0nBQUdXmYkoVUmXdMzEdGZRcwra7duJFyl4kVD1j8ICAL8C6xJYKkSt9xRfPuyVGzWXvJG1eqFo
 yEwWgtmXsRe44lK5u1+wg7Nn2TpwdkP0evsockjpIXrZ5vtK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 23 Sep 2026 15:12:44 +0900, Chancel Liu wrote:
> ASoC: codecs: Fix resource leaks across card bind/unbind
> 
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> For an ASoC component, component->dev is the underlying bus device
> (I2C / SPI / platform). Its devres lifetime is tied to the physical
> device's probe/remove, not to the ASoC card's bind/unbind.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/21] ASoC: codecs: cpcap: Fix devm resource leaks across card bind/unbind
        https://git.kernel.org/broonie/sound/c/3713c74a1b0a
[02/21] ASoC: codecs: da7218: Fix devm resource leaks across card bind/unbind
        https://git.kernel.org/broonie/sound/c/116f1bd60ae3
[03/21] ASoC: codecs: tlv320aic32x4: Fix clock leak from runtime callbacks
        https://git.kernel.org/broonie/sound/c/ef8caf5d2784
[04/21] ASoC: codecs: twl4030: Acquire board params and hs_extmute GPIO in the platform probe
        https://git.kernel.org/broonie/sound/c/99fff20db8de
[05/21] ASoC: codecs: es8316: Move mclk acquisition to the i2c probe
        https://git.kernel.org/broonie/sound/c/d009170e12ad
[06/21] ASoC: codecs: es8323: Move mclk acquisition to the i2c probe
        https://git.kernel.org/broonie/sound/c/be9bc47e2569
[07/21] ASoC: codecs: es8311: Move mclk acquisition to the i2c probe
        https://git.kernel.org/broonie/sound/c/5cc3c8f7264e
[08/21] ASoC: codecs: es8328: Move clk acquisition to the bus probe
        https://git.kernel.org/broonie/sound/c/10a45015665e
[09/21] ASoC: codecs: rt5640: Move mclk acquisition to the i2c probe
        https://git.kernel.org/broonie/sound/c/e68e66353b8e
[10/21] ASoC: codecs: rt5616: Move mclk acquisition to the i2c probe
        https://git.kernel.org/broonie/sound/c/b5c9df40ca56
[11/21] ASoC: codecs: rt5514: Move clk acquisition to the i2c probe
        https://git.kernel.org/broonie/sound/c/cc2977e80218
[12/21] ASoC: codecs: rt5682s: Move mclk acquisition to the i2c probe
        https://git.kernel.org/broonie/sound/c/c580cd416b68
[13/21] ASoC: codecs: max98090: Move mclk acquisition to the i2c probe
        https://git.kernel.org/broonie/sound/c/bf4379a7195e
[14/21] ASoC: codecs: max98095: Move mclk acquisition to the i2c probe
        https://git.kernel.org/broonie/sound/c/8635b9033d03
[15/21] ASoC: codecs: wm8985: Move regulator acquisition to the bus probe
        https://git.kernel.org/broonie/sound/c/fe15e876d9ee
[16/21] ASoC: codecs: wm8955: Move regulator acquisition to the i2c probe
        https://git.kernel.org/broonie/sound/c/07bcfafa4719
[17/21] ASoC: codecs: es8389: Move regulator and mclk acquisition to the i2c probe
        https://git.kernel.org/broonie/sound/c/5ef6e7ff52db
[18/21] ASoC: codecs: rt5677-spi: Free the DSP context on component remove
        https://git.kernel.org/broonie/sound/c/57d1e55c7b5a
[19/21] ASoC: codecs: rt1011: Free the bq/drc coefficient arrays on component remove
        https://git.kernel.org/broonie/sound/c/48f1dfbfe4e5
[20/21] ASoC: codecs: rt5645: Free the hardware EQ parameters on component remove
        https://git.kernel.org/broonie/sound/c/6e7f4c5b30a3
[21/21] ASoC: codecs: rt5514-spi: Free the DSP context on component remove
        https://git.kernel.org/broonie/sound/c/3943b84e063f

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

