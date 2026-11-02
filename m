Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627482;
	b=D7hWa1f3U9Q0eZl6WEhs4O4aGjcqj3iB/Dp+b9kBGSHwTSaXmhUf8NXKlB/KGslDNKgm
	 CophxGPbG5Wfwmj5OGEjz1OFgUEmMjSp2fpHzlycMpWmj97eItTezkKpIRUeMZfJV3DGb
	 jqCLmtYZ0ABLowtDybdCmqMtWfKIFKi3k6tURMCrpD85nQkZY7i79xm9FzWpqBVVff4lz
	 +Myb6IOvEyUHc/dRLG4b3wxbBSmQTHuHYEcyaDSrEP1bIemqzx2T1s9gVbvZmoJYcz1gZ
	 fqDayqhtR1nRoXedbAZ2A8h8LeSfdoTo1HRttBoXuNQy/85RkNEq+v09ifZgl6WaH3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627482;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=xn1TtuKDeZZB9pUoWm6FQt6Du063VQMOmhSj/mKvSMw=;
	b=qhiySME1eohSdM3HJ5+SjQVlZzCpEEEzH4U1Msu1vWYgytqIE2ihaovVx6gtrVrEqkoK
	 nspsA9j0sWqos9qrO0jx/VsA/6pd2PDsaZy3CXiP5KdGvjbiBdEBAjlkXGrdk02LK2SvG
	 GtsfeXVANmabgc6HI7V/EAQhqhPR3VuGqf/g6X5KKVRrzq9f9GZVYo7ZsNmdl852oxc6T
	 lZsU2f8nDcUxtDfv7hht4SawlcuGZcaBU1XpfxvfEow7jlxuRv7SJrGEm+U7YocZX+dTo
	 2tg1XReRLrEDN2bCqTUxTFtyj9tbZdYuplmQkcKoqMeoT1Vp+krt0Ff+yRy6W+H7zyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQ4MOUQj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B560A2603;
	Mon,  2 Nov 2026 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQ4MOUQj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEC21F00A1C;
	Mon,  2 Nov 2026 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627482;
	bh=xn1TtuKDeZZB9pUoWm6FQt6Du063VQMOmhSj/mKvSMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GQ4MOUQjoCfsNCI7k7FAApjZ1DOcaBm3nrhDwLU3+jx8C5ggDeA0f9I5W71rpMtgb
	 YBtOEeLfJznCCAUufRzV7uwOC5jRMwcP2wXsdDhKVT7SVE7o4OZhYvn1yCFJ3j5XqB
	 fl0TRBP0VXercMkxAjVO1vsEUIk0upcosjUK0TH7ci4cDlzzeqATyz3P/hiqwRsVuw
	 TWMaJzmp4cKQ8GqfDQ03nWl6zl4wQ9EKgA/8BdM5wF9QhEjRrSXNz+oIp2Em9EvI6a
	 FbVhk3aFkxFNSZfnkJDdrxnB6JMhXRZIu2HWrahOrXGpeoQpk877AF83pr3F80RwuF
	 t/Kg/jsHrVLuw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 261AA2344CAD;
	Mon, 02 Nov 2026 13:51:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Peng Fan <peng.fan@nxp.com>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
References: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: codecs: twl4030: external mute GPIO
 lookup fix and binding update
Message-Id: <179357887855.1716893.1892265929428497615.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:21:18 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NaYM3suoQ1Mq2ydfMZzihLSG7Mgadl8/jPapPAn3I1U=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTI1QNb773zxWpULIo3r9nKg3az6trL1xyPpSke2ci
 0+3S97q7ihlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBENkkw/BW7t+Ih5ze1330v
 lA/1xvwPbDA4JuMl8Ofw5y/flm/Yrt3F8JutSPCdSFdz2TSNqi63otULDp++6hfmX3hQ8jxfO+P
 fmfwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 27 Oct 2026 14:32:07 -0700, Dmitry Torokhov wrote:
> ASoC: codecs: twl4030: external mute GPIO lookup fix and binding update
> 
> This series fixes external mute GPIO lookup for the TWL4030 codec driver
> and updates the corresponding device tree binding.
> 
> The twl4030-codec platform device created by the twl4030-audio MFD does
> not have its own of_node or fwnode assigned, as its DT properties reside
> in the "codec" child node of the parent MFD device. Consequently,
> standard devm_gpiod_get_optional() calls on the codec device never
> succeed. Fix this by looking up the GPIO descriptor directly from the
> codec child firmware node. Also update the device tree binding to
> document the standard "ti,hs_extmute-gpios" property name.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: codecs: twl4030: fix external mute GPIO lookup
      https://git.kernel.org/broonie/sound/c/5c23fe26f116
[2/2] dt-bindings: mfd: twl4030-audio: document preferred name for external mute
      https://git.kernel.org/broonie/sound/c/7c0dc66f7cdc

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

