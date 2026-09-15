Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9804A4AD7F0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492403; cv=none; b=HYYo0M4qOAnC7pDp9uHTdwlxpSn2S2kfwK3y/9JlkOtlx8PRs9WovN7cvinXpnwgfFhOIRvkOzLF7FBqluwiTn60IEpR0fHgX8ndhYSjMLUObImgNMIfvtB3WLKnQ61wpjFKfc+Z1qdEiU6WdsfwmWt5gt39Lc1qibDZZ43aPa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492403; c=relaxed/simple;
	bh=uqGrsfhQVXplRsdUQGFvRbPRKj8lI1bt0w9YLpudhHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=geLWRpHwyTUuJej/uzqO2mlxi7STma5gmilrWldDcwsaxh9tUuJ1vOZ3dY5u7o58K2xCMVvbKHcuMMtOnRCoMkGvBfQmNzhwoYU80n+SF6KVCSACvOcrZc7KObDMdoFLUqfYgTq8G9WOYtJzvGqrwf612Y0ortPvrYirhnKuCWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcO3CCYm; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcO3CCYm"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1651bso3289156e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789492399; x=1790097199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=crm5nugieczeEoBXBtWI2YHGx1NS43N1iIME//CgsMQ=;
        b=kcO3CCYm4h13lTkKJ/DVNN14Wf7YGEGB2l0blocauL1o5J5Hc+LxJufeWxK63srb4o
         gdbA5TWw+DNlJwG/UPOEmfXvwfs353tTAO6d82PBjHWUzBuAX5GIARf9VXPmfOPB4ck5
         nhgNX/ZhljTN8JP6xMCahIcQwIxrsdJzBDQJD1avhowTssuO9a3ZOLoWLNCZYmpv9h8T
         BHe2uQ97J06SGkLn99Rb6z8E64uh9MZR3R/++jKaV+c9/rFQWHXbWInNw/CCeeRgGemi
         UU9GdBfjsh6Vs9NXF/1fIBI80d2Ie400Kz+Epr962VpZTnbdJKm1/QKOzV1kRVkjAsCW
         GbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492399; x=1790097199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=crm5nugieczeEoBXBtWI2YHGx1NS43N1iIME//CgsMQ=;
        b=WZJ3gdefokffD8B8TYDFB4HmpxoW545GLcaE24MwqsB5SHVwtXhLVie64/I2DAv/lQ
         wa0Aay5pvrtOGBwvan0/a2VoNJNWsysGogwIuYtjMtuje79MO4QTqi1Jork1myMiDxrz
         D2awY7HHaIJOdvsr/zecbEst3vL2qRrxVH7iaR0zGnL3VRbwaCq5N9HfEOETEzLqLKH5
         4S0ALlDRLB1gATqC6zt2IpVnKzu4zR62T/EpUHeZ/rlDGrAotRoZP+H6IK5TdZmVAdRT
         Lu8rju1kr8EFzwuBCNNpLAmAr8dpCBfNvduGPDjJI+C96nhnkACQ8tmRTo3W1FPtWybm
         2VZw==
X-Forwarded-Encrypted: i=1; AKwUvBxfk+7WER9kHwManAOsAZZHG1LcDhhyKljWyPKrJBrXOXGpF1pPSFoIOHraocDbzL7/HywE/I8irsJoGSY=@vger.kernel.org
X-Gm-Message-State: AFuF++nUvvQaud4BsW3JHQgH/jQLQ9iLljuiIcYBskclODvPsVDWrU8/
	aqjIbQXMVL6Z5FFWatpzuMUuJTG/SbvLr6yAvRGUFlCff+UWo7C9+zE=
X-Gm-Gg: AYBFou2evpy/MouaWazeij0eZbRoakAI2ylGfaZsqNrgNO7LUOQzYXixjYJsPqfI5Ts
	MuPBQmohM+o55mXUncgTY94vUh5vYaR1lOqyhjjBbHlUADx0+gwbR3zv28uVYPww+DUOAp9fg2c
	6ssoAnCcE7iW/KI+LY66Vc0zymVJBSARYvUBV2phOip1havcGbT7/kBdGrUYN8DfR8VxzEyRFOw
	gCbl6Cx2Em6wNERfEjM2L4z5p5Bma0U0UlqPhOW2qEmfyMrPuvSswhTLIL2Hs6RPYWygxyqnu20
	7AmQVRwZjrJTlDst6Z3WJXoT63gSW9fMbwkH0XjPQnRAdjWgAQKOn/18y3GNv84iHkOLihcpfK/
	cs0JGgE7wk9UICn3Cz0kjhpK/RSdwhssZlfLWnwjXts+ICPcDRCo8/i9TkDkpvaE0AXAvdqzW2/
	1jHf4xEf3pknvkIjCsJspQKIRb9k8vMu0KLTCG/5HihCwo8CvTIGrVDP25FEtpeg==
X-Received: by 2002:a05:6512:1388:b0:5b2:e947:b3de with SMTP id 2adb3069b0e04-5b8ae6847acmr1952542e87.7.1789492399189;
        Tue, 15 Sep 2026 10:13:19 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57eb908sm91791e87.79.2026.09.15.10.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:13:18 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH v2 3/4] dt-bindings: arm: airoha: Use one thermal sensor cell for AN7583
Date: Tue, 15 Sep 2026 20:11:30 +0100
Message-ID: <20260915191131.25214-4-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915191131.25214-1-sochnev.v.74@gmail.com>
References: <20260915191131.25214-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AN7583 has three temperature sensors behind the chip SCU: bandgap, GbE
and CPU. With no cells a thermal zone can only refer to the bandgap
sensor.

Use one cell to select the sensor. The AN7583 compatible is new in
7.3-rc1 and no device tree uses the property yet.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 .../devicetree/bindings/arm/airoha,en7581-chip-scu.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
index cc564dc7b414..4a10d024f5fa 100644
--- a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
@@ -26,7 +26,8 @@ properties:
     maxItems: 1
 
   '#thermal-sensor-cells':
-    const: 0
+    description: Sensor index, 0 bandgap, 1 GbE, 2 CPU.
+    const: 1
 
 required:
   - compatible
-- 
2.55.0

