Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65943F4DDB;
	Sun, 18 Oct 2026 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345456; cv=none; b=UdBay+TlS7QKTVLeZQWTh5UsxVx1ddYGjvvRr1akQTmAmQLbpdACY10rIoUSne6I/5b+Lb48xsbTmA/ue+dhhXz+9ocA+7UEqx5bVrGF1B134JMaV0/RHabAdlvcJl3Ge1npvGasI/Kwt8NJQki+z3XtYGk/EONAZaowbFj/LG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345456; c=relaxed/simple;
	bh=HTgBam/57cwFDyFC9raY1HwslZ/Y36gSS6pch6RineI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KYI5PlrGwXDFkkcot+uEYWps3qeq6Mus5nTVEHiSusKGrbAPSdfB8OoKv+CcN8S52mO1lMW2unnahA822g6kQQN0VGQfDAY7mvvpwMCCmj8U6HYaNQD7RMkRX23DNVIAX58svRW8EOYwHySZIgw6DBmhWafRsVxZH5e+nIbF9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIA+fjgY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIA+fjgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575CF1F000C4;
	Sun, 18 Oct 2026 17:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792345454;
	bh=4gfnIScozc18XM8zitveza+3VRuR3POnpsiN1zhL9F4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SIA+fjgYvDk1MgBwz9nOjF9y0h174BUSLCt3E85aH9M9nEAFM3MMZH0Q+i3p88RKD
	 SR1TzNlX7G8S/kSKs6zngO1dBrmeM6odtVFjyxk2lopGmdtOtAHBkz8AFZqMiE/14M
	 VpA0A1u1kWAlkLuJh+dqb3iT2CS9P86A9bA6KgLJBpwGfU4ha4Lcy+d8FHSTw8Vn/y
	 VOoOHTa5HnMvJhd4Z9V4oknHUWuFaSx2gzcuKSRihXeIlpbcqHkod3W0mIqQ4BJ8SW
	 UJXJzHf7MZW5xbelE93ORwVzUpK6lK1pO5O/5hGrDZUJSTF1COM5jORXQDGis575F/
	 NtmDWiVZ3Coig==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/7] ASoC: qcom: Add Nord audio support
Message-Id: <179218547477.3162228.13366578492097805160.b4-ty@b4>
Date: Fri, 16 Oct 2026 22:17:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2091; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HTgBam/57cwFDyFC9raY1HwslZ/Y36gSS6pch6RineI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKusrq/E0qTYX7oyeK+3+pa4NIL784mhohEVAiov8iZr
 uHy4FFiRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACYi3crIcEFygWPVaUfXl7bc
 kr63m+W7Ws+5pHCsXXK2d6tmndmBpwz/nWY+WXJNx+qIyGYHTqdFyc9fHmdVFTLaf/WBZ8tFvth
 L/AA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 09 Oct 2026 18:42:46 +0530, Mohammad Rafi Shaik wrote:
> ASoC: qcom: Add Nord audio support
> 
> This series adds audio support for the Qualcomm Nord Ride and
> RRD boards and includes the required machine driver, device tree
> binding updates, and codec improvements needed for the board's
> external audio codec configuration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/7] ASoC: dt-bindings: ti,pcm1681: Document the optional SCK clock
      https://git.kernel.org/broonie/sound/c/8855a9319c18
[2/7] ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support
      https://git.kernel.org/broonie/sound/c/8987e9a24f45
[3/7] ASoC: codec: pcm1681: Add TDM support
      https://git.kernel.org/broonie/sound/c/a93f77e4187f
[4/7] ASoC: dt-bindings: ti,pcm1681: Document the PCM1681 supplies
      https://git.kernel.org/broonie/sound/c/f5f5bfcecf65
[5/7] ASoC: codec: pcm1681: Enable the PCM1681 supplies
      https://git.kernel.org/broonie/sound/c/3b953d0e72a1
[6/7] ASoC: dt-bindings: qcom,sm8250: Add Nord sound card
      https://git.kernel.org/broonie/sound/c/22a72cf1d60c
[7/7] ASoC: qcom: sc8280xp: Add Nord sound card support
      https://git.kernel.org/broonie/sound/c/6e539c02b04b

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

