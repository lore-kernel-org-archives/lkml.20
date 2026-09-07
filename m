Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBBB3BB690;
	Mon,  7 Sep 2026 18:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788807388; cv=none; b=Q0THllA4a4W12tN1rsKZK8/LvEzAggpj96k0z6CewzcYTY+pJijBmmfyIwj8dSp653NXea3D+KdicNVBBwwQ9NB28e76xMzymDFYyDrMlmR7vRiszWklQDGDiTdmVjcfPSdrlr8ZAGjpv3Jcfua9srkeejSzHsN42/vTAJyXmLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788807388; c=relaxed/simple;
	bh=y/6js/Ha+f3K4VNUZSCHZOhrgPQdhadpyIsvAdz1BBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f6ShPzao0MB9cxWPY8P8a2R4p+yz0lXmCH1tnjqhRYeKt58FFzKZ27FBg1Wi6UHvKNBqxs7CEg5PmRkIy+TM+/MUQwrr/quebAVpmd8uq2MJLDfxX9DkZ7Kk8vHt27yTZ/LVyZxcf/9b4xt1pdrlOmE6MbaDv44ciXEfTV7x5Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/+DNDHH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/+DNDHH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819DA1F00A3A;
	Mon,  7 Sep 2026 18:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788807386;
	bh=/meUvB+WVWAoOEeeE9ah5xfgiTsdJMEHKa1dqc5ZtHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J/+DNDHHtmEd6WOOU+CH7O9ab0RW/8tbx4CwzlZQrZQ2A7S1XJ2X1IyGPVlDcvTaD
	 Vg/dOCXgNfffWsqtqTxnaZLIUe8z85qYoeJgnvkZm1ldzDI0tyjuObCvzDyq0EBBvZ
	 B+SURYBL5bve6m5hxC9XYgGETpxAqIqo2B4agulI0HEUBqwAXIgV/yuLIdy6tkDA9E
	 gE8WNzE0jgQkEYYD0qTSvc78ZuVZa0wYxU1R7g8v2CCJIDe/38QlINKLaD0kgeYfmD
	 KVy2X1R5q4rtv3gOZz2zwJwJ7VXpt/JzsfvguaCHKPI1NNMeRpsomlAyKJxv1QZWYd
	 ZcAWtTlBv/gQg==
From: Mark Brown <broonie@kernel.org>
To: samkay014@gmail.com, lgirdwood@gmail.com, lee@kernel.org, 
 Frank.Li@nxp.com, Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260904105624.48577-1-donggeunyoo.kernel@gmail.com>
References: <20260904105624.48577-1-donggeunyoo.kernel@gmail.com>
Subject: Re: [PATCH] regulator: pf1550: fix which regulator is notified
Message-Id: <178880099690.118202.12734619061585842822.b4-ty@b4>
Date: Mon, 07 Sep 2026 18:09:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=y/6js/Ha+f3K4VNUZSCHZOhrgPQdhadpyIsvAdz1BBQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqnwjXV7ZtM5M1qGve3vyFHI/nk2eY3++nmcLjb
 V7iq3Ou6oWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCap8I1wAKCRAk1otyXVSH
 0NG8B/90Hcc0iYtP34RIzXvqLQOcqJmVZBk1sn6WoXKFi/fXVoFEYo6BN5rBsIKOMH9eKBMpS6Q
 c8Cln19cPAzZLPtKHjQ2CXNWPs9LZBIt8NqXKfifXkFd5RsCy1xNP2rAjmP3e3cToNnlD/hfFnJ
 4TiZbY1D6b8dktzVNmbkT29jqAnYtFPyZ7EeyRkRhJG/piEctFbeVBYLIcIBmV26mxZxJYzXT/e
 kDb21ZFm5t01fiut3ZDk7VGQG2B6mtzRICSHrtD/QR62TQH259O11Xthb5XWa84z1bYUQV1ZYiq
 A6Top8bcRqNxVNXVTrtHiQz7o9QP5RGmm0fDRf7oFeajnXDE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 04 Sep 2026 19:56:24 +0900, Donggeun Yoo wrote:
> regulator: pf1550: fix which regulator is notified

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] regulator: pf1550: fix which regulator is notified
      https://git.kernel.org/broonie/regulator/c/f3e6ef13e24c

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

