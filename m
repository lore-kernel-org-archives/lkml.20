Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284899;
	b=re7BZUGdaXJYXRWjCMk9gOH8HE+/oD3zRHsNzu3hPxSCZkr1Duo7WrhIPu6RmFdk7QAT
	 1euC5mCqP1Zpi4zCqodr2TEUo8vmFbp8gehsWBnoD6DDyI9XyuqQ+fBlshGe2e/i2OHMN
	 lfEBFQ21kn2+Sg0t+xTUtKktrAGLlYB1aKal+WwcN04aeDqWpfMvx0vkHXKQn35Af7j/t
	 uATevX9qPYGtj9p6/kou6nWMJMgTLpbLcbX6ZoPQDUkaNX0eTXDRbwJhFtjzhIw5rWZC3
	 9spH/dF4y0gWq9Sn8VbH5JEOdJftOPrNg5ylegptwrZgifgumGfby1blVI+EyebTbHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HzJeCLzlRfY+DA3xu8RoLtymzokLqJDrTYYXhthDQMg=;
	b=el0p7ooydqeqN/zTxRyVIAlqZ7+h2AHCNvqFxTE5/y13nkzME5zRRYweOds/uI4M4W0V
	 pGwzoI5fzzx545XoMSd0XCR4JYsY6J4XG1hQY5RjO0tP5MZNlr2tBkQ9+NmFZxgRcqFBD
	 voCFc/J1DSKXfvSZ4w+GdkJdW4LvDQ2pwVk4cG73E3EYa8UBTkjEvpFP/+IE5EtcHK0EH
	 k34uZqRlfPQJloFUm8T+9PnOePG1GDOZu9xwR0xCi5QTQ4AXDg4jJThmTUTF3emu6L5GZ
	 YjuxxjdM7kU3HUkObHqKdxnP4sJy37WV6ivONqx83ELDnwOzP20V0xyE8HhSdOQ+BGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b="VsCL/6PJ";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D790E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D790E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=VsCL/6PJ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d885929so1714569f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793284897; x=1793889697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzJeCLzlRfY+DA3xu8RoLtymzokLqJDrTYYXhthDQMg=;
        b=VsCL/6PJM2zFfZpC+uwdwTXoi0W1JulJ6GxlcEeQwElWvOitZAY8y4mZkLJX9KiRfn
         UPmYk8hbCABc75ZPTCmUrvnvAGcm5iZXSDE+oPYU2S0J/kBUQHearriKu44X6NqKZsP4
         ylAyMcGdVq8EFA3/ooAdLJm11/bvfc9U9HUo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284897; x=1793889697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzJeCLzlRfY+DA3xu8RoLtymzokLqJDrTYYXhthDQMg=;
        b=PCTRidSF5rsDi9QOEar9qnaTxPh/Sh7aXAo1dRmIbWL9FQCnxgt9qaPnBBoxSm6MXX
         GfPff6hukLefFwpWphU+oa1Z9+ZrSEMQOu3AypV/8jeX/AE0xZXvJZ/M5oSY9wCqW+rY
         auCulG+bvS+BwJXdC3pSfXxPI11boK5rReUq7G3RkyMwjdYI4L/86vAibQkeY58QVYuz
         Ll3mrizD4rNg4Yq0Ecu/Stw5admbLegyzFJc/JheYjVwe929CMA+C/+hw/PcV5hE+8yW
         A7UuR8CMFYGRDwxmPMD4UiE53OnTy3PtRVsKM34ph6QlXq490KkP3yAmI6TQNuDg6Ok+
         bY0w==
X-Forwarded-Encrypted: i=1; AKwUvBzV2CvQtiMJ7d0GU/iyHokC22DPJgo669v+TGlxbenAfkxIFiltAlG22AExGQDQNn57FT/4UguhC9xiJ1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtfxDomN8G4DS7im5HLGTtIPyAyfwkK/mYGW5PauVGOe8xpPlQ
	KMSBHcKQdTAW8HiE0xA2yiAnSdgeOSRcNEASyYRTE1nVkDmroVm1FZnwVZL/DlDX5js=
X-Gm-Gg: AYBFou2iZouLkJz8GS6F6qljrRqLPe9Hh8z2AKO6WPkuExIJ5QNh8/03HnPis/ZMbNV
	6JorGaUU0YW/PyGmsElrvZA1IZVU+sGH6rYYu/fh5WBvs2ykA/KFHm0NpepZNb7HIpGMwVEwkHV
	uD3BAoGtfZFcmhGRJpW3j35/WxzY0npefpDptwhf4s59h0U7fjkJ89qkoe6ctUSTV0jWuBSCqOE
	+bGnVFOJPS+oA7XvDz9BhrZDmOvxzFAA3o08B45wOG9/P2T8tkpgaY5VVVd6XAk3rhBWbybVN1a
	6jNFzU3EKdSAMDR4dYxKmDE4v1VMK9qdvRRsXt6MTjbgYIZ3QCKRGwVUSDrUJr9xgpRKX5GhqrP
	0dcMxTH3kUUoruLYfRF/p1JbDP5h8hKSIvOw2ATMZkRmibxmSas58Cgrih0yoDMoNPTa9oPCJGd
	kHGil05vxgl2gFGMgB6Gwou5b98rfU4mML1no0/T4cVs7U0M/Y3iz68aR5IAFhr3KK8Gh+WmEWV
	qYr6gkcO1Vdo0c8asyeSRDesZHeosKlesFadOp0CsvxDtb4GKeltvWBCM1JC5k17cElPR0j0Ft6
	skUeNoGqgNsSr61f1xY5vJZZfSZ4HRj/CocKafE0OgVT8MCRI5D1zsU5gvVQwxF3d6GQysADp+7
	s7T1OIsdPKOrT8ZYyqbyLYGmpHL6eIixE05M0vI7KIItPVCBS41/I5ynvuW/usBeYNaWP3otJ8w
	pE5t0emgBsffDQoLZW4Z2K3ta7lJ1HOkYjmYHW2uVUw6zFBsY=
X-Received: by 2002:a05:6000:4403:b0:48e:4561:8a17 with SMTP id ffacd0b85a97d-48e5d2e4a85mr9703282f8f.16.1793284897196;
        Thu, 29 Oct 2026 07:41:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm34829650f8f.21.2026.10.29.07.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:41:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: dri-devel@lists.freedesktop.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: fsl-ldb: return -EPROBE_DEFER if the panel bridge is not found
Date: Thu, 29 Oct 2026 15:41:28 +0100
Message-ID: <20261029144132.572020-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

of_drm_find_and_get_bridge() returns NULL if the panel has not been
registered yet. Returning -ENODEV in this case makes the probe fail
instead of being retried, so the LDB is never bound and the display
pipeline never comes up:

  platform 32e90000.display-controller: deferred probe pending: imx-lcdif: Failed to get bridge for endpoint0

Return -EPROBE_DEFER, so that the probe is retried once the panel is
available.

Fixes: 802372cf316a ("drm/bridge: fsl-ldb: don't create a panel_bridge")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/gpu/drm/bridge/fsl-ldb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 7ec84c81cd78..420b3e08130e 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -342,7 +342,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	fsl_ldb->bridge.next_bridge = of_drm_find_and_get_bridge(panel_node);
 	of_node_put(panel_node);
 	if (!fsl_ldb->bridge.next_bridge)
-		return -ENODEV;
+		return -EPROBE_DEFER;
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;
---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
branch: fsl-ldb-defer-probe

-- 
2.43.0

