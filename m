Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641F3E7BA7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081908; cv=none; b=BPx3RWHUt45kxa3qjm65T9eJEYsC0sIwOPFnJsdDUu16ZEst08gdB05Oq95Hng25PIfmqWu+rVUpgfVzQCaG+1a1YbD5DV/Wo+e+gCvphxKFWxqTLstTiAcdkmqAAl7QU608V0NfX1rL66UWSUNhGsOkiXC2LIFJ+kfsrdhUyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081908; c=relaxed/simple;
	bh=USSRRKRHb1tZ+dj3KVBcFL3RqVwYm82zAKdb47hmuj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pfDMMPUIH97lxmyPhfFz8MgmAdxYY8RAfgr4t+qxjWzGfHJxSxUVSs3nomYVmCL2/6DjpdTW1hE4EPF2lUEmw0odT4Hxeji6et1MVMh4w/IpBrzOyLhnJNq3YhEDRLTCC20LZCIm8T1IGOx7/BdQ9OdqaErDmowJTCMtRabfGR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wb6zJUhA; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wb6zJUhA"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bccc73eea4so165395e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792081894; x=1792686694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YdI7qlJbZdihd8Em1MdyzbWsxysosA9gJKj9ci1eas=;
        b=Wb6zJUhAtWmuORyFQZ9dtYNPqxy6AGKuNu6zdRdwBLfpZvAOEwktLfUS8ReV4vbIPx
         Xx7TLVlOM2iczUFfFQhOsrmZXd9WSpONMv1g1sKAH14OmGbcmlyJAWwwObu9Zr/BB6yN
         DKpS8EFFzQh2WisYbFM7AmpeV2m7TIOtFfS2uWwtqQLNOdLmsp08k4HAQFH0YxawLUxP
         z4PKiqwEJCmUoVreXDDk3orXAmqoXT3n/vdqESfa+x0f8Gh1b66xTK839Xjv8FHyJQ3D
         KmBWUcyoe3QvxYlqZSTekiTmmaIAlsPaeTnzamP08B4Yx/4/p/t/e10uqHOQBHbPY/5w
         jWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081894; x=1792686694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YdI7qlJbZdihd8Em1MdyzbWsxysosA9gJKj9ci1eas=;
        b=vKQmEE47MevGgn4in1BNjFngHfSk/SEIi6qQWn5tL1HJ7ryhmz2pShAUf3hwyJEwfp
         8HX8x5rM3dWRZSApKxx5esFpiA30joikXoLLpxe2fb5fgAY3lIWS3eFNRzGiQ1GEHZo5
         0VzuMJrsSQFtbr57hGsF+iZ7VNDhACXCINbhp6wdP/Rn25JW2eMAuvMA8l+oN0U6vUGf
         pTHuH0Zef8al4ymTvaXeQhrWIpvCGPIA7PgxT+D/172cI89mp4MGghhAmhINIfoiWbO3
         n39qD6cyg1d8XMRaYUGBo8lEVfrm7a9xzDbfb3v+BWI1BSx1AhDk/ZK+ICIu9q7lQ3eh
         nmVA==
X-Forwarded-Encrypted: i=1; AKwUvBwBqkcXp5jxUotJ/rGUgzeKh5vwfz1qm+yzSiNusoAO6HhvTx6ENrkl+VXOXKYWySZdxF3V+5HTbRD6LNQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR0qmX0rHqMC0dBdl9fiCgH6li7/p84OpmQTDP5CWXkBWS7CG3
	Vt6wnS1qh3T+HAmdDTEkGyRb0frYK6RwDT2I8dCtyYfT+u/t7RRNXoWA
