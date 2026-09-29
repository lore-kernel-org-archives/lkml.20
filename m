Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78E452CCFE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690830; cv=none; b=L3L33wiZzhwQoBYYNf112cUt3vtYmMJldfcD5psrEvYsItu48oRptSLax6x8qKI4X07s6EhdFAseEF+1XVjPvncJ/EokTMD7rLkfdsxfHlWj3eeq6/Jf8dCN4GAj8fhsPQ+CAbuZtn1OHgXFj/TdM5tB8EDvEEsQUSWDyOrRshA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690830; c=relaxed/simple;
	bh=Vmig5rZ+c16r3hkNpOzGu9/REi7dEcyRJZF5KlSxI9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BfZDu9cvU0mmmTeXaKsL5DqMmGEMxkR9SB5W69VGeMQsFP9uU3077j/SttqyAukh9KiSPQjMTojYQA/1mYNBUoSMzpCH2sK7zUE9ZXSY2VlL7KahhAxDXldax94qkYOqgIGaNHHKhs0jPMxiNqbk+4jzBKLZYasPKIAUq2AwOpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rutPhvnT; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rutPhvnT"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86dd69a1b15so866424b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690828; x=1791295628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDqj1iQwJZUY/2vPDH4xvwzMNQEpOpP9aM8RQ3PhJ9k=;
        b=rutPhvnTtzYo2v4+APBDe4rDLA4Yy3dmCDd9woN+8CdITqveDJPQx8B2tGt++bQAEC
         qYYP1lzYCbNEcIUQ4wypxQBx2UbFm9G+6iYYQO6zstWSnP2mW7JCC0zmCKridfJVOQUq
         vCrO9GxmRgy8uHnbpIGeznFDjdGeDdo8A1S48mpYgFbabNMZj/YmigdjOksaBCQbYmr4
         S9RI5yFYVcGXHeuY0PlKie8oIWXHlyJCgElP0fR4DUluEkq2wsTm76xVFJbxVk1vSwaJ
         Y6BAbEsPzy1H2P4/LBoac3LLhFlaLs70mmznXEpPC8W/WsVM9envKr8wICiFauPIZ+/B
         XHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690828; x=1791295628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FDqj1iQwJZUY/2vPDH4xvwzMNQEpOpP9aM8RQ3PhJ9k=;
        b=FALqYssR6eVXDMbVHmPYh+0cq2+34YIQfpbpsr7vNAjDZUZvPQXZSvNkrRM84+5iJy
         VUzZn/zLn9reG42N4n1K4/sU1T0lftJTGZgElfc3o+4u9PxgnssjSY2kbTVM7gnOZkTM
         /FU57cXz6VyLgNM0XELfWJmNFVWWvWMQ8Mxw53bZK2o4OmdLcLc4iNCf/ktnRgcmdL2+
         Tlwx7QzTRU7zw8mGOWleFEx5WzgnGY2+kjA4e5PZvUNgrEUiApgIf29996dgQ5hJlsdW
         yCxXTmXnC+k8/WMnqUgtCegH02KD5CsQOY8SHnPw56qyyHmH2UmIAWjmzvudOQfV2105
         2ytg==
X-Forwarded-Encrypted: i=1; AKwUvBzXta5eyd9kzaL+bxzVJyKUYWNhYRw9/7hQHHURhFFBAFZx+WWOOQ/89eIJXUkntpIBZXlOukDaIUQQrxk=@vger.kernel.org
X-Gm-Message-State: AFuF++nE+lOX4yOCeL2cYRiIrkKdBVYjQwng0s+0hANmODPghQDDFOPH
	E26djsiy8rSA/nzwXA7yCZrdKVwHf/nW4dVQeP1fYs8TrBMy56od6jX5
X-Gm-Gg: AYBFou2N4JpLXPlrMk6txF1Bc+Dy3dxcUKLYyu9cXbkkrL3boMYs3+QQJWBSM9fU/SX
	Eitl11gvwKaHn3Qos/k7XZnnfgdnTIadLV1VtKJuZpckcCU9h+4jipGSKh82TeQl2BXkpbDoVUl
	FhtTkMZaSLdx9boISE68xzcOSz/qiZcqoR/978/4lwypjLto96lvtHezjjLmAf2q9bwphzFC3I0
	hnESq3aooS9ymlSkx64Ehu1QrDlBTH+xpJVZ1zdMYklDFD70B+TGeiapsVwqbrq96Efs00yx7Po
	3LSyRNP3zlnm5DrdoE5WY+FNc1+i4SxjvUkguxb0XwR0mKQ6pEXHrlfvFrfVnUE+xu4QoY27alv
	MptBwSvyxP9KDd2lEIMm1+37559hBL4NXJgYtRqNkoJjja94Ixz89VguVFlGBAibY3JUmU31CsJ
	P4PV4bBzQ99CS/dN7vtw8rfe7LlL+zXQkftPtJL5pPr92tkM3kw5R4ww63uQkwfzH5bmNGnNvmD
	0Yg8WVXvCQ=
X-Received: by 2002:a05:6a21:4d02:b0:3de:5897:ef9d with SMTP id adf61e73a8af0-3de7c889886mr2099166637.0.1790690828140;
        Tue, 29 Sep 2026 07:07:08 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b0f4ab05sm3526989a12.29.2026.09.29.07.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:07:07 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v3 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Tue, 29 Sep 2026 22:06:46 +0800
Message-ID: <20260929140649.55-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929140649.55-1-yaozhonguwl@gmail.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written,
otherwise the rails can drop and come back up instead of staying off.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time.

The array is bounded at two entries. Firefly's vendor kernel handles
exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
files use one or both of them.

The lines are released from the PMIC's power-off path, so they are only
meaningful when the PMIC is the system power controller. Require that,
accepting both the current and the deprecated spelling of the property.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk808.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..9120222 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,24 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +131,15 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3

