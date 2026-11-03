Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705776;
	b=2KNpzTmCpYPBn1TrRdeFFDzOu4g6WmjVTNJkhh18BIxx3L4/8bVCGWHHmO8qI47Oez//
	 YE056xK0SZjelHUXSspz4mx3MYz+1YKyKjfnz3lSNtc9+lDvVFaeG+cBZMot6ZGu0HuyY
	 JSkqIYjlqTmY0QuLFlg0dshmol7Ji4h7JvCJJrs2kTOJ7ato9CU2v/N3UvNps+GpcvLxX
	 GFYh1zDsBRzJUz3Bi4koaJMl4RvmUIifxa9ZOuwmpHMZsSQftLz8JIl4YdX45/hgABMpJ
	 e68uwtfQBaLU+v59K5RgyNgwQvIGGbaro8MXDe8aw24IFTi2xCLI5n52egJffsDcD8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705776;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rDuqHtQlXZSgFfeq7ZSWioePY3kvEDc7zoYDaD/9pHI=;
	b=hEwiJDP1kZXTskDCqUsIO6hyNi8OaBdtlhsUFrLzOi1A0HvcY1jyOCI8KRGMBHRcOBr8
	 syeBrtW1nrXjVZv2TyyvCRX4DJk6prM20R/XiSr9svdkeh7V0XTNhL+xJ+b7ijgaCo7Ve
	 E4F1HWsfVB5/CRQkqt9STCSta5gj0yziWNJkeOmDNV3Z1qbMoHHrqhCBoOlPGO/qCzsc1
	 z2vRMpbLQr3dIC+swq2hSZJ92Va9Ck+EYrvmnkUNMW2T9pxFJQkr2jLstj/4TlwwtUCfX
	 xP9XUV4YtctrAiueioVM9S+wArfkXA0NovexLzF15PqsCt4uN1WldYjp7lJLcEmez1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SyyZKvzP;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A153D606EEAB;
	Tue,  3 Nov 2026 11:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A153D606EEAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SyyZKvzP
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 180FC287E;
	Tue,  3 Nov 2026 12:33:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705631;
	bh=F/L5+gkuDrSZcJ30dAJHYqalbmfLemsHzfUp8D8sZNE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SyyZKvzPLK4g5G2Km6cPeZvp8WkIb+iN2bz2BvYSXFlO3AKNECX3yJnCpsa70Aaz5
	 5/p50Q7jPbCebwKvMBk0+BEUaC+mI/tH5bE3c9K+7N/x9M+kPUO7GPgfjI7gTSnbfG
	 8ev48aytWw2tIvKWSN9Hu36ZTaAMjwZ/mZAbHnb8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:30 +0200
Subject: [PATCH v5 10/15] drm/tidss: oldi: Fix cleanup on a failed init
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
Message-Id: <20261103-beagley-ai-display-v5-10-f1c8d0e52bb4@ideasonboard.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=F/L5+gkuDrSZcJ30dAJHYqalbmfLemsHzfUp8D8sZNE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6ccZw4IlyT81hqKavStnM561Q2fWsO615iqL0
 I6H4lEeLUmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHGQAKCRD6PaqMvJYe
 9TcSEACY5+Vp+/E3NpI4r2/xf8ktIe5+uxKMnOZ0b0eCB2ArI6ZP4F6SJ8vJP9aAE10xJf+sJub
 N6UaSa5KtGT/09zMndU1fhNbswi3rXCF49+TyZoYF0ERbeUL/uTCChE9ICeepYjgkc6lAKFkYDK
 yh6Fjt62jidNWKt+u92kkpBAZ+XGmFNFktmNRbdiPWhbzrp8eTQ8FdhKeKArAymYRmU8oxq5WV3
 5sYA7Dh4tGVcIZQiPk/uetF+UWOF5mDcVw6EdX2cfPC2USSGTv+hMxSN5w+IjYx4HrQq2yizH9D
 4l/k+SbJp1pqJE+6Ayr0kCYv6oQAuCc6XOmhV4IFPa7fIUU+8OI2TXum+T0gA9rQMMGmVMINuei
 Kx7q0/Thoy9oKifj4PLEXUDGJc2R6o3XQV2IL9b5zTDxC14jPWXTm1kE4o7/LHxzrhvtBT4iUGU
 slkskC+y+olOzTFvuqLZvpqFC6YxhP0OrV7kl71Bsdit4i8vjXdEO8yV+LLm9eM0O4Z8I9leGmW
 Cp+dg7qMz3JkRlbM65Pn3dZROW2h3NZLASflwroP8kJUqxHl0ft/yqE25Ug3AC0BOLLRQPk/FWp
 byqPWvJPbdeXRpkrabKTY1JnPl4h1DoxzSHC/ZrruYzD1biPIdKm1oEKd88NhQqzlzGR4Z4Ohgy
 shiQtBds35Gdvpw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

tidss_oldi_init() registers a bridge for each OLDI TX in turn. If a later
OLDI TX fails, the bridges registered for the earlier ones are not
removed.

Fix this by calling tidss_oldi_deinit() in the error path.

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
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

