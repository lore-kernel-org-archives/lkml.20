Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577397;
	b=x4mpvuOTudjM0dJrCBb7HX3Nzt3iGnZRQPJJkBZKvsmWYTOtZhdI/5FTbxdtGFtdu0Ib
	 jSCqgLTREybZBxO3Prbzyvf0rdgfuMOc+wMrhU0qQpxiCDj94MVflRKmGoEsnuaPzXg01
	 R+C+AKZoveYHGWkwTmBqKbQpjscBc2zPhzuCm1/veUzB42XRLOFhugDxdzkQrqnbbc6Up
	 l6h2L07WiSf4vVAR3ngWu6BXlCeZn10zMoOr28gxLFYNpylRlF/HqCDTE8pZpvLXE+dsx
	 AuYu2uqLdU4c60suYxdpIkh21Xaf02ByPSR3PBoXM7enkqat/VlrDGfWZapd2ZhQOVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577397;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+AAZ+EVzgHbvUtqw5ySjJ+voYqrjmDiN/ge+wXZic4g=;
	b=DmuPVf2CssR7r1yPSeBmWmyS7cDowqzU5fgAMUqRtt8vAXw2gqaJ7nLMEfzIVrwUdvLO
	 XJzPqZD2O/1G5yMppyqrAazrB6yjt5Bjt1wPg0AUwx1sQ1cPPFvM7ekSXoJf22vmP8ECx
	 oPR6dWLPPswXalhYHWsVoj5p8ArpaojRNnjri2AeumB3ePVTz0VaX2jWrnsnmTMXlGIxI
	 1b1wEsIMU+7DibLAwDb/3wXpz86GO8Rzmxg3fOwMCtiZz3BQE7c/po5cUVypUUND57G4u
	 aQGLvgyhpiFmQRnlHVDnIlIRdVbwgPjDravmdiabrc7OuHdT9bFapWD2bfTIHHBPXWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7W6LA7N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C358606A324;
	Sun,  1 Nov 2026 23:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d7W6LA7N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3C11F000C1;
	Sun,  1 Nov 2026 23:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793577397;
	bh=+AAZ+EVzgHbvUtqw5ySjJ+voYqrjmDiN/ge+wXZic4g=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=d7W6LA7NOHh53J9ApT5nBM3eF8JJJ+9ADWgqq3AuElOWEzPhhyLdimZht6FVdhgA6
	 ps7YmlBr+ZZ/lMtFrqLIjV2RmlkhfoxNO80/V5wNsN9AHkFTVl1K97/IuLqCbrBUbL
	 oo93ovmtO5Qe2uvU0DZA+yRWvsn62XFPZ8SIbFLHXIIGymaE1b41TdPOF1rezA8I6c
	 W0/KIzQMI+aWNAAdcHcXvEfnpTrsBqPx8lIUDCfHWp+VvmvTPlHwDaecWgK8pDTKGS
	 /ejwnlbAxitGYCYQUOeqYkpYWWMHgspNfXw1cHARkFp9hqE2TkbxkowLMgcj3bz9zO
	 JEOojoLiBgfkw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E91D021426FE;
	Sun, 01 Nov 2026 23:56:34 +0000 (GMT)
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
Subject: Re: [PATCH] ASoC: mediatek: mt2701: join the IRQ before managed
 cleanup
From: Mark Brown <broonie@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <gm-top10-20261015191529-g154-c729db287fde@mhun512.gmail.com>
References: <gm-top10-20261015191529-g154-c729db287fde@mhun512.gmail.com>
Date: Sun, 01 Nov 2026 23:56:33 +0000
Message-Id: <179357739313.1716893.14542829236371668404.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=340; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7pcJBRynPms1NcRxsn5UpS1LOfo/KsWlsoodRvRXnSU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKeX9xUtkxh3ok+w0OHn2bvkzJXsju6vevTpj2b9v9a9
 9Rx59b5FR2lLAxiXAyyYooscVncL+tLXq/hO7iwDWYOKxPIEAYuTgGYSM8Vhr/Ssw9PirQxiVSN
 W7In75dI4LuMC3Nq5nevnVOqdbfUcdYjhv/Rf6Ye2yvYJXeZxffcY4ag/QceH3xvM+WB3smXdo1
 Jnx7zAQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The IRQ is published before the handler's arrays, regmap and clock state
> are ready. Remove drops the PM reference before managed IRQ release, so
> a handler may also overlap clock shutdown or subsequent resource
> cleanup.

This doesn't apply against current code, please check and resend.

-- 
Mark Brown <broonie@kernel.org>
