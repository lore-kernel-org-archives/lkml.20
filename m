Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193510;
	b=dehlMYa9CCJSbKojZCemiFSGgeO7gru6bMkf3uuksF3x0KbbUnzdkIDiBYhMsvRKh5Yf
	 KNqhGPBb56luOX3BBupuRMO2xNAHCyHxIqLWmyf9enD8ByBMd0oAfRdDTs49eEGn9ZmGD
	 u+UIno1WUQb/w0LHhZH/eW/+wkQa1xlSYgPUY/aE3Upnh62OELzGhHWNmKqdFukoREZjX
	 GpdrpZKlGWJEMRmpYvXhpfpchucpwQxy3jum4ci138TpTjYFr7uT4SWQoOpPHXoOz1Hmq
	 be0H+L4to1rMcPx4zH4o2ecHIQy4EGM8DZjEXUj4wZVV9BSg0Rnm8gI27OmPEpdKsWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fJDTYkE2YZ8PG/A+DXCn/A9p4GFLWYNYpfuX/w3z+V0=;
	b=EOYhX5mTHRhKU98z2YPfPDw5+cN2GOi45+oR/SZMA8+ApNCbxiQudBLLilDTxFOtilnE
	 +bhuwJuDXa6YYaMCOHO9AT28Pl6aZNuiiOBFJT0lk2aUeogJa5CmQk6Gfa1q7UYaDD/Qn
	 bQQkNV1MXfcAiMCs4M0suUNZ5BI1bGFs6f4HxUpph+Kb1aYYOhOBhJ0ueJdv0MLVwQnBz
	 riWJVGXD7dxk/NBJQB/pGn6Yw0vMSWUwq9oEda4/p2TIEq6QaOjXc6L5z7siCgLLj9DXo
	 RvVfmHFrmiEV4Vrs/hRDnpn6haQp15TiU5iRasSVYNcdFX0hiSIZOlEpZcfXje5jBOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b="S/IOAVK5";
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4A8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F4A8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=S/IOAVK5
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c315869241fso144245466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793193508; x=1793798308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJDTYkE2YZ8PG/A+DXCn/A9p4GFLWYNYpfuX/w3z+V0=;
        b=S/IOAVK5NUZB6jNW20LHKneCPb6S2Yl9leksYecZxq+Psh7/11rrrfs5fNHSNKUM6j
         Mz2IWVix+DIDm+i61KeOl0eZNNx5gozogDUbexZP5WbclHgovPfaT/KnTJhSYnXIrxrt
         MMkAq6UXgAKl3fuQGpmxEABY38c1XHiBlnlMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193508; x=1793798308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJDTYkE2YZ8PG/A+DXCn/A9p4GFLWYNYpfuX/w3z+V0=;
        b=x4wKSUtXO0LSUHkGpeUNAew4jelvMIc6+naBr+qWailUC008XATe5//vkkA8rYceCV
         WsIrdPP49JvOdV7UVlhpeGl8dXhLt4/oZBpC91IK2xoWEeVrDPW/pvamI2wQ39j5KbqT
         01IWP+J8vmRPphWUA7VNfupfs1/4qT55rh3bLHA0EvSFo9Z2+qyw1y3bi4543MenBI6e
         t48W6KoakCHlqHgB5xFeAht9UpSEbn3e4oxnnbGyU4AoZaPL5Ctm/UDpkKk3Z4CxqHhK
         0+zeQ5GuvzABpnRilpMcUQYB1RGFY3vLSYco2W87N0HSHTdAll+jx468MaF3DPa/fTsM
         5jzw==
X-Forwarded-Encrypted: i=1; AKwUvBz03zFtGuNeN5KqyhyzrovBieeXS/AN+Vpy6DY8XQR+G2kLTTQfPPUs+JVEoE6Si2uBycryT7kxjCwqKNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs1i32upwjwxp3WA5PLQzqhtpln9pKEQ1lXuKbo5FD17eTT1eL
	D/AJfRrJu6NK5mtVT41MK6K5BPRcIXBj+cV80tgrHvCn/omgaGVoqwdIRA3PhArSn1s=
X-Gm-Gg: AYBFou16xj2Vaaml2m/8JQey2+zg3ABZGYsK3hgScAwoLyp+VTtUVbfXNI6zMgtQ994
	E/zlZf3/92E+SuGn7SuQuo4R3wEdeaFVtreiWZe94s2285/mWoFouubJjpROQqnXeqje4ZVmVYb
	QCQRAym61Ia3KELC1zpwzmChh1+cWo6LcZ2haI4050QY+fK+AsatSb9TzE3jl0UczXb89w4KZJm
	3l0U45HBRxEj42BjhD5Dn4EMRJMVuOjgPrmQ87uTXcEKiBg7OM+jyJ1EZJWavstRXzQN2Q0aB43
	z4BFzhwBkH4/mOcr2+u+MIJoKCyis+5hNuXgfSD2rJXsv9hCki7neAHmU5vJcd5D2evUKzRPsfp
	AYLJLty9XieRMSI3yFgb8jzQb83FSInoABpTEg1iyL8gBSnG8Beu6cJmDhGf5TBdpiZLYoVfvxZ
	pGiMaX+8x8+7Ohe/8N8ddlQDGwGDHev64uB6gi3jKfBy8DToFOkDL1sZqt0NNqV5oArdssxdWpu
	j9qXb4YpPnF8k0rBx73pThxdyI5cHDVbZ/6UrjgtzsksFCuCtukvq8JVtImqf5Me5fEIF7ISk91
	OLscPaAFJGuLwZA008nQ644NBM28Zx0jH+uzigOAZEgH+v1GhMbU4zIpkLC6X+x9w8EVatP9nkS
	ED2hGLvy6f94ldDc/CngUrZDfrQppll1KpTA5CMRvUkYGguS+
X-Received: by 2002:a17:907:80d:b0:c45:b99:f282 with SMTP id a640c23a62f3a-c49bdda6ee2mr203173666b.7.1793193508300;
        Wed, 28 Oct 2026 06:18:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650a56sm602252766b.50.2026.10.28.06.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:18:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Daniel Stone <daniels@collabora.com>,
	David Airlie <airlied@gmail.com>,
	Leandro Ribeiro <leandro.ribeiro@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] drm/stm: ltdc: create blend mode property
Date: Wed, 28 Oct 2026 14:18:18 +0100
Message-ID: <20261028131823.2649142-1-dario.binacchi@amarulasolutions.com>
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

After commit 860e748bddcc ("drm: ensure blend mode supported if pixel
format with alpha exposed") we get warnings at boot:

stm32-display 48010000.display-controller: [drm] [PLANE:37:plane-0] pixel format with alpha exposed but blend mode not setup. Please fix.

The LTDC blends the pixel formats with alpha by straight alpha, the
only mode implemented in the driver. Create the blend mode property
with DRM_MODE_BLEND_COVERAGE only.

Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/gpu/drm/stm/ltdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 5311e0b3e8dc..3b6e680c1c61 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1642,6 +1642,7 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
 	drm_plane_helper_add(plane, &ltdc_plane_helper_funcs);
 
 	drm_plane_create_alpha_property(plane);
+	drm_plane_create_blend_mode_property(plane, BIT(DRM_MODE_BLEND_COVERAGE));
 
 	drm_dbg_driver(plane->dev, "plane:%d created\n", plane->base.id);
 
---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: stm32-ltdc-blend-mode

-- 
2.43.0

