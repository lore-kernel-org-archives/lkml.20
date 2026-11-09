Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250265;
	b=hyePBj6DkTW8swnMkhwkTAeYDqu0gACrto4+k58FEksqGsjwIAMRKqoGwvf60bwS5k7V
	 3NTYm34/0kCcau4Z+74MDMt0h44ANJSd69+7WhqV8xE5VvyAwr52hdaYKHpWlI1QF1cWI
	 gkPFtidM0/Eeafjp2IsRSfJTtRFjUqJ+dFs0oBPdqEfiktWjR8Wf5hxgjfeHfJ/JR6qWm
	 EmAoFnFZvbgni4cmg/veWnH/3UPrgvlDcKMqz7MwiCegCBV+mw3mhy4UhGUe898iDlszz
	 emJq17wninM9KWE/Yw/Qf17RUxJTou5xlHHSMVRgzc8tvu6u6wNcn4wXnRaBUMu1CZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250265;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2EN+tTTIpDfdpX+0xh2EG/Yy+J4hcSlHuMdhAeyfdzM=;
	b=nHYA5f8nZBGA9i/oc3lOnNVMP4uYryvYD4IErZB8s3bIfNMSriiy9RS8j9yQCytmaaeJ
	 jtZIb7FClKsWdTD6lw6Ws/7gmE+Y3XQbLSwBPnK7tzOzZz3NIOxD+n/cNxNumhA+cUaWU
	 eJH5r6c/GMDgMdtb3o59Z6BlMOpZDq6sIAMq3XGQmwBLzryvE1zzNJKF14ny4ykoODq0I
	 QG1nLT2WvrGbjgBK+ypuuJbmrK7Xc9431/O/JA1oHxR1IhJLBfui/lspab/tQmBWXMuOK
	 65EtCR5DIw4lRQEyBw5MtyyueScr+plEchfrwsBu8NA51MSznxSXxqf2PDyuAGQumcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3csON0n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46699606A31C;
	Mon,  9 Nov 2026 18:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3csON0n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CD11F0089F;
	Mon,  9 Nov 2026 18:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794250265;
	bh=2EN+tTTIpDfdpX+0xh2EG/Yy+J4hcSlHuMdhAeyfdzM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P3csON0n9TTOme8oVPC7d6fbm+/Fo8NQIIi0n3P2pG90etvYPsbHR4NLqvyBGfg5J
	 yL6elRi/RVM4/T7m+XdFbYJw81wRsp3jy1ya8QTHdozwLOL+hDTyuJMPWB8YWLdwJZ
	 5nOEgqmXSGNyyNtskEnM2Z6T269hi7P4uOAiNC7UNEjQ1hv7c/mUC/+6u7RP7erTiZ
	 Lit5rd6OC859L87f/sCFV2uNuQCUg7vcVAP5R6Ui6sknNF5Pu9Z3pidYhXxvg6Yc9J
	 61rTeCMrhOUTzvFNyaqCTyIMQaMn3rFPS1Fg1IruxNDinPCCBKTmYgi+G2BmLCBp7r
	 FVYPv352TxzGw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 0027D2F535B8;
	Mon, 09 Nov 2026 18:50:48 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, shao.mingyin@zte.com.cn
Cc: lgirdwood@gmail.com, heiko@sntech.de, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
 linux-sunxi@lists.linux.dev, kuninori.morimoto.gx@renesas.com, 
 linux-renesas-soc@vger.kernel.org, srini@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
References: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
Subject: Re: [PATCH 0/5] ASoC: fix error-path leaks and a NULL dereference
Message-Id: <179422704338.3711751.5250666353519171392.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:24:03 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d0vv4//pkezbLMeZ5UdIe8F87X35XBtLtvhU5Eo8fAE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+iXE8X3RtX+3aK9OD187eeSyWKYwvYGtQ5KF/qWcUV
 r9RfSv0sqOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATuVbO8L+u9eHMpsfmwt+P
 LnO6NvG7yvWdtdeSTuwVzdmtfnk670k9RoaPgR0vL0alLby+SXr1wcmMpV4CD3qT2l/9ip7Of9P
 xXR4DAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 07 Nov 2026 16:08:15 +0800, shao.mingyin@zte.com.cn wrote:
> ASoC: fix error-path leaks and a NULL dereference
> 
> Five error-path defects in ASoC drivers, found while reviewing against
> linux-next next-20261030.  Four of them leak a reference or a clock, or
> drop one twice, on a path that is easy to miss; the fifth dereferences
> a NULL remote port while parsing an audio graph.  The patches are
> independent and can be reviewed, applied and backported separately.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/5] ASoC: rsnd: fix NULL dereference when remote port has no endpoint
      https://git.kernel.org/broonie/sound/c/ea3277e4a3d9
[2/5] ASoC: wcd9335: fix SLIM interface device double-put on error paths
      https://git.kernel.org/broonie/sound/c/b5aa000ab9f4
[3/5] ASoC: rockchip: rk3399_gru_sound: fix codec node reference leak
      https://git.kernel.org/broonie/sound/c/1ae5920938f2
[4/5] ASoC: sun8i-codec: fix bus clock leak in runtime resume error path
      https://git.kernel.org/broonie/sound/c/a32aac41b8ae
[5/5] ASoC: rsnd: fix SSIU node reference leak in rsnd_dma_of_path
      https://git.kernel.org/broonie/sound/c/e64753959a3e

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

