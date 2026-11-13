Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743018;
	b=p8cyG1gzfB7h6ouRcYOyvafmaYqAKgIc7bYXIbwvO1qMeGSekoXzbbE77nBj/JEHaBxJ
	 92r735ix+eJFElxI6uYuDwezSEv0fHyl6hKFqB7WivrLIDWVFrGzeSHiIiv1jHmtSaBoU
	 kp/KpXQEBPRHQ/aup33igsEMLjTGpLkgViI21GwBCts0Ej7TmvGokV0pYkxJQL3GI6GEY
	 5tJniJx6Rnt+FpXMqTYvmRpyoWVKcpjfJdkol6gj/aBtTTfg9lKGAtGAZFvwx+nASbq20
	 tDv5BFzmnD0+n0+LnPDba+AeiPtHSZo3f02eEiIj8HAjJy7AfBxNtyPzOhdZXdgwH5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743018;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=IDJZnOK3vJIvUBVAsm4+nAHt9LxvFnq9d2VS6waLUKw=;
	b=IJyOmgBv5W0drtouBUzT/DXb/mFagi/NY9QI0C9KJ/dJ1WPh91IcrBJEBycf7p5HRyJB
	 WMp8U/JyCwUDXRFCdXeaTkIf0eDgvV2dJnBwxRj9liCwqMhkVaqN4MR73bVdqZKG1vis/
	 teAEXXkA7j6dFFd+j8u+SDdRAjfKEZDyD8L6hC2BT/CdKJiEPo0LO14rKdP6xGK9SqySd
	 tL5Bs5d4UiWomp70nageIQXxbLBP47l+47rDCargRTHLuu8j0Q6FgOHgFuXjuSglm5Dr1
	 dYLWsznnVmCYPKF/zeAgcztkrMS2NA8L2WCb0RmpNclHwicu3uN7XDzecgmsslgWvoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4zRGnXs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDF3606A323;
	Sun, 15 Nov 2026 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4zRGnXs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3ECA1F000C5;
	Sun, 15 Nov 2026 11:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794743017;
	bh=IDJZnOK3vJIvUBVAsm4+nAHt9LxvFnq9d2VS6waLUKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n4zRGnXsD5P0kob+1C3053DbdoCZM0vPyIV4LS3m2rJvYB0AqVLtBmeRvxS9/5I3H
	 tOqpiQTKhLtZRceh71kPrhdpAyFLM0vX9rMVzT71VeHayLWPiOHPTwXrfbYQ7uKj2Q
	 HVACaybOZdQkuqbdnLyXcG7MvzOf2JBwnnNDFJJC7DJ6aJo2WLp4cpNPpyop9Tav/r
	 02MWs3W5Fa2lLkKun66UWBVR4S4N2ErkNX958qoC9zKSw1ItbTerchlMElYP1Uazlw
	 VU4sjwgxyn8LVGP4ztLGMkJZHrchNXmguq/ldy0vw2EGY1X/P4Ds522oxoBBmT6ZUj
	 HchRXLDSCTvrg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 04EA03366BF3;
	Sun, 15 Nov 2026 11:43:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 kai.vehmanen@linux.intel.com, Jude Gyimah <jude.gyimah87@gmail.com>
Cc: pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104135142.3723042-1-jude.gyimah87@gmail.com>
References: <20261104135142.3723042-1-jude.gyimah87@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: kmb_platform: select BITREVERSE
Message-Id: <179460491917.448985.14839714163958999777.b4-ty@b4>
Date: Fri, 13 Nov 2026 21:21:59 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8sAnkIpgW/EySCqNp8v5gaRusRx3+qfgeXz9uO2jDJ4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+znp+8GZh1pWO/1UT5zv2W6y9056xMmz26eW3j9WUy
 dQxlf7n6ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEdoUwMrzsy3+4fVOxiGl4
 47R2B/b4bbGdMcfe1WnuOHA27s+L08EM/ytDHz26mHLjJ6NC6L/D5682f++PlZT/cEqs5eN8lmp
 +aQ4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 14:51:42 +0100, Jude Gyimah wrote:
> ASoC: Intel: kmb_platform: select BITREVERSE

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: Intel: kmb_platform: select BITREVERSE
      https://git.kernel.org/broonie/sound/c/098ca46ed476

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

