Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32684A014B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289486; cv=none; b=TXTKfTNitpbfN9jvSkwQogDE3ZNd4FAvN22vHKjllNWkgjWRDLk2RRMozWsueLXBAtCIjfPlDD5diaBOBnIwi63ImZs5TC4uB7MX5d6Coi/AFZMjssy0C/B9LZN6uPJlAHVeDS52tm4dl0n8J0l6dRVPsuBrQgwmEabc7vCr+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289486; c=relaxed/simple;
	bh=IJTIjXefCtpyzFz642pELl2c8LGlNjVMmQXZPOjQ1EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jx93M/H1upav9CLrhq3xCDTp85p6mDPZifKbje0HUq+RZ5Os81z+J0zWtZfPFMGYwCz+mMxjfVGwoDho0AAW1vkNoaIi8IJ0aOn/+UYPFNCsiqyvFhGs6k/4uxeZL+hRjpLPW/+hoQ4r/lEQMOEOSrvpv2tJ+bHbrCJT01WWZWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG878jRD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG878jRD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b9320423cso1663015e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289483; x=1788894283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=OG878jRD8BojDaN0KLvEHSS60LOlyaX0Fy5GpZu+YhMRNLyUNroiShPOYvuA2/a7Ps
         grFgHRtZPbV6X8H0CYCZAfGNGYby7HsHFllcY7JlhKNRdBXIIXwGh06h0BQjUqUzLdqF
         f0odyZh7q/PiUDdP0mGhVYju6XIsvE9IVntaLdmpHnDt+3rJKRXUYf14CxTT5VF2TMbo
         aK5REjjvtcBoP5cuz2qiB1RZtAcB5xhOJjOf6K8WyBkICuoxckuWZ8eJox+i2IUUwIg1
         6V0T7LYE1Iw+04vtykqlJd2isGsiVCagoxF51UHFF8FxB2hxHoJZU0BPU83+RWdq+mYl
         8IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289483; x=1788894283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=TNdAFur6adIoPTbObzrsAZoEgaAUGsfkq7QwtPqmQBFn6U+PlxTXuYNJq0kf1to5VK
         5OWjGi7N2ysP47p/t83xKQGsCv38L+JQmBBKKJ8yyVQlZLb5nTUaRfzYszxPRa3cu/Yj
         8bf7cl35+BczgmlWkS6EBwplHIDTkGstzbysuMNBjAcWea176X9LNO335Ct/jYY59EH7
         eFVd1janZCFbSiMmo2XD9gt7q35j6Js2YAQdb7mZYgzIparGxNJk3jhHwlvT4WVjLWvm
         nPU9VtnvW/i2s07XeHZEA3BxWyg7lyN6Hrh1jOdv/LTw7d9mcsj7bSrrvQnRXsDSSzmU
         sMbQ==
X-Forwarded-Encrypted: i=1; AHgh+RoV7DyPvz3Vp8fV4xZYRpwAI7aXLbsJXCZzK71cPHI+Nzjlrcu4UKvfJOGpgA0EG/ntwvdZvDJBoQE8kv8=@vger.kernel.org
X-Gm-Message-State: AFuF++mGLLGDeo8oC2+JtU3z9lUnwx6rbXIICUVlgIQ4gswzWU9/CgIA
	/tVoc6WwuIjP0sJtkZheKXrDiB7oWmoLhXWXy10HsAh0NDVTQMRX2mUW
X-Gm-Gg: AR+sD13pmNNetUj5PmK26kGn3UuXSYuorGkDsBgCndwicdt5zURHM+Pxcj0dmQlHFuv
	vhr/7CxDRf9/O07HV2MUYE01KrqB+pnz1qNeDLRPDwO+zGRohI6JVD81fY75AmRhyKLMH6E4u1r
	kDFRY468b+MbXPNC6zDJOcnTMD6kRfZbBIpekg/EJYTb9ej2mNx7jFfQbVVkpJtp6OUFFVgCdBi
	oY8LHnhZv/Fy/paMW7C2d+9fcQ0sGw1qW0FhJKq+ZwH7Vk6bJCUnVBSh0r7weXnQ12olmZBW+EZ
	aTwitdcGMP/pzmP+GVmH9jVaVdnZf5aag9CLtMp7KltdLiuEHSFMcPUqeYr7ZBgTQa8Gon39xkq
	Ut60MYjBz2AQGXlv1M3+8cZrLJV2INqaIv3KS7UckqtNHNIVCi5qZKeDdCLbJlNo8mT2dC7Pyq2
	lJz9IvlYUlQEIUvTHV+JrUPLDkfmrfgnKH/bf237/ZFPs9i8nfjCNtcAzaj+4b30L7SCIpe8hGC
	0KeqpSHUWvF3N0qn696RHRx0b++2bYYx8b/fCR1Xw==
X-Received: by 2002:a05:600d:6402:20b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49cdc42f449mr19066685e9.3.1788289482804;
        Tue, 01 Sep 2026 12:04:42 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:42 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/16] media: ov8858: Extract digital gain programming
Date: Tue,  1 Sep 2026 21:04:23 +0200
Message-ID: <ec1729f6eb60f3d29707fc3d13e247d2b072dfc8.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing packed digital-gain register programming into a
helper so clock-specific gain handling can be added separately.

This is a pure refactoring: preserve both the register packing and the
explanatory comment without changing the bytes written to the sensor.

Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab833..d95f034de752 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1523,6 +1523,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }
 
+static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
+{
+	u16 long_gain;
+
+	/*
+	 * Digital gain is assembled as:
+	 * 0x350a[7:0] = dgain[13:6]
+	 * 0x350b[5:0] = dgain[5:0]
+	 * Reassemble the control value to write it in one go.
+	 */
+	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
+		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
+		     OV8858_LONG_DIGIGAIN_H_SHIFT);
+
+	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
+}
+
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8858 *ov8858 = container_of(ctrl->handler,
@@ -1531,7 +1548,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;
 
@@ -1570,17 +1586,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 				   ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		/*
-		 * Digital gain is assembled as:
-		 * 0x350a[7:0] = dgain[13:6]
-		 * 0x350b[5:0] = dgain[5:0]
-		 * Reassemble the control value to write it in one go.
-		 */
-		digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
-			  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
-			      OV8858_LONG_DIGIGAIN_H_SHIFT);
-		ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
-				   digi_gain, NULL);
+		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
-- 
2.53.0