X-Gm-Gg: AYBFou0ulMMu2NbKmfh3Yqiiy0rW7YACtDTcq1HBoscGJNLkwjUY5EfItCCjrE8fgjN
	ss5RwoUDlV7UMvxdD1cAV9yQ+7Lt3wrPr0AbYAsUQwwA1SDO+XLaR6ttTx61OGzsoDmLyzXNJn0
	GdVRQg+ul+ncIq8l0uAo3MWU7wmKTWL6FVENJ4ixJMYOMX4mlI6IYahRwl1UFF9Fj4UxUJMm9qo
	GfLvD1BRX0aLSyRiayIqLUqeBP18Nphyg1L0LCREUquSNnyxikQAs8U+2pQgUbitTWJtrFOHMqG
	uRAdrmKGK04+lWj+0vLH1vsnSmC0aSz0qkQq7mCiSF9VTSospcBedtA2eVhDPD+TkinGJSj6fPy
	2zZZq26PaPTcJoFglFIf5jCi2P6PD41WfTzL9BW5C5NAhmVGEuuWsbjakHXT9y3ciDI6e6gvRZS
	gRP89TaHRB50zL/3V6opVgmEHaj77eQep+w+LhN0uPf8uhyuv4kk6CxGfo0G/SWUdvGg8NPyUBL
	Wf4RXb0WAAIKkkghDFXGuLeqhs7QtiMW3onfwU=
X-Received: by 2002:ac2:4e0e:0:b0:5bc:b5eb:88eb with SMTP id 2adb3069b0e04-5be476e47f5mr201037e87.24.1792081894318;
        Thu, 15 Oct 2026 09:31:34 -0700 (PDT)
Received: from zephyrus-g16 (89-179-242-53.static.corbina.ru. [89.179.242.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d857d9sm1508104e87.49.2026.10.15.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:31:33 -0700 (PDT)
From: Evgeny Volferts <eugene.wolferz@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Evgeny Volferts <eugene.wolferz@gmail.com>
Subject: [PATCH] platform/x86: asus-nb-wmi: Ignore spurious 0xe5 events on GU605MY
Date: Thu, 15 Oct 2026 19:30:28 +0300
Message-ID: <20261015163029.107250-1-eugene.wolferz@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ROG Zephyrus G16 GU605MY periodically emits an
unrecognized WMI event (0xe5), approximately every 12 seconds.

The event is reported as KEY_UNKNOWN through the Asus WMI hotkeys
input device. When the session is locked, it causes both the
internal display and an external monitor connected through a
Thunderbolt dock to wake up repeatedly.

Add a DMI-specific quirk to suppress this event on the GU605MY
without affecting other ASUS notebook models.

Ignoring the event was first verified on a 7.2.7-based OGC kernel.
The DMI-specific quirk was subsequently built against 7.2.8-ogc5
and tested on 7.2.9-ogc2 and 7.2.9-ogc4. On both 7.2.9 variants,
the DMI match was confirmed and the unknown 0xe5 event messages
disappeared.

Signed-off-by: Evgeny Volferts <eugene.wolferz@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 17 +++++++++++++++++
 drivers/platform/x86/asus-wmi.h    |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b1644d..8d69231d25a0 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
 	.key_wlan_event = ASUS_WMI_KEY_IGNORE,
 };
 
+static struct quirk_entry quirk_asus_gu605my = {
+	.ignore_e5_wmi_event = true,
+};
+
 static struct quirk_entry quirk_asus_z13 = {
 	.key_wlan_event = ASUS_WMI_KEY_ARMOURY,
 	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
@@ -562,6 +566,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_z13,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS ROG Zephyrus G16 GU605MY",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Zephyrus G16 GU605MY_GU605MY"),
+		},
+		.driver_data = &quirk_asus_gu605my,
+	},
 	{},
 };
 
@@ -690,6 +703,10 @@ static void asus_nb_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
 		if (quirks->key_wlan_event)
 			*code = quirks->key_wlan_event;
 		break;
+	case 0xE5:
+		if (quirks->ignore_e5_wmi_event)
+			*code = ASUS_WMI_KEY_IGNORE;
+		break;
 	}
 }
 
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 5cd4392b964e..e7772397cd10 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -41,6 +41,7 @@ struct quirk_entry {
 	bool wmi_force_als_set;
 	bool wmi_ignore_fan;
 	bool filter_i8042_e1_extended_codes;
+	bool ignore_e5_wmi_event;
 	int key_wlan_event;
 	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
 	int wapf;
-- 
2.56.0

