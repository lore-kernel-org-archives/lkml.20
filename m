Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1492F36A01A;
	Fri, 25 Sep 2026 22:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373804; cv=none; b=tBTPQx/YDNKia6Du9K0+efAv0j2FREfaecV8q9m4Hqin/j4vTsv2lKYdrZQGBn2qfXD8ZjVRodRdd7tcmjgb0A6c30QyozAAPvVco0my6BIr0ApsAkycw1pZxOT2PjaH1h96s0BIDe0A3oxKLP/zTUV9WrUo3ScQgjdVj90enqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373804; c=relaxed/simple;
	bh=1STb2I6uOMYbLA23SF2cJPxli3BlqZ5BLB/N2hVX9uY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Sl6IJOFo3zpsM+57MRHcgLl6Ld5jHOfCnkBPu60SoQWu6U/qSqmqfMwCm8VMC08OV2Z91Nxg8o/1NvPx3vK+OumR8VUEA3O1CangzVK4Qn6rGsJdF3ZAnTVgOn1Fs1z9pqYR3AmzgpalfQ9RTX5HHPfolL1KvZmUaKEAD4KX7SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUvOckdx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUvOckdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1F51F000FF;
	Fri, 25 Sep 2026 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790373802;
	bh=JhT7RRiorAEvqIxi2NFea7yWCgMcbVY4FpqIxZK3PtE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZUvOckdxiOcldP8Y7TLsUS4ywfbYq4Ijjecu79bk0752GH6Sg3t/+aQzGlFN42Lka
	 gJ731UvY24MQV8DSWDb6Jw3Q2c1iYBk0wsRNUUAaXhiWxT7HtMP6VNgbhr4R/OmwUH
	 aPe84aaAplzXaZkXqHiliqdce77HlpvDYAlw0fvhT4p9c6nwE+WEdM8OSMWzqM99LP
	 SJbGzRmiaZoFusZA2p8J9u6E87YNB0WidoU0yCXtpzRR0P8bMwdCdwGt4rSF7jPvRL
	 J9al3TzRaPtP6Zyde5ecwJuSjLRImUm07bDc8Jg4qyaFKySe4iDLXCWSu09in5hWvr
	 gy1sGYY7nYyWw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20260925165919.5407-1-ansuelsmth@gmail.com>
References: <20260925165919.5407-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] ASoC: airoha: Fix sparse warning for AN7581 AFE PCM
Message-Id: <179035774627.204944.11119676121161416824.b4-ty@b4>
Date: Fri, 25 Sep 2026 18:35:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1STb2I6uOMYbLA23SF2cJPxli3BlqZ5BLB/N2hVX9uY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtu+lNkMGdG0kvojTWyemgHhcmJdazKAyvhUOC
 YTDhNBb9tmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarbvpQAKCRAk1otyXVSH
 0FHcB/92pEnXmYv1k9Q9C82R6lOvgrpJ3wfBG+HkoECwxidD4NUEo9QxUCnZsS63DS3EFisQquJ
 XOSgFZPcfK6aIIVNnFSALY8A/CxeqYk785rKcflYKM6nJTz+DCW0QwyeF2dByakq2WWc0uQ9f3i
 sik/Vs0sFHFcmnjIEHeYY76bq0tTNEJbUkWzqFJVB87IHpbE0ua8i1jiU0tHFyT10tvZui4KO8E
 DVXdNqrCJbIcLQCwjb6LXw3zq/qNL6coDftJP3vb67w0zPCMVdYWaLtzuxiFsMwjB3aMlaMzR5X
 IYPLpcjxQqbMqhaIITvbW72MKfkkBzHJv8jAoPhx5boe38SX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 25 Sep 2026 18:59:17 +0200, Christian Marangi wrote:
> ASoC: airoha: Fix sparse warning for AN7581 AFE PCM

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: airoha: Fix sparse warning for AN7581 AFE PCM
      https://git.kernel.org/broonie/sound/c/cc466c77059e

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

