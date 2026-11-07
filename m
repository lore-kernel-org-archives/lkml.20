Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145436;
	b=B1WNutiAQhlRUVbJJa4bPDZDfeS7zwGQQuJqRfkiMPGrNoA9HZI+XpMqnwqqYrfiRN0p
	 5y38eomqkS4jk19FJ0ztHPUKiRyR6gzA1Jhx20oIyz7pYomJiReSJkmqiEyqh2xYEFk96
	 44LgBdaJr3ODqXR15wVIFGkqw+QwgVznOIRereN8o8+rYHIgHGU0w8H8b86XZKrgP9YAj
	 42UYeQrrCKutvYH5N4xaVd3I0za/gqECtD4YKxl2T39QYH9T7EEiC/GvddQBjZ3mBQDfR
	 MkfKJHVyLoizwOjjd3ph2C0p/FKALy/IP1mqjFh0ISkcSYEHJ9OpZmVk54YSPKGHJ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145436;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=J8rQ2S7tI4nVEpVZlhu4LEATGN7xoWxfKuujXV/8V2A=;
	b=R0NihwWsopHWqHOacWxegamn3IooqvZ8+9e+FtMMBx5QHFdopeyKJ+a24AnnfC4vaN7t
	 JBQOtSokKeHkyu95axn/BxeA3IM94u4cQwbn/3WZxEY691c7/YJLdQ8K5phF5l1hfvpzV
	 /CcpzjtsVMyE25Im5TsyYA+J/UMyKiYgr87/UfTor6DxUBCJkXIMNmeocEhPg6A7Dx7cy
	 gI+x2CjWcJhLfRKaeE/HElChvEgm0I6klQ9srPpLhY15WvXH+e9d2y2yVZp0NC8x3zxhD
	 MBt0tPl2znVtvZ/xicMxQhtWXqBh+LQlNEy5bOLFr+ieBOZ40ORGyu3+bxEwik9dMHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=owBmbClG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD830606A332;
	Sun,  8 Nov 2026 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=owBmbClG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929BA1F008A5;
	Sun,  8 Nov 2026 13:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145435;
	bh=J8rQ2S7tI4nVEpVZlhu4LEATGN7xoWxfKuujXV/8V2A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=owBmbClGUEZ4e/KRX6S9IGZIv30NIXSbCmyjJx8rkADkMsbWumMt24t0kbF2Y44ci
	 cBDsUDvGNsYiejZSHgR0JoivOdIFZQtCZ1Kv4dE6O4lesKINlXzrMshWGbXSO2JUFn
	 rT0YHdfUfJu5VOfbW/NCE+QZA+0Re90qXdpdIsoC17Offlit/MpGM32xRTTdKwhw6G
	 KkJRqbxAzre5JTbTBSJYsfv97zhpoKasgrCGGFqmdrLX40ABqtSE6Y7yNcfUFs3TJr
	 ZLg74JdIiuU6lZulOJiFC8cLdfwOnfpqrWtwdnL664WoaS8Gg8x1Kaa93KKRAZ2ehw
	 YqBoaJIc/VHhA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 8C9D32C79279;
	Sun, 08 Nov 2026 13:43:52 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: bo liu <bo.liu@senarytech.com>, 
 "qianghua . wang" <qianghua.wang@senarytech.com>, 
 Aryan Sinha <sinha.aryan03@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104150155.33157-1-sinha.aryan03@gmail.com>
References: <20261104150155.33157-1-sinha.aryan03@gmail.com>
Subject: Re: [PATCH] ASoC: sn624x: use dev_err_probe() for the regmap
 failure
Message-Id: <179406701581.3424803.11771624607040385269.b4-ty@b4>
Date: Sat, 07 Nov 2026 15:56:55 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0L0nyRIesVnUPnpWBP3Q+3ZEfxWs7yFQmcko+ar/J10=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+1MywP8xnHJPe72wlaaq8qiq35tYj1rJqWWWj2Yomp
 aeT9iztKGVhEONikBVTZInL4n5ZX/J6Dd/BhW0wc1iZQIYwcHEKwET4LjEy3CuwmbGZ44lfo9vS
 Q/+nzJS7/ZKV93LQZT/jeOEq45/zlzH8r3//XqRpie36WwccJdct6hGq5xBe7/xnd3/DryfXvwa
 r8QIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 20:31:54 +0530, Aryan Sinha wrote:
> ASoC: sn624x: use dev_err_probe() for the regmap failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sn624x: use dev_err_probe() for the regmap failure
      https://git.kernel.org/broonie/sound/c/9d12f5640132

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

