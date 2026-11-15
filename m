Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753481;
	b=MXGBwCNgbemvnWKUq6gsWy0g07k5LKTnqKKhjfP8Afb+3PkzEbYlLUJ8H2usgjDaL/fX
	 LK9u1tMg1XQOra7gxx7byPdMBnvIOW6jXEN3lZI/Vpb83qCqnJB6y00D5XMwsfTDtrhPN
	 QCJLOSr8EK862D9IHjXg2vC3/KG0R8I2rfEcbL+fQkVk1M7ueWYTVuJ+EdpTGQzw1SZUa
	 BKvy6UlTjPmZlprPeKrZYkNxvOAjbneDEPUWCyDLNt+A5UdTiD7onc8eX+gKW4Z3kUYmJ
	 JzLdfc9W/xYHQODUnjgG1S0fSou4LCwGDfVi+JxGb55Z3VdkewMUQFMDrhNJl7h/WuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LpSjIj8pKJ9BkaQaLlGgGcKivjXC6GF5pWFS+e/nTfQ=;
	b=4QItWLfSMpNIVM4d3zMf+4e/IT7ki0PnQzFUA+On6k6OqlTcVenvTAH6Gc5AhgaUwJkb
	 iV8qc836hrEl2pKMnRSCyLA7mE9djw55k6RS4f9cjRSOesDsTRpZHOVq6jcDAlAR7ohib
	 Ln1ppR30ruEWtavwdonpopgK2IDcmVOrFJNzEgKC8TiibMBKJeJft2/lcQaQIkWS4sw72
	 JT5O+MpvUvOrKsG+UEfoffSuG3KsTd6I6L63WckRlb9bjd8lLBzJ9/FJD1udt4Ew+Jvhb
	 U9tIHKQxg1QQ7oifjiPUfiOkNGtQGyZNh2AOkVpc5fdPWRJN8T36rEc4X8xgcZWB7aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SA7w7fjj;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC2606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FC2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SA7w7fjj
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so792445e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753479; x=1795358279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpSjIj8pKJ9BkaQaLlGgGcKivjXC6GF5pWFS+e/nTfQ=;
        b=SA7w7fjjruQZnf4O5mdcIdBHyaqX5GaOq4CquECmWjYzqFCzAZD4IGGfm/ivxkzNUt
         RJfnocz57Jma8fkQsD6xB8yEDIQt/+555ogJpLLHFwBjxq9t547frWhbrGtSkaoPzq5p
         hAZ40tR8I0/eiVWnZv17F7p6RgHqVYtinebAcdLGeWrnzC0DpaSJqPbNk5bBq35pi4DJ
         qvZH3qG+xylsYGOVXzMFZMKmxdGfNbDAyb8daZVkhmpzzW/TXNQ95Bqr1O02TvOpIOe9
         Un2VDrhtePUTYi8C1vfTepx6SMkNdI0u/cEeNfA8TMyyXYFBIRLwQbVIFGDj8DwQju01
         +mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753479; x=1795358279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpSjIj8pKJ9BkaQaLlGgGcKivjXC6GF5pWFS+e/nTfQ=;
        b=dEVJq4t4lrHYPJ2BpwxnIOx73bs4Z/CWuJvKrtDz+uodpTflfKlyEeFGz+HYl8gDPm
         TLJN60X7TeFg+BxnSsNP5OFN6POsPyZLe8pM0lIyJOZCuJnPCYqSmRjcB5/mtPZU88Tj
         9GZeihhKXKrqRiTW+pmc/IXvWjBOqxYtiKqVRP87irIPFdUK2u75cQBwF58VbqCe1o39
         ZjJgxBXdr6r/F+/vGSsyv0a7vBrxgxjvf//2vJSDsx19oAE8Z9k5IiJe9dnzNLxAXONk
         +YLCmFtZHTOKNuVYWCZ699U/fYiuPVgz2y/lAaoAoCDDMiJ/7pW9rSoCqFJQcARCEzKA
         D02w==
