Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993C849EC77;
	Mon, 28 Sep 2026 15:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608868; cv=none; b=athOXBPH7lbLl7761UIVVT4X1d7kF8ecB27H5rqyBjnsAET5kOk5i19UD62PgXsn8fc/+gWgJ2rCfLFxNK3wdeBdL0Yw+EAHFwo/LTZs0gzq9eGO9rnipnagSrL2/PXr4BYYg04IMno4DKf36kynFhw4HKcWd/OIYLA07tbkR5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608868; c=relaxed/simple;
	bh=0aQ5u8Ov2JLtGuEXwA+dyKKJ1qL1E4Qz7Ycwc1XSFp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rvfOsU+hK4BsasQOBQznKzRuzvQIpuDpV6I8L7na3utacroLEdvKicQKADwe4xQpmh3BFfZYd/w8ot2wYq5/20S68JUZ2cEz8z1w1LyBX2ciZ1BnkPRaVvHd4ycTtINM7VYDgYhfttVeIrD3I2raniNGuHhrEqdDEi5VuaKOqKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpoEWH8e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpoEWH8e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71281F000FF;
	Mon, 28 Sep 2026 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790608867;
	bh=dWD2qtdFlsNDT4Nr7cHISMWIU44LEohxuzldup8NdIs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dpoEWH8eZRwEJykNxRmuSRfcONwM1QnpugixUo6zWhk5QRKOZJwUrBKp/M6IdzirM
	 ETGkxOEmbQjxWapCE6OPXcssQAXVLtIrHjAj7P3nYlJyb6GWnWwLoiOI/IdQeKfkiO
	 TPA3se/hcI+wC7WHMpFw08DBZ1HhcHJkoeYj97eGbmSedmPyMgLGkiqk9lo0vkrPtu
	 C/5hl4soOWnHZOIHwrY/BFVru2anOv5fWILeM8gLtSY1MlWvHkjJjH60OxUg2MHCoW
	 3xWvVc1UxTJlnegSnZwpef54ZxPEOwxmptNQii4q/0SagUAYMDve6VQ6iWn6g7jz0+
	 q3YNMbRdWh9hg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260928105610.242687-1-ckeepax@opensource.cirrus.com>
References: <20260928105610.242687-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: Add quirk to block match table for Lenovo
 Yoga Slim 7
Message-Id: <179060199739.139547.9316430290612675939.b4-ty@b4>
Date: Mon, 28 Sep 2026 14:26:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0aQ5u8Ov2JLtGuEXwA+dyKKJ1qL1E4Qz7Ycwc1XSFp8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBquoXfzpKQBCzeM4B9sUaWT476mdA+nMfPnl8y0
 J7dtjW7wcqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarqF3wAKCRAk1otyXVSH
 0LO2B/0RpVOKN4pQRIZNelqm5bRq3/DrPnpsE6n0fbp5P/VXqLJRLxoXma4tKIlth9502D4/NI1
 kREBOUrrf2Epk5VuNNgwRG3cm9QqlzeHiW7TLnZtGEbIKM9Tyo2XRd1n5LrFXyFU1grv7I/E7Yb
 i91JUEQRJy9O7lal3bt8NFxMKUHtfFws+uzngNW4QF6v+CiQZ3+aCofJh7s+e5y2Ukp2p4RDlrf
 2tXM5MXobxnZ9IBPjBooItSZKNUlZgacLiG9i/r6ESQmWIza4HlZCfhrM4LzBfDhn7bDnnL+WHM
 fVYtREr5jUqXi6EwtPme3BBvXSvbAhMDDMIoBYXJgj3tkzuV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 28 Sep 2026 11:56:10 +0100, Charles Keepax wrote:
> ASoC: Intel: Add quirk to block match table for Lenovo Yoga Slim 7

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: Intel: Add quirk to block match table for Lenovo Yoga Slim 7
      https://git.kernel.org/broonie/sound/c/c26d18964a93

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

