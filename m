Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9053EC81D;
	Wed,  7 Oct 2026 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360430; cv=none; b=egBXvj3sLaXiFahS7dzANu4JTqshexn0uQjiS1MVW6r1QEG0iqMs+BlwQwHmsSfXfnWwI1srSug2HaP2frDmSOpVZEGLnA3awhnTtirBd/U4SjY8Gv3xr6KcE1k2YCjEuQJNLSdUDPwshRhBgog29iYTTsDi/ODkXSD/5TPs8Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360430; c=relaxed/simple;
	bh=EjHArIissllZzusq0nd7v3g69f3EVOhWORcskQtwMg4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gE3m4C7/9SHfZgWNeaLHjgoyU5RflwBgN8QSMUDEdPWr7ommPLUKgUecd9SAGx7mnX2PABXwW0qBukrhODYWAytg6IzO9Jl/MYq/RZk2hNbN7Ed2uFTy+K4ijX8TXSNAVQl8kviFWzc+6QCqvxobGonnaBNW52C2lFkBwfJGAQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRIxdHZp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRIxdHZp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0A21F0089B;
	Wed,  7 Oct 2026 08:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791360426;
	bh=V/4HlkYomfVcdq4c+kird4gaCGsbmRUh/fEf06MmgjI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IRIxdHZpu3kE2yN60fELdJsOMuCphu2A68vkMx9tQy9+JM5KMbx7kW7M85EdVAu7v
	 bqvgWFxw0NocQugxocGunbjFVQfPOScxegips+nf84sPcJdHdBNm4SKKhsuEFV57KN
	 yr18b1llAq4oZyJJP8ZHQ3M/VEhIW5wdJCvLPZke23Us+Y+yd43ciLKY/8E4xuD+kQ
	 +QYVTbufpjT1it4KR7GYJBRTjHUXK8AbzXltX9x3tc0tuJAHRIveadRGm3LOkoQcWl
	 g7MwGd+LwAzwSfPHrCq9+kku25ITnmQqjizCOiGTL7LSN2UJdsmEvW+gVWcb0rieyS
	 GK7TRT/1AB09Q==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Niranjan Holalu Yogendra <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com, 
 sandeepk@ti.com, v-hampiholi@ti.com, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <20261006042315.1038-1-niranjan.hy@ti.com>
References: <20261006042315.1038-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v1] ASoC: amd: acp-legacy-mach: skip dai link for amp
 reference stream
Message-Id: <179129582484.150114.3901533066202793754.b4-ty@b4>
Date: Tue, 06 Oct 2026 16:10:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EjHArIissllZzusq0nd7v3g69f3EVOhWORcskQtwMg4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqxf2k1/at84mbAtj/Ebl95Y4W7dnGO8d/U5IEd
 oEZP9dgwgKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasX9pAAKCRAk1otyXVSH
 0AZvB/9q9uNN2k0CFqidiTpVxeGxpiArXKsfm6eHoW+82Bzw4BpSPuNPJxv1ArfCl9vcYXYubpF
 M9GWukoQqOzQtKY/sCEuaa0OQ51LRnwWS0sk7wlpcleXsZMQLyPaVTGXG1xTkOW1vtSD3gY4fOJ
 tqDlr/EgQDruuQ7o2NHMQ3TX9qLeDekZngWnw/aqY8A0gnsd+mayQ8ZJHFDyOc/t8QSCktJ5ssA
 HDuGEgpZyfLAceFK3+g3OUwcYhQJMsS1OBiWJtkWuvOMfB2G7OifShFksAhSup2+khGrOLeiuTa
 wyfcaccTUmJYj7Th/olbhgkRJIJaxrKE80LCAVdPCYOUvldQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 06 Oct 2026 09:53:15 +0530, Niranjan Holalu Yogendra wrote:
> ASoC: amd: acp-legacy-mach: skip dai link for amp reference stream

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: acp-legacy-mach: skip dai link for amp reference stream
      https://git.kernel.org/broonie/sound/c/9867312e9fd2

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

