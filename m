Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659F3598C1F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889474; cv=none; b=rJBDt7yNb/X5dCzRRgEX5632OKw4lVWv8SMVqPATXFiPsnjLR8ETf+lKp4vYkHCEJLusWm3aS6m/i4MSSRm1LU+kLI5Dj701KevIxHJlTtJGMZyeAL+aeEBSJGXpjTFFj45mK4lXbSUwHSsuXtgJL80n9yQFl2nW6QP74BrRVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889474; c=relaxed/simple;
	bh=k1Xs/1I6NO6Bw5Ze9SDuCelPs0wH1AjSc4OBHMNhB/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjRVKFBzjtRYHwlDiS9R71mXO+ojQyytmf6ejXViau47XGoPWrxdXqOBvIKg/T/kiWoPOfD1uyZPfVndktrZ7ZzY3Fys/Hcy+DEdcqRkEuETukviczZxJUl+MLdYoVN24HH82Zl4X2oJtaBSqUxUgVv4orHvw+uHK9wO4URg6Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8CHm9BO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8CHm9BO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso3566053f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889469; x=1789494269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2jX2ONoLkNVc2M79f93XZHxnpRgsCM884OBC2dJvMs=;
        b=X8CHm9BONHGnGfSEWNTpenJJZrCVviOyjk8dZw8j884oRL6C4OnoPxAoyLHYQ3I2x0
         c4c0Xz47AnxJXJ1nzBAzOTBVvb1YYfYjhG9v4NiFENu28WKGx83oaO8vkNA/GxZuCxTm
         9FQcGSap3aQxKuAQrL8LG8hRNnn7xUHKkIlQq51GatmkjxMB20+Yp2IZf6c2FtjJDPyL
         WLa9vP7Hcm3u49FVtMdD0N51HS5Me/3sWHv+8gqFK50677IhtQYDrCpRILzmrRpboPks
         BwdSLAJ7APWCn+skTRZ+zGZE5S54nAfD+G5j8Q4L902MEwdcNXIQZphKMeXhlA0PJzOb
         e7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889469; x=1789494269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2jX2ONoLkNVc2M79f93XZHxnpRgsCM884OBC2dJvMs=;
        b=TwTkSKLEYiyfAujmVpOiqAkO6XBTKqAtO/JtUDaC19RChIPMmHdKVn8aUJ1WPhJZ80
         6jNYi7zcJMYDX/3mZoz6Gt3kgAe12zrRaoSBeE/hg65I9mw7mPFRZJs1tvGA24rW0xva
         XUT0ofvA5l+u0hT28Ggxq51zh/UeHHhaYJhFXgPLdy0juRcfSv60aKn/hQ6Fcum8a+As
         w0GnFrr8KykNZC7TTjDPwqQ2hoBi3xQvfnXxzCkg360k1p1yRzOQ4ciaNVM3YNXhCJ1w
         lSKjWQ0UCU8nUcVQ0xMMqaR7Kf2yp1iKgh62SuHahpX2OAvOfX8L3WYhuQSpK+Qk/TSf
         usUw==
X-Forwarded-Encrypted: i=1; AKwUvBw/yJCC8Fyj2QBhPkDFZdP2oNBnBpzNL17Xr0Eb1zO5Fd7PlfnIyL1fXer3lBZWAvZ3xxLcGJQ8Er9e9gw=@vger.kernel.org
X-Gm-Message-State: AFuF++nI4DR9KN06jKrHgTeQOTiyQedU9csdJUxA2Y69eoQatnFOmiju
	9ae3kFls6SlHpfgqbym5S6FXFJQZvD5gwhNxOcaqkEU1ZaH2eLO6YZl2
X-Gm-Gg: AYBFou2+cFAadVLIbY6d2hld9UBQm+J08q3WZx+s2aCMB1Be/4mPYhhYBfoywEG9BMP
	J9c/VDhxGpgygKf8uzA7+NUo+fQ1o3YLSO7IZbpU1deSSiG9/moWy6vAW5KRK60Itks8Hw0tXX+
	bTQNnBHMdhsMoz9P073qS69my4+zCbVEk1ciuMVysTT1hoR+NbEKDqMzEjars7GxmQiSy6yXFl3
	68dTt/BorNu3RONNqq7lssDvhUIYZ61TTrV66tg50hdlHmQfdYfeL7DYNL8Ru04dmqcO2Ke9o0h
	7s96ieFZal3hgyEkDlh5HBuG+RR+8jkacSN++BW3x0hpeIj+pLGfc1zAkkFVDEBVRQHlhjrmLw8
	JZpHSvmsXhncv8zTY1lAFWeUbjVznAAJIjCcPoX1QGcGUVbiKpvufTPUvBrMfcn62kGVbyM3g3u
	R1LORN5MjZFXaEW6cSuaqYpvB6n+xpK73dUZ0kezwqbpNp9IQ1gsTopcSndwe4E8/9Uyg=
X-Received: by 2002:a05:600d:640e:20b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49cfc6ea77dmr202027975e9.32.1788889469206;
        Tue, 08 Sep 2026 10:44:29 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/8] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Tue,  8 Sep 2026 19:38:30 +0200
Message-ID: <20260908174259.9009-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 toprgu is not actually compatible with mt6589 (it has 14 sw
resets instead of 12, and its reset bit map table is different from
mt6589).

Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
add the IDs that can be used in device trees to identify subsystem resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-wdt.h

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f514be8a5851 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8167-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
diff --git a/include/dt-bindings/reset/mediatek,mt8167-wdt.h b/include/dt-bindings/reset/mediatek,mt8167-wdt.h
new file mode 100644
index 000000000000..1a24bfe079ca
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-wdt.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_
+
+/* TOPRGU reset IDs */
+#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0
+#define MT8167_TOPRGU_AUD_PAD_RST		1
+#define MT8167_TOPRGU_MM_RST			2
+#define MT8167_TOPRGU_MFG_RST			3
+#define MT8167_TOPRGU_MDSYS_RST			4
+#define MT8167_TOPRGU_CONN_RST			5
+#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6
+#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7
+#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8
+#define MT8167_TOPRGU_APMIXED_RST		9
+#define MT8167_TOPRGU_VDEC_RST			10
+#define MT8167_TOPRGU_CONN_MCU_RST		11
+#define MT8167_TOPRGU_EFUSE_RST			12
+#define MT8167_TOPRGU_PWRAP_SPICTL_RST		13
+
+#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT8167_WDT_H_ */
-- 
2.43.0

