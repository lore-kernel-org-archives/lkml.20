Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627481;
	b=kCzNImAXerTseiJfVKk8R+fEgqqVAoMwK3Hop9hwSUxAxM83x4ad//nBCKYIfjx5zysg
	 e5btp8SMuQMxbtsvxm85HcJXsGudxZSt94LK6WXERKEf5JJHMBFYUdPMp9Yvt2Nrdtief
	 +2tkOlX+KFXEM4ijhTPtt0OckMGAubHmdzGBi+qrzlRSWpNAZehz8XThgiYD95hNtCd/z
	 x/N5CeJvPgfdV3lwJXNi8r0TPHbxldYOAmfxoCesHSXUhW3Fe+QcGIZX8pQrKwGJGNbfF
	 6Ivj+Bb76e+KzRVzMBa7Romri7/DJBrOIG+xaVM0lWMVuUYsVS9FTWPJX+x5VZwkpRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627481;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mu4wQuiU7Vuu1UJtIffJnxFR+p6jd8AVeA7dEYolDLU=;
	b=DFYP2QC3UaK+Z5WrNLVkywSME8xIEcBjLH20SvumirzwXx4wDgTcrIEEuZQTt9s9XZW8
	 +mblVuaFsTbTOT4EYY/QRL9npzpSl8J+VdGb0h+T0gYCd+Vc4wPsbomuMSd9j+2EBrB0q
	 69m6kw9Ut0BL06mzmDgTAU/hJMizJlcJfSo38SO/2XzOY7CJ7b5TxHFozXxaLQle5Yz16
	 SnKcTZKHmMPH2qwqyD1fh72v/INaKRq+3OkrDD+9+L59DXz06hWumM65eAtSV8aSbIasa
	 34jUdinkRpuuhYHc3scIHrH4c6sqcoyYv6exjU+B1Ck2OrBIX1DKP/UpwbC5eC4lnzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jjzHRu5C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33796606A331;
	Mon,  2 Nov 2026 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jjzHRu5C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65531F00A18;
	Mon,  2 Nov 2026 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627480;
	bh=mu4wQuiU7Vuu1UJtIffJnxFR+p6jd8AVeA7dEYolDLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jjzHRu5CRmg/tMgC+YwXPz8LYH3F7G9LvwwvaYCTYBE/FzJXV8Xk3QyaEO1GQM+c9
	 y3msO5/kUjQvNOIyFBIhYDMZKPVyls2AL8sb8aeCBbP4qe502XQ2QD215TYKyW6Hh2
	 TYxIh9xK5itBab/pBR17ZlZSAE7ZVfTiYH18RjLLuHu+0HJZu3kEf+9QxFVgfk3xlC
	 PXiFovjwXz4Ab/uwI61Nr0pKqZqYZhsdht+yuo6xYUdEbsIqlW14hbGLMXpiDW49nB
	 uReakVgTMlby/rGgfMUU5UTvxs7qoK9Xpkzix6qF11hP+sJxHYQnA6NeTQPMK/1I1z
	 Oz2irBmjyIIAw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id EF5EF2344C96;
	Mon, 02 Nov 2026 13:51:18 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 u.kleine-koenig@baylibre.com, Igor Prusov <ivprusov@salutedevices.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022102638.38606-1-phucduc.bui@gmail.com>
References: <20261022102638.38606-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: ntp8918: Fix hw_params return values
Message-Id: <179357905846.1716893.10746405809934167987.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:24:18 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lGQD2PuF/vr3cFUI8t6HzBOZfig2kbTMTnFuZ5jhIHY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTA0TyprzY9te1Z8a/zml3swv3n/RcNcbXdPWf06He
 K88uWna1FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJ7FjByHDaW+XyjefpGnJ5
 F/fHKqxf9Pb747vH9i5Jmn1Z4wybzJatDP+zJPZkT//47Mv886diV4oHq1utETgnmGM5XV/3Bsv
 fJAFuAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 22 Oct 2026 17:26:37 +0700, phucduc.bui@gmail.com wrote:
> ASoC: codecs: ntp8918: Fix hw_params return values

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: codecs: ntp8918: Fix hw_params return values
      https://git.kernel.org/broonie/sound/c/972483b70fbe
[2/2] ASoC: codecs: ntp8835: Fix hw_params return values
      https://git.kernel.org/broonie/sound/c/dd1112e7907f

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

