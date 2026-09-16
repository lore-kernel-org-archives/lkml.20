Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3104B497B70;
	Thu, 17 Sep 2026 20:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789676335; cv=none; b=aXYKYW2SB4HTX1DBjGJtNxuq8XTz89nM2PSZDwiUN6QW9nK61yVudU/CTAMDwqeZ9d0MDyUY0RnIVrggBDT6yNO4uaZzCSpBWjjoZHuDznVkouJl0tzPGlQvav83eKvPiqSnLzuqQCFpOXUwYMQUtOnyzHdYJ+74128Y4KyxWG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789676335; c=relaxed/simple;
	bh=uJNK0I97h9gVrkosOpxiaYhBCy0As5A5kdpQzUMMyjY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I/27DUUFC+XRs2BDk+QpvPzVCg4X/DK0GtiPJnP5+okPvd9//lJW0T3C9K7GbNVg4A5MmJ5hEpt++pHT08PTV+OstAcTuq4yQF+6jdIVDhAQN0kfbLH/XQciyU1BvW4y29XKc5xgxGYCL+69flHa8thHNWxh+hfWBPPsLI9p3rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOvS/iAg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOvS/iAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847861F000FF;
	Thu, 17 Sep 2026 20:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789676330;
	bh=NlQs6cwRma2zslsYMUF4XSyTQNtsNaJ2JmQpkbRtfKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YOvS/iAgLPvD6tvRZQ93q+JITHTRlWVUX9n+OUs6BhQFThl1Fj7XYlJ9BSgoNjzmd
	 98LYXI2uhYO8BUGhvpknd5WndzCgJ4Rix62wk15tggpF3VXObh2CvN/tO9QQOyR4Kd
	 Lo4gWxWMsTVTfMUC/wGFUXsZ2oFD+EL/313wr8RKxhihD+cAfLVTiRoo2ZTyUOrSrp
	 /gNwbKhN+eqh6G6/3DGkHL08u2REvRAhqqYBjNFIvuREKLVn0rFqojIakqtjkulGq+
	 r2byG7gYwbcvg4JeVUeqGvX32Qtu804xwnJX+Tbz7jIy9ORRPZ4os3QQ/JcMOhakOP
	 xcG+TsGM5g/hA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 =?utf-8?q?=C8=98tefan_Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260908170740.276800-1-stefanghetu9@gmail.com>
References: <20260908170740.276800-1-stefanghetu9@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic
 dump
Message-Id: <178959294173.414407.18136337790003534717.b4-ty@b4>
Date: Wed, 16 Sep 2026 22:09:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uJNK0I97h9gVrkosOpxiaYhBCy0As5A5kdpQzUMMyjY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrEslPB5dOiQY2fwqADJk4NjZiMoef7USZpJEf
 4wzGs9QpyiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqxLJQAKCRAk1otyXVSH
 0B3dB/9eBN31cG12Ll2AnoSUa10wV0kqpNtFR8cNav0jUnJUriUUTRv2dGKr410X8ycaGP0K2I5
 vtyjF6bfkmaeOkAfgnL8ksoztYBnKVT+t07G6L8JJmdvaLXLPUBdSOKB+YglB6b3p4/V8bDnDuB
 89RcGXEvBu1vMCSwxvIvlhqcEEpnggPLSKw+eDsRhlbK+Wztfya4oCf0aKLKNedtrFguUSeQWUP
 Hr3FPOX6UxCghVWt5mYeOVkL/3rQZKdAHdXqholouhkoaYVuuOTXYahWe8cAD40kZtDw/c+q2+S
 w2GsAc1gD1wue6A6szPwy4/pkVjMqSpqKNEvER5OaKreuLO1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 08 Sep 2026 20:07:40 +0300, Ștefan Ghețu wrote:
> ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
      https://git.kernel.org/broonie/sound/c/48ed992bfbe5

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

