Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BD44AE129
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290970; cv=none; b=i0wUBPt8FORZpfO8lVhnI4wKcJciZGhGtFkol+R6B5yPttO05QAyd5/XnKx+YM+Cn0JwwW1H3DjGgk49rNoQ1ynjDdWYOcNKRyTmGNIXBPQPNxeogbQffdAzdWtz+Fqw5rrzMRpcBb63QkuptRIGaEZnLKESyeQ3xSAe8VIKWhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290970; c=relaxed/simple;
	bh=EUXDAGX3bnyzYv6r3b1FRXNkC8ANmtHE534oi8SYwWQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NfafxCDN9JEdiL7Ag6vddJBV9GFVNUARVixTFkRTSxkgYcIYbWbFCPqBonuM0y30oh2hWNrIjdVupNyby1EYujmj1P/eFLl+Ucbr6LsGoH3EeaphQinSuHUQdNfdGXiGo9uye2O/U1/9wbvz0eRzHcWB5fcmWD0Fh1LvWoaTBOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q36n2vso; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q36n2vso"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so3277115e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290966; x=1790895766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=;
        b=q36n2vso7xVZTTXKCe2TFRFtCsASzx6B0cRhD9VjayT1RTplBD5ZuW4gOobYWLJ2s0
         vhnZaY9dH76ApPJLxpwXSGexmTqSPY274zrHi9Uks9ITTQuXfY2m+djBHhHjPTtpAmfw
         kkIShFwEbJ5e1F/FQexjcvpf9vQBm7k/g4jqdaDRfJ89Y/fYfLX98SazR6mTHNzuJdMN
         vQMt9PnkGG3g6pYFqc53JPPsP28KBx2l/Vxzu6QuL9W73ulm4p+CQokpmaG+2ooteWIu
         dD9RHaIJpx5/yK9EXQz2OfdKnojlnOgXHDbB776QqhckTXTqg7c8y4Lv+nljMioOLJm2
         iz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290966; x=1790895766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=;
        b=neSQqB87345MAMmTR1RkA3VycAMaUs6UWNfDm2h+jdKBV2AoAhLWbQSIorUlqt13tC
         6tGBE7LiZkT2ULVQG5yk/uawXqjijRzx986JX3BSd9CtUfm6KoSINZYW05ovXkgAGqFr
         qLh0vvbU9tOtWK0Ww9BCzHr8dR4NGV5/3nooSJITAtQy9xzJ5Fw/NMHR7Z50XqOG+NAG
         Kq/PbBW3MdwJUiuGH6vX6JM202xhpTt/O4Mz2BjsTDa6Zl/H0tDpovVf71rC4SifmHeW
         hlFTVeeNurilMVaGqJUPsWbCzLpJw9uYiR/IqkAZKmKQd1lB8zGVM2Jc4ksc6e+2bVtP
         dvJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd7dUYfWXTdsVkO9R8sHvhUg+5X2/KSYCwew/5JOzqglWWAfI7abrSUQmoLaT+o7wJm7marc3x9WZtHBc=@vger.kernel.org
X-Gm-Message-State: AFuF++m4vKNtvjxoK5d331H7JfhnCIl/l4cphtz3kHmmswf8yT9/9/W3
	VaPeHPdI/g2aSVwHINwUNpiVgJyAwUian/O6mZH/PkX00GT5KmwUuxZB
X-Gm-Gg: AYBFou3vI5FPPu5olixFct9a2OkYZjkIKkjZuURipDbZuD1BXKj4xgJpK9Z1fkj6feV
	0WQiYSgzKvSKqNhM97KPVi5i1qUWzHwrmRwoZdYy6kfKmMH5WnohP6wUJKMaMqRzJ8RDf2dX1pz
	hKE9mR/T9aYhW8x7M7nuxJfSeJYkD4si1UwLhO73cvoeLfj8X+sOZ8XTwUDeg3LFik8zYfM9H+d
	9ADs3TWiOO0HMz6r0Qnc+zg3AeP7ydYlWwlss+03Q7W+VjwFZIx93pNYAmu1galEDwMELh7MAqZ
	1gBDrZBBpCmOlq9V6MZuuxscw/HukhFwYdpI/jSx4l6VzfXPwY5X/ItiON9W5uKsgXIFCJ1djuK
	+pVPeGNlGfDN2TgFjD4mfUdQZ7xNdXDGg8Xiw9X9WqMctLY0+mgQn41NzPV9nrycPBN2joh49YI
	g7YRtmKTZZHyo6D0/fEQybhKLNkNoA95x0m+RiZCpXGlUiRMTMNGm8cpt4/UgWknDGsp4Eokoml
	8kHbFAlpGSPy8fX4Tbx4qKvyR1T+JrDS8b4J52G/3jUbtwJMUvuQvca0C/88wIh
X-Received: by 2002:a05:600c:37c6:b0:49e:81db:4926 with SMTP id 5b1f17b1804b1-49fe66ca0d1mr65872935e9.5.1790290966498;
        Thu, 24 Sep 2026 16:02:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:46 -0700 (PDT)
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
Subject: [PATCH net-next v17 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 25 Sep 2026 01:01:49 +0200
Message-ID: <20260924230211.11519-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
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
index 6de1ff058db6..a572e845b8a3 100644
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
2.55.0

