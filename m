Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B952D513546
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060289; cv=none; b=ugGDOo4tkiD0vhCz8PcU/fXFzJNFMINPzwSyqs13hEiZg3A7WO7VJ/wVYSRA9ZvYuyK2Z6E0xPs3GNj5SXNBP7RJWw7wJELKaU+TqEyIMPE96Qxlxd+Wri98xRfRcmu+gyRxj7LJlz+VcDFKdzXArXq4lE1gPxhOemvI6jRUpm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060289; c=relaxed/simple;
	bh=4bF/zFcPZ+rge2e+q78qNspBsBmmrjazXqSGKV4CxYw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bSxdNXJah1tt7UuudpLpSrBNi51kdtUCQPApQeD1BBrA/hBex6AZFFCSrmY7qN2An2EHAy5zgk4dTp8R1muqyErEZJAuOVCPwj5+cVfWdQBpXOarzYuUv1WxP6L5GUO+Uzs8q5U9Rn+zB/IDahckLSt6O9xYiMDD4Us/Tvw4ySI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFh3yJab; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFh3yJab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CD31F000C4;
	Thu, 15 Oct 2026 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060288;
	bh=ZNM/BYGhfHnDKDA67q+sAabYWzpLx4cmmnoJmrbhFeY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hFh3yJabENhH3Y6vENYG3s9CyB1xltCW3IjjpUktyW6VQdlgvM0eT19ALwrjKL2X5
	 TDkZofaBdIx/THVC77HQQisFyNE3pE0Cz6SU1dPizf45bSkoKLhSCc6a4jftV9D8LQ
	 10efLaHbUqkF+vLqq3+xBc6nDxsvmv1iW64MqX0KwmTHx2eiHw6u1P84mlP1q6MSD3
	 YhBAqEF39IAMNdMmRzO8k8x5EqNGsMBZv+vS1udE16fUIkP1TOiXZaZS0RVO6dTQil
	 hodDpVAQk8mZ4MAWi042/Edr1RMCdigPZepNnYDEaTp7haN8vd7MUx424z4xssiOlK
	 1RsY+m9jirxvQ==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mingxuan Guo <gmx472@qq.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <tencent_B839C5A92D762B5717B9637A5CFA0841C608@qq.com>
References: <tencent_B839C5A92D762B5717B9637A5CFA0841C608@qq.com>
Subject: Re: [PATCH 1/2] firmware: cs_dsp: clear dsp->running on the
 cs_dsp_run() error path
Message-Id: <179190663311.42298.15437389949849983493.b4-ty@b4>
Date: Tue, 13 Oct 2026 16:50:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4bF/zFcPZ+rge2e+q78qNspBsBmmrjazXqSGKV4CxYw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurK6dsohlZviptYsiUj9uit5Y+8rJOuz4143LtvidV
 WXftdD9akcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAm0r6CkeFZa+KR5X6TFrT3
 vWl9k2XH28WSsOXUbt7LhmzzvSJP/1vNyLA5/dChHfP3Sh1MVPx+yEbpOZ/+2/KZuu5LVNb8cH4
 /PZUdAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 13 Oct 2026 18:23:58 +0800, Mingxuan Guo wrote:
> firmware: cs_dsp: clear dsp->running on the cs_dsp_run() error path

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] firmware: cs_dsp: clear dsp->running on the cs_dsp_run() error path
      https://git.kernel.org/broonie/misc/c/ad6be54d1349
[2/2] firmware: cs_dsp: add a KUnit test for the cs_dsp_run() error path
      https://git.kernel.org/broonie/misc/c/80b3f283e961

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

