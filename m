Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9492A456297
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727112; cv=none; b=EPR6fD4Rs9vsaOAEg/YCUIy17z44EHEM10GXo2b0LerfgNBXyXxPcyVI5edxKn6vqn0sjqYa1FQ4w5wNp7A5eA1JU1TFjTL3tJZOZ53MgBkZbtuKyN0oqRH14KUS+j0koUPbFhLTQ/MhNesdqwO8+Q1+xIHtV8ntlrrMrv0lW68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727112; c=relaxed/simple;
	bh=kZai7cDOlZ0+l6zlb8MOoVY8sOR0vPM3UXr16XTNIpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNK6ic249kNPU+HcmpBeyUoJRYTtsoxZAyrVzFoYohUscqbtPVFpC3xR26EIOuM4VXv8+X8tMWQG6LgMmeUedzT7IfXy9PnOwj/2YusOWj+ANUG3YY8+yNWGezEZaWasMxzEpaYKO17j9CstGqzSO3B1gLSonY8dfq565cKddps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDdIRD6k; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDdIRD6k"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so637922a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727110; x=1792331910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Byus0DODj6fofwroehsBhvXhreRXoniXBi5MxJoOlL0=;
        b=NDdIRD6kMpIXPWM32EyTX4CHZ917b3pCAW/G5wtqVdCjQ2MhEtaHi9QvEboZ/mZaLN
         Lnq+uBPkJIG3kuWmJlfvj4+OWwxHLar/Qm6zgxkxBfywCIPTS645KRcYx1QgfR+YVpo0
         GGT2FSjI+jn4PkaGh2kc/tQKTIZZwkDPYf3WkQx1hDrwPi5LEiUy0YJf/uUfRly72WRR
         RdOm1OK+tGC4Oe4c8kcuRdPOhBAWqqOt1iKEvBMMZXiub3Mslze4uPhd5dmjpUrYxIeF
         X2in/jMmL5oY8/jodnT0VfPnlKfA53s/ubqsQuX/HJWvusyoZis2V6CA5lIEA6sBSNAS
         ikeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727110; x=1792331910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Byus0DODj6fofwroehsBhvXhreRXoniXBi5MxJoOlL0=;
        b=O8ev/0WM2BNc6s031pqpD0t4eZJJ0yEhF3kvI0PYtdiBN8BL7Q9994doomViqKJZFh
         xDX1Sy5e83JibWert0R/uH6UJycB7K1VwSJQZb5IIgDWm9F62Q8MVRhHV59Hv2c9dw/n
         zSllGYXFaHtv2PT6l0z7sURmz6MDtYA4Jujv/k9Ptq/8Z4LsVgvCuur8CpLG1zyyv1nW
         AkhiqYRIr1DvoTCAGI4uj2V4PCfkPoUO7DjHQGibdmlpTkis2qgRzEIQIjZkIGfJVN7g
         0JsarJInoGF/R39MSUIIoCmjkAflZxGxs97uqrzMxsd6Mr3pqtNYeLLwMnf5rldf0pvA
         b/+w==
X-Forwarded-Encrypted: i=1; AKwUvBxTQwdkVA/3NH5NmbFfETsmE6vf94frh2IhzLwQbEk3mAG8BGfUEzfR8DzRh0qnyagfTMNEoGS/tVcHW5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNjHq5RuH5o9RZKWrwGq63sieXbxhTOFM1UACQ6Sbiv/VrLFb6
	QASibZYZpGqLqxYueOX5PwfOoezI0cMlygKEcarDJIKQuVXCDJjEDU88
X-Gm-Gg: AYBFou24R3c84GanEiEozOQtr+BSYFk4j2xk4AZCGY2QXVsDAxJQua5zwyoTEmsiU87
	cqIQfMjj1wB/iSIlXeVbd7BVc6bz/5CBBuUCHbqPHmXgq02ToEH1z+PogBmEWjO+5YMWWmdAeXy
	mec8VjV3HtUOdVSi8DFuXBHv8hSrngC1eKjydDwjzBv0XXgd+r7naIy1PN6itIA1Ui7J9sl+GF/
	5OiGG7NbeL/smKtEJ5VJI8NL8gXYWBoXQewNyDr62NoeZIPJ+3klbdqJKquM3TafXJbGUfPfVD2
	+3/iKvH2BtybuD5ReUWYVcZEmAUnhXAcfhpSloox62dg3DkWpmKaXIQvCWSpgjzSUMifq3K5V4i
	CMvs+E3ibzFnaWItGhzVYwnZTF2MLznlrvIZsMppGOxe8uyQ1KZStzZ/cXGsmmULY6D+FTO02Qa
	okaETRycG4gd9K6kd4NMlgeoOE1ym2mxW6XeIiupsgJrViGyGrPfy8Vkcfm8U57oMB8lrPAcsJ
X-Received: by 2002:a17:90b:384b:b0:3a0:295e:6e61 with SMTP id 98e67ed59e1d1-3ab3a953717mr3582472a91.12.1791727109922;
        Sun, 11 Oct 2026 06:58:29 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm11831648a91.16.2026.10.11.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:58:29 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v10 3/5] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Sun, 11 Oct 2026 21:57:46 +0800
Message-ID: <20261011135748.11792-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011135748.11792-1-qby140326@gmail.com>
References: <20261011135748.11792-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101 (Fn-lock disabled state)
- 0x00012101 (Fn-lock enabled state)

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a6978d14b975..93a519b96189 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

