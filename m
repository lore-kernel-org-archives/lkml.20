Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0530408630;
	Mon, 31 Aug 2026 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180864; cv=none; b=QyjEWApg/KUV9SXt2vLvMZFeMuWLZwzyojng4wgP52JoqxNcf7EERnkgFP4NRXRr6GPZw3zKWs9H41VvbLbYI3bfmvWf1hMXcGrjsK8TZSMhNhDzBKZK5eFm1tK2B4aYR45Pr+OR+k/thhQfRxNgAmr2WPMOVZIUORqpooZ45kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180864; c=relaxed/simple;
	bh=EJiijE/QLvINb55S7hWRn3eYCJuC1bmVWHCSb3Vzhuk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MbZXmnjLvlnNAVc6aZgzHPFvPU9UKqjhbabNy51RTswPWYmBnlDlR2koa9I5pLlqcPq53CDBcixbxOsmmeg1aJSPJzKT+bUkKroT2Rr7ZfwKiIgjka0jbUJFQCxmUgpieie1Vy0zo3mYisZZsUHqDvnAdcPWoIzQFeq9AS1ACrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDlZ6Gga; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDlZ6Gga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595AF1F000E9;
	Mon, 31 Aug 2026 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788180863;
	bh=sXVIxmI+yONoCOEcZqA9QvZx1zGiVeqFf9Xs83sD8gY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eDlZ6Ggapd15gH4t7YrCdjAZ0k1rjeBgle5BZ8bc6qGF80/4qDtRGyYvAEc6S/VvO
	 wNgfLHTUMbypoN5mv433xu/ttbZ0WegtoRwsYgzG2JQmyPQ3wnh3eqpxtSrDk6xDw+
	 76zETU5Q/fBuecqpqDKI+DeorFMw8HxJBQiemlrGt8ohdPDEcqWt9kVyY420XC7aAj
	 IeYVHfNg27KeQep4bGh336PEcgWKJkF5V516rl7Y6kE8i3jS0XLTHXX03YQqupro4D
	 6sMryKcHrWmbssMk30qBNC91ouZUfUg7JWm/tXqUUDe57DGPjd3WsVqrfmM/Sspmau
	 mK3OmV1VJj7Bw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Andrey Golovko <andrey.golovko@gmail.com>
Cc: Antoine Monnet <antoine@montane.tech>, 
 Robin Everaars <robineveraars@pm.me>, Ville Saarinen <wiza@saarinenkoti.fi>, 
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260815113000.4488-1-andrey.golovko@gmail.com>
References: <20260815113000.4488-1-andrey.golovko@gmail.com>
Subject: Re: [PATCH] ASoC: tas2783-sdw: split a stereo stream across the
 two mono amps
Message-Id: <178812954473.13461.2430772288024082364.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:39:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Sat, 15 Aug 2026 14:50:00 +0300, Andrey Golovko wrote:
> ASoC: tas2783-sdw: split a stereo stream across the two mono amps

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: tas2783-sdw: split a stereo stream across the two mono amps
      https://git.kernel.org/broonie/sound/c/173cb3147ba2

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

