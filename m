Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562614;
	b=o4NJ/Wyxmg3Y53b+lgEyegDXWNFvKPZ4ZKo+f3bpS6q1NEnuZUB1dKC59o1neXVA+aOO
	 mimsuWpvZ8/R+2OmZZabpnefuNE/uZHED7VaXhulUDoLuj+itJq0ApsckPLDc8Bu3rZYB
	 suL73HsOVIDDScSFcX2flbI2OcBEEPfnVAUzDUCbMNS5dLoATB0PUrMz/5Gtbv6VW/Nku
	 b7qmKWoOGhN2i8umcYcrCPZA0fbOxHFw3fAqAvxTCKIbWb0e+n/OgoYPmf9VYdOoNQWBZ
	 zG431Kg8bplyUjk9op1IXPUAQm4yRtuZfrlFoEiZhjn49s01V4OBRvaDu3I4yov6ryw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
	b=NW20zk+hD9XLNEfzHAkhe215vLkQHm10JUdWT2H1WklvVewWxMaUt3rLNK7EqMbFEBbF
	 1kon2MfIFUzTQLYa89Zvcj1vk3p3v2gyA7p1BTAQWLUYaLsRwyJNtc0rNN03x/qot8xGY
	 PcdalDHyI+cx5Y8I3NhbOYt0BYgA+6vG5Mz2FabyAt1Qt3L6XWgukEf6nEYNkiPl53L1v
	 sfPNTlTap0F9CEj9OQOc/tjDuMeycWKzURQLkI+VqO6hfO0JXpQ/1qJCi5pLkiVXRy9fX
	 EGw37ZQSgBSrfk5BmxnbU8s1r/mecYZsNAVC6IjZzMkJ/OVi8GkAOlxFZRpllZ08zsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r46vPhLa;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5AD606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A5AD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r46vPhLa
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso27111735e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793562613; x=1794167413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
        b=r46vPhLaKFRAzvElI1eGj9YTUgrcQMJtOkZamSOKP4rFR5KYvPIEGdjel+PcKCD3o/
         gNLU0U9Ir8s6i2yTXZmtpUveibvfj7Ci02VDoOy7VIOzO8Q4IWOqgN+YoHvv07SPmegP
         Jg5KWLqwjBWFTn+obAjxNlanlETqOsxnhtXHXtHGyX3/9DOiF1e3jB544qnnxOBq64Qx
         TQZ2MgPWPqPWn85jV9pUWvZfhN0Ok208INnx2xIGBPcWjxLd+3XHsmh3qAQ0wrlrX6OB
         zqSgtcE+UPlvc+qO6Z3bukeN2M8C+vUyn9BM1vdY/BNMWbrRetUmBRo6BA3EefOmszbP
         0eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562613; x=1794167413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
        b=vzyySOXylg191Jx81oXPPIABM3mRkXk1oZ6appZ9XCwxjB0hiyAmT2t6La+3HcXi6d
         NGuc+chrqHrYBBrPMwV4sqTKQDYsRhS/zMAHxs0WTYS/kxTM6FhTj8p++Jltt126Zv8i
         BHRRLfZo83KAlriX3YZVUvTgW1NAMQs6kLatdwCSO2dWN0vVkoG87fjWyFac7wHEtvys
         dcSPf8dyGd8uMDARvaH9zByLXIrvAY4aagk/1WizP2ogamj/DCvGyH9J4b95yUW9Uqu4
         2OEjVOMHPhErEIeAttGc9shtgubDa7EAfzP066aso7TQrUrl8+O4ucnVxHa7vrLSHxbu
         SULQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYcvvbi3rnxeNzy5qZUdYBGkeiXgjj701SMHC5wk/1Kwb1on00PRzety5LZxBC0sHfJTQnXVgLtuScz0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMWqoj1uBLQ/g0J36XDNSC98PRfR/3AuDBlA30eueklqnAfuNl
	UVhxeufylIz84V1wMkpVk/b+E0xXaixBretQLTLn79SdCxlyORZ1Zxps
