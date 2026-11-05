Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972774;
	b=JLH+Fd6OWa5VD9YJK5vKzRLQlww52JvOOCXoQTiHlntXk4qxPVWyqskFl9UXnLomWxRN
	 6TG6ITto6yB2N0Op1X22g4BM2M629Z9EaZ8DMAziteHyv/X+aZDDhXyfDgWGlnYiYzAsR
	 qckNyqDAvgsmRRqY9NCNW6Cqw5vP5LEpYldq4C5da4BGshIsW4rNtDXiVFbcIH8sMDnyE
	 HV8gn8B1KWtv6aAhpzafcKPZzeb5TNbyc8R1ZQD/KgdwpRJe5yzYJRYMiPD6it8+n48SO
	 AELUdjygLHlOsCep7OGRZ7rwk9zFWGN+QOr2NOjLVwX1v8xdp2gllMOps0BVD6XtjYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972774;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=3J4IP0m9rtbLhIS+fgsTYuVsTbuLph9Q31WTCK8+Nl8=;
	b=PmEG4dn5gBJg1VGHBgWbUkRaz2UyYxfmFRdymdOCwCUjWIQwlgn4DgsG7+8EcnUZT9bs
	 /UqX2ioS1lEZAJ98RiYokXAXWLN8UgNrv4SPXSg+6THEyI3T0wEV3yoBGL/YjYiAK8cHM
	 yfPm50J/Z6GhhimPoVtvThID+IVgKHJjhRPgwPjsSW65u4X60gGj7BdXlvW2Ju09prCQG
	 vIlQ+XpOO2vnzuDlebU6WUw6YqYK1b/mIsmhn/x4L8JjErOLkcZ+k2swzGDSLafq68K1U
	 HgpgF4fN8AdkTFrNaPtlVYsl3IwDuH6J9EqjPEdqzAfpH6HnfBN1bz//94CcrFTEuHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMb23Cg7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996C5606A33E;
	Fri,  6 Nov 2026 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMb23Cg7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA6A1F008A2;
	Fri,  6 Nov 2026 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972774;
	bh=3J4IP0m9rtbLhIS+fgsTYuVsTbuLph9Q31WTCK8+Nl8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oMb23Cg74EOiL5dZzOMPjej5qX71I759IDuh6ft6UkEM2n+mHcQ34EvsL02diVRNe
	 kQKzdVhGFVNpYoQ8il8yYcO1aB2VrMBty7aYU3SfqIxswee/lKpDjF7HVR5Gs8kx6r
	 0x95EbwW281iD6/jN3CgPH446lr07Mq3+aLfmyRLxJ8rPduS8nPOlQYYmf72mzaR/u
	 qS/E7qCuOY4CicyOSfL3dt0NLj0p9+3enz6X/cs/eekw0MC6RQoML4PN4HZiPGEGHk
	 d8CvP/cETeEVDIqcIE3OQCuAmHUjVeQkqIPjeywxuAJiROITfVutBzwbPKmtCMx19Y
	 We1i8gd2mLBIA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 5C1782808065;
	Fri, 06 Nov 2026 13:46:08 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com, Richard.Gong@amd.com, 
 Poojitha.N@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
In-Reply-To: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH v4 00/16] ASoC: amd: acp: ACP7.B/7.F SoundWire machine
 driver support
Message-Id: <179390337548.3073895.15216324345345633248.b4-ty@b4>
Date: Thu, 05 Nov 2026 18:29:35 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3676; i=broonie@kernel.org;
 h=from:subject:message-id; bh=l4d9Bbs7l5l+aD0uSm9XSe4knJ0Ljte73ScvGgg6XCA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe3lL4c38jY+pDCVdJnTuf+7mMA+Yuudp/nelQ0L281
 MSwHfrhHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIfhUjw4apczssTu7d2GnU
 w553997vyTonrL81Vj/VCda8bNpQtIuRYfLln4/SwyRDn5wPkbzx5J4ar++ZFZP9d0zxibZ86v0
 9kg0A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 30 Oct 2026 15:15:15 +0530, Vijendar Mukunda wrote:
> ASoC: amd: acp: ACP7.B/7.F SoundWire machine driver support
> 
> This series adds SoundWire machine driver support for ACP7.B and ACP7.F
> platforms. It extends the existing AMD ACP SoundWire infrastructure with
> per-platform CPU pin ID lookup, PDM controller selection via ACPI and DMI
> quirks, DMIC DAI link and components string handling, PCI subsystem ID
> propagation, and ACPI machine tables for RT721/RT722/RT1320 codec
> configurations on both platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[01/16] ASoC: amd: acp: fix missing cleanup on devm_kasprintf() failure in mc_probe()
        https://git.kernel.org/broonie/sound/c/007f91d0fdb8
[02/16] ASoC: amd: acp: fix missing cleanup on devm_kasprintf() failure in legacy SDW machine driver
        https://git.kernel.org/broonie/sound/c/2f107878e7a2
[03/16] ASoC: amd: sdw: remove unused ACP63_SDW_MAX_CPU_DAIS define
        https://git.kernel.org/broonie/sound/c/be810ddf1be9
[04/16] ASoC: amd: acp: add ACP7.B/7.F SoundWire link count for machine driver
        https://git.kernel.org/broonie/sound/c/7de8faa0fb6e
[05/16] ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI link support
        https://git.kernel.org/broonie/sound/c/b6fd467a4be0
[06/16] ASoC: amd: acp: add PDM controller selection for ACP7.B/7.F SoundWire machine driver
        https://git.kernel.org/broonie/sound/c/f6a58ddb3284
[07/16] ASoC: amd: acp: log ASOC_SDW_ACP_DMIC1 quirk in SOF SoundWire machine driver
        https://git.kernel.org/broonie/sound/c/5b597730d199
[08/16] ASoC: amd: acp: enable DMIC DAI link based on PDM controller selection
        https://git.kernel.org/broonie/sound/c/eb5a7c98ca1b
[09/16] ASoC: amd: acp: move ignore_internal_dmic gate to DMIC enable condition
        https://git.kernel.org/broonie/sound/c/5ad81cbb83bd
[10/16] ASoC: amd: acp: add DMIC components string for SOF SoundWire machine driver
        https://git.kernel.org/broonie/sound/c/2ced313a0605
[11/16] ASoC: amd: acp: set PCI subsystem ID for SOF SoundWire machine driver
        https://git.kernel.org/broonie/sound/c/90a52a8f23fa
[12/16] ASoC: amd: acp: fix MODULE_AUTHOR missing closing angle bracket
        https://git.kernel.org/broonie/sound/c/faa5a77479ad
[13/16] ASoC: amd: acp: add ACPI machine tables for ACP7.F SoundWire
        https://git.kernel.org/broonie/sound/c/48b1ff3a75d9
[14/16] ASoC: SOF: amd: add alt_machines for ACP7.F SOF SoundWire
        https://git.kernel.org/broonie/sound/c/c9ff86300abe
[15/16] ASoC: amd: acp: add SoundWire machine table for ACP7.B platform
        https://git.kernel.org/broonie/sound/c/e6f48837d135
[16/16] ASoC: SOF: amd: register SoundWire alt_machines for ACP7.B
        https://git.kernel.org/broonie/sound/c/4384043e78be

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

