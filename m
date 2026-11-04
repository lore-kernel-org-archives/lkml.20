Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833688;
	b=rLx40uM85iANOK8Hbs01e27MzOCXppFoCuNJ3Bbbh056YcJvKtPByQetyTDrbWeglC3r
	 0A/fckfB1DyDmbyfT4KbGJo/llxuFi1dl2ASyuuNTwUV9eZgKSS6K2Ax0E+XYZdQ7Nzzc
	 ZsCHjX23nNujPKeUv3+Lkz2+1V+LIPh09fy3FW62mr/u8BoKENS/zfuwHtDlBvRrS3+D6
	 DpYrpVv/sGxzzo2cpFOUVhuDWbYb8NyxkdxPYHaIHKNmby7dr8zXiSOJwlEgUmPrI1c6g
	 Z3AjXptF97gdnTzkdDT/9iLayMJO7z4M8YLRuqrI9sOHNHumRmiIC28CBBOFhZWqXCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833688;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=T5hixkUYsoVhbq+pfMR+Tlt/h1LbVABTKfHKw161M08=;
	b=miJjt5uScYcsTEJl1KuKX9akBneOl+64kR4lFgiO//VVruYYOeyE54QF//UjP+UMbKlO
	 2hLEpvHWW2zphZIP/1VM+IndtrJU92vzgpQs8Ih5RQ1xRnZWNGD6Cse0Fna8cW9SkOOnk
	 sz+AE107hAb+gllBQFSc9d/YbU6mGSaUTd+Crw5rsZW0aNLtaNKYk1R8zRaqx3Ytvzs5G
	 0vvN57jn4RWdDkS4it38gsno5n3BrcqoR81SZPfEIHg28NJuGonZFwfDKaeGL2B95dEXD
	 DRrwyWPtCV6jppOa9jiCNAC5LcTcX53xEf6gOrxbIKQlz+je54TpZcQogDpu/Ter1dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="QcFwN6/k";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2E0606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C2E0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QcFwN6/k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793833685;
	bh=sBmcSlXO+5ghD+tdjwD3ULgEcdtciNYZ7X7GzWVXW4Q=;
	h=From:Subject:Date:To:Cc:From;
	b=QcFwN6/khmMWJFxJXIV4VLDmy6RdKzZcBa9R/a1OliI9WZOEsnceGWd4nsxGP3KbC
	 mooAFqHLYT41Cfy6Q+6WkAwbiX/JrJ8JtLf3ILmmnQHaU5J5GyH/kYs0IgJZEIkzxj
	 RCDYmKls6LlUxa3yvwlQMEKfuNa6CAmdCcxcnqCTL9sxwqGyFVge4WXAW6ulAp8V4P
	 7Y/KiSZ5w12XSJvYXRTVcUAEhxwCEsdCJwX8qs9zlPW1LFi7abl55TYkXNfl+N+Auc
	 y2gOhlTHqZewKn3WCeWlWPIrl2bsg/T21a1vCSlYzlOYowIBWjf8L/rR4BGmFklzfA
	 INcizRHdPAFZQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 943AF17E05A6;
	Thu, 05 Nov 2026 00:08:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 576B448002B; Thu, 05 Nov 2026 00:08:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 0/4] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
Date: Thu, 05 Nov 2026 00:07:56 +0100
Message-Id: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOyw6CMBBFf4V07Zi2WB6u/A/jgpapVJGSFhoJ4
 d8tmLhwpctzc+fcmYlHZ9CTYzITh8F4Y7sI6S4hqqm6K4KpIxNOeUZLWkDfTOCsuqvG9GC6zsL
 oJQfVxgy0eQLWdSakyHVRHEjU9A5jvE2cL2/2o7yhGlbv2miMH6ybth8CW3t/zAUGDHRei1KlT
 MaTk7JtW0nrqr2yD7JOBv6RMkrZD1IOFJAyqQUtU1Hit3RZlhdw8rv0OwEAAA==
X-Change-ID: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2374;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=sBmcSlXO+5ghD+tdjwD3ULgEcdtciNYZ7X7GzWVXW4Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrutXrIAHNh8u7a5iUg7BEu8xsZX/zLLidc
 8BCQa30eflbtokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq67rVAAoJENju1/PI
 O/qavmoQAIQ8hE9uq5pgAFBAuXP8C2nGlE4UIcbWSEXrJqw5XkXhcF3M0gIu2F/4CBgWRz5uU9S
 3LOlYz9CWa76ZJxZQZD5fF0hxvIdZxhkxazgRt0IB/eVa+7luPruk+2Z6F67RzbGinWjlBQxpOS
 dw28zNF3jwwDMbfcpO6cCM2G/YN7dXfSOlkN9dDBm+WlBPIGYWTDrGr8HMvgnJ0iWvRTagfWGYD
 zG/DWyQ69LRlNRi39Y8I2nK55uQKwxK2qwxjc6pAJd3Nqr0iZPTlxoHb4z4D2jegCxO2xWIBHDu
 phw/bYGV3ZtNoJ/liS5k5Y6Ni6SeTG7m5PL364rFSkfRfrzg817ltuD6lYLbPCC4wh2z5NaPh+S
 9Fl9FKfT0uuIPkYWPf6oj9TO1H1pcMhCQSq/hPPgH8J0LMhHFupodwWojX4sA/uyVPJd7knRSz4
 L8k5oLMYbSqOcPxS+IVsPfOnniBfrce9cz1f4pRAeenKqWsBCD6B2NqgE4bRwA7LbG49ifSxm7F
 nnt80t9i/WxV8PY746PdTsRdxeof0G//h7adZva8WhdAfNAVyD+0nW+RKiTbb9tFSwD/tIbAA+Z
 a6uQMINd/nQ+zDlJQQISBe6BqWQux8HIx//cC20KFavQjJ/WhB+CxOy3ILt70nbJtm1lUjDwvrN
 WAAqbYk+nj/saTUM+0DE1XQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This was noticed on RK3588 EVB1 when resuming from system suspend. This
is technically a fix, but its unclear when the bug was introduced and
system suspend is broken on RK3588 for quite a while and not just due
to this problem. So I think this fix can be merged the normal way via
linux-next.

Changes in v3:
- Link to v2: https://patch.msgid.link/20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com
- Fix do_suspend negation resulting in SError on RK3576 (Sashiko, CI testing)
- Ensure PHY ports array is initialized in clock enable path (Sashiko)
- Cleanup properly in clock enable error path (Sashiko)

Changes in v2:
- Link to v1: https://patch.msgid.link/20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com
- Move suspend exit code from rockchip_usb2phy_power_on into a
  separate patch and reuse it in the clock prepare function;
  move is done in a separate patch
- Updated commit messages with proper rationale
- Added one more patch dropping useless assignment
  of rport->suspended directly after calling
  rockchip_usb2phy_power_on/off
- Add one more patch unifying and simplifying the debug
  messages for phy init/power_on/power_off/exit

---
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Igor Paunovic <royalnet026@gmail.com>
Cc: kernel@collabora.com
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

---
Sebastian Reichel (4):
      phy: rockchip: inno-usb2: simplify and unify PHY op debug messages
      phy: rockchip: inno-usb2: drop duplicated update of rport->suspended
      phy: rockchip: inno-usb2: move suspend handling into new function
      phy: rockchip: inno-usb2: move suspend handling into clock prepare/unprepare for RK3588/RK3576

 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 92 +++++++++++++++++++--------
 1 file changed, 66 insertions(+), 26 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

