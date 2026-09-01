Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F021474274
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251439; cv=none; b=TBhYFyzOK5oOZ5VDrggTKiGcsEaInxWyxzqpJd6d/6X1XO4Vio2y5vFxj2GN9BPlmEzYxvqDoBaaD+8HOHLGDqkzaaRAATNH46THQvEf8hvZEA0rSZ/x8C4PH1WIcDCSSyl2J4eVOK4+X6LhScKkQWoJGlKP+kR4OHIl/WLBxN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251439; c=relaxed/simple;
	bh=DlPWvl7VPmpyoxjPLEXDDFgGlZBGBcqWJsRTiZvvGGY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hv4HchU8uxOYtQW1BtoMTT9H8UDDpvrS84et5LYVHwkr43tVLwT4eNFolovs2Y53eB0d8bnpzJHVI28fpfrAIBbSzBjkdHp11P+mAd5ujFibq1jGC2xJpRuVglq9gEZXxkajIoojCrImGBxZw/uaVvFrrFRkMShB33hjJBZnftc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNALetWt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNALetWt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso23056505e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251435; x=1788856235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=;
        b=jNALetWtYGBgk4UmMQ3NXZNE2x5Ewkx4DpUYN5vLTrdK8qmV7H7m2F5RKtdfbKX59T
         vbCu0l6wjvVTMjzlr7bW6W5iMnXX2POAcQZ3Hum4Hwr4FyqL0wlfmz+R7HL5h45xaVv2
         23LtcWRWR7FgGrFSwllD5QFlmwQTw6LBEe2zW6vfesk1KhI2vVdrCJalRIGZXEvtxtxA
         Rv/+/LrC7kKb2SX4bEZdjY+q+GdWaas0hOgwYBqAnHoIsX9EBrRt5Pi2hb1Yg5tNSZQ1
         v+AEnlhIfr4zCpVwx81TuDdiW11DZN0h4dAHPS19eKxVV8YyhlZgyyRbZSUfHbErU6Xd
         m88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251435; x=1788856235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=winUkNgWZKpQ2EAEJkwIhIBpCcK8DMcWRELm0nMiNB0=;
        b=lMLOWb85s+9QU0ZIY6mfFDiREi+ic/nEMdNfg0OXhM0ha4ch1IqSO3ltt9H06vyaDS
         yXHpQfpsFBD40XjmBtfJmjqY3fXZg+CzySG2mgLljUaGhlzxbnZ9lY6nH7Cox93uTGcV
         t8RAZ0PvLtgEG9ZVC1o8wHTVX1LdJM1f/wANi7NLt7AIdb5+pkWCrXEQnmg9UbjXprss
         dDof8+kV/7knk9PHAOG6qJksEzw2I7KAyNksG3uyYT8aJxhAxtaNbcJHCuT+TCiY6tUS
         3MVk1xhIz0L5Y7hYZNqS/zI0CyEF5Wk5/be3UAcsiQLAhrePvIXm5rP1g812lzDFrPNb
         jXFA==
X-Forwarded-Encrypted: i=1; AHgh+RqyxtFTh6QibLWoIG+daOVsDrLmoE7oujlktWPY1ZQo3cqZZn/ua7CVZZxlcj7/G32HWw4sBF8R4rUOBgI=@vger.kernel.org
X-Gm-Message-State: AFuF++kWfxZDuovbgljcHTID8dCJ/AxvS+qW/9YCp6AKKLm5pHlBz5aJ
	ovCjGAriWqE2ZSusf6PNMW0/EII5MuS2K1h3pkbT6G4yVTzI/JoEeBAh
X-Gm-Gg: AR+sD12k/mFYpJ2x76IrRrScWjq6GTxr20BX59D4AL6KVLpDR2bCdhQfSM1dUj5+q1v
	iqVIkTRWJpqcJ+bS6jsEjALsfyBcCKcWQcvuSeawplpCSiG5MPkwU72cVJc7fUADY6ER9h0VboP
	TmbCKMYFBrmypQLQjPWERNGJ+Yq0zr+ZzINuZ4gKrPkviHjgT8nUDHktj9dqWrVjenxl11SLG2Y
	gG3mOwGRfQ7N97I392bsB1Kdwgsbq8hr78HyjUU63S/IE+ObyEcgrgS9sB0WBH5NXn5XyIWlhDd
	MfJ/PpP/5+d9Q9kFcapRbttAecXET+zyDVL5xNvPCclD/IqVodrwZ0SAV8lQMRxRvW2R8LJDlqW
	GYQ5DGUBGGMOJRTCM+1EAiqhE6iR1pa0HdfLz84gOzTuckBBxI5QwPVqyyjHxonQiHafit7fX9X
	OdZZ+lxCYV6N9Xcm0IH7Jig/j43KUCcRj31K9K4SMJgRrpEuMpvE9gy8Ct+GA5xXT38fgJ9uCQU
	EvDcXhhQu0qFUubZeG5rOD9Z31PzQ/VVglt2rpbPclHIs1yjfvr
X-Received: by 2002:a05:600c:19c8:b0:49b:c8e:a211 with SMTP id 5b1f17b1804b1-49b91c20bfamr493430315e9.5.1788251434958;
        Tue, 01 Sep 2026 01:30:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v15 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue,  1 Sep 2026 10:29:23 +0200
Message-ID: <20260901083001.8044-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b42e898f4d8..1b4f79be5e54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9757,6 +9757,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.53.0

