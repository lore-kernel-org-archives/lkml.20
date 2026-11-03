Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705772;
	b=nR+NO5RDTTnQ5D0rytj1Hp+re8jPA4C+mg/2eHOxHjOH7NHpJ+mvD0kWoPScLerMjKxl
	 Er19ao8XZg3NbWztx98Gmd9rA1x7fjC2UCUYcWLnWzndDY2EDHE0Jmr3gW7kEOCXiX4m2
	 w4Y34k7PuB5EqE1/8ZkvIW4x0+YWz6bSQhsl9obMHabvzP4hVU5gJPJrUIXfnnBGKZIdx
	 UhvVVEQEnXN6pwAFUrDHjLyOqO2JYoUy+YpO+TUakBTWOWnA08F3vkEtqcWvqreYFl4sX
	 m78AYzl5leaEf7iXyKL/xaxlL1eF8x7gR758vfxGmVuenmzAS5iiayAi8S9iSrgFZog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705772;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Lzm6FJ5ffdfLiwl5TCfB94ixpmG2lfYqywc1zULq7NM=;
	b=1c9yxe0VBso/XnlD5Wto2cVkAicV4pvs7HYWaIiXCplEh1Ns7yfwq+YVwI9B5O11QS6K
	 4vQXtUWzsDjJcC7DsnES2LB+1m3jxh0nclnI5P267kuuQjWJnmLNgIA/Vh/rcAXIsfX62
	 wxvQdLt0qIJoSBikDwW20mmnB2HHXM7d65wzQzfXKgdNEjxGGEdjEKt+Wp7qgsjGxMfPW
	 RN75F5f/Jg9mcGeGirusdd4wBPeFkR2j2qQwIcFKvf4lEAqib5+iBwHAWyWEYWh6TIuMa
	 BOD4pQkEdQalUFkzTu3mcP2lI/lU9K7mpozYeSC7KRR5MYttu6I/ALoVNtQ80XZ3Y8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=BF4QVkXe;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1379E606A33B;
	Tue,  3 Nov 2026 11:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1379E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=BF4QVkXe
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2FF32805;
	Tue,  3 Nov 2026 12:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705627;
	bh=4F38s6u+YAdZAkcvnqS12ydXVGwdXIr2aETVbPB3uE4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BF4QVkXeBzUPQ7ZfoZw3qrPx1bIklmPJ75hN1b5jG2jNZ6HVk5rU2fjx3eSduX74/
	 USzRE5G76QW2nTpEUXmZW8sZTtP76CePqPTvUjO1KyYMEhD6B43suX1DTLvH0Y2cwj
	 InvebAmeC6ZLftX/G2eukkgpOl4tpJHbkisY8b4c=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:27 +0200
Subject: [PATCH v5 07/15] drm/tidss: oldi: Drop unnecessary forward
 declaration
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
Message-Id: <20261103-beagley-ai-display-v5-7-f1c8d0e52bb4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=670;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=4F38s6u+YAdZAkcvnqS12ydXVGwdXIr2aETVbPB3uE4=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGrpxxeiQdCssNWcjrPR3Yhv4bAQhNlUrpPfUmWc/SmFYoCgG
 okCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJq6ccXAAoJEPo9qoy8lh71ShEP/jcT
 0GlOEJLepBQFo/LlgcgrJOL9HsgJsblq2Idi1NVsLt63IHLAOb9ENcpi93GIfnK1mHOdy1vp9Hg
 y8quxkqJqpb6CqnrrcNXF0qqgdPJtmRX8xXDwSdbTWfuL6JYmz+IaCvl4niNz0OF84aGmcXqOsx
 bPwmW3mRaoPXr4nABOHSAAieP83jxNCKljntCWHV3dda82gJMaDSwRQSbbYYl5Anw03DwpXE+xZ
 UW7gEi1Ia6NOzUENPbEIKHZFOqqEn3SDg7E0RY2HCawhX59GNR92lI2EmSwr04SNRfkqC7AbDBS
 +7yrAsVLF6TNKFyKOv+jd1UwY9L3jh9aMbRJytD/iLkTrfTmjpk82wdBqYn0fIKAJiT4xJuXaz/
 ICBG51tvf4bSouS/vCwop6DIWI4jVZ2Ut3KVYuSPp/s2gADfVegmSTXqgfRyf7WkEcnyri70reI
 M2SMbMWqqezkKxXKEAxYC18lS+bEG+pfgBM25jCqdTP4oyRy6imowaHyUb3O4tXJ2Qm00JjRrFM
 E3HhwLJf+ZXxc54kVitPyqRw6ikmZ8qQ+eecS3BtpAQw+zJwUx7YhBezEvQ1C0EEObCmVyuoJjH
 0tQ5OWoiai375iBNlvJ1LD2ly9oNUbYF9OdHdpEAGfUxLOjdowulzIDGnNa815qTAgS1Nmi8x8n
 4ysFM
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Nothing needs "struct tidss_oldi" in tidss_oldi.h, so drop the forward
declaration.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.h b/drivers/gpu/drm/tidss/tidss_oldi.h
index a361e6dbfce3..ef9597fe5409 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.h
+++ b/drivers/gpu/drm/tidss/tidss_oldi.h
@@ -10,8 +10,6 @@
 
 #include "tidss_drv.h"
 
-struct tidss_oldi;
-
 /* OLDI PORTS */
 #define OLDI_INPUT_PORT		0
 #define OLDI_OUTPUT_PORT	1

-- 
2.43.0

