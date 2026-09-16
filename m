Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F1E4DAFA9;
	Thu, 17 Sep 2026 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644742; cv=none; b=VHfBmopxJSOvFiwrtgyPln74vE3n/atLNjh6eNKEZ/S+81cnCv/0/ixXr+exqTEKRUHT+x+tk7xTxWTbQPuTKtXFAedj5DBhAPYhrsZE61f1f15nEZbmpRZq9nIfWicXiGjMW/lFr269BM2i/0UMJczWbmTLA/paxhBXVTTKSCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644742; c=relaxed/simple;
	bh=kxUOzhTsRvYb1Bn6BrOvOxFqKzXTlpbYCEpVxN2CM/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dy/U+ekQhgyr1kVX5tAI0QG+/i7trCshfmQVtVNTQhpb0FTaVFy0dMLgSlmoWupavCkPxGiHewQ84DOfwMDs9RVfCGh/hs1DZqvt/u/YKGM3DWTuhkRSilOEEAgLF9kK3G3ffZG6o0HEgVW+wIYY8kqg95ncvw2oJYLv+YnZ8Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BT6QTS5h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BT6QTS5h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5CA1F000FF;
	Thu, 17 Sep 2026 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644740;
	bh=lAax8grwgSzfPLmI5FtqAKE75Nri32JM2brt7d3vqUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BT6QTS5hEjNCpCHA7OFH8t6OrUE8d9ESMndh0Lp8ONY+fjyTylrpwc0Evi8C6N1rB
	 0A36Q5IbalM1UjGgUTKn48fs5saDn6/WSV8Dbht6Zv/3W+SWhPwPWO2lb03JYmnRAY
	 CvmXYYJOXVysWEp8XnLf4KKn6t7LrZ1LYffZF6k7vBk9DbmF7NyFvUBu63Q5XNUCiv
	 yJ2ukPzzs8D/Z36KSBXRHqA/MS4e+oN9iAd7uZbOzhXvLulFLz2ZQPh6V941RvtmkG
	 t5DZKd9CTkWfTpmocVSdq1SXwRXu+UmCofMRrpEz/YtP5HBgbJnyk/REu7tFNP7g/V
	 Kgc3uoKk/EExQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260914122611.2783563-1-rf@opensource.cirrus.com>
References: <20260914122611.2783563-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs-amp-lib: Prevent NULL pointer if efi variable
 is zero length
Message-Id: <178958564467.100121.17757768534905530748.b4-ty@b4>
Date: Wed, 16 Sep 2026 20:07:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kxUOzhTsRvYb1Bn6BrOvOxFqKzXTlpbYCEpVxN2CM/s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqq8/BrulKJl1Ni3E/c1vuzMQvZiHxaM62LqtJ8
 umqf2K4RdaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqvPwQAKCRAk1otyXVSH
 0N0zB/0eQzu4l+C4MH/RdM8BIAzwH2qq0WwdDr/BWT0E7VBddOZWGB41vt9bVU5khAKDwz3CqpX
 xDXknY1Ny8Gd45Mv18ZKI+kcwbVn1envx6t8+xjWsvQbnyQB8yJAGA6HMCIMdsHu7q2WFhl3LYT
 hEDOxp/qh3YrKK+FD2ZMqYbaZGtdFsYope6ZWKt//z8Zu88ZfmIGX7GSBxhWMBoZMdNlAddnqp3
 9wlY5GknhduEbyKq18mygOl8oP5VAgMmOEZCBrysbOucD28+etKL7Ud2yjQIifnVMeVNE+IkUCq
 34jQuQMj72FO11F0/a11W1g6Q77hhuNnDAadfnoGoH5yP91y
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 14 Sep 2026 13:26:11 +0100, Richard Fitzgerald wrote:
> ASoC: cs-amp-lib: Prevent NULL pointer if efi variable is zero length

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: cs-amp-lib: Prevent NULL pointer if efi variable is zero length
      https://git.kernel.org/broonie/sound/c/3482062c786c

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

