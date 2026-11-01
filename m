Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623295;
	b=aaH9XsAaczXXiXObC7WK2CSqSOT975+IMNy8RsSzSxgwMNOJ+lq5t58/oiAuXYpRYLeu
	 UHEMR4hKs4CIsanEAzT1RhCIURRkBs8V7F9DNuor+vtszqD6Qa1zzqm0+hohCwmjT1iOd
	 k3MXa41aZ+aOkzQ4hbbikCDqjwd2/xamW4h1mkmXbgBYxqK/Lp7ZX0cQ3rSpxRtX7eGRJ
	 k/NJC+dvLYMs/JdVhpEm29AE3RMQSfVh+3jLHYZvJ3VMS+0s39GinT90yCJ32COJaD2+y
	 /Hh0KzgHuv8fZIbrKbG7896p1lDsQaGOBTRfG/Mh9oOKJI1MnYsQe7mDOiYuYk8nbiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623295;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GDla55akjDCeCxve+XXZ1GhaDw8FlDDdvyBujVlEYUA=;
	b=gvdeRy0CBvRML0ZXrF+78oJpl0cz445jCvrh/30NVZ9UgI9QXIuRkeKHU5zjQhKwLaqr
	 ymKIbZampmFO8EuTv+xc68qHLti0E5VDWxEY2uKSb9aEMP7b6MDWpQvesdMZWqXP4X8Nq
	 nmoJnTNcHBVtrP61clBppf90X/jnpSn9V75u37FDhImwzwNJ3oITK27zvPBKMo2jMaSx7
	 +FiA2HKPtXf2njbloolLlXhzUBLGonYOk6Y3Ja1mD1GscfcbJ8z86XLzImRRDW6h/F1s2
	 sSfkUOimDCvA+nQOA1ODj6YppZr3wezS3RRfrtDS3iNpw0N5iQDeuWzpvCspwKr61VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0hnrtPl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A81606A337;
	Mon,  2 Nov 2026 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0hnrtPl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7648D1F00A16;
	Mon,  2 Nov 2026 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623294;
	bh=GDla55akjDCeCxve+XXZ1GhaDw8FlDDdvyBujVlEYUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=D0hnrtPlCacfi73VPto5okwDdJyCy27DFeEVYdyuHXQCinkPCXJPs0K/nU7/1SLil
	 AtzeNutVV3RBcbgb2P+A51qBL7eJdQemFPJNW029TV8GYFHNguY+XHnPIbw4PlM9lC
	 U9Jf/qpoeakOthfdgXtTTK0dgD5iQMKTsD3ckji0ZOZjqx0zsUfdzC2vPaEe/jz6f4
	 OOUKYjix8ZR8kE8eaYhhUE6N2UHFmv6NT4quIYoLznIJd5lzYgoOYIk2GTM0qS7QdK
	 fNlJWFvk3dwGSR3+Lp9ZA4Jzk8XzIrPOFPwmPw9oi7am9I6A4uXui+a3o2F6EH1Z00
	 JyT7OUy6jDXsw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id BF6BA23103BF;
	Mon, 02 Nov 2026 12:41:32 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
In-Reply-To: <20261019172640.64989-1-amade@asmblr.net>
References: <20261019172640.64989-1-amade@asmblr.net>
Subject: Re: [PATCH] ASoC: soc-dapm: Remove overzealous check
Message-Id: <179357626667.1716893.1877412145402878431.b4-ty@b4>
Date: Sun, 01 Nov 2026 23:37:46 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xBDcv8xR07BhN9GLnbqaGTI4HBYJj8QQbhMbMyR1qFM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetPxZuz3863mhv/MNOJ5/fmr6wGYS/9nUPUwKEzZff
 PhCvlP6cEcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAm8us0wz+Ldk3FIh22dVdW
 zPdPTWXdnfu7cOIGw1l1Ffe6va8Zpu5h+F/MeMbJ5f9mu99Xpk9NSBGfezzvll3drNlndji82fL
 6djgHAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 19 Oct 2026 19:26:40 +0200, Amadeusz Sławiński wrote:
> ASoC: soc-dapm: Remove overzealous check

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: soc-dapm: Remove overzealous check
      https://git.kernel.org/broonie/sound/c/490e113d5399

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

