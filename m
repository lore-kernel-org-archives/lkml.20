Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC97E3F104A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861791; cv=none; b=RC4KU0v3ek9DS+Ui/gR04C8zYH3JWWcaSq6Mxa15ekCW0p6noR49B/dc2XJKHZY4Twtfhj97ep6o7RSMd2ZZMgSzG4+A/HgfxccRqltSlxoDBslnX3ffmcOiq2UWRWuHP2gyvmK5flHN9JIQFICL6WvNcG96oiKp+eL52FCCapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861791; c=relaxed/simple;
	bh=EJGytrLx4MzUVYSMul27Z0ukuwJPgE4MBoPNMvnDsr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBSPTk7wo90uECRCoJwiDPYD8iznuYUkP360oUEcWzw5CYvqT8BSj/pG7ip1J2AQOPXUSgUcIWtIqzVGDKbKJw+oicZ9+Kr4LTHY+xbHbCGvMCnBwBW+WEaMYsvlmfWzi4MxI3jKMl8z0TnCHz/rW/S0ztHkJsLbC+M+4cl8BII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdQj/ULZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdQj/ULZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b966dd74so779505e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861788; x=1788466588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ptohRIkOkqYrjTOru/sCBYU3qNV90a3HPO3XEYdQu0=;
        b=HdQj/ULZ0Z075T/6nhzfQ8fY1MsXPeaOEOqDEOc4HMnue+MmM4wfsbzDfkS+aKWwm5
         ULZZAlODoOx8CKmWoJBP4tFOHSAj3PRabsPg5cBxSRwIzcevwsBEFyfmdgQuhtNmSCXP
         ky77Qp6G0tu9Ghv68iU1VEsri9MTfcw/oEKe0UUIXGi7x3bRbSsJ/YG7+21ucrNKN0s4
         0j6HHRBFtkfvmUr7l3G9df/Ku1ygcTUCmgM+rK1HYS01KW5EL+KuR+BFGbrqZXMmmpwk
         zFjLqylzjt8ATVMz6QV3JfqbAZzuKphWx0mC3hmrLUGk0nAUn3AghwCkpRDV1u8U3+LF
         73sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861788; x=1788466588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ptohRIkOkqYrjTOru/sCBYU3qNV90a3HPO3XEYdQu0=;
        b=rDniv1n7HrKvupsyYvDexSpHOWokkhbdpj/eGGJC9FJfhzPDaDqYXUUbbW4gTBPPiq
         zoRLF4ZX7z/oBdsSH8pvrYhVZPAF1I0Tfm4X95WZGoFX3+hs6ReP4FI7E3ijW0KIzna9
         +RsZA1Hq6ARlyDY0wpc2Ryz0nvXjw5B1V5PTsYanSz3QHpapFM9ASXH0AumwKQAFGl8S
         kCD3cj0gR8xlt49KrfRNBaQqMby3Tp+cjF4Y2BYCY7b8V8ZJ3Og2zblvYt/G/KLcRmg0
         UW3qjs3Eom7+yKb55Xq8BuWBJjNxZGQKXFx2W2ZWQr1wmzDQsmGEEIo2fFkkKTAysb+k
         LxWQ==
X-Gm-Message-State: AFuF++mO+AiangvhceY6oT41sZRVS2FtZoo1p9CA3IhWJx6NDJWH5yVH
	RUVgfRIIzZtMEDv9gjUISiCFQv2XDmvjHW+5GfEJtNc7bgjUNOBGWPQsDQKcCmFTXeT1kA==
X-Gm-Gg: AR+sD10lb1DlU17Lubs1mJ1+f0WzeoB0QJ2HyjuCShFuuAXEoVHQKFqJG0ZUUOO1Acm
	ufwRf6lj7CiziP0woclh9O1LfO02qSS1psVK4LmndyTfYtbmYtIlXOXzBBXW0aKLkG0wM9746Pq
	H5W7SoqrZvd/cro3AxoYby5HwChdSU0/p+Wc0TAey2PboyuReReUIWK8+IiCbCkR5RxFCgFLUwz
	CkyTkkLTgVHl2qXCsFH3LQJODvR5kVZJQ+Z8zFuesvibOjkIORR2gciE4lk7iwgxG7WU6TMBSRf
	dwK9fSPK80Mw5q2YGxhsn9hEfP/g2lYPwXH8FH+OO7p4Bt+vf4Y+D8T7z+0FX9EpC5W739sqBsk
	D+MjVUOhomVabOPLT5GLJIBhhVSUYa/J++Jj2Lmdt0Lbsk6hB3Kt29h2V7ey1x7PNObA6luHs9P
	582eyKmi7U9qPHBtUmJWnhNLia14Lrw+BIly41BGL4sZWO/S05jW1J94qt
X-Received: by 2002:a05:600c:8b86:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49b91c2777emr25791585e9.7.1787861787967;
        Thu, 27 Aug 2026 13:16:27 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:27 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v9 5/6] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Thu, 27 Aug 2026 22:16:10 +0200
Message-ID: <20260827201611.99825-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
References: <20260827201611.99825-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 32cc95a76..bfca63a31 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -63,6 +63,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.53.0

