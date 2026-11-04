Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793838894;
	b=L4DTfTphroH6x2mhVcvnDsj3LMun4S8Xuwpz3fybFuuRYQ3zXpS/9Jx59L8eNJCgI6nL
	 gkjXsL4aja/5qP4OhB67vMWBxqIAJixMSEFl0QjLood0eGr53Ol/ZKYgIwCMRSHsPdwzL
	 HQ+gFX0NhrN/rlU6RqYkUQ0J/9YUw5k0H/MLGydHT1vd4LMJeRA3GKRTwuTgu6pLZAa+9
	 0pUka9IzjmjpNMYuAJJFeGvOHq8dpOOieVLvV0lGPKBPPNnupKH7W00gQgkMgTf3V/9Si
	 j71BxCaMXDXCoNgDX/QyboiclCnIm1BN2BgyxcgWHGWeobpUF4MC3H6ciORSQRfZEAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838894;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=1hNeofC6CYWxQvsjGCSYjmci92xlsWhOuFkDA76tl0o=;
	b=kc9k98u6gff2cRo9sxLur2QHtHYoTYL+1ZYV1xdnPlofazbtLGAoUlIh4GKO7lDPirpJ
	 ktZBh2fWSKH1nN1u9+2dZmkLsoWRdkvmWroGMyeYFaNBl4AAmXDqxLgda1O6D6NAAmnCl
	 6G4KzhN9v8MTDpmQcWLOIgxs68TZXcSXPUjihjn1m0Ywj96wBpKz9T5V68/mQUP//g3Eb
	 1gdQ4Uba5Dz/W3AJ/jB+QOCJeik1HyRpKIGyZbehyvYzwEnGYtNHXGWYha2hLWK5jnFO3
	 GD2kBc8U71qURXFhUKXrTSRzY6UhK7COVCRNIBwKVQONM2xti4RKg16dJZsb3N8cekQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TnSmeitP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30342606A31B;
	Thu,  5 Nov 2026 00:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TnSmeitP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2B91F000C1;
	Thu,  5 Nov 2026 00:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793838893;
	bh=1hNeofC6CYWxQvsjGCSYjmci92xlsWhOuFkDA76tl0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TnSmeitPUF6orFBe0OkfoNDbLhP/Yb3hlXS7e2ay/aKrnnJ0Xtb9WFiPwZ6tKatU6
	 ox3qQpdXCn5minUg84P1/p8vx023x22sCTSUQdQ43iGl9MgKdW2DKqro0I6P2fUw16
	 5SmrOhiV61Jzl0hrpF5NYFbkBb529gD0LCvaooKNu9tvLsbtbEM3xQ2roQCGo1wxwh
	 T7zeAn49prnvxDP0754q6GyXF1z1z1ShoJi3/oyoQwzBg/3Czk6QUqCxKgIOLwzXOV
	 snQbgyhXklwxBnR73bYwS5hwWL/ZCjGqdcjPwFH5uwxPl64gA7YnzlPACfUKcvmoLa
	 S4ozk5GEewmvg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9CEBA26DF5D8;
	Thu, 05 Nov 2026 00:34:51 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261104133322.1085061-1-rf@opensource.cirrus.com>
References: <20261104133322.1085061-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Prevent negative string length in
 wm_adsp_control_add()
Message-Id: <179382078808.2456854.1438608478800868665.b4-ty@b4>
Date: Wed, 04 Nov 2026 19:33:08 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6c5BgDfBvCzuLkMhi6liTwHOkvTKv2XER678wtE6eSY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJen9d2arr7/tsXN1EJpelXApecubVZ85P4qkX2j8xkX
 nC7ztg9uaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQAT6bzHyLDc6vgThRfT9J86
 z1+ZpG1/K1inPcI4orh2v25IaPqf/c8YGR4taLuV91RWsFGmLadq/o4VH56WLDr6aceeypjdiUV
 Z57kB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 13:33:22 +0000, Richard Fitzgerald wrote:
> ASoC: wm_adsp: Prevent negative string length in wm_adsp_control_add()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: wm_adsp: Prevent negative string length in wm_adsp_control_add()
      https://git.kernel.org/broonie/sound/c/4d07af76ca41

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

