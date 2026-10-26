Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000821;
	b=k+1JjWvdoemZuM3va4pkAswEruYi0tpR/XQzgFHgK2QWGNB55PWq1dn3lT/Ms85n6NPC
	 WZH5Qf1s1OXk1zd3q8e2SlzI+JUSNm7MsUXmONtZ6IN8ay26pM3kVH3zeec+wcFkZchGD
	 Sa7aVFLBIpGRSKBMVsodI6n1gCnjA92IdhXcML+RxAAN1uAI4MiZ/T53rGpIbwtvMWRCm
	 56bwIdpezOSNqk8HovsZd17jPoRYfDf0Hcjkln+dpxK8nPvb1Gbk7Qe4ynIwm1/ecGWTg
	 /9J4eXn+gtzN9HXs+oxr+MHuF3dFt0msLkfrdSgmY7yQnLnUdHQgA//oDPDUwP1vEQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c5dii+p2+tXugsvLbD0LiEn9CLz6QjSaElSANvZFz5A=;
	b=EbVRLPvG78Z7zrVqurkPYUrxRUIBQOqt8AZXTAp4LqZ5MWb/7mYSmEUJAkFKkcDxQuZR
	 BsTGRoqzMLFFWPdecljyEQvYM+O7l7GNho4sfsUl9GX/nFNC6pGHVk9qRxVTCQd1BZlvx
	 8ZQIeP0iXO8kOQD83v8qhzhaPnza/SZUXxkbY6XTG5a+06R8bP9v3IMnc7wFH8uKQCtzF
	 aZgwLXOygWQFsu+OGgivj+UZalv7WAT4cLjz7uHpRNSF3bEOwkJT2aJIDqc1dMbzntHst
	 SggKNA/FokAShV5AL43zvHgUMR6VTfStigvPsu0FxO2ke1oBG6u5nTlwuyKlbZO2aiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=NCzrwkS7;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67814606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67814606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=NCzrwkS7
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so15446695e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793000820; x=1793605620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5dii+p2+tXugsvLbD0LiEn9CLz6QjSaElSANvZFz5A=;
        b=NCzrwkS7ftLddMPUiiC0UEPgiUmuUYezwx2j9vcNMKeg7NnJRX4sLEAL56vufEIlDd
         Ngvfv7abkzA3fFBpQA4wpjEiNDBjsLalUBTWvlcTMlZXfM6nCt6fUvAmh8M2/ttu4YJO
         Zpuu3rwMZrOq0zCrdz61m64foLZQm/O1Js7Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000820; x=1793605620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5dii+p2+tXugsvLbD0LiEn9CLz6QjSaElSANvZFz5A=;
        b=rIbvZ0C/GCDrx1sI6YByZkodfQJyZmfKGp4ACOIiw6e9v/SJEVQPTy2IW4q0FVuROb
         7Cx3LJIu3vocpopnkBEpmmr6L+KnJDC+rV01JHUMDnR6W3sUIppQXnp0z9xMO2eCkrUI
         3BPwmYj/0iKp9DBEDv/hSvQry3QfwqwswUGzuRxzGJ1SBKDlR/2awUAeLKY/QVmJsM+E
         FoduMFhrUb5IzvGUfjKywAv6oLO1/1qCNV/e9/8QkOeu3ta+qCvgbUafynKOI+PPwFru
         j1jDjQ2icjJCz530DiQOwIB3EPbQDXD85OMwKkfGIhoFdjxh0rnOCnW19nZEs0eLdDUV
         4vwg==
X-Gm-Message-State: AFq9FYKG6yQ6XZxRxFa/3Ro6HC+ezaxWyznP1but71sMPnwl+SnYwy99
	1Qn05zNsaBshO+n464Nrfkr/P2h7qKDhHyg9M1Ykr9qgaHSo73R0zsB12xNm3t85gsdTKhhl/nb
	UsrMG
X-Gm-Gg: AYBFou3ZL7MBT9xFCYLilHUgWAJJWk8xLxsb9qtXCnuvjJq4jhRu1o54UENByQYIpO2
	dewBavgozbhCzGknI+cY+NubCogeoZwx9Fp9jR2NX2f0HXfOpDsS7uTTTBIfAa9uCu3IY7+OgEo
	AoBklbFgDSgaiFeVhmEZjGow2POnX4V2VAUBcGGdAQd/iTFHWIkg4G0x8untr/st4xZRoeYG5DT
	9N28IdhNugZhXPEr9gaKM6qvvA2P3SIIIqBu84wBT7jlHyf/6iQMOUgbfh2itB6Q2oERWlTy7u9
	oCzm8Qll6eD7G6ID1i8wKwwDIoYv5wo45LxrYNFlT/J9VWl5ta4ey815FPfOAMUw5bKfP6nnoLA
	Win19tvG/DWJUTiEOelAtNHrqiOITavt4HuQzO3IwhLgVzgKWtRi252+omoAqudx7joJLM2HXqF
	A16mJSy9tfOeCMrhWhiM5cV8m0GH/5JAXLzTVQxQ3X/vONFmBji327OqQoBqiX6Z40R68RnivbA
	YQCfFhGaYpiJrAHy6bxn61N+AikjwLB/pT65kOZkCuYs+U0na3O87Z7+xSOwpjySxG8hyM4QTKC
	lOi9iSQu0yqGm+p0Jx+gwdnphkw0Lx1Wqq4UkSol2VU6Zsd8CrEjXowgewfA5nWu2qrnsLHcUSP
	wD+WNWiVEYNAnIaFeeBEsRc/Frq874ckw0Mp+3yKH9Zcr6d14KKT1bg==
X-Received: by 2002:a05:600c:3541:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4a35acc6a2emr107275155e9.33.1793000819693;
        Mon, 26 Oct 2026 00:46:59 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm13731353f8f.7.2026.10.26.00.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:46:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
Date: Mon, 26 Oct 2026 08:46:27 +0100
Message-ID: <20261026074654.3997494-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
References: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
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

The common clock binding provides assigned-clock-sscs to configure
spread spectrum clocking (SSC), supported by the clock core since commit
a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Keeping the
vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
properties would leave two ways to describe the same thing.

The properties have no in-tree users, so they can be dropped.

Existing DTS files using them continue to work, with SSC disabled,
until they switch to assigned-clock-sscs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---
If keeping the properties as deprecated is preferred, I can add a
fallback to the driver in v2.

(no changes since v1)

 Documentation/devicetree/bindings/clock/ti/dpll.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index 14a1b72c2e71..ffbe50f46e68 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -56,12 +56,6 @@ Optional properties:
 	- ti,lock : DPLL locks in programmed rate
 	- ti,min-div : the minimum divisor to start from to round the DPLL
 		       target rate
-	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
-			  spreading in permille (10th of a percent)
-	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
-			      spectrum modulation frequency
-	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
-			      to enable the downspread feature
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
-- 
2.43.0

