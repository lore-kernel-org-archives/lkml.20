Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964080;
	b=nFCZhhKVXQzUdAdw3IBvIy1RL/fvXnIKAR2B0wvHr27SEusH4d+obhR8O+6S4Pm+m8ap
	 JGWQWI9c/nj1E79xjL+ulLKBAtWjh8kiA5ONO0iG6PMjSQk4FZ23+bXvzL2WB3rKHUczN
	 04/W5iBaJRF9/aT5BKsaMKLDrxUfIAVUl7LhDfbGDnm76NGX0y97N3pbBZHlTd8fBsDsk
	 qKPBsheyJ4KkFLqZmk8sMfpLSNDFbWryBVUQ6838bL9k5XIZZDONhLxos/SkvpxutGE3m
	 VUjJTslt7g09ak+AwAn86pyv4YwVLFcBrT6beHBue2APO/5hdM0lduuKkt04BVIbsVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
	b=JQ4pqZ5o7SwBdIefAyYmbXSdaL0oXfpCITP1YnVRCwMLpwnwFrednSlKc0+G0TMibgw8
	 8IDNqwKMFy8nC2gKHAMbDshT8FfqhVq6Rp7FjMU1P4b3fpVmFJtwOJvnaraP40lJgHYt1
	 sG/CwtmqMZiVgD8QL5T4U1TEZtlBIHnBYAzeGPhaRx315f+Uilq3hRMo2NgZQMadq3uWp
	 QrflkJHX1Yw7v7ppaNK4H5ZZenr0kM3devseZh4D9aGr6NjZ5VAw7ykbqL0EHoASb2I18
	 SQEdms7zwybSfuGNoyVRHb7No36feYyhIu8GR4VesO5iePb5ItF9gIoaoBDWg45tjrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmWTSGeD;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1480606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1480606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmWTSGeD
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so3920205e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793964078; x=1794568878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=bmWTSGeDEyRgw3Rr66WU71/HBLPF++E77hiVxVe5mQUGqMlvwX4en0t5YLXeCl/LZK
         LmUf1MywC1/4VKgZRiTSmty35QLyBqr5/5CkKIsTNGZokKe2LtFmjMtz+S7ni2H8xZBd
         38uid3mLVNQdJHng0L0lA71yHJtG6KK1IMrhqnSTCq5spCmstYPxpbJHu0QQupb2ZuTu
         9cZA15ZBFUTUTwLCvPSM3+nku+epbwYDA21+hsx7ECFiKXawrZTSBHckAEXeSutOl8hD
         6zmZfEyQDuGUDrBRw1MqoinhTvoUFBRa4FJ0H6U8udsZ9/mqEYKNRhY7l+VlILdZWZjb
         TntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964078; x=1794568878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=0epscGukes6w3gNckO2PDisUgIX6c+58OoupFR7AG+bWdeFmkusZ7HppN1UauzZUVb
         /3vC8oA7dqWsr88CK5vbaVQW3VSgXsLs8FR4EnXpozvA7A5lYMRzxY8me5Xv35NE3+jw
         EZ42CJhWJgvYTohZRmbgEpwQkGWnDF9AXBDgbVslUoUhvPXcUIGkhzRFbsZqKN3UdMaQ
         J7HlyJY14Y2ZjxA4zclcxzfbf6x1k2LOzAMss84WoVXLTZgLhODZjSZv23FdXADC9Opu
         5ZzUQMIGnKSrg+AlHPxhPXkyLLcbBsReFMt1C0I+Ai3IzT/1dhfsoJ4IxpIS+7pIpj3G
         z70g==
X-Forwarded-Encrypted: i=1; AKwUvBzO/QDyZvR5mW/U/Q5BPbg+I0odACyLNCbTH89NZ6v0C2MN8vMYN0RFCktkVZJsnfSfj7Ww9GBxs74TeUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z96uLug7Urd3W3w6HdYY9CH0vgx6kIgxl76FOFtkAb9Zw3NHm1W
	paG2D+x/5XM6GOrQ/l0we/gtGJzdsAsu6L4nLdHWUxfqogErSDR/Wva3kL2rBE/FdPied3Lmgg+
	GT4xQxmg=
X-Gm-Gg: AYBFou3akzvFan0H8DNtmA3fekFzaOWnc7RApdLOT15qZXVo1setE/A8jZvPpFMtPsu
	KmSRRnvtSLvix40twfihjA/FZUNLs1JjklD3C4y1ny3ZnzpLIoLa6refeEBQad2lR4IBpnvdE3p
	HWq50Qv6VQrg9t0vuskjUbGDAgEiC/LmCs0DK4GRgzxR4EMKCro+EQE+2MScBwmPU7kz4KkopUL
	rtCXAI+xey6axxdBW21ZTrL8tvgpiidScCg8TvXWUkdF+pKq5WeoMy8e1BDRjJ5IKSRgAvydPQM
	/JdR+JH6AGcNyklnJ6WBIP/zYx8UAzlIb8arlsW08HPQbVAtD6sD5SZN2/VYt9vYwYqk/NvhdOJ
	pwEjrN9THooaFrU5YajrFpiIYFQWBzFuUwkF/EjqRRfH15r+sAlKQCRRQ84OkQA9ffsr44dmxoq
	CMFFY/14+uK78bTcc+CL3hG/+535HRbhFW0WOCrlaDwcqFQUY5GvhJaFmI8nUA7VQj1Iboq3s4/
	HMrpGw8FeCrjMsWZM3DDsk8hfGS9NsqCXslzJysrnNUCpnXWBfMV4eMTQ2vwLhgb2Xp6EOdmD+x
	IH2tI4EKKQZjEkKqJwAE/f9B/DhrGICsxwXZ7BmpMP9/judiudgDjhAdwy5nFSw=
X-Received: by 2002:a05:600c:a015:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4b6df11d637mr31306905e9.15.1793964078175;
        Fri, 06 Nov 2026 03:21:18 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm102404695e9.9.2026.11.06.03.21.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 03:21:17 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Fri,  6 Nov 2026 12:19:56 +0100
Message-ID: <20261106112000.1612-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106112000.1612-1-olivier@mgcrea.io>
References: <20261106112000.1612-1-olivier@mgcrea.io>
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

HiBy makes digital audio players, among them the R1.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7602034374d7..0bbab57d6c25 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -732,6 +732,8 @@ patternProperties:
     description: HEAD acoustics
   "^hechuang,.*":
     description: Shenzhen Hechuang Intelligent Co.
+  "^hiby,.*":
+    description: Guangzhou HiBy Technology Co., Ltd.
   "^hideep,.*":
     description: HiDeep Inc.
   "^himax,.*":
-- 
2.39.5

