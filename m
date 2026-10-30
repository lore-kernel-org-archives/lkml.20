Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349230;
	b=f0RWI+LloSkxj/hksffayUphZtTwpTzQdHoRUdNX/03iaeXWavDtnN5iBN48Uw2UyWo3
	 Gu5/42z50vwuDCdAd10F9zrHyAeZjkCWPBqlq7dHtFNByOxPK6arCTI/7QKJKpJk11gcl
	 rnt48EMTuRx0ZtamH379yWTH20NhRytwD97NI+Tfe0qljElwpdmxmetnLYwAMHVooVeYX
	 qObEBpa+SdrpQtvtU2ArBSNYBgErHnnIn6vsvgVIq1VoCQf50DFGFQhFY+mmCbcwjgoiu
	 YD/7IQX9jTMJycFh+WssFzUdyEPqi6zAO2nEkZkP8GPJ9xANwRGojU/1SQaowdy0tww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349230;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sPAT5BdNlhSR3TVHkk2zOI9YV8pl9pF9QIk48sjM/RA=;
	b=SAi/CvrPAjUtod8QdK33fPl364Pr2obUoI4sgfXuzWTRefm9SNimoIW3+7LhpfcZi32b
	 7K0AkaHa/H7SQF71xzoAr0d7F9B7q/Bvg7k4gjM62HWmiUd/szn4NGCXKk8QAiqenXVRg
	 FszsQ+cu1P7S0avD33a+UW57N6+VD3J9vCrXN509xfHpbmQJ8+blU9EhdFFK3F/NgC40n
	 OhilrDFM9f1Xz1rZXYacuq8Z8nLqHtWyfT00cQhsosiRbQFBchsBDLcYueFgAZa8BB70i
	 sdlhPm6vi+aGfFbJcmk9HSeEHnuS7G9Cg7vs1LmxSeY33V5CPgv9aWrg6z1xd2S0K4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RuNNqWEj;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCDB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFCDB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RuNNqWEj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=RuNNqWEj6+XnzP+7lSLupdpDCajAdmybPNVly+fneDvgeY39ZyRTJxvtr1xuS42HaI9KimeGc43E6
	 wQXFWpD1gyYQvA2eYXz9/4+MT0QrCCWfzMZo89XwyGf1NIJhNKFw1c1sDSG6P/VWJyeBT/1a+5DFtY
	 KuIAgdRzL3NyIOXA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16ae45667f13-4ec08;
	Fri, 30 Oct 2026 16:33:46 +0800 (CST)
X-RM-TRANSID:2ee16ae45667f13-4ec08
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae45668c95-55de9;
	Fri, 30 Oct 2026 16:33:46 +0800 (CST)
X-RM-TRANSID:2ee96ae45668c95-55de9
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
Subject: [PATCH] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Fri, 30 Oct 2026 16:33:42 +0800
Message-ID: <20261030083342.1531-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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
later error paths already jump to ctxld_err, which calls
dcss_clocks_disable().

Since the clocks are only devm-managed for their reference (devm_clk_get),
a blkctl init failure leaves all five DCSS clocks prepared and enabled.

Jump to ctxld_err so the clocks are disabled like on the other error
paths.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 7fd0c4c14..551786060 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -70,7 +70,7 @@ static int dcss_submodules_init(struct dcss_dev *dcss)
 
 	ret = dcss_blkctl_init(dcss, base_addr + devtype->blkctl_ofs);
 	if (ret)
-		return ret;
+		goto ctxld_err;
 
 	ret = dcss_ctxld_init(dcss, base_addr + devtype->ctxld_ofs);
 	if (ret)


