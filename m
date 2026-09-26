Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A86F3BD635
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421271; cv=none; b=pLtYXZnwr6+S+ZulwCCNendVevgZePOuXi/CgAumckVu/7tzO8kQD+giAxZa+JWPXweMhStVXIv0hTQ1wN4u0FSGFk7aOhpTbFlgg6mJkWFo2jQ0Yj0xafpr5jR/MVBSJyduF2EGUo+5LWpsBsef6OqQGftXddgdz+ctB3raTn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421271; c=relaxed/simple;
	bh=cmi3T7MI6QIiQHARyUJAi9tuJH7MDxa0l3Ijg7o2VCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QattwGqDzMJOG2eNtc/VcrBYhh5wsB7+3z9VHfcH+p38F1xvBTTtbNbtyylclAAUMbpOBnDvQHkt1QbbAk/PLAq2e28xBrfrOW52kE3Pr0xfLf1eVLvJXmkAf1FwuscDjjgL6E7Hfzz0r+naQAdpH0ktaLFaFIeMt7pJUH04cqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKPDE9z2; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKPDE9z2"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so7240095ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421269; x=1791026069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnxpUndPTtMcwTGMAPeAya3Up+u2XyfdmZAXFYObokc=;
        b=YKPDE9z2ZycZTo2Dn2F0x5MfcVnsQ6UDeRG6m9b/8/tUZv+xuqB0whoVmVeIpa/76y
         85AyVOQWNpRk/EozgL+qTUExfT+HCUu94RwqXXB45kyZ/gv+BYW74OQRO+P8Fhim+xFl
         G6jzq+hz4DZ32U6HHB5JhtwjFMgkNjYD5NLwbZVi5rcgdgHGuc30r5DWnlh5PXuVNFUV
         bWjyJGANqRGB5q6uGalKh8FRwj9KcdYjxRf2hmrTUA9Q8YS2MTUDr+qzWy61UdT82EcE
         nQONIWyqUcnAuE1v9bhNWpAdnl9G66CWnlbQGSlqyY1lcbI+XtEu9MEQxsXFxpgnYWSe
         XN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421269; x=1791026069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnxpUndPTtMcwTGMAPeAya3Up+u2XyfdmZAXFYObokc=;
        b=sIUxQVhb4NxsheoKZUOG3QIB3VqvV3Kbw0sMyWXzhT7HGvMqohbq3I07nQ9+CjN2tW
         YLSTaLM3/I4WKgzvnEaOhIw5WEwvmFRIbT4PJxKI0AT20ySvitHCbe1YA/djmhcnqHSD
         6HaPPdtYHUwz8dIqR24h9RC4PrfEJLVLfd7ueHSXr6hiNTcFL7gIG8LQmj2rWOMds4BR
         vCKXTqq0vkGKTSUo0204e3LldXyPPtufHIaSIZjWO2tCDO2K1RHV/FYTCaFaTUg8tRbX
         U4AgVIWxFF93smjEWAnjJHfw350t0lCbM6dFVtl8RoLdKSLV6ckR3eF1ikQDClbsuLy8
         XDuw==
X-Forwarded-Encrypted: i=1; AKwUvBwwBpUhK76RoOyHQnl5VBnYx4dPEEMEMqBL2xPdFB9Q2V5n+UnOOdHRffpBhZVh9WNMoL5X2Y56SYhL2HQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lYgsQSE8zTJ7ZH5SQV8MWJtI9CUMd1JPo2XH6IULZXsaHYz7Yr
	HQ35sXuGE/GoEFbsOy0v191hMQCPQJG2KDAWfkMPwCnK7z+EuMk9wFGNXA4iJm6m
X-Gm-Gg: AYBFou1l5DRwqFIej+1Mn99vSpFSbHhjnsq+P75Phx1iy4KGo7FdshfPpDG2tRjGlfH
	8OldwMWUsCeYXuzRGRD1kAC2bus83qr15D3vHctuI3LnILMgc5bQotI4uCWRtBWxvNFLBl317ij
	jHbHN8waKxJmpZYnldynvOAwGPps5PoNuQyaSOglM3MTj4peyT3Vbej8fkHzpBapvew2QDob41J
	sUawXt+tNRHKZGTKE9TJ6p5wrX1lOViRdKWL/xBS+WKFnfRqzuGSUD1h3ZpIF342HNImEkRTcVq
	dXRIqXNEVww/X/dMceppWaDbUiOCn5EuCq4vvyjyijIvfK4vxM4iBa+J/d9I/4fYsWSDNSc58qX
	YF4NfdRbfl8Lwi9E7iFh4EQnzN5xWRxCdvZ/w8RDe1+TAITEP2JOuIrPagrDJyY+IF9DNzQn9HS
	nngE81E+djiSYzwF/tOUUhmEh86lA3PeSDsdKHjbobwtSvuWF596vjG840pHR7UYjDscAObaJ85
	sTq0et28HW3neX2m4Ot
X-Received: by 2002:a17:903:244b:b0:2dd:c100:7cc1 with SMTP id d9443c01a7336-2df7dd6d2c9mr65998225ad.61.1790421269577;
        Sat, 26 Sep 2026 04:14:29 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfa60bfb1csm7247365ad.48.2026.09.26.04.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:14:29 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 19:14:01 +0800
Subject: [PATCH 3/3] ARM: dts: mediatek: expose the MT7629 TOPRGU reset
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-toprgu-v1-3-c124bf9ac273@gmail.com>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

The watchdog block also provides subsystem resets through TOPRGU.
Add #reset-cells so that devices can reference these reset lines.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt7629.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mediatek/mt7629.dtsi b/arch/arm/boot/dts/mediatek/mt7629.dtsi
index acab0883a3bb..465900ce38c0 100644
--- a/arch/arm/boot/dts/mediatek/mt7629.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7629.dtsi
@@ -144,6 +144,7 @@ watchdog: watchdog@10212000 {
 			compatible = "mediatek,mt7629-wdt",
 				     "mediatek,mt6589-wdt";
 			reg = <0x10212000 0x100>;
+			#reset-cells = <1>;
 		};
 
 		pio: pinctrl@10217000 {

-- 
2.55.0

