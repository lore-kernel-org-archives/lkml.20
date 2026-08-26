Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F311548820E;
	Wed, 26 Aug 2026 21:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787778290; cv=none; b=LhcXJ6gaBblpn6OBeCb48w+rLgIEww+zgOeOVnNi4ftB8PJWgC9Uang570yC+jN8tGqOHUQyJR8pv8ko+gv3S8vt5NVlwXcz32Z1JgWiO+qEEMLhFrA2Jo9d9qXKMk1n2AvuFK4JZK5K7OHvBg9H9UUoouNubGAudMggjzPAmH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787778290; c=relaxed/simple;
	bh=9t4vVx9ZBNiJQclrP9s1GZ1QV/+y5AhIZeGGyGHDgZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dcegT28YU3q3IFKEjCEFmTwyrMAhq+WumY/4qHPOe5t7fpsC5y4Yt0oAANuIaX61eGUXMI8JAHX9/LB+pC1ZEi/UhjBoLNO/RfYE6q04kzduT9rtGGYfxATClk7W7ZuYXlwpVvsmPVFNueGiL31z4w4DNVWe+qycyktj/wov7L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgKWevp3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgKWevp3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19ED91F000E9;
	Wed, 26 Aug 2026 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787778288;
	bh=GL+vC/suHw0bw4D/kdLOP75TO/aA04X72RhtQeyATQU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jgKWevp3PFU7+hJdBovSWEVRAjvrQtO7K43malOBQQGW9MJBG+HGKVfrQLr4Wcv0P
	 FFHo+WNaqMzUtcdzkhDqKjeC9f+G3BgWUXnd6c9rplEmI6FDhsPLO7c6xNSsGtUiqw
	 tY0aL5yEgvi1GxDpwOCKOedfhE5B7oqlOIMpUqEDnTvo8rLvfBV/3ZEcP+3pfTTWrT
	 efCXhi4IlQ+CMdFyofgoQm4y3x3OGd/s8nTOq7/ZxpvQwsfVaYOnMZA2GqiPKGRzr9
	 m7T7XThy+ptSOQd5b+H4EZ9cIGq/rubSpVN9QFbkn39P8pMnbYONvom9NRL7R/ySaz
	 fpAhgSnWWrEAg==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260825081949.55537-1-phucduc.bui@gmail.com>
References: <20260825081949.55537-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: soc-generic-dmaengine: Fix DMA channel request
 warning
Message-Id: <178775011613.88371.423195330777709210.b4-ty@b4>
Date: Wed, 26 Aug 2026 14:15:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9t4vVx9ZBNiJQclrP9s1GZ1QV/+y5AhIZeGGyGHDgZY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqj1TsLQ9VVx5v27wz1M9LV+wdt0P8BNBSd+6YN
 NGGWTagZEyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCao9U7AAKCRAk1otyXVSH
 0LiIB/wPni6e3GH4Cd0Uuo9LY03mOXAK+zFpMzWI8/jXx+VFq6+B4Vxea/gkLQ6AzA650AukiBL
 FitaFqaWe7FDJv5J1Ea2CiJUH7BxXDSNVY2tAL4aqltB06xqgj7dTjc36lB7JruVx2LIZw6F5tQ
 qVv8Bg8Ll3MSHzVLTQwwluNjX9Yj2mWY9zw+lt0pJvKJYgIkXtCiUgwilta7cFceoq4MMpESoon
 NkpaOYqQJXnWTaCv0wOHAxTojTQFKpV2wZsD7ZLKx1wA1TVssJgFsQCp3EuBjv53A2KBP0w7LDQ
 YTMVb433nZYzoFTu7lmwptXUawhAv7+kaA02yfxhlQjLy522
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 25 Aug 2026 15:19:49 +0700, phucduc.bui@gmail.com wrote:
> ASoC: soc-generic-dmaengine: Fix DMA channel request warning

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: soc-generic-dmaengine: Fix DMA channel request warning
      https://git.kernel.org/broonie/sound/c/84d2d96ac3f1

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

