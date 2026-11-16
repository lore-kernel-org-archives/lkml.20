Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835634;
	b=39C0wGor8DXgS1T1ih5D958A0stdSFy4f1Byy7mTVMkaSBJpLqydWOlNzgLs4vU/IkYY
	 egPq6+3FWZ732IHQhTcjAXGGvC/FORcEl42wiDUaAivdqsYwPWFEM89hw8kGLEWYwb0md
	 1yrUSd/c7qEhCCcb575dZLOzif7ZStLH3V95jGQ2SUIxV7l7BW4Wqjg/iczp9Xbcv8zSq
	 EE3XZhW69YpH3EOh+A+VcHDtRNTqIeM4b2D3FxzjXzFsK0HFojQ5fBOoPbJYB1NG8xbap
	 3pyxtNxSUHlCkCa5VcVqKxOmiac+2n/e9nONPnacBTecdLxZMJxZPxzOOQRPTtKq9qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RqAZHHXkpbjp642q2K0HIZ7cIhQ/6QUCJipqLujd8Vk=;
	b=iwZ7tbLjutsqw/d4urCyOuhyXuktQCriIJCFsJfon3T+TPcdjeoA8zHZQBTYqp8Ft3g7
	 39H6fiONZcETZlW1gmB9m4Ch4aH9mlqdzW2IF0M3jfE30Sar4CpKf1IHQ0+oDU9M8w545
	 jtAWCpj0KpHwYkG2DfblYtdXep87jNcjpbVS3Cu5WL6E4MAtUxukN5ITNDe80MEBA3l8i
	 B0ZsEb6fsHOP5K6a0ejLO/lQ3fwLhAtc2oQuiQt1ZYMztQZDa9BeUKPtxhv419HGAfmOH
	 9PMG84kO29BR3kBVTh59vyvPRi4vorknhLKkakl5cxy2XUbHFDgQffFmZcuaL22ZPdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEcTgkXz;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55018606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55018606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEcTgkXz
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2462024f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794835633; x=1795440433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RqAZHHXkpbjp642q2K0HIZ7cIhQ/6QUCJipqLujd8Vk=;
        b=sEcTgkXzBijaz1k16DJYuWZH124uqPNyjepDwKl4p6bWhNrSddyfZrbJBLCU59QIpR
         9KL/vXFv33sHxjGoyHGOUgdTgixxfiGk5rXakb8yNcQbYSi5oBy9QFxOfherr7fyefqk
         CAOxp93E9bLqaZyVq1nKkPitU2JWqHwvFd2/t3JI9ZlkDxh6x0Hoqlis06rxbgpzIzrb
         o87lCkteuQLnH0rMV4WmfD5rfh6YxST6PLpsPgOOo9t2e5u3SqruR7+7zdA9jDDn8a7f
         JlwMIgB6MufOShHo61D38PyNiaBC3rIeKIjatV2eLoNUs8gLh+sxQcvA5Qjykjwi8mMk
         DGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835633; x=1795440433;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqAZHHXkpbjp642q2K0HIZ7cIhQ/6QUCJipqLujd8Vk=;
        b=tpGPWX5TPxu84KXCjA6EitTXVAXVwj2v/UklLVAmMreTG5xawqv4ifGOzAoyINn+2f
         v6CM9/H1I5uLB5BgkkjPyeGp69vUjsHH+7AckrZIEOdMnAOXpNf0R2i2ZhNGkG0GV9Rw
         lyE/081mA58MN0+aLfATBNaGcOIt1dIxrsimkYGFPSBrjTad6W/XufSSEX6ME26Ju+so
         60XsfAzcAQwQ+3h9p267tby6wWvehilbGkIFNkk3H6vjhCFwGJqFAKtyVB3Nx1mlUxEh
         wNYFIsQ4o6iHn3ZMO73r87vEkZKq7p6HXdKbMU3LN9tzO8Dbpwm3tgu8ZL+nqUlZmVaW
         cQsA==
X-Forwarded-Encrypted: i=1; AL+hErGjhpqUuc4m0F4WSX4Ek8tXIe/xNFDQkgMb2MnTQdohd/3QHmMnn1ZMr2PWAwHF8+fCzoobg+SV3rqdobA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PAsca0GVj5anLrT/EVPrEBpgASTRgVvOrQXN05F851TvrGv1n
	31KFDqYCQsMN99vqmJR+sBqCnu/HkAsNMyjL8hbm9KEjYeZHkzTG6tMw
