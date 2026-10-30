Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358793;
	b=cj0Vt5sF3NZw1BXLqO3R2BH0tAqa50w4ygYNTAfjwoh1GkXjzfNn61//hggMjY0kZU1G
	 I4CA/QqhPWbx8a5Yx5YR29yhiJBoocg+qqR9aTN7UhziCDcik308cNEEASzKNt3lt81yy
	 Tav49+NNZV9m2r7h4g44giX5NPi1Jg3YnPvUjr8MfOJIRDaRTKqod3AFdimn2gngFcmDr
	 qnWsCu6/Raba/p1by52oXRKDaOh4FdeHJhie+JgjuiBql5nPnY7rj+B3jYCJw4GLPDgEL
	 PrGyWEv9M7Yp14FqtDbyhVywcSb+i5RqlTyC0HPAsj5A6bBi8zB3AELCK4NvaKlabXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358793;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lA6TJOaRxsa4Fs8ttaPCMuiOdnwDekD+hly6/8eGHww=;
	b=WQFsS/ST2genJ/zmEZHcufEsTVu2JWg8fKovzeMmREg/17o9W1DBAuxoNMXHBbfBLXfC
	 Wby94uEcTGa5DPVIj0JiJghUgWz824B5U4T6bUTttlCM7j82DjDocxmUA9in+hA8Shy6f
	 aBTzBANxtSwJWt0ziv3DNJ8Kpib7uZnGehEBQ/1gDG/smNbKI2Xgsdaf15na81sj4j/pb
	 J0C1huW5kD0FCBKd4NSXGcIo9gg9Q481ZGhC54ecnsNHWVCdeWVJSoyCTBnGMMltVDNts
	 glXOxZW44RyxpcE2nMlMM108ZFlHKMyXTZOx/RO/XPkFR0zA9Zj/Dd5PKTb99ggS+QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=nFDu680s;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD968606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD968606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=nFDu680s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=nFDu680sWTPFHy4B3sLoILYc4GXFPEXQOnUHzZRCF31jhj38JpRrS62LE1t4+irWTmosP1frNFZYt
	 k6RlXiZRanJlMCR/fcbNXWwTLu6KCJCwSTGM/J856hWHtGRAsnB9zKMo3jWrKmDcjySb+ISAKg2q3F
	 KyIUzc06klWeWWIs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46ae47bc151d-14be0;
	Fri, 30 Oct 2026 19:13:07 +0800 (CST)
X-RM-TRANSID:2ee46ae47bc151d-14be0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae47bc0125-5c588;
	Fri, 30 Oct 2026 19:13:07 +0800 (CST)
X-RM-TRANSID:2ee96ae47bc0125-5c588
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	laixiangwu <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Fri, 30 Oct 2026 19:13:03 +0800
Message-ID: <20261030111304.2205-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261030083342.1531-1-laixiangwu@cmss.chinamobile.com>
References: <20261030083342.1531-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dcss_submodules_init() enables the DCSS clocks before initializing the
submodules, but if the first submodule (blkctl) fails to initialize the
function returns directly, without disabling the clocks again. All the
later error paths already jump to err_clocks, which calls
dcss_clocks_disable().

Since the clocks are only devm-managed for their reference (devm_clk_get),
a blkctl init failure leaves all five DCSS clocks prepared and enabled.

Jump to err_clocks so the clocks are disabled like on the other error
paths.

Also rename the error labels of dcss_submodules_init() to the more
common err_<x> style, which describes what is cleaned up from each
label on, and update the gotos accordingly.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Suggested-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>

---
V1 -> V2: Also rename the error labels of dcss_submodules_init() and
update the gotos accordingly, as suggested in review.
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 7fd0c4c14..206679d52 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -70,45 +70,45 @@ static int dcss_submodules_init(struct dcss_dev *dcss)
 
 	ret = dcss_blkctl_init(dcss, base_addr + devtype->blkctl_ofs);
 	if (ret)
-		return ret;
+		goto err_clocks;
 
 	ret = dcss_ctxld_init(dcss, base_addr + devtype->ctxld_ofs);
 	if (ret)
-		goto ctxld_err;
+		goto err_clocks;
 
 	ret = dcss_dtg_init(dcss, base_addr + devtype->dtg_ofs);
 	if (ret)
-		goto dtg_err;
+		goto err_ctxld;
 
 	ret = dcss_ss_init(dcss, base_addr + devtype->ss_ofs);
 	if (ret)
-		goto ss_err;
+		goto err_dtg;
 
 	ret = dcss_dpr_init(dcss, base_addr + devtype->dpr_ofs);
 	if (ret)
-		goto dpr_err;
+		goto err_ss;
 
 	ret = dcss_scaler_init(dcss, base_addr + devtype->scaler_ofs);
 	if (ret)
-		goto scaler_err;
+		goto err_dpr;
 
 	dcss_clocks_disable(dcss);
 
 	return 0;
 
-scaler_err:
+err_dpr:
 	dcss_dpr_exit(dcss->dpr);
 
-dpr_err:
+err_ss:
 	dcss_ss_exit(dcss->ss);
 
-ss_err:
+err_dtg:
 	dcss_dtg_exit(dcss->dtg);
 
-dtg_err:
+err_ctxld:
 	dcss_ctxld_exit(dcss->ctxld);
 
-ctxld_err:
+err_clocks:
 	dcss_clocks_disable(dcss);
 
 	return ret;



