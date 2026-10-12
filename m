Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14754F68CF;
	Tue, 13 Oct 2026 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900372; cv=none; b=qW98x5con7pXk74RsCRBiNja2B4B6Z9P9nCE6rB8BAM2JaQiO9xvI0AF3bmDl6jRwz7a3dJ06xtthhYlrQfo0zxalb68mcW8vbHONkPEd3h8b4xaD+Sd/2ytN27qm7+7pbNj9CZZzOzINOUmVTddMQOGDXQ6t3L5JVik3MnYgRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900372; c=relaxed/simple;
	bh=88sMariUMWdNlytVrkbftGMdi9DFUXPS3Df710KAlYM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l8bXv9ssn782r8RMap9zXc6NNrPBGGXffqbs/fJnHl9iBf71YF6M7/OcN/nXgoJGbX9r2IjQhcWI40BrUQbGCWDR3n9qjtCvPqFI70NiLnyNYM9XNlCBQzTBq/R0a+OYJ9H6mrCt9FBn4AJl6Lsdl7ZqCETlroGECP/QVBCBNtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcpXkPO/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcpXkPO/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C81C1F000FF;
	Tue, 13 Oct 2026 14:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900371;
	bh=eRtq4DKpnO0KPHyunx4fXh447Zexk7M1Vh2YSYSdDuI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TcpXkPO/zkL60SCO2C/rMWH+K+/vs7cPXABDui9ikvYm1Cbxn940RGnDSC86Yg1d5
	 yD69G77hAWi/b2JoP1cmNJRVutAAXD1kZU8HVTCMvql+gg4XfKjinpyAUFzsz15trf
	 2HNXoe1m3my6bcZv9IEdrdplABkmfoibCdXRZP7SVND+GE9OHos0On/wRz6LT6NQtl
	 I2N70cqg0sX+QN+pFE1T9ErUy6syfHZm5eLdWjFccXJk/NCH9b74X/qKeos/jtFDTT
	 Lh68ShmaOQypzQgB4hA8FmP7tujc94BNLf964xgJQc93Avbf1ev6Y7mnnf5sDyDSt7
	 TO9cpjFJSTZlg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com
In-Reply-To: <20261007133353.455185-1-cezary.rojewski@intel.com>
References: <20261007133353.455185-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/7] ASoC: core: Create new components in sane state
Message-Id: <179184591997.390394.2700469454089261038.b4-ty@b4>
Date: Mon, 12 Oct 2026 23:58:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260; i=broonie@kernel.org;
 h=from:subject:message-id; bh=88sMariUMWdNlytVrkbftGMdi9DFUXPS3Df710KAlYM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOWV24f+3VxUJtHluGv7sMPEzsat7zBd2RtThV9DC7y
 L3j25aqjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExkVwLDf3e/GJ4l76cvv5y+
 yt/I6lCLQ1L8vZTSs8l1x9QP73JZn8nI8Key/tuKVivxDsbvdbcjb17tPf8vOuw6T1yU2/GI3sq
 J7AA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 07 Oct 2026 15:33:46 +0200, Cezary Rojewski wrote:
> ASoC: core: Create new components in sane state
> 
> There is a gap between snd_soc_component_alloc() and
> snd_soc_register_component().  A driver that obtains a component object
> through snd_soc_component_alloc() receives an object in uninitialized
> state.  soc_component_initialize() is the function responsible for
> bringing it into a sane one but it is not accessible by the framework
> users.  Example of the uninitialized members are the lists e.g.:
> comp->dai_list.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/7] ASoC: core: Add component constructor
      https://git.kernel.org/broonie/misc/c/0f2bec6921f0
[2/7] ASoC: core: Rename and export soc_component_add()
      https://git.kernel.org/broonie/misc/c/4e2db62172b5
[3/7] ASoC: dmaengine: Switch to snd_snd_component_new()
      https://git.kernel.org/broonie/misc/c/857469990ee1
[4/7] ASoC: topology-test: Switch to snd_snd_component_new()
      https://git.kernel.org/broonie/misc/c/c0e1ffec60ce
[5/7] ASoC: Intel: catpt: Switch to snd_snd_component_new()
      https://git.kernel.org/broonie/misc/c/6cb74a0741da
[6/7] ASoC: Intel: avs: Switch to snd_snd_component_new()
      https://git.kernel.org/broonie/misc/c/d7065004a33a
[7/7] ASoC: core: Remove unused component-register members
      https://git.kernel.org/broonie/misc/c/146caaa16f85

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

