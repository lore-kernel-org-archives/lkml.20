Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1703D4137;
	Wed, 14 Oct 2026 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973720; cv=none; b=DtBFucJj10QHnCbdVt21Ov5VTy3Qt2fQ7sl0fFXAVlHB5jDtEmCtzdUiCMDF7YqwWtheE9PVAu3hHMGAQLthWKfmFlT15eP7pTfqHXoZeEloMCfakBgHEPZiGzUBpQOPNiuAPW6qch0Z/ciJKfb+PImjFLEXU7EkCQs74yh1OXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973720; c=relaxed/simple;
	bh=skJdmd3tUQHGVzD6TZQsGKOJkI7UvX0V36y4xyypgz4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y9rxdn2xBpL5coDHIi6IhkCWi+QGYufxM6XZ9LdHloSok4RJ0VQO6EzszLe+s9U3BOh0uqbJPZR3vKeFCh2wKqKQFP1Qc00KDT7VAqaLlTLSUcWPbdbt7EJPcdkklU4POgtPRRrn5vfX5IH0kZeJ1WjaiPzA5J2xHHdHzNy3hrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cil4DIOK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cil4DIOK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC03E1F000FF;
	Wed, 14 Oct 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791973718;
	bh=LWAleCpYBlToJ7/WPCLhRt8yE2399HoszrhXc5+pn3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Cil4DIOKlCtMK0ChHPWRGsZIkuR+ETSpqNy02sPVq6qd79JT2tCNTFJgNM8Swqxmn
	 aol69v8n/1Q2kFlnLE84DnP2ABZpg7L8lpRt5fvMvdWQI2h+tuogX7GHZMsYwQvZHl
	 sb6m98FQDtJAx/zg/RGu1FNkxkXPWNmbjtwpXi3b7arjHiStM3YnRIR5naVxJUrx/a
	 eZzVmMBN2RLEcxGWajgFN4LleEJRW+NzM/sk2KbrXPlxDCeeDga+ITxHqOfkB5nteI
	 UQU15jwJ2oabwmaJZo5/361elT8+VpOHlZqB7Zi/h7zYsQVDWGjmNuQNaknGL6ExWi
	 nu/RHwvE1FR/Q==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 cassiogabrielcontato@gmail.com, Haotian Zhang <vulab@iscas.ac.cn>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
 Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on
 success
Message-Id: <179192410143.1606900.17860222773161459120.b4-ty@b4>
Date: Tue, 13 Oct 2026 21:41:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=broonie@kernel.org;
 h=from:subject:message-id; bh=skJdmd3tUQHGVzD6TZQsGKOJkI7UvX0V36y4xyypgz4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLORwbGPL+V+6Wu8NuXVRZFikcVeRwqUx/oLOV4qGigb
 SWmwrqwo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABOZM4fhv2Oqd3VAaLfuiY6v
 k0UdLq7lZVwt+tLyfNzEi9PFDLf++sjI0PBzlvkUvZZVjys/zYivKNtsfGNO4cGHqgEL8leEnvE
 /xAsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 06 Oct 2026 17:16:02 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: Return 0 from FE startup on success
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> Some FE startup callbacks may return a positive value from constraint
> helpers, but ASoC expects 0 on success. This can cause .shutdown() to be
> skipped during rollback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/5bbd6696d75e
[2/4] ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/b6b3dbee98f1
[3/4] ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/f63317c826c4
[4/4] ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/240f11af9c80

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

