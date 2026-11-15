Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785213;
	b=F47iZnIpAEkbFn/Oa7Q1IY/oCvHixb3xvxLaSmKXqTt1iT5u+1hKiLqi1M7oTjE53LhM
	 Elt2LLia54X7xsS+r6fGnpGUT3nycuMjah1fDiK7KETxpQa70BJDUZsrHRZW67dfyz50e
	 iRKW9IFYumYnaFQd+ptYxeJzso6yg4lYKAgu5Vm0RZB9obV3Q1qOUw7veIptQdo/ZpS9n
	 EvdkXDQ+T7KM9APbP0/3FlJUYTZEWLDevfB5hPQksPgM8BUMmj3rnw+iLRpR+fANxqU2M
	 CR2SUgaC/ie86QBgo6PcOtXaZrTf5abHBUjEozPqZP5GvzsAMZCDgX3DkFbbyU+G5TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785213;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=YkTnkWYELvbzPBSh3i/ypLratG7pL6tVTUg7/dlHoeE=;
	b=rTKJ5t690VkNHAbygWOeJUAdUwqRjYSaxFkdyRNHXzNDJR3AIeSA6epw+UGG2qHUI6d4
	 eJtei4yOqk39L+/uqutPtanxKa05H+DBMZ3hShkMwhwWDxCN2836lS7af/LNjxvVMVjK9
	 M8xsm79SDfhlYFLF0maMX5/XnBiIQBGj1PUzmPkfKGdkbej4EjoNMgYHKwPFtyxKTRuE9
	 kWctleEz2c79EKLrLgTCQqmt/hx1waCkZbYOOEdyxrW4u8SWsf2KEjnlI1TeAW20hA+9T
	 2yJz08rm30SepRdDXyby+K5Zar4tnxdlKAGcMCYqpPxhLn9HltkQbyLKCKGs4SsBeZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/nxiPSe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7417B606A31F;
	Sun, 15 Nov 2026 23:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/nxiPSe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9351F000C4;
	Sun, 15 Nov 2026 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794785213;
	bh=YkTnkWYELvbzPBSh3i/ypLratG7pL6tVTUg7/dlHoeE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I/nxiPSeHUCZd9GVM0+1O7dRHeIVggd7tPicELYHxYGxaVKi0f9HGKoM13tqC63cl
	 EWNtLc841qiaLc1gFMu5fRvREWz/jOiNoDWOcFSX677V1CCqJFqKkA0bMyRvF/bvlz
	 /YLzWuPbPZQ4rHPsqlkoNKkqYXFxHPuQZaQmyCpU8fjSvoLje+BZazfLTUaaGXciCF
	 E9PgS0AP3SiW9MVOGliBAeyKddeHpJ44iH4JZc5UvpnBuU6PYWvjYdn7CLIifuas2g
	 PVWGskgWwaxLuHF1B7MLFzSzerb1F6j5wI/9trhlK6Gj0oqv5Aj8Z7NyKu1wg439EH
	 cx5knBHZNHPFw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 982D13438E73;
	Sun, 15 Nov 2026 23:26:50 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <3BB19624DEE17CA9+20261113062406.1504452-1-tuhaowen@uniontech.com>
References: <3BB19624DEE17CA9+20261113062406.1504452-1-tuhaowen@uniontech.com>
Subject: Re: [PATCH] ASoC: pcm3168a: Leave cache-only mode before resetting
 on resume
Message-Id: <179476174506.140154.17053952530348521830.b4-ty@b4>
Date: Sun, 15 Nov 2026 16:55:45 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+teFlKCMazx8Y3wkhRiLV3w1MgJNZPX73M1sXIrxEGc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+2W/75fBJOEZ88wTrPbP61kufWBJxN/eLgd6/bfuep
 ldwaZ0w7yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEpGsYGfpZXNSed1/5WsLE
 tKL6ftwJ691pS+xWu52y3twk72T3V5Lhf/aXX8F1CpHbAvd9lNVdxM2o53b4d/KxH3NnR7w2816
 7kgEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Nov 2026 14:24:06 +0800, Haowen Tu wrote:
> ASoC: pcm3168a: Leave cache-only mode before resetting on resume

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[1/1] ASoC: pcm3168a: Leave cache-only mode before resetting on resume
      https://git.kernel.org/broonie/regulator/c/1d4c02b8ec8f

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

