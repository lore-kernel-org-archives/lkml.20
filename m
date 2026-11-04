Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782242;
	b=QnPISR1tlanfXw4jSda5gzOcd8QWBW2qd4A7MON5sHyDO8RPXaBP/ePdXeK8EgtSZSnP
	 37SXETQU9LgGOzeRZv6sVrRtB09njeUPMfW17n3X8ZEYvZcr3//TD5AiVB2DUqvO+YtBl
	 Y7AQbKy2ELMYHQ3Ox210InNVLK/yngn60BtziPJ3Cc//e+0knWtfy9DDUZKMIm3S45SSS
	 VmQzI1xPUTzuUQvP5PXyLRByJdv/M1f3BpuXP83RtfFZDbEG24DPoJLbzkIfGlNm9nvZ2
	 Idyk33cguwM2TPhT/hP6/jMZ3V9cm3ufm4ub3TJ9J3khCbYe9Vj3wDG4vT1Eg512DyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782242;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SQcKWDtrhSKmiy6sH0JUx7BX4jSdskktbQxCBCAaJ/Q=;
	b=nc4IwGZUoetQOEKh/3pIHnxLIpcXifKre3EIhqVmprS3wyjIcPqHPYoJugokoWquBcbc
	 TBKnFZUN9R2rsjwdyDeYajEuUzcpKja6yAlst5iwtVHkQJ/+T/BAmUZkXCgK4KpBd71HF
	 DbVnm/XNpCI6TGB4rVDBYGQoMRUFqYiqJ4AlZfCI4DClyHEvpFfHZf+BDN+VBKhtDQzP3
	 2DMZ74V+HNozRvaXzBYeDdqYP2vSMY0a+Xi7QJn/JpacNFgtm207oP731h2hnAoslQuOL
	 oiM5aa1ZQSK3eDfbBssaKJPVswnR8/nfZx9G4I18Q1jyiwWl6JwdLQoTwCwJLtJN2ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=GjHSPvXV;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12654606D807
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12654606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=GjHSPvXV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=GjHSPvXVK7A94In5L/yZ6RVi2DQcwmrYMSAYiF7Ohj5pF54vxt9gH5VHr46X8sOhqTVpXrhTYBJ0x
	 kj6j4sRO7ZPgJvIpsFXLyfpM//UtKC9V5ou6DftJjRJeSoaJU322Dyw6eg0HPbC9D/Ahpk+jINHUVK
	 cZfGn3X5b/26Z1v0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66aeaf1df403-68c03;
	Wed, 04 Nov 2026 16:50:39 +0800 (CST)
X-RM-TRANSID:2ee66aeaf1df403-68c03
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76aeaf1dc8a0-1bc0c;
	Wed, 04 Nov 2026 16:50:39 +0800 (CST)
X-RM-TRANSID:2ee76aeaf1dc8a0-1bc0c
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH 1/2] drm/panel: boe-tv101wum-nl6: disable pp3300 on prepare() error paths
Date: Wed,  4 Nov 2026 16:50:34 +0800
Message-ID: <20261104085036.1441-2-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261104085036.1441-1-tangbin@cmss.chinamobile.com>
References: <20261104085036.1441-1-tangbin@cmss.chinamobile.com>
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

boe_panel_prepare() enables pp3300 first, but every later failing step
(pp1800/avdd/avee enable, NOP, init) returns or jumps to a cleanup chain
that disables pp1800/avdd/avee but never pp3300, even though the matching
unprepare() disables it. The regulator is reference-counted, so on repeated
prepare failure the pp3300 enable count accumulates (leak). Add a
poweroff3v3 label that disables pp3300 and route the pp1800-enable failure
to it; the existing labels fall through.

Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 150dff3ab..25cfd6e30 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1371,7 +1371,7 @@ static int boe_panel_prepare(struct drm_panel *panel)
 
 	ret = regulator_enable(boe->pp1800);
 	if (ret < 0)
-		return ret;
+		goto poweroff3v3;
 
 	usleep_range(3000, 5000);
 
@@ -1413,6 +1413,8 @@ static int boe_panel_prepare(struct drm_panel *panel)
 poweroff1v8:
 	usleep_range(5000, 7000);
 	regulator_disable(boe->pp1800);
+poweroff3v3:
+	regulator_disable(boe->pp3300);
 
 	return ret;
 }
-- 
2.52.0.windows.1



