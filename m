Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD9E51DDEE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067433; cv=none; b=kNU7PeKKjNkpB7d25lmhHUhxAy5EX8P14FWRefsJ1DEmBLEe2xWxm+TpbQnUiPV3gzU6aWRE+/4a6Bt1NsWTPDKgUtje1WJoCSx5ozkqs7Z/Pf62dMBXXP5cmQygdlVTX8PeJgvJvo7qY25haLi2SBeaXN0QGySxIwC3qU2L8Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067433; c=relaxed/simple;
	bh=X7fyX3jJFj6nyXssYOE1hLP8LJ2xvGZ+VCHua7U8v/o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dHa7oOh6UaoPzQbo+eR9T7DVR2MInKmpRQtfjJIAMPzxTLvp2yTLzNwrAmDLGveBkJzr1FEU9N7pHlIEZ0Kj2BOgEH8fnhe1LDfkRas904qI07ywlHJu5AIb9CUb1aWDdRdMEcxswpSY2bjYLhBsBYA+4mulQZg7Yf0ySrm4qZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eY+lf0fO; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eY+lf0fO"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1130210a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792067432; x=1792672232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTnyON18qZ+0nprhOL1KqtGo8K5Ak/y2VZfqrlx6jv4=;
        b=eY+lf0fOMAVDvkQGpB6KJUPbNY+csVBQ9bKIdKFIGaNFt1QEOWU/rgsnRvw6zvq258
         tQzxnsvJSIv3mNd0/EiHg9hOI0bLs5n/d4fBzOmCXXcA+8onSUdOaFYdglhkc/jnDk7h
         n6QHBJ8advfx4aFJGq3TRO/OUp2Q0MPKdYrYGPl8cczZIpakAyLU2/tzOjw2Z3P/MUBV
         n9q1Wx7KfhvI5DslK2thnElaKKqEHVDf+lWdITScPyAqR4x39fZ7+IqkmUq5WdMEJyaY
         IOPSezPeiUu2V/U+PDdqaUTv79ArK81h/If0sUyYM5aLPyr9t/CJIjl9LLeX1ZXaPOxQ
         6U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067432; x=1792672232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTnyON18qZ+0nprhOL1KqtGo8K5Ak/y2VZfqrlx6jv4=;
        b=b9RUnM5rhdNMo5celKI4+JktFPHd7A0Cl8ApqSn3gfY3DKKaYcFn8tQYAvCJYmCKye
         Pr8GDeEEzUpLhfhg0AYQcbaZlpwi84yYC4duWxlhlx/+QNHSAcQ6kt6M/e9QDLjfzdTn
         /9mJ3EFlHbL0K4aAhAOIoUNRoI17bdsdYLi+TGK7MMsu3HT5PpICNS7jNAdfeUfu55Jx
         V+tDjjsaLVinUKGjntI3rD1d3h3hflVetJp/mQpeenA+wuSQXRvUIojHHzFaasQJlclS
         nT2IeY9SbO6EY1rK5MAJG84eKcsKxUjc/2HPBtVTzmrKu8STRSGWyVa04ER8J434sFka
         8Hzg==
X-Gm-Message-State: AFq9FYJWW2lWE8DktyOZzROwgRCLS1vYmZVPm3UYOzRhM89Igisx6NQi
	Vtw+udQro4ogv8r3Du0Lu0jurW8/jbaOpgoVaR31/1Skwmz9b5H+d6U=
X-Gm-Gg: AYBFou2lknPEQ7DJtxxuF+VgqgBMcDMzaqI/iREtm21qLzbBndlCQMzZv3WGC3SCVrH
	mB8ivQiVYPOPsCRek3acDCIipDvLYLMPKgzcPNLUAlixLVjCvz5YSXRSLYj4lKMx6RgYfzuHVH2
	g4DttbEfP307JOmd6kqwu+rfKW7mQpZqybC2oQBxyAkK2ndnaN+utFCds16DPdTccJ+DIgnrz1G
	ztVwUekPnrgt30VVre8q0HQ7Cen34gUhttqvs8crM/jrQC1Rhf1dJ4NiE2IavtNjv55lk0lCgc4
	6qIHJkX/nzogfY/1Sh41bZBX3EX6pO9Z6nuR+xRtaRsLy086+7R+jZHyUOX7dqH7gNyNGOI6b0l
	djARGU8Xv1KlVxlceXeN4EfV8B0SGR/lFToLsXsH7Xp2wB7/p5/Wd2gb+Qte1FaKagBbNkQWrY7
	X9ecNKt/dIP3SIV5mhmE+CH7K4StS9BHNUwcIXYiRhTjTfOijTipbxTqVJgeSocSG91Nv55Ldf5
	XDWouL9Y+BQC8BpGpVFFZEO9eTDRfUTU9JSLw==
X-Received: by 2002:a17:90a:c88b:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3ab3ab32a3amr15057215a91.46.1792067431830;
        Thu, 15 Oct 2026 05:30:31 -0700 (PDT)
Received: from localhost.localdomain ([45.127.46.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1699718c547sm53460746c88.3.2026.10.15.05.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:30:30 -0700 (PDT)
From: Nikhil Gautam <nikhilgtr@gmail.com>
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	Nikhil Gautam <nikhilgtr@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v2] iio: ccs811: Deassert WAKE GPIO on error paths
Date: Thu, 15 Oct 2026 18:00:23 +0530
Message-Id: <20261015123023.3417-1-nikhilgtr@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure the WAKE GPIO is deasserted when status polling fails or
the data-ready timeout expires. Early returns could leave WAKE asserted,
preventing the sensor from returning to its low-power state and
potentially disrupting subsequent I2C transactions.

Route error paths through a common cleanup label to ensure WAKE is
deasserted before returning.

Fixes: c6644f7201f3 ("iio: chemical: Add support for external Reset and Wakeup in CCS811")
Signed-off-by: Nikhil Gautam <nikhilgtr@gmail.com>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/chemical/ccs811.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/chemical/ccs811.c b/drivers/iio/chemical/ccs811.c
index 998c9239c4c7..dad54f66ebb3 100644
--- a/drivers/iio/chemical/ccs811.c
+++ b/drivers/iio/chemical/ccs811.c
@@ -198,18 +198,21 @@ static int ccs811_get_measurement(struct ccs811_data *data)
 	while (tries-- > 0) {
 		ret = i2c_smbus_read_byte_data(data->client, CCS811_STATUS);
 		if (ret < 0)
-			return ret;
+			goto out;
 
 		if ((ret & CCS811_STATUS_DATA_READY) || tries == 0)
 			break;
 		msleep(100);
 	}
-	if (!(ret & CCS811_STATUS_DATA_READY))
-		return -EIO;
+	if (!(ret & CCS811_STATUS_DATA_READY)) {
+		ret = -EIO;
+		goto out;
+	}
 
 	ret = i2c_smbus_read_i2c_block_data(data->client,
 					    CCS811_ALG_RESULT_DATA, 8,
 					    (char *)&data->buffer);
+out:
 	ccs811_set_wakeup(data, false);
 
 	return ret;
-- 
2.39.5

