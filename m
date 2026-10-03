Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31CF393DE6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791048268; cv=none; b=XTKpCkHWnx7R/umptcSP/2uRXqlrNSHO5uXJ3lI3yXD251tCGpAvNEn0HDnThZpzldscfzJCZp/TagahQCMcX2NqcW6c33kkvmT2BBraZdmdRlNIuQWVtAscgyUr/72NyvVP2oV4ZYK39xa7ZiZp8vFiU5M/XyZmo65yrJPWMpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791048268; c=relaxed/simple;
	bh=69pIUI/5/fbnwUFtIz/4iXV/uH+NitRm63o5SGfm3YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fkc7Goxt70loN+Ku9gMoWXV1ADKQvYkmjO7L+sGwVNsHeZ06CgqLYn0iavpYCI9xdS9tfPBl988KUgE5eqetu4mTfB8Du21/neh9L6gkQdy2U656FcTAga2+fcv56j8schLdPXIwfRB3t7kcIX1A6br1rhBffV+0eCJP6tcCyi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pI2QtiPz; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pI2QtiPz"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2e7daa815aso20587366b.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791048265; x=1791653065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dMjI2Sdqf2wHcTdDJrLPNOQcTxfKFFQEHZJyopa8XYE=;
        b=pI2QtiPzsyz1hcueXwX8EUU34laV5XL71EbsENYwpwSjjDizSUq8b6vTBG6OlzJxY6
         D20DtaJug20bTvKxoVU0gDP6BaBxFbCnmS4bdesy1IdMnQaYDmYDZxTJ5Dr5hlviUXj4
         AYBbuBqlfxD4UHlQHKgnwVy9rh3RF5IFGTv4UY76sOSnQya4U8jJUBiZCag9zEgcblxQ
         56v2CJ5E6WgYMi3+h2xrdCdwtMf9x0XsnusyLXXyXHvUDur4Idah9Lpycwm6CZAZOjou
         q1RCY7kHgoVXwSgcBxQ+uQTdnbOco/O9umLfZwM5UAYNKjT8+ctLdiqTjlJg0Hgnhakg
         m+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791048265; x=1791653065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dMjI2Sdqf2wHcTdDJrLPNOQcTxfKFFQEHZJyopa8XYE=;
        b=jY1nlA9/lUpcLM+AV2IJhdZLwa7ZRy0dai3d9D0LS8STGrlntWWYcF9bSLU++xHSbm
         hPNnM95ugZ7OuPnQKNek78mCzW1cdKLsd1dAzZ07lELv4gtCqyuJQN3oYVFrxlH1z/tv
         aIJqPCNCeq3XempFBo+zAejYDrvnZ6UoIEc/xfO37UmZJZbPsTdqkiu3eHqtggYNwRvu
         3NSsO9QpZID3GNlCEIvHap71yHlSX8mNBSD0plTM0ai+JrobISKMeqPjRWHk6v4FgAjy
         F5QlyTXY0bw8qs4HQ3mwuM2gWVazbgK0S0BWqgM/4kWkQzKDeFC2bKNmUiGzDdIsPXFO
         xDDw==
X-Forwarded-Encrypted: i=1; AKwUvBxR51nTlunmoCCF6wL5bvXqMhRUawBc+/6A4BEk9obSe6n97P0Xtl1TniEHvynIycxmXzOfSnnXInkQbHk=@vger.kernel.org
X-Gm-Message-State: AFuF++kSX3HRKM/os5rC/I9P7geaqAg/xkZip4IpeMhsbQrrU0+ybxlK
	JF6NmTotRoKeeBhhH7NeNfSIxzZSnpIj1ORji9t2s648/RylMNzBacVg
X-Gm-Gg: AYBFou3nh7giaxURQrKz/m3gnK3NeLwpdF6iNA0MDv4IXjWMix9fIE7YUuxOASe4f94
	HfMhpVhDURnGWP9ziqDcR4H9C+OYCnbUBVYJr4jvfjQR44HFucXicTCxAYeeaO85CRTxDJSeIbR
	H6e/xI9I9idk0qtyg8DidbmPrLwc7gnXLhmoMpqHlWw+VKPSk4KmkEkz405gWxA8D/CZ0v4T1QH
	eH2wKmaGm4VSsBCGMGzl12T5urEh57629yZfs76SVpif9fI1pfpYlzStHCdSNgXVf/uR1wNkgdh
	89mGLBBW48tR9WW85LDrr9vpa+o2a4zyd+7MDCSAFvvZoFop37qI1cuX5Ly8GbPkgQI0gc53y0t
	Q570IpsOBcRELd48imAb3tUgYeStdfJFYzGBnlF9VgHkO53J0VpQIwuKQ7quUOxlMhQba4SmgOd
	qrNbHO2FJro3PeyWoyU41PnmjjD53COYKPP6NgD5NT7/7xDPEcxcRxiqt/08Bddc7D97CvRXiFw
	1lwTaUScGGMuxSY/KnmChMHQrylRNBWVaRYiT+aWaYbdSM5YE1GBHbj
