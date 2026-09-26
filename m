Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07B13822B5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439955; cv=none; b=tt25m3JfEriqE1dUyfVLnwxda5Z2MN9kXe6zOULXuFfYSLCkKJhGlfQpYHqiajH276tpkge6CxE2n/lOVEdA6Dh/6B43RcMSZ5uHb1lMBf2ia4SgvzyL+Z9iv2eh0/nR6MHTZDzMbt+aES34jbVmo/FPqdlW0++kd/b+W7gXXto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439955; c=relaxed/simple;
	bh=hC+N0t/XXQablxn2mLCeSBru4fY1Cub75WKCNTcFHh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QZmlXS662PVzu/NKp21YW6pQly2SFdziaXyhqV6CqmFktmgHRSfYmmhXAtOid7vPPJ47f6tIEdXhkKgDjKV9ArnNDH//2euPJeRrnhF2FMDHkLEti/f74LBeVM16Hag/Abks27DDAyfuW9+L5jZEGzaYEG3ntkVY/74RUyt7Ftk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7mDHNiT; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7mDHNiT"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-53324cfe178so5440781cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439947; x=1791044747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4rLTBzwJjcIecEwlLTNrxTAIRsESkfK6hjnt+Yx1lKg=;
        b=o7mDHNiT3pKlRq0fPn1Vx0Z8mqqFmdv62myhAdgDywoc5Q+SDwPrpIgbvA+2cnJdSZ
         EADAffpOcbxXggD6P5mJif2ld9tpGDczp6YcHKWPyaJZPaOwbOFAXPFzPvMs6TbTGqND
         g253p4VC7s0wqupomH4r439OW50kxxDB3X4I6pg7G3R2vsVK9omqlOizdA3u7trYozNZ
         ShdHy20eKFpVi88BO8oU8D6l+tO9JrKsDVH9mBjbUzLgDBlT55y3Gvzf+33KAJdZya3G
         7M64MZ1G7vippjnG0s0nIvsZ+nmFZsSMOK/qPhgvxKz80T5Lx7wsVzodAfoHYjukikKj
         Gyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439947; x=1791044747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rLTBzwJjcIecEwlLTNrxTAIRsESkfK6hjnt+Yx1lKg=;
        b=LG7W5xJifoKnZHZ66YicIVFC1AN3xdzodVr9+TasZMFKT5NXMmbrrpKuVq1vDb2x/s
         flGUq4Apa+7c7z8QggcjwQ1545VDc99sn3RXyA4wMRou+IiWkpUbRcRWj3nEKpB8T9ns
         tSChvYUNb3WvBzG5r4U6daP1OUWg1lVC3zj3kZJz5mOupUALwojdjBqYOv2eWycX9JX4
         d9wS7SlykXxIEGM7xpSfPXjZMAKj4nB5SDfAbql8Kg2jiV1+SWDuP2BQb+rGqlzQ0n5x
         t165f9FjXaQGaYKAFAoxXHdSbnc2NR9CAZrLY/r0RV33OzFbQz45qrnXXvNryxzSZlmY
         myug==
X-Forwarded-Encrypted: i=1; AKwUvBwC3xzBDICsW+eZjPKUidj1jSlymp4bZ+lU7mla4lUl6Hnzgl3TdGgXkuC5XSvmlmi1t9kaO5cMpynOaCU=@vger.kernel.org
X-Gm-Message-State: AFuF++nk4ZSCxLWtcqTbPSZMFSozXtqbjJzjl2NVPRT1EOVzjNi7zwbD
	yx4/OqOLre22qgWSzmrfVv0nFRjb4cXQmfbSB4Gbbf4JluhOskuv7fkeuV3zSwNN
X-Gm-Gg: AYBFou3f7HnFTmiXcDwgQeA0foqXSINQRPVw7BfXalxrzA4iDclkkJEhHyFCb5BhLQm
	jQvD4y3fG11VsXS8t+nAHdFzCzesv7gaRRQv+grGxvZtkXQXGE0XG0NtwpeQnMaWWhTyBXR7Eel
	gvRn10x6Uf27Iyffd0B6d/Q9VhO3znUMTXNN+bEVfex99nX9e1KKi0t/5QX3+ROKYgE2eMilDFI
	t1T8KyVktN0XAB1aBOZzqMW67zTFeNFWfstbJvnWznBPPwECwwvD84oubMZGX6M9AQG8ZsaUsco
	4CB2jKiPll819lLNXF/gzjdGVeHoIHlVNHJJ7qCPA6tFD4n9tHSfjhH96uO6hHHz6FC5c58cPBh
	RmCAPMaEbA6q/BZFPlBe8oaofdDV9ZkZgXlt13N7kz/L3YU/To/D0+An6hknrl1jp6abQBOQvDl
	7iI6RmynhuZKEDaUJQ26INPsug00drvhIuCGvJlcM9Vh5zLXkoTgkjBXVpMyx4E6Uam3cA3Eciy
	dSlSeCwReCIoiIISObJl1YPM2VRDXloG7+2O7jbzsKOyamR
X-Received: by 2002:a05:622a:15c4:b0:530:178a:9dd8 with SMTP id d75a77b69052e-5330b556ae7mr110702981cf.8.1790439947407;
        Sat, 26 Sep 2026 09:25:47 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533222585a1sm20936831cf.11.2026.09.26.09.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:47 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: logitech-hidpp: fix typos in comments
Date: Sat, 26 Sep 2026 12:25:43 -0400
Message-ID: <20260926162544.25462-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various spelling mistakes in comments found by codespell.

Assisted-by: Claude:claude-opus-5-5 codespell
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 9646380febac..f4bf4a39fcd9 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -108,9 +108,9 @@ MODULE_PARM_DESC(disable_tap_to_click,
  *
  * Most older devices (including the Unifying usb receiver) use the RAP protocol
  * where as most newer devices use the FAP protocol. Both protocols are
- * compatible with the underlying transport, which could be usb, Unifiying, or
+ * compatible with the underlying transport, which could be usb, Unifying, or
  * bluetooth. The message lengths are defined by the hid vendor specific report
- * descriptor for the HIDPP_SHORT report type (total message lenth 7 bytes) and
+ * descriptor for the HIDPP_SHORT report type (total message length 7 bytes) and
  * the HIDPP_LONG report type (total message length 20 bytes)
  *
  * The RAP protocol uses both report types, whereas the FAP only uses HIDPP_LONG
@@ -120,7 +120,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
  * Unifying device.
  *
  * The paired device can be RAP or FAP, it will receive the message untouched
- * from the Unifiying receiver.
+ * from the Unifying receiver.
  */
 
 struct fap {
@@ -1656,7 +1656,7 @@ static int hidpp20_unifiedbattery_map_status(struct hidpp_device *hidpp,
 static int hidpp20_unifiedbattery_map_level(struct hidpp_device *hidpp,
 					    u8 battery_level)
 {
-	/* cler unsupported level bits */
+	/* clear unsupported level bits */
 	battery_level &= hidpp->battery.supported_levels_1004;
 
 	if (battery_level & FLAG_UNIFIED_BATTERY_LEVEL_FULL)
@@ -3353,7 +3353,7 @@ static int m560_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 /*
  * The Logitech K400 keyboard has an embedded touchpad which is seen
  * as a mouse from the OS point of view. There is a hardware shortcut to disable
- * tap-to-click but the setting is not remembered accross reset, annoying some
+ * tap-to-click but the setting is not remembered across reset, annoying some
  * users.
  *
  * We can toggle this feature from the host by using the feature 0x6010:
-- 
2.53.0

