Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136571;
	b=196zpax3hC6NQKlO5BSWkOVBJQNopZ4t8edeKZA/CY8oSKBlu+krqQxnrFYCF9Teu+Zp
	 35Iig+YZN/e8jPuyZpbDj46EBU9MvW70APAbSij+Og+JJ6oPkUVztnWHeirwtBuKiF+Uw
	 oi+dYYMMRL5lnKhnC+D/0anIslCMPs5Q9um+Pp531V/Mi9U5MsDzsKIX5wHRrt+pFCDJn
	 qU923EChO2MKTXfrsCsqMN4DO3D7IYksHSl8ZravpqNrL1P+pJKD8cacy2K5YczMbvJsY
	 9p+Nw2IicDwJhSPh0Wjqb6dNXkq330DWxegAgao9pSqC1muBgWdSKKxnoGNU0L5VErQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136571;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bl5cMf5oVLZLpdRHQBsSexs2yAIQ352WYuyU3qzrEtQ=;
	b=r+ByZ5eRKcbDm+t7WI+9VBwRcBtLK2zLApDxldY3QIdGGwSTguwtSoR3E4XKQjC99u+r
	 lmCoJWq55Dsw04IY7VRbLNiVXzq2MEipINuuHf2DbdQoouWW27icsADyjVhq0pxvHv46b
	 jpBTVcfmqkUBmodAk66ybPktTFhatgo777fnePq/V6FsqKUCKjcs1o5BN319v1FTSwKAn
	 4HkRRKoEDQfamEqo9eLKnWFGR6mNVZbWME5uJZZGcEulBSPfjJaQnRKExuUAPujhdOd20
	 1njz/8TSK9d23gCkRXOd9IXCeHnfPlkQaB1Bh03vSgQTBK2I9YgElEnDLe8aqRbLm3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NzP8/1yb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7052606A31C;
	Sun,  8 Nov 2026 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NzP8/1yb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FA01F0089F;
	Sun,  8 Nov 2026 11:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794136570;
	bh=bl5cMf5oVLZLpdRHQBsSexs2yAIQ352WYuyU3qzrEtQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NzP8/1ybPNNC63stC3DucCJWIybl+rq/FQ/wL5OSXq34eU8VNUi+Rr2FmZ+7JDfpX
	 /q/h3GIWv+KGMvni/3YslSsUuSYNA/bibl2oyyk25mDhu1zGypHExPBRsmRdeSKKTL
	 C18jQdxNPnk4rcbgg3dgiGVaAtX+zWTP/fDn1IVBV3mKnyLEHhFnZTsnVRy5DVXoqF
	 49smLFhWnF/AWJAkAtP3j97FssR/RK3ZBWokBwVe6Ovqtw7fVwHxIIH0Hq1wGQjpYD
	 1rkRaNLGmFi8DQ389fQP2shS1zMTkCF1gDH2WStNKSxNMMbDkCZ7QPE3yaOWAR7MQF
	 s+feziLNjUC/w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 65F052BF8FE7;
	Sun, 08 Nov 2026 11:16:08 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
 joakim.zhang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
References: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
Subject: Re: [PATCH v5 0/4] ASoC: cdns: Add Cadence I2S-SC and I2S-MC
 controller support
Message-Id: <179406285258.3424803.5597609174879659303.b4-ty@b4>
Date: Sat, 07 Nov 2026 14:47:32 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uhrYFssuSak78sxGGNOhK5N5ATA6z/IM+mXG+2w/KbE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+RP6Y7Vrcy+35eMN+5Yr0Z+FStwvjXWa9+trr8fKN+
 k5rnh08HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZgIewnD/1KOl2V769pP+rzl
 jbgo+DjoXkT0lZ+PppcJhInLxM+JFWT4zaZdbNrtv1cuQZm1J8NZX/3Esmydpzqi631kpC/4rJ7
 BBQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 06 Nov 2026 18:52:04 +0800, joakim.zhang@cixtech.com wrote:
> ASoC: cdns: Add Cadence I2S-SC and I2S-MC controller support
> 
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> This series adds support for the Cadence I2S-SC and I2S-MC controllers
> integrated in the CIX SKY1 audio subsystem, together with their DT
> bindings.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
      https://git.kernel.org/broonie/sound/c/5d2a3da8b792
[2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
      https://git.kernel.org/broonie/sound/c/81bb3e5fda49
[3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
      https://git.kernel.org/broonie/sound/c/fe1cecba2f2a
[4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
      https://git.kernel.org/broonie/sound/c/a6feafc3bbed

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

