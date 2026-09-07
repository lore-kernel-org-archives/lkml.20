Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EB0477E2B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780511; cv=none; b=V0Whh+ZibLV1fRMj0WnU6GSi2KRx44f21rbrCmb0DNp6yWhLWr2K4ih+I1huz1g6hhn4CAy7MdTv01ML2tvXONAkbPy7F/y0R7E3tEfiI+vqh6c3vonSqI4Dg/8+2SnI+LYoTiDxq4kuSKcTwh/NRdaigFyoUXtkMHV0CmxRmuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780511; c=relaxed/simple;
	bh=nimBzwK8X0eTgWDSpsHRmSDTtL6PqLdjOLgBI2Bu8ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BvqgJAyyMa7w/7xz438j9iLVrlNEESR4ohJCoE8mFh/gJJUN/c5LZ1+hetYXsv+vtJeOp9guFAgSDkKWnZBSKO9uCszkrSQef1whXGx9yH21hfVVUkEtd+Jnc9RhKXBor/xgl9yzhDKLHeUOBTHbiBasOd5SHQoEO3MXvHmPaQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AESFJRn2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AESFJRn2"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED8CBC45;
	Mon,  7 Sep 2026 13:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780410;
	bh=nimBzwK8X0eTgWDSpsHRmSDTtL6PqLdjOLgBI2Bu8ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AESFJRn2WkP5omAnx1k8cmmMIdxrE3k3zVLzo8UNX6OliCgfsG/bD/6NUJawn84qB
	 aTRvPFKL6T3s2UujU7Q3QeHYLSFgXyqMgZW4vBY2lYgvcJuZiNnbahezkAeDJ4RuHu
	 Jm4EYNdg+TdJDtTU5EvaBuaX4qVC8TkBgRT6ntPw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:27:57 +0300
Subject: [PATCH v4 02/13] drm/bridge: tc358762: Improve SYSCTRL register
 defines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tc358762-fixes-v4-2-e3fc3ab5cd83@ideasonboard.com>
References: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
In-Reply-To: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1738;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=nimBzwK8X0eTgWDSpsHRmSDTtL6PqLdjOLgBI2Bu8ns=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnp/RrrdUdFYarVd4ED8bHoJcNUFhwkgk8U9WW
 rJ/Kha/m52JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6f0QAKCRD6PaqMvJYe
 9aE9EACYuVN8HDKfwEGdusNHy1rurP2Fsxq3/UMXfFYG3o0Ned/cXK3ZUkEgTaMlxqTEnMH72k0
 buKgP8sm5/6ReELIbTMj5BpVR7bRFxaZzCX0yKZQCGLR5vQ+sXMSQvR3wXQzw6ufb5Y7QQce/Cq
 md72LIDF2mGl+KpiJ7ADYgA4nPrdp10DJNz+Mgvr2ulCEG6DGgKACm/qurcvn5Qf5k8R0Gk9xiw
 2QSTQlcZ+Jz3ATSj/Uwt3DAmFRWcjhKD5z7SJQtTz9YYQ27OLccy7CTj/gGG7+5aBIr6J/b+23N
 kO8wRZQMqhbkC2xy9foA3Pznf/UgZselZLYIk15vP1liKjXRLnKweqju/8DbxaQMGeqUcgt/78b
 2T2cpbGV+FaDElEe2LSMuiYwK4wapoLjyTxDZVZNLnPykFJbv4/ULY3QcBVphs+WBSjvmORs4eC
 7eakC57JZkW86COwVUh5Jf5qpqNERx8hphHAtuXx0Q//D+qLmtkKaPokrC0h3etTDba8Cl7RDGj
 KWoyAExOutb2N1Je9qeEEUuMnPIeCWH0FZuxqcaqd66czGXvAlcpCN9rX3Q5R37MAV4WQcMaX/m
 +mCYHYJgcAii0kLukniLeBdCmf7ZsR/UwnBtTY+MWqOSO/+NmjyXDb/Px/TvFL5BOpH/CeIVuGl
 dxbVBMNdvnvYACg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Define SYSCTRL fields. No functional changes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index dc20f253c7ad..5630cead7cd8 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -10,6 +10,7 @@
  *  Eric Anholt <eric@anholt.net>
  */
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -63,6 +64,19 @@
 
 /* System Controller Registers */
 #define SYSCTRL			0x0464
+#define SYSCTRL_DPIDATA_IO_MASK GENMASK_U32(1, 0)
+#define SYSCTRL_DPIDATA_IO_1MA	0
+#define SYSCTRL_DPIDATA_IO_2MA	1
+#define SYSCTRL_DPIDATA_IO_3MA	2
+#define SYSCTRL_DPIDATA_IO_4MA	3
+#define SYSCTRL_DPISTB_IO_MASK	GENMASK_U32(3, 2)
+#define SYSCTRL_DPISTB_IO_1MA	0
+#define SYSCTRL_DPISTB_IO_2MA	1
+#define SYSCTRL_DPISTB_IO_3MA	2
+#define SYSCTRL_DPISTB_IO_4MA	3
+#define SYSCTRL_PCLKDIV_MASK	GENMASK_U32(11, 8)
+#define SYSCTRL_PCLKDIV_DIV_2	2
+#define SYSCTRL_PCLKDIV_DIV_3	4
 
 #define LPX_PERIOD		3
 
@@ -136,7 +150,11 @@ static int tc358762_init(struct tc358762 *ctx)
 
 	tc358762_write(ctx, LCDCTRL, lcdctrl);
 
-	tc358762_write(ctx, SYSCTRL, 0x040f);
+	tc358762_write(ctx, SYSCTRL,
+		       FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
+		       FIELD_PREP(SYSCTRL_DPISTB_IO_MASK, SYSCTRL_DPISTB_IO_4MA) |
+		       FIELD_PREP(SYSCTRL_PCLKDIV_MASK, SYSCTRL_PCLKDIV_DIV_3));
+
 	msleep(100);
 
 	tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);

-- 
2.43.0

