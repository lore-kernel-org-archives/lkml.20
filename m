Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D95651993A;
	Tue,  8 Sep 2026 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864795; cv=none; b=j1TVzEprqIG+bT1BFmz1oFY88A6vp4e8MXfclPHQq2vvTR5ULeT7Ifda+zIgpzVnR38T9Om9Nd61v91ufSTGOHGnI284zEOEFl/d0+BKaIp4SRUpJGQSCYbSzvgNekgkoA+yOjQsbLz7YPflA/i5Z5ZFVyLFXGK4fPdJYYJZ5IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864795; c=relaxed/simple;
	bh=gUUQrpB9+nhC/4/SWUBV97o7l/5Ezw04bNetvgbRhSk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kw7X8LH29hytdPgcKaQnwGuiB3TOyb8bTpPdJ2Y7FN6BtJcjLtVLsrR3z4TgniioHPSJW45xdyRn5hGMwsIj7VWDcyCqCB/eJw2mP+mDaoT73DUOoj+bGA4kLNTCw9GZBs2X2PiSC9Z4Hw/WMoC5bUnzKq6vXd0YihMjZhCbnYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYX7a2jZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYX7a2jZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFCE1F00A3A;
	Tue,  8 Sep 2026 10:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788864789;
	bh=REFuB2ct6tQMusbPB7tui1HxUlTPFh2xxLLEcu2Sky8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TYX7a2jZo2QtPv8iS+6BegkdVO15XwGg0IKuDAUTHCKR+1T6Vp+o3Ygb9VS316eCP
	 YMvtyjHN8lnH+OuhxgGqmjj96XUWXL601x8XiQvaf0IKQqR9VsUsDUU2SK6VXLQTyL
	 LoCr2wZ+ks2S7cjJ+yuNy3UEsNmmXxufIqR65A4u5Bpq9YND0p79G26WjqMYHACkdR
	 HBhIDf8nvk+sdG0VN6Xz6ebQp2FyafNy/HWa+aPyaMAqKal5WiJYzFkFCkFMLxDHVV
	 D5w2sVYuLXotYsSrVBHHwa/W4E9ANj0XpYYqpymD4HRCpr6kc+GeNSpzU3fklkvzDq
	 Yu8Z8hZu1g/Kg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260907093645.27407-1-rf@opensource.cirrus.com>
References: <20260907093645.27407-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Fix race between kexec and
 snd_soc_register_component()
Message-Id: <178882273776.118202.16089055147898390946.b4-ty@b4>
Date: Tue, 08 Sep 2026 00:12:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gUUQrpB9+nhC/4/SWUBV97o7l/5Ezw04bNetvgbRhSk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqn+kRPTlUQlo4LRb9ZoywkK4Ktj5MYASE2mZwu
 4IOMwnRg86JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCap/pEQAKCRAk1otyXVSH
 0ApRB/90ilxeLsZWJ4j1wm0p/xYDG3mmbEd6jG/cBtbtbsSUWCo+claJPiEwjMZtgrrY/vwHba5
 vVa20IUeY78QHpzs8IHCLHbjYApvxfqxuyV23v59qZuY2Ft+MMjbYH0rosjINVQ7127gGmKJVim
 zwP4FIo6VkOfSHEDc6CkC2Rbzz3E+3jkLH4FW/54KMEsBysgZH4+KJk/i60j3OalEnyUTT4LCnA
 gX318S+TyMd9jf9k7K+d+vcjtk5lwWu0qf0GB5TUuPcfec78CC0IqgJht2AMwahmPV+pt2HYn/6
 G1n+RrKcM772jvE3vwEEp1RGE2uSITRMHIYd7XshzkxhO1Ps
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 07 Sep 2026 10:36:45 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fix race between kexec and snd_soc_register_component()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: cs35l56: Fix race between kexec and snd_soc_register_component()
      https://git.kernel.org/broonie/sound/c/883e78c9e600

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

