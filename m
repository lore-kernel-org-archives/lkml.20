Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02C7418368
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023164; cv=none; b=pWT2mpM1bJftDQ3LfLwO2csmqkZp4sgp8SKU6cDn633Ir2wHJUazBnFuT7S4Oy4nMI6e+dVUKCzFiah2kNQP/hZul5ioYbinJEiFQwPMK+vhoPY/Q7la4MuLrFuhM2zPeAAHCmx3vZAM8sjqRIwElJAYCSYOV8t9qTGMBQ12GYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023164; c=relaxed/simple;
	bh=+T3SUvIdlpcApYIWZh4RPOenYo/eds0ZgRRRsx4ineI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Udps/DYqHmnE1C9TqelgqVjOd7joVWtjoWUVI3nUO8HtnXlVRfB4BpA77lz2TIZ3UZ8yOeibMBmuvU7FJsRL4XmYsVYlWjDsoliQ+pM0ZI/lR/nTmLmms8H+tQOpIABAFknUFprLqAp7MmsNy3RIW0xFFZr6p/GjeteI+XHv/6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLoKVRQT; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLoKVRQT"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c197e7e4e94so291434966b.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023157; x=1788627957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTn/4/0+Yqcb2yJiGCQLjeFpCyIkZvplKqCgdVt4fEY=;
        b=kLoKVRQTD77672gi+Q+eyzycfVY4HI3jl/phORUTdJLDEFhhScIWyIXPqfSM43BHFn
         oHEhfJ7bBvtSBWpeBMy8kR703FVjwLc3h8td9fYT8rJYZUoo7uM07Wy/2BPVPpAXGHd6
         wRLGZy5uYHDLoa5PzhuY6bvZBFdugCeiWNYHR23+5iTu1tLaBjb97KUXAzauewLBJKE0
         R3dGzrt9y6QlBcUxRHmK8l14tJ1bdYtfK6ieOKH7mDuJN0rV7SptPVdMcWeDu1WtP1ag
         /NwLV3rND/2OIGGjX43r8TKj84abW/No2l1w0uzUSQm9olGV5/hO+LbleO8BD/Hw+gJG
         D7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023157; x=1788627957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HTn/4/0+Yqcb2yJiGCQLjeFpCyIkZvplKqCgdVt4fEY=;
        b=e2HWvGOuee6awVOR1EcNSTgLgTi+CXivUBTZLWjTDIS6U9QWENuTbITqlH/8vjXpGw
         fVZSGxshXLS+rC/fJKJDxzDow1+0p7nyUYocPq5b2Z9gX1wNwhFy0xFjVNdXzsH2J7xG
         OY8zEIVNw5MXlYkV90Qml1p1yKcBi3tCxhYbtVn2A2X1eAU27N54HQkVxxT2lahboY4+
         b2NiKP4rVfkOx9CZZRcPWNZri23bCoDpxfO84/+lz78senlHd+v4b7S9dfwyL33TFMku
         DFXHWf6/EcD1VdmH+ir7tRB3XDWyKOLBDjocsr4vA1M4S0h6QsFkycZh4X1pdjdUmmIc
         eOig==
X-Forwarded-Encrypted: i=1; AHgh+Rqtnsf2JHSIOVfhmzk2MAWIYfEZXv+UQvW1GD28P/tRRvaJymC4kMxNSv+7zCgFSqmTv0UTIFtbzl7svMY=@vger.kernel.org
X-Gm-Message-State: AFuF++nE4BJNRbcEAjIPN6y20Ri9SG41cAugYa5TA6sQkeggM1rxiGi2
	fQNih7L7L1qkWdJghUx2iMyQjkB97DoEezfPoW7pMWi5fADpogEstMR9
