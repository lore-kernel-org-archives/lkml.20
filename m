Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835540;
	b=fCF+JfujEr35vnVVeqgYXTztL8g4CC2oT5oVVIOjwhGIr1EgiY/ypnFINM4WlkV+QcKn
	 MgjxbiqzpyAsKo45+JSHv+zNebGQidgrZoIGHmVuuCqG3wSSyzXxMRsCxOG64R8rbfPyl
	 MAu0gVorGT5JQX6ggLaDe6YayVYAB0gaAe2GjzyYh663mRvirrnCm3aXi2nhRr8ix7lOO
	 vyDMyBzUYO0vcELossgxuEJJDpQfm8vKI4HOr5NCWjyO1Dsmm+mLxMNGBQexq9EylYh7S
	 8CkbBNPmNygiU7i4Sx0b3Tsaxu5vIV91v/hyPk+kLCpBv6b6ibfSvpX4sV1bZB920vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835540;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mQBS192ZpSJxSlcf7a/+JqZA1p1CGK2qlxHgtgp+wV8=;
	b=mY92ruNcXSduxgaw2EIpjiDLWDqWH7WcMuTphTOjM03HSNNdxcRJojSzxNuO+lAvyIPX
	 UXoaTZoKwV5lxoGkutVfDmOJt6TFIrYLyIfr4nodyRcmcn9cFy3U9/oDGRBfbpMPZaqna
	 AcPOUTqJUFx9DJYU4LLl+LCxoLxiNX5EA0p+nRieEPrVfmccFdW7BxHFL91fkQw/ISH23
	 HPi97JzrF6FcIxLuiB0UX+AHHZPFjpunZUFf9Ck3YmsWg9DtR54L1q3rvWaJS37yUzq1S
	 KL8TfOHbWcilrQe+cPYTn0YNgqHOHLOlSzaijhhm+udfakao3aEanskNWBhkmmEtLxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PIluHJ9k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA218606A328;
	Wed,  4 Nov 2026 23:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PIluHJ9k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A191F00919;
	Wed,  4 Nov 2026 23:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793835539;
	bh=mQBS192ZpSJxSlcf7a/+JqZA1p1CGK2qlxHgtgp+wV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PIluHJ9krwFfqLOXH8c1/dUfKy00UZN4osar7tfcibuAOnxlf6FgybLzsKPJpHhA1
	 FUSq62J6iuVKTAmdWMM+cOxQTDl1hluVRy5+PiHZ+zS70wiyGX6a3IUYmo6KqEO9CM
	 O/q9wOQK9bZtt1BHzVEpAe69ri1vlgTNU45DOXXI2m9T81eU96Y0mbc1+Vlvq1x5XU
	 933Dep/w0q2FDvQWAd8YJcll5rAk9vQ6Yrdan+CpShURUB/el6IbwJaklB7zN1kD/f
	 AezFiHtO9pF7hjE6AIEuGa3T49zNqPBUAkR2QY0O7Zhk7/zyaO+S/zpZ3b4JsKE0D5
	 ZCA+v1qhXyr3A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id EAE6526925ED;
	Wed, 04 Nov 2026 23:38:56 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261104111650.1079215-1-ckeepax@opensource.cirrus.com>
References: <20261104111650.1079215-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 0/3] Improve pop performance of cs42l43 input path
Message-Id: <179379699621.2456854.17021609174709716123.b4-ty@b4>
Date: Wed, 04 Nov 2026 12:56:36 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+KKLojYL3AJvQvWccrRH/4RvT7kERet00hUtaQxyxbU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeH+KpEeJhZFks/SSl/3vSL1bx/padjQor37HMEdX0q
 sp2dHrYUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgInMCGNkeCO6Zc/vnHndZyxa
 WLNzmG7bGv5nz3uoobstM9dqVj3bS0aGHwbf6j9MEfP90N6ilnO4f1bACf2/tjGr6pO2TDjvJOL
 HDwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 11:16:47 +0000, Charles Keepax wrote:
> Improve pop performance of cs42l43 input path
> 
> Some rework to improve the pop noises associated with bring up of both
> the analogue and the digital input paths on cs42l43. As part of that
> there is also a little refactoring of the DAPM mic event handler to
> switch over to look tables rather than switch statements.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: cs42l43: Improve analogue mic pop performance
      https://git.kernel.org/broonie/sound/c/b7d1b857f596
[2/3] ASoC: cs42l43: Factor out decimator startup data to an array
      https://git.kernel.org/broonie/sound/c/2b71e0408324
[3/3] ASoC: cs42l43: Improve pop performance of the input power up
      https://git.kernel.org/broonie/sound/c/cd2e9a5195bf

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

