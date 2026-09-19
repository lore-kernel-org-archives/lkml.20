Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24D240EB8D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789820994; cv=none; b=UQS1qwR6SrmwYabpDdo1YKXFLqk6iCjgsBsT2+nwbHcK6hq61MAlD7Ndu8ET+homT25zfLj+mSIKJvnW3ThV5PaAWpifAJjmCWpNgr/3H77hwI/9qYhlxjf43/cFXQHt56fEWYR8oyyigj6ZBdim2xcHLR03TRBQxQzP98Vd5To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789820994; c=relaxed/simple;
	bh=7UirNnKptkM23XV21O98MU/F3kZMMKqkqZFRUqz79+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFkVZV7joEf1YUocl8rkMe0TUZrsbN9OZ1ak1opr5zlunbYQXImZn31PfC79V/FCTP/LAMvbSLYDLZ24DbBtKepV9+tEsOq4j3yfDAZW5MFiONJqgSGheyCWj8zNdS8luazipmsm1sDdSt0RseN0iKjAsDA7HSGS3iqx+Xp1xzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGb6m0WW; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGb6m0WW"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6188so10074195ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789820991; x=1790425791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MmcjKlyf4A3stJwDXl+4IDRDF8eUG006ktFMDeykK4=;
        b=rGb6m0WWKVDyVASC5NYehxAm+a1YUhkO73/Zs5I+epmPDbx/0geKI+9DF8BpyLZjuf
         JDD4lrKfJBtMnRMNxQfc2Ihx6tEwrqAt/fRl9hJtNPu1LVcNGuIz7CQF1U2DZAIsl+Kx
         ICORzgojn0lF2JoniV/0zzNnhPHR6y+Bsx0/eddy8ZTQ/lGN3DAtjhFrcEEPv/YJxwPJ
         4jkvICBYNZg0WOCy+3pGVYhZd1Kh+O0V8EfhWLI4IYzbW3C4sGydYbHLRWZF6DN/Uosl
         T6L33oZEvEwyXRWMWI3AzVxBgsUIc0tc+ZGgSPSJlkBtGl3ZyU6ORRUoeHWnKTZGA7NU
         wjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789820991; x=1790425791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MmcjKlyf4A3stJwDXl+4IDRDF8eUG006ktFMDeykK4=;
        b=NOhWksEx3b+7iS5Zm9Rx/LCiNHlSN+Xjf4DReffKxNqu11gVSYqw8WETbNdqqTdYFS
         vpCY6aYyoFmWJsjkmAoNjkhJ7vkSdJqQsXCvhHECCu0Q6WGjcSy3sOT4jYcZ4o1kqimj
         +h7Ixr0Qi+eyvWfmLqEWFjSN6/Jae71ye3TZfRNwHSsqZLg1FgQCemkIURdgVIRBbdAn
         SI+zCRB0hofMZAG5qW8d2peTnYM+dIobESDuXMEy1RctqzyYuscy5xU736aAJKyGxNKH
         eFcXlb2QLoedMEXrmSutldAaZZ4isLqWq3Oym38rCjou87GvZn8vfN/gYgMOulLGXthg
         6PWg==
X-Forwarded-Encrypted: i=1; AKwUvByoEci9DYCLdSiK+Ho/G/zKu5XSkPMEmlNTw+didNmbmrVdhoyNFBweFyC0391kvs0DOP3OQrvCGJswuVI=@vger.kernel.org
X-Gm-Message-State: AFuF++ndAeHWXXQMjHcSKE473A9OvAYpI4o18QyqLqCmGu5TXTtVMg3f
	JPIFBFTspfleX2pxzAfcKSZ+gCg5+zuch8FUZsjYNSD99PAx12umMb0O
X-Gm-Gg: AYBFou3v72tkFGdXjozXAeM7K9k24nG/jnDWSM9OtXJsxLSrnnzHNqOuidifcvpwP3P
	CEdq9EgRxt65hZsDfZFEimpCphL9EjVUPJ6ATGPMCJH0Jc1vvoRFwTsbJRG8/MKJBpXfu8Splzr
	nq0hBD/CFVRezuswmVBsk3YD+TntfAksx/byJU9D4Wv0qT3mU26TLjukE0/zo8hVjHe25WItV5U
	7U4uQSbxLbfsTO2LldZY53UyRwFC2qMFY1DorSnYtw/jYO89V3YcAA/RBbNkIXfln4g/T9QMwwA
	2w6sQWNd2CiG9ODGzeVEqEVpoIx7xEuuGY5Eqxbg8jjnChv3cGLt5k7pLjRTqe3CyfK947UcV57
	6cuyyIMI4ZscjbVqUsEDK8pNT0un+/MjdHiTKEWojxAhddbvzwk+Gy5jqWVasucbmmRWad9/m0m
	6b69KqnNUlMbYtFLxR1FM33fzzcxK1LIW8ZFkSRH5gAKGsimsvBo05GMNFrEng3lMVQVRQgUYcm
	gIndIswxKo=
X-Received: by 2002:a17:902:d48e:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ddb1b9a0edmr96579045ad.23.1789820990640;
        Sat, 19 Sep 2026 05:29:50 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm9552155ad.66.2026.09.19.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:29:49 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v2 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Sat, 19 Sep 2026 20:29:28 +0800
Message-ID: <20260919122930.1418-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written; with any
of them left asserted the rails drop and then come back up.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk808.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..d59f6ba 100644
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
+      shutdown request is written; with any of them left asserted the rails
+      drop and then come back up. A line left asserted by another consumer
+      therefore defeats the sequence, so every line involved must be listed
+      here. Only meaningful together with system-power-controller, as the
+      lines are released as part of the PMIC's power-off path.
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
@@ -113,6 +131,9 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3

