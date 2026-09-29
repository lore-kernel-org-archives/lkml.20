Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B4C2459E1;
	Tue, 29 Sep 2026 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690822; cv=none; b=eo6NhK6veU85F8kCc540JVYrF/aiuTt0F0RCYAOAIGYqvmVkKRT4JPzRH9UMGK9nF4Ve3TEu5VWnrV+Q5D0Xzh776InsZsSlu+NpPX/XQZu51QjSp+68S+C82HA1KeOQ01FEhj/bNEpzd7I1Vjf8DVG5Nx4h/97Kmw8FgsDcMSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690822; c=relaxed/simple;
	bh=Ip4O8dPfKqqkKvXTothHDb73+PwCMcXR12MPjksW9R0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UCsaKwAQ00Rl/XlD30PbrAlBj+0YKTRxgtSDY4g9RdbhlWhwGcuyXGmeh3QZtp7VScb9Beqp359NI5gWw4KN+qmsrfiUcLHwH+iB/bWXOKyHHlo/AahyDXHuvlcDUr8uNP+STZTka9pCs+S9l6ii1oFtK3bLnimLVixmkzDPyAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbQyZOMu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbQyZOMu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66221F000FF;
	Tue, 29 Sep 2026 14:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790690820;
	bh=Ba8f6gRjRq9tpWGBph3YzglsN9Dz9/NS6dfi9lIGet4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BbQyZOMuvdRMZ5nN8wq+ZtJnxeP8pnXwIGhHBFHWXF3FH3b3woRKSoar1sv+C72RL
	 +ZBDPpGRgjuI9z0XUmxnOnSOfw4u50EsDPhtRuaHsZag8n317C5j2sMkl2TCnMwrBc
	 1Qn0x3IFJN6WtA4N3oaf1Kq5zC9fnlZW/ph0cnV39hAmgQLajlExHByiCYbaTSdQ3g
	 GyGIW1YSkbEHloFtlWmywFBB8RsD9KtpDAA+jLc1QGdPwskAvaKurTmS05wny4dLZP
	 jqClrxv+/VrYSkSuJbv/fKha67J/7Zrx8Cfg0dJ8ZtTipmu2u6xxBPyMU7xTj/LO7V
	 3rYE1Yj7IRmKw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/7] ASoC: Qualcomm Tambora (WCD9378) SDCA codec
Message-Id: <179068269892.115027.1694143645211766068.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:51:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ip4O8dPfKqqkKvXTothHDb73+PwCMcXR12MPjksW9R0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqu8X/1L4CGaQhkRJTdN0kBs4wB6oKgzaJ9kpLR
 JzK/qVW83KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarvF/wAKCRAk1otyXVSH
 0HFwB/4nTfABxLvIscFU8hvGxFWLY1zlgYV5ZOe5AY6eQbdY/GtKGC3C2g1f6ij5Bae6UqYYYEU
 /nWdaXBp+7qdUMeVr9LNQAMWUIdyOAGdrNKXdu7ALF6vuwblobRYkPXOfgu2EEhivjGqFc/Sz+c
 CWNIAMISs4H1Y1YOQPCWyHLKKikLVblb8dMduFPDwZJRkZEOiSsQOvh1UAJLmAqHaUd7zahlDhz
 +a5oHqfoe7kVtnOdmqO7hzLLDReaJ+4d2aCz7ynNfW3hFgLTVOObJZykAVr0b4AWOUFidcHxV9F
 8VAj53IZUYjZJNKlD8so6jGHDb2GT8Z8vmXucDP3Fg8sIwws
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 25 Sep 2026 17:10:41 +0100, Srinivas Kandagatla wrote:
> ASoC: Qualcomm Tambora (WCD9378) SDCA codec
> 
> Add support for the Qualcomm Tambora (WCD9378) headset codec in
> SDCA-compliant mode over SoundWire. On ARM/DT platforms without
> ACPI/DisCo firmware, the SDCA topology and SoundWire port properties
> are supplied as static data through the codec driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/7] ASoC: SDCA: allow building without ACPI
      https://git.kernel.org/broonie/sound/c/677507a5303a
[2/7] ASoC: SDCA: export PM helpers keyed on sdca_class_drv
      https://git.kernel.org/broonie/sound/c/0985313a2a9d
[3/7] ASoC: SDCA: expose class SoundWire probe/remove as library
      https://git.kernel.org/broonie/sound/c/a60f1ac41fe0
[4/7] ASoC: SDCA: add class_ops with populate_function
      https://git.kernel.org/broonie/sound/c/3273ec3e149a
[5/7] ASoC: SDCA: class_function: xlate sound-dai cell by entity index
      https://git.kernel.org/broonie/sound/c/e0e876c99f28
[6/7] ASoC: dt-bindings: qcom: add Tambora WCD9378 SDCA codec
      https://git.kernel.org/broonie/sound/c/a36d24da5cf9
[7/7] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec
      https://git.kernel.org/broonie/sound/c/0c30b8ca84ae

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

