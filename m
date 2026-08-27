Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED02369208
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787793883; cv=none; b=lJLfKM6OxsqgMBRW401XLTPQS7ux7Kd04E6Ib7eUIfvQHc9dcq9lj+/3S28HzYl/Icm8z6LOh6Pr5tpwjA26K3hdhHz4p6zgiinZLCidLAOXlsVxt0deCg8zJ75DbMvhgikDuvBqRCT3dK/qu7oM8VFGEwIlvECfwy1tuU7orHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787793883; c=relaxed/simple;
	bh=0rceLiqa+9MdS1lvoOTqHr6/JulnOpNwXLbxC8p5UsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCtaTTUweDKJF7TfmqUOeVeW9XAhb5p8C4aqIZsXn7NURuHhXxLVwbKST7Ypxrin3Mqh+hrn/9edfS5JBiEVS0XPtp91ld3AWGsUSm94G14M5yHj9FhmwU8xD8l5VKp8P5ixan7cAby22MmbnFnGV2mo4G82XOMHCMcwhkOIMZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5p1YJJE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5p1YJJE"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d5cad1a6baso2083495ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787793882; x=1788398682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/+j8GRAZA/QZODmB/777GdoiTUk16s/0lLReDxBEmI=;
        b=p5p1YJJErrCheOn13hLUTSB9QDd52qKJyRUBrZXOIfYFK8LuJS3Gcnwz2u5LbU0DVU
         g3bO7apqSObQGtyBOJzxkVDzdm/Y3LmVQ5qcKYtWuuL+WN2r+Hw3qZxiK1KoPEZ7P5zs
         QKlDRyR9hLZGvHFCe8bTfvnrMtswLTFpKcuovIgOC+TjwDgQwg0kC4eLL39iHKED93R8
         9JxsIOFf7sk4SY5Nwf+pqm9V6SkhUSn6LIc2hj+Ab245fd92kmeJ7UtaPFVZNIh/UgCQ
         fxnDsh/oFpqAx4c3fqLkjlIW3RvzUyZl6DVLrHmVGrE0amuByb6u71pv6hcqlnOpbJuk
         ljOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787793882; x=1788398682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/+j8GRAZA/QZODmB/777GdoiTUk16s/0lLReDxBEmI=;
        b=I7RUc3RNpU+kDMq7BKgg+BUmHGanH5+HkBv/Rim743nCr1DdNsPgiJfUiawLjP+Qxf
         zqIW8PFVl+QexDXu4WqESihJGxisAdk0rr3PRkpjuzOkU8h5cwVjDPgaPyebKZInCWWs
         mKTO42/XaWcngyA6yC4hX06dASyQlxv+C8tfupJzP57Si3Tt/SITi8zUuRFTVA2/pT6/
         19Ho1uVrwgpJjZEwjUoqEX22nYVM+cw170SMgCK+D12/WmtBENSlXjT4xpmPnI6CDPFk
         1JQsZzGMhRwOl5xM+R2bVYXhTtsTJ13yVoKz89LWRYwvm7POFek21nDBXRkSed7HBXIr
         3l1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoaPhRjI/OD9lAlBHDb3YhsMIrTsxn/GAaTlCXmJwflBWA2fttvJ754VQvaCeGzp/+ESeTjmrSKAcKz43w=@vger.kernel.org
X-Gm-Message-State: AFuF++lfwsNOqf5ormhOozy8HwSupEJ5dQm8Dc4r4Gh7m/+HMd5gQL5a
	Sn9nsftqzfOCZC53WE8wzDgf51YKTgFxXLQbZnMiJb3P5sf0lLNEcuDJ
X-Gm-Gg: AR+sD11IMllwIkd0BNZ4giSQGvQidsVSWfKzsppCCc2VGecsJJwtlob3U8fsSyPy5Io
	B7GQbR0qcJGj/ILVoytV13RV917U9KJtNBnqLKZLdLG0nX0xveBWSKThCgmyI2Q0VHjINmQpDVw
	eyG5J0r2idJv0yAeuwHu2ZW7DjamgMJNDgQVrQOf0qcc/N59pDsh9ZZQ9gih9gAJOtFcmpT9fwj
	v1Nvkg/fwBfLpLYJykBGr4C6nouAq9N0ZzckQz7a950mIRL4AWUvQjsUJ1MUBn+qCKe4kGRJi8J
	2aae6c5YUV/SjbZS6d/FjO4yRdez4/7M4tCj3X5mjDKCOt8rWQ+4/AQC6c1DtSQ22bfp9boLItZ
	kZIFSGSR7cAdnoyHlvr/EQsm4uoyqsvv8EUVHaHKzEhPoeivIeislM9LAe4n0SV/Mff1fgs1p0K
	Rg8+WKLOtYPsEtWY7DJGJBpvbFTG7cHaXVbFZF0FBp1ITRuoaRBqFEDocfxqTJYIW/o1r5sikiH
	X9xordxGx7J/kVTyMaVA8yV0+z+TZrI/i2LFXYb3B1SUZKxxFIyIAIag9Z+abRhZ8Z6Pa9LHqVP
	2/qTpilaKlQP0aEJp4gcAO9K4piULQVR+mFjiQ==
X-Received: by 2002:a17:90b:1649:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-3966d3fe36bmr22244416a91.2.1787793881655;
        Wed, 26 Aug 2026 18:24:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328593b6b7csm1321890eec.19.2026.08.26.18.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 18:24:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Esben Haabendal <esben@geanix.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: ll_temac: Return actual error from of_get_mac_address()
Date: Wed, 26 Aug 2026 18:24:39 -0700
Message-ID: <20260827012439.162651-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When of_get_mac_address() fails, return the actual error code (rc)
instead of the hardcoded -ENODEV. This preserves the original error
information, which may be more specific (e.g., -EINVAL, -EPROBE_DEFER)
and helps callers handle the failure appropriately.

Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/xilinx/ll_temac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
index 711ed9c2631b..81ec73e6e4c1 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_main.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
@@ -1581,7 +1581,7 @@ static int temac_probe(struct platform_device *pdev)
 		rc = of_get_mac_address(temac_np, addr);
 		if (rc) {
 			dev_err(&pdev->dev, "could not find MAC address\n");
-			return -ENODEV;
+			return rc;
 		}
 		temac_init_mac_address(ndev, addr);
 	} else if (pdata) {
-- 
2.55.0

