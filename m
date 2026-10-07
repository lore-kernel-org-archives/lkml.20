Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA21E3D4126;
	Thu,  8 Oct 2026 07:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443921; cv=none; b=AfJWK+OMNYsXZdiUkcSYQ1ik692NM9FQqPGZeOzAlk3dK+kc8n3ylxUOxblYynVnYb28BZr57nr8q9ukqoC0HZ2Q8sOPrQHMW5SMMX9G/S+2X3nxwChMbb4xJVIYFLhjO8/ryd/qOgoFQpRv8EQ48TQkuNS5X6M0smrukMqqmjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443921; c=relaxed/simple;
	bh=ewOrkXq+bRrRDu4Os3t+fofh63NLyEAcQqs+crabOPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YeFD09zprFDKLhhXhjWUsusA5DG6x9PVIJzvfUd5yC4eDCfTIOiMdoPv4vQrqSFp+L2rhEmrACGCKb/SF1DTchq4afSpbqxzM8/swjGlSDO3B1zenZMBF0TMsQSZs9jeEscLj8OoFMJTMP2L5QKFdWwTuBjRHtMc0zJijAlF8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kC/60pwd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kC/60pwd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743981F000FF;
	Thu,  8 Oct 2026 07:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443919;
	bh=8+E9PpSt30DONVGdXRDcCFh8gVJfGqofFixgdMEE1W4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kC/60pwdbWi1cPSoq42bI8r5T63qbWxifDyeQrYYqOtCUkxQ8+WzWKTOnrYcEFAZF
	 UvC8Qah/yQCfbyr+5sSzOMofK8Kf1uMQE1tG0Q1/yC+UE0lrpsd7tSw4MsosYKpBy/
	 qUZldWdRwyELOpu06w35/FQ8pVX8bySjSGzxI/tUFaJ5Aqd+L2I0QfRnkpHDlcYhmT
	 o5HqellicQdxUn5BeFWIGEVrW+3GeBMUCH0a5m0sR3eShJ8igmxyjJ4yWHcpbDnFSt
	 pSss0r4xQpT6YBZy+0LEGbgPSbPomsMBuaSrZl84apGBXynEd3+Y+A0ylKpzwh9SA2
	 MWwZvrB6LzWbA==
From: Mark Brown <broonie@kernel.org>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yauhen Kharuzhy <jekhor@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925135915.338670-1-mauriziocasciano7@gmail.com>
References: <20260925135915.338670-1-mauriziocasciano7@gmail.com>
Subject: Re: [PATCH v9 0/2] ASoC: Intel: Add Yoga Book RT5677 support
Message-Id: <179138829586.2423942.18161759839325954291.b4-ty@b4>
Date: Wed, 07 Oct 2026 17:51:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ewOrkXq+bRrRDu4Os3t+fofh63NLyEAcQqs+crabOPA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0PJtREz5y/BlIXj3OUoflWYD9Yo2lmZP91SF
 XFXpQlEe0eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdDyQAKCRAk1otyXVSH
 0H4iB/0WKVU+KlwwgfqVeqDuA5GN4WVmugwIBYO7s9+w9Q1EcmqffiP2oHHdGpVE/Tc4Ya0Xuq8
 kHmSHtMpSYHouC3EvYdLRPgC3g/wbwBAsf48et4wEuOQCaLSmRf8pCx0VH9Gr1awQbc6ZXGVtts
 xJj5xVwi6vV37faKKOKyyyBkFI8hfR4fmVyTkP9CHpSEs834HMDx83TlrOzcNXNRCjpZHSbbnIG
 +IqOUfqYEaKpsAKL0raqqVzs649Z/2llytFhA8Inr/BibkbtgaUZDbwaLYKtkTgWcNw7oKub7gd
 MPT8V+TAfY1Zq1I6YlgE+4/oQx75hyZsjspb99kKl6dSVGHV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 25 Sep 2026 15:59:13 +0200, Maurizio Casciano wrote:
> ASoC: Intel: Add Yoga Book RT5677 support
> 
> Hi,
> 
> This series adds the Cherry Trail machine driver and machine-table entry
> needed by the Lenovo Yoga Book YB1-X91F/L with its RT5677 codec and
> TS3A227E headset detector.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: Intel: Add Cherry Trail RT5677 machine driver
      https://git.kernel.org/broonie/sound/c/5a0c90cb911c
[2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
      https://git.kernel.org/broonie/sound/c/a0448ff85187

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

