Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853273;
	b=KboF5Ei5zbCUYaC5MtGsOJvRUsqAXRRwqfnS4lWhARKKrAWPKpvpFW9rZNi9js/UgfqC
	 RgNW5zxApViYksdTenKe/mHfCN8Hbu8iT7f19CDoKdkVjXnzSGSiJ0s7DZkz+mWPZgRBC
	 X1zrXN3aFOFaduguYKkp6Za+RJdS8ILJapo4DXq5nOORB+t+Ov2LKPUbQX2tGOOIJSZ8P
	 xx6yQX1hmXeE4/+4jIhUaO3d1XtuaJF4INyWVTl4O2o2lt7tMr9oJt2LyOHJgTHf9k5EN
	 dfy3++f7eFA7o9T3adRHrSP6scQRCLkPb8RRg0Vr1RkZcwvrC9tf+PmcpbNy/lSxS5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=t+D9qVbzCCKAJlVz/auwzp1cE+wp8QYsKc77PmPP+qg=;
	b=FzE85iHmJrrAbUN35H1TeaXZFVCBeaY4Hl7gzIzRaR9bFxJDH/U0aEJoMh1dTDVyyjZK
	 1Gn/I3PdrfrWL/W9zAiqCvYxZwVHiNDoUevyf4fgksDVr7yK6ZozFqr5Sq6J5zbPKHEOH
	 YtlbYrOmf5AUK4EEr0nBopWunNsrjPRaL5ibBUvFA49Oz8dTd+ZIaOTu6IfM9BHOdVbLb
	 sDccijV8mpFw+ty5FMIZqOvm7Xv2X5ijHHPCNm9/9e5tVeEQkCVgeMMRfB3+Pq0W5fFKM
	 NPnWzhvswVe7dT91foY0oKAANmyx/5g1GRXgOkRpkoxWHOnOeAKyMQCqztCVeYPKPZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b="Cx/7cwdI";
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2BE606A33A;
	Mon, 16 Nov 2026 18:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2BE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=Cx/7cwdI
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 88F3DE838C9;
	Mon, 16 Nov 2026 19:21:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1794853264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+D9qVbzCCKAJlVz/auwzp1cE+wp8QYsKc77PmPP+qg=;
	b=Cx/7cwdIkgU93nX8vlrCf93E8a1L/z4qI4Rs3UskVgqIWhaKgJQNxPICpAhLGfhn5V4hJd
	fZUd7CAyNoDFPwVflrokYJNBvdTRaUcoXj6E2EwZBSjBWDduRbRq1Hx5aRcEudtgEKyDTD
	C9bM6MnIeBiO8W9l81W+w8RA8XFpPnvGXny7uLON8dk00TrRCdLGMCPlB4OAJBbsjA+T2U
	TNilQPp9FkT0LKykELdy+CTh/VhNH7Wdl9retX+/yQxnjAFzqrnZpB93tdGbX73iP9PXHa
	rfIPluYx/B3FiWLr8+xq7u+R9XB1S0u6BzvghZ9h9FU9+Zy6iHqa7QZJH0zhGg==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id 9X1y2t5B0bOc; Mon, 16 Nov 2026 19:21:04 +0100 (CET)
Received: from p14sgen5.. (unknown [91.25.97.186])
	by szelinsky.de (Postfix) with ESMTPSA;
	Mon, 16 Nov 2026 19:21:04 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: netdev-bot+sashiko@kernel.org,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Kyle Swenson <kyle.swenson@est.tech>,
	Ross Cawston <ross@r-sc.ca>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 06/14] net: pse-pd: check the PI state under the lock when setting a power limit
Date: Mon, 16 Nov 2026 19:20:52 +0100
Message-ID: <20261116182052.1262742-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179477645553.3136.3930514306381646741@kernel.org>
References: <179477645553.3136.3930514306381646741@kernel.org>
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

On Sun, 15 Nov 2026 21:00:55 +0000, netdev-bot+sashiko@kernel.org wrote:
> Does this description understate what the old race did? It looks like
> the budget was leaked permanently, not just reserved for a while.

Right, the budget is lost until the controller is bound again.
v5 says that, and fixes the old "powered" comment.

> Is admin_state_enabled && isr_pd_detected enough to show that the port is
> actually powered?

> Does this still leave part of the race with pse_isr() open?

Both were there before this patch, which only moves the old check
under the lock. They need their own fixes, so I keep them out of
this series. The cover letter lists both.

Kory, are you OK with fixing the two older problems in a follow-up?
I am happy to work on them next, if you have a preferred approach.

Also, are you fine with the rest of v4? I kept your Reviewed-by on 8
after the small change there, so please tell me if that is not OK.

pw-bot: cr

Carlo
