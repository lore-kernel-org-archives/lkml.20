Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3806427F8F;
	Fri, 18 Sep 2026 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724911; cv=none; b=DNRBftiOZGE2JcDt+4V792DmsfuxF9kDgCPnXfzPOSwdM58ytA6IzEIaKrB/y8hOAWzHZLEtNVVJv4KJQ6d9MQyA/GPhn0YqJXrdMGnILRX6aM9YG5++Ch/bVpWSDGaKzeh1+sQ4/ggCSwaHrtH4oq2V4oVSOhGTj7uXh+wUxTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724911; c=relaxed/simple;
	bh=0xJlfhEtS7rP+cIQGSbdXqP0rAyv7gYirXsnZ/0eJCA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aUZY7ympieKrD0PKdNiH7XYiokUvNqOtX8GQZpcG2KZL89q5gb5ZZOll8W3YhyNOUBuLR+4LV8yJxVUafYvE3bOwyEQEUqLDE429W5PN62ZlVOwSBf6WhTHoo2/IFUb1TDwy6bg3yKW2jgJv3W9jE6n4oiTeYj+1Yv1YKP7tazs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUrcbOLi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUrcbOLi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359AE1F000FF;
	Fri, 18 Sep 2026 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789724907;
	bh=hubMP+qeA9OQW4X4+cRxFhZ+FwJ/0Bm3jEI+zxjXKlg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TUrcbOLiC+Lc06p71uqurDkZ5oPWHF/+Lsaaz67l24jE+hjzkuGBm5+uZCOTqBitb
	 qAqcagJf+GEEOVGJxQR8F7gE91RShKIUaE7k1Qo28T70yG1i1h5uqB8sOlxHlfAYOF
	 NsAiWbfX4+HRdQm4vAjuvBCu4Xpst2rMqCETrYIpsuiIBPSt0kflc+7cOT8YgSvq+P
	 oTELMOsn/l2gyJsM5ddWL6xYL2crfXsVAmTgDJw4gpDoHpmhR2qpps+dZhHsQ3uQ0M
	 hq9WO7OZcmTl00j9oY1DlG4BNIv38WNsnGU8cgSGtiLERfyHH5AJtTg7heq+7pDv9R
	 sGSEHmasD9ASg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, anson.tsao@amd.com, 
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com, 
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Simon Trimmer <simont@opensource.cirrus.com>, Baojun Xu <baojun.xu@ti.com>, 
 Ville Saarinen <wiza@saarinenkoti.fi>, Hasun Park <hasunpark@gmail.com>, 
 "open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20260917165314.1880855-1-syed.sabakareem@amd.com>
References: <20260917165314.1880855-1-syed.sabakareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: enable TAS2783 and add RT712-VB
 SoundWire machine
Message-Id: <178968348634.285745.3236296235637083568.b4-ty@b4>
Date: Thu, 17 Sep 2026 23:18:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0xJlfhEtS7rP+cIQGSbdXqP0rAyv7gYirXsnZ/0eJCA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrQjlqj6fyAmTQRpiBgkaiMjMVz5x/506/qNxu
 oFo0hBtNq2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaq0I5QAKCRAk1otyXVSH
 0Hg2B/9X5dBztILpHb18qDJx2sn0koMp+TDojKWRMQBG6EhNlw/PKcoa+3fi/ZzCwaQL1x1+Chd
 7e/Hxa/jFKsX3m+IADYGuNsUxm5c6Uh3mcZ/yh5ZLYeGNRoZ0ayvoO3ylRI5g5zRVgiJ+JNUNwJ
 DR+VsqVAg9JwgVOFZEVqdD/tslutfwudjn22UbklmEmFHsfbYKbuG3jMVHXZLz16Q+d5u4/04C9
 22gnGsiq+Gybx0wP2Ab4RMfFA06Nf7bjT4gaiOMctNC1zzJuZ6QEsQqjrghvVQHstdlo7DmfuQh
 nSvCUXj5DSVYGkMU7vANIUHFYynJKVciW/tKEqREm6ERlNHf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 17 Sep 2026 22:21:49 +0530, Syed Saba Kareem wrote:
> ASoC: amd: acp: enable TAS2783 and add RT712-VB SoundWire machine

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp: enable TAS2783 and add RT712-VB SoundWire machine
      https://git.kernel.org/broonie/sound/c/28114992dd2f

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

