Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4D530DD00;
	Fri, 16 Oct 2026 01:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112404; cv=none; b=OuxsiBOxRqksTFGPg0dWUzD+xiLLzdxQggGuUvqUpwjCqXyp8URiSlMdM40Cj7uLjwLzH5KDtQwArR2o9gkOOVtUbd0OhG5yOVFHDDTib+4pHfV+IWT7Mdcms4zah6VLBceSkB5vLkx8sKodZUwT5avnXnMK9vHGhbiXMsdJ8og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112404; c=relaxed/simple;
	bh=GZJWgHL0p/gKpcLynljN/RtNBIA1MrJMCcgfCw1xHMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kXkzckYTZdAlcQ594E7LHBEqnm5LomMCY1f9/tFu7iNSxojMYoRVO2rVhVUwwx3DZe9QwSWrkUmGeDPF8rO+ggKG0z6KDzuRiJdt0nBjUTiH61F1Dm8PpCE4bfG8YvGYnWg92s1GuE0wnB525K/p+bPbtOErMkP9XiO6DYuoeYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWARuxFt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWARuxFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20ED1F000C4;
	Fri, 16 Oct 2026 01:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792112402;
	bh=8WFY5x3GIKk6CIyzbdZ7YT4l0O+qh8HjQj9/9imWsvM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jWARuxFtNXoy3a6uXsIrHHr/BNe9LSfvAdj4CVhl0duyPiJ6F8L8w3UIM75AAA9qz
	 atZPkwJWSAQYM5R6piI/Ujr1OJUssyeDsEVFPohwNxM2DMGl6yHrEQ39Y6ID5SYVcS
	 ctjRc/5RqVqZKglGcDypu7RCGd7oETRRkkWURWGFUym3VW99ufdWdgz4n8qkjmhfZE
	 p2u2ZIzQMt286GqazfGSufDske4OhCgGwes918PMbrQ+C3L7Jc5KGk+WXu2ckd0pre
	 3de6JHNDW9bds3nC68A9ga3T2wlfuawrLp6Yn2JNiiGwXZyjIqvSmxXbjy6Obn1m/Y
	 08nLXw0wNx3PQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261015190240.729793-1-cezary.rojewski@intel.com>
References: <20261015190240.729793-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: avs: Fix for recovery procedure and
 new size-checks
Message-Id: <179209169408.134795.11112375187797385504.b4-ty@b4>
Date: Thu, 15 Oct 2026 20:14:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GZJWgHL0p/gKpcLynljN/RtNBIA1MrJMCcgfCw1xHMY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIulvPP+moy4TWz2vmGQ5pPviTWB3rOejH5iurhcMXVX
 35vPf/pZ0cpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmonqCkWHas/h8xX/lhsEr
 9wtNLEs3PRrlovfraY6gto6WYUCk525GhodK9r+ur7mrwvb1X8I2TY4dOwx5J5z4Em+bdH9D89G
 qA4wA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 15 Oct 2026 21:02:37 +0200, Cezary Rojewski wrote:
> ASoC: Intel: avs: Fix for recovery procedure and new size-checks
> 
> The first change addresses XRUN recovery for HDA-Link i.e.: BackEnd
> side of a HDAudio stream.
> 
> It is the BE side equivalent of job done previously for FE side only
> with commit cfca1637bc2b ("ASoC: Intel: avs: Unprepare a stream when
> XRUN occurs") and its follow up titled: ("ASoC: Intel: avs: Reset the
> stream unless it is already prepared") [1].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: Intel: avs: Unprepare a stream when recovery occurs
      https://git.kernel.org/broonie/sound/c/85bc213f96ac
[2/3] ASoC: Intel: avs: Verify sizes of configs coming from topology
      https://git.kernel.org/broonie/sound/c/6e6aedb1f876
[3/3] ASoC: Intel: avs: Prevent module info underflow
      https://git.kernel.org/broonie/sound/c/05c2975b4267

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

