Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B1E49BB7D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327691; cv=none; b=e9MDWTX3CaHSicKHtGgb+XhinhzAcQxOMDnSw3CXEXuoClCppeeMkcxRGkLij0NgO/p32+qUgK9p493BEhrb74Y6aCTz5ZhysiYzCj8w8x2nXWKOZ1wGsK9wAfcap0BkHS3RMu+ig+SGcNgQ1oXCZqcgwUmlecfLBn2+M/2U0DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327691; c=relaxed/simple;
	bh=KWNhaqXlqeub4WAFjIf/rh7HaSpvWJdsUc+sIUUddi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhHW8ke5WAwHf85ZB6ZLCwblHOk3htKrrF3DtlmfVJSAu1wpeTGD92wn5C1Enap/o6QWEEPAXOlATpehDi/f2denc8z2h7eO3Mvfa4PmZZTxI74PKMc/oV0JFwF3GDuijPe8ib+MnS91wATrq+bcghHz5AHR3J80PoGJoqPYmdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FA3VLeO0; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FA3VLeO0"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so364728a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327685; x=1792932485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVc6a37ymo5cyc7MbRfnER++to5FQn61dzC2ih17HV0=;
        b=FA3VLeO0zyonyrkLCQBzgJQLz74AnMhfFSTEQGcAwvzfYkvewVSZsfkN4n0bIchavK
         RwoptaEeP8yURaejEMd3OUZUjZYcYt/9RTaznIhArxQsSOW6bLMlAyxfJmr06cjQAfas
         vxcFBgrBF2kRKd7unkEU3hR5KfGrtgM306HGtzDw2JPu4iy+M9Cd4pZ0OqhZBMgosidV
         Tf44W+aHUx5QvZt3ANpqjhDSYDU+ccX8rMv/MZllCIi5vth8ndEN40t90lZ5D0QLVzg0
         D41Dou+LmeEx6sIoleVl4vbjDUqXGb6Y8b6Tz64DmtIZpVuY2HXo3O81uXd9ytuWUMd0
         I2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327685; x=1792932485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVc6a37ymo5cyc7MbRfnER++to5FQn61dzC2ih17HV0=;
        b=thd7oUkt5Hrz/0gn0kgckWXi6e2OX0t9+gvPZcFccALK8rz45KPnYfe53uZC/NysTV
         IgkulTeOpKrIus9zdZTku1UVF9/L630YTCIqNxooyaFyKH/nVUIEiPfKkj29BW9qKoJD
         h+3CpSMSw4PsaPTL8Rvx61dRCNzvaTpHHC+DfyPHvLuGgJBQPkwCKKtz6QyCkxByAdjO
         +rRTFZk3j27DvGVDCcZbjiEpIWxwDRQQD3Q3vOPlu1G8dDAd00tQlucM8qQtgL9lGmKF
         x1F6cg5mmPYFc5hGSbCm355VjsJW/GnLMchCJuM0jzHuPyrRdkOmY6jADVoTZXCcTPYp
         oHjg==
X-Forwarded-Encrypted: i=1; AKwUvBx+YBLPZ0CxUt9q9F7oqOVTRYep8ziorR6Pl85SyXiDrpjIRqGkl/+9dh7uQ1XRtFdeeeUnurnVTLnORcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJp1DRulYdt/ZQmtAwTPchaXGwlKNHvK7OdyKFW2dUK2hWo/9jn
	eynQeE12285vG8qfXhibhdeDozd2Hbu+UR4uTl+cr956bJoc6dX6JZpR
