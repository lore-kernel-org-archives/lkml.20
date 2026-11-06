Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990367;
	b=SVBMYWny4rKH8bsM9e1DIDkhI99gZgPXOtK4Q3vxE/T9tBzBPgh1XY2nhPb1fFC+AHMT
	 U3L2CkZGIAWxnHG4r8J4Utch82xgpnUP1v5tPSHzKssgvHEATLL8OOlV1Zj2vFV4ygwLy
	 nxjGW9GWsPk1Q1YNjYAMHZmqiDzOHoT2QRfGTMU9BATQHxyNgfrx/mV3VT3ccrcpOPYr1
	 oF5CStFg4BH+OsLkBDvIwxwmmezSW6MXZVSMefTnoxx/4nH+NidIIqvlXtc8zRZi6NR58
	 fSlH8MHaKpUuVUAjimHpz6FY4MUzWDvECL0BPeZ3jeGeQucN6fT5qV4WlnWqebzttlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990367;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=SzB/Goin6CQN8ifsWQhlAwE/7CHwtvqkmkoWnFxlPeA=;
	b=hh8/dCAJbhhY+mf93Zr4LS/IvCXdY0CWI1HK96C8WnDONVkTdmqWhMIk9uii4N5rpC3l
	 CMG9Z/OQxOKR4lrOHd4vr56/+tT4PeyRMKrzwx2k3IFmMcgQxyVVo6xUtfA9kFmDb+fPj
	 E9ijcNXYRKg/LCfyoyqJocpeJN7VKq0r1YapiPE0gD46p7JB0B2vZ3jEnzI1MqzRSnpGc
	 p5Fha0sk/FtwyQQQ2Egj02YQMo0mcg2UQwBoa2GgZgqOYL46CFtSLd3cGWvUN2qiy0GG+
	 l97RZNQZjwJbigsaw3iql0KWrwopWUWOshs6tzpDDEtvaKtBBsmHJVpHv0kPFRPznGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QjkSReQJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B866606A337;
	Fri,  6 Nov 2026 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QjkSReQJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC0F1F008A3;
	Fri,  6 Nov 2026 18:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990367;
	bh=SzB/Goin6CQN8ifsWQhlAwE/7CHwtvqkmkoWnFxlPeA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QjkSReQJFbv+AhGc1PN2vlk5/L7boTeeQPKaHLQdIHBsCNSe9b6XrTzf0uO6DKZ20
	 F8KIwv/3ezYgdDbTsRarFieDo4UOP4pdedtO+VAKT3RepYSEd+sUS2m9GvJLoFI1hm
	 jXna3jyragfMfYz1n5cNdm37zk0RArmg51la365/pLjDoQBxST7k9s0Z+DB7fEnSy5
	 hTuhO/qVz0pJ73+LYI4LobuYCEVI6Uj4ahbpU0sfanlGA5RxzoqDyo9XIb+Zj3sexp
	 6qcEe/yEaj5vpsDMKe18qeLqtg8IXtKZOuVdH/YS5NBEWOap26IGnzsVzfzCa/tHzv
	 Y0szvJciX+xVg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 8A94428D102B;
	Fri, 06 Nov 2026 18:39:25 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104082000.1230-1-tangbin@cmss.chinamobile.com>
References: <20261104082000.1230-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: pcm512x: fix SCLK/supplies leak on resume
 failure
Message-Id: <179397657386.3231166.13598556063729368946.b4-ty@b4>
Date: Fri, 06 Nov 2026 14:49:33 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=STsR5ZxMFYxjC9zKlZon0WE0Y1ZFF+dDU1ApKxjPEV0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeyd29HvdOmdPd3mTGPo+zjvsv+5/jYtDmXr5TMXDDf
 Nvk2BdGHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiI82JGhr3p0jcv8douOiPA
 7nry4jd316AooR9XT1iEh27Ojm/drcnIMMl1B8dyY+WpLhVZ92u4vzU/fyZoI7BglZT17qMFnLO
 tGQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 16:20:00 +0800, Tang Bin wrote:
> ASoC: pcm512x: fix SCLK/supplies leak on resume failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: pcm512x: fix SCLK/supplies leak on resume failure
      https://git.kernel.org/broonie/sound/c/0b6513cb5b7c

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

