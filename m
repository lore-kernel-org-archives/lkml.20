Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231386;
	b=DnNwGSecZ7twU1GAGZQRuj0KAQwfKTCNeyRhscVXg80If0/2gcYUC/I+oXjhCEdNBrr5
	 oe1Vd3UiLcPx/zP2TVH4e1dXKh8QEJFFMcEHpjBURf4OtmLq14T83Ci6hYz0DGOm7z3yo
	 xhufrViLVuRWqmA3X0DEwBccSyA7xYvSdEYHJNLPzdtIXaKkkFaleLoCS2C+RzUFdmsKF
	 namqMKnW1FF2Q0wWx3O42jfvJX4UDzVWLBDi0u7m+jJB8FS+pegUG5xPcfqGybBceLZWO
	 18dNhSOJwfEkcWl0ANT3y8tmMCGRCxMsWRHb82bdjqgBeAsAUaRIanXGDJPhOlvasWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
	b=aq7cIEhtDwT0bapyXhOEjTHGAz8pntAcXAkIH+nU6R49tjnb1PqpRmY/cZTrNV0gC1Y9
	 ZlhAWZKK94Gg3sEaBmFzuK4eMJOXpSbDZG3wmEqaHbPK8LAROLr6QT1hIi7GwmM6VfnM9
	 NsrBuPpQ76I3mRLSWxuG81QejL37dubMDOdHNq5Ul4MmoOLPzkN1812wWTso9wrFNMZQK
	 s2kqTz1hScGuDbdDTBnfWErWssBJ6k2d3fGSIyWQ1xQ5QuC97sRC5z7ULo78xswlGTAjj
	 QinkT5jjCQtBEPSeY02AhvmTK/Xv5BULmVcpMjuZD0+DoLNOEYX25gfa/ss3tR1aMPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=sUUp0mG2;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BF0606D837
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48BF0606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=sUUp0mG2
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so9150235e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231385; x=1794836185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
        b=sUUp0mG2OfFiirYB6xi8lOydYp4xle3zPAln9w4HdCrN3J4okLz1nWn5EDlM6lwDlU
         l6h65q3Wg5ynodvTl7mLikO8RG2xDMZ+BHVNf2nv7OtYlAJuu0IvGwZ8FuS6dSpBpKoS
         2sFPkakXCzQ4p34N1pz5vP1Hs3L9mKZWWF/WusOZoezW0i+aqGERe/ykVRz4vtzLEvwI
         e7QGD/zBGbNopxFFfHyDTgZAGQtFnttBpnXkpPiQQ2voAEgJf+4guZ9rbCR8KhjZfchm
         duZoJniz9opJ7M98SuxTAbp01luNCLQvsjkZUKO4D2FO7q4B5oTl8tkEGrGt/agT7LVM
         0wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231385; x=1794836185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
        b=eZJllG2m6pt8t8NdFFBc0/bPYevktLdJSfSxpJ4JcspVr6iAC/QTsNJKu7CJLrGHo3
         4I43usoMHZxY7dqUnE0ckXzHefVdzGkDZehiUAoVeAxEgJtfl7HzLGWEuQhZLkMZOp9R
         AXb2tt03EdZKYZYRJgD2ZHAX03FQQCXTmIrG5J0IiEZJjnQryEdvc05mwI/tm/5+w4wS
         l1gFTwqKK9VLKsZ56/ZWNvhpGp99mw2fuCsoRt2yRjQWiQUvdL98GgoUS7V8aL5G8o98
         7PycmR4fc9+RDvRF4mt9cnRHV9+88kMV6tyvXED/df9YC6IR48vj49+LYephZJFzL2Qm
         YZ+A==
X-Forwarded-Encrypted: i=1; AL+hErFVz3WAK2z25sDkR4zBuIPZVdnZRUpsOGehMgYgXwKO8wEOEc+q1/VvQsMCKmZo9cNiiUINgUg8Nf7o8ik=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pn+4qaUZybfzESV6ASM0m9T2atPM9TLOHi9c5UyzHWfTbyh/T
	ThKpEsevmmJnotr/pdPkPpDFCeF9pGj+fgeXZYyQWyqQWH3rqHlGuOaLmRZRItsV81A=
X-Gm-Gg: AYBFou0xfKStubv7CqVCSMPfaDd2MFDuV8c2KtBc5DzH7ct9ZBoyFw9NOKGm5Tk+sGN
	eHgBoOxUMtUn5rVO51jMGkM59rXdKYDZTD0q4H6l0I/oFEvDncrOuIqwC0wQnh+OIOZ78avoyyw
	od7dN9AVbWaisXsGdGHJhYpthHWBMa2Wbpi4RyePIvoTTW/Sg1xGZeJcCXc60nQgPHOYZS7UC0e
	lW7tsTVbhf47d7g/LmsFd3vPcDslbBUbdMyEBElp2MxunonFIPngB8jx3bDB3igd9Jgy0e9imPK
	vNYYi0PF6jpcJ3q30uGrmB+CM4llHJs4DmqrQxVzmCqhR65CyVeZc5lqEHPpsIUrC0jNuyeGoiQ
	GXMzHjOUSOPM1/YBjsJv8xf71GLMsM/Nz5CVzhKx8YDapX27sk45O1Totxa7QELgS+gkfjuLxEp
	Zg48rdMflJPcQ5PMLZxZzQLmDIGftxJH1ZmFlBoeA0EoRHHXlH0xdtFSD08vXky1aRGIg75+6kF
	aR7j1ewxkGEWE6R4teA3muv7HbfB4jHlR0yjKDKV0eL2xPNYPv7UGLaUkt+eOqMej4vwsm+8VuA
	0JavN6bJsMvC7tx8AHQtM59BpfYAS46LRkfAODqv0Wik4dMBsJMYfjTAfhCK/VraBYKNHYA8oq7
	ppL85pHNzQZIp/wCX/vTngiluUyRyxH4sCWER0lnn/hjvUHDcNmmm7ESNZvkEq/BNSbrXpBcWui
	20E+gdWop4H0SJNh8UmryNzGg9jg==
X-Received: by 2002:a05:600c:a312:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4b94d7632aamr58126985e9.2.1794231384302;
        Mon, 09 Nov 2026 05:36:24 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:23 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 2/6] hwmon: sparx5: separate temperature reading from sensor dispatch
Date: Mon,  9 Nov 2026 14:35:06 +0100
Message-ID: <20261109133609.810876-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
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

Move temperature conversion into a helper and dispatch reads by sensor
type. Preserve the existing temperature calculation and error handling
in preparation for adding fan monitoring.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- No changes.

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

