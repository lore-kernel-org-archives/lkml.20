Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF435208AF;
	Thu, 15 Oct 2026 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067970; cv=none; b=vA/SYEw0kuJcAG2Dh3Xg/VKQhzqMQdqAM6ewXTE3WtCeCh0febTJOAVbIHDG0QhbNfTqizxkO5TvBmdplSKdTUYBPmdCz7s8tV3NJw3YImvm1YHADsV28O6roiqmKYBqfEvglvhFAdxLQhTbjavfJL735JADjzjvgXYSzHw8/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067970; c=relaxed/simple;
	bh=5g8dz42hCtoNmWFFXwp+ciqPq7zcSQ7NlMrQDwl47bA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q9TUiG8N+UumX4bHikx/v63cvhVXvtJOTsPKgumxcuWrTZW2cT2pwZg430pEBfrmj3avutnvODwv1YtS/CGVBA39n9Mxf43HSK9XX4/XkSyTjaDzRE+OAq/3WBnAAvvR/STQtgt5jnw6nKG0BXnQd7Edad2o8NJPIz46cZD6zn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPhJ8i+i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPhJ8i+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F981F000C5;
	Thu, 15 Oct 2026 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067969;
	bh=NiI9d91GTc1lz7N89GHikpfSzOLogXskpaywwGjpKsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aPhJ8i+iIu3kkozUqD0eQhENZqHbF6bSUAQCY/S65+pP7m8GjQvWoe1Io5USY78sm
	 4y9+HWSZi/natrrF3SkEd9FpLeE961MwYdfZbvKloTuyBkZrLPXTvWfYxbFlUDY2xM
	 rEuk1S4uvP7rSm0dcJWsB15+BAgN1tAeFFau3CPBfdW7pfLx7ogJD2NkP49EIToOxN
	 PQ8jqcjvfHDr+B7802fauFCcu9YYAj6IlCUqNGC5bsC3SOP4FcTCcvp+bmBomITD7B
	 REHJVVwz6xrQr4HDcqLigFQG+QHyH1icFFb8IcmHAaAL6RzupdoCUhpBLAhRTeECIA
	 Rl8AyRExAjEVw==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
 Le Qi <le.qi@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@oss.qualcomm.com, srinivas.kandagatla@oss.qualcomm.com
In-Reply-To: <20261014065321.740850-1-le.qi@oss.qualcomm.com>
References: <20261014065321.740850-1-le.qi@oss.qualcomm.com>
Subject: Re: [PATCH v1] ASoC: codecs: da7213: Get MCLK in I2C probe
Message-Id: <179198622135.228143.12455422842558155128.b4-ty@b4>
Date: Wed, 14 Oct 2026 14:57:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5g8dz42hCtoNmWFFXwp+ciqPq7zcSQ7NlMrQDwl47bA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIunKy7GJX8beX6Ofs3lyfvOdP+6GLZdl2jkJqT+16vF
 bgxa5+eUUcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAm8nwKw3/XlXGfpkn8X8T9
 KGsV+2EWkzUTTrDs8JZb/Wzr4ce/uH69YGSYWxChcmblbtM69kkHDmpuEmJ5NvXkYbuidvmzL/a
 UeiWxAQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 14 Oct 2026 14:53:21 +0800, Le Qi wrote:
> ASoC: codecs: da7213: Get MCLK in I2C probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: da7213: Get MCLK in I2C probe
      https://git.kernel.org/broonie/sound/c/2923259d08b0

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