X-Gm-Gg: AR+sD13PXkSG4Pcn+CG+yhWY+GZpVaftajJU+eenld0ULfVbLKU8PFqiZPtty7na/Ww
	Xgu3mWLvuZnLWrKMMwxNXix0gUJ6IbAK0XLW/kE12IRuwMwIpI1TYM1SoCnkY+KwO6n+rN3MUOK
	RXOntZAkd4rdGEicDWzNzGHqRuyltdkEbFsNvqAKBaPFyy28QANujSe+EqdouxE1Af7uJVnbxyp
	UnfH1iUt0Fd29hHiY7R35nEtz+7qpXPD96i5twCUIJxDc0wfznCu9YHuBNKGM9dJ5ANbsQfeVzw
	NBdiW0COZTwWYA8WeTIQh30oaueCOgf32H+gqwJCwSlVNnwpycSonOaEKoCuyXJ9/ygM8d8yN6k
	tCPyxCR4pmzflYMeO91D1vPNdnZB50zru1YxPNqQs2fbdbw9YiFfrPTXD70vPs1XH1pzRSSRgDI
	k4VXn/v+uFPDMJkGYaE+CI108Px3HIZ/wkPAvQTujXfXY4smqwtlUYdICmXCYBr5zwvCWKxxPYZ
	UEVv9RtT75fGx84GoiAjAb4lQ==
X-Received: by 2002:a17:907:6d25:b0:c20:2d38:e518 with SMTP id a640c23a62f3a-c2556c61d72mr1008446466b.2.1788023157326;
        Sat, 29 Aug 2026 10:05:57 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee288afsm213294766b.23.2026.08.29.10.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:05:55 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.de>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Tollet <jerome.tollet@gmail.com>
Subject: [PATCH v5 3/4] hwmon: it87: expose additional temperature limits
Date: Sat, 29 Aug 2026 19:05:44 +0200
Message-ID: <20260829170545.33401-4-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829170545.33401-1-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "benoit.masson" <yahoo@perenite.com>

Expose extra temp min/max/offset/type/alarm attributes when a chip
reports more than three temperature resources.

Signed-off-by: benoit.masson <yahoo@perenite.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 drivers/hwmon/it87.c | 58 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e077adbb3..e44ec65c7 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1349,8 +1349,26 @@ static SENSOR_DEVICE_ATTR_2(temp3_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
 static SENSOR_DEVICE_ATTR_2(temp3_offset, S_IRUGO | S_IWUSR, show_temp,
 			    set_temp, 2, 3);
 static SENSOR_DEVICE_ATTR_2(temp4_input, S_IRUGO, show_temp, NULL, 3, 0);
+static SENSOR_DEVICE_ATTR_2(temp4_min, 0644, show_temp, set_temp,
+			    3, 1);
+static SENSOR_DEVICE_ATTR_2(temp4_max, 0644, show_temp, set_temp,
+			    3, 2);
+static SENSOR_DEVICE_ATTR_2(temp4_offset, 0644, show_temp,
+			    set_temp, 3, 3);
 static SENSOR_DEVICE_ATTR_2(temp5_input, S_IRUGO, show_temp, NULL, 4, 0);
+static SENSOR_DEVICE_ATTR_2(temp5_min, 0644, show_temp, set_temp,
+			    4, 1);
+static SENSOR_DEVICE_ATTR_2(temp5_max, 0644, show_temp, set_temp,
+			    4, 2);
+static SENSOR_DEVICE_ATTR_2(temp5_offset, 0644, show_temp,
+			    set_temp, 4, 3);
 static SENSOR_DEVICE_ATTR_2(temp6_input, S_IRUGO, show_temp, NULL, 5, 0);
+static SENSOR_DEVICE_ATTR_2(temp6_min, 0644, show_temp, set_temp,
+			    5, 1);
+static SENSOR_DEVICE_ATTR_2(temp6_max, 0644, show_temp, set_temp,
+			    5, 2);
+static SENSOR_DEVICE_ATTR_2(temp6_offset, 0644, show_temp,
+			    set_temp, 5, 3);
 
 static int get_temp_type(struct it87_data *data, int index)
 {
@@ -1476,6 +1494,12 @@ static SENSOR_DEVICE_ATTR(temp2_type, S_IRUGO | S_IWUSR, show_temp_type,
 			  set_temp_type, 1);
 static SENSOR_DEVICE_ATTR(temp3_type, S_IRUGO | S_IWUSR, show_temp_type,
 			  set_temp_type, 2);
+static SENSOR_DEVICE_ATTR(temp4_type, 0644, show_temp_type,
+			  set_temp_type, 3);
+static SENSOR_DEVICE_ATTR(temp5_type, 0644, show_temp_type,
+			  set_temp_type, 4);
+static SENSOR_DEVICE_ATTR(temp6_type, 0644, show_temp_type,
+			  set_temp_type, 5);
 
 /* 6 Fans */
 
@@ -2308,6 +2332,9 @@ static SENSOR_DEVICE_ATTR(fan6_alarm, S_IRUGO, show_alarm, NULL, 7);
 static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 16);
 static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 17);
 static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 18);
