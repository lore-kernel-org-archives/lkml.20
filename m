Received: from mail-wr2-f26.google.com (mail-wr2-f26.google.com [74.125.225.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6492D7DE7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592033; cv=none; b=u76D5am9kQW50djPNgnZIuvv1egi3lyV8TGFt+jVPVb8kVYJKwHHfU84gnuyBLwF0wIDm5qna8jiujiOIQQGVhOoh6bUkx+CbShtZuQD3P9w0kG7tRSZSikyLQAJJ8xS+fFsD/VHWSyYL62P87YuVV7GJVi75rRtSuZL50OEyo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592033; c=relaxed/simple;
	bh=wLiYwM+a21eAKdI02nzoDqFbngX9L4TUdt0arxClA84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1sJZGQaIv1zW0An6lCzYCt1WxRZDUBLcIxzLeAwt01a0GjUAZLnqQVNFqKQQGl9J2Z7GO1kkAB8ljBKYaxX+UzhZpjJqfosYZzkupHEJ6U9ELZI+I6PH8dyBi7AaaFW8NtpUimsuWvylMWf2qVRy0MoQiFZeWkzAvFyEqQLP9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNIH8132; arc=none smtp.client-ip=74.125.225.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNIH8132"
Received: by mail-wr2-f26.google.com with SMTP id ffacd0b85a97d-4843f22dc83so132052f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592010; x=1790196810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8/pS3dA9RAh1ZIge2uQ9oYLHFPgMwkJbXpjt7KmlD8=;
        b=iNIH81326Q0t8HOiXH+0vL8q4DaJwaeIwZZ0qRLPYimjJy1jV8ln5iAu87wvLxZhGP
         6sbvssjMmYFe4BKz1hC6fmFtx4OpEX/NCzmtYsY+6dxMG7HYRBv3Ns7v8IW0TAIL6l9j
         1GNK6I6a+mQGBKsCHMami2ylXZe9fvc491zZh9dVGmyo0tGGODSQLL23PusCB3EhuwvQ
         zB1ZzarP9NC5Emn/HNYqSHEBXEQPYiekGmFJznjBX+f2bdF36PkYoovrHqXWhW96NCz/
         y1U+BHj1GN+Ri2mvEIYDWTvNj8G/lLj6O1ZPrdzpNdE/4gg8jWWIpS3L+0Ea2/28wKjB
         72Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592010; x=1790196810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8/pS3dA9RAh1ZIge2uQ9oYLHFPgMwkJbXpjt7KmlD8=;
        b=k11o9F/FCBloP7ciiYQVnJLo7SM7osrOrcr05FQWFzHInziBDQyRUtqLS6Qo3xQwHA
         sYNpyBgDEyYnXXk10csyvQWAfUCw1q136vab5llBzxGo7sz7+m7pt0Xc4hkZCDFq1z/a
         YBO7auK1F2uC0X+oeUAnAVpuXTS4BztnJEoceyw0GJEO89Z8P6XXkzXpcyrJzhlG9L2n
         EBFNwXc6gbIpM2gm+X4gu35OYQPSuTJFxud6TnwlVo4l9+dFRwVJXUMYAotp38qpunes
         uqeXWG+y3+HwCBtpzdYN5jsscz7A9143UGv5wAfU0d5VXpRel4irArIFXKx/cMxuZdY4
         Fw6g==
X-Forwarded-Encrypted: i=1; AKwUvBwmCDHUOoSWaRQPjNra2FvatdOvmGpQwLGhe1O00tu0i2ro0JDrpVzRkSze+IBlpy+EI+CIaTw4RxhKCAs=@vger.kernel.org
X-Gm-Message-State: AFuF++kV4nHMBOyY0b3xhb8w9Z61PZKCDsUVizmYCwhdlD22BqnVjXDU
	cthy6/rqhgoS8vMrLRNSQxGScsf7EpsP6sx0RRz3FWw/FGO4/hTa0CC2
X-Gm-Gg: AYBFou1QB3K2OASPBhWlishOC8CL9BEu35X55YCzYWkrzVGpT9qcLtTUpV+HWlYLj3M
	Zz9csCfFSaGn/U+tovMLFR+9iVvn/NKFxhuQQtVtnSazSz3ZjMKwoX2jFbquTFI6suN0DXUdRKE
	bHqPZAqiSRaKQyLawbJh2Awrq52Kd1WvMf989x4oCqQkmjZAMIFeUdjFxQhaMI9EVi8zQ7Bdauq
	nsJS3jly/RN7WJXaGWMz3PP+5I5ulPgBo7ef7Je+TeQcoyTEbhj1aQU/Fa/VVrAfw9pYFKWZ9O5
	NTZqTK2UGjgx1IKODZcgBBOobLdEZZ76MTy/VwlKzBjmCqprHuvjUTfLdsXHWxguoL3r/dvwOn8
	D4AjH0tNVKDUk/WD3eMrYS68SV/b+svOvaMEaWuellsVUZWG73Socr7OPtyR6c780AcI0KD2ndN
	tEKGRuENpDDUhfSNV8oowAsmTherKMriwMMM4qI8UxDHDfodB1ShxSYoWtNfolC61QTUo2x3BVj
	kPY+Trx
X-Received: by 2002:a05:6000:2c0f:b0:487:342:d148 with SMTP id ffacd0b85a97d-4870d04800emr5622202f8f.38.1789592010254;
        Wed, 16 Sep 2026 13:53:30 -0700 (PDT)
Received: from antoniarch ([78.210.41.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm11086166f8f.2.2026.09.16.13.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:53:30 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v7 2/9] rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()
Date: Wed, 16 Sep 2026 22:51:31 +0200
Message-ID: <20260916205138.16771-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916205138.16771-1-apokusinski01@gmail.com>
References: <20260916205138.16771-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i2c_smbus_read_i2c_block_data() returns the number of bytes read on
success and a negative error code on failure. The existing code treated
any non-zero return value as an error.

Fix the error handling by checking only for negative return values.

Fixes: 718a820a303c ("rtc: abx80x: add alarm support")
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 5486d9d0b1e5..e4fd7b5d4b11 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -294,8 +294,10 @@ static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 
 	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ASC,
 					    sizeof(buf), buf);
-	if (err)
+	if (err < 0)
 		return err;
+	if (err < ARRAY_SIZE(buf))
+		return -EIO;
 
 	irq_mask = i2c_smbus_read_byte_data(client, ABX8XX_REG_IRQ);
 	if (irq_mask < 0)
@@ -311,7 +313,7 @@ static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 	t->enabled = !!(irq_mask & ABX8XX_IRQ_AIE);
 	t->pending = (buf[6] & ABX8XX_STATUS_AF) && t->enabled;
 
-	return err;
+	return 0;
 }
 
 static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
-- 
2.55.0

