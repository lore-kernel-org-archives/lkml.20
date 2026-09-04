Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35C648F837;
	Sat,  5 Sep 2026 11:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788609583; cv=none; b=iftbmIZtaeorhGI2TUPjQQj8dL0rxybvxqw3oQQ4yD3Ovcjf2ZQwyLtkDAVSTlZlMpE+IIsUA9M0eP+boF1SkcPnLL1mPpy9WKOrnLxpSkxTTmmK+Z+lnUxXl6v3IRN86JhBfU+lcfDkXEab9XuC69+M14/FMUZ/9rxQiAUXmXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788609583; c=relaxed/simple;
	bh=5FPFKypYJycFQ/ivuMen8M4ZOukO8rl/mxTx9SWUhLw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hxUVMp5L273MUIJO1a21cJPdvbRp7Uwdxyd1K1EJOO3H3+eVk9crUrnFj+4+7zf/Nq4+h7tmfr5QRM6ENffGKYLFMXt58vO7M6JpeBcsmuqLcEIWoarCgMsC/8Dk3w0PMI6wfcKVuPdnpz6Ky32AjXXG3AoYfMbdM0iFPIfsoRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrpQuiV8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrpQuiV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A951F00A3D;
	Sat,  5 Sep 2026 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788609582;
	bh=KkZ39QsW/0EzCqj9yO6HnwxedHQb5Ao6cxewVUgXA7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WrpQuiV8xBZajSr1bgSCQvB9gcxpfi3Nb1tKF7zJHUbsN1kV391i+T34SV7tWKRED
	 mOOWLw2ZvLUOFrcn2xAEren/1DAvIJcS7VHSqVLFLkoS5xbKbAQ5aQhENjKo16Tyj4
	 5eVoclRoUDpgsJjIyiIiIPEX2ivKKgwjSyRxQZGGkkffXCVEHlrICwERoxOjMDWLk+
	 1ZDaowq2oP2NCBLbu3YN5abYobutKy5UcAWbraSxZ6ukq8ShzTQYdVSE2HV9MxNTyp
	 qMwAHo2VNUynzFyYNT+3Tqbfy6JoE8x29rl+Rtffi+bWYn6HmMRmk/NIetTZe5OjwR
	 8wtENKcKLKI+w==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260828-sound-for-next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com>
References: <20260828-sound-for-next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com>
Subject: Re: [PATCH v5 0/2] Introduces MDSYNC support for CS35L45
Message-Id: <178855981196.692981.7813898466866850313.b4-ty@b4>
Date: Fri, 04 Sep 2026 23:10:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5FPFKypYJycFQ/ivuMen8M4ZOukO8rl/mxTx9SWUhLw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqnAQoVEYqoussgggg71EZhUeeq5boxBcvsXuPE
 sgmVsqVowuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapwEKAAKCRAk1otyXVSH
 0JaqB/wLGesPwg1VdpcreTqRMCOF5Q1agcfSsrgKaD3gjwbLnBQy5zlx0v1dcDL9i2WOdB19zxf
 iCYB7WTbXx+zl0k6bmbdQVXVXycBfADCe+eUJcWlmn+KN+fBR0Fnm1kAz3wOm4fdJaAleL1RrdS
 ucl0ndhKjqYl+TNUDT8T/xBGZ89pDEU3x9hhsSIRj46DGbneM+Z/VUmEmgkXNqjcqw8Q+Cqdxey
 0yrPKt47YwA/JDj/YEb8q7eA8WhGMr98pNepEsn4jXMSG0AK3rl+IGJpdHdyNfSvtS6QbZRZgzP
 EpyLi8H/Hltysdo8FKb4yKLuh+a0TSJJwCLCBK9ESdf6tvAa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 28 Aug 2026 10:46:25 -0500, Ricardo Rivera-Matos wrote:
> Introduces MDSYNC support for CS35L45
> 
> The CS35L45 has SYNC pin that can be used as a multi
> device synchronization (MDSYNC) bus. This pin can send
> various message types between Cirrus devices.
> 
> This patch series adds support for long and short DSP
> messages between CS35L45 devices.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
      https://git.kernel.org/broonie/sound/c/8351ccada421
[2/2] ASoC: cs35l45: Adds support for SYNC bus
      https://git.kernel.org/broonie/sound/c/f3c8f89a1502

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

