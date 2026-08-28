Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760373DD536
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906911; cv=none; b=OXAAILJKV8ck0B4yEaOb6jsf+9cpw8LoGxDP7U1vXfcV7Wk4Zpa6rQeb2NYZDywuXnhI/1dLjeV8AwhEU0nSHJDffzqeMEcjEJhKjAobzxfk56FLVAS7BgjdEpk8uR7HHyW36VOKocy1t0iTLI5gGjo30yY4y/I7ArzDWiyt+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906911; c=relaxed/simple;
	bh=rc2d7+U2pUbg6DnL7qRn3+FB6sQHvOVelmLhz0MERmM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=lWW4mshBgJx0hSYKhUx4VHaYah8cYF8tyzHZSvp4jzDIwU2aWngRBfc+dahgcnU4D08OuoI84BrlmR+Kc4UDpRuRJl8G/Trsu1hm/1XOXczUJK/gAGZbsLC62WOeszapwbY00ZAU5VKeGSW4yFeVil+VTmpmsLXJPWzZf+sCBWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=QWgtIuCP; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="QWgtIuCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1787906885;
	bh=RJlSQp8r350iMwIMlHz6kJOY3IIHWCaiqptCoWQnTWs=;
	h=From:To:Subject:Date:Message-Id;
	b=QWgtIuCPft91RH0TI5SNrfBfw7FtQw0jDrcyzTTe3pqO7t31w3+t2Zuh593e7vDMq
	 o28NPPc3hEi5aKB9Ko4vLM78IRPPfKImly/Gg3F+2Um2aAI5rjCdX5FuPguzTtaUcf
	 mt3PECQcLQQNGhXf42ciU67QTldcAhUdqeSKMtWs=
X-QQ-mid: zesmtpgz6t1787906884t06858467
X-QQ-Originating-IP: CQgLeaWy6Yzh+F2VVlpNXaKxG2UNi9frWcgW6uV9yfw=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Aug 2026 16:47:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17473043343536338628
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 3/7] drm/display: Add soft depend for aux-hpd-typec-dp-bridge module
Date: Fri, 28 Aug 2026 16:47:33 +0800
Message-Id: <20260828084737.565-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260828084737.565-1-kernel@airkyi.com>
References: <20260828084737.565-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M4lPCacZ9YleQTf2dJTkLRquPn32ePsLCFjLTCe3ZREmReKx7/xhXnQp
	tP3a2SINnNeFHOEcjLdjSEQWm9adzvhMzFSZKlmCAvBgpCVJ8PB3iMBRw0NoaWBAS0g3A4h
	En9e26t/xb6Zc3YZXIw6vmfAuku7J1GVAVvbKT2IsPYOtFTZ0SldUuUGDTSIJpC18oDZvB+
	Jm2OBunRfQnd/FrvsxgZXdOl+HEcXJtTqvCVzuYURhs44v8Wvcyn1n0P21HGQz1POKrHWKk
	lV5E6iSewX7ZgjdjuIt7PaGHhmGnDRm5JqmXV7A84NXvLIYC6pSaUwcmMy3+cky+g2Gpk4F
	1Cn+fXatB0lzKniXuI9936mF5+gu3mA7yK3g94HROA9CSEYkJ22XPcH/xmlHW1WvUt3q7PT
	p96483/C4wagLjNBqp+BCHcr3rEjNmZXvd3dY1sh2Yd1tiTbV7o+NIppfHuWu846jDABbu2
	uST4rT256HsksfN3iaBuhlk3mSEP4Gr1Bce91cQEIj82Bk5RnHBjZrFoX2C30YtUj/6qwAJ
	Rmlwa8X3cLu7Ow9Hq4xACXzqmbYCihGNZwYCxF5MYlwzDU7yi6sXX+TkHzFo7jcI2iQ4OCV
	5o43QLZMomTdFClO4h40E14PuaZw/N0Z5dpRcFWtq8HsClzg6Dd/YUSelbgYJrOg+HlW4uM
	82k6XvQYAnSURJjFdocjbfBxkZ4guZQ9UyHo9oxhD/Z34+hD9I28UY00ll6Nb5+ucAZ41y2
	OXaeanbRr54Vys4fzTTcMHaun0VuCdSMlUTUo5MvEWdQhIjIz8iwosyCboE7FVpEKtHwWqm
	D2+xC4HlXOaOa2adlSIqrQKboGbomxCycvr7w/KPyn6uS2h1wu1RttHjJPh/pjtRtIVwoor
	FIy1cH016R6GXCUqfUH+k+rcq0n2uffd8ZlgYfVdAkK08uvGBU6i8qpQjhj8zFjwqf0djds
	ge1zS+67wv9bAelZ/zu5s2EfxmXob7/DGi4CAD3Ka9hYbedULprrnQjVUDlSuskvohgLUAf
	0XQEVDdo4FyE0wxyFT
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The aux-hpd-typec-dp-bridge module serves as a generic TypeC
DisplayPort HPD bridge and is not required by any other
module. Therefore, it will not be auto-loaded.

Given that the drm_display_helper module houses DisplayPort-related
helper code, add a MODULE_SOFTDEP() within it to suggest loading the
aux-hpd-typec-dp-bridge module beforehand.

Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
(no changes since v6)
---
 drivers/gpu/drm/display/drm_display_helper_mod.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/display/drm_display_helper_mod.c b/drivers/gpu/drm/display/drm_display_helper_mod.c
index d8a6e6228773..f0152d6b0b2d 100644
--- a/drivers/gpu/drm/display/drm_display_helper_mod.c
+++ b/drivers/gpu/drm/display/drm_display_helper_mod.c
@@ -18,5 +18,6 @@ static void __exit drm_display_helper_module_exit(void)
 	drm_dp_aux_dev_exit();
 }
 
+MODULE_SOFTDEP("pre: aux-hpd-typec-dp-bridge");
 module_init(drm_display_helper_module_init);
 module_exit(drm_display_helper_module_exit);
-- 
2.53.0

