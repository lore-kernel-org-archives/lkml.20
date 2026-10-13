Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B36B3CF699;
	Thu, 15 Oct 2026 10:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060275; cv=none; b=DLgJWOxKLR2lBGkWlbPK5LembAF/6isLoJLFVWs2G+nGBr3bN7q+S97eiKl3wJr5+vbxTSm3xOdvYpT+8SE0ctII/7/pb9tV6xc7owa5E7dfM8G6Ck1APMUKlo04kZLYpZDMAIkkQlNfBQLOrDU9YSBh6jWQFcJhFbCiHEI17T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060275; c=relaxed/simple;
	bh=GliNkEv4f5oaxNNjOVax3rnIxeu6bYxuNBj+S/JWY60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P72mHMl4MV3mZVKZp8VYK5Un3oQepsRxaW8y1pgHuopTeHkIwJl20PE7LttHTmjxau5ZJB3eQGxt2hpEtQKmempdPz6kt+MKhzync5G+VY3+QnQJ6Rk1lTyP8nGbhufHOvQT/LHjIjbnVPWHkeEqxbEI6ws0FxPO3KvVc8Dpjgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anAiLvI9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anAiLvI9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7451F000C4;
	Thu, 15 Oct 2026 10:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060273;
	bh=79LtDdXUGnQRvSGTVgG4tAzTgUO9Gbk0LFtaWpy2oig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=anAiLvI9xUWtRWgpajPIn8M95hBrsNXxS4yzI/1jJGnQTcGdkCuBR6zwpcSBMaYac
	 KzWJwpZ7rerDyRJtBUv3H+zF/zD/2cTHHcRoVshIxKNKxNRbRG8zRPPB+viASL+ZjH
	 hUklbufMqLsDQ/pwlR36HW/t76/Jol2W0GZjhULy99MhqQTEY3JlzNsoWGlZPT9Qr5
	 4YFoyUnEw4pi+SfayeVkdc54ejrtyoV1lXE+H+Bxvh8Qe2WUNse2kWlJWp7eCPEbvb
	 fNLkeUPYfl8RtABt54DBdJSsA2V3NDtBU2H/5Rcug1Pj8zJFkM3dOG57tf1qa+OO9P
	 VICndq4GCqGhA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, yung-chuan.liao@linux.intel.com, 
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, 
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com, 
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sound-open-firmware@alsa-project.org
In-Reply-To: <20261013154644.3788064-1-Vijendar.Mukunda@amd.com>
References: <20261013154644.3788064-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/9] ASoC: SOF/amd: ACP7.B support and ASP carveout
 firmware loading
Message-Id: <179191856632.42298.5680316320552393906.b4-ty@b4>
Date: Tue, 13 Oct 2026 20:09:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2750; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GliNkEv4f5oaxNNjOVax3rnIxeu6bYxuNBj+S/JWY60=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurM7hqZw4b1GbiXqwb875pblT4r/fv/3oyTHtDzU7i
 lwCw9iUO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjAR5euMDBsmb9rP9rFDWLtX
 z1KFscBwoY2WdeJ2Jid/xVuHrJTWFzEy9PnoBdpXflZgqsmPYrl83un/0fjbLzvCLVluVftPk/7
 EBQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 13 Oct 2026 21:11:32 +0530, Vijendar Mukunda wrote:
> ASoC: SOF/amd: ACP7.B support and ASP carveout firmware loading
> 
> This series adds ACP7.B platform support to the AMD SOF driver stack
> and implements the ASP-authenticated firmware load path required by
> both ACP7.B and ACP7.F.
> 
> Patches 1-2 are preparatory renames and restructuring. The existing
> acp7x machine table and chip descriptor are renamed to acp7f to
> accurately reflect the hardware they target (ACP7.F). The probe
> callback is restructured to select the per-revision descriptor via a
> dedicated static pci_device_id entry rather than encoding it in
> driver_data of the shared ID table.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/9] ASoC: SOF: amd: rename acp7x machine table and descriptor to acp7f
      https://git.kernel.org/broonie/misc/c/929e433b8cbc
[2/9] ASoC: SOF: amd: select descriptor per PCI revision in acp7x probe
      https://git.kernel.org/broonie/misc/c/f84363861e44
[3/9] ASoC: amd: add I2S machine table for ACP7.B
      https://git.kernel.org/broonie/misc/c/9246ac5b5c99
[4/9] ASoC: SOF: amd: add ACP7.B chip descriptor and wire per-revision probe
      https://git.kernel.org/broonie/misc/c/44f8d28191f1
[5/9] ASoC: SOF: amd: Propagate PCI subsystem Vendor and Device IDs
      https://git.kernel.org/broonie/misc/c/b2dc10ee0b51
[6/9] ASoC: SOF: amd: consolidate local variable declarations
      https://git.kernel.org/broonie/misc/c/b23e9b1f3b4c
[7/9] ASoC: amd: acp: add acp-mach-common.h for shared machine driver types
      https://git.kernel.org/broonie/misc/c/0e4c4081169b
[8/9] ASoC: SOF: amd: propagate pdm_sel to SDW machine driver via mach->pdata
      https://git.kernel.org/broonie/misc/c/439c43d9628e
[9/9] ASoC: SOF: amd: add ASP carveout firmware loading for ACP7.B/7.F
      https://git.kernel.org/broonie/misc/c/cec3598305a6

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

