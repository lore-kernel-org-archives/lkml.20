Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725418;
	b=hDk/YJ0fGH0iy+2sOy2aMXVZtnzx7Q+daXZg8AkFm6zPJ291GftMEmIYg+AOFCu1yhsU
	 fCG8x6tG2ojEdmtpBi8S4Q5XVMFizXE6ywvP4446o7w1HqBjHuTnFMSqRNqOab0DHH9Pb
	 AfBzHa5JJCuO09v1PdI9CVE81phjhkI82eduka1TZF9YL0OFPg91Ee1bSL3qflEne8NSX
	 ysAo6uWRxZMkaQj0fQWIBKNFi0+DueNNWtf30FNwBDfrzSOxF/rkO2xUU/9GCfBHcc3Oy
	 xJ2KkbG1psCJe26LSE1QxqUTx8ZAShE1XyV9IjbWQD0rDWDfGszGEhj3SARyuao3zJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725418;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=wo1gkUw2MFaF8a5iqM0r8NH3vtS0k2uzINNVZCVyXw4=;
	b=G2kdsLlvKvYvxyywVSFZm3E6TGmpRQftlBZKPRqnxOmv6UT6pvtY38A/7vu2ShSKn2Cz
	 Oqyqoogj+PughAxe8IEohq7NpYjKsHVqX+a/mGy83NBqJ+JJdNqWFjVzabGqlsGZ9uqyQ
	 ddXwSoW11oK67V9cXHiVDFk7giYGNcZlTVG9UWoHHA7eilKiRY/Ftmn06vgbqtfgN3PdV
	 8TZslmrBFbEc9qlQc3aKFbDgXM3TNc3wmJkKGWgjHcJryydKtzme147ueWq3sHu9hBBl3
	 df4y8axiN/siflx6SKbdZeMAPPEp4gJo0Cjl1Y+4py04dDDM/uEI2nMtj7ebjbUuPsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SzUQxUeC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE36606A32F;
	Tue,  3 Nov 2026 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SzUQxUeC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9051F0093A;
	Tue,  3 Nov 2026 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725418;
	bh=wo1gkUw2MFaF8a5iqM0r8NH3vtS0k2uzINNVZCVyXw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SzUQxUeC6N7QCcqsoJP5KOy9N3VAqHBC7WFVqdRAfAcpv7VYqaf3X3z8p5CE5PrHI
	 JeGCVG0DssB4aPpJSL/PixxZjcF8D+tYNRBG8zA2wPEhDpiEORvWjsIbHHIAcaKypi
	 Yml17rA4lL4EMisUaX6rixQLmrNYm9nlFzXFGPyzUn8nXpyMSqCgx5olCXd3Q/myqH
	 Cs8hnXrn94ucSMaMUML+PIDk//oy4gfiffCgzrsDsZEoCxdCBXlEfDK2fStHgQkG2A
	 yp9xQsgNsaC/o9eN5hFucS4YvQKHT9f68u5fF+b2zGerudnICTW2OQ+HGNguOsqbu2
	 Am/rW21V5+2PQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 83024255727D;
	Tue, 03 Nov 2026 17:03:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, cassiogabrielcontato@gmail.com, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
 Darren Ye <darren.ye@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261020052747.568770-1-phucduc.bui@gmail.com>
References: <20261020052747.568770-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8196: Ensure the DAI is marked as
 started on success
Message-Id: <179366039724.2186205.4496100188192576076.b4-ty@b4>
Date: Mon, 02 Nov 2026 22:59:57 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bnFFXu7ZamnjWNSZ7qWKob4tK5jbMYG3jzS96z+40+E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeCb84vvXq7KpNum0bXz9njZM6plviXHJinV188W6/v
 EnqrIxPO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjAR670M/6z4ttRci5/sXrdN
 KGG67RX3erMPys/ufjp8x9frrm5+RQHD/yCRrI8XpNiNKn/Z2++rOnm28EGylkjLuXd2ia8n92o
 6cgMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 20 Oct 2026 12:27:47 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8196: Ensure the DAI is marked as started on success

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: mediatek: mt8196: Ensure the DAI is marked as started on success
      https://git.kernel.org/broonie/sound/c/e672cfa10dbc

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

