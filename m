Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918701;
	b=rPbJLFkLaz1v7nQSeJIKHfjYYe4Yby8NMktko1XS0fLitnpOSJgzwDnswvU/5LkH6AGA
	 +ykQ/W79FLAH3A9DG3aubS9qSVAa3Ds0xCEtSrN4jkz5xI2Dr5iCE8Hok5wUlJnpsdr3o
	 q6FDHtHV4DqZqBXEEyQkaI/SCQ7VWMVmhhifpOnkSv2Kr5qdYIf5DGQwd5zqke3GCtgGY
	 ZmbTq/FxBQUfkpfdOspDBh//IyXDMOe4iHhcI+FXGZhs38neO+/zyiM2FGrhNEXzlbJUs
	 r7bCan1Z91UlprPJxKrRscYhBBNXPV0t/MG9HvN0u/kGmKDdL8NJxK1PAigpiZAGWIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
	b=YyL+PBQhusFSryj0sI0m2gnSeGPxcy4ZJ5o6wBE+tK3HsXNtDcU+hHWvMXvkBkTsJ4yM
	 hKEcofsGIfDePcmySX8ESUAug04x3ABs1VvrVWEqWYgSWHIZNal0o4ginvMpXCC1XL0rn
	 9+AOj6dRbVi+ljy58kJlkhjKRqZD4JbGOMS6C+om4HjiDYKQq0Bx8lX9FmEkiHRXk8hS9
	 AXi79xB36p45JTO/7eClDnN1VaA1Yfx8OiRKld7VDrqi2BS86Whz3a4uY71RMGOwDIpSp
	 JtKdmu0Kx9iulKaqo/SCBpUrX3sizUkSXhNHgh3XT39tIheWBL9Awzypw2zMpoKF5Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0h1zAkhN;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78550606A321
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78550606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0h1zAkhN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a215e64962so13739305e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918699; x=1793523499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=0h1zAkhNBCBfd+jMzU1ahmkYzTEgQQ7x+lhVNLUYDmjw3PIaPbGtlr0/DJDLJs9bB9
         ZYYAk1ShE6Zc5Zg4Oj/TNh3II9+juLMnZ2qsq+qLNxiYqbDWIt6sJR38LvjuTjy7QJOB
         Rd6HZvQiPCnAUQGNvPIuI8h7tIAjvUfBs1oI8W94xL2A4Zv4RSV2oOZLDG7bxKn177LY
         WZze2MMpmOIYFbs6cJqjJpGefUvmDNhdhQIcgLZK5gJC0LEycMYe7T7wHSmiuBig+0Jf
         gqLamkHFKXvEObKYGGu5MgYVKeVXl9Fqin2rBLu4T1WSt4hYmKSeUyaPNHOUsKLKu07s
         0o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918699; x=1793523499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=atV577wFTZESRrh2VBEStXj6Ffyysh0ap6gO485mChCLqkum3AX9LCH/91cKhCaJiu
         5bxXtQVDYUFwcFpseyfLvaVTKS91cinpBWTuEkkxDHIe3oK2azeFzIsRSFK4TuCfVyQn
         e9Je3kyxku9FmtMo901Vocf6NdgEDsypOGbRYrCELS75n1MyLfC5h50z2SxHLBGv6TmD
         TkvIRcSRLftKhVr7qwS8VNHBNz2jugrRkN7clVTex7ytig58kgrENofMLn+9aShmH8Nc
         MYqyAvJ52bUJBFUniiqPjBDWquOqdOvgO3/84jKVzW2rfmdtZavvwYBjYPB5eFPQSrnB
         PPlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxl4Erxva7vqEiyf+4F0nF63L3227HkDpBQ+MDleqHAcPhiOKtUa1YNkeDozCIEsD7LW9NE6ykF1+Wcnnw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHnRvGa+9sNP/pPxFdb3tBLlQzLsiKLM77j5oHVzrwHyjrSXrw
	W2/pmKfK+pzXZx+BP4IM65/dGkGB7MTh6w7E9PCmkqWp7bVtUkunkiYZ5V0eROKvAVM=
X-Gm-Gg: AYBFou16nIh9lPV7iJeQGMFu5nJ8zJ+3La03aOuEztQeAPydyNeByEf8T+vtLnP5COT
	QovgC8hFBmSWXHx1r4jvubh8Qkd5Bq8pkQ0AG4U1b8GCwyWmWuIU+65bHLYGEZ430LBwZOICh8U
	GM40VtufwC8VUGDmODxIjAdSh9MnzWl3uEk6ZhqCY+Q/7oryPM+lAID3MVElDrKnDcKSJyuV5Sv
	18MmEVz/+fnLOwByvCkxZfkyJ79CiDKrvsw+w0LYxu9jtjk4C05crcWe7XvjDu0t+2PhkfHx0xD
	bjSFXDRZN2TlUI5qqpu1ukYgFvk3Jo8h93qIFwIiyS9AlF5GzKmkXcDlz7TSzpvWNcEmqayn9sT
	yrQ46/6+t5sJ0fitrmim73ErQzCbbVnYkpFdQjIOrINaGEPW+xdOFNsSApVQlQZH2KNvchtsYtc
	GQfbbn+7y+8RW9F27Y96pV6PhUDxic1KkQzcLgqu3Lcd6R1Q8HnAYs4wCGfnAkepAW0PnfXBibP
	OZZxBH5NrSvrLFP8W5ajdqYy9TgyZJSkQq5AW8xUAEjsb6PhCqudkDK40VoqOOfPmejHk1vICbZ
	LaKImSd+/39r+gMRCYKJOB3NZn5GE1XmWGwI7liegVpX3yTJPjm9XISfeW9pkFvNHxxbAB0C+Y4
	s/z7kz60CuH16FJ17XoY=
X-Received: by 2002:a05:600c:5248:b0:4a2:150f:15fc with SMTP id 5b1f17b1804b1-4a35ac91242mr67013405e9.5.1792918698790;
        Sun, 25 Oct 2026 01:58:18 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:18 -0700 (PDT)
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
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Sun, 25 Oct 2026 09:58:12 +0100
Message-ID: <20261025085816.60405-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025085816.60405-1-olivier@mgcrea.io>
References: <20261025085816.60405-1-olivier@mgcrea.io>
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
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..b5bb11c20471 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -722,6 +722,8 @@ patternProperties:
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

