Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE86047C0F7;
	Thu, 24 Sep 2026 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256104; cv=none; b=E1VA4YohlD96QVCafOzRobQsw2NkQKD6CJSUqrXqsm4mWcd4/MZCqsYFjhh4nLXa7yRfTHdNGqjdycCGJ7nHDH7bSKHKcvgp8Zs8cwOojgdOoptNJQtkK0UOBJHhVcUqptAAE6Y6+SOTivJeKCMLc6QZ28J5YYZv1TjL8FvfBb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256104; c=relaxed/simple;
	bh=iytG71/btaolJli63VfNx5Jj4nZmW8lxHlE/Ukcb1Zs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VT1vsE1kl0eDoCrWm45YpVj1BreCJJsFmDUrXS8mwsp/JAtrVkH7dtJPAkc8f6aT3dECRIJ8fYVTg7i5mYc9Pp+04m8d1xmlcencC8cpF/s9HU0DJFc9W9NWu+b6BAUE2IVooTaq3cxqxM4uWZpj/iHSkAkVYAfNT8qSKkbZrxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFGuproa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFGuproa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82761F000FF;
	Thu, 24 Sep 2026 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256103;
	bh=2/EPfMGjgL86gncbUx5eIRUF5uHC5gV4bo1BZJPq0Lw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VFGuproah1Ziy3ghTKqX5Se64Ibj0Ph0N/h6I3Nh5fCTmVbgfVVkz+SyaK3Qa2R+r
	 Az0AfJoSBlvgni1QJHPr4hEs1JN7+l+1in14byitbDUbibT15F2kUNOBCw76HzCuE1
	 5wWNmVpyKyfayrC4NGVc5Ygud6QlgLZdCDLdSU8B2b0B0mjTKvcExeoemTi7tpqVgr
	 /i7inBtCt+sETalAnNvAm3lz24aClSpLtJ68glXIRl+ZjchqQ9zQcVD4J0y6ZdYvHp
	 eKmuwz+P+PmndKRjA0dC3yQwj8DYLXpjv3Kwws5/dOnzYf5QwJD0lw3ACbuIxMgPxD
	 GJtFaJn9e8pHw==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260924095458.2683755-1-mstrozek@opensource.cirrus.com>
References: <20260924095458.2683755-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: SDCA: Power management fixes for the class
 function driver
Message-Id: <179025041368.149798.12108806107791034334.b4-ty@b4>
Date: Thu, 24 Sep 2026 12:46:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iytG71/btaolJli63VfNx5Jj4nZmW8lxHlE/Ukcb1Zs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtSPjZdjPrI9lRGUn2lgjNQZJYokWbmJuWALKk
 Cpb+CZ/50CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarUj4wAKCRAk1otyXVSH
 0FuMB/9dSWfGLkqhQRXJ6VQrGcsP2jA+q0ePHQiQVvDynocX78aj/7zlaLlGYiLgYRSdpUP2crZ
 Tu+XjQwnmxGkxDAJCR0O/kPOJESerkWa/rNi3txor+EqPQpYBIOqtp8wmHaE7ku6kFFuzzP5tPa
 gKsZDvvLz82FKikryn7B14znxK7nQa5cMfeiEOM4paA0qYLuO4BH4lPrtWBKnqygqWBAsZG7/v7
 Kh/s2YkDLvNqLUKRwU6yybkbZT45cC1IV5UHzDEAYwn1FXMvU/9ZNOgb1ZvnOilZtltFm8KtKOA
 nTWiCfmTBPeBl1YAMSslwMaf/AAyMS9OA+JC7osNyLyiQZ6D
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 24 Sep 2026 10:54:56 +0100, Maciej Strozek wrote:
> ASoC: SDCA: Power management fixes for the class function driver
> 
> The first corrects the point at which the suspended flag is set during
> system suspend, the second balances the runtime PM reference taken in
> probe when one of the later probe steps fails.
> 
> Maciej Strozek (2):
>   ASoC: SDCA: Set suspended flag after resuming within system suspend
>   ASoC: SDCA: Add better pm_runtime error handling in func probe
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: SDCA: Set suspended flag after resuming within system suspend
      https://git.kernel.org/broonie/sound/c/b16610e3770e
[2/2] ASoC: SDCA: Add better pm_runtime error handling in func probe
      https://git.kernel.org/broonie/sound/c/91094f9c8621

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

