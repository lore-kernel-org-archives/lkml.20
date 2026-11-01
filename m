Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623280;
	b=Gl6vTcJZs7u26FMrXqXDX1uVXaM3SPZRtu2oGQ0MGzGYmqf0U3Fk+hOEXLtw5DwLKbj6
	 T/RMGr05ptllZclz+0BtPniIyJrfBP134uNW2WW+n2F3U6GBtv+2M49Wkkic+ogqLcDuz
	 7O8WN/aJ5w0s+/qMUUxz6n4KIWSyqGCf/1mx/e1snoA+o8ELN3kQ7sV08fQ/aVsV8Cgnl
	 wqoz3sVkRec7MIiXUVhPS9OWSSFh4Vi0IuURgdUXH6q4HIMynplN8OSAd3KlNzMJzfzKE
	 qyUqI5kFXnwoviltw08u6qAVaiw3+PSzI1u/FwMwJ9Jl9yCfkDWkUCee9KXp8F090mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623280;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=KTLmgBQobLFgc575vRfqtOikHBILjuTkbaJQ41fX+M8=;
	b=Zj8etjTpGmYdGUR83I8Ps85LZ+C6Yum4/hvVqr+54c1x5+u1c9Yyiodg+MkgKtlNX4iv
	 81Y/xpyicSyMDuer/Z1AObRcfAw+7iGH56WCzbsY7r1tWfWS4V6Xh/reD3CaQrdIYtAk3
	 xP3EyXomXPiSpzNRtFXqngww6U29dL2UUABjevAuh1LCf7Yrn/qy9xlxWQZflSL+LsQ5z
	 sbJp1IkqU8rb/Q8t4D1F+fJnSt69Tun0PWS8miE9NB9v0/Y3EuDR71YTkJGQf7Cf+6YzS
	 KUneMqlsPLHRjG4U+o0Dj/pjTVpdI+ATPkRfeyy42k5Am+f9WXvgXn1Pg1XsjCcvGxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ctbq//d8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4D60A2603;
	Mon,  2 Nov 2026 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ctbq//d8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2911F00A1E;
	Mon,  2 Nov 2026 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623279;
	bh=KTLmgBQobLFgc575vRfqtOikHBILjuTkbaJQ41fX+M8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ctbq//d8SKZDnFarJurM+MSdJAWYJqhAN/V5Nc3iIfUTxgglCyMPSMnaT3mgGAlyM
	 yKTqZBtX8lbrCbGRXM0JkH/ZdoeSx2aXGmzMNg26i4S+wlyMjcWgC9AuVVNcJ5e/zD
	 aYsjm413H4nYHB+9c4pkzLbM9AWguC+OKouWFz+YKENOSdJtPFMQ3YHm2kF2aFer+D
	 987CfDtIi5mksUvMBwO9m6Bn9sMbMpFOncvHv8yRH9WgVy3fn0biYU10Kqgs/4LhtP
	 8z4U3xVQzRlepjhDyCj+vk8loPt9TL/LsKC+A8Vya8K+gFQZr9Qzxky3LOXFwy5JhP
	 6cgzFImixjaNw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 292422310377;
	Mon, 02 Nov 2026 12:41:18 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rodnei Cilto <rcilto1@lenovo.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030-ideapad-mic-support-v1-1-7677371af384@lenovo.com>
References: <20261030-ideapad-mic-support-v1-1-7677371af384@lenovo.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for Lenovo V15 AMN G6
Message-Id: <179357620503.1716893.2746782161696927840.b4-ty@b4>
Date: Sun, 01 Nov 2026 23:36:45 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Rfjb44ojiHxEuztcmbUpb52diCLO5Y397m71Bjj80EI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetLxjPXXv75qYLfYbI7eb93Xz1fy8L1f11JXrske3/
 fEC1/5nHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiIfgfD/8CFlT+23bpWl6m6
 OHZn1smXz9qOHZ/4afahjHfrO/n0OUUZfjF1clmF9Z3YvKuyRvPOt8MS5QXfQo1fXUqL63czZZx
 Tyg8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 30 Oct 2026 15:39:08 -0300, Rodnei Cilto wrote:
> ASoC: amd: yc: Add DMI quirk for Lenovo V15 AMN G6

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for Lenovo V15 AMN G6
      https://git.kernel.org/broonie/sound/c/ac0113d24575

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

