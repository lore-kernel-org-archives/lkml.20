Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE8825DB12
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788999184; cv=none; b=bqXCXWC3TnSn+ghZrsMtHHRBtwMxDmoY2fUnoMFFRpch0kadud9LR9AD7LmOLYybG6pIiE6ZZRLbVTeQgemlTeFSIS38g9jNqP8BfxD2UIBOjoyepupV9WpvsfNMcSX3SrUzwjuThAxAXaaGIisAQRdDRm8DSUaw7apO18ocNeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788999184; c=relaxed/simple;
	bh=LGNt9FYOmnRds4ayR8kJwoPBTvhH3y3aHulU09sTOFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DvMgXBreEwnJNV8kDhrvDOnvTe81Q5g3zRo3UvF92LjtAnpkn9PHBQ0DFBzD7ckmqr0zT1QI3WGVKMbQuQa99xjfT2qUZ+HQaJExCKANHJdIwTh2YVz6Tabwo2twPm4AWy1rROj1nMHhbJVVi3cXWqb08dQbqleCzAFSdngVGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYHPTvHp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYHPTvHp"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so8335365ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788999182; x=1789603982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbRjo5acd8UMrmfUyBjMrQSG2cF8chnXYW5XdzKdjdE=;
        b=cYHPTvHpZtGMimRk/7aWaxmkJ/0P711RZV3p1XZsMCXPwY8eDQqVkJ8vrRA6PUhxcL
         R80beW24MKdmdpcLgiQQjEfI6IjTZvHQK8qtsW1gr4VrCiWpeWcSpV6h2YoltzaZQVIj
         +4NiU7qzfmKHpgos+oJX9LlvVAK5PpUEn9ywf1IweYAO99KuiUe5STFrH12bs7zQBJD9
         voSxjMPVSBNWtpyqDaxQDk4QQBr/DRPELCw814VPRjvIV5HRAZZjti4tvfiE5EQnneiU
         anrJQEHCO04sbTYn8yTFAQpM1pPTHImIZyl9dZlu9Q8hirfD2MylYl4vqwGGM0c7X4PM
         zZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788999182; x=1789603982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbRjo5acd8UMrmfUyBjMrQSG2cF8chnXYW5XdzKdjdE=;
        b=ZxXj3cODx6ItTlgNGE+UexaD9YrRu2cY5gSFCotaCAa79SSbbJy9KOfCXXt5+Z/VQW
         6R+S0BaG/W8hm8EKukR2aTvotWk0S4Cj1NZuD+gHzcpqJCcvbtdzxS4W/C4T7mgIfKsl
         s7I1XTe6ZE/Ot8fumzOudgG+CRjov/daJmebChcjWmGQE6eJam2jaUnCTqfMst/bD8Xv
         Au94uaDzNj6XXzvzkvwW7gpVC1zFEVhetce8b/qujZPGi5pOAATWptBXomkb5F+gthj4
         RGRp0I4N1Q+yNgtug/MBBeIik+JG/U44JkcSAYKPJ7JrLg3yhCgGZfFXGG+Vschjk6Km
         3DaA==
X-Forwarded-Encrypted: i=1; AKwUvBxIpP8BS9GQdowz/Y04p/Q5hFu9s4AE3VXUuaGqoe7bOZZxaQz0YB75FXdGT1LVnAugtSFfBo+YcCcppuI=@vger.kernel.org
X-Gm-Message-State: AFuF++n29b2vt+ax+UqKvuqSdmvHNvNeMPO4j0VWmtzXuJ4KS11Y+fC0
	ftjEEGZ0QwWy9JX5JI6gQ+6PLqjelG/dICl5L/Gn5mqIJiZTi1wwYjEo
X-Gm-Gg: AYBFou3f0dN7F9wq+YFwW5vl7rqUjK4HJ8/UG903ZNyO1weAv4NKJdhYY2YllTGNbJB
	DJ+BjdiVDGDC3qY3OnmzYijg48E3KNZLA7sK4NXT9oaiZZeR2w+IWB+2cqrRm1w5wJUCc4vy4ef
	/bCrOT7xa97jGLnhsG5WIBZRYFD7nwboMOIxq3FgC1zoumDrHyeBkmmNwNSM4bswAPTa7oVMNKD
	2rWUJ9v6/XS5jTB2Y7GqaGHguXoZe9BnDcF/NcV/eUl8z8gxj6n0pZWXbpNX42AhDTr8TxDfJeR
	+DfQ0LQWejop+uiqoCiFGMylD7ha95pv6Wy+qvxUeDkozYLaCz43UVc5K/N311nYlRuxzGGCG+8
	QsMX1OUDVnOkFwdrCuQPHArYx/GKtmR+bmpn+xWTmkK4IFbd9Aouqo6W5K+b5XiYmAlpJwss9Is
	n69/fZ38rOTg75ZakxQFChiNpgZMPoxOBu8gZisJE/y8g8adPRXFEqEnk/qqN8DD16MxloJHkdB
	u+Z1DmgH8GFXrGLyNJPaYSCe0K7PWAT3Tww8BKwXhhXSltv1NFjG9cO7Wtuf4Qje+F6u+xTO/vK
	XPP3cwfbsNioqTDHg85a48IicbQO7M+RzigQCYhvzMqmUxAeGMvSqTlumAI=
X-Received: by 2002:a17:902:d58a:b0:2d9:4358:73ab with SMTP id d9443c01a7336-2dd07b9c78cmr58953035ad.19.1788999182341;
        Wed, 09 Sep 2026 17:13:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499dad4sm80556405ad.55.2026.09.09.17.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:13:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: R7000: add nvram node
Date: Wed,  9 Sep 2026 17:13:00 -0700
Message-ID: <20260910001300.117062-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4709-netgear-r7000.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 24ba8f8f9bf3..0f3a00bc38c1 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -104,3 +113,8 @@ &usb3 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0

