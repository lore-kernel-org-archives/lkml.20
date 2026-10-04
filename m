Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82F74A204F;
	Mon,  5 Oct 2026 14:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209798; cv=none; b=HFtSUBcFk2sC1WKscUwiSy9hM4zMy0KXI8VR1fAeRy+SbXpSuwvlNubhGLaS5yhYk7SxddhZETXfIDKL2Wf3sOSqlWDk8skGpd3mlB3M+Ev9A0ZOZUUz3jbDNFb+UJ0KMBNVFkg7pQsSEMgmpYVrdu9vnUJ7o+2o7RHZBYKNylk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209798; c=relaxed/simple;
	bh=nrgOJpoz82UBh4rj+CJlk7d3ZEa04L0VCennVYjSkVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fuxCYnEBI9n4ZZU8gSg0mAgArhXfUVRKS6dBJUd3A/NADHr7l4zWoiilx2muDx/Yleq7EpwuvNY3+/pqXGVxqFp66zwsNGzSohFIkeFUndV/zmkHjPUegTA+xs7L44AQ0Rwda/ixXGoBXjZMQLeQXEVWXftIatoP422/R2zpSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sr3F3kpF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sr3F3kpF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F2D1F000FF;
	Mon,  5 Oct 2026 14:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791209786;
	bh=s3JKtLKgK4+h+8TI4VHmeHIDukA7v0x7TqxgmlASLok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Sr3F3kpFMo/8UzyYb+LfEgnS8NYK5Tv+5XJLh+eISg0X1A9tJEqFDyo+efGawijcy
	 6bNNEb/bIf6aDsuAkjYympkJHSKGkmODRRSRdTX2T2GuL1dfmgvjnYuSgPZe7jAv5j
	 k5WQ3jvi8+aH7qMRuuc2TvEcGI/LYZqHeEeNDQFhoh1E3gpnkn1WBTnBQJOL/PFEIB
	 vqH6C5bmoztGVDgtXpxKToXzSC1/7swHwATPWVYapUNYbLd3REFIENd3Lq/taPHd8T
	 7RaliCyNCy3tQ3c9Y05a+tSMb3ilY+iTX0gJfni0P99B+rT8M2Zq+PXjb0lIPawFox
	 QQhVYXaVH7QVA==
From: Mark Brown <broonie@kernel.org>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <SN6PR19MB230304C2E75499FE23B53885FC8F2@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB230304C2E75499FE23B53885FC8F2@SN6PR19MB2303.namprd19.prod.outlook.com>
Subject: Re: [PATCH 0/2] ASoC: aw88399: fix BSTS check using vendor driver
 logic
Message-Id: <179114266772.150114.9226973217656023756.b4-ty@b4>
Date: Sun, 04 Oct 2026 21:37:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nrgOJpoz82UBh4rj+CJlk7d3ZEa04L0VCennVYjSkVM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqw7E1ftLUIUsTKlUb+R+fZLY2x2V13bnfYir6U
 64AoPcWCh2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasOxNQAKCRAk1otyXVSH
 0P0oCACCyhbbWlGZruwKVQ97tP0vAtIfMxVxB5vUCztWj2gUGE3GBdtY/tJPMCYHvOjlJtaCfWU
 9BHTZ7DrV9UsnH7TtjxWAipk1TCHxLaXEAB63TH/fAvZ6/kx42PQ4cPqHwqaWD96XYN2rQFxE/a
 cB1wfK6smGmy339OcajrHtVSnsKi6V4F3uLNMTfAy3/FQVxYVTeLfBom3gc2y1NkVdLsXGcpTG+
 qGyo2vWNnR1TMfgo6C51o6RKckthiOCz85mBAMpoqKYgbZ3kMEb1lt4FDX+MCT63Y0jQLfDHymX
 G+gQ/FKB8/tX3V1Ps9WqFLR1YzgXXxFPDFT+KO3gACoEV+u6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 26 Sep 2026 14:25:57 +0200, Marco Giunta wrote:
> ASoC: aw88399: fix BSTS check using vendor driver logic
> 
> The aw88399 sysst check requires BSTS (boost finished) to assert during
> startup. On hardware where the boost converter is bypassed via external
> power supply (EN_HVBAT in BSTCTRL10, i.e. register 0x69 bit 2), BSTS never
> asserts and init fails.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: aw88399: skip BSTS check when boost converter is bypassed
      https://git.kernel.org/broonie/sound/c/664824782df6
[2/2] ASoC: aw88399: remove bsts_unreliable workaround
      https://git.kernel.org/broonie/sound/c/c5f615536405

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

