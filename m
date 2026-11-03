Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705774;
	b=sBqYcySYM3uhHdKLbU/wuOpP8PrrRk4U+p0OTlSo2DMmSZhy3NrIFIipqdg9vad6UJsp
	 bEPU4S4c5fNnpV1Bm81d7NM9lMwiE6m7grxpy8mO4OPjVXLkPyNtBefe48L/j58fX0sXS
	 Moqc5RLSb7IDTbdy95NIxkEOrLIkk/2+qlKsZ6xqaXn/E0pM/jw+aM0Ufix15dPNywTCl
	 IP58MyvbwGhPXiu9eH9QIPsWPJ0H46ys1pP8y3Y6YLdXaOHkA21M7AxNVF0S+o13QlRiu
	 l9zAOOhRBW4dXLfIfxPX8axxT65IgLQA0wXw5USeQ95XcBkuADSD7jG1GhSHss9qM6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705774;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WoqY59TBbrT3C7Tj+UiFPH8AvAu/mqEoGvH8cSfspG4=;
	b=ijFX7gDP4ubJH1hVTv7hMVg0zEvuf5ect0Ob01C2NMQpOIUGc0Az9Ocee3UVOrxTPMLK
	 Mo5OD5hA1bVgpRP9Ftbey2ufg5GXTxn9GqGsntVPKQuCjPAPKCRWP4Wia+XezgXw5S/xI
	 vYrrnKAsiQE4Xo8j+BBwBx0wsnSVocBJg5ja0Nt2mRogS+9tKO8eGv6yVTM7C5wolqKY1
	 rwB8+jypvzzGeEzqyHkyPkrjfO0TV/Btbps14XzV/74JNC9TX1QyxW7V1uE/5QJ8zjIl2
	 7noS8uKclYRgubrpWTga63i2tSOQbJKZ1fUUtNWoFaF0VNLPLoi5grz9QZgnbtQxq0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="HtN/mltV";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8167B606EE97;
	Tue,  3 Nov 2026 11:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8167B606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HtN/mltV
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2BA42819;
	Tue,  3 Nov 2026 12:33:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705628;
	bh=9zTXLhkgklN7e4oEinpYlDPDvpd1jSurXbMd1q/62KU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HtN/mltVHM31xsXvecS7TDGpRLPGbQ7DtT8kUx4vZ5rIKMaSquBxjgoRzDMRLwPrm
	 Uxe6PSPwSWbA1n4HCY7xsqybaP1/4sRfvdQ/sw147VYv2rKpUbM8WWdF3g6b9leQQ6
	 W5ub7qE6o2f8+XY6o7d+I237Kqo1zqp2wluzG5aI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:28 +0200
Subject: [PATCH v5 08/15] drm/tidss: oldi: Fix wrong return value from
 tidss_oldi_mode_valid()
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
Message-Id: <20261103-beagley-ai-display-v5-8-f1c8d0e52bb4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9zTXLhkgklN7e4oEinpYlDPDvpd1jSurXbMd1q/62KU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6ccYF8i2QmbTUmW7QGnj1nZebFFrjyawbrEsJ
 L5mWfZgKAaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHGAAKCRD6PaqMvJYe
 9SyjD/0e9Lb6u7bIX2Vd1QhyXQoyCxevWWuqh4x/t0P2dTQG7EJCbl/jd5toeXhlZrgZiUVU/ir
 VfI3KadkYAkrakCtzyVTEzPcOQoRXNqLdsrPW+Qj5hae7sDWWG5lWyhdpiH3IqNzJH+0iLtpj5f
 /zDeNXjvOs3u2AYJKb9QzYKH3PiRKh4A6YgtyzP2kMNPY51TMStErfRkZmGuge2r1XK1+ESKqxo
 9JS/ecD2UXFdkpucL0+VU63bLVvXE0+GO08V13lVssH5qlIoTGtpOQTghMgKQxcKUcnh50JfoER
 MP9g5mSzfvUTW+ghOJXTyBigYpSvogpID4fKJtZwa/EnzD4TiA9bpJKvjp5eOZPMgg1jXA9ioAS
 v9FsH5k/Dssacz4yNijuQt/YXkpmTL2AUwd0PRqsTvfE+q2IiLiOfzkGhX8Yc3hKilbvzgBbumG
 oqermIXkOZ0wL57D+piMCM267uxSyx84ikF2S9dnYk8qa0BbeGVAZa1nJRaGyFquS9iwAFRGz+/
 KPfCVNddhUS7GRFDG+P84dQRPucVsS43sZ6pVajYPA8bxVKZ1FlzRl6BC9KEy5HGZ0Gs/NaVyLp
 HVw3xf2UTn+j6PXfqrdX5lB6oLTiL2fz+I2nOxhXSIL3ga5HjCAwAUTwkIKyJiOJ+Ue1JMAdQuB
 dpScMsdlMlOBVTQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

tidss_oldi_mode_valid() returns 'enum drm_mode_status', but the current
code returns -EINVAL or 0.

Fix it to return proper enum values.

Fixes: 86db652fc22f ("drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook")
Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 82b059f85244..ae27ebc7306e 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -346,9 +346,9 @@ tidss_oldi_mode_valid(struct drm_bridge *bridge,
 	 * we use the same 5% check here.
 	 */
 	if (dispc_pclk_diff(mode->clock * 7 * 1000, round_clock) > 5)
-		return -EINVAL;
+		return MODE_CLOCK_RANGE;
 
-	return 0;
+	return MODE_OK;
 }
 
 static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {

-- 
2.43.0

