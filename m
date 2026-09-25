Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376012BE03C;
	Sat, 26 Sep 2026 00:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383466; cv=none; b=a9crfspn/z+cCqZCx2DfmmOAQ80BvgMjcMpsIFX5IOQ+UNr7qBvFNGIZNw+VnwLZSlUs5whgZlvuIxbTzjDQaohfYb6Ajw8Y0W9ghdaQeMTPbNhws/6gXJL8sfyhPsnYeVa0FsjKuEbO34uEA/dlCrRAMLX+hjzUtoEMzinFclQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383466; c=relaxed/simple;
	bh=zHn9Wd5dXBE3nMcDyRT9QjEvDPp6MzaqBwfw1wrwnWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZMUQNK3n0Mi0uJlPC1WqJpWcuDAHFkL27HR4yFNqutMqThYixTfomVA86ce78XafhsUpxM9rJZHxTGiUeC0UBUcj/djleLS3ErAnkwXR51rob5V5TbwDAHMdRtJsUXxgJC8M4eEqaKuKD0Dz2Wj1FLGfXninZxtJ2ktHkYhYTuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2jLiGxQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2jLiGxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C54E1F000FF;
	Sat, 26 Sep 2026 00:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790383465;
	bh=FOW/f0vLZ/xNkoxPVILRRd8uSSPeaPrBn6SQPYmni1k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=K2jLiGxQ/LyelOKter12RIMlMTBfiFBlYCQaEnFPfQpGDSUmNA6d7CK87S03lEDTL
	 ayyBAkUO1aWfXqMbwQpLlt1M1yyJowFloZr1ISZWKGpz8DgNXCvHElRueKde6bdmMG
	 KC2QnW3Gb8TIGF5xibJgIfXjl9wQgbFAOQNCW38Pz8DDZXc1QIX/QqrurxLPYH+LcO
	 SJoAH7V1mqYeRO8puayUzzMvHpi0OUVIheu2LDNsr9VZbPJK1hdBkeBeK1T5ZJnbC4
	 1HixZzsdn1sn33RFTe51zAEiJYsh1lmq6QjGxlygpqoW1/EXZkfiAmf6gTQZgWKCBP
	 s/N8lvp3SGa3w==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20260924164812.816743-1-andriy.shevchenko@linux.intel.com>
References: <20260924164812.816743-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: sprd: Shadow errors from
 dma_request_chan()
Message-Id: <179035877830.204944.4424136633806527886.b4-ty@b4>
Date: Fri, 25 Sep 2026 18:52:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zHn9Wd5dXBE3nMcDyRT9QjEvDPp6MzaqBwfw1wrwnWE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtxVkrk3E8WBiJgggQaazPyKDYvP4LXVRo5zoG
 f7gvw86Q8CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarcVZAAKCRAk1otyXVSH
 0P2RB/9XbhBSGW6vYT3P1wUQhLW/6OTCYSq0MrMIbnAIVHgTHmaYthiiRydi+Ck6IqKHhM78OWH
 jVII4IVcHlTu8yDrJgmLGsKo+o8nxpRkpvkRlDFCKm10ZFQTtzmAHtn5WSXyR57JN1oDzXe3FOg
 GbhongzgKAAkMrT35cvwoE6RADr+FwHOlcGNhdRyVgpsXG3YQpuvKq2v6HEsRdqb8M4V+7hLPP8
 Hm//xG1cw9dfPagxpz2Sl7DmJXMqWa6Ki6VrI/CMszjm8Vbzvtd5kPa5tfSfn3a3fD4wLOpwMPC
 iXBmhWC/KVVbL0kcHLVPalcXKZk8E/Z9+oEHWdDAsnZq+c70
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 24 Sep 2026 18:48:12 +0200, Andy Shevchenko wrote:
> ASoC: sprd: Shadow errors from dma_request_chan()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: sprd: Shadow errors from dma_request_chan()
      https://git.kernel.org/broonie/sound/c/b25a036348e9

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

