Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CE84D17AE;
	Thu, 17 Sep 2026 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789676325; cv=none; b=ak1efZTNaKx15eas8Ska+lpsbHoTyEx2klIIW5EdZS95iZjkU0zJlKmo5ZNbbCzOf7YiBUpm7mum9MAWNnncucjgya+fr4KgoRsoMOYs/Fe4DU0sCskbrt5+oQDfS1W0vI7LF8LI8f2Nz1F1H/IKfkWHOFt6O8xVgAY4D/wNXEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789676325; c=relaxed/simple;
	bh=EFFrxCeOD+IjB/q1G5BRSfGoOX//btn5T3pOlV/UKOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dfd6LKRXHyc9bgGNHAHsU5HtzLYM60NUxn1fMUEda1BPrQFPo/z3LysnM2+14n5CKS9wfG5kDVdvW7u0fNghCdLLRBgcuUL80mWa4nyoFzf+DX8jdw5rbYDX3LoxU1zYi9kDMQS53C1g60HL5Acd3VrSkNDd9gimfcEGDSeUg0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3s9RCIO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3s9RCIO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEEE1F000FF;
	Thu, 17 Sep 2026 20:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789676324;
	bh=c/7+MGRJF39kR7cKKvczJnf/8ap9Fu3sLMJHZyHEMVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=G3s9RCIOVgRJgYtouyQs5OoxOeC9uhI2hokFzmwfEhIAwe+J/1ma7sA1GuLALiwQX
	 me1S/kJlov0B5T177fLFuI0XSLoVPz8zV+fF1hKRKDA3O5DFqRJgF/ZfTyjzN47CgZ
	 pNuyH+3O94/imfpxpevGZV3BoNMK1O/DTjhIutUY8IV6blM6VRFccdUxitvisZHVwB
	 BoQ4x8jqW8Ee5hW5sH7ILOZBiVywSgDTdcQ7P5uYzitwi/T/ycb49BVh6GP09UEhUQ
	 FtQQS0rT9Wwnigy/Hmif8/R17zxMM3i3DmZxCXBkizzPfGPlv08UEhBIXF7FN9UkAq
	 XsnuUVbiV2o0w==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jack Yu <jack.yu@realtek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260830142118.36668-1-pengpeng@iscas.ac.cn>
References: <20260830142118.36668-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: rt1015: make control calibration failures
 observable
Message-Id: <178959292436.414407.364491022812327810.b4-ty@b4>
Date: Wed, 16 Sep 2026 22:08:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EFFrxCeOD+IjB/q1G5BRSfGoOX//btn5T3pOlV/UKOQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrEsgXpzugu1FD2XhFCDNQJc6gAuCXsSk2UquN
 1x0peJzoPeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqxLIAAKCRAk1otyXVSH
 0DLdB/47YrEFeiqsqMrE0mbHtOU8ZZDzxPIbKOyeyMk+iaSwYAuQuhupE057FVobwe9j2Vgm+44
 CH+ARjPDdn3DcNFEUFYe+JAEgnRb9OvsKxSPA6EglmO4l+zV5WCv2Fue3fRpcn1BuVUBLfg/181
 EyF7c7RWeiR7FDaVcTlddmCcCWJL13RcRjiO+CXbU3IVaIe7O1doINdUFfCS7xubfGoiVhpsXcM
 PP4bZaApBzWZ57lOpLf3hhIQDurWRuCnD1SQnZRfhSir2xnckOg6HMfg+wxGq3DQdGYsa84pYFY
 YgCub1kT27XhQatFBTWXvwyzwP+RNeSWEUavt8+B0T6GGHZN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 30 Aug 2026 22:21:18 +0800, Pengpeng Hou wrote:
> ASoC: rt1015: make control calibration failures observable

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rt1015: make control calibration failures observable
      https://git.kernel.org/broonie/sound/c/98fe8aab04ce

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

