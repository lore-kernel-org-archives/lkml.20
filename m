Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481352;
	b=31ZOLIBxlgYwlHp9ImyD76eTXCdvHqMNHkcfapajiYMJb1Xrt9G8fi7FuIA2Z4VkVzQE
	 mopds9z3nYfS1nvUEP2p+9VtBsDQdroD3Qubo/0u7U/phTKrFxmq7nKMu0JPqBjAQjyOT
	 K8NCkJjYBCQvr7Zm1YjH7ooi5XGA1ZfCmfKxsnCZEBtvvz5ci7OIjmox9rXH+3rjfeQkA
	 2Splckv8XcmLScxW91lo98X/u9e1Tfu4BBzRVAlq3AstA0NzrphRToV6lX4gKSCS3ExjW
	 ezPNhz6C09hpB7bmL+vhGuJYINKAzNO3fudN2hm7u5RnJo+DmlWKvCgrp2BiItzx9Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481352;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=RJlSQp8r350iMwIMlHz6kJOY3IIHWCaiqptCoWQnTWs=;
	b=TC/dZYpApae526nq5WXCODqlMDg/TZIZInltdW6snxsr/TlknCdjhGgxJhd+v8p3kt/X
	 BbpejUmggf6RcAWVfHrhOyCNSIKO+HSvGJrYZLYARitj8+r1FDTeeVZuVhmbq0J0QAAwk
	 ns9MOQpN5BPsH/lY5aQysgdfAg4+VP4tpj+jmHzJPX+tO8V8sUatnPlHqckKB5aEAJHkd
	 hgwTHbGDRPl7knVsFq1SnOr3ojr+/8xaFGDLZohSTBoihh1TFfMxzX1i3iW8kH+R3Mks8
	 7nLF43zrQX5FUSnkZuRg01/xQd13o16R3Hl7dxkHXbakivTd+J6RwcoI+ICeGiQM15Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=FrTF+Z7K;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EFD606A337
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80EFD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=FrTF+Z7K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792481336;
	bh=RJlSQp8r350iMwIMlHz6kJOY3IIHWCaiqptCoWQnTWs=;
	h=From:To:Subject:Date:Message-Id;
	b=FrTF+Z7KD0Ibekx7CXN10Hj+f88ph8HX61g1ihWLTz8bTFigbnblv8EguE/4jqpxy
	 SPxNcv/bFbVDV8i84Y8vNv+AYLy7WkQjVdsVLZXIY9fq9XaY8EmykfwcsIrxjO1NgC
	 E63iCWSnN4GsN8126szMflZbKr15EXo1p9o1rZp8=
X-QQ-mid: zesmtpsz4t1792481335t9bc8c4d2
X-QQ-Originating-IP: rMyewjLzKncWQnPrp9ri5tZ/Pt41y4HBpk1o+5qM6Fw=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Oct 2026 15:28:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11522251199344246924
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v8 3/7] drm/display: Add soft depend for aux-hpd-typec-dp-bridge module
Date: Tue, 20 Oct 2026 15:28:12 +0800
Message-Id: <20261020072816.180-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261020072816.180-1-kernel@airkyi.com>
References: <20261020072816.180-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MvW0gkkpO9JeOgXld5tLuUqTzQyCBdr/SLGm/yM8QGHgBA4hLevagzd8
	RzPQs7Z17cT0L4wdbHvICr5/OZto2EfA2ogO9/V+Al0JAOKVEyxQhGUMsMU+ohqIjrZusU7
	dksVVbfvt4ueNJLR2sA1UJAcy/ABy0DVjZVWSE8yp/Cd2XczvQhaJ/R1dK5fuKaWl5lIkxG
	lcxlszWB411A4Hqa+hd2vk+Pa4ocImVMptl1+n6cIQ5FEqBARlAss5zZwWV5vORFMIrklDH
	6uh2rwJgqivWOmaIOaLHMGzYVNz+l4xCAhc5E7LNhUmA2w592MoCXNcPQtTYMkWEOCIm1CS
	e7nES3gRCo3PpC1owOQPmJg1RGt/3gE25pnlN6RZgpc4oJ36ikvepix0gkL+CjASRRNIHY8
	cDXeVt/ORDlr36phjHnk8Gq1IGiFlF6Q09F45HQMOGV7Q/FWrzNEWGWqiuZTxKTBwpGc3ba
	pk/qaFF0L+yDCgEGWdpYyuUww5ysZixBvvbIcmcFecs6xN4kSjJ7mJp0yjdtG4jwke2jnAS
	F6oapYmTCjiA7Wzp9TPLBu8O9ehyHNgjBSXdZLko4eXkxl7CjTgArDJea1Wl4SKw6DxHVQP
	DOgeXrXWLrkgYsbfOqYP6Z0fRcXq1BsJGyjAxzmzPzv/PLyzPrtys9b4eT+7520TirlEzVf
	Bm8tgZWqa/1ADijAHvZjD8+Rs/0U3Ny1TXzLZ2Ye5mvFo0GJ7HNWtHgihhNqisNIDEcjyFT
	VztnsHyRe9CnjnLP1w0luJ840ONGy+Kl99QQK0OEC33uHXhHAihcDx//ivADQlu47m4FXau
	emQNj/S3R2wKgqrvpqSeNzrCLDmDmMhBpY2vIve9dOi24XpRGSIcL509al37BRj2ZNKUWUL
	9mDdT+A3RSHIh76fReMNjHUqKHdhokE9WFywsWb9GUZsmep68rJ4B4kaDDityAu+soCtbJc
	q5zmvlmJTTU/Cv2BgEKLl6sLQXe13ynrjnGxmUmT1xX7VF688GA8j7bLJSTE/l7u1FV5OlE
	6HGUJ4UVuo7IpIwcxi3CT3DWzt2ok=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

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

