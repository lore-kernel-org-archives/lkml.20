Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E662E2DD2;
	Fri, 16 Oct 2026 14:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160625; cv=none; b=VZEdvhM+/bXTPWMgInHhPQ+ExJM8CUWEcqFR1Xe6/t+kblWv4P29srXyuAGAWtdUeg3a9vvNbziHlEI3d1JOC2//iPvrVO6vUwauP8LkW+pHQ/IWEZMEAQW6AORNkJva2yla+BxMldHGZwNaoHYKS/2s7PhovcK24xZsYgnABvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160625; c=relaxed/simple;
	bh=7X8OalrBc68zEjZExuC76PUtg89emkb6GZN7sdIN7q4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f3p7HLIKbS2G9WB0Pea6z3+NpcBk/K0xFwNyECIuuBhYRe/jKsV62iPMHlZh6AMZxGWdFe3qM3AfiMj3LmwyY0FIsmRFTvsguZNkeLrSM88oiMS1ADcDUOC0s+JAiSxkUnoPGIiHSHjla7DXX42bASkj2wjpG9/KKsDg/nge7dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LePmss0P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LePmss0P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613421F000C5;
	Fri, 16 Oct 2026 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792160624;
	bh=KHjwnjbwx//SMU5EwDy6GyArDRyoLzGnzG4fP86HHUs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LePmss0PaYl0zLlZKZBaJiNitU3wqhosghf06QnHMHOGBA2doF9u0ocY0SraXoYnn
	 8oXwASilEWh3ZPOud8QSmU+vKWkHURGgvqoy1kojdoIZGSJMV/TYJET2y/kb+bvRqH
	 bp4dAB9Hk9Mmccji97+5YlO37pt5zVS7xX+44JCvj54z98psAgTpO7BAmIbAPL+7Tf
	 g0wt2Yl2Ye3Clc2ezBlUGS+9K7SsWWQx1EBF2WgLT2BLUvwONQwI/yIR+ihF0T1+8S
	 JL/LziiQ2438TcKU41Iu8MILPtd2U7NktiM5hoXHz4dxqEdQxPIJ+2rp7Tge7x16Zd
	 lojfnxgj5K5fg==
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: szymon785@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261016124030.664895-1-zhangheng@kylinos.cn>
References: <20261016124030.664895-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for MSI Alpha 17 C7VF
Message-Id: <179215548681.2297680.6431587300762158533.b4-ty@b4>
Date: Fri, 16 Oct 2026 13:58:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Fri, 16 Oct 2026 20:40:30 +0800, Zhang Heng wrote:
> ASoC: amd: yc: Add DMI quirk for MSI Alpha 17 C7VF

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for MSI Alpha 17 C7VF
      https://git.kernel.org/broonie/sound/c/fcea06d4598e

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

