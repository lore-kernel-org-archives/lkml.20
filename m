Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339208;
	b=imG9kebhpaUl5QSz2xBokj/z5Rh5oZOj3796Cx/+usA+GH6l1ug2Dd6XgV7yMlnbAbDz
	 LqikqQdX9XSFWA6ssL7WR1w9gGCn0KPkJLuKHwojjidjCCOir/nG9JKPUUTLLQLVIbTiW
	 vy9OfD3WKPTSe3v9HPBAJHTSobq3bONPQBq0D6kPZXR8uPwlPeTp5LIsNyknkhG9yi9wt
	 JEBKghNz600lHUhkvTah76Zld894Ikev3cBmSUSNIebb5UODP8o0gNrei6CiSDfCS8qz1
	 OdsFgPpt63mOUznOWGw0nblyiKG39K8t26pNZbr2Z5zR+FXARcLOA5MLYksSBAgqnCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339208;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=R3r0KgqCfTEn+wIP/qVvs2CdRD1BMD/CzUZo9unM9Wg=;
	b=fRutb90JrjQs0TPn46vp3UerGKUsmTsWvzVjCOd01mtx5+7n7eYqbVSOrmyACM2ILxSP
	 rgN6Ds0s4TXcMIscEk4JiRTmX1pcx4hmsm3Ud5RhifwvqVIYKRyLlBFZeweu93iQ29qgZ
	 aMDpbTIQex+uCNTj+FGj6C6oJLTY+eCDbr5QtY/vuFqVVK5jV88dzjTMAsOFR5LQHTDvH
	 meEgFv2hqq653TMgWxzwWZyeq23FdpEFNvQemRNKChtPoCJ2PMnUz42TrJK4evslzzCHJ
	 fp/WYKro1UCbruox8l5lR+vnSeP+/pi82rEEZa+k1WWBVqjJB+pWLKdi8BZmYkBhn0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJgKhF8B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BBE606A327;
	Tue, 10 Nov 2026 19:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJgKhF8B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D531F0089F;
	Tue, 10 Nov 2026 19:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794339208;
	bh=R3r0KgqCfTEn+wIP/qVvs2CdRD1BMD/CzUZo9unM9Wg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lJgKhF8BuwFjdvUmRCOCjtWdKJzPyHVz8syFO6/Nw2RbO1o+ylRsLKC4JQa6rNBHw
	 0r87TrUG/lX325Z7aBzUD/zBWH/PX8XEEOsKSmQ/4cSc+gNptbNQeIDOQqf7YoIEA7
	 xH2ZtT8c4n4VCV8sNpQiOHynn+c62J3zotIJFGwHAayI1YL6485hfhLuThnot4HWTu
	 MKbPdeg2zziIi+TsIkc9hphKzLT1ffXh53H/F6Xqbq6yOxmxQK8MeofXISfLmNUu8N
	 Wht+mRWyBr6EGHV5Jf61JVCXT4OaXm3MPHLrvwLCCzqG6D4SYAtFCntVl6yNcvTKSB
	 2RW8v+hZ9bGhQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id A54BD317F85C;
	Tue, 10 Nov 2026 19:33:25 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261109172604.4077312-1-ckeepax@opensource.cirrus.com>
References: <20261109172604.4077312-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 0/3] Add SoundWire port constraints into SDCA stream
Message-Id: <179432654531.125181.14199418155712058483.b4-ty@b4>
Date: Tue, 10 Nov 2026 16:02:25 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gexnuTvFbG7BIMq1plhrmjp6TXHCS2Wd8ds+2NkF73s=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+F7ZOrnaxmaC2arG8Y/dsO5Mpik/y03hneJfLLDX4v
 F1wV8+UjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExkymFGhr/3WJdNK2dIkTv/
 ZtutNVEPP96RbfMxf1e3bHW+l/mff7GMDNff2+3bMYX9orV2RGy4eYJm+p9k/3Wxi6K+M90TelJ
 rwwcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 09 Nov 2026 17:26:01 +0000, Charles Keepax wrote:
> Add SoundWire port constraints into SDCA stream
> 
> SDCA adds constraints onto the DAI based on the DisCo properties for the
> Input/Output Terminal. As the SoundWire port for a Terminal can be
> selected it is possible for the SoundWire port to support fewer options
> than the Terminal. These patches add the SoundWire port properties into
> the constraints for the DAI startup to cover these situations.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: SDCA: Move DAI constraint allocation
      https://git.kernel.org/broonie/sound/c/0bad08d2865a
[2/3] ASoC: SDCA: Factor out helper for creating mask of Cluster channels
      https://git.kernel.org/broonie/sound/c/5ee6093d3a84
[3/3] ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()
      https://git.kernel.org/broonie/sound/c/8bb24d87078f

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

