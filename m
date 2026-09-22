Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748439E19C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045320; cv=none; b=TkNMDGSyRqWr8JPP6S63+Wav9zIH2LPuUfqxuaG8wHJer0T8oQQeNrzQNIl+HiYkp3h1Ubw4jjhGlLPWUYXSSwCJs2ixooKbXtKR1T7za5y1KUjJFVd0yFRZ4Azv2nV3gfL+6Ir8T2VtXlbAlEq+X+ca/8qlNqK9YYfejvq1OoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045320; c=relaxed/simple;
	bh=QstOwR4MoLepqPhwXXcdqhaZXi3o+22oqo/jORxNnxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qT1E/LMpyzKTL64c3+/ia9rEkbUx/BIK3gdmEvI9xoMbWuI/Fy0FFtofIFM/IwJls0zcKtWrHZU3zSkCUaBT4yLy1+Ltygy2fZnHslvqnjOcpgS1MFx1iegozRoPToYxzhD4PcEMD7Phw2Slfpg3gq+srTNYw3nnWHPR7P6i/54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmnDdwo6; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmnDdwo6"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4c9d14b8so5181565ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045316; x=1790650116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQsnO6nBZnTmHd9o3wzHwpj6ldm3p0l1ScGQLsRwCts=;
        b=KmnDdwo6IDTvhGn9L1EHokueD8DwKYuaoRaNHR4rwKrUHeSLhPCBpVRz5Q/jjExCuI
         F1AN00FrJJI2uyWnnJdJRmjjKofMsb709IQhW8tcRghnwfY3wgJCvViBvpGIp5dAFyjP
         fO+v1GiNWQFn7gMTl3ZtMA0tPJ+j2drrKQcx0AABU6iFyeYA0YK6iVCF01eKljIWW/JY
         tIVW3fKE4KjYu7MuYLZfUroNHrXNA38bkGuB2kq4A6fdFKv1WKuJetgPZjsmDKCITGQr
         RqpaYMVdXO4gve1W36PQzGMcmQMJk7feF577pmkP0F9JW7ySESZ0UgPc5La/yJMxzi9S
         Rpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045316; x=1790650116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JQsnO6nBZnTmHd9o3wzHwpj6ldm3p0l1ScGQLsRwCts=;
        b=ybsl2NEjscVEYCRSzs4Uv0cXuxKo5c98c/m4NUU6fZJHbil2dBGro4+NFc3x3Jqg+g
         OAoW43FnAR0ONWnT/7WUxSr3S1L3Gew4TZ4NyYEMK9ZxeE0Wpr19xOuP+5qO2zADNkfG
         gMEyDmxBSgz0/7LQVpKCQ+bWPwycDoIyykrDzRnoPMJgQTKNG+qs5Hk/4cLIzK5qnb4J
         nC8MhHb6OGmlwAqDqkqRzMHreosW2GmSrq+a4undsVOwuLC8uDBucnAKMwNmDNZqnGwl
         /9aIYvxRIdrp/oBTJ3u6mUVIWLIT6jAd0hndUCNdGWmtTHCocQhilpIAtTfqi47XU/gj
         mVWg==
X-Forwarded-Encrypted: i=1; AKwUvBzvLUrW1O3b6aJghA07PrkDqqFwH7yVmVPA7aJZrCZatvjnXDSDW1vOwVunEAFeaQeHtz9JXV2XMxKqnJs=@vger.kernel.org
X-Gm-Message-State: AFuF++lDY7KmhrS/ltKPpXcIjbZbERXtRec5Uqz4QxIYohH6tkbKHtow
	5eNS9XJ3tseVd10J8sKA8hgzQCuknFHoqqZUCu/jL1mQ76XXM3OpUGXp
X-Gm-Gg: AYBFou2ur9ltMqY8Zrnu5hNym/TVgRD0e9rb2U69A7FT3RKDKZYyQnT4DDkmOjVqCEn
	RpZsnhH0exA5xhcCESUFnLw+8RV5IRSqJIk5S2O8zejm6q98a46NdNIEN3RBC/noCjRnsD3XV8e
	eZ0kO8FP8LVowCke/HeDRpOQ0eQKfzrGALGavLSpvuD5lizr0v+MRmkP6lFZ8WnZVlQ8Sn7+KGd
	7Z3E7zQRHKRI3+zRezpY4MDDXBoGJEXAwprMSwx6MUrQMVUaj1LEUvQchh3cohcjG+tlKwaa2Um
	Epu9caw7l1HpbR5FZyFATQcEvPo4jM+2jBW8HyaL1BRndx4Oae5fCVHWowwG4W41BFrgEzjzCot
	hn0hgkK/oEAfkAKQLRawzZrm8LZFMfeXoUTl/aoeHM4D/pNvJvkYyf4pUwHgJSYxKyMRiZzV5rT
	uMtFz1dA5C8Bub4t235++GR6DGQg+Tj6QSbhkt5FGv5Aw+PcYko9dTt/reD6C/SmmF5KECwHzvK
	/aFelX1
X-Received: by 2002:a17:903:2ecf:b0:2dd:c100:251e with SMTP id d9443c01a7336-2df59a72ef5mr12835995ad.39.1790045316497;
        Mon, 21 Sep 2026 19:48:36 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d02e929sm1619035ad.33.2026.09.21.19.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:48:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [RFC PATCH 5/5] drm: bridge: analogix/dp: Adapt the return value changed for disabled blob
Date: Tue, 22 Sep 2026 10:47:20 +0800
Message-ID: <20260922024724.191412-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922024724.191412-1-inochiama@gmail.com>
References: <20260922024724.191412-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check EOPNOTSUPP for disabled helper function as the change in phy core.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 30c0c0b41d5a..8e26cd772482 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1360,7 +1360,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 			 * phy itself is not enabled, so we can move forward
 			 * assigning NULL to phy pointer.
 			 */
-			if (ret == -ENOSYS || ret == -ENODEV)
+			if (ret == -EOPNOTSUPP || ret == -ENODEV)
 				dp->phy = NULL;
 			else
 				return ERR_PTR(ret);
-- 
2.55.0

