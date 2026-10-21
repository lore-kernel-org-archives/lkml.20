Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588235;
	b=ZRMZbS64G0IL7xshkp5z32ALJocdYjbdrUKLGrmR6hFrOc3qjZ6Fz19oMKg6ju7C9X/s
	 1h2xEmqQHQVkg57yJxnTpFv7coQ9osPCmdJM3cOGDYTAIzhqg3uCRuP3Fw7tunzVzBcaO
	 DeVH3Ya/5FBlnSgg7M4pKo0HACA5h4ZWw6fVl4usFCQ+wXyBwgV6vnBRFsc7ee2gNgTTl
	 EuLtZNKRZ+cMpoQmxirX2GK6kOJRtwohkVopjj0znUgfNmDBUYGfGEt4fYyFLn2JdnCzF
	 2ay1snZgSLWkKAuihlEzvttxjGe4u4zqe0LaVe1+6wNtK+AUNvvG/OVB2hsFthuo5Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588235;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=bBETWTnxgsHkOcOekkEoq8ejz9dYxGjVkKxycACZ47g=;
	b=lrWIU2Yn1CGmTXOfccjtHJ1i1r2Q2cnCwZKEwXxJd1ubY/IcONckbBaqERJK/KTcDb/3
	 S/wrNNWiE/kr8ct5+RQL3pGiw7LulQSN8PT+SQYnNPlMWMuHd3yi25yY924d83RmyhSte
	 exf4f68JUCtEdHv+rATp0T7OsaqPr8pyAUfarQXuASfyRVwqYRp6NSrEDgwUN3zG4pgyb
	 XVo+xCI++kdSFnlrnzcMDC88Y1qF04Ywjg38+t9VU/H2q0Bp4cwsWLKrAgb5jiCxKz09k
	 ed6KQB9mrfxzSOoV2W7kLb+Di0EIdoaOWQlt8BLU5Wrlura7Zc7CRi/LuSaEClAmwTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qgzxPSMr;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F62F60A262A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F62F60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qgzxPSMr
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DB3944E41297;
	Wed, 21 Oct 2026 13:10:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA2A6606E3;
	Wed, 21 Oct 2026 13:10:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5927F10328D61;
	Wed, 21 Oct 2026 15:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792588230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bBETWTnxgsHkOcOekkEoq8ejz9dYxGjVkKxycACZ47g=;
	b=qgzxPSMr64yycANWhy8U4aGpnADy/vIATLDq4M6G17dx+ktoqTCqAm/Z700n1KD+NXcGmp
	BcUaGjvldmufkQ0M3uwUO3kz2wlQPw3Z8fgDls4uhKDVsrqcqO4nZfU5QgDqj6IdhebImD
	wX8P/7zzyKG1HYkkS0QgCBheoIfWxxPAiggw63d8LX4q9/Mpw1PFm5uedL1wRJ2cBpDhDw
	RoANyI6PLvuZQ0SZGu4cgAn3eSkHkoHkEGVsbcA7VLclkVj2WsJxAlrAWo9079lmD8Hq/Y
	8DKRzyUM7DoF9jaUceBHG43paWC+WJtuoKemQ3MuMd9QZTOyeTY3AqOwON/uaQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 21 Oct 2026 15:09:58 +0200
Subject: [PATCH 2/5] clk: Fix v2 rate negotiation with composite clocks
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
Message-Id: <20261021-ge-clk-lcm-v1-2-246cc35b5ffb@bootlin.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
In-Reply-To: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

V2 rate negotiation walks the subtree using the composite hw clocks (the
ones that we have acces to while walking the clock tree), but compares
it internally with the inner hw clocks (typically the inner divider of a
composite clock). Since these may be different pointers in the case of
composite clocks, the comparison won't match for them, which fails the
whole v2 rate negociation logic.

Always use the top level core clock instead. Comparing the top level hw
clocks instead of the core clocks would also work, at the cost of an
extra pointer dereference.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Brian, if you agree with this change, you may keep this fix or fold it
into your series, at your own preference.
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 745b13a77c83..349c35ab8a5d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -917,7 +917,7 @@ unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesti
 
 	hlist_for_each_entry(child, &hw->core->children, child_node) {
 		/* Use requesting rate for the requesting child, current rate for others */
-		if (child->hw == requesting_hw) {
+		if (requesting_hw && child == requesting_hw->core) {
 			child_rate = requesting_rate;
 		} else {
 			if (!clk_hw_is_enabled(child->hw))

-- 
2.56.0