X-Received: by 2002:a17:906:c103:b0:c2d:23af:5fcd with SMTP id a640c23a62f3a-c2e4b2b3fefmr550091066b.44.1791048264541;
        Sat, 03 Oct 2026 10:24:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:7995:7ccd:ec2b:6712])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf87430sm211407666b.64.2026.10.03.10.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:24:24 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	John Crispin <john@phrozen.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/3] net: dsa: qca8k: do not clear MASTER_EN after a failed page select
Date: Sat,  3 Oct 2026 19:24:03 +0200
Message-ID: <20261003172405.342-3-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <20261003172405.342-1-yongzhao.derek@gmail.com>
References: <20261003172405.342-1-yongzhao.derek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qca8k_mdio_write() and qca8k_mdio_read() take the common exit path when
selecting the page of QCA8K_MDIO_MASTER_CTRL fails. That path clears
MASTER_CTRL[31:16] with a raw write to phy 0x10, reg 0x1f, which only
addresses MASTER_CTRL while page 0 is selected. After a failed page
select that did not reach the switch, the previous page remains selected.
The write can then clear the upper half of an unrelated register at
page * 0x200 + 0x3c.

No MDIO master transaction has been started at that point, so there is
nothing to clean up. Unlock and return the error directly.

qca8k_set_page() also keeps the old cached page when the page write
fails. If the write did reach the switch, a later access to the cached
page skips the page select and reaches the wrong register. Invalidate
the cache on failure so that the next access selects the page again.

The Sashiko review of v1 identified the stray cleanup write. A userspace
model of the driver's functions reproduces both problems by injecting
page-select failures with and without a hardware page change; these cases
pass after this change.

The cleanup write comes from commit 759bafb8a322 ("net: dsa: qca8k: add
support for internal phy and internal mdio"), and the stale page cache
from commit ba5707ec58cf ("net: dsa: qca8k: handle qca8k_set_page
errors").

Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
Assisted-by: LLM
---
v3: Target net-next and drop the Fixes: tags. The commits that
introduced the problems are named in the text.

v2: new patch, addressing the Sashiko review of v1:
https://lore.kernel.org/netdev/179054715863.3145.10179961093285192493@kernel.org/

 drivers/net/dsa/qca/qca8k-8xxx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index b73c7c52e0f..2708430413d 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -153,6 +153,8 @@ qca8k_set_page(struct qca8k_priv *priv, u16 page)
 
 	ret = bus->write(bus, 0x18, 0, page);
 	if (ret < 0) {
+		/* The switch may or may not have switched pages. */
+		*cached_page = 0xffff;
 		dev_err_ratelimited(&bus->dev,
 				    "failed to set qca8k page\n");
 		return ret;
@@ -836,7 +838,7 @@ qca8k_mdio_write(struct qca8k_priv *priv, int phy, int regnum, u16 data)
 
 	ret = qca8k_set_page(priv, page);
 	if (ret)
-		goto exit;
+		goto unlock;
 
 	ret = qca8k_mii_write32(bus, 0x10 | r2, r1, val);
 	if (ret < 0)
@@ -851,6 +853,7 @@ qca8k_mdio_write(struct qca8k_priv *priv, int phy, int regnum, u16 data)
 	if (!ret)
 		ret = ret1;
 
+unlock:
 	mutex_unlock(&bus->mdio_lock);
 
 	return ret;
@@ -877,7 +880,7 @@ qca8k_mdio_read(struct qca8k_priv *priv, int phy, int regnum)
 
 	ret = qca8k_set_page(priv, page);
 	if (ret)
-		goto exit;
+		goto unlock;
 
 	ret = qca8k_mii_write_hi(bus, 0x10 | r2, r1 + 1, val);
 	if (ret < 0)
@@ -896,6 +899,7 @@ qca8k_mdio_read(struct qca8k_priv *priv, int phy, int regnum)
 	if (!ret)
 		ret = ret1;
 
+unlock:
 	mutex_unlock(&bus->mdio_lock);
 
 	if (ret >= 0)
-- 
2.43.0

