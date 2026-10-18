Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939362ECD3A;
	Sun, 18 Oct 2026 20:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792356181; cv=none; b=kbCeFTyUK+lDbNjCLqFqsdb04wQse3+xesg53NZVic3lU0z/5eD5e1d4Uqld8sdqZ2skclMPL+BA/2uryHq9KMr+QCFBZkcQzrhO3qOBVFBwO+HQUsR5NahMBnkDVn9X315Mby+BXkYLD8VinEVfyDSU3UZeFsoUDyCNrE9qMIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792356181; c=relaxed/simple;
	bh=B9OeQ8S/rwH39Ce2nzAaPu1FyCJAkeWHkfiPnBfuavA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uaIOSHzLjN343FLfwhm9n4pbE9fK/rcb/oTE2pockaKhabAe0WhVS//4/8dK+kba1hzmYltvLI2WyyZHyvNohhC6KQHHw4dSZr/yLqVY5j7TjfGfqjheAWHh6vRUaVByN3B5xGknbgHNzElZJvyZbEulG6etx8jkRx3zBYOBNEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ww73r2d9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ww73r2d9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7919C1F000C4;
	Sun, 18 Oct 2026 20:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792356180;
	bh=TmhQnTrv6ywRMNtTfAMi3vCSYV96W28WmyeQgUgJt6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ww73r2d9+rkxrtTKd63zBItGhHtahud5XwnemhipjSjQosg/Q1YK5AaOiqOWmGLny
	 DkgPP4vvjDsUdREL4FQtTWULTQOaMsmaUrgerGGO+9ge3LuyXtJprayE2B/4rGWBjl
	 18Zvss0Z0a0BNFxu+SnyPdcFsYK7T/viCXn4VQ6tRS9mQs4Ba+WXSIp4VxAD3AIaWx
	 K/8hOpJdpVqGeUDOTtoC1CHPq0myTEgroic0UOI7oaLk5pOUWJd3NCDCH3U+n25bXo
	 3Y2QwvLkUbQVEvB4RdnzBPSb557474iGhIUsp1kQ1EXQG9SkXk+puh74rd3zUMacug
	 tl6d5IFTD0RPw==
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: lgirdwood@gmail.com, shenghao-ding@ti.com, kevin-lu@ti.com, 
 baojun.xu@ti.com, sen@ti.com, marex@denx.de, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1792135145.git.sammiee5311@gmail.com>
References: <cover.1792135145.git.sammiee5311@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: codecs: Fix more control definitions that
 write another control's bits
Message-Id: <179232618522.3162228.13619131350262429905.b4-ty@b4>
Date: Sun, 18 Oct 2026 13:23:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Sun, 18 Oct 2026 15:47:43 +0900, HyeongJun An wrote:
> ASoC: codecs: Fix more control definitions that write another control's bits
> 
> These are the last fixes found by the overlap scan from the first
> series [1]. In sta32x and sta350 a 4-bit field has a maximum of 16, so
> the control also writes the bit above it. In tlv320aic32x4 a TAS2505
> control uses the wrong register.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: codecs: sta32x: Fix definition of limiter threshold controls
      https://git.kernel.org/broonie/sound/c/e06bf60ee5bf
[2/3] ASoC: codecs: sta350: Fix definition of limiter threshold controls
      https://git.kernel.org/broonie/sound/c/77623752c156
[3/3] ASoC: tlv320aic32x4: Fix definition of TAS2505 HP Driver Gain Volume control
      https://git.kernel.org/broonie/sound/c/f28c09b7e62f

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

