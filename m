Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63AD3DAACB;
	Fri, 25 Sep 2026 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356079; cv=none; b=XPmbRfd5ZBQ6cJSCzK/ebtpimxUM7N/UvnV9JNNtDk70tzFj0q6vHwjxj0lzdsOU758sRiHL/ThK8laUXA9iUvm3ngBH6LYeSsOJEQgTpy5v+B5lv6OdSbh6jXfXYsHClUoobp7adZI9AIYV+dqGECqV1OU3AaUcS5eQez9uKtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356079; c=relaxed/simple;
	bh=9UHmI02RhIZRtNKhcc2/9pw5JUkxsLyKOtkaYJMPzx8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b3/3cokjXInEy7B1v752gyesJL4Sxp9ftrxB9IBT4ylVO7eSb+511Q5xMgVQsOoLLbo64nkxOrpQY5R6V2xGxKA7J8JSioP/o1+SwMT/2/m23ILRY9Bh+qRkwgiW3xt5UbIcgVvr3w9fnYVMLo6oCqfNFUV0Eznau2DrOXeY3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUNwuMX4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUNwuMX4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E44C1F000FF;
	Fri, 25 Sep 2026 17:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790356066;
	bh=590BL1Al0f0S5tQkUBHQr42shOMgu1cUjmTCFquDjKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EUNwuMX4nf1HwKKLjxuiqJbklxHP2ALVhVAN5EfBnpPo4p3ob4oRv8CgCj34Ob7p7
	 pei+oOWvjMAlZGub4PvZTBLVSviNbuga6+upUpaS2cGT8vbt0J4yT5VwyqajKyTGeU
	 Zuy+p0xqwh40xwD3plV866kZPRWZ/eOWGfVoM3gU7MvGaAbN2E39xyTk7XBKa/G0p3
	 NSiyKyuuAPT2GY3R4Xo8/48Wc4xBSZ0dU0cEBHEpdOYxFlpX3Xn7RE5Vx7woxnhArz
	 vqEvzMSHruRod6AHFuP+BJTOJTExXFPU/dXgFHjG90O1b21bZ1Kj8XkfkvANsIaY0+
	 hoOYv+w97SpZw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jasper Firth <jasper.m.f@hotmail.com>
Cc: Hans de Goede <hansg@kernel.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925-hi8-quirk-v1-1-ffd00b0447f9@hotmail.com>
References: <20260925-hi8-quirk-v1-1-ffd00b0447f9@hotmail.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5651: Add quirk for Chuwi Hi8
 with generic DMI strings
Message-Id: <179035358977.204944.13300811182259647036.b4-ty@b4>
Date: Fri, 25 Sep 2026 17:26:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9UHmI02RhIZRtNKhcc2/9pw5JUkxsLyKOtkaYJMPzx8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtqpdiqY0GF2KWNU7pgMqx3+9NO5cX5iSn/+3i
 aIo8s8I4kOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaraqXQAKCRAk1otyXVSH
 0OHVCACDqQNbXpeHBW7XgrpDqnkdGfMOmnizorJdWNjt/sMMJ7um3+vHjiayeFrQYro4R4HYLiN
 z7kxWYTpHU/QOpG2BBCfIDQKU0pCvdxbTwHLEK4Rwbd+r0B3pFmKzPgQ0b1w/JNfleYYfCCJ3fy
 prWmrC/SRbhXUYw6zFFYBgPB3phsU6L449Bd0wrQyYVi7jkO5ZUyOffWCKXyYVg4NS1aFMJe/X8
 umgJUkYv8u0+NiDrXg8knAxWDaJQ7VTm+AQzXIDJY7rHHYqGE7zdAEEeqzemm7qOddyZXCxFygR
 VQSNDcNO53z64NEUJeF0w+rqKalOi4H7+sjxiGzhCupPkCY6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 25 Sep 2026 23:06:25 +1000, Jasper Firth wrote:
> ASoC: Intel: bytcr_rt5651: Add quirk for Chuwi Hi8 with generic DMI strings

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: Intel: bytcr_rt5651: Add quirk for Chuwi Hi8 with generic DMI strings
      https://git.kernel.org/broonie/sound/c/c5a8fc2abe05

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

