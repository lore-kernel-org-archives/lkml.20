Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488275;
	b=GEmlYAwAw1xLVoPZ63rVTUyzUE6cMZYPbg6Pb7vkLCl3eB6hnE4rmpkgwuXXO+eWVEGK
	 NP5SPSpKrufcSIHHy0CvQ5PkC4CvCcwXtssecRaM33+YYXyaGQHSYxujtL+j2yB+PurXF
	 9/vYjygGX8GA01COG5PXVjnkER88DYQeBcHE5W5FOqqH/DVUi1+sHmhxW8xKfY5cah6k4
	 y8WvD1g4M7I/0aH1pesmfieYJmR4N24JH02q00f1zQaVYDtLfMG1ZcrARw1EyXkUgJvrW
	 PveMkKa3Q/20G9EoCk3+4Emi7PGlCoOY8CgZs1nrtIlTE+v1zb4pZaTvwole9brNfeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ICsh5sh6nhrY0eYXKrHtLFEnO/6ICVZodqetvGZNSwY=;
	b=utUKOViJbO9sypDnPmVx1Ql0DCqFI2IDEbn/D5tKOvfV+8Dr+l6PEHoBAkWCc2O35zc6
	 oxv8v6SJhZDoFvhxl+3+O+nMDx3QWt4cihzU04Ftj63sBFBNhEhf3BmgP36BczRLQGQzS
	 v+lAw7XbCMWJvGb2ep4csrjkvMNXBv6CU5zvnQCNi1kbis97twcE4PzZomHiHXoqLyc6w
	 fp0AdFhadbnIzXo3fjIXJeh2Ng+YRy64v32Eob/7Lf09NvXf/bjjntGYSMk8IlHWNudw2
	 2jbv9BweglUCXGIkiE8Uftt+HFNzh4d5poV19WfYrifgLerIL3i6ZTAMDM/ee+hb1cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=inpUOneK;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A578360A3816
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A578360A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=inpUOneK
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b042c0759so1941366f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792488273; x=1793093073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ICsh5sh6nhrY0eYXKrHtLFEnO/6ICVZodqetvGZNSwY=;
        b=inpUOneKjBnvK1rYvccx+Jf3O0dImryiH9rl9r0RmuAyh4JERycVEsUWldotNWXXHF
         WVjaXapOrTu5h0KJQsGq/VKjPseXRf67rZQXGXyVqOGq2gN6Akd3FJqrs6vWCi6wgWJa
         FYR0C5sR5+PzmUbe4AbCysdQIJYVj3hU5PeleV7giqAdrMzewgYo1xOdF0US4kx08eFu
         XSdfLvkc8GR6N2maABaD96gcSzKMNWGs8EXsiK6cahImoTNnO303z+btt78Hj8XH3cgw
         +7pXUTjfkgmxhyZkh34WzLckFf/O3DCRanp1rMdYK8VfgScnsHjbS0RqJLnK6usPESaf
         Z3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488273; x=1793093073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ICsh5sh6nhrY0eYXKrHtLFEnO/6ICVZodqetvGZNSwY=;
        b=dD0de93VpzDE1cFO+LPOTR6+OnnF6bEGrBNhhFo6iqSO9Ev+zGxYYTEbh8x7O0nHQE
         YBRJhNsofXdwNQIk84z0Tj7G4/ZhkPpMSevJljVhd+0ui5pA9Xi0HLlrmomWoYGnb/q4
         BjpmvfwZRDl6fmqPqeW8Bbpu3QTvyDAP4ejHZzxxJTYHmo0+GrtXpDOr0EhaIaaCkPh0
         A0dp0N/d+B9TyM2lRa0uN+L2jDEt1TEDaSMO666S17t+OR8eK977LpbJpuJn/gh/a1oe
         9uhKajQNq047kK1hhNHUWhweTuEhEvqoGGP2qVxbytTsjR1KvtE2KqVXfLr56TlfuiNI
         4tpg==
X-Forwarded-Encrypted: i=1; AKwUvBz0gg4fH8gNw32zoGiIPncHmjR0thIKNXb9l+MqDa3rzLIpCUbOzWIaF4Fj12iCaYvZPvzB5W3PshCf0kc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY2TGSgx2gT2AXq7C8oMc4M4AqqS8++V9D2ZlRgK8UN0pCatzf
	9h0VQUsrTTy0nDTVuaim9fR6XyDsTkNHLaNY7mHPtjKfqqHu1XdcQKSm
X-Gm-Gg: AYBFou3KH/hi8AJj7A9fIlGSXltxc6/4W5e6IpCgW8kTzxJeqOiWsL+tW5lbr4s6fgO
	lFMXl0VKLswckIlIPY/G2LR4bg7dASw50kPxPndT1FxQt5Wn+4QU19O9sDCHtNfBPQhL6rtH7Mc
	9XGdlmR/y3V44KagMAeZqIb8gCtFXas1/2oGMlJcnwOo8qTr2gLkFqgmR9mmtyvGDlhJkLgkGx6
	qWUcHvaCpU7RcSZVIyvP0F/VAPUo+jcaO1x5caDtlX1uri7e8aqxZlHQy1bUDMHVEBIfKd5af6e
	jgbl97q4uTJ1Gk4195NM/S0ptvVuG7zMJwjK/plbLu54IjWZDIkPhpvCESOzez2njZ+NNjC7akC
	RRvvLDRvRmhQBs3spEFToUaSNcGSDBwx8pmioKidUviJqIH7jWk/Du/YtvopTUX8n4LOCa7Il4t
	VBTUwV3bOmbMrMcdcJiEJ7PIW8d2tc1C4Q4sFWA9Lp/PBgv/wizB0Xr2tPe4Dq/k89qgapTedzC
	5fxiojtcFSPZ/tx39uztBps+Xf4H2QTtgah5ztYUOfZaNaDtoQJmTKp
X-Received: by 2002:a05:600c:3b17:b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a1d7612c55mr210686475e9.25.1792488272739;
        Tue, 20 Oct 2026 02:24:32 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:f99e:1a52:655b:681])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f6631abfsm40767315e9.1.2026.10.20.02.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:24:32 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Luke Jones <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v4 7/7] HID: asus: Keep the Zenbook Duo input device names
Date: Tue, 20 Oct 2026 11:24:17 +0200
Message-ID: <20261020092423.36380-8-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020092423.36380-1-p.pisati@gmail.com>
References: <20261020092423.36380-1-p.pisati@gmail.com>
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

hid-asus renames the input devices of the keyboards it handles to
"Asus Keyboard", except for the ROG N-Key ones, which keep the names
the devices report. New devices are not renamed any more, so skip the
rename for the Zenbook Duo keyboards too: their input devices keep the
"ASUS Zenbook Duo Keyboard" names they get without this driver.

Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/hid/hid-asus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 6ee2ecca864d..69894de8f6ce 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1712,10 +1712,10 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		hid_warn(hdev, "Failed to initialize backlight.\n");
 
 	/*
-	 * For ROG keyboards, skip rename for consistency and ->input check as
-	 * some devices do not have inputs.
+	 * For ROG and Zenbook Duo keyboards, skip rename for consistency and
+	 * ->input check as some devices do not have inputs.
 	 */
-	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
+	if (drvdata->quirks & (QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ZENBOOK_DUO_KEYBOARD))
 		return 0;
 
 	/*
-- 
2.43.0

