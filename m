Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564C83E5EE7
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342817; cv=none; b=RRKM3DZi0jMIWn2ryr3e2ovWXOGTcvpFH+x+6lhMQwGRGz3GZH5GK+38fYQkRey2vya3ivRaXbZbfg+5X9K3uyu4BiEezMiQaGU3nRH369eLDjrNw3yk8GQGqokATXJnUdQ/h2qjnPCrljaEl1o7E8ugLHeZoK5HCKOINM6veGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342817; c=relaxed/simple;
	bh=j6QwPSkInJeEhrzmgYZqfRvcEPRt7b6y26e5smlmvys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbfU0pKIl9H1BA4FvxPXuiuzvQ7AzylcMpIMbExLdqC6qod8owDjKH4zLrdh5Q5HChSjW1H+CJHdNBUaZdiTQedmEAibYOLTJbEc+QS5tdLcLiQwOxGCqjanWdJiU7H4rhBonBAETEcqnSUQHjUwPn+QSUCroueBRV+K2cA1oWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXrVonlm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXrVonlm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1126754f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792342814; x=1792947614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UqQp0/X3a9cfP9CawrgORU5i80U6c5G1RMObrYCGUFU=;
        b=CXrVonlmDqUhebkpmralhJWlPrtut9hsjF+Tw9UDzJU24bJ4YTwBGJAvKxWkW075Re
         4TLxIyhPLQGMS+H4ZtwF40pKK6ZmTaQbe6X++b2GZ2XFHPf7NSBSnOTRJ9NY4DeNU+y9
         abVWKfk4YDtjP67ZxONfFfP7+gjxApnS0A7AcfmKFgdfrDlfAgbQA/E3AufbX5gA2sXP
         w3sl/zQmcQa2ik2DRwB6r8mXN9JfZdSj5QQ44IITfvNLJ1M4MVqk07i3uWvCTov1dp1D
         AzdyaPBpOiiPKnRZHK8CxMVtG7CKZ0jI7q8OSF7QhZRYP5bPmueUj5CkngbZBNaMpN6C
         ayaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792342814; x=1792947614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqQp0/X3a9cfP9CawrgORU5i80U6c5G1RMObrYCGUFU=;
        b=NdDDGqmTeoOE5CUBBXeXAr2zAwenIl4z26Q7JX85ZyszSLfVngXrcx/IWO3JVqs9en
         kXHyQsYhgSna8D5W6lsV/64pktIp9Vyn5GlV79yL/C+iHewtrYmpC03o5U3XwgimlU/S
         du0ee7uOzImseGhobFnBD7i9UiLI7OfnU4eNCaj1J6uACxxDCsI6Mvc6rJbizZvPG81T
         kFocxVhyEwfAm6Sd9GqWan5OPy2GxGn37nObm1Uh7PXG1Z9BuuIsX3DUKNS3aOJf+EL4
         KPEIQI70tRC1zOOuJ80tfRk2JFZ9oTL9DxOgbv405ArLx1uvVWMa6TCp4Oru2h3dFPl/
         WP+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCS4IKA2dZHhhr1SFq9fTJP/XU1js0vC7Mcc8TqRtEFFmydqQkpEELp4jeDf/u0zcR4aM6MsywZe6Y018=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+6zVbRjq62x4VzBOozMa4U7QGndbWuFM5hqH7QMT5ViQFdGLy
	cuBe7eSxlppCkUqHnrZUr4YRZgGxnnDk2Q1TM8bDFsBLLWQFH2jkWVGl
X-Gm-Gg: AYBFou2mFLZ81bYWAqGxAl8nZ/JQnVkmqHofcJf5WL70oa5i+fGi2bz4ahS3AgLnv/J
	K2Xozs8M0ygGdBV8ycXlEK0BeaBcxm/46WcrPTeBGjp+Jc9jwh1FOfyqITf8h74YI/RToR7o6JB
	hvG4EEHjwxuQljnt8Ii7hYb6xkldW1sE9YiAuCSa+P5t0syJW7TLKCARDzZBYYgWiFOdepuIsoW
	u+x5SF9sYJeaoxEo5aVoSzEIHk7blkemlrIrOu2EZZsVtYRyfe9OEVPkD0yYZ9nreC/0Tz2loHC
	bEn0c+p9jtuz9pPoTy1WhL6htB86SqVwOS03Qo9jVBko2kzuoQWoHXwnhBjkyIOLY0bug4PLfau
	Zvvyp0BdxcoP1g0W2Z1Du9NG4y3o3kk57OflxuY1/t/jw3nzE18vF5COy1UHEYAsni7OnrZQAvs
	fqyRjkmtxtoyGRf36dQkpvWZizGLQu5ZR3jgB8qYL9H8fqXMJU/0jXzScv/I+KHIvMmoxxLNoYu
	2kAm+OWtUDoIgEtcA0HqgK/3oSr1wWoR2yr2Yah3JDrmpJce58XRSxtJ3icASWUmFnbKpmAYnuf
	jN2eWkgBkT9yDKA6Xvzcd1s=
X-Received: by 2002:a5d:4390:0:b0:48d:f025:110d with SMTP id ffacd0b85a97d-48e07fa9d49mr7744225f8f.43.1792342813663;
        Sun, 18 Oct 2026 10:00:13 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm19744454f8f.27.2026.10.18.10.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:00:12 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var-som: fix touchscreen IRQ trigger
Date: Sun, 18 Oct 2026 19:00:07 +0200
Message-ID: <20261018170007.38381-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The touchscreen interrupt is configured as level-high, causing a
pending wakeup that prevents Symphony from entering suspend.

Change the interrupt to falling-edge so the board can suspend
with touchscreen wakeup enabled.

Fixes: 5f67317bd967 ("arm64: dts: imx8mm: correct interrupt flags")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index fd0a1862ce90..5a60430eb96a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -192,7 +192,7 @@ ft5x06_ts: touchscreen@38 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_captouch>;
 		interrupt-parent = <&gpio5>;
-		interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
 
 		touchscreen-size-x = <800>;
 		touchscreen-size-y = <480>;
-- 
2.47.3

