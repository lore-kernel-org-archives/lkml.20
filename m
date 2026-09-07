Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF3C43E484;
	Mon,  7 Sep 2026 21:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817678; cv=none; b=p66QRfL+2GQ+Z3KYDxHmpSQQuay9OV8Bg+yB9WsHlxuCdkyk4Tyt0MW/NmHkW8vyGhUfeyY2IpTMYzV81KM7UaGzpuMPzg5ooMBbj45Kaagzikh7LQIHWP/5llCjdH2xemyjryU4pQa/HNIMB6j4fL1uddx95KXIqt8ui1kY4NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817678; c=relaxed/simple;
	bh=HXWAokHFgJeO1B9vW0w+sCrmC95999arTMjNFJAR6yI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dC4Ll6mZl/ns/Uyd7ITiP5Ujk2OmkUrw5AEvoY6qdfKQyQQ+wtpyiBsEvkjpKhiM8Or3Hi0eXNy6jyop4EMc0U6EOMkV1V6QIbaBd+MHox3nPjOPVMGf0Xrxuvuwtk9V9R//jOzNXzhnwnH+ZdXDc5IiSPCQAoipjdjeWcdQ6Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ixu1xORo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ixu1xORo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4551F00A3A;
	Mon,  7 Sep 2026 21:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788817677;
	bh=FKBbhFVa059S4cyouWrgkTaUmVbQMUrd/Wmoh8VXRiI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ixu1xORodadWwi/1XFRNAhlOiK3hz2ID/uCTSrrn1ZAQ7BM6fCzTUG2AcWv01QHRJ
	 1hpketZND3mj0Q2DNeo9Nq07+GHiPz4GFCL1TfS6uKJ0o9U6sm+/1uGxhWVSfKJIXZ
	 JjnE0fSO/gJla807G+WttOfNP1OnqXR/MbV89cNZ2C0oCcM8uZ0IHe8usOJJF2zW+j
	 S1/Ilr3i+NaoHHJonBr+G7WMZLbi1uUwhCTftEFjA1x3mh7Cs6ncI5I+Uf6KOb9qVV
	 MRnwQHMbo5GOE7ky2qJ4rMAV0OwaEZaSJ1hoDPOuMTU7CPTU94u0VdW3ovlr4K2nnp
	 N9Owo3NOgs+Ag==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, "hpp.iscas" <hppiscas@163.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Kai Chieh Chuang <kaichieh.chuang@mediatek.com>
In-Reply-To: <20260905133210.63803-1-hppiscas@163.com>
References: <20260905133210.63803-1-hppiscas@163.com>
Subject: Re: [PATCH] ASoC: mt6351: Publish the OF module alias
Message-Id: <178880730290.118202.3003996533999491750.b4-ty@b4>
Date: Mon, 07 Sep 2026 19:55:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HXWAokHFgJeO1B9vW0w+sCrmC95999arTMjNFJAR6yI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqnzEIcuBe9d/xYsCjxZOdBv1mqeJTu7OhGl0qN
 I7sM5tkaemJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCap8xCAAKCRAk1otyXVSH
 0D8FB/40FRMYjNrvXYNR3VAn93IMc/gprjYD8QYyYiJo0cIiW/1pgqKrSnb8ndluSt3Y0Xk9dhu
 FpHO2AFUcMPrcBI28PNypbcS4nfscT0DtOpzJ1rcz2As60H7MFRItBwX+53k9wN28uW6PJMkKvt
 F8ENYsI/3K6ZO7ViVchdMdnjuapXWKOunAu+5cjHxiD5A0j5PWzgtVe5IUbYmDz9nMgs+1jB6kE
 9Cw35/AIswztZRkH/9sLoeVBOE1CW/SH0JIzq9/tNBTmZoi1SV6QPzHGYbfBdjMXXkFBsojZe1g
 SgoI3YytVb8NJXFeuCmKVBa4+igGuauMhBEinhKe8dqR4OCR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 05 Sep 2026 21:32:10 +0800, hpp.iscas wrote:
> ASoC: mt6351: Publish the OF module alias

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: mt6351: Publish the OF module alias
      https://git.kernel.org/broonie/sound/c/9c3882ec1039

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

