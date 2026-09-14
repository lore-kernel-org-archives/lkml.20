Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA343A544A;
	Mon, 14 Sep 2026 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412506; cv=none; b=EcL2ufMHzsgMHvsdbXSMIn5gerN5YSWkBz/3HEoxZH+/1QRVCHIcs/ziLGNVkS5LQCir2UN2Nsw6owXmUI5x0D6E2tmaM73ClFPdBHyIS9c1TZhCQqeNGd+J6yce881ZPIPAs3kgGB6l7BiFgzhS9PWhsfK78HMCdqo7M9JqL3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412506; c=relaxed/simple;
	bh=jyNZrgxGAo8ZLRaNzEUWjq0aydYvMthqN/9L5sNtamI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qoJmf+S2yYSERdhcY7KEZQrNkhYwr/4uCWOYo8tjrE7kA+cGNXXR04/V2tyNsjW41OgX3W3sGsokm7auYiRkgcvY9k7gj6e/jvPL5s1QUAAbK86gSiYW+HyZIv4UcKXa4TLxVDGC/PsvOHCU222KN4D7odfOucAu/VX0DjUi09A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiIJg7a3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KiIJg7a3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E081F000FF;
	Mon, 14 Sep 2026 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789412498;
	bh=JVoxI06euGdLlFHQ0i+g2EJYJIklebnpnx7rzZa0b28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KiIJg7a3E5L0U+l5WKDOGrQSRDP9PF1W4sL07WJHfW4xFU29ib3P3COx40FOqvM2r
	 VKX96P2HaC5aQ8sprbn5YgpZxB/CUxhoe34XybgnhHWMyn9nGL9C4V6I4ixkDMZhVy
	 GihHFm6ISvudK0x85kQO31z34i9ujf+fD4bZGXjqZukCjiJSttSU6nSgSUrPmFm72z
	 reCxzi+Sus78Ce6i0iwsEBOzgd5wCapgpsq8a9PpmrY1fcORCYHMP5DAA7AKHA+82O
	 af1/xBxzLXyYQf/0JhEY+P8RbVRBP6PgFADFA5Pn3NrdmDG5K060jaQJOoI5OAwZgN
	 VyrgwOxYv6KNg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
References: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
Subject: Re: [PATCH 0/6] ASoC: codecs: Fix resource leaks on card re-bind
Message-Id: <178939428864.1239410.292115422550832572.b4-ty@b4>
Date: Mon, 14 Sep 2026 14:58:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2313; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jyNZrgxGAo8ZLRaNzEUWjq0aydYvMthqN/9L5sNtamI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqER+RPpvNvm46vN8fwqas6pVNF0ImqQStQOK9
 D1xSw6yrg2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqhEfgAKCRAk1otyXVSH
 0NAmB/9rZiMFZbG4lXPvRwTEhcDOWi7Pzuzz/D+yI4m83OzpueB/qVrdrCWhaH6/n0SJ6fdu/2w
 vjxMLDTaJr/BoNz+/RM9sii3rW6/PMRP30j/pTjgFkfwmDJIdqMN/Kl2XqGObWWS7afeyzPiGK8
 eiT3iGNKnTznKztApn4Yhnbrpwy5s2jBvs8Nv4wArKZufRbznblQYIjpbOgIqwUSgNPYfyXnhK6
 Z2dd1y48AjQnmMzlE6qMHUR4OZ1Jp+uW2+vWUFLctSdatCqUS28zmmCaWr4XLbcFyfHOsajt7s4
 8EgHkzRa4umQWlD2ge9pgWGz7OvE44RRh976Stt1kN5pOQcD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 13 Sep 2026 19:15:25 +0900, Chancel Liu wrote:
> ASoC: codecs: Fix resource leaks on card re-bind
> 
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> Several ASoC codec drivers set up per-device resources from their ASoC
> component probe, but the associated cleanup is tied to the underlying bus
> (I2C/SPI) device rather than being balanced per component probe. This is
> fine for a plain probe/remove, but it breaks when the sound card is
> unregistered and re-registered while the bus device stays bound (a card
> re-bind): the component probe runs again while the previous bus-level
> resources are still live.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/6] ASoC: wm8962: Fix regulator notifier and beep leaks on card re-bind
      https://git.kernel.org/broonie/sound/c/b9e5343ba72a
[2/6] ASoC: wm8995: Register regulator notifiers from the bus probe
      https://git.kernel.org/broonie/sound/c/644914663c9f
[3/6] ASoC: tlv320aic31xx: Register regulator notifier from the I2C probe
      https://git.kernel.org/broonie/sound/c/10e2ccaae497
[4/6] ASoC: tlv320aic3x: Register regulator notifier from the bus probe
      https://git.kernel.org/broonie/sound/c/3efb5b99f642
[5/6] ASoC: cs42l52: Fix beep input device leak on card re-bind
      https://git.kernel.org/broonie/sound/c/115a5655bcbb
[6/6] ASoC: cs42l56: Fix beep input device leak on card re-bind
      https://git.kernel.org/broonie/sound/c/c5907dcc13ad

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

