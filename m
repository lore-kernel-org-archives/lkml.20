Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441A3414A20;
	Mon, 12 Oct 2026 19:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791834906; cv=none; b=iekOCveQKyRg79rwzlf0gjUcobPNXAwY85OSPNYjpfhUH44isXjdMBoquJJLRCwTeuxkW7Nyc01xdXWN5XA/1fOZ3tRSo2miQEyJz5Bj4vbWN01fHwXbcDcrqFWUY9fFJLC2mniTqX/xLjgUYHkO5n+GUdvXJyiRhO1HI6yFFQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791834906; c=relaxed/simple;
	bh=hKabUSMeZzEX5ziqGtS0VVRHl6Ub4n/lZZFGVodH5JU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nvA+MFHMOZpIPvuXScMoVaPteZNgvZXzqseB68a7PSpcODgFiEX9P6Eef2ICX22wSl4Z5xui1mo4eW/r96ZSq3hZKaZwqxbdk/g4XfFKv7uvhlaIKag3YZrGWYC9GbgtRxFHcFF3LLb0vZTsS1UizZti17Z5wK9wPzUO6IDe888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mh9tr7pu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mh9tr7pu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7FF1F0089B;
	Mon, 12 Oct 2026 19:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791834904;
	bh=c3pG0ShzXJZepq1HlRC7Cl7P9m7AmsXDtJtRIr5znpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Mh9tr7pu7h5Bhz5VXf3xQBdeib58Hu3d9kpmbvTuVYooMDsgcjQvKEXG1x/e0CYi/
	 /00cXQ8fSdm9OJPtCBxvrfnC5F4maCAiOJyEklqyCs7O0pulD3s4DwKUxCHCxstP3+
	 ZA5QXfT68X6Ya28h3ESqFzEV7cVqqRgqy10NVFkRM3uiL1OycJEOaquSGjQEg0hqPw
	 yFHVUripHzUENah9kNGDDjJHWMQ8rG5my4Md1SjWVBKXMqvqxUtA3GBy6Iy/UJxpsN
	 fAijnFtVbBBOve/unPhSsOB+bSaxMhSI08lanUKiJKlVYyQWDI5XMAeXMJi+kJYe2j
	 uK836ZJvC4RcA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Sergey Tiraspolsky <stiraspo@gmail.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261010103753.16969-1-stiraspo@gmail.com>
References: <20261010103753.16969-1-stiraspo@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Reset the stream unless it is
 already prepared
Message-Id: <179182811090.390394.9718829794059346472.b4-ty@b4>
Date: Mon, 12 Oct 2026 19:01:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hKabUSMeZzEX5ziqGtS0VVRHl6Ub4n/lZZFGVodH5JU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOWoumRWsbJh769aT1VfKhUzxsL5W+yHI9/7dzltfd7
 T7paYV/O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjAR/4cM/yMuPc1Y9C34Avv+
 5ZLr8qVsfFTZ3kkfFt6UKP2743XFxyuMDB2XL39KX7/uwiHN4lbnfVLNccfZDCZIqP3KrbAuNJx
 xjQcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 10 Oct 2026 03:37:53 -0700, Sergey Tiraspolsky wrote:
> ASoC: Intel: avs: Reset the stream unless it is already prepared

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: Intel: avs: Reset the stream unless it is already prepared
      https://git.kernel.org/broonie/misc/c/f6be9f558a83

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

