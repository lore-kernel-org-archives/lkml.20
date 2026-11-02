Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623951;
	b=cq409ZUD5Sd0F/fRgo3cTmCHicTzedCRHgXmfhoTTcMX7HZXbADE5XAIRQUe4RyqiCoK
	 o90YZWojbPGqjPwLJo4TiI6nOEDpCu/nHc1JtpEAU77GGpxYcdAvL4ORrLJCt1mG3SzrN
	 NscTzdb/fhJb1Dy3BzlvybpCEDnB/wyPvHUcpo57W8X8VR36InLU2kqtdYPoHlhTjuUab
	 8q1os68TLP7QN18zhJSSsSbCmRF7l+oK0oOKr4CpYnprc+T6bHu1N80k65hs3bPzi906g
	 hstHHfoVDZVO5IDfhIbr7eX5DdQOwF2ME7/3x69GciNxrMmfMkqG+eT0L6nR1xrRrvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623951;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+YRXx6QbkPty6llsFxUMyoQ+8oEYhrUtUmf5vBk/zCY=;
	b=Ft897QSKpr3+UTPzE5Zcq859E8ok58LP/Q2W3HjMBT5G8NUxWHPsTDmG4WySy7a5YfsC
	 bo8es8rSgjor2wDlignqoRbijB8QQW4x9G8/6zoVGRHNeRyBHDKMl1NWDykehBybhqq1f
	 KEpaDUUK8Rgkxc9ADjcvkSuf2MviFcpkVBUBsXbmusnq7k9qzFt3HnUAI/51V9y+GOyKG
	 4CfWKEB4O5gSz6Z9SGD7Fus4sSE2mABC1/rNhyDIYnGugo0K1oPmVFkIm0z0KWvpjJwvI
	 WxIB/JovPJr30cbJDFMdOi8lc0HjOH4ivYyqUWBCM5DDb7EJoAAWnTiG6rLcb6JpjBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24944606A327;
	Mon,  2 Nov 2026 12:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24944606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 7133238BCB;
	Mon, 02 Nov 2026 17:52:22 +0500 (+05)
Received: from laptop-ak.in.ideco.ru (unknown [46.36.23.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 3DD3F32EA5;
	Mon, 02 Nov 2026 17:52:12 +0500 (+05)
From: Andrey Karelin <a.karelin@ideco.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Karelin <a.karelin@ideco.ru>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 0/3] staging: media: av7110: check demux and net initialization in av7110_register()
Date: Mon,  2 Nov 2026 17:51:28 +0500
Message-ID: <20261102125149.82725-1-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

av7110_register() ignores the return values of dvb_dmx_init(),
dvb_dmxdev_init() and dvb_net_init() for both the main and the optional
budget-patch demux. On failure probing continues with half-initialized
objects, which leads to NULL pointer dereferences on first use or on
device removal. av7110_attach() does not call dvb_unregister() when
av7110_register() fails, so with this series av7110_register() unwinds
what it has set up on its own.

Andrey Karelin (3):
  staging: media: av7110: check dvb_dmx_init() result in
    av7110_register()
  staging: media: av7110: check dvb_dmxdev_init() result in
    av7110_register()
  staging: media: av7110: check dvb_net_init() result in
    av7110_register()

 drivers/staging/media/av7110/av7110.c | 49 ++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 9 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0


