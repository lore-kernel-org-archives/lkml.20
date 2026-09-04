Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE843A9D9B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488502; cv=none; b=JO4DQHY2/SyUYDBQxSC+9FDjokWTND/RDUN9KPe8WwL6FNOO8uKu9RbUGWMXw1evs0bryyWdO4xo2JsWqI4ZL/UDXJF+euI7QgDA1ab8p9QuLbVnNn1zlu7g15x9YYaCwld51H4NI6kbSFUf7y88COQtsIE8HwSUpi/FBh+xjug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488502; c=relaxed/simple;
	bh=H1UNvTnuYG8Awa8ERxE1CNQ0nSBnUAs6dRe3SxhFr08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jSSFxZ57didEiP8A8D3tBYPC3KUJQVLF0z7np37hhWEgJMp4pDSwc8IiilN4WIu2yI5cE60/NFvZ8bh5xwxdJ91kPF3BS3IrMgb5aaVz8atlUl6lxo68D0Tr5n1kSxGk237hMV1N6K4qx9qrGZ3kOXkHPZukvu3cY6e2kvtCjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=IjCtZzQU; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="IjCtZzQU"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91034716d1dso8967096d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1788488500; x=1789093300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMoW1EQ+b/ZcFB/LLo+fHxnLlm0WSLZfhGJVT6/r1EM=;
        b=IjCtZzQUckAXauUC9v7Yv82diBzeuxDrczVQgcmcoLg14gK/PTBAxxmDquApMznNJM
         WByN4v4VuKOhkb7up1SobZrJmTClLMHitn+r0OTKU5bDw+UxIR/LGMLYhQWanbeeZUCs
         d1Vs2sH4fA8GsLHVmlLikRKGwhwEhZUsJCfJ1pK4IoPT2Nny7VJqZrrkfzJpupuJoMwX
         bCtDPEU9lxYRGQXuusj16kOaYKMTRf8XLtkEdimfrn6E5xU0TH54BYa4R3Qw2wVuYM60
         LGb7X/VYkVzpJd+8kxtLa4Vm6iCPwKW7Ql7fr3oVAsNl6gwdjAI7xHYPlQj3CM64rjhy
         evBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488500; x=1789093300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMoW1EQ+b/ZcFB/LLo+fHxnLlm0WSLZfhGJVT6/r1EM=;
        b=GwVsa7W5/VjtNxsWFA/ZL6CmIPz+K2mVProxZ3FFq7i3mIIPnx+KrTZJhQ7mi4iggJ
         W2Z2Zuegcqtql2foXkr/MT6fGcQ272D3Wadf+Snl3B2l5GOiDL1JsPvhL4DzTMeucgU3
         Exz4Y84nb2bm3AfcET9//PhFr1yPscuoOa7Z8iGfOAqITD/AkckJz7EaPT71eCso/mmd
         +7dcHUfKmLedGwRqJeOinqNudTf42NNqG/j36fro8yLa7IG/T8Jm2QvkAqAbZTEO6A18
         NcAjL7ymRZxPqobGUPfxcKFLncVyCeFNLgg7zFsdOK2v0md6tTdUb1tv5HPv/tKeFjtf
         BgVA==
X-Forwarded-Encrypted: i=1; AKwUvBwaPInNAKt3beDoIGmeK0VhhefUlnPxvJkXZljNU11OnJf99pIa+7NEj1kibSS0/G4cejuzldKEbWCKoTE=@vger.kernel.org
X-Gm-Message-State: AFuF++lCEwKBbp5d1Ur49WzTO0R5vo/wV2yLSJam6V/4LGoMrpc0rAje
	rOeYaOcgzd2CtxuvQKL7vayo+NifHcF7kdAbWwJaTiO+rPuPJYluZYjsMTvMM9LjHWE=
X-Gm-Gg: AYBFou1O9HO0wHHiZ1chUyl1Ym/M5HQuFp1y5jqxSK6RNti6IS0R86iixrGsPSb8/h0
	klpG+2p6bD6SYmZDgAH3QhIQQ88KPmvECD+IBwh1ZRlknHiThVwwga0Lo4FO0OGX7uIQ9fRfzF0
	1GOOh3y4VFGnTmc0cqqkfVlDehal/w4XE6LM1WBAinUXhNABqZdinRafM7+ilhwDEcT0KOPJF9o
	9N6DyTfefRk+7+exeOKFdWtiQeR1k1R1EX3LK/Jg1pLHkPpNpMM87lnolD/VxlOkeABPYgsNgWI
	5yN6kw8UljTow4oBla0iO1BCmtR38vZVgzFfNaRAN/wUmF9ONYLxdYBsHPYbaGKAsrGQxfR6r3g
	VYQs64f1YGAFW1Pb3qOb+Cc1IG5jj4LcSQ3zbbeE29XX1BZQ0ah/8ua6Mxp99MebKnlTiNR0Haw
	3AyfFi+fL8tpyBiBFlaQ9gaq1+ZNIbZK8AlRt8JKucLv5BNqHRuRDN+ZLeyxX7+xnZzjIa7JEzg
	47u4Gtn74CiO8a++aSfCJ7PNoeRUN9Mgg==
