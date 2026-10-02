Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF12DB785
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925340; cv=none; b=q7pJVBWFUDb1V7eoKGTXaBpD6PSUQTdj8VeO+X0HCORJNbE452SqlHLx+bZ6PtNNMSqocf1FcJUJJLpztvqmtxToH1gQSCx37jdMIy2llJDgNr/GkUYkRMt8a1asqLU4XHFGuS7EDs8GK2LWYuOFgBrR+CpRBDctBk1ag1kpyRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925340; c=relaxed/simple;
	bh=SJ0t8HbO3U64c4RjW0ViXNoqyUGeO30oUGqMHWd5C0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AXyJFuc1d/EOXu/RI6nI3yF9X0+YzygCGffqJHVkLwAC164hP0k/XdjYmmNL2a2TUDh395A+CWpuOjgDfeQk5ziqrXG4+oGDUOKpUZmhxOlxgVWqO2OKzMDPugQD3BWihZT5ivho3SZ9Jh0EOh03N+6OUzykOFLU+1Jb7+l+D8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Prcx4XNO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Prcx4XNO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so55433545e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925337; x=1791530137; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qqyFh9OKcAKMhJTMe6dKznZlWeuV8+PzVNUvWK2iZbM=;
        b=Prcx4XNOijbIC2CMGOLzcQBVKYsvK1R+COVTwb7C0TupNpIkcB57oGc3LRRjN/TNEL
         G+E2LP2Xx9uYEVNqnoJEbUZJLzGG4ZOmxAPMRfgZ0n5gfGTTRSJNeFrGMQMwlKLe7Fam
         h+IaNctsGeh2Estj0JCOmyaDldY1Hqnl7tm7pnl+/MVtOuT4U4DigK3ZuwRFfcQzpFua
         adIh7B9pgPEqXNjcoVAs9eSa45qV+z+14j1kzL9zMnJ9jLh0tthOj9oQyuSj0YE55b+3
         YE37fyE73GMt0QgqDsXB2HQLTlYdUSkmA0ZHXr8QQHqlKYCWdlomqx1vZVlQ6Lo3eahp
         r/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925337; x=1791530137;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qqyFh9OKcAKMhJTMe6dKznZlWeuV8+PzVNUvWK2iZbM=;
        b=O3qqU3szwE+XsZFDLFbC0k/SqEcDI7N/2EuaXDZzmiW7NYgjgPqcaEWnc6WRmdYRWK
         QMkFfAf/ifQ3Ddh7AUvLzh5RaBHdVEN5MR9S7jsql2lXAwDkwQUbvJ061IXnIH8Chxsr
         ZVB0s2TypBTcA6ktJFbZ6CWA7SuzrzNsoH0n20Jy2MD/SDo+DaKVtmCZsEtw7jgwFN4h
         RYzNpb03vP34OLyQc1r26/TpZGnFWVP/4S40TBI8kWm9I/bqpZte/3m035Gl7cjoYvjM
         tmoRe1qv3snACURMctg5h6YN6AC5ootMaEj0RjoyJdTEfc+gcnS2y34lZGyJjTw2bNwE
         dCtQ==
X-Forwarded-Encrypted: i=1; AKwUvByLZ+B4bOueNfCt7sYTwjMVxu5PBYvpsAlXIvsFVXZClFp5nJjw2oOvtLz0+IMErouMQffGCsPfbpcKHhY=@vger.kernel.org
X-Gm-Message-State: AFuF++l4BBfHypAq6EWJw7bdQJeSMax+O32mdACO2x05KiJR1BVEcly3
	ETWaanw1gjENpXQpdmfWP6oaw2xL2YoXKTm4L21RM6ALxzsdJ1b5zcVVCSIaglIaOpw=
X-Gm-Gg: AYBFou33bAqnVleZNG6ll1hCsDydxGu5j1T91ilSpqFU/YTOuIlb96DTA3I4hEPFkF9
	J7Fia++tTjuP2+JpwPfqPRR8J6ybqzQteEevSjFqoKKkeffLK2wckd6iTRPV0JhF4Slvjdm9p+o
	UTPyiL/KWsiR9y9FjT5NHdjmsMCCmnXMJvpkqDaynGkC0XsJsjk1sV73stjiwRhp4iTCTUyOWSi
	M29/lA1ae5V82F6+v4m7ALmdP6y4sBpe70N/F5Q/axgxPQR0UFF5ghMPC/fuVJ3ouI7eTOBywra
	cqilechdwUZXj2xCntrIQEhhLEad8+F7Erj8tziZkQ++0QN1IRPSw4qxgXM3Z9jKXylFaxfSaJA
	AicP7YA41STF9ckIe5SXBKa0JQapHYE+z9Zm5zV2zipXr+mupFojXAanxSx1qylILBK8T0M0QdC
	tV0tCxyDAb/qsZQ2XwjkoJUZA66jMf8JLjBzEK2ZP/mQ2tFOjEkydpAYlbz8ZmsCKjVXkPAmndg
	Idk1URfoBAMBJJXazU/34vUt43cNtNKChfsfrUYad5GCJqKVDYfrJshc4vAvxkr
X-Received: by 2002:a05:600c:3b01:b0:49f:ce72:e930 with SMTP id 5b1f17b1804b1-4a02758eed8mr33065465e9.34.1790925336506;
        Fri, 02 Oct 2026 00:15:36 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm57170235e9.14.2026.10.02.00.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:15:36 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 02 Oct 2026 04:15:23 -0300
Subject: [PATCH] drm/bridge: simple-bridge: Enforce input bus flags via
 atomic_check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com>
X-B4-Tracking: v=1; b=H4sIAApav2oC/x3MSwqEMBBF0a1IjS1IKbSfrYiDJL7Wwi+JiCDuv
 UMPDxfuQxFBEanNHgq4NOq+JUiekZ/sNoJ1SKbCFB8xRvgSjroeC9gFHVK3576qZz/Bz4zKVXB
 1WQsaSo8j4Kv3/9/17/sDJdI5NG8AAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790925335; l=2106;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=xqan7CitOzDVUI34jPQl+mNM+DqEBoLtPLpDOGRqX00=;
 b=ypmqd1FinxsQrSduoBP46+XorgtAIAyXI8upcyPQebztuVjZA3vNWwcOm4JJxZnxm+RAwXFtx
 zf24w8B1BtFB3hQKmC39JAdK+fLmT5Vw5Do2qA32k7MG4//9p3mYYvP
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The input bus flags set at each bridge's timings are never actually
added to the bridge state and are not considered during modeset.

Implement the atomic_check function, to allow simple bridges to declare
their required input bus flags.

Existing bridges that configure specific flags (currently the ADV7123
and THS813* bridges, which set DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE) now
write them to their bridge state, and have them propagated to the
previous bridge in the pipeline.

Fixes: 0a01de65a741 ("drm/bridge: simple-bridge: Switch to atomic bridge callbacks")
Cc: stable@vger.kernel.org
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 3fba7002322e9..848c2df2a276a 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -158,11 +158,23 @@ static void simple_bridge_disable(struct drm_bridge *bridge,
 		regulator_disable(sbridge->vdd);
 }
 
+static int simple_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	if (bridge->timings)
+		bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.attach		= simple_bridge_attach,
+	.atomic_check = simple_bridge_atomic_check,
 	.atomic_enable = simple_bridge_enable,
 	.atomic_disable = simple_bridge_disable,
 };

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20261001-v1-simple-bridge-atomic-check-e7b7eb8381e9

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

