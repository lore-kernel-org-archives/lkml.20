Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F00948641B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452001; cv=none; b=psDPqafYybHhk6HReQvAosEM1HFPl7SA4EZFHnm0t31KDb/TTh6PcTzsrGCWNNW8MpvL+tqdI8tAymcDt2/qXRL2djQooG1RRP1GH4HCgX2TcMj8QScEIJc+/QL11t25W8XBaTt9QLHrMgMKsUXbj7OVGl6JWSBFiHKJHx1RSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452001; c=relaxed/simple;
	bh=N0V1DzKLR9gd036eXyTNdTYS26rNOng1qN4IAPCVCcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iG+KuLDM+ttZb+2Rrg0M8LrHl4A3wgFYeMSq9jPUBvmR8Dn0SQJwOKuBIdhsDUJJXMuxrrIuGGyxeBXdN2tJ7dqb12XVRC27XvosiC2W8EhlP3xLAkvYMSiytxQG2pU+TKKd2gkDINUWvsXb9/MopZ1LaZnhFUl42tlQySBtjBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RD+3etBo; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RD+3etBo"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so3426903c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791451998; x=1792056798; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBjkRKxxUcmxMrSLKdMDp6PTFbEMXcXN1ust/EC0L2I=;
        b=RD+3etBotcx4lle5Xm1ZfbM0BIreXRNQfZL2QqtfWx7FA33ejpPNR9ZoPsljDB8LNN
         LNTeYWL2E/SbZr0dvbHDOLmQAlUR2f9vjKk7B9MaxFUBkLakFcSPXXKjYpAO3nZaP9lr
         qLwYhreY9/K4mlVy//fUj/S6MYl8XIHfrxPFmdYKehCot0nAL/Gq2k+Lvjg4ZikDurNq
         ryBQ9oBRe/Sxw2veRXzIONfFtG6ZiKH8R5574Vgk2eGpWJWIZQoV1w2O11wnAeFT9psq
         BTJBpicYcwkz+NkKSOd2eBy/TSqy1qzK6ImwSxwn61b/xQWhqKJdQJPcrqph2/7xD9KU
         9PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791451998; x=1792056798;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBjkRKxxUcmxMrSLKdMDp6PTFbEMXcXN1ust/EC0L2I=;
        b=1XrDzOhPcETzbOBLr4p+c43wYsH8xj1b7JFF/faJ+Ye7RuMQt55+vvVpkFUHncxNkk
         O+nZUVHbt/bc04K2+DqXiI93U3PuQXTuJrX83B19ViWRHb5RKmvDQG9IFv3lS4B1kyug
         tL065KTW2N3iVEYcMKA5Fvb+zVqfhLbqBa8tEXdw0f27Z1XuKszEP/6q5vyRfCVpcwln
         UPGHFTmkHwI+wK5QFYf5BXK3RwB6bZ3WWRvu12A5Rky1QkPD362VfBLRL5E7R6zIM2m6
         ljhDvPcyqfk/7hhzYuSu9gOGGMfw9z3z0qVzBPT2o0npyGGYy0EV2SWXHyegCn4SDWeR
         JEfA==
X-Forwarded-Encrypted: i=1; AKwUvBwSa3qwqL26Fz08ioq9O/UzEMiGqkW3tUWPh0hKIoGKgXvQYE5PDgML99nUmOJyTZO1BPaRCou9ZBD/DfY=@vger.kernel.org
X-Gm-Message-State: AFuF++lWGpvgDAaWcslYgqG84b11pfBN+8Cwy/8NpFjq799Wa7/vs76W
	rkZ4nBkhG3YpBOPL1YefwXmt3bfcBTSXBDNT79/95qZqwfJS4Dskv31x
X-Gm-Gg: AYBFou1FzlxVkOHspjG++/QJEkgoOflx1fHZx97oLxHK4CMcbgGsXLvUYS9TK/bBJ+p
	HchtcVE7rOv91GH7tGYSyuk3lsPhe4LmEqAb60UyMeUHJdin6hhdT5BXaJTllu9Ml9pbse8+KXa
	Iwtdx/p3Ea4Pnipen15pV/80qbmF9NpYyVbQHq/PnPQJEHyUjvFGn18bqOAg902TQSBm5qjlBfd
	KWIHcebbxkopQ/KjaeDY+6TU2kvrDUIcJSSYZms72YFrbhG3caaOzWE86nv03KSkViTME3V93bG
	GUR844tiASv7IaywFAqa4KburD248wXINEVxxwSK8hMfd94KuBDjiR4FBJkhuq5AV8tEEYBoNJS
	yJQi4spbGY98wG7MnawsYnfEgCdu8bnX5jARvOJWGgaKaNPpN19WwsQzE1D92jClqjoNgJUm7kr
	M6yqCzUFgRj258VRayCwBedfy4sT+Hiia/w9yDARpv2LDmKTnU7RjzZKhp/g4J99PAG0avAiEly
	Por0gnXvme5kB6lJIl+oWuKid5RreGRXsVW5vPN
X-Received: by 2002:a05:7023:a4d:10b0:144:c12b:4e35 with SMTP id a92af1059eb24-16209c2807bmr5308207c88.42.1791451997826;
        Thu, 08 Oct 2026 02:33:17 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-162263643aasm16144763c88.17.2026.10.08.02.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:33:17 -0700 (PDT)
Date: Thu, 8 Oct 2026 02:33:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: s6sy761 - drop duplicate axis initialization in
 s6sy761_probe()
Message-ID: <asdjLHHNrrtjIKCb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

ABS_MT_TOUCH_MAJOR and ABS_MT_TOUCH_MINOR are initialized twice with
identical parameters in s6sy761_probe(). Remove the duplicate calls.

Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/s6sy761.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761.c
index a770628d2b94..1afa38850f12 100644
--- a/drivers/input/touchscreen/s6sy761.c
+++ b/drivers/input/touchscreen/s6sy761.c
@@ -446,8 +446,6 @@ static int s6sy761_probe(struct i2c_client *client)
 	input_set_abs_params(sdata->input, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
 	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
 	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
-	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
-	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
 	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
 
 	touchscreen_parse_properties(sdata->input, true, &sdata->prop);
-- 
2.56.0.385.gd3acb90ef8-goog


-- 
Dmitry
