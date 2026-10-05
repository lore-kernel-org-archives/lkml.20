Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF54BA1D9;
	Mon,  5 Oct 2026 16:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216240; cv=none; b=GWxvcQ6BLUnc8Ar/pJnqYpVNvZRIRIe3A0P/BCJD56KiQeKAGHj8cNx1otsoF/l7ijQaKxaLW6WyQDc1nxCLBjF8BGeQ3VpOei/hPmil80zuHEfe1VxzMAw49mQ+jIzN6vlcq5puMYf+3nAWQeItdB8b8eEf/YNiB+dLPopeD80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216240; c=relaxed/simple;
	bh=pwAYJz4JSCZo97ltUTX/zxuKH8yDm9qphKBzGuewdWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rFmCV3mix4o1KLp1RdcGOR9YadvThxcFUo7Xp50rNdfHgualh3ieGHXKPKjjHpwEwM52rX3RjbUAriMX5oETgvpd1uxnVBU5sP8go8WkVXScbYJGhu741Iucm1GfRy+LKuCI2wSsKRjru4R2M7jeWblYXtv3JfXz7U5Qcus2Aug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHCyQ6Tg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHCyQ6Tg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5922D1F00898;
	Mon,  5 Oct 2026 16:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791216239;
	bh=zY4+/ZtWnDsPd9xRVo4RdAF/T+PMmkxCsvFJNhrBxpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YHCyQ6Tg6ccY5vdb072neKqUlmycUhXogRFgrdB8L9sYz/qY1XtRslXTU2rZaflco
	 5f5xK9Vswxw75IbEx/w1E/btUtOwNV90YHOa5CACuFf0vjtJAPBNRWdspyeVWPE/3Y
	 dXRjyrIMPvkQlLw2IpBtuYRgJtd2PgM6RJqL2j3p+zr1AwvOKLeZDgLv2OaN+6tjoN
	 aX/FzcB6wfJ53NFG5jdXehbP62dcFEq4LUQZl7dbYw0JCXDyK9hjJIwOhLmaX4At8l
	 BxwAcXbMe04pgSbZpXVeT2zRo7xqb8fCZq3QzlZGpt63JIsZ1LbRu/WVT/gk5BBW5G
	 56cKhzxPgk5Xw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Zhang Yi <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261003190738.77564-1-kmehltretter@gmail.com>
References: <20261003190738.77564-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: es8375: use devm_clk_get_optional() for
 mclk
Message-Id: <179120547702.150114.5253224029608763503.b4-ty@b4>
Date: Mon, 05 Oct 2026 15:04:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pwAYJz4JSCZo97ltUTX/zxuKH8yDm9qphKBzGuewdWc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqw8pphwc98Y8/gew8uBGQSIlbw0oZJDzRCEqM6
 WjMU/fH3KyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasPKaQAKCRAk1otyXVSH
 0J0HB/9KvOVq8ktt48/zIEw1FoWIIXKN3elX0vCnpIP56Znrl1qF4X2FuzNMQoN0HPydkecOvUR
 GLqF+MS0YYPCK4zrl18Ib/OG/9kwIvzkUpxEsOPu8N0w9OX+z/brxI8jGLujiqY5RD5yLv1TaHu
 MKQXrwZb91f9rd8Z7PeZpuinxnOHuexcRDaNuq84OuZDFU1sHfTPsCKjU3+0EspTxaVQzJKLVrc
 poui4pNZ9XT1mH/kHdipi46BetJbxz2MxiqDHhkPLrehe+ucznpkEYKyO8Iezt3WC1giDywX4wo
 9qRztQxRhsexpBPwG/UnEh3wi/DJtPhrIM9Ip5/RWSI7+H4U
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 03 Oct 2026 21:07:38 +0200, Karl Mehltretter wrote:
> ASoC: codecs: es8375: use devm_clk_get_optional() for mclk

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: es8375: use devm_clk_get_optional() for mclk
      https://git.kernel.org/broonie/sound/c/58e7bca5cf26

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

