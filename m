Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795334A49A0;
	Wed, 30 Sep 2026 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772201; cv=none; b=V+Q5/z2UqTujwj+oh5RXLOFGvgyLIcN1LfDw6Vh0suOJnMuGhLsTnIoXFG/qok5efpW59JNsgfA8Vc64JUV4bBKOhyZhCbLF/xbQi4ToyL7rVUeDuZXVSQLpy0N6LtH//DVr/kiWGwDKK3kmSaRiu2sBIfQnMizhA710/ZfIGc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772201; c=relaxed/simple;
	bh=4R5WtlgbYBEGi97B0xYUPrFsM6fIlLqdyl22Nh5WU78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3kRP5/YFJGKTZT4x+ODWNgCNJIrRGnZJ0X4hynRJo6HaISC05T8DinOEDs4/RgUA9Ky3Of5KQEVE27NhXawStLskl1sN/yXBzJOYRWJQnSIZR3XMrJOFID1dYN2w+d+JNS7Xs6DOU+S3ntT15dV59JdW6OL+u38B03Sj1xsbK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1790772149t5ca4bd4e
X-QQ-Originating-IP: JcZBTyhuJdZpzGdESlzfbp/HAoMyVtn4JCzBrntk5yI=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Sep 2026 20:42:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16091105934519302883
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 30 Sep 2026 20:41:48 +0800
Subject: [PATCH 04/13] drm/msm/dp: Serialize HPD state updates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-msm-dp-hdr10-v1-4-dbbf8b2b42bc@radxa.com>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
In-Reply-To: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=sophon@radxa.com;
 h=from:subject:message-id; bh=4R5WtlgbYBEGi97B0xYUPrFsM6fIlLqdyl22Nh5WU78=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFl7mZfmXMzov5X5xyFH/UnUSfGkW+m7k3hOtKpO5PS7q
 W7Zscivo5SFQYyLQVZMkUUhnmEue2XutadipXowc1iZQIYwcHEKwESydBkZvpobVKySWJCz6X1O
 WyHrpvVXXT78+PruUcOneyx7DScp9DEyXC3eKSm5+Ibac4czbkkyj07WTZl4vzRW2teCcdP5F2c
 v8gEA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OMYc6F8vKQbctmd5roAaIS9vXhQYIz1hSpbh6DSxNBRZwigrEX0T1GJt
	EwIzxXpQbnOb0h9xOVKJrtk0iqutZsy77ThzqS7xoSDLC8YE6lwLLPSNjTFo0OML7kwkIgW
	EfwhUWY1wb+rvyeNv4DYuhYbuPMAzzxFzJDF1IJPVdNAAYh2BwdyufzrtiDtRYIuVlBESsL
	YNxkTjsule4qPCeH5+/Z9nEO1ossDGjkk4Rs/oOz33RIEJNlwR4KUwKOBWYoHo7+uM4mMog
	Csl3pe7h7cs8OI/wEGZ1CEWenFIztdLjxcG4vctJMY8KJqwitgWHA+NaukIvXfWpnDJxwHZ
	smeUcz1ybZAngSGXZkw1122NEwXVTFSSlA++cqE9mv5oSRy/MboCfLsd2kDO7KyVyTaWWjX
	7mr2KtxlsXFp3JLha+UyUWKfZGdUNNR01mCdyVk6WI8Ad2q5/QkwnLC/wsmCn1XncQIoShp
	Z5i3gifQwjFgdrsErwMLhZmCJAlYPtpyHsPijfNLovE4uxsPBN5T3Tb55Sdb8ql7M5QBCrg
	nSW+VS0BkmbNIwYVDhIm14qyyaATOoXHmo7B1soqzb1cxu2VNpGiBNs2HETHJDrU+B/wU3+
	S5YXbieNAExWXDzCBi6IeB+drIo6xU65ulhqrj+YMe2cKiuMjlwt2G75XLnYjOMWplRt3aX
	j7KhjLutIoFGSS8H13CZrrmYSFoSWynNzkR3eb8uU7T+HLUznMPt5DIweHoja8lxhzsuvbd
	sZcQe8vywP1DYlP2jUuvO0UYPym+Wxld5+yLQUgpbj8mhN85b742BeeZDGcQn1IGi4JT/Lm
	YIC155DHXiI4o6gqkuWwpV6x908pIW3HM1MdJbqd0frUBIlNSGzhQz5WtwlS2VngeHi9rB9
	hmSqeRX7eAJ5RyAC/wdM3rbK3FUYu/8+CtcDA4qo3wSgdxEEhTLFopWWDfygVge5uPxOcWr
	oBp9nRTWurSIcHvbo6n82RJES8zyB36p0aBDdkS/6mrM3FdgUiGAJ41If8+fc6rOBrdd86I
	iNBR67xs6cHNdJKVE6u4aZoaZ8NaEXv/FJwtXRpA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The plug and detect paths hold plugged_lock while accessing the sink
state, but IRQ-HPD processing updates the same state without that lock.
Unplug also changes the video-test flag and AUX transfer gate before
acquiring the lock.

Cover those updates with plugged_lock so that users of the connection
lock cannot observe partially updated HPD state. This also lets stream
failure cleanup decide whether to preserve AUX while excluding HPD
processing.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4dcbd9b99d06..3ca039ff57b8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -450,6 +450,8 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
+	guard(mutex)(&dp->plugged_lock);
+
 	dp->panel->video_test = false;
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
@@ -458,7 +460,6 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 			dp->msm_dp_display.connector_type,
 			dp->link->sink_count);
 
-	guard(mutex)(&dp->plugged_lock);
 	if (!dp->plugged)
 		return 0;
 
@@ -500,6 +501,8 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	u32 sink_request;
 	int rc = 0;
 
+	guard(mutex)(&dp->plugged_lock);
+
 	/* irq_hpd can happen at either connected or disconnected state */
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
 			dp->msm_dp_display.connector_type,

-- 
2.55.0

