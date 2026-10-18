Received: from out-93wp-a15.jellyfish.systems (out-93wp-a15.jellyfish.systems [104.207.68.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426B93D333B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.207.68.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792367601; cv=none; b=ODIRVhOMN23qGu27021TTYg8Z37ipgk+Na4OiTDdKUOOxv/QkVs+Q5v83wv8b9Ccbu2zuK4a2TYjsbT20QmW3rosrXJ/uLa8P0QAJQA+UprxBsy9xKt9j4zniuF1Z4hd++x7vD1VvEwuZHuZIjy1zPbzxOoXYk1tvIqLNVEuvfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792367601; c=relaxed/simple;
	bh=0M9AV0zKaYPxH33LexUfJwGQ/v3motOjDCDzZ36TrIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LOOUj+zUIJX7Jkq9+1np6K6hh0ZoI2n4Te7t8i5hzk4k4tSwySAXTHh1PlwRIRCed+RT94NFIliht0tU6TymhTe8vrt4WcbT8jnqeyM2xq1u/wF58jaTrw4ZYtej3BGXNleOlG3d1TXMJCLp9kk9JhPFwwKhy1QL//dG8/Tg9Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca; spf=pass smtp.mailfrom=r-sc.ca; dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b=CQtA2faO; arc=none smtp.client-ip=104.207.68.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b="CQtA2faO"
Received: from DESKTOP-290OH2S (d207-6-150-133.bchsia.telus.net [207.6.150.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j7FMk4z8Zz6tkK;
	Sun, 18 Oct 2026 23:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1792366355;
	bh=0M9AV0zKaYPxH33LexUfJwGQ/v3motOjDCDzZ36TrIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CQtA2faOW4+Jhx0fsUk32/sNj1gtazQ7DxdH7eMFPVerk+UxI0o47BcPG4Ie9TBEP
	 xFCugDB56xYNHBgG+qfshuQn+/TuCVOvlkce50BmJJUBXvr+e4kI1axZaBPxivv/dn
	 Iq1B/DEsKS4U7NTiKNZnf0bc+PkOFMvJmBQeI72wEYoeTw9S3zBMOajhuoExKd8A9r
	 DdW5QmrjOUDl7GKg07Tv4iAp1KTa5VTNOXaa9RcoS/elmIFlEnZFTKcGRIZw8BUHyz
	 rFlvyjf5CN6mtz0QrAImITIH8DJT6xapVyURz3QDC1tq8kUE81zDsZqIPLS9VU+gM+
	 q3TyJza+LmKDw==
From: Ross Cawston <ross@r-sc.ca>
To: github@szelinsky.de
Cc: o.rempel@pengutronix.de,
	kory.maincent@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	piotr.kubik@adtran.com,
	saikrishnag@marvell.com,
	horms@kernel.org,
	kyle.swenson@est.tech,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ross Cawston <ross@r-sc.ca>
Subject: Re: [PATCH net 00/10] net: pse-pd: assorted lifetime and error-path fixes
Date: Sun, 18 Oct 2026 16:32:29 -0700
Message-ID: <20261018233229.462-1-ross@r-sc.ca>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261018082314.48950-1-github@szelinsky.de>
References: <20261018082314.48950-1-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: ross@r-sc.ca

Hi Carlo,

I sent a fix to pse_core.c for net today as well, for the budget of PIs
with software power control:

https://lore.kernel.org/netdev/20261018182005.1193-1-ross@r-sc.ca/

It changes _pse_pi_disable(), pse_disable_pi_pol(), pse_pi_disable()
and pse_set_config_isr(), none of which your series touches, so I don't
expect the two to get in each other's way. If they do, I'm happy to
rebase mine on top of yours.

Separately: I have a driver for the Realtek RTL8239, two of which a
MokerLink POE-10G07110GSM switch drives directly with no PSE MCU, and it
uses devm_pse_poll_helper() and the PSE LED triggers from your "poll
path and LED trigger support" series. Is a v6 of that planned once these
fixes are in? I can test it on that switch, and would post the RTL8239
driver on top of it.

Ross
