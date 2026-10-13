Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7134E4300
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896272; cv=none; b=r5zQiurBkvupdshJGCDOpiWtARYD4L/Du02mHaP/+rcMifaGjWu0Cev/FYwK8eT39q/UcHnkpzBsifdJ5e0NVgSSkRrURlPLpp6ldhEgA0oDKoMElqZXMdUq5WvI9QxXC+gv27PGt9hFxF1mQNW8O9A6JMfErARjkKiEL8zRy/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896272; c=relaxed/simple;
	bh=3GF8ccrJ2E7j4uN5tjI8S9AApC9/OI47ZxEUXhdNQ5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=te2HKpsXy3XyCKEGwKB3OynIVabPTIpOEx6Nc0Y8AbuTyp15Hqi/uX8KTs7PmmKzWJmTiBmEyml89/75hZnWcCrxg6xcutIC2HOOxtaeZz6J7giP1AkkEiq1StfPwjTujCKbCWn5CrBH2QSor9Cx4BiHO4a5wKHYRLb1QCilrVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=xiVmiPVw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="xiVmiPVw"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso385896066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896269; x=1792501069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nunSQ8CQNv0JezPiian0cV99V25mrgz6BvoT7slRlb0=;
        b=xiVmiPVwxUa1zJvo/e0Q7CS+8X4bwk599NOa4fh6Ug/D522+oHPeIOA2tYA6QgMgrg
         oPG/e+hyosFyi3cYXrrruQZ0WloNrWmQOMjXbw4qf+L2gwk9hTwBOHL2tm8kVdawYq9Z
         MCwmYyv4plNMmZyOGRFrQOq74q6FcJs4hEAz2JmwKYAl8YhO9yYyPRw2hm+C0qIXkWo/
         rKtM5JH2bgWEmnYjtTMnw7MVmlfTaj6HQKdZl0LfEDSgJMGrrDDenZtKaw0BjT3KcMJ1
         L/F+WhaH85g1/GWTXwxZjCRD/UGp8WmvucjpL1y/s1JQNqD3JjdiI3fbX8jXmpo6Dgs9
         9EUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896269; x=1792501069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nunSQ8CQNv0JezPiian0cV99V25mrgz6BvoT7slRlb0=;
        b=M8vhZpjxDR3+YuaJ3HTt0McONRhIUHF5vYH41I1fqQWaDjxVm1NB5YW0E+v66ZPCUO
         ExNs7DJEHmvTcW70Fk2Hbxf5tX1jMW0jGQORsfGDvRvwsNAeBkfrUcnNWEqrrQWXZIwl
         56rQVvDAliy20eJB5H7pvXxVKeBMaWdGx/5v+8Nb0KDdongqb3blHK9CBbY2SPWWKMIi
         jPuqiGO3WcL5cuyYcpuU+Tsme2ypgc3IZENqD23q8N/2E4bCMeQ6+0NihyHmCYSH6kPe
         8Y4PIsiQye+xCPsOX+xi0pf0wVEjTGEONzS51aOOfOJhgUykKoArcjQBsFvdCfYfc63G
         wFIg==
X-Forwarded-Encrypted: i=1; AKwUvBxETAup0VKRFDyM0TRIKhkM+Ntrj2fSTpW4OPXAtGyUBPmb6rq38CHkc52dQmVHCRC+mSJx9IGrkP1OF3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAY3HicG5f78WdIl4GszTtx997/TRKGnsHXd5/kKHq4TYXzmwj
	QVUEz6RaSmSfhuYcv1q81LNJL5NeQjlhY56s+brO3OaI8pijbDlw+PpXYuLk6n6aLqY=
X-Gm-Gg: AYBFou0Rwknf8B8Y8baNUbZJAO23f4F3AS9zbfIofMbjKM5PkSwFgV7m4e3cmzTaCG8
	9sXgJVluVA984Qm1tlLL+20+W8h9SGusDeKk6U7OR54zWxkLeGSurzaYiPlJHSdcSNMK1FJ5tDU
	cevddxzcqc3PIdTEtmG1TrQKmkwpdNVRY7lDytt6B3gYAznIwPVQYddpBsNhkzq490JqAVU9yv3
	W8uxAvMIGUQA8iln31O/qq3MSbsqrqPcX48bauwvP63yMhLfOkKp8QZZbGbpgDsrj6dQci74mMm
	dkE2j6ER291s49b7GfTG/a6/XHOrdPfaYldL9f/J6pRw4SZL16dIu0MbWFylIsGFwqU8KEWYHjc
	TXigOI7Mozs8DKvu+NU3jNqNQ76Xft9LLkX0qt8QU4BLSryta60VEpdD+odmZKnutBwHa/uS1wD
	NZ7+OWwm8sa7gb7rfXxT1M9oDP6BtgtRieBmXpt7QD3d085ZFM1vN7fOtxyTnMoKWZ7FVG4MvLK
	cuSW21MmY0YVkaliURN2LQgTK/Umlpy9peouaPWoUguHOGYjpT/8rYglXzBQkefAVQ/2qOqfgY0
	gDt4OMrgFmeriwiIo5Wy0Gh1vSaqiII=
X-Received: by 2002:a17:907:c317:b0:c2e:62af:b6f3 with SMTP id a640c23a62f3a-c31a9afb29amr1158692166b.15.1791896269434;
        Tue, 13 Oct 2026 05:57:49 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:48 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/6] hwmon: sparx5: separate temperature reading from sensor dispatch
Date: Tue, 13 Oct 2026 14:56:26 +0200
Message-ID: <20261013125735.1542349-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move temperature conversion into a helper and dispatch reads by sensor
type. Preserve the existing temperature calculation and error handling
in preparation for adding fan monitoring.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/hwmon/sparx5-temp.c | 54 +++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index aa91780737446..0fd5c147f8167 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -37,38 +37,46 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
 	writel(val, hwmon->base + TEMP_CFG);
 }
 
+static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
+{
+	int value;
+	u32 stat;
+
+	stat = readl_relaxed(hwmon->base + TEMP_STAT);
+	if (!(stat & TEMP_STAT_VALID))
+		return -EAGAIN;
+	value = stat & TEMP_STAT_TEMP;
+	/*
+	 * From register documentation:
+	 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
+	 */
+	value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
+	/*
+	 * Scale down by 10 from above and multiply by 1000 to
+	 * have millidegrees as specified by the hwmon sysfs
+	 * interface.
+	 */
+	value *= 100;
+	*temp = value;
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
-		   u32 attr, int channel, long *temp)
+		   u32 attr, int channel, long *val)
 {
 	struct s5_hwmon *hwmon = dev_get_drvdata(dev);
-	int rc = 0, value;
-	u32 stat;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		stat = readl_relaxed(hwmon->base + TEMP_STAT);
-		if (!(stat & TEMP_STAT_VALID))
-			return -EAGAIN;
-		value = stat & TEMP_STAT_TEMP;
-		/*
-		 * From register documentation:
-		 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
-		 */
-		value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
-		/*
-		 * Scale down by 10 from above and multiply by 1000 to
-		 * have millidegrees as specified by the hwmon sysfs
-		 * interface.
-		 */
-		value *= 100;
-		*temp = value;
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input)
+			return s5_read_temp(hwmon, val);
 		break;
 	default:
-		rc = -EOPNOTSUPP;
 		break;
 	}
 
-	return rc;
+	return -EOPNOTSUPP;
 }
 
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
-- 
2.56.0

