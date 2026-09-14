Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04899484232;
	Mon, 14 Sep 2026 18:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408989; cv=none; b=e520DCg0BzFdDkyivVhEnzI1g03Nz98vVaJXEVsNA+6Z0tFs94ZCsJyN7Q2PW/elPuzj6k80MPqqAJby6JfpVnUkaJtInE/71y2UJWYhaGpDCvyp9UVlagGXQcc66RBXv8wan3lnsuQDSfKC+RyGDodXQ5XvKmwYdkjByE7IrOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408989; c=relaxed/simple;
	bh=gc6093ALfXfKohBY3JVjs/GFaF93Ilz9ifq3CwiCWEo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lX0RhxZLLoOj66kT26n9HuDaY2xNpfC3y+La3geFzfWRdmfRieds+e78YkEBbQMM8ZJsbUpszjpUsp8ht330NcUAz1E8iBih3wIAvH7byidZPlYnj4Fk1YOG/TGlmYv4Kc2jB8Z/dAK2Pi6NKrYTgFcC4ZPivE+pikjbUxNMeL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZeVXqPh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZeVXqPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B5A1F000FF;
	Mon, 14 Sep 2026 18:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789408987;
	bh=J0e7lxESsd4vuyHG+6+WDdiSc9R3BrlrjSNIiyh280E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mZeVXqPh7Ctf2Zz9uG8HiQJNZbZ+0/UQPZA0uZuk2BRolbkWJejmBQaGepHgDes5t
	 X9s63hyp2ZlZ0UbHke6hmwOnUCVEq4waD+RIMNJJ6YSzYOBzyCLqMd8kLOfix4JbHy
	 9YHZK7Db2s3ptfPlDJWbJkvaoH2SgV4ubwoS4kD0SPjFKsj6Xi9XOVYzyi4mIV4EYn
	 hF4XUPJogExK/TB4bHNK+ZHxhwYzRtx6AwBGEtSxGmoZMW770bNyCfEDBtbCa+q+Gm
	 FKAXpJTgaUk9bB4xBBxB+MfPyIDDA4au+lufMTDyba3DyQ2Z3hDzPDEbh+JOWiva9N
	 OhauA62NtNxsg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260914131621.1461514-1-ckeepax@opensource.cirrus.com>
References: <20260914131621.1461514-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Remove redundant comment
Message-Id: <178939641900.1239410.7735775481055471366.b4-ty@b4>
Date: Mon, 14 Sep 2026 15:33:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gc6093ALfXfKohBY3JVjs/GFaF93Ilz9ifq3CwiCWEo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqDbVkvvDA/rMmaZrW8Hnh6i3nXte8+PNftzPu
 6Mt9bU4IiGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqg21QAKCRAk1otyXVSH
 0OLaB/99MjZIy5SmaM1tKHXqu4Nt+dvR8F8T8MQnABb6k6OrCrXHmVdt0+fYHZ5IXPeCY4OiCgu
 bNdj6B+xvaQHJnSz6UA0iO+UhcgKksyJP4iN3opWLJmgchH3bny0MVWpMuIGUTsILrAo+H0fN+Q
 X2vlY4WcZcmIMiYLcX6P4t6gGVdvBurg/ilhgZd3fqi16BIWKD2y7XwL000mNCQVq8iqy5reLfF
 V2zCik2iwvx3kkDzvJngzlicJ2flbPPbHL+cVkyvbXbkxs2jntR2bleKw338Q3dIcFYysYsXAH5
 f33MNtr5+/rkqOAudlSVtcwbR3rT6t+nmsZNdriG6WW8eVUR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 14 Sep 2026 14:16:21 +0100, Charles Keepax wrote:
> ASoC: SDCA: Remove redundant comment

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: SDCA: Remove redundant comment
      https://git.kernel.org/broonie/sound/c/4b49d276dba2

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

