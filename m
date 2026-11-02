Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623302;
	b=QiWBZ0+0dxHUenCOEK+STqeANeNTxCrn5LwKmMchpF+km/XWwRYNm00gnczg4Fdn8v01
	 aeQIzLGzi7cemvU+QFRwAByOD69HE8OXXlamTq8nz8lgZ+XaGUI6VMVrg17n8snIsJbww
	 o9e8ptBUvw+J3MuYfGHg351PgPEuso8VMBE14lckOD1n0n2drhr4s1snWZKIF348Aebpr
	 Yp2zT6JRI27XLvima5QDPi8AOKTQ+pnYNWt/jAUhvxp5eU5bGVGzYNtS85N08VjEoUrCI
	 pIZ6UlwO8wIMUjdS4fJMlqnA31cgavVJkG93RjQJ8RKNMe/D9B0tDJvkgD7tDjOruIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623302;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0K/kk/xg/UgjnFn0zbxERZn1yCSzXC1LhAPfI4G0AyM=;
	b=uBaPEQVLuY3WTlbMw+ws3p90FCfYV/vYl1PfdRMTqK//FKkCoRs9pDQtTXvTWSe6pnbx
	 loFBl0rKG1su05smU78cUqH/oKAXNglQzrtA0yp3e4DbeY3RS+MFsjhe4F603aq+Ubn3m
	 /X53/7Mu03n9sPkM1dKVFxUxeev1K/2mgsLx9gCmqYWQ1cV8KXONn3Qht/stCmVrWr6lh
	 ZOZFAR52ZCvjsrn9DYHl/vmgq70md4qglVGlCCYwAlf368TdDRTb2FU+XM6jvazKf8xJu
	 J63WcgzDKWdX8fwcPFQ69EQLeyAwjoIPdl0TueXOtiOdz7yZTcBSHUpVfmoEiT5PSNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuYmJL98;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E414360A260C;
	Mon,  2 Nov 2026 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuYmJL98
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772A41F00A1A;
	Mon,  2 Nov 2026 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623301;
	bh=0K/kk/xg/UgjnFn0zbxERZn1yCSzXC1LhAPfI4G0AyM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cuYmJL98mGCdlR+b8kZHbs6IYQpM1ssGtPOIFt4UlYV3Ho8nu/80Q1PUxNJW3Pby1
	 GcpY1my0QleTLD9qriqbgUqsBVseh2lFij+pBbtAYmDhYqa1HBuF5j4N2gDdiRFw1p
	 kOA5o1JGwQSDQ8BAweitbCTiCov09gQ7kmRiljaloDorMEMAc3wlLW7jLiqvgwRP8m
	 WqCci9edXT75mNlPNBVTJxImh5GErLwzYl0kAs/PNfaR6DSWlAlKe72JEnMplVrDBQ
	 ItWFyrVgW/dNko8XjzJvOWhneL8WtVi/bcAxiqTCIWtzd8Z2txHtwBX1rQ97daGxD/
	 3RFY/zP7lgMtw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id BBF9323103E8;
	Mon, 02 Nov 2026 12:41:39 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261029080143.12304-1-phucduc.bui@gmail.com>
References: <20261029080143.12304-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: google: Fix bugs in Chameleon v3 I2S driver
Message-Id: <179357819218.1716893.1856349760296131594.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:09:52 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lb7FDhtSFoFBUS0CPcz1W2m9j5YeiDdYOI2/pp9DguM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJetDL/N7ZPurD3drXoNrc35gzz1rMqXz7/y8xCzFHSd
 PLlbMuEjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzEOoWRYYe648a3gn4iN67y
 /l57VXJK1sPc5u0lr36L/Kq/maOVacjwz+Dtqtog1SKbfT/DWlayztjE9TCRZcu5jdrSLRKBrTO
 Y2QA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 29 Oct 2026 15:01:40 +0700, phucduc.bui@gmail.com wrote:
> ASoC: google: Fix bugs in Chameleon v3 I2S driver
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series fixes a frame size calculation bug, preserves IRQ error codes,
> and removes a redundant error message in the Chameleon v3 I2S driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: google: Fix frame size calculation in pointer callback
      https://git.kernel.org/broonie/sound/c/30a43746cdd3
[2/3] ASoC: google: Propagate platform_get_irq() errors
      https://git.kernel.org/broonie/sound/c/9e374e2aebd2
[3/3] ASoC: google: Remove redundant error message
      https://git.kernel.org/broonie/sound/c/3e67930a43b8

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

