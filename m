Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F3F391E52;
	Tue,  1 Sep 2026 21:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296999; cv=none; b=Kig0sRSbBtokd57S1GyszIO3YJ8HFjCFQTZAemKQZ6Dt626yRkF7feQ3R9Ehhg3kXK1bNX+Z74vqkSXmcj6fKdo3CoBdzL+MUdyjibModCKizMNleo8zRDn7lseibMFQ5rcFLX7l6ThLiDjeoO5nMhPBEEIOpYznxBU184bsx6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296999; c=relaxed/simple;
	bh=vMw6l7WmtT1y2WxoL4sVn9cybVODmLTkExSbW4A/PXg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wih2Ysbi8dA0FThAHNKP+d165szO43/UAzJOQSgrv0rwOJUTUbdfdi/BSTm1TUrGI0BnVDdyCuBrw62xfRPo4DdJRrPbeZMG7hFDdCykvEZSh21BPKnsQql/rCk9zU5QKoNyD+HGmL9RTrIHLHw8MAkywILKrz35T0P0uKGCC7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeV03l8a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeV03l8a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310AD1F000E9;
	Tue,  1 Sep 2026 21:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788296998;
	bh=TUtbD5rQhJ6cYuF0PXB0UlwbuIDJDrPaRKZYsiklulg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LeV03l8aZFOW8qlS0YQtKs+d43nBdIZxd2myeok3fttcNXcizJnKjwNXdgH66u6Lo
	 2YLRchbeHqYRr0U/0s+clM/Zt42Y6d2tPLXpXhncs9WTYyOtYGSrBHK/dpWG7rVW2s
	 PEMUMnvKsaX3F3EylihzwCkisP++O5nJkikI+yCFx1awLw5+RGZM2C44TxInK5ymfs
	 uBjBVz7TCh8r8s8zQ2oIh6t98Ajfn4AxrVgQ8k8CTnLEJag7YLESJdnZKMWB+IDFbu
	 lh6uTt4IFefGE6E11LU+gmrUw2iOOa89uySe5HPvbmYeMVm+S+8DBtxMYNUziU8n+S
	 X26YiTX4725NA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260901123857.2338909-1-ckeepax@opensource.cirrus.com>
References: <20260901123857.2338909-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-ops: Clarify kernel doc for
 snd_soc_info_volsw_xs()
Message-Id: <178828687935.33904.4202619035347939807.b4-ty@b4>
Date: Tue, 01 Sep 2026 19:21:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vMw6l7WmtT1y2WxoL4sVn9cybVODmLTkExSbW4A/PXg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlz8invxoJd7IrYOiNZC/xxD8uQxTQkZVSVQQ8
 Bq4J6f/uuWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapc/IgAKCRAk1otyXVSH
 0NDUB/9A8W8E4URN5gO+AEeQ4C2f8Y2qYxCKZnkHMzZpoL4SOzr/jEmgLwKH9uQ3iItUlGTRkzp
 xuBZ1GooCoqAyPH8I4D76xohXv2vxxPBsEl4pWpGAgZVofue/YhUIMSnOxfvwsEX0jF+xutHZfr
 StuyNJH60PraX6yhzejM+mcPWAffSdgwN/NXsY+LGF6OUBJ8xgn5IzeCSZs3HbP0NsVvCSeIv7s
 p7Hj7Gcp1SpGMJIE9lFREW4LwDeRqyClC/a4Eg2Yyspc10I2SO/IpZFdFNa4LjY3GX3amnRGfUc
 IGjSuUyAtXxHeE9FR+ZUisQhhJkrUNspyuErJ3z7OtBCdxgS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 13:38:57 +0100, Charles Keepax wrote:
> ASoC: soc-ops: Clarify kernel doc for snd_soc_info_volsw_xs()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: soc-ops: Clarify kernel doc for snd_soc_info_volsw_xs()
      https://git.kernel.org/broonie/sound/c/2bba6ea93e48

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

