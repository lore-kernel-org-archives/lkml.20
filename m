Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4224A33E6;
	Mon,  5 Oct 2026 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209787; cv=none; b=RoyAjEfHkYcRtfptFV3Hnq+fuYBRmtlSd82bTiARzWG8mFxCGKMBPslfYTRUgAXqEfHvbwcveI7nmvDYu0thl8vlnFzKEilEPANwWLcbonHuaT8xnVYuHjnWZ6QT90+JI+PoUNe2yteN3I5nbau5A9aRsK9rcIiubjFT7DYhHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209787; c=relaxed/simple;
	bh=xKTsDH1Wuv7BqXGmGWhMOxCpi36Ahx5A11lCc7OgMAY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c5MguEaHnieAflYqNydisZTFVZwrWhcavP/wK7nzEcZ1SUBqSrmUi5ZZO/MifpHxjVBk/4Tqb7zaBJXL96EiJjx/1/hL2TOEAne6Zk4ePqjTfEA3NTxLtbYl/rLh4kvXbK5RisgCAnWq3h1OfwV3Qxmav3pcYyLrfu7tT5KrFJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xar1QYVT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xar1QYVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBD71F00893;
	Mon,  5 Oct 2026 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791209781;
	bh=mCh4YAwjOU+2g6B8jKIlPf8Bdst3nnf69QGA+gm31CU=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Xar1QYVTGnlhfmV910xIXSuA41WFawNPiJA2pg4WmiYTauXGANXJy2HSNZQK5u19a
	 iRzjGP34tldbnhHfLA3cqIuNa7jXPZ+83DrYMN7mD6lIyAt+IHyi1YNbEebGzAceWZ
	 HquQbEHhvN222m/1SU+DLuixsKfIhxI/lxs5iJEu1UHvqwBbpfED7T6E+NlncOJH7B
	 C/9ZC+wClIqHgl0v1MdB4z6AzmVvlTpSiS7hzsk4BmC7elcUxI3ygiF9/96EPztfTa
	 y/2No62FVD+7XA+2qosw6bcwup4irtMoyTCLDuMPIIPv3jGTec+6B/Fc/6CJ2B9krL
	 CNEV4fAqRt3ug==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Rander Wang <rander.wang@intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiale Yao <yaojiale02@163.com>
In-Reply-To: <20260925145019.2290367-1-yaojiale02@163.com>
References: <20260925145019.2290367-1-yaojiale02@163.com>
Subject: Re: [PATCH 0/6] ASoC: rt-sdw: always cancel jack work on remove
Message-Id: <179114354477.150114.17867136562907435840.b4-ty@b4>
Date: Sun, 04 Oct 2026 21:52:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xKTsDH1Wuv7BqXGmGWhMOxCpi36Ahx5A11lCc7OgMAY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqw7EvhSsMYivIBSu3G7u3PeWLN8hvCVLGHKIHD
 ckiAcDyX72JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasOxLwAKCRAk1otyXVSH
 0NQsB/0TubRu0BU/qQOGzWHLXN9sEDhqsH5hmqikmNIA5ENOR1KDRwgJbDDFUkeC8O7PW6T/TGD
 Si/GdYx3KY6DLXAyVQrb9etgZ6gBdu4Lvh5rm8yQivjnFUZnFVWlL0EMCGNIpCFhycepVhCdC5i
 KfREze33i3rFqPgUMZTCYDlEqK7lR8WDtBY84ONOUS+0ayj1kxsd5ZHxufhl7+M5JLaRSRoukgR
 D1lGuaS9EIi8n2lxASD8TTPTqnHG+e+iXK9peSaJgkCaYRbwusjG1osFgSFifLo2g77fEYSiajs
 nvoW6dfzPJIo58XcvzXBsFTy6uz4iQrre1WDXllOIRX5Q6YM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 25 Sep 2026 22:50:12 +0800, Jiale Yao wrote:
> ASoC: rt-sdw: always cancel jack work on remove
> 
> The Realtek SoundWire codec remove callbacks cancel jack work only while
> hw_init is true. hw_init is cleared by update_status() when the slave
> becomes unattached, but jack work can already have been queued by the
> interrupt callback or jack initialization path. If remove runs after that
> state transition, the pending work is not drained and can run after the
> codec private data has been freed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/6] ASoC: rt5682-sdw: always cancel jack work on remove
      https://git.kernel.org/broonie/sound/c/9a98f7e955d3
[2/6] ASoC: rt711-sdw: always cancel jack work on remove
      https://git.kernel.org/broonie/sound/c/4bf78e3d9e32
[3/6] ASoC: rt711-sdca: always cancel jack work on remove
      https://git.kernel.org/broonie/sound/c/ecc2fca6dece
[4/6] ASoC: rt712-sdca: always cancel jack work on remove
      https://git.kernel.org/broonie/sound/c/c7d07df95ee7
[5/6] ASoC: rt721-sdca: always cancel jack work on remove
      https://git.kernel.org/broonie/sound/c/958d025d6235
[6/6] ASoC: rt722-sdca: always cancel jack work on remove
      https://git.kernel.org/broonie/sound/c/9d29132d81a7

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

