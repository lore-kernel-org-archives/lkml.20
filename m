Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354151;
	b=kWBiEBlqoxlR9XXuRRydGMaBgvpqo71fYV5BIIU+r5Jat4zGfMLpdBHRQkffcEgI+36z
	 /VlqjLQugd7pTJpk5c2nldDytQ3PjLcMyNQpQ12vxrn14zvNjxyywlMQb7wr6So5H6+Tn
	 Va81ikXVroNyJB7rTXZX9UF7Q1/NOtJ85mxtTHIzLZ/r9sgdMgjjDkP/XOaSRR/fyMJNt
	 7E53feiFU0UZx/8XUulk0VYKbdTe/9TgZ950huvl0DHOGfSvDEJpDsdOkX0sApdQApH2d
	 NRQGJGO1UrVdGTgoF5KboOi6nc+evjV2IL3McK8JF8RTtshfy6fwEcxYtYrRMPwAWGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354151;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CsUP7uvted68zB+90tj7YUthWbvQdljORHl/K8ISItY=;
	b=AL7UtBUx9qBSAPv9GDgq0VS7MJeC6KICl2+Upmm8pHkSiDXZxhDZdYkSEELCfqjgRzwZ
	 0n9mVos51nxJaR2/bjc86TRLmB+Bb6CmhdyRavHfqMXLGRQVA2g3qQAEaX+2LrKsFqDFQ
	 wxTaJLCfDoTw8emYNcpxSq/K04BjLe7KSSBLAzuuE+9M6hvWRNJU9AMqUzr4ug4qMXxS5
	 bECHRzUOfv3WBJbZYROvECTzIXXFRTTWHEkMqQCZQJScizkpCDcAtGnYAw3aFUxsUAtM4
	 LXw52KoGa2Dyu17Nyn9mDlxoZwZAzrAVXYS4/TqwrtCyWBrftjocktqp+KUO9vg2Q/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.ch;
	spf=pass smtp.mailfrom=protonmail.ch;
	dkim=pass header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=NAxcib4x;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C15E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C15E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=NAxcib4x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1794354148; x=1794613348;
	bh=CsUP7uvted68zB+90tj7YUthWbvQdljORHl/K8ISItY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NAxcib4xPHjyl4LCjL0Kc/O+zU6j9SE0tP7NP3Ac28mazEbo4HdkOYj+YZB7qFJ8E
	 ipTi+947Arq+aNsLlToJwJ+VulJIiQqjb2Yd00j5vUf2U87v0TjmB/jibY27o3Pr0U
	 z5m0F3oCZgLx1ih+Ey8c3lkmWEHrXkXgMhsq61+Vrg1Bh2KpaNg6F+xrB/5z8GrwJs
	 UmybeO7ll4pQib02YBQjqMCC6QZf3okOSJn41VY8WYl+pLsaqSz0FCUA86GpGWlJ/l
	 IG+LWeKxq38J92xytrAdKHW9tl7zEafEnKg5dJvOGvlvWfw4/RhWz2jd6RHeLVt0Je
	 iP8nW3cnnlMFg==
Date: Tue, 10 Nov 2026 23:42:21 +0000
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
From: Ben Grisdale <bengris32@protonmail.ch>
Cc: Ben Grisdale <bengris32@protonmail.ch>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for domain creation
Message-ID: <738177eZDQjVkBbNjeXNQVKLv3V-twRGcbGlGk02RsZtm53MbHqt7pcsoigp-ZV9xh_ehAVHa4ZZEvXLXFbrOw==@protonmail.internalid>
Feedback-ID: 27291966:user:proton
X-Pm-Message-ID: c730cca830f1d3a8b357a1e7430262ae4c743f50
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi folks,

Please ignore this V2, it was CC'd to the lists by mistake whilst I was
testing my mail setup.
It is identical to the patch in V1, which is still current:
https://lore.kernel.org/all/20261110-mt6397-irq-num-fix-v1-1-81d17454194e@p=
rotonmail.ch

Apologies for any inconvenience or noise caused.

Best regards,
Ben Grisdale

