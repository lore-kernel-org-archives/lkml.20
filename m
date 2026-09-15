Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054C2434E47;
	Tue, 15 Sep 2026 18:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495714; cv=none; b=dZx6L7GWhyMnXK/plKXwpOrjdLBEz86TM3Yi5kbHfOwc72A4RsYkj0Jm02Y9Whvr1yQev+d5ARTQh0zHJkMIJqecKhaEDStBZ8YN1jMc5YgC/zZBuAw4TQJbzKNOpRzZICx8oqa+a/V/ogSGpAxL+wHAi2VCv9HxOY8kLUenetU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495714; c=relaxed/simple;
	bh=TIIhdHZfImno8IHnpU61Rik0esQpnaspY0ZDNX2lqls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aPoM1choqq7LwQctAVhuy9uzttJGp0wxv6t40Qf6xR5cTW/vJ0AxihEfbmoshdFPY/f/wpBiRRxf2s3SEw840ZthfDS7LVJsgb1n+E9b8o9Z2orRXfs/0RcXR+LJqK5St2FLcAJ7Wgs9JZ6AxLlzjS72oa++YLGKv795pkbvf58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vi+w+dk6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vi+w+dk6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12691F000FF;
	Tue, 15 Sep 2026 18:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789495712;
	bh=lW0j21suN5eUTRByogg2pNvghzdTs7ZY5AtLSulagVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Vi+w+dk6FhsXb1qhgp6kkW7LTuQRoM5GGRxAoRBHeV1XBWq7+4y4gzywvDHp0i/rw
	 7xn07dl9twQtv8MwQZZFLT64ztn1IhBKr+AUtIv88q68IU/1K/DosGX9ZTHetUcq3n
	 Gl9AfjPNnsUN1ZIThlLn4Zk0H8Kr/h/1GXXPeGlV6Txpd5v0kAd5IcZcvrtlBq3cx3
	 Au7DNqkucKI0sy2jqoTu+v++996fEClRU54Yxq+uIY3P/LOMVTKhqlkQVfVsCaGcRk
	 lesywgRYZ5z+XCVpD6uxlt8sDZ1LqH7/6GZPPaObgJYulxPzVDp+cTqPKxiurQn+a9
	 iywe2+TTuRZUw==
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
Message-Id: <178949173671.151760.14042833988826539787.b4-ty@b4>
Date: Tue, 15 Sep 2026 18:02:16 +0100
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
 h=from:subject:message-id; bh=TIIhdHZfImno8IHnpU61Rik0esQpnaspY0ZDNX2lqls=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqYmbDZjNG5WhckGdMRHAgSIFk8Q3jv+atf2q3
 5zi5G4bxVyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqmJmwAKCRAk1otyXVSH
 0KguB/0Z4NquPK5hN7CChcyCOkGWNr6807j9P0ybILaUow+GNMhAyMipp8tWEHny8+ASsnMfaSX
 ou5Tjr4sDxNbkhO3sfF8ajogpSUvDChz8dtFbGqxq/KrXiBDg+8OFRTHWbXr0CxNpPG6Jy5XlMS
 Z26zdB5hdpKKDW0oSlhiSY81f89/aPgXtt8Wnp3DgwiVu1OQ5fuduDeLInOyV1BAXLVHccqroqX
 exhzBTJgf3e6UPRxkYPEABSBH94WINKrDAxZ2Iz8J57pd9y9W9h52/X72hllaUVRuiUwwZILgZe
 JrO78H8h6hKIQlTzj1qH/ffK4893FlMBJhhkH0Iagqz46TFa
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
      https://git.kernel.org/broonie/sound/c/2faa0ae56fa5
[2/4] ASoC: amd: acp: refactor codec config count in SOF SoundWire machine driver
      https://git.kernel.org/broonie/sound/c/efd76c8d6153
[3/4] ASoC: amd: acp: fix ffs() operator precedence for SoundWire link ID
      https://git.kernel.org/broonie/sound/c/5b28d773ed3a
[4/4] ASoC: amd: acp: fix card name length warning in SOF SoundWire machine driver
      https://git.kernel.org/broonie/sound/c/2444f73fe476

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

