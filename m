Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A85483BDE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818093; cv=none; b=UKS/K43uVggNUax56b8EgWE8cTXD/BDSxO0N8VHOo+b9A9E+KApVXOz3F8SaYmbMhzR0omPDeYVheHDbF2wv2ejU56QQdXKRHoGzhKt+evrh0IqSt1RwDVM1nGsNn+MkwlXeY/Zv3qrxy7t5zO0A5+c61xcu4ZoGjjQNlaMRDEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818093; c=relaxed/simple;
	bh=DU6aX0Z0p+fdTWqaCesdEJ1etwt1QeLalmsiq/Dz8xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTzYi7g3TdqtqcuZ4X5AZn/bWaazw7Xn8hvWPmVi/YsMcCfJipHLL/fijsEuHk6PdKeSsqihRCjfmRwKfOJg5IOYOv3r5DGyjSOkU+b13pY65nKe930qAaQ80dQO9Lyxtx23M9ql6GFhobrVPkP+N88cD084ehIu1Mk3lXWPJss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbzJCkHV; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbzJCkHV"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8200b55dc47so44010187b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818086; x=1789422886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMBKloH328hYHvt9A91TOoJByZqoZnKZvzZqMuRPjLA=;
        b=fbzJCkHVmw+kYHLOmVkyZ0CBUGz5bRWVGiqy+nOetZyljJTzHh6G5jgDBdwrkpHebX
         cWWT8Fi5RXOqj5jNhumOQOxYLsV4d1MSesKt/jwJ/kT1CYQMjQzT5uVG32yOxfcpqVXx
         B1p38RjyQHSpMIismV6VD5gG7HnSjbzqRXXVb9QxTpQO3NRw9Af//ICUsCZAkXzssjdR
         0PYHNFi/hPN+lRP4E0SVZIAlSTBY9g3e1IRxwNOcD+qyDFbktUXW2rj5Q80QhcPUFjzG
         V1CFKNnfxl/VcPPhAxr8g8RFixQeAam9GP6z4AKivMfS97XmCtQybQi8EWaQ2+X4J3Gm
         oNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818086; x=1789422886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FMBKloH328hYHvt9A91TOoJByZqoZnKZvzZqMuRPjLA=;
        b=OtfPGUiu5YAspaHVEzMmYuwzx9lX4sPd0luwhIm6VR0vArp9Or1HsNX9R/5qARZo1v
         CTOEN+7w4BmmVuZ09ILOmNB3eJ8Sga1yM7jQm7rLwv9QQxaD5sInkXPs9qmXzf7uf7Ru
         XdUljpj6CefhDWkI53GeF0vzAK49sKy9sdPuzKijtroPTlSrEWok50W9kQKkL+iy43om
         LdufaRe0zdYA/2Zs9mGSiE3QOz77vm0cX/GL+1vQrpdcJm/pID5THoTptHXk0gzbVa1s
         Btye6XpW4SJd7s0BPI3ZVGo/b8y4Fu1j7TvahD6hUm+xVRhTX18nhleoGRujw6lyEu7S
         Grgg==
X-Forwarded-Encrypted: i=1; AKwUvBxUcToSDY54kmbWwOYKqfw2TZLQwabaJzPU/eft7SyF8WGDiFav+EYT7IOWWmYax2B4P8K0UVB3YgwY/w0=@vger.kernel.org
X-Gm-Message-State: AFuF++mg236ALOu5JsexI8c6GPeb+O85KnRLvxfNzEwn+tZNj4ys0R3L
	THB+C3fcIv2avjTJMr1iOJbjpAXw+Yv+gVr63OCKWZeZvSXThVm4loD0
X-Gm-Gg: AYBFou1mlyA2GyTIoucLVOSpCDuwFNkOuQhIWjAeMu8RtpinouNM30Xv55Z0C1Hw9w0
	ZJH8AhYHDE30ZoPpUZI6OoimHz5kgSK9OdOTxBhzZt+/R8w+LylOtBHWv7wMm5vUe76ZMTGUu7C
	OYGbJdnmbyE+UdXlO0XxBMp+uJAhl6G/8f5x5AD3mqpVbIo1uwax7Cq7FJGiHH9iixW8ZJWD7Jf
	k1SFf+01B188vUTKR21C6j1dyMTjuMv/laYrAlzPY/cJ1bNvq0IsBgdEFD7iQFPf9H6u+YF9AOg
	sv/t/KYSXxGXwrAViwkGYH083iWVQDEaVBE3o1D1MaPqdUG4oGtkGwNcyzK8PmYCYC82Bbgj1Vv
	6GuuzKLjcwVW07Z1bew38H2qe9/x3usnY/+NXGf0yNsxNlEv863Qk1T4KLreItZN35n7XQQKEDF
	RpMPaGalIOCxs7DSEnQJ21ozL0paCDbmyICK2FfLyL+tJhWcAkDqeiEY2u8Q8wA2SUkqwm0TSNJ
	SejcjzpCLXRA1IiEA==
X-Received: by 2002:a05:690c:88:b0:864:6f4d:ef7f with SMTP id 00721157ae682-87121acbbc5mr98578937b3.7.1788818086189;
        Mon, 07 Sep 2026 14:54:46 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149316356sm77902237b3.9.2026.09.07.14.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:45 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-usb@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 5/9] net: phy: use linkmode_and() return value in genphy_c45_eee_is_active()
Date: Mon,  7 Sep 2026 17:54:34 -0400
Message-ID: <20260907215439.409858-6-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907215439.409858-1-ynorov@nvidia.com>
References: <20260907215439.409858-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the return value of linkmode_and() to detect an empty set of
common EEE modes and get rid of a separate linkmode_empty() call.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/net/phy/phy-c45.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
index 870920311f9a..27da1b9ddbc5 100644
--- a/drivers/net/phy/phy-c45.c
+++ b/drivers/net/phy/phy-c45.c
@@ -1623,8 +1623,7 @@ int genphy_c45_eee_is_active(struct phy_device *phydev, unsigned long *lp)
 	if (lp)
 		linkmode_copy(lp, tmp_lp);
 
-	linkmode_and(common, phydev->advertising_eee, tmp_lp);
-	if (linkmode_empty(common))
+	if (!linkmode_and(common, phydev->advertising_eee, tmp_lp))
 		return 0;
 
 	return phy_check_valid(phydev->speed, phydev->duplex, common);
-- 
2.53.0

