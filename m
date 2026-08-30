Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECCC493641;
	Tue,  1 Sep 2026 18:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286808; cv=none; b=ui9d9BATRLsHkFTXDDQ2TFqHWhdGywqY4XR4ACFbp7NjYi5f8zn6p42UgRgx4kKS3e+3KsMjmL/Inr3Xx2a3fWjEJ/tUdTRXGrX0EymiRTmIPu/YijNpQlLCJLO+kxDDgbSWC4DPnKAacalI4d+G0+pY3jTp+mEaiEe3bzCDGxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286808; c=relaxed/simple;
	bh=GRxmfZFhoYhv9N3u18s8botWqRJLuiPVT8Wl+5mrUF0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pdypSyGVqB2z+Gx93wLsB7TQkm6aqN/351j1B8xwGyEOgo2gy30/jJLYQmzI9wZTe2ohEOPb5vcQF8qFP/FwXLJsJoWORp69UcR6wnYhO2VubxS5kY4IuQxS5vNZdiOXuqA9cbwgVhs6pPhwlP9FTlUa7EXdwMav1wBxu1NsL3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOfKe1ZK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOfKe1ZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541CB1F000E9;
	Tue,  1 Sep 2026 18:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286807;
	bh=yjuJaT4wUvu61e193Gx8FSbNgh81UlU26f6irVLePAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iOfKe1ZKKTAnwSDcQD+Ws2mXrAfKzil7/i4QtJxvWcIk7fYXzf57oTR79s7eXhZJt
	 G3vTzgqTWvHSiSpIrAta/6TVWB7Oz61HQuj21i8dSRW1NSBrCvDw0y3sJkQbArjEVK
	 WT/xm+4btvwXi+RxSDhzc6ndgVQ0xejDbFBbxVbcje7P8xtZeItuUnGbeu9618g5td
	 b7FzC5G0coe427eOUbnJzWskhyrZ+wp6P9JuWx/gUdGfJQfOASBoMaIIibDJt4z413
	 b9HT1XpPmg2IJLckdlH9R4Uk2q+EC2cuBI3JMJIpEhF98rWkJbUwRNAysTuwNQzEOO
	 ZOcEyfykNxO7Q==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rosen Penev <rosenp@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260817104929.63152-1-phucduc.bui@gmail.com>
References: <20260817104929.63152-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 1/3] ASoC: mediatek: mt2701: Use
 devm_clk_get_optional() for audio_mrgif_pd
Message-Id: <178812923300.13461.6038175593818524679.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:33:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GRxmfZFhoYhv9N3u18s8botWqRJLuiPVT8Wl+5mrUF0=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqzp4kGXGdou/X8Z8TJxZa129b3+xIx7D59msn10T930e
 5F9sOuvTkZjFgZGLgZZMUWWtc8yVqWHS2yd/2j+K5hBrEwgUxi4OAVgIoKe7P89X0lV9HTmHHM1
 s/76yGPidknnJpHAS+WmJzozP5bdLhTi2NNyoL+Iq9NihcDOsrqNV3v4wpjrNtz7oHWJ8dvdvgo
 urnJNV+VAmwXdL6LcG6dGFgY8TNheM2HvRdadIh9s39XYVl/9rZtVPtd0YnWtz9uXB10jesqj+j
 ZeatgrMVuU24y7al0Rk3Wi/5ODQrqCyTp1jcmpGzve2/sfdPg6KePSkxnnmLx+1IU/uGUqIO6w/
 YtR95lk2zjOZl71TeEftqjzNIUaZav0CM2c42JqN3n1XJFfflP7P8UYr3mQtrNO/cJci9I9c/pV
 HW+Ziq9avk/p+N34nzvS7v4ILzPruMyYb1kpEDX/020/AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 17 Aug 2026 17:49:27 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt2701: Use devm_clk_get_optional() for audio_mrgif_pd

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: mediatek: mt2701: Use devm_clk_get_optional() for audio_mrgif_pd
      https://git.kernel.org/broonie/sound/c/e1c41b5395a1
[2/3] ASoC: mediatek: mt2701: Use dev_err_probe() for error handling
      https://git.kernel.org/broonie/sound/c/d468c1c89e7d
[3/3] ASoC: mediatek: mt2701: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/fd97db580cea

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

