Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6BD4AA1D5;
	Thu, 17 Sep 2026 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644723; cv=none; b=uOpxQv3bDpK0n/Q5dXA4f2bV+ObNRrAVXFtvt6Q9vYOcEDlDenVbBS4oL+0CXHblDT/nH7+OOROsO0e20JvnTVx/9AV83A7T/JRuftXYO57bNbl2GBaAXuGM3p3qPA/G6ESoW23pSFC0zS4KPsNSgGINKTtEW9FLV1W6CeZrfuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644723; c=relaxed/simple;
	bh=z9eNiPj5wDyiTB2A/OcoLh7ppc5eD2mfvBaiWSEdvQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sC642zmGItSO/tVXx0kg3HjNscPBG8+OTHuWWWRfEqyUXf9ewRKsi/ycJJm5sI2onALN9i0uJbIb4oNsKy4OUVhKSyrUjdkrd+EDRy5LbQD11DKQdfTX0jpeMI/PRNvjiYeORtUhvTeRUA3H9+vXbV1CXG2X/kTGzCh61Ysk02U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZmba+ga; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZmba+ga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212991F00893;
	Thu, 17 Sep 2026 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644721;
	bh=UuRDRTa/pgF24T6CNlfb17GrjpX/75I8hK3VDhG7wLg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QZmba+ga10yMzQ1gemQipfG4BAK3F9RhZZfUxvHLmhhdhZT8HoKrw4jS1UtNndIf/
	 gsJYb97N3IE67Y9q2kogvJpN0o3vQY2oJGV9cRqWUnBOZhAremGq38ToTl+1Jap4Rj
	 Sg4iKXOqW1xd7s6bDZaC52N3G7iYcfMea5dH+CVJRZdjq5werMpHh2p3L3/CTdDsWg
	 bw3eHAIdiNwoBzDAbYcYevHkY92nY6JBkAm3qXULI9LsTLvqaMM9XhmjgQf+LVtdJt
	 wTyz3VjdyDuBRi37UimHQWIxig+xS0r22xrFBmMHLB5ilJ69bgL5L4r5G9ywqdmJ20
	 Lh2XNkX86iG6g==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, yung-chuan.liao@linux.intel.com, 
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, 
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com, 
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, 
 ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260910161728.1452808-1-Vijendar.Mukunda@amd.com>
References: <20260910161728.1452808-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/4] ASoC: amd: acp: SoundWire machine driver fixes
Message-Id: <178958572197.100121.14407200644851450524.b4-ty@b4>
Date: Wed, 16 Sep 2026 20:08:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2490; i=broonie@kernel.org;
 h=from:subject:message-id; bh=z9eNiPj5wDyiTB2A/OcoLh7ppc5eD2mfvBaiWSEdvQ0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqq8+sKqbUOIjNIxWRoEOn2z3Gakz5kSPA8anPY
 BHbXPm3FLCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqvPrAAKCRAk1otyXVSH
 0MWMB/9GW5cSUO5cvH3ToZqAeRvPOvNVaRpkaj79V5uiQYm75pol0kZrB0Xta196VGRZ5V4nbO9
 EqExr7vE4yD8+wzdHT+yeFEO+ebOc0Pyma2ALt9e8hNTxOsFPgCWfaLYokWLAek98Y6pSPsU1Mk
 n7KOC+1esGnvS9Q2/IVDESVG3T6ozBVItC7otl6D5JVk4j3lHSbW9jFpTaOQ+p1CaQOxysZSLq6
 vbmf9jqTGlW5WqESI4RLQuKszsXBOugKpPhQ1pOwVL1tzPiHvU5/5gO3mFn8YGglrJt5v5+hbzq
 OpNG1LMz2CPaZiXpFvwjoHC5UOaX13fFOPnJVqsEU3J4FWG3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 10 Sep 2026 21:46:45 +0530, Vijendar Mukunda wrote:
> ASoC: amd: acp: SoundWire machine driver fixes
> 
> This series fixes four defects in the AMD ACP SoundWire machine drivers
> (acp-sdw-legacy-mach.c and acp-sdw-sof-mach.c).
> 
> A bounds check is added to validate the SoundWire link ID before it is
> used as an array index in create_sdw_dailink(), preventing out-of-bounds
> access when an unexpected link_mask value is encountered. The codec
> config count in the SOF machine driver is refactored to use a dedicated
> variable rather than reusing the endpoint-count variable for two
> purposes, making the intent clearer and avoiding a stale value being
> passed to the codec config array. An operator-precedence bug in the
> ffs(link_mask - 1) expression is corrected to ffs(link_mask) - 1,
> ensuring the link ID is derived from the correct bit position. Finally,
> the SOF machine driver card name is shortened to fit within the 16-byte
> snd_card driver[] field and eliminate a compile-time warning.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: amd: acp: bounds-check SoundWire link ID in machine drivers
      https://git.kernel.org/broonie/sound/c/29218a4d11a3
[2/4] ASoC: amd: acp: refactor codec config count in SOF SoundWire machine driver
      https://git.kernel.org/broonie/sound/c/0b7d55d3a912
[3/4] ASoC: amd: acp: fix ffs() operator precedence for SoundWire link ID
      https://git.kernel.org/broonie/sound/c/27098aaf28b9
[4/4] ASoC: amd: acp: fix card name length warning in SOF SoundWire machine driver
      https://git.kernel.org/broonie/sound/c/d57616f8be56

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

