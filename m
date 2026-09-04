Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156C9483BCD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524305; cv=none; b=SCyiJjU/OqwO7tdWcCH5Cm21jLc3v0hhStqFUSZv5+Wd6iC2t0vGL1ow3g3wBpLgZDEEnPHs0FGei/NCvSVug5dKBgdu4D4LzjwuMqQ+ZC5UK5/ph7jAwVeB80kSUFrVk8mzXCaKHQ5YHLdgdbhGcEYGXpkodgjgriO75FvTtGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524305; c=relaxed/simple;
	bh=fhFe03uXtuJjHdWNnkNZhWHk5eyor9PjO6gBO+wSF70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nn01tirh1e2JJhq88YCzOlLTE+JOgQSPNxyOLLbXV1eAXPmdALDL5+jA5SanlsQ/gX6ISiRdiQYQAX3xYid7+cGHlxtXR87Rjx/QFZ+mmk2PqQV1e7USANdL9tzSr3kevLbJ86DU7s0aE15EXx2NSnoBDVJ5b7oXkvjlWEmfeCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHjXLWw8; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHjXLWw8"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1086330a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524303; x=1789129103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+iaj7uAIqLQ0zXKTnQ5GgaFQgbx+QY7l0WvzVqhy34=;
        b=tHjXLWw8+QmSUJ5SOsGQq/Tz4WM2HKFnIMOq9rWgTwOWruBu3IxQOmPv69go0v3JlC
         vDwDpjOsmL7gaKUx+uihiKAn+/vcbf6J0j+D2DnpkBQF4qA0pnrxDevHfaOOpXzRHBnp
         VmU17RTFuCM29IFlhgyptEol6MT3nZJCGTKnqrMIjLaznidfTB62EtCpgZlMJf38N3rD
         xTwnaQZwNioHsHet2u5kZPrAd4toG7Wa68CKBnYYqgS97GsSXtq4PMALvc8UMNyXUxLR
         /b1ky5/ubAUZs8ZiVNXzIVlJ/Rwe9apyw2cMfGbjlSwcxkGtcHR3iHvvthr/0tShrRMr
         eDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524303; x=1789129103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+iaj7uAIqLQ0zXKTnQ5GgaFQgbx+QY7l0WvzVqhy34=;
        b=c7LDcaD8vg14C3/RPIZuJXiTJ3A6x4a9CXSJuUWhbxxyKDrUOXqqXvoSC355yKLmZc
         kQiI2ZvM0HSH8WJGkrGnQ4DU6xXaisiEAerhx+FGd30cVHq/2Bf+X0/BKQ4qnj3Fya2z
         40GDu19GMQhRQdnIkqSiYAn0oZM+qB83iP3HNK9PU1vjylpRCU4UNlB6dpKg7kFKlQrf
         ms4TBz2ZOMyBR0jskFT4BV+N4OsJG+vfncw2byyRHIOk1M389a4OHzaa2wmKp6IX6Joz
         loaw+rjkCNWzORMWn0qeN84/VwBkBjD+liuwib4h/3IP5Hpr06pd94IxXJs7akMSV4XC
         hxww==
X-Gm-Message-State: AFuF++kjU/d1m0gAI9HuwMRHoQRJF+uJsnrmTc1pNzdhH1b7CxKAcNKG
	jBTYB7N2mmBv+wUhtfqMNilunW0hV/jpZc4xZk6lF2hB4CpnodOB/UpP6nf3k1R7WYo=
X-Gm-Gg: AYBFou019v4X46UJh8Wa0CSW4QgufCDtnTULWS5RQDLNCQRts21XMRjLmUOs/hjFgSw
	kLKkd/xBi2CSedxhnGY+6hsIxiF7yJQLpzjFqdM3vYJ/f3u/tlncNSh/IxziDvblW+JSXZrnl7h
	4QZg/ohtuoSAJ56JS9gvSmaU9QHGRNYGszWoWAv9M6Vb9KyEZ1BSW9LKMBSHBAALiYe9z/e2Xhl
	niYGlZaaX3Ee9Mc56EnXIyvRvcnlJMKmEbifvlRY4tuHJQdrLHXO9cwRXdAZKWytvT3b6gDRa4x
	bqQekWxJEkB4huqUFcuDIikFxJfdnVghnqTsm8yjYTENlZAfv6qb4OeidYiKQJ8HHMnivmgpSa5
	ziWml2s/AIGiPK/lDR0wk9LEmKmx0DQ4nwl5jH3wItzr4MtoUf8rYcRCYu/mX4vNhNx7l5eA5QU
	YuZMntiT8XhPCvT94PvGBjM8BtP03wykFfhjQKDQluv/tnijBaRlLskMyfOUfJ51OctOV+aREdz
	HYqipr3VweKnvw=
X-Received: by 2002:a17:90b:5344:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39b261b1a47mr9830027a91.13.1788524303344;
        Fri, 04 Sep 2026 05:18:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm7181575eec.2.2026.09.04.05.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:18:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: serial: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:48:11 +0530
Message-ID: <20260904121813.26714-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904121813.26714-1-hemanth.selam@gmail.com>
References: <20260904121813.26714-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/usb/serial/mct_u232.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/mct_u232.h b/drivers/usb/serial/mct_u232.h
index e3d09a83cab1..f79a1f1b6a98 100644
--- a/drivers/usb/serial/mct_u232.h
+++ b/drivers/usb/serial/mct_u232.h
@@ -273,13 +273,13 @@ static int mct_u232_calculate_baud_rate(struct usb_serial *serial,
  *  Bit 5: Data Set Ready (DSR). Reflects the state of the DSR line on the UART.
  *  Bit 4: Clear To Send (CTS). Reflects the state of the CTS line on the UART.
  *  Bit 3: Delta Data Carrier Detect (DDCD). Set to "1" if the -DCD line has
- *	   changed state one more more times since the last time the MSR was
+ *	   changed state one more times since the last time the MSR was
  *	   read by the host.
  *  Bit 2: Trailing Edge Ring Indicator (TERI). Set to "1" if the -RI line has
  *	   had a low to high transition since the last time the MSR was read by
  *	   the host.
  *  Bit 1: Delta Data Set Ready (DDSR). Set to "1" if the -DSR line has changed
- *	   state one more more times since the last time the MSR was read by the
+ *	   state one more times since the last time the MSR was read by the
  *	   host.
  *  Bit 0: Delta Clear To Send (DCTS). Set to "1" if the -CTS line has changed
  *	   state one more times since the last time the MSR was read by the
-- 
2.48.1

