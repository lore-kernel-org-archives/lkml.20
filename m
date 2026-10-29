Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269160;
	b=u0WgQzvgnWmKkwbLG+sEpFaZYQ/NmkU7fFQOJOWOr00jzE1+wOr9T5l9BUr511rtA0zD
	 YRK80oLl9Op+YzdV2eOhX0UeVMrFqtzJlU75dUATmiiSO/8aim70iKF5cI1aXKJJW5Irz
	 ln+xFa4w81twgHbFvBON1Y/ya4OwDO4ES0PP+G5XewHJPaa2NHc2GDKH8ztMzOtIWrYbY
	 DqqmubW/TW9un25Ol80vmWmJCWQ5fYu5ZejhI8k0kRspgTqw/EdN/HhJI86dl3ja771b6
	 W2yVUIpYxVMHPW046vpFWPxEFoRWDVNP2Am9Pik8Ziav9vXfdP9kQmr+pbChw8Ai7eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269160;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FRRtaetwojHsn/CDXpL7GcNodSBye7RzFJ4WewBJvCo=;
	b=Q6BYdKQc5EvnAov4gN/OgueDzAMWZUE9+KG0xlwt+GjfNRgCxjS1hCECROwnwjEsSgUn
	 fDoBDty7f9NrjU+oQbAaVCCBvuB8ZKYF6wp6VooAh/xll/gZbIONWnErxFCa2x3NayScP
	 CxhSB9Fx6E/B4UFiHlmGwMJDYV9oGWfbYRBHhAGKErWKtAC8frfy3FUk07m6wxKqOekup
	 1WPMWN6TMK0Urj2OwK9paELAGmVr4agxREEWOcakqHknLoyvdFa3dczDI8ksUM/YxYlsw
	 Vh86w26gLcxyWPVjHLnjNduLJHoQQFemDwGDBKL6REVgmE9b0ZyRIHRrA+Ax9FXSEGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=v3d8Qd4O;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400BD60A2602;
	Thu, 29 Oct 2026 10:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 400BD60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=v3d8Qd4O
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADF706DC;
	Thu, 29 Oct 2026 11:17:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269025;
	bh=/GoFfTl/Kixz7EDIo1Uq3VIIhFdLVvKZohyPCmYYDv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=v3d8Qd4O96kpm2a+g2SeggLnDaQSrm/8Rp3rMtzZutwLaaQXdZPOMtIFKzzk0lam2
	 3xKv3nLaqZqWKsvIdhtgSbCgk7vlXjzBLLrFjKc3ZRT7KTlqXJ95w5YpgQxKzuhkzs
	 tacb5c5bBhGH1GaOW2gwZA4WBeKh1ddMnr8/WVd4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:55 +0200
Subject: [PATCH v4 09/14] drm/tidss: oldi: Fix cleanup on a failed init
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
Message-Id: <20261029-beagley-ai-display-v4-9-dc7f2b532478@ideasonboard.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
In-Reply-To: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=836;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/GoFfTl/Kixz7EDIo1Uq3VIIhFdLVvKZohyPCmYYDv8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2YCPZR5VxH/A71tEGFXbblUHJJy2Oazo+qE
 8XAEUIBt4SJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdmAAKCRD6PaqMvJYe
 9RJZD/9UVeyhtTJsTMxIRzfp8aCl83yU/jVMWxR5xDZuJvEg00jydB1IcemMAPUquKtrLIFR0xw
 KD2G7/Z4CvIV9bRjn6O77GKv4gWEXQMDsU947Z0hQV/M99JRE+BvQ89Jbm0notGSS1XeBv20cpm
 DZi3dOehrdH4ueu+3wvaq0NWuY19RYeVu3VyGy/A9Eo0APXUIMyTRdpqG9rqmwLWZ/y+ctsxmtX
 FOqzbCg2xISnPOEXRUqvHwXFIq2DmCOtPK/am/DBZEQcOBzK/BuFT9YkTMoxUAJeZ7UA12yT+t/
 BTw1p8CqktI07ze1nyPipNv7O4O+DmHsCHLNhVT+OksioTC8nX8ar1LzfzSpVbHFpYVMpXsXRcu
 InYfkP1xpndBAl1ESawpuZV1RbtZkiqVo6F5FpZXQjPWipoF8ZPqZtCEyCaXKhQatklaVUwCDTp
 AqESpVUzuu7Iv/5fr4ZusGS8TV+h32MTsj7K3MkqJmTG/X4oXlpjyz7oxx+xoZ3RsBO9z5VVRHN
 W9eiD9zCretVxt9ippLvWehg2VQYm8hT4QHXHhEbZ7z2IXbxCc47w3LybNaQk07gcwfDE+7vDiZ
 cdkku90T61Jzd22znXteUgOQ3I0vAss6clbI+aP0bt9Rpstms5oMEMvOOGYJNr8PcZkOAaJ1k71
 fWMUWkGECleqD1A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

tidss_oldi_init() registers a bridge for each OLDI TX in turn. If a later
OLDI TX fails, the bridges registered for the earlier ones are not
removed.

Fix this by calling tidss_oldi_deinit() in the error path.

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 506507e83112..7344d86e1f13 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -638,5 +638,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
 err_put_node:
 	of_node_put(child);
 	of_node_put(oldi_parent);
+	tidss_oldi_deinit(tidss);
 	return ret;
 }

-- 
2.43.0

