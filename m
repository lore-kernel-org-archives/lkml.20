Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794068669;
	b=jb60ZsLcah6vLMCoAW1eB8cxlvBzEENu1rGhmTZ5ycNOtBQ6JxjqZ3z/HH2FN+wzbkQE
	 wzu3upzEgtQI92uBs31hgqaikTnar17I+aebW/pGHOyKIkj6zHXZ8KeRQ9kKNNPuNb82i
	 Vc9ZowQca57ijczZxcjzoPCWCd6tIfgOoUFn3O7gCziWscTaXFGaI2vZA9wVJ8ROsJ7mb
	 jLmSnr1J4k/0B0673Mdwhv0+4R7ITPc0iRmEqziuWa68RNaTOGheimws2ho7YFlWJv7ON
	 7oNQbx+R5unsvwnlYiWI7lF1+QTL++GEA8rLuEZBmB4yPH2O2vFXkswbXOfo0OeGFOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G0Hqu1+FGz/IWPNQ567UsEhZ0Yh7IpxOzw14Cvzayz8=;
	b=P4FNOp09KrzlDSniE/8082l5eEcTvmbDL0ON8SV+hkbAFhDjUJmzxxxLaI5BUVXtAWFa
	 aGHkN3/yUVpLSVlI24v/iL9i0bejskno8d43IYK0smLq3F9yK+ooye+b/ALa5hD8pr0qG
	 6q/lk5jCX/4wrultCDIvEEME+ts2PqYOq5l5G+usTVOrc4R89a25BQzmodLz93FzAbXbV
	 OuCtJDsCOW2kVJJXuqDwMsSRlcytxMgGpM1qM5Py2J9GBpyVcPWCsvM+IKRLy/2jrOq7+
	 AXeCs2X6mfxMV5JCDSPQm2OlvvPEPiix1HyMetqMV52U6MfR5ySAQq+tZduTZ8ui08Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rF/WqaYE";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD93606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD93606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rF/WqaYE
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b244fb7fffso2358915c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794068668; x=1794673468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0Hqu1+FGz/IWPNQ567UsEhZ0Yh7IpxOzw14Cvzayz8=;
        b=rF/WqaYEza57PrcTeP20UCOKjtuV3xFLTpZWGIpMwgWX77YJcYiquOqutIGEzYd6py
         V71XQXFoxp7gSODveG6Io2g8PKRph5REtXexqiP5gLf4xmqZCA/FOPey6CLQLQbmvBW4
         +YjuxYsYFEZSY830VcJdefBYytyoQYQwp/ie1RVPSpg/JARjunuIFKnw+5E6vxNJLMvv
         0qsckkAMsNExQu+l8fBCITFlLuvtxMJR0joYDCwE3M5PapPqHOfEvZpqBXXhm0unedZX
         95ArVI5DZ8AvKpEGX+mnbXKcBTeA+hqu049ALfhny2Tqf63lpBmfy/WujqeHbYdsQPTL
         2y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794068668; x=1794673468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0Hqu1+FGz/IWPNQ567UsEhZ0Yh7IpxOzw14Cvzayz8=;
        b=2qP2ydPCT7CWfDNF9we8GTLz0eWXW51zmohYX6APjbugDC1J0j3O6pXzZz/24HG65e
         QDcUAmwm8RTwDrBPhuB712FWRm+nReYBOKFvu/KZfLVGJppuJcSol08iqEPlWv20Lqne
         MTqN0EHf0MqYZKQQOy8hXUhwhPEe6FnajhgWCHbirn7pwC0RB6k1kurbzxCbhNfYGuOd
         BmvvUyeb0mqO1p6/OxuZpbzYMRD8VU+wWM3FKD55qX2NrazbPI8rCs58Fw5tOI6rMKSK
         MLonceZdre7tWN69UwMawYYi+pCw73s8XcOfJIsdvWLtf0/yrIMDOiYcb5snXohL6OxC
         NA3g==
X-Forwarded-Encrypted: i=1; AKwUvBwGo+0q3eGlY7O2b3zcr/FmkZx676egsJbknlluykgzONK13n65QRU6WbsNMpQCX+mWHGibCzUY/u2Mv/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P/9cMIO1NWdymobGnZ1Kk4L0IFFK6pk3FWlFqM1g8KukM7Uv8
	2gSEirdlWallsHzJJzVYxh6rzbszPlsKNAWqT4VR7ZwbgyFTDGaEvOid
X-Gm-Gg: AYBFou0iPAj1SU2BuFIxesr82QO+lzLeUY+RR+2nrV310xJCn1qGskpoy1Ok6Zn8qJA
	/sJz5g8SrwD1wzBFJ5m2BS66G8d7RJRpvftje4TtZQb6E68mwUvmtyGrHxowKhQrOv3g+QWVaov
	UGbz1HlJTN5M4CAlWibQXM9lFHeQULEo90Zj1S0KW5R8UHSTvKYfNcRebPtoDcDj/iPjZdSG3So
	7yr8xRXkRyjoY+jKRgZ27OgjrMBm/KI4m39n9or+lhuz2mVTmCi6dDaCl634DZXD+z5FPtQKY/F
	B4Rs2/4jvG275MbsvDReyvVGLtOZR43sbQs56Sht/yV7hNzelLL/RcqOwpw2eq4JCcOoo0yamRF
	C+ZXOV6GiNq4SbcwCkaCgnw6sXOaJnElVqo9dbrWh74bO5goULL1Ij0d0hBaV+msOKxQHfTSRHa
	F/R1PMm9lOYQt3fe6rp2rBhhClyxwU0RBjkdH5urFr8rPq3VVRm7168bmmxn06ETx9hoDWOGtn5
	zbkR2x+lw0ljDwMeYhuAj1X77UNc76aTZtOKIPlUUUOsZ3+nz9iYewHR9FMjv/L7XcjTGNwqh2y
	0CxXdqsw3Usu72PepY+kcXnY1crbN4azKRuocxiCbC3GnfZQS0WDw5qzz3jLg1tMg73QuekvLBy
	wUmn5HAJZODYjurirqYEug6ms2jM0
