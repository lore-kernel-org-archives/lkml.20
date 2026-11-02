Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627480;
	b=P9qpENzSoTXp0nk5/O+ZjPvOOAHQEiYhaUnFk82oCyQVKStwZgqFfWszZEKJxtwo7XCV
	 n6CSuje6hl7NPMHE6817n+QhoM7TxAoyV23Lt19gu815swkGvkXItLH+J8FIF1zRsowaf
	 ze0IkeOdbMJJly6eL41C53MdHYBogxOLcHVgI5GKEZxVAH0l2/WAjVVy9zmanAypqvbpZ
	 kfSOMjC96aYaniQmSF8s926ZkpQz41Ca0nvICvFZ/kjx4JOlPMs5KnjlAKT4+WEWdrUel
	 ZEky2wOnXpKShxq4iizhKkVMaDv2l5yd6G9OpNK7hbprNcfZizFWmPxJBm4r008JBSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627480;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=yUE+ajKb2SvUu34rlf3PuV8op+JEWESp3G1IkxKNGVg=;
	b=zcrnrPv20lA8E/WoG8hX9ugpr0VaCx75C2sG6H9dkC02iz20gdHwIsfaMykhy5fxK463
	 ut9lbagEdp6sVN/Mpsl50URwHWCHn9VAyrtlVtEsBh7bdQyVGzH9MekDPuhvNNrjtgwcr
	 zCyX/QwFvPWY3n3fItRiwLw7a7YWx30uSIrkU5Lj4ILqHTvm3PEC+GRkVVOPhb9iEaQxn
	 MYjl907ahtxx/pP7wmyAPmNcKPqiBVuwRDBCebvto1I5SuetTZ/fbskJYd20tQCOdGtYx
	 ilY3tiy3pScDzZF/xTuFMRHM0D566enzsRpGEmIjeQdtShOPoaeSCv8kmaiDmrH3xVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DzW3QY/E";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01924606A324;
	Mon,  2 Nov 2026 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DzW3QY/E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881AB1F00A16;
	Mon,  2 Nov 2026 13:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627479;
	bh=yUE+ajKb2SvUu34rlf3PuV8op+JEWESp3G1IkxKNGVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DzW3QY/E1vTYb0tPj5dhj31TqNOVZLX3yHkAtyhaoWRl55SR9+VWdUGoQdoUArbeF
	 oOmbLYVMiJJo6w7s3YA+pUyBE40zbeCBYcoys4vrEcq26jihwgKWcukCnDX5HPjnNA
	 Yzi3dEK12FV1CjQ0gyfVenSlnygpmL8YXnOQKAiBhTxiyrXsIdvj3p2AHikiUP0BdN
	 ZdXvVHzumMQ/sh0VZ0wDrSIhkr6YzJBzicE2g38hnlymFLXLPmb3CkpSPRbcOpfleb
	 ZDHS22NwN/8NkdzNtDvStsihWKQP5CT/vadj266iVCYOJ1+qFkIYpYFeYJA6lt1c1r
	 VLNTonOzIvqtw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id C65672344C8A;
	Mon, 02 Nov 2026 13:51:17 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Micha=C5=82_Kope=C4=87?= <michal@nozomi.space>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261016161455.194400-1-michal@nozomi.space>
References: <20261016161455.194400-1-michal@nozomi.space>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: Suspend the AFE across system
 sleep
Message-Id: <179357913438.1716893.724348214369386121.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:25:34 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Q+rLYquHGS+G0a65fcTBl8j90yUlRSeS2WSUr1yi3T0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTA2NfyBbv/DNFum23rnHi4PeaBq8fxo3Ocb/9EReV
 S5mG6nbHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjI4UsM/yOMXE2554gJFJzg
 mviM+wTjEQvWU9OepKpNN2559n+FGBMjw9Ku+YvfHGQuyGINOC1kV90o4VcmHrrS17KQSVdk8WI
 /HgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 16 Oct 2026 18:14:55 +0200, Michał Kopeć wrote:
> ASoC: mediatek: mt8188: Suspend the AFE across system sleep

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: mediatek: mt8188: Suspend the AFE across system sleep
      https://git.kernel.org/broonie/sound/c/6c97476ea8d6

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

