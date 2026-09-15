Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F643C8C48;
	Tue, 15 Sep 2026 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480208; cv=none; b=CH/GGvQPcFfwKXXYqIvY19QJIIfzidd97p/+CjVf+7CckM0+FRfJdLQUb3goNKCZhjC6Q4NtDHzfeje5TsSTANCat+nTHMHKreiaIPRUvwiq9ok1Rsce07l3a0NGxzVA1Mqo6fwrTr0S9D+Thkd6hcAGy4rXnMk681HuQJjr/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480208; c=relaxed/simple;
	bh=vswEIu9Vf4rsFEgSwN3S8wzjXFBYhtVhUdWv0v1IcQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTlpvKZuKlALrmWM4A6TV1imXIiUxp2mkQr4JKj7XLYRHn5YWi75VqSDnm9w3Sja5vpjL7NsyP8oc6wX5glo+yijjxUFD5RjSMo9P+llLYWM/9NqLEEzm3WAlmVPaiP5Jklk0qi6PMGZ9LC1IYmena95ckWQv2/JPZAjlvrc9Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z0wa18VI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z0wa18VI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480198;
	bh=vswEIu9Vf4rsFEgSwN3S8wzjXFBYhtVhUdWv0v1IcQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z0wa18VIHXQIvcBUVncI/gS4flzDgHMa8K0sEqBpp5SbSvjxgA416yILzc8eXVAiM
	 oDLhLmloNEg2SjmGrh2DBajGqbR75uLcU0TppvnL228KEazNLKkI1GIpj8tgXfw0Q9
	 Ru9XF6ZkBtxVqbTaaOoCRiFh0NpYCrhgn80UYexThoxqLgY350wqeqaPJjZNGfXF7J
	 1CoxwD29Wjy3FkKk8yPOMwHV74yKCVAQsvBXU5lW0Sa4dtn9F0jSPKaPPul+2Neuoo
	 VCofvpHurPnXjUoZl5VN3WALXycLTXelAQtZSzPj7F3iuT994S2qYUwpt82o7rIM7u
	 L8t3sOk5D/rxg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE2C117E0B0F;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 30673480035; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:52 +0200
Subject: [PATCH v15 05/16] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-5-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vswEIu9Vf4rsFEgSwN3S8wzjXFBYhtVhUdWv0v1IcQU=;
 b=owJ4nAFsApP9kA0DAAoB2O7X88g7+poByyZiAGqpTQVYYVNwwp4mbUZlXo3+265HLCWpxp0Sm
 OVSOMSNL2bkdYkCMgQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qaBj4P923eaOGsSviB7JLlFjPTUl24y6ysLEbKA1SKclz6weNbjNPOx8RrUzXYbCc9lb4vBR2
 g3nzoQEy0tbfG/OuQEgteOjIoFcfJRAJPH6XApzevvDFGO/Vk/SDOyEUEZ8gpi2zUMh/P8ES6g3
 WRwS/wPzPjbsucY1HHYvdFLJ+Lu8Tf0fc6bkvqBB3r+MvNM7ozNTHfTgHw2Z4MfZVuZL/ESDRAh
 UXfDU8TgV2Gs2xcJYlwK38WcdlceBRS9Ih5fOIhPXVa6sSrVWF+wB7bEbgEIJugNqdSG1fOGW1p
 5Fq8UbowaLDrxWj6k7+9/GlSXwiCLZcGfJGWi4AgDkf88Qd4YG8+BBGTghvc66UJW9K07ZMkvZu
 QocIiSiSSOz0yCaGrLZKfW0hJSQMu34YSFbd4yk+4J+IO8dkRby7Atd1PUGrsKn/CmLG0+gFc0g
 5QXmjud+PZ4Z3irkPFDzu/IfYySfmJZdvLHq2VgX4SnzIONTCNZknY8wyZ4iMzDw9nMi9B/eVgi
 NgxOl6O8MlYGXWZ3xsf4n4ITtzybbC/+q6QAm1LMs1kq1Ds8DV9VLw4H+YQ9Mb+K6lxPkrzqmnd
 QZm5QJFkyc0bvGIyOnqtVkaC9TtP4GV0zluY0kT7FaHgcrZzHJhagGFnJTdTUYfoasxOhD7TO9+
 1oDAJn9CErF+N3ZKpTCmc
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The rk_udphy_clk_init() function would currently try to do a strncmp for
a NULL pointer, if DT specifies 'clocks' property, but no 'clock-names'
property. Fix this by making sure the clock has an id string set.

Note that DT binding requires setting clock-names, so this is only a
problem when booting a non-compliant device tree.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.kernel.org
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c6cda0b80bfa..93364728bca4 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -431,6 +431,9 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {
+		if (!udphy->clks[i].id)
+			continue;
+
 		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {
 			udphy->refclk = udphy->clks[i].clk;
 			break;

-- 
2.53.0

