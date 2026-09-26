Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8C63A963A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790456666; cv=none; b=tTiVKfgswtqSpZgL6+3m326UnKpch4Pgl4S19J2aPapNKaqtjXyoywTb6zxvQWohfvTiVKJMHr6tpYLMST8oO5IsCMiabTp3eZvrlhZFXNWaETkS/TJGy4vQugLSn15nLNpdSMe3v2QJblcGbSt9waRhnV+0DhkUM9TckIzSBK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790456666; c=relaxed/simple;
	bh=+bJ/0xgrR6IyXdW1PrHwallq2F6/vZBV5HqvnJdLVA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJPVrPOFxfm/xFJet951URO3Dhl9C+WJCZU7Cu1G+M5dfLCydmzDV5jK1IY8Fsyd8ORihuKnKzBPwq3wUFpo/y/HhxC5pZfL1krqfmbMwArspOw9ER0vIcrqykDDu5HJ83sHEHm05yQuV4LWpoTx0JEePKHfJCTQki5s6L/zdSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+HS8Dif; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+HS8Dif"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144fa6e60bcso64545c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790456664; x=1791061464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbJiVKrqsrKfv2wmyQ+2gcMAcTpPklQb6GMKdaTstRg=;
        b=d+HS8DifsEIpMqispsCZmV7I8JByAFh85bOIC/PsfwyvBU70JF0zESyr2kmU44q362
         6rEwSrYUSo0xWylrKPOhuXEtI3n03xldYsNTWH4aEzqxLXCoF16cC0DQFQgbFNHEOfTO
         Yb7jcjfjMB87Q/1rtLQzpc2jdwaBNoVyrn2B1Ws0oJuYTkQbwLHUK5pklTNyCEPuPv2c
         iVD2CQQRi7f5kLQrc1JwQi4xqE6tvpmKZ/g+fcNhQViv1KFo7lV1A9XCfjBJJ6PQNLur
         hdMwQb10hgKyeYCuwiXZybRtM8QlN8ceQIV5iUbMj5nrB8h5aDeOCNtL3IZNIxTgDOM8
         1MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790456664; x=1791061464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbJiVKrqsrKfv2wmyQ+2gcMAcTpPklQb6GMKdaTstRg=;
        b=ppUmv3O6+dci4mml5DhmbSr3qlZpoTMk9+TIVpl/fGiq71StLOnpGJ+zCENpFq7hEM
         nMmixOecNJ/wwkxENvIZZ+NAYrDc5xytxXvZ6N+7Quzd9lNrqC/RBdjAUhqabymo5X8S
         2eS4ZIEQ5KYCtsOgeqlOc8eoJxREuWW9Hp1Fv2JfZ9Woh0F/6wICX3JcA345ngO3cGkZ
         d3WPIG3XQwtc7BIE4ws36XEuOnJSRv04yM2JbJreYBCVlTNjhK4jfn5x99cITljNSeBl
         n3T+cfFsqynuO45EMmHee1+b0bu5XqpsEMlJhQdhxmX5sH/eZuTe22tKoQXfMOr4Ma2d
         Le+A==
X-Forwarded-Encrypted: i=1; AKwUvBz50cg0l6UZyNfLL09t160ou7FK4MD32GR4zl6PpN+Woa12vOmh/EUHMSI/J2FgJ7y9Mop9SNwuwtIMCK0=@vger.kernel.org
X-Gm-Message-State: AFuF++nULFd6ix+cLTAxDyFK7ztzaPsqTYa+0h4ZCgFp6KkPhDRJwTRs
	jOzVYdaJVZHg77gTcrGf4Cc94IXdnIJytbue2pvIHpRpx86t04kvrva/
