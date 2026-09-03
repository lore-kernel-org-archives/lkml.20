Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DEE4DF4B9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449814; cv=none; b=PrNNoqRTSLqWZotHcvPjzYXElSj8V7kk7IaDvN3kyOT2pSmt+gIMe9ZJS8BJG1AsBaNMdy7OE/jeDuTX3vHYvzc3gxApkKG4xRnrbOxJdaCxIUawr02I903lsGP9lOYNoeB/9jpkak54L/Gcg8WnY4GTc+IKmLvrzTqE/Ek4rRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449814; c=relaxed/simple;
	bh=zfkC3S5nKgEfbTmcBe1cMz/2FXiE3xKWs4ehQHw3q/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fqMzRYouSrDEAFWGalfOS1FZccaNjT2Kr55IJz+MU8WWcy/8kbrD5MaGpPVjqY7d/zDajDf5pQMlLVAywQssMUciovnVR4ouKtA1WyRWGvNr6HXJ7QlwccIN0oIAtZatLe2XEypf+VyYky4KHqAbrRGis/VU9yQCSoCGkjPbgmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCyONz+l; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCyONz+l"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-485843aeab8so391f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449811; x=1789054611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5PeuCRA06Huqx9DiMfiD4Wn1YaBSJ5Fbp/l63yenG8w=;
        b=TCyONz+liMzMER+iB1fqNeAQk3C2Ym9zIXdADvmy25IbjVMUYDqAvOTEBRAWFw21jI
         ezfCnvRxsFV+xfFKyDt2miPwx/B1DMYX+kO7zB6HaadzvbToKL7aYvzb/moKkLNc581o
         wHiWYjgvg1NLDNFAsZzSRZHBfRFrUL/RT1VMEC5xfoiNAL0xKdkE69roF0lzeTdzKgGq
         ee8ROqYVAs/ks4+A0yuSIGdZnUa6ZKKKYbvnrj5UZWSTlaEGLJDFLsm1hd3KX1AgzljX
         abqq5bOtSX7Nk/ZZMTvm4YJ/mxu+Sl1q57t1Z5rzh60BBctUMf4BreC5b+utqZrvoTOu
         a4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449811; x=1789054611;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5PeuCRA06Huqx9DiMfiD4Wn1YaBSJ5Fbp/l63yenG8w=;
        b=mhVmZIsC48y2a46++MR5ehFSHJhqKUvqvzRdZYiFKYeTHD4/KIFVnCN8pgMx+EINJx
         sZUMstkXjfNUiEP/9TfO6WbVlrKc2rUNqGSSS0AXiwLeuF7GHclr2enw+fmq9PbyXIy/
         Y6fkqZRD8eOJ0MWesQ2GR1HSjSphL3coE9nJAEyxoLMA6sHSNumQowT1RTgR7lnw7lKa
         DckU0XOj2JtaN9OH3OZokqI0JV6LlNPpZj59IgYmyakFlDg/0utqEMxTAYlwJ4v7JKDS
         qo8rmi2lxBg6Ftw8lX108zIXRgE3xGTrQfus0zN/639YPSBGO/ZQOQ+qzHc+u5Axc1Jd
         +FWg==
X-Forwarded-Encrypted: i=1; AKwUvBzGmzGSIGdFNCVE44EoNjCYnpFpAGdwVHqMvZYYcMIpAJOONwB4MlkxnOCwyxRKC+NZVaZG3QcXGsoRGMc=@vger.kernel.org
X-Gm-Message-State: AFuF++krT7OBKmvlPXvbSHezBH42qnrwaEs9HoQswlsncHer9aFEBmMY
	kY1qEQ8qIk8f/0FMtwnXp3Gq+a0pxPc27nyl94rDH6pu40d9JzjaJVf/
X-Gm-Gg: AYBFou1EOoBUGM5dYGUcr8cMPLMfbjbjDCJdYRbPV5mlyOZiqIZTXwRplYaWs3PiLiL
	A9sKVdH6reFWx2xLvvoa7MilGT2eLmPpy0sFOLEv4IvQ3q9l//c7irxzglW2tUh/kZp4zrYhedP
	Cje/Dk6rUkYWueFm9T5UM81nciF8fyETaFiqA4l5QXHfX3RkdeTg5gS0ezE2N7YNvBt8+Ah9CbU
	EqyqF6/TeXunVQ+kujj7vzrQfRyWZgSg03BvjMdlJSgTEQI6u8c/5b3K5nR7NqoAq27blAdFJx4
	giPOdg8FBV3dg0jmXLBeDPzgqddN3Q3mWtCmWpAijPuFyTpScGohEmzdGmpwBcvJ4uTW3GzGPz1
	Hb3Wmo7FrxRPy4g5nRvdQQQ9WdeajlGdGIajQb2lQ6Omrituo6e7wm+B/9b3+aQ8lEQ1DjEEjEF
	NVvkKaoaIEyZEYpCwGaPHEOgU12tEUvAiwLSiCOzWtYzrnqB1zCQJKhkLqdlE=
X-Received: by 2002:a5d:5e88:0:b0:482:d900:6558 with SMTP id ffacd0b85a97d-48488e039d8mr26000819f8f.7.1788449810845;
        Thu, 03 Sep 2026 08:36:50 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80745sm14747772f8f.15.2026.09.03.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:36:50 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/connector: Fix spelling mistake "provded" -> "provided"
Date: Thu,  3 Sep 2026 16:34:47 +0100
Message-ID: <20260903153447.19371-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are two spelling mistakes in drm_err error messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8b4baed060f3..00b2eae89b4d 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2619,13 +2619,13 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
 		return 0;
 
 	if (!supported_colorspaces) {
-		drm_err(dev, "No supported colorspaces provded on [CONNECTOR:%d:%s]\n",
+		drm_err(dev, "No supported colorspaces provided on [CONNECTOR:%d:%s]\n",
 			    connector->base.id, connector->name);
 		return -EINVAL;
 	}
 
 	if ((supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_COUNT)) != 0) {
-		drm_err(dev, "Unknown colorspace provded on [CONNECTOR:%d:%s]\n",
+		drm_err(dev, "Unknown colorspace provided on [CONNECTOR:%d:%s]\n",
 			    connector->base.id, connector->name);
 		return -EINVAL;
 	}
-- 
2.55.0

