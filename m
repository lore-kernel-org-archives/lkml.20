Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170460;
	b=GBqPG6pxlPvwV/8qtfREYAAXLvZbq52fc79V9Gclf0Da/KJIL4H06DVx7niynY8/OdQg
	 Tngmao6rSC2nR4vTJByLiFxWnrYYtMoUb9J1ZWkBG27dbeWCqzgvuTUHlydwrop7hwH9k
	 iBorLdVmHh+49hhJAKZgvePMSbwHmUld54ZCYXulUXlj1CErie53csvAPtrWt6rdd2vqF
	 1uZeRZ6L89kF2vrYnVAD0IZ7zDjlzDW//rr4STW/B9Z0HP/xqleCUP6QwpEU3+Z2yR50A
	 ddmet2InFrOzvVjzofJT/pcTgQOcquSewW5UWRnjbX0AM0SOvTLv+hi1kcWBAd9xbWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rjSae3E97J5ckxR6B6iOy6NGSmANAKoIHhSgD5Soi7g=;
	b=sZXnomAfn1OBSCZ7wtCG4uDedOkaYtAHfyQrjJrIcs29xwDOOxStPUfSWUduaZxHYPYT
	 9CWPW4XkuU/V6qfHmx023mQeEtR+Nvp0v1kgCsoE399rAYqXHwpYB1yl7N6cyzHguVQxb
	 iwhU0zGvxBQYLv7BUY3ilXoSF684tVZCo+ZWYK54uNIDzlRHwH695Kom1tmJrPdaTRWdJ
	 sqEaNMLcFAyY2JUiIDGi4MY3Dlyv+JdGUg1yBJiSjo57d1baJQliiCR6cnDkGA31qG8CK
	 s1VJmUjLJZG9mulgKcUfn2wGh7kWRILBRUM9KaHPqt29spTphscB1otO6GusYbNWCxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmYYY60E;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A246606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A246606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmYYY60E
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so58276b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794170460; x=1794775260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjSae3E97J5ckxR6B6iOy6NGSmANAKoIHhSgD5Soi7g=;
        b=MmYYY60E7BCg3MiLWXr7/JvLLcCqdNswRYahd6AEa47+ItVcVLh7GlXcPLvoqoNo1f
         QLVbOoc0x2xMUWpDNwlU9keLfJt9cmA9Uz3nm3FbySIMkH6uVkJJ0ZOfRorIEsnrCJJ2
         F+9d/Ga5XyAghZ2RUYFiOILgPMXQVbx4CFZbgL69NIjXmtBR5QCUVA9YXGo4vCsKe1PD
         wnam+cTWMS+YYeRtsBwfPEM6qm+75PujoS7IdlTLdz1MVYU2sa7mndAQNtfcPTo3UWRf
         5MXHZE8gcfvZAs1F4jtsDkv2QLGepW08QCd57NaDi6XK2QwSjEqA5GZtXhDmVOKiRK/j
         DzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794170460; x=1794775260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjSae3E97J5ckxR6B6iOy6NGSmANAKoIHhSgD5Soi7g=;
        b=HfYu2crDNf2AEJgw9QJ6HqwJKCY5u5aA/wo07W8yehVe9kQjZK/JLC7YhIj5a+UgPX
         I0uG2NolF3LN3Jg5loInopXA1e+K3F4rk+ptT0j3fXkn1MtDZAxAhqeYM118MIgaBEW4
         8rx60OgoIrn0fUhMRMd0NX5F2NW+rc6qAgmFAfMFeCHbWC2T80sG+MW/jyBR8v650AbX
         lIVyWP4ee7BVEZmVk3+BA3qdNRWJJGO188EgeFfGj0Xcpgb5RztcPRuoNPu0ZI6TdGDI
         FECDWAA/6zAojibGvXeeH6ckPvXbIkRWI67ICkrR5BvpNNKQLLuTkHamR0F2AE45t0DV
         JqcA==
X-Forwarded-Encrypted: i=1; AL+hErGxH6NjFiY8cd0kKRxPkELJJ18XvUcJ4WRsfm+0OdIga3L0/MobFnsEvYcrcxqwmzx+Fgq7qgdCHWReAxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bzXrdMIZ4QSkL8cyjqTFRoQEM1aAcra8auNvS3Hj1tzN2nerT
	zqgFWcmuEhdr3+1pT9qYG6qGJvfMsH83bwUDHZsyjstNyzqME9uhSyHZ
