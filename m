Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1ED5208C5;
	Thu, 15 Oct 2026 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067974; cv=none; b=sWxOZhk5L42d/3SP8VTzuqLeZUMWanAPJmLNffRM2QnPcR9L879vOzRaF2HJAY7pRSQKash4vY44lDPB47RQBhcIsuZmuqRojGVvt5IsoZykmlbVWMPIB4KvNcYbZrXZHUEibHtKQ4ffv3zePdhWutEkVcrbi3FAv9u/OAHZEaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067974; c=relaxed/simple;
	bh=B4rXNvWd3M3ynjiyep8bvj6S4M4B8RKyc83rLmHug/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O15FBU/uIzC6G8MyCImxmP+lGK41psQeQyh9rA0a37GQBfOfVafJ1Qzie9b4ede/nODMDE7rzP6h6NCcI9fNOsmdLtsQO5baFxUl+/texAwJ8oSngfuSiq1EyDwADifwaf0vfCWVE63AzVwBkyqYaHqigh6PPDY1d9i5+MkG8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dg/IQS70; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dg/IQS70"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDFC1F000C4;
	Thu, 15 Oct 2026 12:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067973;
	bh=sYehW8TQA3YYUsWa9+9y37k78FJr5VDzhEgHJOv21M0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dg/IQS70bmXuO8yxHYr0sIOQkiwMQuGEiZnZ+twr3dwOcsR7TrTCe0g3OTvSqrzGw
	 cNT8FwDWwYRjF3+e6dYD4DxljYbzKiKC5jzDm/SfO8UYpYAX4kWivHT+Tv7DI5jsYc
	 pD/3W2/HUJDAPcfnDBFd95MP3qspgJcpPfcT+VocEtJIheJXEZ9f52BLYAHPIMxj02
	 ujJShG/NqTxFmO+8622x4M27liKqsu1LMfa+UIsr4vWRv2Yp6bfK1UqSAELCtFOiyJ
	 QKRRveyuiV8QQ6TdRlqKSRDCgus852tmXUO8LJm0yzMwPUIpSj5R4Xnf5ij07DwWim
	 s3bruCdx4NwzQ==
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: lgirdwood@gmail.com, ckeepax@opensource.cirrus.com, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Subject: Re: [PATCH 00/13] ASoC: codecs: Fix Wolfson control definitions
 that write another control's bits
Message-Id: <179198444223.228143.13293082026636478453.b4-ty@b4>
Date: Wed, 14 Oct 2026 14:27:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=B4rXNvWd3M3ynjiyep8bvj6S4M4B8RKyc83rLmHug/c=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIunGyKs4yp/VT/QWhy92JrLvXY2yzel84q/F/RWuso0
 dF40byzo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABNZqMDIsIT3bXDY/ikudX9e
 /V5c4yBWtVFl0fLmA0vTWiKfxpX8k2P4pzV/C2fMEtMz698/sJb38z3ed+pq5JdExhOqsnLTi+6
 WMgAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 14 Oct 2026 15:32:27 +0900, HyeongJun An wrote:
> ASoC: codecs: Fix Wolfson control definitions that write another control's bits
> 
> These are more fixes found by the overlap scan from the first series
> [1]. In each driver a control writes bits that belong to another
> control, or writes the left channel bits for a right channel control.
> 
> [1] https://lore.kernel.org/all/20261008130953.2446692-1-sammiee5311@gmail.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/13] ASoC: codecs: wm8990: Fix definition of right input PGA controls
        https://git.kernel.org/broonie/sound/c/5bd6d05197af
[02/13] ASoC: codecs: wm8990: Fix definition of LOMIX AINLMUX Bypass Volume control
        https://git.kernel.org/broonie/sound/c/75e0b607e345
[03/13] ASoC: codecs: wm8991: Fix definition of right input PGA controls
        https://git.kernel.org/broonie/sound/c/2dfecdc25d49
[04/13] ASoC: codecs: wm8991: Fix definition of LOMIX AINLMUX Bypass Volume control
        https://git.kernel.org/broonie/sound/c/fee722db39c2
[05/13] ASoC: codecs: wm8983: Fix definition of ADC 128x Oversampling control
        https://git.kernel.org/broonie/sound/c/c1af9e2272f0
[06/13] ASoC: codecs: wm8985: Fix definition of ADC 128x Oversampling control
        https://git.kernel.org/broonie/sound/c/a747ec6e12cf
[07/13] ASoC: codecs: wm8994: Fix definition of WM8958 noise gate hold time controls
        https://git.kernel.org/broonie/sound/c/291d81d628f3
[08/13] ASoC: codecs: wm8955: Fix definition of Treble Cutoff control
        https://git.kernel.org/broonie/sound/c/71911bf5bb3f
[09/13] ASoC: codecs: wm_hubs: Fix definition of MIXINR to MIXOUTR volume control
        https://git.kernel.org/broonie/sound/c/22bfcedd3feb
[10/13] ASoC: codecs: wm8737: Fix definition of zero cross switches
        https://git.kernel.org/broonie/sound/c/121963197200
[11/13] ASoC: codecs: wm5100: Fix definition of EQ3 Band 1 Volume control
        https://git.kernel.org/broonie/sound/c/96d30816a9a4
[12/13] ASoC: codecs: wm8750: Fix definition of ALC Capture NG Type control
        https://git.kernel.org/broonie/sound/c/8c299077c787
[13/13] ASoC: codecs: wm8510: Fix definition of ADC Inversion Switch control
        https://git.kernel.org/broonie/sound/c/22d50113078d

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

