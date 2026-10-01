Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D08630AD05
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857131; cv=none; b=sMoyUO5CCZHQale8f0+s/sbFR07r7d7d9Kr1T6vyV/dCrXbju0I1abrvtTaadAN6im5/7NvjGbp1ySi4hgXVRnSIp8ewB+8pqRojnM7LKZeDRkaM1htmk9d0SQa8bHoNsbG6rzC09deHAcC1oGnSdDZfy5R0U3XuMhfBreMFCzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857131; c=relaxed/simple;
	bh=LTuUKUwyt+H3jOVW8uOyF0iXnofiu05F5aYxE4x56JY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHGNjr14o/sIQaqnJx/rbkCpEz9Ur/IZ62QgF5TSslkz6t+V3QWSGLGPWOk6ke2Dk0fIk9bEXr83o8ZI+G00JO3F5VceDaOUcxACg2Z+jQAdPVSiaxqvJPT6Ytg6zyZTjizgZwoJXP4XrQFtoXxmtrj185chPMVswbGXEfUmnYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i01yVRHO; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i01yVRHO"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49ff906e297so8324975e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790857128; x=1791461928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lYiRSVWvklShJpagbSBUOBl9URBu27SZesu9eRVEis=;
        b=i01yVRHOneRqNROJK4Znw7XON3MVnAfe20w9N69Zci8j7pv6O0sP+pF+IDqTLCZuOJ
         Upa3M6m/CN5iDE7i3OdxrUfs7TBny3EbItyVD/CCbxUmHFCD7jv6Wbh2/9yUp+ybgxvV
         XW8NI2svgVxh3LVLgskhE0io6Uirdj+V5KT5BV0hOLWCbI67pFqx5696iSs0r4ITovFV
         E6PkT88di0F9VoSyAKyy/dINM2h4Ar2ouacGT5bO9VVVpMn7R15ODDfLoxMdqVtq9BVr
         tQ2f5tMi6cKPUuIAcktONx60BX1zSA6yqH8BqCkpLfHfj1eR9AF4/MGrm/tSd3mQbO9g
         QEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857128; x=1791461928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lYiRSVWvklShJpagbSBUOBl9URBu27SZesu9eRVEis=;
        b=zYvrxnDmFdN6I0n8dESuf473R1URRRzxuLkBu+K28B85cJO8yc3pkMSIDKu0o2OMNF
         e7jkNryPTHihtrRKeM9tgZXCwPK49VTF/cGsktQsmxgFZ+7NLY0apOm+lppeV+ti4A37
         2Ss3huvgH1wyXDvt0o1nufHTp3JCYPbqWqBqm2QEzl5J5urXddcGMpl6bbyiJmYXhSZc
         +Hr92AjijOnO8F7U0t+wvsg+5Z8svCK9qLEqrtTLtCC6VjBCPzkRSQpWxtGoBVtQW3AW
         4TtANo/TuYMT1YJNXU+WaTFSGVh1I5fupfVX/PLNwom+QQUDeBoRW02XMarkbFK8Gewq
         c72Q==
X-Forwarded-Encrypted: i=1; AKwUvBzRcKCcEOnoO5AxW+YLYoh8WG+a1KOo34CCx9oI+g0E+z+zY3pXZsVgxlouarV/tiWz2ttg879eeJ2Dgas=@vger.kernel.org
X-Gm-Message-State: AFuF++kJgDgqcfwrIxCWWMcOWlGgmfNisJtS7c2OuIot8gcmdXe7eq4Z
	2+r+FzKlrWMDEQ9HbLDonIbZq+CSGUE7J5BfiG7fyG97OTBTv3hSGUS9
X-Gm-Gg: AYBFou3sn3lPtjX6/vRMVHCfzVw4MH9Efvi6F3/g2c/HXGwAXeqlZ484oAD7QvalDRm
	Fi30FquT1Q61nXslOLKNDtGm7hFC/WEaAbxldAEUodbCpThxe0qAvHjuY0gskb/n+Pp2xvgrroo
	lBWFoaSyEP3nqIpD7DMNNs/X062suVAOvMZ8rzyYXbKInYYQggTGYYfOnkc/CxwlHycXggAgrHo
	FC12faPCj/J9hD+470qgqpiLCMMPDq9mzhGEVZrLKLYMg2nQFtIbpPWKly8wg2rhj5ssGcX1Yxi
	rNQlBLEifX0gJHpbQ1dQkn0GfNEl0sSgtbNMA88E/yu5ResOrsIMZ7nO6SUZXLtZ4wcfCq9GpyK
	wqtGx9Q/q7ALl9gko3GBO+BDoxsJo5eC4zvn5onHUOREpeXII7ciH+chPzYGHW9HdsuRnRzsyVo
	GwfDz3F9L2Ppx6LeiyJlkh/Bpn5d0254J4ET10ZRRjELJn3fjtMes68zfFLw==
X-Received: by 2002:a05:600c:3486:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a01ad8daf1mr74719345e9.2.1790857128260;
        Thu, 01 Oct 2026 05:18:48 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9634a9sm26772645e9.2.2026.10.01.05.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:18:47 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jennifer Guo <guojy.bj@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	=?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Atharv Margur <atharvmargur@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.
Date: Thu,  1 Oct 2026 14:17:00 +0200
Message-ID: <20261001121700.143861-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct identifier references the 8192CD chip while being in a
rtl8723bs codebase. Additionally, the identifier uses the _t suffix,
while being generally reserved for typedef identifiers.

Rename the struct to rtl8723bs_phy_status_rpt
across the rtl8723bs driver to accurately
reflect the codebase and clean up the naming.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 3 ++-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 34b0369a7936..bf2479c01873 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -105,7 +105,8 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	bool is_cck_rate = false;
 	u8 rf_rx_num = 0;
 	u8 lna_idx, vga_idx;
-	struct phy_status_rpt_8192cd_t *phy_sta_rpt = (struct phy_status_rpt_8192cd_t *)phy_status;
+	struct rtl8723bs_phy_status_rpt *phy_sta_rpt =
+		(struct rtl8723bs_phy_status_rpt *)phy_status;
 
 	is_cck_rate = pkt_info->data_rate <= DESC_RATE11M;
 	phy_info->rx_mimo_signal_quality[RF_PATH_A] = -1;
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index ca3380328a72..ae010cae9dd7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -18,7 +18,7 @@ struct phy_rx_agc_info_t {
 	#endif
 };
 
-struct phy_status_rpt_8192cd_t {
+struct rtl8723bs_phy_status_rpt {
 	struct phy_rx_agc_info_t path_agc[2];
 	u8 ch_corr[2];
 	u8 cck_sig_qual_ofdm_pwdb_all;
-- 
2.55.0

