Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D0F4AA00D;
	Mon, 21 Sep 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002507; cv=none; b=APIN62BcoOyhHHb3PDT34FioAbHkoIkmD6tNnS069CBQ8pRxDojzK2EuwZIky1piusS+V2Ql1OKAEtGDPcxYyZKcUNEzAQ7vXWb3UfhrF3VHkRYJC04IIuqDpPe//2QM/+A3mmlhFG/XhsFsR9e6Qaq75a+rzumjH22BjUvH7Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002507; c=relaxed/simple;
	bh=3B+XdrnK9k0v7LXUKi9ISbYlmKUyaa36XlCHL1ErWcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kwe4eocG8M6uGGFAJr69pBb59nc3F57zfDFxeQeTdnaBX1QsvLVdLllDsQoU60oCejefWX10mdKI+CA9ac02ZNoYDpioxteVCqXu6wii99sDXiiVgobd4lioI1FAw/HgOppraBCrLQ9gpEugFJLJ+B1+IOKn5FFuzVihjz5FakM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Le+k5UzZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Le+k5UzZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4621F000FF;
	Mon, 21 Sep 2026 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002501;
	bh=RHx+eXyS0dYmACF7sNod0lM9zWrOoctLgr/u6KoqGlA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Le+k5UzZahEOQB+XTfdY/yV5Wd5HuzhpzZ20oeYPMVx9EqENi7pBL/9XRa9CPRLPg
	 BxZFEk7gbmn0NeyvFCUFJM2S8qjXKpobDva6xqPwyza36v07ZjCfMD68kpnSM6G2K1
	 QHN1mA+S33qvj3euuHB2OoHg8q35odk85MCwxyAd9DYY7/3pKxl8yJoYAxh9IPt0up
	 nRmqVvGlyuqvS/YNb3UYwvPcdlSgzXKpWCoyVFuvPFL+dEchK3eweahNOTz5DLsF5G
	 swt36HXbct3JGC/P6zrSq3IWaAwH1pmyauUDoLGOCY4ZbajJid6F29liXLg/1iBez+
	 zOLewdjJHN6EA==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260917103400.2032913-1-mstrozek@opensource.cirrus.com>
References: <20260917103400.2032913-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: SDCA: Improve scanning the SWFT during FDL
Message-Id: <178998555390.191028.4550913416185996743.b4-ty@b4>
Date: Mon, 21 Sep 2026 12:12:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3B+XdrnK9k0v7LXUKi9ISbYlmKUyaa36XlCHL1ErWcA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqsUVAzBSaEAzdqR+8gaXs92mam7YDcvd/NIyJJ
 fi7TmTU7EaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarFFQAAKCRAk1otyXVSH
 0ITtB/47JvFb3GCKKdKQtEFhW6ZIxdBtiXYrPwKJXE504mxwMGfyJM+244wFHn5tU9S0ZLkbZMV
 T+gej9PYAQX+kV2VN9ktCYRl0vO0SUcj2Eo9T1gwwj4RoZ/N8J23Sr2lFozzb2Iaxp5foXNW24S
 laS1nbF+z31c4bCklbjRDQcWMZef6aU4Ip6fY4W+c84DQNxgiy651N0JSZI2vf4aq13WZcKK7+V
 I2KSSjoJWTMTzHsHTyoW6yTIDnGxx+OgmB4GJVoI1Q1wf8Wicn/vYQuTMKR3eRMziT8LUMR1hiS
 RaLKcQ2QNvsg66ulqHHMPM9PQpuND2LOVlCw4mkZJinOZ8pZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 17 Sep 2026 11:33:59 +0100, Maciej Strozek wrote:
> ASoC: SDCA: Improve scanning the SWFT during FDL

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: SDCA: Improve scanning the SWFT during FDL
      https://git.kernel.org/broonie/sound/c/4454102d6565
[2/2] ASoC: SDCA: Check return value on a missing FDL_Set_Index Range
      https://git.kernel.org/broonie/sound/c/dfd8940277c9

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