X-Received: by 2002:a05:701b:2706:b0:1a0:5c85:d1b3 with SMTP id a92af1059eb24-1b25d3a8127mr6940925c88.43.1794068667872;
        Sat, 07 Nov 2026 08:24:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:b097:433d:def1:34a1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b26294289dsm22854161c88.4.2026.11.07.08.24.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 08:24:27 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Nikolas Koesling <nikolas@koesling.info>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH v3] HID: pulsar: print errors with %pe
Date: Sat,  7 Nov 2026 21:54:06 +0530
Message-ID: <20261107162419.9051-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
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

%pe prints the symbolic errno, which is easier to read in a log than the
raw number. Convert every print in the driver that logs an errno so they
all report the same way.

The prints that log data bytes, battery readings or a byte count are left
on %d, those are not error values.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
v3: 
  - move changelog below as requested by Nikolas
v2: https://lore.kernel.org/all/20261106083419.29334-1-sinha.aryan03@gmail.com/
  - convert the remaining errno prints too, not just the battery one
v1: https://lore.kernel.org/all/20261104150055.33028-1-sinha.aryan03@gmail.com/
 drivers/hid/hid-pulsar.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-pulsar.c b/drivers/hid/hid-pulsar.c
index b0b34849f..495ce3b5c 100644
--- a/drivers/hid/hid-pulsar.c
+++ b/drivers/hid/hid-pulsar.c
@@ -162,8 +162,8 @@ static int exec_cmd(struct pulsar_data *drvdata, const u8 *payload,
 		spin_lock_irqsave(&drvdata->raw_event_lock, flags);
 		drvdata->pending_event = CMD_NONE;
 		spin_unlock_irqrestore(&drvdata->raw_event_lock, flags);
-		hid_err(hdev, "failed to send command 0x%02x: %d\n",
-			payload[1], ret);
+		hid_err(hdev, "failed to send command 0x%02x: %pe\n",
+			payload[1], ERR_PTR(ret));
 		goto out;
 	}
 
@@ -295,8 +295,8 @@ static int read_power(struct pulsar_data *drvdata)
 		if (status < 0) {
 			ret = status;
 			hid_err(drvdata->hdev,
-				"%s: failed to read status: %d\n",
-				__func__, ret);
+				"%s: failed to read status: %pe\n",
+				__func__, ERR_PTR(ret));
 			goto unlock;
 		}
 
@@ -320,8 +320,8 @@ static int read_power(struct pulsar_data *drvdata)
 
 	ret = exec_cmd(drvdata, payload, response, CMD_TIMEOUT_MSEC);
 	if (ret < 0) {
-		hid_err(drvdata->hdev, "%s: failed to read power: %d\n",
-			__func__, ret);
+		hid_err(drvdata->hdev, "%s: failed to read power: %pe\n",
+			__func__, ERR_PTR(ret));
 		goto unlock;
 	}
 
@@ -411,8 +411,8 @@ static void power_uevent_work_handler(struct work_struct *work)
 
 	ret = read_power(drvdata);
 	if (ret < 0) {
-		hid_err(drvdata->hdev, "%s: failed to read power: %d\n",
-			__func__, ret);
+		hid_err(drvdata->hdev, "%s: failed to read power: %pe\n",
+			__func__, ERR_PTR(ret));
 		return;
 	}
 
@@ -584,10 +584,11 @@ static void pulsar_init_work(struct work_struct *work)
 	}
 	if (ret < 0) {
 		if (drvdata->type == TYPE_PULSAR) {
-			hid_err(hdev, "failed to read device info: %d\n", ret);
+			hid_err(hdev, "failed to read device info: %pe\n",
+				ERR_PTR(ret));
 			return;
 		}
-		hid_dbg(hdev, "failed to read device info: %d\n", ret);
+		hid_dbg(hdev, "failed to read device info: %pe\n", ERR_PTR(ret));
 		snprintf(drvdata->battery.model,
 			 sizeof(drvdata->battery.model), "%s", hdev->name);
 		goto register_battery;
@@ -615,8 +616,8 @@ static void pulsar_init_work(struct work_struct *work)
 	    devm_power_supply_register(&hdev->dev, &drvdata->battery.desc,
 				       &psy_cfg);
 	if (IS_ERR(drvdata->battery.ps)) {
-		hid_err(hdev, "failed to register battery: %ld\n",
-			PTR_ERR(drvdata->battery.ps));
+		hid_err(hdev, "failed to register battery: %pe\n",
+			drvdata->battery.ps);
 		drvdata->battery.ps = NULL;
 		return;
 	}
@@ -639,7 +640,7 @@ static int pulsar_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	ret = hid_parse(hdev);
 	if (ret < 0) {
-		hid_err(hdev, "hid_parse failed: %d\n", ret);
+		hid_err(hdev, "hid_parse failed: %pe\n", ERR_PTR(ret));
 		return ret;
 	}
 
-- 
2.46.0

