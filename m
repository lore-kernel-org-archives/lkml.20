Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BE5470120
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320390; cv=none; b=flC1Q/RSoy+2Jj0n0fSEKANZk2g8BU8/pAtNo+4KDQbG96LmIf/S5kVIYT4bG6H60vwXysZWyeE3qEXIN/wvzEQtVb/JyWphsf9hMEzICjMQLcoUMf9/NHhev8RPTR5WHlnLxFHWDo2sECZkzGzpWstWq6+VHotC0+A1rkySLGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320390; c=relaxed/simple;
	bh=KWNhaqXlqeub4WAFjIf/rh7HaSpvWJdsUc+sIUUddi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9Je87NSVYfzvKOpcHyk2yANLPf0YGU96yok3uPOKFah5Y8cpcOJVVxK5f4/oupuy4kL3RgroPSSpFgwf9/TVQzNN8IfrNuWbRlyCuCTZ3m6I69gBpAffUT4qq/K6IeXBB/5sd5fkbW/S/j34QCzPxqysoaR5oD6cWiy5GScgEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoGONQCg; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoGONQCg"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so877552a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320386; x=1792925186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVc6a37ymo5cyc7MbRfnER++to5FQn61dzC2ih17HV0=;
        b=KoGONQCgtrKogj4HFiolFUble8mhQeMEFh8tKAi5ib7tthQLGFvrK9CBZNQP+YkwDu
         UygjezwRbOt3dc1dK+4mwLBgIZTjcQHoQUcTR8nCOhkIE0XIVmttBTKhOGPE3wJh0XDU
         yQligGILo37KyYc7wcibYrQkfJVPwaievHbrGdZSVyDVCTKJ4BgVv4ejUZqFCn7bnNwU
         8gqI2zdnzfMXYeA0019j1on6xu1xySsyJw5S0LkoynEUHsIXY4VeCeV/NlZdmxIhGKQn
         QOo+krIotT8XhsWQVBMIkRtmv9yA9tPA1iKzZjNKJxRVtGnSvT9g9L+jyEhJrCgrA5u1
         RqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320386; x=1792925186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVc6a37ymo5cyc7MbRfnER++to5FQn61dzC2ih17HV0=;
        b=NpRJmwHxg5LYdnP2VmuSCrs0o38B9AhoeE6F2g7f+5YwFwYaEyL4TWO5pTpcQ0N86a
         upbltqQvPaj49ONalr0FDS/2e+USJ/CuO2rqWYGdZRvWbrs+vt2cppgwoF+VXHFw4GDx
         Ax/KA6gbnmyzZDrCmMMwGtpjcfzC9n4MqTYMIfkoKZ63r9yZRZxAfV2E9MG1q3bmo1Du
         /hGOn9itpLMFtINUzJ71AVaz15h8yJh+7bv31bCXfoipwk4Tf63R2qkkDm8hF+aCGgGz
         27BZFJ3oP4DuEvebST7WQdu8czHR1hk0oY4nnerLFut8ORZmtfLVbHqn+TuirTjNXpZt
         fjRw==
X-Forwarded-Encrypted: i=1; AKwUvBybm6C213Qt1mVtUPiicp+6Z16E6szX5SzvzifIfmIdOGZQr4TVca15ZXsMvHCIuGqgITns4eIBpqbiqhQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXlfbmkdMhY8dE4KdSs/+suYjlffjPtVF52Arp7Duu7Pk4V8Jh
	B776Mq0qZPJNWc0Ep2UEhgGbhLnSiEOmjwYKb0vadnK3EXrcf8JpNFW8
X-Gm-Gg: AYBFou2z5Nn+Gv+IeLcTlFpJOQcdeIwsXA0GZUX5VsxWVmyUtIdSufjtlehmWqJixLp
	X4TB0Vjo7lpB8+tOU4Sl6s5jxbU5kzmWyfwRegDCPR7ZVcdnU45iRs/cojteR1WuyrYguoz1VaJ
	rrPVgo0qGUOMW7WeO7DFLrjTNyCAxm4AG7ZsuZtAt91qiR4LAuLgWQMVXdtep9YvZl7uiNCOybK
	HnhlGURMP20eyIVCNU+/kGEsKZdnwpaaWADlJg2x+PcVXn7Y2eEO1RaXobfAatIhJB+mbaHT5j0
	ADMeXbmpJcumzHjoLfhFteRUekMfzWHVhU1P2ymmyY5lXPyc/X97JDmE4wbb2M1GEizWFE8Ex51
	GC3SJZs47OhHluhu2VaT49kXlgfsb4BRG9vqEqszIBUoD4JR3mgERFFgfdbk8c5UtMktUx/L+Se
	4eXaI3NTkJQ+XyajcYErn/1UQnpBpNpCc5ugsL1yTffYjFqdFyg+OmBiIPoXjRtnenp6RC5f5tN
	Cx3KbuDVdFPTwjtJ7RpUxM=
X-Received: by 2002:a05:6300:408a:b0:3e1:1689:1eb8 with SMTP id adf61e73a8af0-3e225d94e4fmr3659088637.2.1792320385730;
        Sun, 18 Oct 2026 03:46:25 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a33681sm2949085a12.29.2026.10.18.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:46:25 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	jinmo44.yang@gmail.com
Subject: [PATCH v2 1/5] HID: wacom: check the input device in the shared report helpers
Date: Sun, 18 Oct 2026 19:46:13 +0900
Message-ID: <20261018104617.743771-2-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018104617.743771-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261018104617.743771-1-jinmo44.yang@gmail.com>
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

