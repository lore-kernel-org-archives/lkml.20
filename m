Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817A437DE8B;
	Wed, 14 Oct 2026 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973713; cv=none; b=LfYBM5nzJjU196yVkjRHO0LAq0knlpJeIues4QxKvCm5SrXmHbDTNQWrRfPWY509nSeW+fICE02L8ru31s5ll7XKn1AB0pwxMaMn13sqxkQyNFbMYLqxqcxOy+EqH59YsDAuFTtxSZLcFRcRpRBi2MuH0hzjKnIZkI2pX823R2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973713; c=relaxed/simple;
	bh=85ePqdUrxlAKgImhGQeGtnMz7AsH4S3r8BPV51Rup88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cGb5UNxqISDcrg1EUe/bNpNTPYIZToHpHxLMNqybdZ5RQANlNjMk/zYKfhpAnNJH2NqolqlPUWv08ArlAMaZhbpwYBN/1KBoWSmYi8xBu3TNBWPLFFecNlkTX6tYg7c0mduN3PRsw0SRTA96jvwlV+F1uWAt6Ch9KNFYwf5SIQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nthlxmwC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nthlxmwC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D3B1F000FF;
	Wed, 14 Oct 2026 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791973712;
	bh=OojGyMZ5eh41Y2wVjeI/8ZXJHmHbXooHvcwTpVEfMY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nthlxmwCZNSa7NzKSt41VJhrAobn7kMyHdh+zm4AEHtnNSSWjrrumq5fKNBine4wp
	 kIjXM1GU6YAsJ6xbdVIKWicELwukF2deWbUv2q/npVfO+tz6Zcl7qbwESll7cGMkCi
	 sM23xAJR2X6KDLIizdR1SfKUYLoOfoqYzRxJoCAw/z1wv9z2GtA60K4rH05S+jpQ9/
	 pJquoTVntsiXzjfWAnknvduFoO1Fx/4u/Ugf60lAuoqO+EJFwYmGZzYLI33wZao6Cq
	 P8/HxHBsY6RsOI22+mhBB6CjuoCvQv00+W6c5gQmwbLIgVm1bLVVcfNAk+ndwU01E5
	 N2/xDlFK3Awwg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Micha=C5=82_Kope=C4=87?= <michal@nozomi.space>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261003194501.832558-1-michal@nozomi.space>
References: <20261003194501.832558-1-michal@nozomi.space>
Subject: Re: [PATCH 0/4] ASoC: Fixes for the MT8188 sound card
Message-Id: <179192410329.1606900.11713606638187764851.b4-ty@b4>
Date: Tue, 13 Oct 2026 21:41:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081; i=broonie@kernel.org;
 h=from:subject:message-id; bh=85ePqdUrxlAKgImhGQeGtnMz7AsH4S3r8BPV51Rup88=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOR/pEr8oJW9Vq7PPuFZ+iUGu/DIdR9+4c2WXyR2v1V
 qYFbIjpKGVhEONikBVTZInL4n5ZX/J6Dd/BhW0wc1iZQIYwcHEKwETYhRn+pwgfC3hQctJLVW+z
 +fH9qznvZ07fNWNP1IR/6zqf5E766cDIsKfWZK/b8ecLFyw3jvlqIrp2x6GO4osRF3ibvn9J0bL
 byAYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 03 Oct 2026 21:44:57 +0200, Michał Kopeć wrote:
> ASoC: Fixes for the MT8188 sound card
> 
> These patches fix problems found while bringing up audio with SOF on
> the Lenovo Chromebook Duet Gen 9 (Ciri, MT8188) on a mainline kernel.
> 
> The first two fix the common MediaTek sound card probe when the card
> cannot be bound on the first attempt. A missing component made the
> card fail its rebind because the codec references were already
> released, and a deferred or failed probe left the static card with a
> topology name that devm had freed, so the card registered with a
> garbage name and UCM found no profile for it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: mediatek: common: Keep codec references until the card is bound
      https://git.kernel.org/broonie/sound/c/6cb1f09e1f69
[2/4] ASoC: mediatek: Don't keep a freed topology name in the static card
      https://git.kernel.org/broonie/sound/c/50c5d7f3a9b4
[3/4] ASoC: mediatek: mt8188: Constrain UL8 FE to its back end's capabilities
      https://git.kernel.org/broonie/sound/c/76775717c4ad
[4/4] ASoC: hdmi-codec: Don't parse an empty ELD on startup
      https://git.kernel.org/broonie/sound/c/d0b9e91b87c9

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

