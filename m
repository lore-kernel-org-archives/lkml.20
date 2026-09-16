Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6364850AC27;
	Wed, 16 Sep 2026 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568292; cv=none; b=Fk2Q+CqCDZNmbg8oqfRTet9bNNWXbao6ikxTUo62NVX7ycwt9Xn5GL7YxY+7UVZa6bgUNbmfdb85bk9SSwmhaVeXzW3mugfibRLFaNiHWlGIV9C4E7s9T8NAVrSIoWonodEvDm8xN0CKpiag7/rO1qxCPUo4xfuTDQ3RCzrt+Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568292; c=relaxed/simple;
	bh=KeGfUAWdOrMgWBreZH84zCKv7fBl8UpUzmr6QqxGHNs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tksw3+1dBtSc0c+XOwx9VIjAnFLz19b4BeqPgXb3yU6rAqvH1/CIY4GsFa3+hu8MlVXVGtlorR+gVrcLTSsJHhDqD6nUkRMSE7xFKfIUc0Xw0GEMcsercHEok51XoBIDNMSjKCKc5oEOpfxvXZ2I6nIH+l4zL725+OZ+0XhZ6zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Km6OpLDy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Km6OpLDy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C931F00893;
	Wed, 16 Sep 2026 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789568291;
	bh=KjIdz9k1e7y93C/Vf/1rr2E35r/gsyXrnglDP+HaO4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Km6OpLDy4LRFGah5xZgmpPkTkOU30jBxNHO+zgQHEXUBeyNGN1+u3bUVTDGgT9+VH
	 pftk8LVtSWm/5ptBAyxe/qmxJJRAeZba0xfbeEH+HqPXASR9wWtt8af8BJCsi8u+8c
	 1LGzPqBppbu+O8HKxHq6epbuLL70YqJOP62P1F2wuqSBvwzTIu25uBE6WuHe8NhPAp
	 Hl4sPCAkk5TPfMqUNed6io2gQhevw7jZtySRmjtNa5ejqpJ+7Vjv080Fu5HcI7Hs4J
	 EDJdz0tgKoisccYR4MMg8uRW7+dPjWXflYGfVmwRGIMd5oi71nT32Eirs7krNrT0Hd
	 MMKedvLlmU1bw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
 Sasha Levin <sashal@kernel.org>
Cc: kernel test robot <lkp@intel.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260913173132.1172003-1-sashal@kernel.org>
References: <20260913173132.1172003-1-sashal@kernel.org>
Subject: Re: [PATCH] ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT()
 arguments
Message-Id: <178956826195.100121.4430462389196247996.b4-ty@b4>
Date: Wed, 16 Sep 2026 15:17:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KeGfUAWdOrMgWBreZH84zCKv7fBl8UpUzmr6QqxGHNs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqqUfHWI1akJyM1PjG5dCU8ArWs5dVvE4IQipg
 acMHHpzvROJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqqlHwAKCRAk1otyXVSH
 0CYyB/4nuGfyFBt8j3PbztIPusllrXHe0S99R2RnxiDB5QjYyyvex+fbJOW96zFPdhl8NKBEMsg
 IAm+m8WCoF1Wc5qzZKVZ+FLjQwRsP1M8G56hEsMcf0ywDb6OOoy56nyOpyHAGIkKYptbiC+Er6F
 Pw5yUsZjhu7M61Qida18sQzOjC57iVQR17iC7eeecUZn0pmT7nz+6blOYFE+E+iOa5X62t7AiNI
 BmRvcXRf1dVfjqZRYnL+CMaQboI1cGLecQZajJWtwlU6flc3O6iWhRacH+7iPoVM+Xt7J7jCt75
 WHpURuBe72GV2BGT8MjGxe70z8LTUvJ92eGnPl3Bm+fAUji8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 13 Sep 2026 13:31:32 -0400, Sasha Levin wrote:
> ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments
      https://git.kernel.org/broonie/sound/c/53cab9a3fc89

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

