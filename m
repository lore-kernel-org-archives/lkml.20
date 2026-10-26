Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100313;
	b=dRnElEKDe3M7hQRwYIO2v05qjd/OtKUGyMYK7Y5mNkCjTOAUV20/cdCPeSVWFk8s9GfC
	 4oQO2Rrd7VVYthe8n95nnhGvU1LRJrxg6e+g5y3rSVCgcQUV1QfIfXmhKCNd9uvk9eWz5
	 qoVnsw3ZH/VNeCApvBd3Mj4nvfMZDgEiOXYTcqtm7JlGBeTMiVhfrzuBhoEYUkrk8vmj7
	 zBAAEsAudLHCsChBGOZ+eGuh/jZRX/dN/sCLrCeTCi1klfz60LEECd+Cp3VsVKFk8KRIn
	 oZia4su8j+yQaoHqrufaCqcWYMTRnGk23gBHoxsNYaxkW0JZmtuCY4KZ4qRlz6WmP2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100313;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/y+hpruak62MfeNUJ/z+0d/xsd5BpcNDUzCGgpDaycU=;
	b=14h/Yj5Lr2c0eRT/S1VoDoVU97hdpDrxB/HAkZjFuhuM/53muHLxk2DeghWRs0AM6kSX
	 oL1wDoBtpqm6vw2HDlV9WaNNnxjWMBBEaYdEM2pMiVfSKwl3Qng7sZnBxlr3nZUqW5Q5c
	 mULx3wh6r6XdAgvFfQQ1Hwy1eHjdg5toFRNFKWBksF0qHVhPXQmE4nt6yPCsNSJPs+UcA
	 7pynXp+XB2PAevXpwBGpN4kO1YLWGaMOGOgWl/gZdTg6c8bDiwNAHznQugvYBQHbFqBVU
	 iHjuM2dyFAeDARr/3NkivQshQNZX7uNoA+bOJEZjpDSdvemATPrGSuHAB5cwHvZmgjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUtNKdUU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44659606A321;
	Tue, 27 Oct 2026 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUtNKdUU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15E11F01825;
	Tue, 27 Oct 2026 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100312;
	bh=/y+hpruak62MfeNUJ/z+0d/xsd5BpcNDUzCGgpDaycU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oUtNKdUUqNO6SYgmBPCzmiTPoiV/dq5PDnNBfwhuAfKfodUPJXS/6boN2WY93yiiT
	 y9jMLmn6pDLFUOBIKchfm2pucefexlscC/Ty1IixN/bJLGloMBhxQEWgBPBY4CgG1z
	 T1Bu+dBX4gPRLEir3sExUfHETPPtJ0R+dq4705TBw/XOGooNRjlyGDfrybKfcq548H
	 UXE7FtAP/vWlrnJQe0DItNVbZv8PcAV7fOkz/7fccAJqwzp1AZAv+M6zcjjlEA2mt7
	 rSw2CNU/RvC/DHxYqj4Hz527k+W8m4IGSv6ebREkpDtuFu2i5EbzpDJ6N5jC+BltiI
	 d1sURhidtifFA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 017FA1F4ABBF;
	Tue, 27 Oct 2026 11:25:10 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] ASoC: qcom: AudioReach and WSA88xx fixes
Message-Id: <179304508114.199157.9118243601087796897.b4-ty@b4>
Date: Mon, 26 Oct 2026 20:04:41 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PMeodDOgW1zcz5/kYy7wJ/BTblZasBUMj7sALtnEuxs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIedIl+YHnCqNx1WM3c82myxe+/O6d1BMbPnDnht9WJD
 eGLlf5+7ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEzOcx/DP6cebzrgUSU/xr
 uP5c/JV2fDZ33ulTwlMeenmE+ey05PFkZFi/YUOa6I/QuUmmu+frzvu/w0Hii2H498SEY67fE8+
 U9DACAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 23 Oct 2026 18:13:09 +0100, Srinivas Kandagatla wrote:
> ASoC: qcom: AudioReach and WSA88xx fixes
> 
> Fixes found while bringing up speaker protection on the Lenovo ThinkPad
> T14s Gen 7 (Snapdragon X2 Elite) with WSA8845 speakers.
> 
>  - AudioReach: the module cfg blob size was used as an element count,
>    so the allocation and copy were four times too large.
>  - WSA88xx: speaker temperatures above 45 degC were rejected, runtime
>    PM was left enabled on unbind (NULL dereference on wsa884x), and
>    the VI sense port carried only half of the V/I pair.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/7] ASoC: qcom: audioreach: fix module cfg blob size handling
      https://git.kernel.org/broonie/sound/c/e21fb64a8c4a
[2/7] ASoC: codecs: wsa884x: Accept temperatures across the full trim range
      https://git.kernel.org/broonie/sound/c/00535515e3c1
[3/7] ASoC: codecs: wsa883x: Accept temperatures across the full trim range
      https://git.kernel.org/broonie/sound/c/6a55cf0d9dd2
[4/7] ASoC: codecs: wsa884x: disable runtime PM on unbind
      https://git.kernel.org/broonie/sound/c/54c121eaeed8
[5/7] ASoC: codecs: wsa883x: disable runtime PM on unbind
      https://git.kernel.org/broonie/sound/c/ea63182d7195
[6/7] ASoC: codecs: wsa884x: Fix VI sense port channel count
      https://git.kernel.org/broonie/sound/c/a6093f98cbfc
[7/7] ASoC: codecs: wsa883x: Fix VI sense port channel count
      https://git.kernel.org/broonie/sound/c/9728b328d7ad

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