X-Received: by 2002:a05:6214:da9:b0:910:3453:505e with SMTP id 6a1803df08f44-9103f06a58bmr43755686d6.32.1788488499889;
        Thu, 03 Sep 2026 19:21:39 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040595f81sm9508846d6.2.2026.09.03.19.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:21:39 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus_rog_ryujin) Synchronize HID command and report handling
Date: Thu,  3 Sep 2026 22:21:29 -0400
Message-ID: <20260904022129.97896-3-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904022129.97896-1-renari@arimil.com>
References: <20260904022129.97896-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rog_ryujin_execute_cmd() holds status_report_request_lock while
reinitializing a completion, intending to exclude raw-event handling.
However, rog_ryujin_raw_event() does not acquire the lock when it updates
the completion. A response can therefore race with reinit_completion() and
be lost, leaving the command to time out.

Hold the lock while parsing reports and updating their completions. Use the
irqsave variants in both paths because raw-event handling may run in
interrupt context.

Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO cooler")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-hwmon/20260812104617.858D01F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 drivers/hwmon/asus_rog_ryujin.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index f4d99c510369..e297557ca346 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -184,6 +184,7 @@ static int rog_ryujin_write_expanded(struct rog_ryujin_data *priv, const u8 *cmd
 static int rog_ryujin_execute_cmd(struct rog_ryujin_data *priv, const u8 *cmd, int cmd_length,
 				  struct completion *status_completion)
 {
+	unsigned long flags;
 	int ret;
 
 	/*
@@ -191,9 +192,9 @@ static int rog_ryujin_execute_cmd(struct rog_ryujin_data *priv, const u8 *cmd, i
 	 * completion. Reinit is done because hidraw could have triggered
 	 * the raw event parsing and marked the passed in completion as done.
 	 */
-	spin_lock_bh(&priv->status_report_request_lock);
+	spin_lock_irqsave(&priv->status_report_request_lock, flags);
 	reinit_completion(status_completion);
-	spin_unlock_bh(&priv->status_report_request_lock);
+	spin_unlock_irqrestore(&priv->status_report_request_lock, flags);
 
 	/* Send command for getting data */
 	ret = rog_ryujin_write_expanded(priv, cmd, cmd_length);
@@ -421,15 +422,18 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 				int size)
 {
 	struct rog_ryujin_data *priv = hid_get_drvdata(hdev);
+	unsigned long flags;
 
 	if (size < 2 || data[0] != RYUJIN_CMD_PREFIX)
 		return 0;
 
+	spin_lock_irqsave(&priv->status_report_request_lock, flags);
+
 	if (data[1] == RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
 		if (size <= priv->info->temp_offset + 1 ||
 		    size <= priv->info->pump_speed_offset + 1 ||
 		    size <= priv->info->fan_speed_offset + 1)
-			return 0;
+			goto unlock;
 
 		/* Received coolant temp and speeds of pump and internal fan */
 		priv->temp_input[0] = data[priv->info->temp_offset] * 1000 +
@@ -443,7 +447,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 			complete_all(&priv->cooler_status_received);
 	} else if (data[1] == RYUJIN_GET_CONTROLLER_SPEED_CMD_RESPONSE) {
 		if (size <= RYUJIN_CONTROLLER_SPEED_3 + 1)
-			return 0;
+			goto unlock;
 
 		/* Received speeds of four fans attached to the controller */
 		priv->speed_input[2] = get_unaligned_le16(data + RYUJIN_CONTROLLER_SPEED_1);
@@ -455,7 +459,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 			complete_all(&priv->controller_status_received);
 	} else if (data[1] == RYUJIN_GET_COOLER_DUTY_CMD_RESPONSE) {
 		if (size <= RYUJIN_INTERNAL_FAN_DUTY)
-			return 0;
+			goto unlock;
 
 		/* Received report for pump and internal fan duties (in %) */
 		if (data[RYUJIN_PUMP_DUTY] == 0 && data[RYUJIN_INTERNAL_FAN_DUTY] == 0) {
@@ -474,7 +478,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 				 * We're expecting a report, so parse it.
 				 */
 				goto read_cooler_duty;
-			return 0;
+			goto unlock;
 		}
 read_cooler_duty:
 		priv->duty_input[0] = rog_ryujin_percent_to_pwm(data[RYUJIN_PUMP_DUTY]);
@@ -484,7 +488,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 			complete_all(&priv->cooler_duty_received);
 	} else if (data[1] == RYUJIN_GET_CONTROLLER_DUTY_CMD_RESPONSE) {
 		if (size <= RYUJIN_CONTROLLER_DUTY)
-			return 0;
+			goto unlock;
 
 		/* Received report for controller duty for fans (in PWM) */
 		if (data[RYUJIN_CONTROLLER_DUTY] == 0) {
@@ -503,7 +507,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 				 * We're expecting a report, so parse it.
 				 */
 				goto read_controller_duty;
-			return 0;
+			goto unlock;
 		}
 read_controller_duty:
 		priv->duty_input[2] = data[RYUJIN_CONTROLLER_DUTY];
@@ -512,6 +516,8 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 			complete_all(&priv->controller_duty_received);
 	}
 
+unlock:
+	spin_unlock_irqrestore(&priv->status_report_request_lock, flags);
 	return 0;
 }
 
-- 
2.55.0

