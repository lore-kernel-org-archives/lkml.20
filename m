Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1974BEE24
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950917; cv=none; b=II8VN9SeLu72S2jaDT8/mm/qleXpyIj2CZjW0Sv5FPKXcaQzDoH/dMrYppgLAlNkXD1Y8sWzooZbU2/gnYtrlI1roXMFBUvRlmFPC+NTHxedIgKCKjsSw/tswns14Jixhb+o3GxzW1hSLLo/7lcA13LhS2B22/ttrYUWBRk3o88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950917; c=relaxed/simple;
	bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HszY/o1GBgdZpINgCORfrKH7Ui1aLfw4F99OL3BovotBdb26hPE+CSMCajs74QGlZNQBGBbD6JEFi6m0rPkFdn+RMgBwhpLilCNs9/FlL1PkPrNzSiy5j+Ng7/aBlRbVDSCHQfVoFcPbAO8xZWsHlcc4+QiJKZv6cLFfKqJz0T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tEBMOciz; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tEBMOciz"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so936711266b.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790950913; x=1791555713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=tEBMOcizra5L0qmDTNm3J00uOZoDNWOvCWn+XMMtyAyl2yJSWfcIiNNBHTvkJBgpjq
         RN3GbnojkXRQHKGlGDaeknuWHeisoKhJI7A/GcDivEvqUrdjGf4i2ilqttDShFTcLiym
         u7j4ph4SjYPt07tdEc2DwkOGw/OPp0KDm4nXUSQpbXWsqjB3jdwWsrZ+sPgFfq8caKuI
         mk+BjJaGEAcfQ6zCY2/EiR1WZJ1sgbGbKPdjB+FHQxY17hR6/J7mju+JoLNdX5Kk1vo7
         k3nl/JbRAqpuqh4VlJFlW7XCh4gwofOu4nLdGkPzZ06dLpTlAvlzOXFvLRzHq1AH5crR
         Fi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950913; x=1791555713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=FwX0AoViZeDgROcLREFk4BVzleqEB9GFNGwzDnZJjQ28YhCHvEw/N1Vk1v/daP986y
         ZGlTpZb3e7Ye+ltC8lxvs704rbJ4nwNwbZsk68Y0K/P56nCeqeCFEeFVrL2rO+XoYsIf
         wXnvO2H69Wqv1RGvCRmUEw5DIX0uiz1GYFGX9XcHP1lLsK8W+G+R+IbWdWUdSvH8jaVW
         qNDejlGyYE5Q7SUe7qGZp9v4V86sUbiRGEFZT1qClqD9nr/I3kUPCH/5hizOgP5F8VAH
         nRpdR2/qsdeaDL9yuI8PoojNvLWM9m9+8kzPQkXryrWHG6o6PzpJ7nKETQKQeH5hjtdp
         doqg==
X-Forwarded-Encrypted: i=1; AKwUvByxE4O67HPG7A9F4oqFu76fntwmLbYwL+uKYU7j+7aLmbejFPcHxolBDPUkL3BROpsyFeQRGxnuU51ppGw=@vger.kernel.org
X-Gm-Message-State: AFuF++k5OCcXiFaBrw5decBiTSyCvZwjlCJfFMMVAsVXb5RLpMrQQs5m
	rRIJX82hdU50a/EsJnnBEDhKc0//V/OrSY/IxD+jn+jGae8LAl9/UQcw/NFSvI39kTg=
X-Gm-Gg: AYBFou0u3oDdPUwqyZXj9RqcXfcbrnBjlOEWQbw9TpLCp7Xgy1MzYGvmZ1esXmB8ZAi
	lgUCVH2Ar1WO6Zp4I+H0oqdD2Er2YG0UoJbpIgLJm2iCPJP2IKbLL+RIiPDJ34G489G8E9lLqCr
	ds2fDTNmk4U/mcZQ0VlnfFWlRd5mNhKEzXajUu+mele2aJwQ0Hvf4sI7KyqOKQInXxXYGabDESQ
	JV8Taw4ITjzk6C6HFbeB4KT6qX2ipO3IdDWJqXQqtWznZbOERi0lWxoFjSDTHV1pfFbt1IXRcZQ
	BCJJgQMZAGsKcd2MlJqpNOl1ey7rog5OQ50AdeesAUgyzZuTHIwaOzcn0FLNZXyAie5gaO5TAGN
	Jpny2ZWot3SDfpmhCIFG+3xiAnCBQR642d4KQUsezo7n6UNR34YbVapQjzDvECqNy+a/3eHyriQ
	UxqrFTbj2adjz3ZdDVZeVgUlvgh9HinDnOxv/CHZBcH6LkPbgeqTdO/rdtYS/IzT80zA9qPCbJq
	c82KpX+4E7bONpUVjP8lpxGkp1ULjtkX9fpu6sC+/U/ZTpCvx5F
X-Received: by 2002:a17:907:c486:b0:c29:462b:f908 with SMTP id a640c23a62f3a-c2e4afa70cemr214706366b.10.1790950913549;
        Fri, 02 Oct 2026 07:21:53 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf684e3sm89307166b.51.2026.10.02.07.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:21:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 02 Oct 2026 16:21:47 +0200
Subject: [PATCH v3 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-fp6-panel-v3-3-4b80f83bc936@fairphone.com>
References: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
In-Reply-To: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790950908; l=791;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
 b=vnNsKzfbkcaR8E0y2/h+wIatu+JyKUI5twpCAlB8F/NPQKE/TnVb4EiB5ijJkaLsyDesPU73e
 g1IiPWSVy6KDdSr2cBXQC2rSEdzpAJQHV+IejXByTjAlp4igx2Zxo2g
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..1d4afc733c8a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1023,6 +1023,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m

-- 
2.56.0

