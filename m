Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5135674A;
	Mon, 28 Sep 2026 15:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610486; cv=none; b=NbCxGrJST8dg2d3Jstoc/AvKhZFZFcixRMn0y0I3FjWeml2ffmGKKejgGQCn/bj5vikXEoDTbYf9OlvpkmaXbajb1LrzszS5aeRwMGBt+ZAUQvEnbd2D5DEjGDfaaOjy3MyjTjdEnl5mHPp0EW48R1lNnia0VSI/kWtZhbaDHwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610486; c=relaxed/simple;
	bh=Ww0kOBpLyzx6/jRz8CYQlavXHDjRt62djxo4WWakDPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SAYbD+a4iU0vaddugUzz+AX+hS/ZAEqQf0Th0x0LOPaUyYCs52akqS1+J9M9uQ7FLw76XoNPusPWpSryIm0MyE8WSOkINJELW9HZQ9vTfk2Expxyu4wCUpaslFjSzbPIOcRFulm+ZALE9I0n3K/scAQ5w9XxE1TpnmGygxpGIg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jB7Amj56; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jB7Amj56"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34CA1F000FF;
	Mon, 28 Sep 2026 15:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790610484;
	bh=epMZtpbMAbS+Drr+liPDP/Xtne7G2monuzFEf66hVeA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jB7Amj56rJ8tfzbK3NwxDHI2Z0eK4i1PGCevy+B9CCbsoQhuDvKJfufxifCbSBvPj
	 BQhCGjUj+nYG7R4XM3bCz6UiQgbjc9U4qGCOP2Zvkkv2zrrWJgRClawxiRnjI6Iedr
	 wb+km2RXUDwP+nupoRM6zBbiJzSYI1WIhhsH5dm/72biBTu3v6xTBStgU+0dE6xpxs
	 mFsyQPceh+EXBNjfYx7uYiCAa63uAxbabYjJ0j2LMTMYVH/WKRW+QapUf8jEXHo96X
	 FWD+KBejx7K3R2Baf8XRtJibmVBgM6kaMA3HLohs6YwVd9Z9UV4EszzzQFUT9yf7pf
	 kZmCgXFKqknzA==
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jannick Tobler <business@jtobler.net>
In-Reply-To: <20260928083925.266471-1-zhangheng@kylinos.cn>
References: <20260928083925.266471-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: acp-config: Add ACP70 DMI quirk for ASUS
 UM5406GA
Message-Id: <179060774153.139547.446955655162269499.b4-ty@b4>
Date: Mon, 28 Sep 2026 16:02:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ww0kOBpLyzx6/jRz8CYQlavXHDjRt62djxo4WWakDPU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBquowxwgAAdVX6BfZgQ/vHipzDUuQ9A+fqVOyeQ
 YEJmMi1ELuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarqMMQAKCRAk1otyXVSH
 0DJgB/4j0TKqyJzfNGTafRVaE0gRF4fpSZw1fUtJ7MQefLYQ773Z0k5QWzk2MAge6wX7awFTRtD
 WIZMog9PDIMLjnlcpGLWpPCEYYOz9EUUybER5sd2lw5D4F/LxA1lqYg118i6KjVnvtVhLC8ossb
 AKRTV/GEAwQ3MRV80+US0z7ul5td/uuhy4qmfV3Xx1T538wd0hXO0D5iGfSpA6p1zxneQhXy7zK
 F2KvuxPVBiWDNK5dVj1gXc8Mim5w2Sye8KiLJGpE6IDz8KDtBY5pJ3AVtOgSNfzrZOnkrcqFlPl
 Vlw5Y/MhyckjNpQzMOwBWSScuPUHBMOIs9RAxTZ4uYfo8l+J
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 28 Sep 2026 16:39:25 +0800, Zhang Heng wrote:
> ASoC: amd: acp-config: Add ACP70 DMI quirk for ASUS UM5406GA

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp-config: Add ACP70 DMI quirk for ASUS UM5406GA
      https://git.kernel.org/broonie/sound/c/de0be324fcb9

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