X-Gm-Gg: AZFdTZeyuMZUoMovvubyo+mUt/iMQka15wNXo98jgJ8QG8oFgl2ZN45dFd1qlkPzpC9
	S+ciNzvMcvFMmjodA4drsVSmlk5md6IP9RFut5mer+hDdv97axvstX98MxzwOyVw17CY4tf3CSK
	Xfh43SCTVX4uWYXAGAqyA479PK71v3/hyXh5izFDFHkJvlIMWVwuSKstqBwz0kOkyFJMB9HRc9i
	f+diZ00iuOUXJ8f1Ko4aYJty3zGN0y0BGbEDOOkioWonpNBczR+cRQZ3NOn1qbedZfJFBAlrMIo
	N5FptCtDJ+FFEKEqRNE25q/T7ZA4s5Dl7VFduBG1u6aU9GnccVSuq5pfKvSgZ2erPt+DDkxsMkY
	ZUh0blzFGBztp/WI0DCTvsBuIRVFqXKaKVGbdvLQleuSce35+a18ODSyA1+JVK7FE+JDyGzzpQG
	OrErgTCdQyxZPpZLEY8jLO2RRjAjPJbJpMUPYqiNos8cioUFwuH7QPfAlbJYOrRJUX2v5n9nDI8
	nbc29uWd0pBKjhVJi7dc/THvrf77GN9edNNfyU/4xNx/GWCIDurEJZ+nppY+JJaYYFmrIbKk45D
	9OLOn0fWy6GhQDFQcH82Zrmp6XNtqO1PoQYz4FtVnNt1hmq/l1goox4=
X-Received: by 2002:a05:6000:4715:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-49c723fba07mr22874709f8f.39.1794835632796;
        Mon, 16 Nov 2026 05:27:12 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm40370240f8f.7.2026.11.16.05.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:27:12 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/4] drm/bridge: Add atomic_sro_install_state hook
Date: Mon, 16 Nov 2026 15:27:04 +0100
Message-Id: <20261116142707.1299360-2-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116142707.1299360-1-maximpedraza@gmail.com>
References: <20261116142707.1299360-1-maximpedraza@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The state readout core lets private objects take the resources needed to
keep the hardware running when the state read out becomes current, but
bridges have no way to use it. A panel left on by the firmware, for one,
would stay marked as disabled.

Add a bridge hook and call it from the bridge private object.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++++++++
 include/drm/drm_bridge.h     | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 45a34bbb8f14..cdfd6d44c8d5 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -629,6 +629,17 @@ drm_bridge_atomic_readout_priv_state(struct drm_private_obj *obj,
 	return 0;
 }
 
+static void
+drm_bridge_atomic_install_priv_state(struct drm_private_obj *obj,
+				     struct drm_private_state *state)
+{
+	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
+
+	if (bridge->funcs->atomic_sro_install_state)
+		bridge->funcs->atomic_sro_install_state(bridge,
+							drm_priv_to_bridge_state(state));
+}
+
 static bool drm_bridge_atomic_compare_priv_state(struct drm_private_obj *obj,
 						 struct drm_printer *p,
 						 struct drm_private_state *a,
@@ -674,6 +685,7 @@ static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
 static const struct drm_private_state_funcs drm_bridge_priv_state_funcs_with_sro = {
 	.atomic_sro_compare_state = drm_bridge_atomic_compare_priv_state,
 	.atomic_sro_readout_state = drm_bridge_atomic_readout_priv_state,
+	.atomic_sro_install_state = drm_bridge_atomic_install_priv_state,
 	.atomic_create_state = drm_bridge_atomic_create_priv_state,
 	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
 	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index b73f3424ed62..630af5b3fcf2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -967,6 +967,18 @@ struct drm_bridge_funcs {
 					    struct drm_atomic_sro_state *state,
 					    struct drm_connector_state *conn_state);
 
+	/**
+	 * @atomic_sro_install_state:
+	 *
+	 * This optional hook is called when the state read out from the
+	 * hardware becomes the current state of the bridge, once the CRTCs
+	 * and planes have been installed. It gives the bridge a chance to
+	 * take the resources needed to keep the hardware running. It can't
+	 * fail.
+	 */
+	void (*atomic_sro_install_state)(struct drm_bridge *bridge,
+					 struct drm_bridge_state *state);
+
 	/**
 	 * @debugfs_init:
 	 *
-- 
2.39.5

