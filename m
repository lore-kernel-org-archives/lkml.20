Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BA157981A;
	Wed,  9 Sep 2026 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969223; cv=none; b=q0VO5wlZkIarxWAOLIO7uFz20lXE77vM106QhOeQ4UbJ/xrgMumE/jptcUgaK8ydAX+TWa1ODxhC0R61r0vnE3FkkZzYuYnNOLxWw5aDSYaVviWlEGINs6byKP1Z54+YXIwXzyjpHX47VlnWFAwFmNsZNvtr4gJQsZzfX58sowU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969223; c=relaxed/simple;
	bh=jYxLIltiJBNKtV2wRv/XI73ayKEPL2qUF4cypA58Y30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=leju78QKiXrq9XPHG2IATo7cJyDZMI7WJcSG2b7sywD8+u5ZhGT6QIrIaLldk/qAgzMNQeWmMYsn6Au1YC84hfQt0RKh8dfCla1qKvH+IKDCrb3NtFkgvsi6yGhMDaTIl+FMiPbfKXH6rshGWUMtuRECiHggoAeZNAPvmHLzR34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVichdBj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVichdBj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E932C1F00A3E;
	Wed,  9 Sep 2026 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788969221;
	bh=KH3AB4VEx2Nfdbk7UYQ1u4DHzvIIDHQmmX/lLYqQNM0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IVichdBjTkcdPG+FELSm8so46I7269H/VTTI89+EhEbrs6qlJcga2BRNc+7xUob9k
	 +OqGCzmV+gEpFRpL4gam5pNXah1/rYZ7XgkquJbrsAbh42Y2UADnaIbLveCOp4eiTH
	 enrPdeWkPjMmwQJ0fsKjbLU0t1ulayM0uh4XsTLqLHf4L7B/mu5EBKrehpVYj4Yh54
	 MV/J8hLyGg5C/sJvOfwRuYblon32YnLMMJ5FFRmWJA1O8RlSp/cWJxQZoq2In3jxSM
	 Y+DKjKpTbvytE0DHBZRl5z+g+5lzR3KPvfL7veoJdVsfpIsyJJFDoSF4KgrNbFpp95
	 5aUWM10H7HGUw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Andrey Golovko <andrey.golovko@gmail.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Antoine Monnet <antoine@montane.tech>, Robin Everaars <robineveraars@pm.me>, 
 Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260815112000.4180-1-andrey.golovko@gmail.com>
References: <20260815112000.4180-1-andrey.golovko@gmail.com>
Subject: Re: [PATCH v3 0/2] ASoC: tas2783-sdw: fix the read-only Control
 handling
Message-Id: <178895627059.87467.16366156414675146446.b4-ty@b4>
Date: Wed, 09 Sep 2026 13:17:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2311; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jYxLIltiJBNKtV2wRv/XI73ayKEPL2qUF4cypA58Y30=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoYEAmEa6JJlbI3a2BXfzkKnpH4DH1Y0gAYUs7
 eyuAwaorM+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqGBAAAKCRAk1otyXVSH
 0A2SB/4rSUh/LRr6ZPIx5ovqC3fo/11hVvMUHA+yw9E3JSTk4ZkbqiOt8rIOUuA+9AllCqUeui7
 ly6/XMDyuYyss1ny6fYKfR5SH8Wf6mR0cWqmFSMj9r89XJYLzGa3CJcFo86Sa9M/7EL5rjdnyfG
 Z/PyPwvTqMwTgbwGYdBtmlRce77k/L2j7q7+6Zjg1fCWc/1Fr4jQuh9vtXnuLFiCYLJWn+qFqQt
 aGP/CgmmE4w2+sZ0yXDvOim2BLvP2FM1YQ/hhWiHZpWVcnlILglDhFZXkwAumk4v9mpPqecKMRX
 0XbzfDiFfDxxkT5ePr1gEgRT4+Wg8Qvk+mygyB+TQymPcb7z
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 15 Aug 2026 14:40:00 +0300, Andrey Golovko wrote:
> ASoC: tas2783-sdw: fix the read-only Control handling
> 
> The 1/2 of v2 is in for-7.3 as 0c7aeb0f5ece, so this is the rest of it,
> rebased on that, with one more patch in front.
> 
> Mark asked whether marking the read-only Controls volatile works for
> multi-byte reads.  It does not, on its own.  Twenty of the Controls that
> patch marks volatile are wider than one byte: nineteen of four - the
> Latency of FU23, FU26 and FU127, XU22 0x06, SAPU29 0x05, PPU21 and PPU26
> 0x06, the 0x08 Control of IT21, IT26, IT28, IT29, OT23, OT24, OT25, OT28
> and OT127, MU26 0x06, MFPU21 and MFPU26 0x08 - and XU22 0x07 of two.
> With val_bits = 8 the MBQ layer refuses each of them before anything
> reaches the bus, so the patch on its own would turn a read that used to
> be answered from the cache into -EINVAL.  What the cache answered was
> the placeholder from tas2783_reg_default[] rather than anything the
> device had said, and the driver performs no register reads at all, so
> nothing in tree can tell the difference today - but -EINVAL is not what
> the patch should leave behind.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: tas2783-sdw: make multi-byte MBQ registers reachable
      https://git.kernel.org/broonie/sound/c/3e56757584d6
[2/2] ASoC: tas2783-sdw: do not cache read-only Controls
      https://git.kernel.org/broonie/sound/c/f4ffa3820949

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