X-Gm-Gg: AYBFou3Oaxiho+cbg5z4fj4cx6H5LbfaGtVOxE4FNiBgl8oplZFVHDQP12/3afUfUNv
	zXCrwHoMPiyFaZTm9viebcGS1+e0absUguYbgdBT4LAVcZPIIVCbEpG4pPj6ztDsTTw7xWUx+z6
	0wzcxIk7PEDiUW3AY2JoEodvmiHGf/zNKLQ9sFr69Xr6BaA/s/tnjG6rvjCiIRhtrK9dKeUUyej
	qZ/gVI2l9axXpV5K+h8Z0YMNu465AF1Ugobp+cMIBBCnA+tO1Jr95DTJplEy0xskw8HeMcPijX+
	2KayYC/HaIwrlC8HnaOzj9GW7LAZ0YR7CPVxrBcMMIQfW8syL3p7A0xYVwk9wr5LRLgtIPpAy4c
	Rhh7AbD2xIdO2n518p9tyogrfBEDI0N8d4LTTIylyF0ng+CgsrJbFSynAC8r2GXYJf2oPPykMKn
	ExX2xMjoA31GcW10PD/3bVTKaNQG5wtjr4ib1cvhwdur9bnONdpvhmdXKxfV0l69UmkQ/8UdVFu
	yPzxMovxeoNRgyWgddXGwbZETXbOm5wDsWKyiiBPbxn/kgWRJExCfx+1ETzckmp2nrYvDqhWquA
	Ml7pY7l39aEHqsl+fUVPkGscS7rAb/26KJ+IcV2K7tuv46SLT5xNXUH0ubHGz+K2UhF+IisASyd
	Dj/ZsojOOESXc6OR+SUMWGrftXEhtC5lCF24bCBHZwZVKpk0L9NJGDlWtMiehYWEWCNI4hFfkwm
	E+Mw==
X-Received: by 2002:a05:6a00:189b:b0:89e:cfbb:e8a2 with SMTP id d2e1a72fcca58-8b66c3b368amr1764637b3a.4.1794170459589;
        Sun, 08 Nov 2026 12:40:59 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b649821c57sm690773b3a.37.2026.11.08.12.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:40:59 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH rtw-next v3] wifi: rtw89: acpi: check for _DSM function support before evaluating it
Date: Sun,  8 Nov 2026 12:40:56 -0800
Message-ID: <20261108204056.28049-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When the WiFi device has no ACPI companion, or the firmware does not
implement a given rtw89 _DSM function, rtw89_acpi_evaluate_dsm() calls
acpi_evaluate_dsm() anyway. ACPI core then warns on every probe:

  ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:10 (0x1001)
  ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 rev:0 func:6 (0x1001)

Here the handle is NULL, and acpi_evaluate_object() returns
AE_BAD_PARAMETER. All callers already treat failure as "no policy
provided by the platform", so this is only noise.

Bail out early when there is no ACPI handle,

Seen on an RTL8852BE in a desktop PCIe slot.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: remove acpi_check_dsm()
 v2: check handle separately. Remove Fixes.
 drivers/net/wireless/realtek/rtw89/acpi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/acpi.c b/drivers/net/wireless/realtek/rtw89/acpi.c
index ebb6cf555747..d8cf8eb2527b 100644
--- a/drivers/net/wireless/realtek/rtw89/acpi.c
+++ b/drivers/net/wireless/realtek/rtw89/acpi.c
@@ -372,11 +372,16 @@ int rtw89_acpi_evaluate_dsm(struct rtw89_dev *rtwdev,
 			    enum rtw89_acpi_dsm_func func,
 			    struct rtw89_acpi_dsm_result *res)
 {
+	acpi_handle handle = ACPI_HANDLE(rtwdev->dev);
 	union acpi_object *obj;
 	int ret;
 
-	obj = acpi_evaluate_dsm(ACPI_HANDLE(rtwdev->dev), &rtw89_guid,
-				0, func, NULL);
+	if (!handle) {
+		rtw89_debug(rtwdev, RTW89_DBG_ACPI, "acpi dsm no handle\n");
+		return -ENODEV;
+	}
+
+	obj = acpi_evaluate_dsm(handle, &rtw89_guid, 0, func, NULL);
 	if (!obj) {
 		rtw89_debug(rtwdev, RTW89_DBG_ACPI,
 			    "acpi dsm fail to evaluate func: %d\n", func);
-- 
2.56.0