X-Gm-Gg: AYBFou0lztxq9EJf+SmGptzUeh1XNwA8hh/WXTHL79b+C5X8CL0ghnLE0KuDZu9k4no
	psGf2y1kcpBtSayppRbH1z8/zNlprre9ywspDWX8ahvMYghQbDLj8EMWorB0eMJStALLTsiAg7k
	4hapmbnEpjfGzvLCBzTiM81PCF97mY/RUGcrrNsZbLkohtC/p0Yamoel4FnBFsJ1pgc5xORfkmv
	dWa12TpnT3ta3ooiMXv7KYO4bjdsJh2XrZLH0treCp6t4lvobMpiQwIF8kj7oOTnsdir2TYOZzI
	fld1WoLcnVylIfAHmDU+mc7+GQC4W4P1ToqG3zrzYIjOm/E/HPeJ/saN1y1ipW1F+bs81FmaOwX
	NVmApXP7hPre46lRKfrE6cKQv7z8gVRZEUVH3OXYa1dmkvA7pazcf3EWVsAWiW/GYpA107nv7mC
	e4EXhip2OwzsIVVJw/rN8O7RNN8usq+CjmGkI3t5cz6nP6eHMbQn738tM/LgQ9nPlCKOX1XftqH
	WKsYfR5enuTw8KjePe/m5WdoYT+Ftma/p8vauneGCCnoOuVvnd18dyahDML8OviUZydADf4RjK3
	sxeJRIB4mBhDHltvvAr4I1BGuMBH
X-Received: by 2002:a05:7022:1504:b0:143:858d:fb0e with SMTP id a92af1059eb24-146caf2aafcmr7364687c88.0.1790456663272;
        Sat, 26 Sep 2026 14:04:23 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm17435185c88.12.2026.09.26.14.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:04:22 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Charles <hanker007@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>
Subject: Re: [PATCH 0/9] platform/x86: lenovo-wmi-{other,capdata,helpers}: Improve robustness on buggy firmware
Date: Sun, 27 Sep 2026 02:34:15 +0530
Message-ID: <20260926210415.3465939-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on a Yoga Pro 7 14IAH10 (83KF, BIOS QGCN35WW). Neither mainline
nor the series binds here. This firmware has no
LENOVO_CAPABILITY_DATA_01 in _WDG at all, so no component ever
registers for that match and lwmi_om_master_bind() never runs. Skipping
the match for GUIDs the firmware doesn't declare fixes it:

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 805e36ef7..d64520be1 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -76,11 +76,13 @@ enum lwmi_cd_type {
 #define LWMI_CD_TABLE_ITEM(_type)		\
 	[_type] = {				\
 		.name = #_type,			\
+		.guid = _type##_GUID,		\
 		.type = _type,			\
 	}
 
 static const struct lwmi_cd_info {
 	const char *name;
+	const char *guid;
 	enum lwmi_cd_type type;
 } lwmi_cd_table[] = {
 	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
@@ -166,6 +168,14 @@ void lwmi_cd_match_add_all(struct device *master, struct component_match **match
 		if (lwmi_cd_table[i].type == LENOVO_FAN_TEST_DATA)
 			continue;
 
+		/*
+		 * Some firmware does not declare every capdata GUID at all, in
+		 * which case no component would ever register for it and the
+		 * master could never bind.
+		 */
+		if (!wmi_has_guid(lwmi_cd_table[i].guid))
+			continue;
+
 		component_match_add(master, matchptr, lwmi_cd_match,
 				    (void *)&lwmi_cd_table[i].type);
 		if (IS_ERR(*matchptr))
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index e6c8f6bcf..b196e9926 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -1704,6 +1704,8 @@ static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
 	lwmi_cd_match_add_all(&wdev->dev, &master_match);
 	if (IS_ERR(master_match))
 		return PTR_ERR(master_match);
+	if (!master_match)
+		return -ENODEV;
 
 	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
 					       master_match);

With that on top (built out of tree against 7.2.5), lenovo_wmi_other
binds and exposes fan1 and fan4 (min 1500/1800, max 5100/5400, input
matching the EC tach fields). fanX_target pins both fans, 0 hands them
back to the firmware curve, and out-of-range writes get -EINVAL. With
the change above:

Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
