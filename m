Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0A439F75;
	Thu, 15 Oct 2026 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060263; cv=none; b=lfQrhTO7GvNczjOddA834mZZePbiknV6U+Ro/F6o4jUgvcz54z+fwh2yNcw+Y7HApInDXKoPXrU6fixprmsiHxe9YdWUYPEJrnKcJrv3X9Se1sCZ1cnVVwthl48YZnAh9EITxDYdg+vIO/QhQ+A/cHQfGMa4s442buVqRiwnfB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060263; c=relaxed/simple;
	bh=+rAx0ZsSUfQxzg+7xnudKVYP1MtGjqbwqga0yYDXbws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XBGPGK/CKZE6eM50vIBzkSYor4mBqBQ1E0BM4Hx8wO/QBbaWlj8E4KMUCZD4IaarM0Uz7HhAWNom+ehPfBgCIIup/ZIaCUJZOCHJKQjl5RN5QuOLaRB+jlq9j+ayTobBlTUf6Skj4EdFLLBHkCTY9bPKgWRIZSfGIOAleLOrYVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFwENOSU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFwENOSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46F81F000C4;
	Thu, 15 Oct 2026 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060262;
	bh=DUSBpKsCXXJGrVBNJrK3gdmJU4PrI+B4OcZpbSGb/10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hFwENOSUcmxBYfAbyg7Q83KEGCsR5PktKnaDjMt1KFi9WDbGdugBO2+v8EYo9sz1w
	 2JLEoRNFGupFPKx4IHL392E2SFipWhiBMYvqoj+FAs16iO/1y34UZbOwXWTtr2WE1J
	 0jtI/EFWEsMi0jpkYgZZ74rqJSZwiOAx44Z8SVxzQqbmUz2UidSeG0omGVplO+6d8Q
	 oAQZW0JwRunqf8oPIgLROgjp5ezf9/SOopbEm62NNmX5gQ+KV8eG0XysgJsje+7XgX
	 nIlKDZmtcIlI7uLPcH4vhYoBAsUjXN4vjApwADQdBcNHYUviqD4MbVO1yAvMIoYnEl
	 MAr1nKcgX3m4A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Federico Amedeo Izzo <federico@izzo.pro>
Cc: Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20261010-aw88261-hardware-mute-v1-1-d0befedd3b4c@izzo.pro>
References: <20261010-aw88261-hardware-mute-v1-1-d0befedd3b4c@izzo.pro>
Subject: Re: [PATCH] ASoC: codecs: aw88261: expose hardware mute control
Message-Id: <179190722039.42298.1051562928418220534.b4-ty@b4>
Date: Tue, 13 Oct 2026 17:00:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+rAx0ZsSUfQxzg+7xnudKVYP1MtGjqbwqga0yYDXbws=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurE7K2ffjvyBjZPipCdtbp6+5+VHB+/XHl+IWU6VEt
 vmcN/ozsaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATCfrIyPDp6ZyuZTbrZHyk
 DGNFQuPelu4rmVfwZMNR+TAmh9k8Xv6MDK/3LLfYGx74Ytqi1mXxV5sNLqrl/Qna/2z65P0KMcL
 eCSwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 10 Oct 2026 12:24:43 +0200, Federico Amedeo Izzo wrote:
> ASoC: codecs: aw88261: expose hardware mute control

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: aw88261: expose hardware mute control
      https://git.kernel.org/broonie/misc/c/fe9dcf5f6575

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