X-Gm-Gg: AYBFou0Txpx9/5N9/fU1SyR7QNuMi/altnRQz2UwijoAW+jprNqqCQ6zCyTvSSgy2hm
	mg4MWKLLady8xVCwYQUgc+QbJZdTd/zmoTK/qlN5ncyDi/PajtqdFgczihPnPCDQj8RT4DRaEwC
	erEUba3eZyzcTd3rYTzxx5UvcfT+7jQClczwMYKDO06O9PjVRi2WyjBfYAnl/1HVQHlikTi+wfH
	dwdfoabjSmT4CagvSXVaC/GJa27cSKqWFUu1p3nru6jy7PQKHFj6xRFy+FLmsoUsLlG2FPQV3bg
	2imPo3pALoD9xglIVEbcxN1E1Dk/lKm/7pEsAhirQv87ITC9tPqjplBYayV1g/GUQazN/F5QnMQ
	VokwQZ5flP+Aq1fdoHJNfkltcCYLLt4mArJ0P8j7I0DU9/0TQrGcsX/EHE7sZfc/i+rulsGXgXx
	LwtNeEK1Uvrg6+BHGQFHN91nwhmofOjAg/+xusDSNYPbRFWW73wXSB9M2WsWWos4kihJvWcKZmK
	nLtYiHtspBw+1jRfBPdVGY=
X-Received: by 2002:a17:90b:3b82:b0:3a7:cffb:8b96 with SMTP id 98e67ed59e1d1-3aceefb00fcmr4343511a91.18.1792327684749;
        Sun, 18 Oct 2026 05:48:04 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549ee946sm2804669a12.20.2026.10.18.05.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:48:02 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>
Subject: [PATCH v3 1/6] HID: wacom: check the input device in the shared report helpers
Date: Sun, 18 Oct 2026 21:47:50 +0900
Message-ID: <20261018124755.850888-2-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018124755.850888-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261018124755.850888-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wacom_report_numbered_buttons() and wacom_wac_finger_count_touches() are
reached from several report handlers and use the input device they are
given without checking it.

Both can see a NULL input device on a fully successful probe. The report
handler is selected by features.type from the id table, while the three
input devices are allocated from what the report descriptor declares.
When wacom_setup_{pen,touch,pad}_input_capabilities() returns -ENODEV,
wacom_setup_inputs() frees that input device, sets the pointer to NULL
and still returns 0 - the "no pen in use on this interface" case.
wacom_wac_irq() then still routes reports to a handler that passes the
NULL pointer down.

Reproduced on linux-next 20260925 (x86_64, KASAN) from one /dev/uhid
device plus a single UHID_INPUT2 write:

  BUG: KASAN: null-ptr-deref in range [0x290-0x297]
  RIP: 0010:wacom_report_numbered_buttons+0x37/0x210
   wacom_intuos_irq+0x29e/0x3300
   wacom_wac_irq+0x1b59/0xb3f0
   wacom_raw_event+0x68f/0xb60
   __hid_input_report+0x398/0x4d0
   uhid_char_write+0xa99/0xfc0

Check the pointer in both helpers, following the convention the driver
already uses in wacom_tpc_irq() and wacom_wac_pad_event(). Log a
warning on the first occurrence so the condition is not silently
swallowed.

Fixes: 10059cdc0ad0 ("Input: wacom - split out the pad device for Intuos/Cintiq")
Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
Cc: stable@vger.kernel.org
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
---
 drivers/hid/wacom_wac.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index c4cd87b781c4..567b01882eb1 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1263,6 +1263,12 @@ static int wacom_wac_finger_count_touches(struct wacom_wac *wacom)
 	int count = 0;
 	int i;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: touch_input is NULL\n", __func__);
+		return 0;
+	}
+
 	if (!touch_max)
 		return 0;
 
@@ -4226,9 +4232,16 @@ static void wacom_update_led(struct wacom *wacom, int button_count, int mask,
 static void wacom_report_numbered_buttons(struct input_dev *input_dev,
 				int button_count, int mask)
 {
-	struct wacom *wacom = input_get_drvdata(input_dev);
+	struct wacom *wacom;
 	int i;
 
+	if (!input_dev) {
+		pr_warn_once("%s: input_dev is NULL\n", __func__);
+		return;
+	}
+
+	wacom = input_get_drvdata(input_dev);
+
 	for (i = 0; i < wacom->led.count; i++)
 		wacom_update_led(wacom,  button_count, mask, i);
 
-- 
2.53.0