X-Gm-Gg: AYBFou3aDKRuSNaChJkEhkWipSWGcK5crEUUOKj8FdAS41t0jl6nh99rRch8g2U8OEs
	x9K9oUOYONdHM3b1hhFg8qlvCa8Th6gEJbyry1CHlDtdPnsGQmHbBHX9UaEbI7LEmqziRqA2ILj
	em8N8oy3s6ZMKtfEIGvcKpVqBKY/bHPLicwzjRa/skV0ryqZb8bvi1bAVkw//RXm2k7QuNk42gT
	g4siM2gQaGxcqEIiHEtBlzRQfl4HiQO3hqMI9d1ZIuFHEt5n1WCBFloBdHVXsYc8tJHXZ4YI1yu
	Tnr8SncHz01NTyxRd9YwrzBC/SIUDttFtwjF8an+yz/6nLs11KWgUufPy7PQBgNL9+5YC9LHfjj
	U7DDriWxW/BYu1LZWeFlanPdEJYa5xedCj3a4AMiN5jhc8qF9SqSATrHARdV9aXJlYp8Ct4aY6S
	A0JmzaNAD8RYNJZbmHw4LwHxZMTy+jbgZOnWS8esRDog8rRVW5hiM/19UY/NQtgcvIkqg4IvyKC
	EGzsBfgIwkX3Vs2rK2SEmQfBkqWgBYQSMxSw8fodeXoyrqo2nvMf0aVTh0lGWQWn6d2VvnDtiNf
	frRE9CxH0u132r64NycC3RQW1z3IpB4VMx9mqO8WP+V8oHrXtrwF0nliH/R8s+A=
X-Received: by 2002:a05:600c:c0d4:b0:4b1:2026:6b31 with SMTP id 5b1f17b1804b1-4b12026723bmr12334145e9.28.1793562612539;
        Sun, 01 Nov 2026 11:50:12 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm281548865e9.2.2026.11.01.11.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:50:11 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: i2c: vd55g1: Mark the AE lock and bias controls inactive in manual mode
Date: Sun,  1 Nov 2026 19:50:04 +0000
Message-ID: <20261101195006.220657-2-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101195006.220657-1-fernandorimoli11@gmail.com>
References: <20261101195006.220657-1-fernandorimoli11@gmail.com>
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

In manual exposure mode the auto exposure lock and bias controls have
no effect, and the driver marks them grabbed. The grabbed flag means a
control is temporarily locked, for instance while streaming, so
v4l2-compliance fails on it while the sensor is idle:

  fail: v4l2-test-controls.cpp(134): GRABBED flag set
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
  test VIDIOC_QUERYCTRL: FAIL

A control that does not apply to the current configuration is what the
inactive flag is for. Use v4l2_ctrl_activate() instead.

Setting the controls in manual mode now stores the value rather than
returning -EBUSY. That has no effect on the sensor:
vd55g1_lock_exposure() writes only in auto mode, and the bias sets the
auto exposure target, which the sensor uses only once auto exposure
resumes.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index e3939bb..69ffb3a 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1503,8 +1503,8 @@ static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE_AUTO:
 		is_auto = (ctrl->val == V4L2_EXPOSURE_AUTO);
-		__v4l2_ctrl_grab(sensor->ae_lock_ctrl, !is_auto);
-		__v4l2_ctrl_grab(sensor->ae_bias_ctrl, !is_auto);
+		v4l2_ctrl_activate(sensor->ae_lock_ctrl, is_auto);
+		v4l2_ctrl_activate(sensor->ae_bias_ctrl, is_auto);
 		break;
 	case V4L2_CID_HDR_SENSOR_MODE:
 		/* Discriminate if the userspace changed the control value */
-- 
2.43.0

