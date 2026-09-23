Received: from mail-dl2-f33.google.com (mail-dl2-f33.google.com [74.125.229.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2404047CA7D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206928; cv=none; b=fUny5CqtaC6V8TTWHVzeDs18erT3nVSrjGQXud85hV1W3oMm0aKtorlVwj7wbLt4eKAyifpEV98/IcPOTCGDjnoKVB0tqhJM+RFC2gWJsfrOqmEMF0e3fMDG1RPWDnMSVmJQH3VDGKP53f5ZvnjBSUUs68OOh3EnVH7Io0typl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206928; c=relaxed/simple;
	bh=u9MWO6G5WgY+wqpwg5Usmi42msdZA+YxJQLgulJg7+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNU0Og5GXTFbQYVpUqyNt9mH1tXv5uweGJ5+WXxc1N27Vh61xI3RTZ44bdjFYsomXlmX4lhqTBjPA53v1xAEO59pMGwFG6JywAdziDljqR09dk0p6hLPRynX0Y46wf6VwGgZ3sgAEGtHWGp9uENTWD0S53strnOrg6soAh2EKAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZmxxA3P; arc=none smtp.client-ip=74.125.229.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZmxxA3P"
Received: by mail-dl2-f33.google.com with SMTP id a92af1059eb24-1438e88300cso1038921c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206925; x=1790811725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3WhcGmivvTRyeXr5ABFsXDjq+w53c7qwY8p1nmGDGk=;
        b=EZmxxA3P9llkwhcIVMKIgM9HEDzfMmC1AmVTgucsWnGUhVlIGXCJVarDCaZQdepr9T
         G2C6QeaxLgM9cIQp8nmYgqmJ14Dd8ax2ckGJABWlak7khCLAf4/dGcbvOxUNQF1R/MVS
         iS34v7pxMOe4EC/coYPv84JC42i0i4OoyelTvT5MQjXHQm5NX+QhciriQhQm7aUV5iJR
         gjRCOHJj9iA/zPsUDEzYaqYQvjdhTA4hvs+B8UJWUUIX9SdugxWBX+WLotvr3WL9/rdu
         96kOOl5cCCJXg+Rs5g2P7PdoeR4gBfZJvrvdSrJLVw4FAtEjfKwQaVESsNQpndgX4rin
         pLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206925; x=1790811725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3WhcGmivvTRyeXr5ABFsXDjq+w53c7qwY8p1nmGDGk=;
        b=mC8yx4EXpju8dj/86pmEYXiI+jCNWObc9qQQAtpJQfC6L+DomlEPsYo12yuAfuZOKE
         xjUuzfld92qAqpua0aS2OCt3Qygm+twAfjx4/hhZdq78JJhTfPFr3I3J1IuwK5zlA/Q8
         IOsUelm1E7JKWLyOzQnf91YaoEzgDMc/1LUo/w3KlhdbE4iLwRvHEKccL9T9Oxe0IU8t
         jUrY0OK5IQQh1B5V9II9ItLLoYJCCRWrUTq0um0mLbL8PHy/mq+UqpwBdsOS5cNgb8xC
         5FG3lnMGJCZ7AHvETCMM2HDvggbnqUHlfroz/9DqzJdHyzBRq4e2XqCUu5YgRPWLw7xH
         4mwA==
X-Forwarded-Encrypted: i=1; AKwUvBxFjdM0xXbEsCZjuM7+QUhJTmftkvrULNw3pEm8aoO6FkE+SAl85zZFxN1hqsSa5bOpNAEUIKCPGd3oQ58=@vger.kernel.org
X-Gm-Message-State: AFuF++nQr8FDSHOPXVALGT/h889Se3+JLyQyjIkdByFjHbFHYt8HBO3z
	lZJUBuYB5FnU9kolRZFB1/uC2kxoKsTT6fCyNTJLe5ktj6JatxhKxU4N
X-Gm-Gg: AYBFou1RluKzdMz3HU0Wew7osrJWZU0ibwfPi9gsupgVgpQrkOudFDUCUFbdynt7ZC3
	oE7xIcFSL7hpHN7qVqLp+Tkb71Suy0XT+mZDS/rY7DepaLgdkE1m8hpyJkUr1ZzuLyCs/NP5iEh
	eutSq4dqfNnIOygO9S9jbAlUr/F2cSKxr9cyicyJBNIguHrKAk4J6uWyIAFfN8Ik9hxMB3ycI2/
	M4oda4bLN7989JCL9LZhUBNKxiqxxnEz60b8DKciXt7gDNiMTpcfGltledR9/XECNlZHfo71Zmo
	sNFLE081wK/79FFxWufWL+G9Y0xL4BNE94ipjqYhVEtf8AIHzKFByXlzvz5M9yoV+RqZ5+EItyo
	MnwdKw6+jCH4o4nWQSIIBwlTqvqrSc/hxBEAczrVXVr+G5fXfoMpMROJGJqUHuSHKBN9dbeEhDz
	zKWBS+y/sdsXd0ZAM9UP1UexIRj4qFFRqxsQoVnmJGL9v9eCQC3ae6UfJ4fLLYctayzR+duBhQD
	qtYBT1CD2IdRJFZaqc/LNNzPrFpCjkbspLiQ3z17cjVveM=
X-Received: by 2002:a05:701b:4586:20b0:143:7001:7645 with SMTP id a92af1059eb24-1450401c5damr430174c88.47.1790206924708;
        Wed, 23 Sep 2026 16:42:04 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm8100182c88.4.2026.09.23.16.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:42:04 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v3 3/5] media: ov02c10: Split the PLL registers off the mode tables
Date: Wed, 23 Sep 2026 20:40:58 -0300
Message-ID: <20260923234100.318151-4-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923234100.318151-1-calliarifelipe@gmail.com>
References: <20260923144257.119076-1-calliarifelipe@gmail.com>
 <20260923234100.318151-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PLL is programmed partly by the common mode table and partly by the
per-lane tables, which override 0x0303 and 0x0305 with the same values
for either lane count and also set 0x0316.

Move the 0x03xx PLL registers into a table of their own, keeping only
the values that end up in the sensor, and write it before the mode
tables. The PLL settings depend on the external clock rate rather than
on the mode or the lane count, and this prepares for supporting clock
rates other than 19.2 MHz.

No functional change intended.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---

Notes:
    Changes in v3:
    - New patch, as asked by Sakari.

 drivers/media/i2c/ov02c10.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index cdccbdef3..0e5010303 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -89,12 +89,6 @@ struct ov02c10_mode {
 };
 
 static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
-	{0x0301, 0x08},
-	{0x0303, 0x06},
-	{0x0304, 0x01},
-	{0x0305, 0xe0},
-	{0x0313, 0x40},
-	{0x031c, 0x4f},
 	{0x3020, 0x97},
 	{0x3022, 0x01},
 	{0x3026, 0xb4},
@@ -303,10 +297,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_1lane_setting[] = {
 	{0x394e, 0x0b},
 	{0x4800, 0x24},
 	{0x5000, 0xf5},
-	/* plls */
-	{0x0303, 0x05},
-	{0x0305, 0x90},
-	{0x0316, 0x90},
 	{0x3016, 0x12},
 };
 
@@ -330,11 +320,17 @@ static const struct reg_sequence sensor_1928x1092_30fps_2lane_setting[] = {
 	{0x4d0d, 0x00},
 	{0x5000, 0xfd},
 	{0x481f, 0x30},
-	/* plls */
+	{0x3016, 0x32},
+};
+
+static const struct reg_sequence sensor_pll_19_2mhz_setting[] = {
+	{0x0301, 0x08},
 	{0x0303, 0x05},
+	{0x0304, 0x01},
 	{0x0305, 0x90},
+	{0x0313, 0x40},
 	{0x0316, 0x90},
-	{0x3016, 0x32},
+	{0x031c, 0x4f},
 };
 
 static const char * const ov02c10_test_pattern_menu[] = {
@@ -601,6 +597,14 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
+	ret = regmap_multi_reg_write(ov02c10->regmap,
+				     sensor_pll_19_2mhz_setting,
+				     ARRAY_SIZE(sensor_pll_19_2mhz_setting));
+	if (ret) {
+		dev_err(ov02c10->dev, "failed to write PLL settings\n");
+		goto out;
+	}
+
 	reg_sequence = mode->reg_sequence;
 	sequence_length = mode->sequence_length;
 	ret = regmap_multi_reg_write(ov02c10->regmap,
-- 
2.55.0

