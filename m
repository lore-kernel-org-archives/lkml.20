Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9890E4AB1D1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051924; cv=none; b=Bed/LyON72AVmYM8cqDP/RMmCEQ0SnWc7uV5KM+rUcMTyFfkhy1ToWEeN0MSuWoJnR5DbKLjzrxWQ7PQuKd9zWeFto39ZgdP1+0NgjlWw5VeXa8QKbm211NuI7yQGeLipaTQK/ww7a4u9YPijNbEdkaE6FOSnprLE+1D/gyWIFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051924; c=relaxed/simple;
	bh=HUysfWcwgaCnsXaXq97C5D3DJcHzVD/nOuWhNnFXHNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=myEwCczaKHkOp3Rl0y+z46QQB+mivdg56hQtkBzRpIy8e0hULDqXONdY7aze/XRi24uNYEo7OIW+ic/v62NCnYKVacUuIbrwYMT+J7hF2siZAcifn9UfXVUidHUjMtLYxhAaC/PkPNIhHut+LXlOoMzfmvhHzGF4qo3QnR1ct2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIi3eAIQ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIi3eAIQ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afe75f055so148950f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051921; x=1792656721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GHuAmdmkXZvDWTufmXOc4smtM5tKnn8omClhm1kd2uo=;
        b=QIi3eAIQsTmJiUBBDp7ZKpRl3L/y98j6LExy24z7934D9LKdXUM1B2VRI9PqDrt88w
         tlPTg5lOVLsxnjvBLAu5a+iIXft7UaI72LELliTmfJjpoOfZ3ICi8M2OzrcdcSjiix0i
         7lZs6Qy8qx6g0jTIWHV66aXWFQspl4WfXfsrVU6OutWg/gXo55CTWwt2ADGox80qIMy3
         HKNl4+k8LKt2ATBjW3KHSQdlxB4ggG3fQKf2AxlAWzx+ip4HKgEZqTaR5Urr1TckuDe3
         ky/NUrBUOI5uuLt1hSJL9cjhSbj1GtgWu8AtrBl+Wm3yCweR2ABMX4/E2LTML9xV+YrT
         u6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051921; x=1792656721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHuAmdmkXZvDWTufmXOc4smtM5tKnn8omClhm1kd2uo=;
        b=0KJS7ycWUy4g7N7b5a41TYLQ9Q8dEw8MrW8jxZNRWx/Lb31dLUQvFunUwwA1i8qijS
         LX9x7Sh6CaTGlYRwW0Ap5FxEqmX9u1dQCHjdhqoIBZAwUUe47GHhc2XCA8J4vxSPoeLL
         64s/d4larH7V0/BYY/XI+xzCu3EvC/TYQtXBeqemuZQlmeYxYhfW4vhelHEdWl05CxaL
         TbszneUssteiMUhf7XpMB1ewoNWddYgQRrCaQ6INVSEKSPyKvd0iZJp3xneO5hSfCP8e
         K2NUjdRs51OQ3PB2CzrOxRFePOQPKo6y/OAW6N5GNDSwFyJ2YTBbVCV2gCEPiPFPXflF
         G+Nw==
X-Forwarded-Encrypted: i=1; AKwUvBy1LQGPHzAZuHsSMQNVHpMxSu+MJRLPxhX2LEgneBzahwOYNt6t/cybRvTy96sDPjM1MEUh2vsmy99iqq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0W0FpKXKpYcIChiYjJD2KIyz4Lt/9t+nclSXHQx/gdkYSMIiL
	+tFUm1Re7hkv/9eOmwTzxi52qYeWHCAwzFIj3MHkCYsFT4OWbueh4mRU
X-Gm-Gg: AYBFou3L+07bIOIUna/z8M668NjofJoIEbdXulYXhiBhtXhDxCHEUQkylIe+cMn5AiD
	UNkZ3FxHzXJ9FMq0TmmIcShlJs6E5LeWaOBorQjKNfHmOYPdKjUXFQ/d8WEo4bGxK+WvLkphZRq
	ZxueDT1luHWrcT0pve9/Jy0l7tt6iTrdrilYddghkLtYwo+QGNb0PisNsEIIUj3UvlN62Cyht+k
	ZdJiqdyyhZhYzy8+2R/sdSuix2vFjNYrtqxVCUpE2qhditBv3KDn84ye/Gau6yqYLsDV9D5uPsH
	ZuXMfc1FKG34EM2Cs4c+sMvJIU+7wuhDVyRo49YMzCk0K3Y9b9rLEQ7+M/BpatFebM8aJl3RalA
	wTKsobxGhJJkEdkuR5tDKMoj9NLt2B0IlJc7wbr+T+CrKUXVDDzQfxYt/NHZOjoyS+/qXUUGLfS
	d5bQPOaBw9uUrdTbNyUj3H4NudUSfsz3bfEKBmeQ6fDCzkSQuJvOueSIsethZxsBZZ9wyAD3tfk
	JW5myXxxU2oRTgbEQTGI182mLZ4jzalyikUWWBGpeaqLrlVWZGq+lX4SHgz+M4OdyY1Ak0sgx3b
	kTQlAnF078j+6hbg2cezQVHG1oXSmgDP
X-Received: by 2002:a05:6000:2993:20b0:48c:4442:54e with SMTP id ffacd0b85a97d-48dbaae710dmr26750262f8f.30.1792051920518;
        Thu, 15 Oct 2026 01:12:00 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm16237534f8f.35.2026.10.15.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:11:59 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag on i2c3 GPIOs
Date: Thu, 15 Oct 2026 10:11:49 +0200
Message-ID: <20261015081149.5919-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
following run-time warning is seen:

gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 3e590afa4fab..036afa0f6990 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -287,8 +287,8 @@ &i2c3 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
-	scl-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca6416: gpio@20 {
-- 
2.47.3

