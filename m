Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2F92E888A;
	Sat, 19 Sep 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789809408; cv=none; b=t4qJV5zMRY8VMAq2AjG2o1TqAs63Bfr55Q+BtOgEeZano0KvjER/CSdC89z9SwBa5z3f8yWnuQftL57gTfWbbxa1R+ycJ2iCmFcC/x3rOohEcxOaiY3Qw9cM/n/kbyS5hZ7kJPMGisSWFZVkrJQonDKuECnY1sk46qDnSIeV/1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789809408; c=relaxed/simple;
	bh=jt9VtQwbyOGQ+PL9s8wTrMgvNOfgIkxlvQU7cFQBXIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zk/woN7XhpjC+b8vCgqlRDzGRthzgWldv1MPUmTivV8+KcmHD83JwRO5q8fBblx4iuRzNyH9l1BjZUecTmfzhnG6tFEI8KwI2lhAGGgU2/2R2AtzDtB9GPlxqJvXs5ADzfKDU9EbN2WeTogJjiy+wwVkvpfyWlYtACwQ2LxK2RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrZJlnpt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrZJlnpt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740DF1F00898;
	Sat, 19 Sep 2026 09:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789809407;
	bh=4Py1+GgfuEnxk9UkTp+lp/VRKiZSQ9m4yRbBLVPlpb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SrZJlnpt83mg0MZ/YbXrfGEP6A9UQTjRuRz5/7hIMl2fzZ4VsSLMkUvuP4h+pBKlP
	 XHof2KTkCIXvPJ1zz8Jl9ABmmAIJmUT6AZh7nY/RWiHFCvLuPHagY/6I8FQo9Ivbnv
	 1xy2foa92/qIDjUzcj+se55/tWNHtJhX3Fo7ks/S9v4amOXVw77eTngti+n0qsrtCb
	 62ai6FBurxlnDyBzSiam3Tt79FhZZVrVKxfbAD6kpQaj/zSn3e9kjAu5MRPZQIz6iO
	 +47EI0/jmI2MfW4WocIYrGArMDg4kMzzqB2SMK0YdUfpaikQ248s4UaIsotoVxQ65y
	 J3M7I4Uae5KJA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
 Karl Asseily <karl@asseily.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260918182317.143223-1-karl@asseily.com>
References: <20260918182317.143223-1-karl@asseily.com>
Subject: Re: [PATCH v4 0/4] ASoC: add ESS Technology ES9039Q2M codec driver
Message-Id: <178976645820.1863384.17210158696737260030.b4-ty@b4>
Date: Fri, 18 Sep 2026 23:20:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Fri, 18 Sep 2026 21:23:13 +0300, Karl Asseily wrote:
> ASoC: add ESS Technology ES9039Q2M codec driver
> 
> This series adds support for the ESS Technology ES9039Q2M, a 32-bit
> two-channel audio DAC with an asynchronous sample rate converter,
> controlled over I2C. The part also has a hardware mode strapped by
> HW0/HW1/HW2 with no control bus at all; this driver implements the
> software mode that MODE = GND selects.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] dt-bindings: vendor-prefixes: add ESS Technology
      https://git.kernel.org/broonie/sound/c/beb56d1d3de5
[2/4] ASoC: dt-bindings: add ESS Technology ES9039Q2M
      https://git.kernel.org/broonie/sound/c/ab1a02163fcd
[3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver
      https://git.kernel.org/broonie/sound/c/004e260a5475
[4/4] MAINTAINERS: add entry for the ES9039Q2M codec driver
      https://git.kernel.org/broonie/sound/c/10d321c76b1e

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

