Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D808D53A3B6;
	Thu, 24 Sep 2026 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271973; cv=none; b=uYLOO4dmSvarkarit9tt9V2kxyr6549DaH4m4ZHK9TqJWpkSvTpapoWSOvv359GEENuhtS4aM7LjerekS85SnUNU74esu0NiYmmxF2IvZZth3Xmwym5iaOJ78GQGaf4+3yfB9n2dG8ycXGWaNlwyA1DAUV1qaBVW7l+Fg7P3cNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271973; c=relaxed/simple;
	bh=cHnIesqzRd3SzWjC4c0j6xgj40PQm3/+Hfd6Bj+Xj/w=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u3VGnBNHyIzOViK3M+jaz2IZ8YB4nRLZsOGUGHnBbxD6Dpqj9gSwrPmVRNufJrGkoRTNV+K7+BQ1yFLgNxvQD4WulzA3z1VITPeqfl1LpiDRzGIMmk3DTxig8XVgGv5lELLPD6ySQ8HpI7lyDche4JMSfaI9zPMSMPJKNxjgUCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldDps6uo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldDps6uo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CBE1F000FF;
	Thu, 24 Sep 2026 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790271971;
	bh=jr52o/MyKxapop4cQtK8c+3adSYTJhdKVLABlleZ+K4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=ldDps6uo1ur2QkKdm3dLx9Q0sZpnHLoi8HRzYqfafXxTIjwrRjf6oNW1hxQeTltae
	 2TyXWqeYkaJxIHqddmb3FqXy+rYBP7cgHtYmXnHJJVwxEiG7XrIzA/bF1oFaKQuIov
	 J2g5AxW9vt7nW0RzCvXy79OpKB/Ckp17Qj0YL9YLqbjDalXWIHwe1MYuCilNGZ8Xih
	 pSpR6LBzkiIZFdHV7nLSKB+q0U+5sPVStkjAHaQ35njnGGDSHJYFZcGoTZgiTvUAQT
	 E/3i0cYDYH9GkbLv7x7z5ErB3sqCMOZi6BUiehZRrCE8AcszNzBLqoTSK1JpOfxgVl
	 6OlIU7WZ5oBlw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@oss.nxp.com
In-Reply-To: <20260916094043.1496709-1-shengjiu.wang@oss.nxp.com>
References: <20260916094043.1496709-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: use regmap_write_bits to update clock
 source registers
Message-Id: <179026940256.149798.11432270140920365951.b4-ty@b4>
Date: Thu, 24 Sep 2026 18:03:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cHnIesqzRd3SzWjC4c0j6xgj40PQm3/+Hfd6Bj+Xj/w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtWHWNnP1Di16WOvhFepRkg68S1ErVEn3Jj4E/
 EqJHFMmcPWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarVh1gAKCRAk1otyXVSH
 0DuVB/4rWGF+cpqbPdU+ysLLjAs4Q2D6BtM7HEAdkfFe7MJkwqLr6bt2faqf6a9fCgBOkMaPiss
 pHpHV2ObYKOCCHovB+kbIz9HSnZ/EQvrQKFkY5lwvzpoTVfHA9L1NUWVNLBIsJJYS5o/m/LMT21
 YbPxsbWU5fpMlnNQ3jFi8U7YWqmLd567UK9XlkeRSAzC7+HDuYsN8JEswwVVbNRMJ/wbtJl4K6W
 BbW/OKW0dDg7+jMryBL57PXjKgjBdOVSEyNyOdVGCDu0hy4REUBqveTo1SH0TvO3TiqWPZZCKMb
 zFLrl/WTExcRM5HjGjmfJXfuccE+1UufIba2vSsMDTZdHO57
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 16 Sep 2026 17:40:42 +0800, shengjiu.wang@oss.nxp.com wrote:
> ASoC: fsl_asrc: use regmap_write_bits to update clock source registers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: fsl_asrc: use regmap_write_bits to update clock source registers
      https://git.kernel.org/broonie/sound/c/92871abc1302

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

