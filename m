Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240E740BCD8
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339077; cv=none; b=pFAF1kgECA6KZ8oE88zZ7DrhD4MgneXArxSgSJcQd8Dcpp48ggVjqKak5B9c50QNnWryJfC5QzHAmYpxCiw83PE1+T+g84aDopt2y3iufoHwtA1WRnYYidp85VMAYAuhldTP4NE4Xx5sVyLDktEUtG4gZYwvy+QqlPmeIY94Yes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339077; c=relaxed/simple;
	bh=3yFoHeW1ePG+i4RCbEU2JofKauVW53+A/Z/TXfsz8qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRFR69FUsAW9yBm8l46IrhjQ/3Jzx0Mn3xr4gTgLQXXB0MCfjlt9ddyMMpJnrDGgWw64WYlUnI+GUuRJnoTa/vLblwVHQwBw1H/7IOvRSTblxsqSAhTNJGhwcjoHQeWH22HKZA6xPRl9RGdrz8sO11gcTf9memsXBntJFJoTrvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNghW4Jq; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNghW4Jq"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93a0fb2f9efso61085185a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339075; x=1789943875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHFmaO+kDb8wMPnqE7UfVX7wmIXcuui9FuHVD6Z8w4w=;
        b=bNghW4JqbzV+nmJqMj0JcEhLWNJC6XhUTI4gO2ieCIw45NBc6ZiL4eWtWx+298tzcs
         QMUl68yjAlapHf837bttbmeW4kCC8iwM5Zc2jLotnIK0GUAZV0jqIcx6bZq6INP3yTd4
         LjoloRiXm8vQw63jLtnyTxNZv8dKj0NO4nGlZGe8AYpJkB8wf4WTsfbEcPDizLzodVzC
         TO2r0RbpIY7hSXvBXCFSYXJSXc7DWpHeKxHMo33jNUN/WqbBmRcKWDiG33OCkhsm/KRA
         d3wAcpFTU/JwdtEtoSB6Jp62CMz1KpZEMLkQvx+2ga2wjmuuB89j2JY5izfLqfTEQi+n
         RgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339075; x=1789943875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DHFmaO+kDb8wMPnqE7UfVX7wmIXcuui9FuHVD6Z8w4w=;
        b=FhhSlue96sK+ZUmpiEhPAycPveHtYMw75SI6e66qVTzg43L/aDDQYH+402wi1uuTre
         CYD4DS+sT3p7/1Mtd/Qho5SG1h0kXxP/suzouvFw4bLg6YtAZZMObIc7kph0qABvBDtQ
         SLiERZVP0WS3Cfxi7uc6LwShwyHNf5BhJd86qHiKd2bOGTY8zPl90hs4es+xfeCPRhP2
         ts2yNZza5RIm0vzcVAGbHG6JiQNWWWo9QLawF5NjBeIeORwdGSzndSWz8fZCir5Kh2vO
         iQqKRRyaq5CzDKuYhXCNyNugAm8TEZFiVuaOZXA0CRI/niZItAk2Zv5abai1wdLjfHsW
         YuUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv4iT41mBIjrI22NAK4q+QH3smkV/1eF3nFuDASKCVI4hCL5Gg/6AEG8x9gWGvCv+pr1oRMA6t2jw+/3E=@vger.kernel.org
X-Gm-Message-State: AFuF++mAES9Y+3z0TSe0PXdvJzbDB/pVkKzWykSOot01D7XsjDyamf01
	2/f1ezV9ZblkbBBgxhBRgivgVdEpVPzOpzSA+HdSnw5nQSRlsjzIjmY=
X-Gm-Gg: AYBFou0OfPsD5+jj6zU+J6Ne26Ut/BvmpFG66VSXJugB/K9jvyNLeb1TIc7ptUGh52Y
	VkSTjOCPboRvH/GNMY7ytjsrhSOKXiFPOW6ZijwlL/LUBbneVsm7T+tW56YvWB9XVOb9Wq2uIX/
	0iGvfGLMkOy8PCzdgg4S/PB2GjevY7Nvzcvo08Ct5dtmoSlGzoB3lh9xcpkvNhfxqWk4aPYhw4f
	mZouH/wWVhNfTzeTDgO8xRTKtZza7l6VGvk+K4/1WGGk7Yz0T1NUo5XOCzCzpxyPAjCZABVXrPL
	Scqrutl/8+JyPA3bVtiJt7vyTlG8IRs8tEU89LjaPDguMggpWVBewoGaFQOVo0Ntrs4j2OBdSmJ
	pftQ3cxXM/sMSj3lBINXpBFHiI9d7f8CLoPocxP6lcB4AHrOnugOHQhYuQqWugHSo0OxRj34me/
	zFu2E58rx1vtPgGNJLdhBaW16l1sho1hb55591j0b2ON3jpQpCmoAkWW+8gIsF22AOhTeIrmbk+
	r7Hgo2MleRSMv8Tf5G2sErF5NPwO+/rKZ7aDna9wnC50YTYfNCxD/0Yaee/Itnm4PtfpupvDZJ7
	iWBF/tcx0/Xg2wOzW57eJM+k/fl+x9ywqg==
X-Received: by 2002:a05:620a:2708:b0:93a:133a:310b with SMTP id af79cd13be357-93a1870eb4amr396136385a.26.1789339075060;
        Sun, 13 Sep 2026 15:37:55 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cbf2sm79361056d6.17.2026.09.13.15.37.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:37:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/3] usb: ohci-exynos: Disable controller wakeup on removal
Date: Sun, 13 Sep 2026 18:37:32 -0400
Message-ID: <20260913223732.92882-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913223732.92882-1-mhun512@gmail.com>
References: <20260913223732.92882-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When OHCI reports remote-wakeup capability, a successful wakeup enable
leaves a source attached after driver unbind: usb_remove_hcd() does not
disable controller wakeup.

Disable it after usb_remove_hcd() to balance the enable.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 62194244cf87 ("USB: Add Samsung Exynos OHCI diver")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-exynos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index cc5cb09..86ff7a0 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -194,6 +194,7 @@ static void exynos_ohci_remove(struct platform_device *pdev)
 	pdev->dev.of_node = exynos_ohci->of_node;
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 
 	exynos_ohci_phy_disable(&pdev->dev);
 
