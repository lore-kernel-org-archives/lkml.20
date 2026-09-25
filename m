Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5C84D9F75;
	Fri, 25 Sep 2026 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360622; cv=none; b=K77/asWSjcdDOvGIux3xbl50xlMk+OyOftipp7UxtzdsQ8MUgpV1NLFUG2/utePIMTZxn61zg16k4rAcZNMvSweZ4WN4P4HgLBs+XVKpZ7lQsciaeJ5ISvFbUdeXzU3ihFbqvWFMQD6CBCH/OG6YiOl41HaV1u+K/k8IcFnxO0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360622; c=relaxed/simple;
	bh=h1WnzZmi3pyewV9/vCrQ0MdXk6vxiZtPSBs0IU8k0EM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ay1eK+gPp9jEaymdpY2qLuzxy+WocAzzVemeI/GkrG5j2lKLOhUIEeKZ/zxV8jN/iDamrAMUyffs5WxyBE1UBYPcEiJQ23KBWVpawz8MbrJdmaQkYuoks3ZlDiKJJ1Hve7aCRhSRlQ+eaJBivSt9QTCK1JUJzQVMzcuDLLRPD6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mA37eq20; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mA37eq20"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D471F000FF;
	Fri, 25 Sep 2026 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790360621;
	bh=YXD/bcemTBzmK3LtpaIyAjbwDuPz3nvXg3CfboN6GTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mA37eq20O1YEAWpJjBKxtTbXtkkBgoE50aP2A7xAjpu91C4KOyM1M1JBylcPUnKx5
	 D+eVBUF8lbR2+gzSgKo0eDOoL04OpJo5IbV+25xBrnuV8rrWg0O1142R4l9JzfcWnc
	 Tu2iQDPrnXMXjHHPma0v1l+74kudxCo2EIWgFLeAgyB96g08YMmKkVp3tPOG7Fix9t
	 9DzrcjPPc6j7bBtBaj3ItZr2ki2w8NkjetA8MqvXntUtWFRB4HvIN6ZIpkdG8/jps8
	 pYKeNO07vEf/ia9AU7HRHwnu4ot0ng1p45icNpd1vAEPNmkJp5cRgVqzHbVv0lJMpM
	 5w8zisdxczKCQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
Subject: Re: (subset) [PATCH v4 0/8] Speakers for Pixel 3 / 3 XL
Message-Id: <179033512686.204944.16990313455275309471.b4-ty@b4>
Date: Fri, 25 Sep 2026 12:18:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=h1WnzZmi3pyewV9/vCrQ0MdXk6vxiZtPSBs0IU8k0EM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtrwmZJjTUy9mi4xOWCYdUDcLFZ0FI7ejsKp1d
 XYSpKhfHomJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCara8JgAKCRAk1otyXVSH
 0EJXCACHAXZzQJLSmm2F8tvsa9eZCAbaljZmp6TzvJQYT84xmk5ldGmiVssXgmZF0bkU/SlWArG
 TKl3kdVHID43faOm04jIZVT17+2Ii7iE71xRC/1KnmeFwhNcJLUObD9oj3Ot/2zcCQLeGM7T++c
 Xql7S5zUnX+piEmUgnpqlav/Zlc//xuJd0pOiPluLkUpER4FCgRrpzHTI4XybLb1KckELoPY32+
 u96ViCIbhTcqg1jo1MWm1dY6S0YMwmIDb7gaag9nAfgXUNf5bQM726v45xB4bvioi3LlG89PZSM
 EgXbRZwkYq8rf3JdG9vZ2kKqDmE8QP20SCiuA+Xlzo1t3ff+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 24 Sep 2026 15:24:05 +0200, David Heidelberg wrote:
> Speakers for Pixel 3 / 3 XL
> 
> This series address:
> 
> 0. demistify the hex to BIT() macro and add left/right rx spk
> 1. most likely wrongly set DSP_B in sdm845.c
>    my guess this is because TDM was never used in the mainline with
>    sdm845
> 2. applying correct mask to left/right speaker for the TDM in sdm845.c,
>    so both speakers can work simultaneusly
> 3. setting sysclk at startups, which some codecs need (such as cs35l36)
> 4. setting proper tdm slot in the cs35l36 driver
> 5. device-tree wiring for Pixel 3 / 3 XL
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/8] ASoC: qcom: sdm845: Demystify TDM masks a bit
      https://git.kernel.org/broonie/sound/c/090991b292c6
[2/8] ASoC: qcom: sdm845: use DSP_A format for TDM codec DAIs
      https://git.kernel.org/broonie/sound/c/ed41c80271e6
[3/8] ASoC: qcom: sdm845: Use per-speaker RX masks for TDM slot assignment
      https://git.kernel.org/broonie/sound/c/84c3a8e05ce8
[4/8] ASoC: qcom: sdm845: Set codec dai and component sysclk during startup
      https://git.kernel.org/broonie/sound/c/5e9f324509a7
[5/8] ASoC: cs35l36: Implement set_tdm_slot to program RX and TX slots
      https://git.kernel.org/broonie/sound/c/f390794e6354

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

