Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808FA5908DA;
	Tue,  8 Sep 2026 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888484; cv=none; b=l0Mf4y8sTwJEh2n1i8sKQTsbLvbfYyHudMsYIHRoZ/SWdmUQdLjonhDeKapWiWjXEoBtBZe9R8i/GoRYpixIHo3zeXmOcdbWXSYErn7eGdEi9Qx/+R7xdPwDUwP0KTfIOGD4FnyPFkyA+dRgaFWs5++oM7nfozNMPUMAOr0uOrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888484; c=relaxed/simple;
	bh=lEUgOH/O9TJ8aaaKwHIpkEDMFvYaZ3as10UkVzac/3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iw5/feQHgZvbpSY8McU+eNfijA2nmHQdE7hTESjrYgHMEPwqxqt40yUYrvrwkuheXZIGeItTDDjTreInaLkPxNlFF72EVwIUCOoqfG694erp8JOgl9CN5815tTcneZx4Wr6l+2jdIXvGqMEMFGbfLCtXV7KGW6CHqKNCg2Uip68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLkoMscu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLkoMscu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E27B1F00A3A;
	Tue,  8 Sep 2026 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888483;
	bh=0EQhqCbrqwzwwWKEroV5fCssCI+1bbt2OCRkahyZW/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DLkoMscuF03DiQJB8lCqCtMGAeV3vv2NEAna4f2iHH/j9eReKaml+h7pLpaTfn+2R
	 LUjES668wLWU9PgXc6TjSKI8XwXHFnWa07fJXdcTXIBsC12DL674ajnQIBpwtltn7X
	 tfpCvZqC3gqmY47Ings9HwPUEX0ZJQW5Nvh85pF4gQtJTFqVmHD8YjfyBsr+zd7sLX
	 rCP/gQQeLHXx+1M5pRmJ/05lHa/Q4qnShobypYZgIlgRwKLUPgv6vmYlW6Is3DMhDV
	 Jj4hnh8imw2uY3hRpypYmkX//gS5f5oftody7hS/y/faOQrqk9JUqtmHHwIrExuzqX
	 UyOPiSjJGvZYg==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v4 0/8] ASoC: mediatek: mt8186: Fix clock error
 handling
Message-Id: <178887689148.78527.9216488124284671038.b4-ty@b4>
Date: Tue, 08 Sep 2026 15:14:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lEUgOH/O9TJ8aaaKwHIpkEDMFvYaZ3as10UkVzac/3A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoEWeQes/jCku3Iq4D3H5LKd6gl8xKA3GdAEe/
 XlZjShb5niJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqBFngAKCRAk1otyXVSH
 0CkuB/wOoqeXC9FOIyndZtWhz5Qj4zD7zwwM/7nTG52Om90sRRJGh0Wubs8FAtPV2zv5lA5NiBf
 ofcjtN7pp35fsEmexC5PGYZ0NRHNY5eQR1rJE4aaTZVWiwLUrpdtiZNebxjeKCOF73goNfZnxTe
 7xjdm2dalX1Cs0HEVDjbaHoyw7YaO0vAch3jJ+H5J0AXrcVN9vL55Oo09BdKS+D9+zJhf0IhVlD
 HVIRpt7Lc7VMYorRse3fo9+MxGYB8PdrTvRpIW15wEJlREkn0kXLgguf9kq1lGWfXw94gk/gpK8
 /Fe0kdw6jJBQN1oFT5vlFg+xEEhWpvcsvXCtQ5PvhoW+GpbT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 03 Sep 2026 12:11:42 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8186: Fix clock error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series fixes several error handling issues in the mt8186 ASoC driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/8] ASoC: mediatek: mt8186: Fix APLL mux setting error handling
      https://git.kernel.org/broonie/sound/c/5ee5987fadf6
[2/8] ASoC: mediatek: mt8186: Fix clock handling in mux disable path
      https://git.kernel.org/broonie/sound/c/d70109f5510b
[3/8] ASoC: mediatek: mt8186: Fix AFE clock error handling
      https://git.kernel.org/broonie/sound/c/eb72060a1966
[4/8] ASoC: mediatek: mt8186: Fix APLL enable error handling
      https://git.kernel.org/broonie/sound/c/cb552c6b9abe
[5/8] ASoC: mediatek: mt8186: Fix MCK error handling
      https://git.kernel.org/broonie/sound/c/996469c1092e
[6/8] ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial failure
      https://git.kernel.org/broonie/sound/c/d87989ec1c2a
[7/8] ASoC: mediatek: mt8186: Handle regcache sync failure
      https://git.kernel.org/broonie/sound/c/0830625cacf9
[8/8] ASoC: mediatek: mt8186: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/5ca0b1c5e32a

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

