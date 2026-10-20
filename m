Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517809;
	b=J0Zm44nNnm4ANvlsNWq2QWLdFEyWloF3V6RTW8khids6v740UWEyR8IjgYTCkItvp5gf
	 oMG/im2kdvlg6VvpfU236eK6H6OaKPlUJtnfVh3xD772UUlrWxpBUIpL3epkFwiAiKc7s
	 8WUdb/SXCm3N1141pr5rQxRyPpCjPu0V8jUAo7+SyLwtICZJukMhVYlHVnh4pHC19tWXk
	 /Gv3fRnVQg9ZHl9GIzOUnCKMocpexJTs1LzbVB2WfKdBmbCJuSmXvbuzM+oSKHb9PRh0X
	 iTaDVwV2gnS7D/vHZCeKFbY+N15lCfCq8lqDoCV6lO/gLgChKXdRpT5tmUTpa3HRC8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
	b=nn+eR8LwsOvkRvLRNQwV5znu6xD61Z1r+Q9nbpbxUea0UkPFwAtNiuw9U4n43b25DhGK
	 aO7Q4bTP4tton3xUDKgROETnrVsUuDYS4kv1+K5BAJoHys8faVmiwMp9IBHYks+ngsCn8
	 YpurBXb2Ys/Gn/UZFY8lPsfFf6iGoBumT86QXzcA0yqpGz89fLeWYy1azBnyaarBsZjDE
	 yTsssONNWE0/7BcxW3TCaT4HW7V8aW8t1jiYjz8JlCLLv8DAmR1J/8EPteIwcxmFAJcAa
	 Bfzjt5p35Et2X3xTSfa5wl4OpyWJTXyqeJ6r5O9PgBmX3dQnGaCfdauFunhU4uYgISw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=shFLywWF;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681DF606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 681DF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=shFLywWF
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso29865095e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517808; x=1793122608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=shFLywWFYmCew9DhtJQzFsoE4pnvQm941YaCMTCeX3aU+gUEWiZy2vl3SuibviZVx0
         7AwcQcpjnJNuIdq0r5R06ZdCPvZdj52wfgcIrmHlyRSz5i5DTtvChBUjKjsO+aO6+L9a
         RXveUrqr4Q3r+YWUMGdOlUrBooxK8/sxOoDf/TECDDvzR6JsnQZXtS3uymp5F4dRYYl1
         Pm3r2zZQp/uT+9GAJYSQIsZbTgGP/RC9sUTrgDaViWSyjoHaz3nuFMFwpJp+X/MzP+Nk
         A+tf7Qf+RofvAmYXuTpbz31GK489KFlObY6dm/lY4eibdeYp7Q7Dk2O2sbnJ5MjxVWSa
         Zr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517808; x=1793122608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=RDvPdWEtNhHLL+BOFWZq2P9RCF6xfPUJhc9rFCJqEqHAmZGDWEqBtuH8VbFeoc+kH0
         WbNNe6cHf/PVE9i1wiT/JJDJDrUfSZPkxciZTB2OUPkwWhJNGBYzksg5tO8oj/11hfTv
         Jyd+7HNBZhYPt3pp7nbDf7MjgXDbIWRhqO2cNkTJahPdvD7tsLWx432yeNsPDepkr5Yh
         i7jZIPZ2Z5aKn/WDFVbsJNWjaCf7MQFVdqY11mfBdP0bHx5yN33DWymJqnzSbughThZE
         1W4i3w3iS2zpB3LJfVlKw/+29FuV5E95Ei43W4YEjYZxGHPcdxAW6B2zbiSiNa9Etiy9
         HXjA==
X-Forwarded-Encrypted: i=1; AKwUvBwEwh077kEjyOYe9naO/zcmuG/1Ka947igOagvxA9DdBPTMDKUfqvxHqqlveFVXi05CkMokVszcDa028xU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4NQAGdnlwUtQW+rt+t1Jma3cFSPxOO59e3YYC7VxRoPxj791A
	HD+YC8/xYcUL8i6gMPYBklrKPQqbGREC+/WEdY2shl4tGfGEXK0A0gk1
X-Gm-Gg: AYBFou0KA7AwkbVgcrdyV3xknbvJNtQXf+AyKOQWxGTVufOeqxbx8zPkLgHQkbvAgOZ
	7wnpQF+cIGuSu4ECkt0kGsL+er6yzmAm6c7/DiyGNDQ0VlbuXtXwLcWdEMkyueHRjt68jU6+rdJ
	PAkKTvDVU8eYeM37s1rG7pafniccpDiyYbgV0diJbx60Lyr6HVcbDmM/IPIjPgBsj7k8weGfMlJ
	XFzcpKHs670aCxd9TipaRmCTPUst9Vmp1CJARCXVzlt4tO9fDSONdVCsHiR+midyBMALW1jgrcx
	ZQGTtA6G/emkGT/AFyWkWBpMYJYWxu5WLMY3fIt4SHZSqKtCUnc6cyXFnQv66PDsaeOYHq1K5BY
	T1R64zK6tyLdP/g+djmB8fkBIIS7jiLWJ54MKUCvkCJPhx65G2Ex6OOFvyvgxYbbOFJih/sa87o
	Npu9XnvvauZD5WIL7bBKqJfMMcopN2CLUxGbTUS0o22GHTbsu/LesnxKBYl16n01J0AA==
X-Received: by 2002:a05:600c:19c7:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1d761b90dmr248715685e9.30.1792517807739;
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Tue, 20 Oct 2026 19:33:22 +0200
Message-ID: <20261020173556.632798-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..06e93c545e3b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
@@ -663,3 +669,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392";
+
+        interrupts-extended = <&pio 28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        keys {
+          compatible = "mediatek,mt6392-keys";
+
+          key-power {
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            linux,keycodes = <KEY_HOME>;
+            wakeup-source;
+          };
+        };
+
+        pinctrl {
+          compatible = "mediatek,mt6392-pinctrl";
+
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        regulators {
+          compatible = "mediatek,mt6392-regulator";
+
+          vproc {
+            regulator-allowed-modes = <0 1>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-always-on;
+            regulator-boot-on;
+          };
+
+          // ...
+
+          vadc18 {
+            regulator-allowed-modes = <0 2>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-boot-on;
+            regulator-always-on;
+          };
+
+          vefuse {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+          };
+        };
+
+        rtc {
+          compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+        };
+    };
-- 
2.43.0

