Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0066733F8D4;
	Thu, 15 Oct 2026 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099768; cv=none; b=mpW5crxCl1XpT2MG5Q/SPD487+wlmuVBRpeBhRANeE5wM8i3GegLbaUGOsPeIs/whwMnLsElyi8h1/T7r6SHPD7j/bile50LuYgbTMwJmr5TMV0QET42DTrUkmUI8qj/INaZCQVsVM9tTTNotpfAEvTYN9C6v2jZyiU4oSXrSes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099768; c=relaxed/simple;
	bh=NtT75JeFztbPAWzucsDtf7fMgOeq2uQedS481hQ4zZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lx2pl+nYl2ziZtrtgFLebdeW/rj8zer8g1VS0VXiREZJVhl5F3YJtNg43oOQUHvhDC9Nv9RoJidDqIGxl8L/KOnc6/YrqFZCwgMC2FnMFk9ApWPnNJX2jilbzgrt9vgKuX5h0iw6fp6pAnZqwPp1RcwlfRcdt7wRrD8PZf05nvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1LYf6b1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1LYf6b1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6AC1F000C4;
	Thu, 15 Oct 2026 21:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792099767;
	bh=Dvlb9OShX3NlIjJAoy2qVHjabyKJKlcC2f1GFqVFfl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e1LYf6b1L6LPXMozfdCZ3ApXUGMTtMDoIjM1j8hygiCAteCZDao/8gAdyd7lazRXl
	 elvVlHztMrRVIJRK/i26a++FHdcO6kGFOniV81DnAL/EOialDJ8YhK7Fcf9GlOgwng
	 1nIo76Qm2GvOxCH16Spn5ZQAbqwyGUdmDlLNIdGVkSIYFvmI0ltEyGBbPbxQHMJek7
	 aOCKoGtjxkUDQw1/vnNbye2i4k9gwhTmzsEpBD+70xIuRjgts8yn+HavOIvKgJXcxE
	 wbUJHuoV9cjc0Rlroj/u1x7dELukKIkH18cGMwoc2rb1AmCRRACCbNcSOg8aZh7ecM
	 xkuTINsQ9au6w==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>, 
 Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
Subject: Re: [PATCH v9 00/10] ASoC: qcom: Add QAIF driver for Shikra audio
 platform
Message-Id: <179207911108.134795.519341360090073101.b4-ty@b4>
Date: Thu, 15 Oct 2026 16:45:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2702; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NtT75JeFztbPAWzucsDtf7fMgOeq2uQedS481hQ4zZY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIuum7y5XvNrzTl1P5DOTWO60QjLwe7TivV/Ra+96DNY
 oUq9UMdHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiIQCMjw+kJQtdEEkxjxP0S
 e2fZaL66tG3X8Yjnl3pmXats+i7HPZGRYa3QyoK5jPunOj1bwPhzbl/1JIuY/cqvuLZPsfzT0tE
 UzgoA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 13 Oct 2026 11:21:23 +0530, Harendra Gautam wrote:
> ASoC: qcom: Add QAIF driver for Shikra audio platform
> 
> This series introduces the Qualcomm Audio Interface (QAIF) driver for
> the Shikra audio platform.
> 
> Hardware IP Overview
> ====================
> QAIF (Qualcomm Audio Interface) is a fully configurable DMA-based audio
> subsystem used to transmit and receive audio data over serial audio
> interfaces (PCM, TDM, MI2S) and to provide a DMA interface for internal
> codec connections. It manages two independent data paths:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
        https://git.kernel.org/broonie/sound/c/f7b6fe0a9bd3
[02/10] ASoC: qcom: Add QAIF shared data structures and variant interface
        https://git.kernel.org/broonie/sound/c/6a07ff8dd304
[03/10] ASoC: qcom: Add QAIF hardware register map
        https://git.kernel.org/broonie/sound/c/6a0d1c361ec5
[04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT parsing and platform init
        https://git.kernel.org/broonie/sound/c/dd77abdd3496
[05/10] ASoC: soc-core: Add snd_soc_of_xlate_dai_name() generic helper
        https://git.kernel.org/broonie/sound/c/02298cc296e6
[06/10] ASoC: qcom: Switch lpass-cpu and qaif-cpu to snd_soc_of_xlate_dai_name()
        https://git.kernel.org/broonie/sound/c/76c5ecd4cafe
[07/10] ASoC: qcom: Add QAIF PCM operations
        https://git.kernel.org/broonie/sound/c/6381a4f9c633
[08/10] ASoC: qcom: Add QAIF IRQ handling and platform register
        https://git.kernel.org/broonie/sound/c/abe10d275660
[09/10] ASoC: qcom: Add Shikra QAIF support
        https://git.kernel.org/broonie/sound/c/871b3a7574f9
[10/10] MAINTAINERS: Add Qualcomm QAIF driver entry
        https://git.kernel.org/broonie/sound/c/9a810aa9f105

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

