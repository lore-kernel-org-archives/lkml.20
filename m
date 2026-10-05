Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261034E80B6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232123; cv=none; b=il26qbtB/dL2SxO3oHbHcbpt0Nu/cyZWFvYvZ54VD+ASh1h3FEkuguRurhM0MDdWEArhaWSuNvzmOJywdF7aXYrUNtQ7Ir22d2+ioY6ab+ZWRckNH2GECCEDX8mOrOLWG6JIqhU5ewQ/c3GxDdpZ9itbNMFUE9GKKgmYvCPnjvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232123; c=relaxed/simple;
	bh=WNhAk71Qu8BZ3KT8auXzJe4ZdBz0usxwjjmPf0EUGmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s95g8njFu4qjIQmjy8oQPrj/P8dbZDkovlxuqHfcRcMquaM18qPMw5MihVFWwuLHc97RRlusKsUyE3XgEpFXiY8CJwykLAd1LvbJAZH5RZ9W1UuX+zLWyKVoBdTRmre75CmEL8UAR6XKcrcIM61pwvtEbjwQkuUnjjj5DXFm6y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHCXlquM; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHCXlquM"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae42b3e901so1340902a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232110; x=1791836910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugyUVM7WGa/7b/4xphp+avO+tRJrF2CcrsYcs5/Na1U=;
        b=YHCXlquMz3Ai+DsnISfGOCMdumjGDiY8yQas1zGAMp1LLganXEU+Ds/GwxSrFZTvz7
         3FvDzyICkAocLkPYccgUY/x1K1QayJKk1d2e4g6mxbu0YQz3dEO6J0E9UmY92BAlhM1Q
         4t1CByQr7L8xOWGMoAQ6ibMNcK1rQ580xUX/unbDZQ9nnVo0xJGqcGOEfi+kGuQY800Q
         jcDPDktA/Wy6/C6A4lV9JZCP5uWDTV/8CD+ioxsWRtw0lDA/eAbWN9r1korPRGh7eHep
         296rePZ4XXXN8rDdAfSpzgYv6ZewJzNaIVjTv9nXnSVeDNF/32d3d4pe66dF/1VH71Hk
         Z6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232110; x=1791836910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugyUVM7WGa/7b/4xphp+avO+tRJrF2CcrsYcs5/Na1U=;
        b=JuGlc5OkTgDDA0OVT1Zi31Re+gG0t9ycL2giVPhYhZWMM7OSAH4juP+g5DKd8X8BuJ
         qlJyd0yILMkR5DPa7d/uim5u7LdZTdGNQNhZj7Q2KviENCdd0xtxIpOsz4pi+RqqaXu7
         Uht8t72525JOqrj6svvesvhuzs5iSe0OdUGjYIvuGFlK6xzUfxanQF5WrCkeYWetF5GH
         QbIOe2RSQILqo6WfcvTntDpVkFHZdtrOSjbE4xrdOv6BRhkV99/xGLs9ht4AJ9gSwaqD
         1Jg5VN1cTuDixGPZLu+dUg4DF7wOXXTTxE5uowpTQmA0T556LCUk+KWg1ThJriNTXY4H
         THaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH8NZ3dC2SVx6KPvmIRh0WY6RA4i9AfL1Roc2ww5FEKfao/vYtGOji6AYysSDZRwVVVtuZsgrGY9XIwb4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvQKvFLAaQnhX/jqGO7NczlhkVjlwIsTTzX1OAExIKV3n8HVci
	v8WTnFZBSern9O2smTIUXg5zJ/AL5QdHKWbgPXzWEJxTsu7ibRcycmSl
X-Gm-Gg: AYBFou1O7KR8SWCVJsKKrCEWU7Oci/9gTJb4EFgAzWq/ehN9vCGf2HLpIZE7/W6YK4K
	YIDNTXy3/y8bHVeKH50tpSmm688FPt/mQcIh3b6CaMunO99O9Fx9kbG4c8lkXZd4pU6Jw5C2QqY
	cfwTC2C7kSs62RhvzrtxDvU+P44UGW6MVvPPcAKddEqMLDsFYot4pYKPglh+LsuOc1Qj/EWsrKu
	Cu7ppj8LNMYrWVWFM9Em7SEy7zpnZXFhreGQap8wnHmXDvJ/z7tUkvyK5GtLM9D+gWrNGYeGfjS
	rXu6IHP/gv4xHBRqhRm+K8pguCaHM937lCIUk/pgQkVXyc43O/a+1dRu/tiCkAo4oPvkAe9M9du
	rgeVywOx/Kdps5hxjd9+ZD0ZS8laaP1oIGj+PuFnNXuKT4jA0lMFmYGHZ/t3uSShu/DmLZEHl0f
	Mec+3XyAIn0dvwsfzd/m6sltXSgP6NGbzUw8StBCQv/aShnaFjDMbUUfUWf35lDs1FNKjStflsg
	PuVQ2RuU4o2inirwkLrJeKiaZ9vMTOw
X-Received: by 2002:a05:6402:21c4:b0:6ac:7d58:dbed with SMTP id 4fb4d7f45d1cf-6afd834a917mr673140a12.3.1791232110172;
        Mon, 05 Oct 2026 13:28:30 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:27 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v3 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:29 +0100
Message-ID: <20261005202731.153971-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same watchdog as the A31, which it falls back to.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index b35ac03d5172..b70a6b45a33d 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -20,6 +20,7 @@ properties:
       - const: allwinner,sun6i-a31-wdt
       - items:
           - enum:
+              - allwinner,sun8i-b288-wdt
               - allwinner,sun50i-a64-wdt
               - allwinner,sun50i-a100-wdt
               - allwinner,sun50i-h6-wdt
-- 
2.52.0

