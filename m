Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF6B49B20C;
	Tue,  1 Sep 2026 18:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286867; cv=none; b=euixfNU3H4aEm0Dp3rm9jHxPu+IwIEpG3EIig/K+G+FAMjljJiGL4D5+rSi3eOctVAIrnCmTQyOaTJJzjrOXwlxK/1LVaZmDvLbFYHrEZJi5zfVX0LlCQoSaCYruo3vw43rSjnm7wO7SHGY4tlOMPjdKmLvtdvgasLbz0vay49k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286867; c=relaxed/simple;
	bh=PYop6O4jzTFzfCZnEQzFA3IxqqFdJvzuAHYhl10/Aes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pq44rEw5lKrOI1ldfNsQ/DkMBDBbmPJPtkCrd5hN1K/Ptycr9pVtTa3ICqHIdbL7cL2vmCt/V8oB1Q2MY17plHVKLV1NEYGUNmqWFxyVMZe/M5kJf9JYOA5LE+lzaaJH+XvtMOhJvdLGrc9OB7gNSOUp7jrGFtNb96Y02zakvjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvBz0oqF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvBz0oqF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970461F000E9;
	Tue,  1 Sep 2026 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286866;
	bh=BJUSpYnEd4IwP+V5IP6M/vFWCsnjkduWhcKNQdjAHrQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TvBz0oqFF4MHXPhrkoiKRloiG7K7N/cA2CVcZSdjBEgdJOfDiBCsqvO361B4VTMvg
	 iGuNRV7LR4eA6hAgavD3BEDStWxAAKCJ5n+7v5asAa2Xk9bPaGmcA3GhB9A84iEcqX
	 q9+RJbRW39HOTDTa4Wm/ibsq1rbp535YR6Uo36xBBTj9fyBz4Psy0zJ4GNa7zi1Oux
	 gDuwwb8hcnFwrWCyVjcg903gEOm3/VFr5qyim3YO0O3fae3lYDgscxu8QQt5SghVoj
	 HhcahhvXcD0mmqzgKbHhtFs06thoUmkXiga11tdS+GImrnqV8XKOWsGIz+RAYra60s
	 +y8Fu8mFCurbA==
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
 phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260812085133.29658-1-phucduc.bui@gmail.com>
References: <20260812085133.29658-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/6] ASoC: samsung: Improve probe error handling
Message-Id: <178812799208.13461.5757086862285597178.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:13:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PYop6O4jzTFzfCZnEQzFA3IxqqFdJvzuAHYhl10/Aes=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxeOxouGJJKZMlsFBN7pWgi3Hu4C6SaZhV7T+
 mihjCE36qOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXjgAKCRAk1otyXVSH
 0AiaB/96mma5skmO7xVAFBqi16yA771le1LjcqipaWGMgurDfDSxqMSsVp3kkzAsdn5LOwOic2+
 SlQwFO0ZC8tMzK+s464EaEBd7WO2d+lwSr6BC+ix5kTUN4uQdboQcdR++/vdZ3wYRpTEOkQ/zWR
 A59QTVd9z9h1qfKMdEXoXKaYlz34KyLgPv2mcNkJIHkf2udQ4iGNP5o3J5yW/GhTXwRF+1DScqX
 GMXFt9sqpIl+WhcX4T//G00ORZAJn5uBmVfzvHC+PDHwC8aew7qn9zFEzjKK1O8XCXbPwRG95o3
 KF8ZuL2XVRGSGXi2hjMuNMjkvoVkhkN9fOuKfdCDo8GWlY46
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 12 Aug 2026 15:51:27 +0700, phucduc.bui@gmail.com wrote:
> ASoC: samsung: Improve probe error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves probe error handling in several Samsung ASoC
> drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/6] ASoC: samsung: aries_wm8994: Preserve gpiod_to_irq() error codes
      https://git.kernel.org/broonie/sound/c/bfaefd8aef4a
[2/6] ASoC: samsung: aries_wm8994: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/445c3c59affe
[3/6] ASoC: samsung: pcm: Use dev_err_probe() for error handling
      https://git.kernel.org/broonie/sound/c/87874c260c1a
[4/6] ASoC: samsung: pcm: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/961501768994
[5/6] ASoC: samsung: spdif: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/84234ee45fe2
[6/6] ASoC: samsung: tm2_wm5110: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/29b8bc168a25

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