+static SENSOR_DEVICE_ATTR(temp4_alarm, 0444, show_alarm, NULL, 19);
+static SENSOR_DEVICE_ATTR(temp5_alarm, 0444, show_alarm, NULL, 20);
+static SENSOR_DEVICE_ATTR(temp6_alarm, 0444, show_alarm, NULL, 21);
 static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IRUGO | S_IWUSR,
 			  show_alarm, clear_intrusion, 4);
 
@@ -2368,6 +2395,9 @@ static SENSOR_DEVICE_ATTR(temp1_beep, S_IRUGO | S_IWUSR,
 			  show_beep, set_beep, 2);
 static SENSOR_DEVICE_ATTR(temp2_beep, S_IRUGO, show_beep, NULL, 2);
 static SENSOR_DEVICE_ATTR(temp3_beep, S_IRUGO, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp4_beep, 0444, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp5_beep, 0444, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp6_beep, 0444, show_beep, NULL, 2);
 
 static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
@@ -2530,14 +2560,12 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
 	int i = index / 7;	/* temperature index */
 	int a = index % 7;	/* attribute index */
 
-	if (index >= 21) {
-		i = index - 21 + 3;
-		a = 0;
-	}
-
 	if (!(data->has_temp & BIT(i)))
 		return 0;
 
+	if (a && i >= data->num_temp_limit)
+		return 0;
+
 	if (a == 3) {
 		if (get_temp_type(data, i) == 0)
 			return 0;
@@ -2579,8 +2607,28 @@ static struct attribute *it87_attributes_temp[] = {
 	&sensor_dev_attr_temp3_beep.dev_attr.attr,
 
 	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 21 */
+	&sensor_dev_attr_temp4_max.dev_attr.attr,
+	&sensor_dev_attr_temp4_min.dev_attr.attr,
+	&sensor_dev_attr_temp4_type.dev_attr.attr,
+	&sensor_dev_attr_temp4_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp4_offset.dev_attr.attr,
+	&sensor_dev_attr_temp4_beep.dev_attr.attr,
+
 	&sensor_dev_attr_temp5_input.dev_attr.attr,
+	&sensor_dev_attr_temp5_max.dev_attr.attr,
+	&sensor_dev_attr_temp5_min.dev_attr.attr,
+	&sensor_dev_attr_temp5_type.dev_attr.attr,
+	&sensor_dev_attr_temp5_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp5_offset.dev_attr.attr,
+	&sensor_dev_attr_temp5_beep.dev_attr.attr,
+
 	&sensor_dev_attr_temp6_input.dev_attr.attr,
+	&sensor_dev_attr_temp6_max.dev_attr.attr,
+	&sensor_dev_attr_temp6_min.dev_attr.attr,
+	&sensor_dev_attr_temp6_type.dev_attr.attr,
+	&sensor_dev_attr_temp6_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp6_offset.dev_attr.attr,
+	&sensor_dev_attr_temp6_beep.dev_attr.attr,
 	NULL
 };
 
-- 
2.55.0