X-Forwarded-Encrypted: i=1; AL+hErGtlOG8+tFRC+dtR+62sjfuP7u1dn84Tz24Nkl3Cm+eiHxCZtlApWN+P11Vy5K5UYTIDgkQkdt9Q1bQQaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cO/IK4gbhbhoquaQfAs4oMnW4nzqfodH/Y4RKjd6Y3WUbDOVv
	pT/aRlu1/ULjmb+zQTWjzVvxEKErIWXt70FSa0YcqWBWfX9TqDP7+ahk
X-Gm-Gg: AYBFou2GQ58D7Gg2KNYutEAu8RaCXa/Ng36w79W+MwPwirXog7rf1NhK5ErU8ZJIudJ
	wKjqlDIedqhBWw0HR0/mH2oiZ8dKlxiW3FJf5YOf04I8FOuAySzES9hGmFWFypWwEmNeBwJC6yk
	5JN1ya7H66ma63lacks3yJ/WfhwwR/WGIW6UT2COnMs2UdQe/+FpiCbXDX+ZskGVpyg5SQo00Ag
	5B5gOuWEhqdRdnd3NMue1OL/uLX0dtp5epUi7GCAkG0kQQL10BdXJKpj9rIa2RY+46BQ6edtLBu
	t7DztP45PComKTyqSsDEg4m0g38smy5wJ//lqoHfEUeSUlYKm8abkdAtiRLZ3zzcef5O9UGZH7n
	VxDbuQeTn+Fvd2DHOc9gg972HZoo+eKb95CduiVDEWfQLzABz6O2Y37EBMFHnmEe0kOp/tTVq7l
	aYZ293uq0dZv7eQOz89K63GjucYXUPaLoKHPygZBZJYuqlQ4kGPYQI0wLEMH2XNzgVTidw12YvX
	+uC+bwlixKALxk8mZJbPB9/jKfsYaQtREaLMXqi7eVFKq0PvI4aMQsU1xjxaBoKhMjGb+ak62zY
	A1Q7SlSuwmbjv0oN+HqaVHRpqRskPxPxbvcZqzKxfjH+xJSias4Pt+Svms54Ne24rtXcO+aPcb4
	H6BSNx03EUPcP/9I=
X-Received: by 2002:a05:600c:6099:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb55a753f8mr160792155e9.18.1794753479132;
        Sun, 15 Nov 2026 06:37:59 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm196174025e9.4.2026.11.15.06.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:58 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: John Roden <jonathan.roden@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] hwmon: (asus-ec-sensors) add ROG STRIX X670E-F GAMING WIFI
Date: Sun, 15 Nov 2026 15:25:40 +0100
Message-ID: <20261115143708.492883-4-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115143708.492883-1-eugene.shalygin@gmail.com>
References: <20261115143708.492883-1-eugene.shalygin@gmail.com>
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

From: John Roden <jonathan.roden@gmail.com>

Add support for the ROG STRIX X670E-F GAMING WIFI model.

Signed-off-by: John Roden <jonathan.roden@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index b3a061bd10db..fb7704c46d8b 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -50,6 +50,7 @@ Supported boards:
  * ROG STRIX X570-I GAMING
  * ROG STRIX X670E-A GAMING WIFI
  * ROG STRIX X670E-E GAMING WIFI
+ * ROG STRIX X670E-F GAMING WIFI
  * ROG STRIX X670E-I GAMING WIFI
  * ROG STRIX X870-F GAMING WIFI
  * ROG STRIX X870-I GAMING WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index d86f3614d557..d0c01b825377 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -822,6 +822,14 @@ static const struct ec_board_info board_info_strix_x670e_e_gaming_wifi = {
 	.family = family_amd_600_series,
 };
 
+static const struct ec_board_info board_info_strix_x670e_f_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_T_SENSOR,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_strix_x670e_i_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 			SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
@@ -1035,6 +1043,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x670e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-E GAMING WIFI",
 					&board_info_strix_x670e_e_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-F GAMING WIFI",
+					&board_info_strix_x670e_f_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-I GAMING WIFI",
 					&board_info_strix_x670e_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870-F GAMING WIFI",
-- 
2.56.1

