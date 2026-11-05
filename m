Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900594;
	b=Ab/hB8BnVwSB5DBl1/zzx+g+AfNpfqfTUZYuHPwG+meA2axdxEPyOYuxeBfEV6nO+YSb
	 rzMfaWImW5c0Dlu4Gwenpp2F5ESL59OL6Vi80HQ1M6GoLn8YWDEyKmOJaCJipL16RGCdd
	 LBvDu5RBQ/aBP2tn1IZzpaFRY+zw00POvrIQHJWEAh4lkIe8Jya2Bv8tenXKLBi4wVBm8
	 PqKqxlymhDy0EpH6BXVCXCIuDeto1Sz60gwU7Mzak0TzmnzEjuJsR1+D31pqThS5+o65i
	 jC2BDqXbwaa2aOy4UYlvK5QT7cIfHqR1Lc7a1aWvxCAU6pvyB39fgjfIn92XeEn+/bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FXWweisIimkht5Pq5NCBqOipAtAwASQ/Tc1CwWiphJw=;
	b=KYSqK0btT/6wGsmtSiifnG6l7+gph+T/VESE2H2jXHp6tzPXhFxxT1GJ+OUbaPcZ0/mq
	 MiK+9+UouY6+LbbZP6lkszR7OUSgx/O/Ou9dWZIGWyGSmKsX1vaXH3SY80hWhtWDAo/WZ
	 aPyJvF6BtuDvnHbejSBDF70iolp5taiqbGt5O5WsODmJG3pdZFG2BJf2wYkLhsfuovFU5
	 rPQ1Pqti8gh6yysL8SOlSTLJdzM60T076xGa8lA12uK9V6FE1F9LNE7x9cfvb/BRSla7a
	 WX/aUFlOeKB4S7z317UfFXahPSp4N7QEWwRTXs8HopfCvsXWuIYE3sZIKyTmaI9jPrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0NF8kYm;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65100606D802
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65100606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0NF8kYm
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so965070f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900593; x=1794505393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FXWweisIimkht5Pq5NCBqOipAtAwASQ/Tc1CwWiphJw=;
        b=i0NF8kYmW+NC59nd7JBd2hvyXiK7YUHTymxBhFwVITBVi82siH751HKJQ63B9EMo2a
         Vlufiopi83PN9Y88qA4VYJvwH8xVq+hI+f+gFytpAN+TCVzud5oV/P52bFAOsLf6GEQi
         AcAzAG8DuaoB58/3eFs599caSDacHSgqsi2CVkkb1uqqHcX1TSNPrA0PYMGooaP1clwk
         yUh6ziJpVsus3nTtnfpRYbLISSvS+pmu1YKqR8wniQNRu8wjaLjDiqDGWHuM1BDrqZgH
         rOUeobOLLnOynx4fhLH1kmY1lTg2eWCjK9Awn/izbEaIuzvyFpNA+u36HDZzI+VP2hiP
         gcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900593; x=1794505393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXWweisIimkht5Pq5NCBqOipAtAwASQ/Tc1CwWiphJw=;
        b=IUPxECgAjx6su5yG5ZZ3ilvxQPATU2acEnwAiPaZ0gboKb9UYAgxvV64WyZXRYJvPU
         qEkyMqAEiNMSyCEJFdaMmj11OeWIAGP45CjwK1ZCuEeooVLPStuaNYRw7jeiHo/2wrCi
         HXvsRd8OihZxDfYkTmQFp6GSZYAViDGqKCQQ2vqJfESY2q5PhihHZ0Wa+19xQe1SaI34
         dOhmsIMmcCG3Skr5NI5mJrv5M454ICw3cdBeqKaO3pqivTePAZu4OUJAflRXmYXSWiSY
         FRwEpV47aBh/mtYE1J95bR1Ks42E1jsWTcjdm+jAMrXf8vqGvUK42xI//FzgVL1C7Wek
         5t2g==
X-Forwarded-Encrypted: i=1; AKwUvBxvIfYr3PIE8kJiaYxQw56i+7vn3O2MHnncqd5Y1co50fUp2+kojEqHR1iOIakyRSyJlfLi2pwG5cwHSsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qC1E2AC7sJ963MlPJnGGkq8CM++dToY+KX5L0FBkgNXZmhLnC
	/1s07Nr7TOa2uJBmTJqoXP2Tq+6Fuv0hvL3/v6I3wVUhBH0AXxh6j5VO
X-Gm-Gg: AYBFou0HyoUB8F6d9htz7N1NZ1xugjUw0ass8Ympdo5XupMxjK0XezERI2+XboDAPs7
	tzhIOyt8ISyHtFDxmLJC3z9/jldhNwBwm7eQrwD6aeMa4/7tZjDE2txf3OvtCSiZjntW9aeVcjF
	EUKMzMv4SlBQPpYcUoOHZ4L9QuEuykRhpvqu+Hp1myB6oypMYBaKU2Q9O4RVoa9O8pl75EpqGb1
	Qb3YPD+xuesnel+OIT9+g8O3bYt2Vt0dTvR6mqoJc1tBbKPfWndPH6xrcsEZHYqzNp+a9npVnfi
	CdUXwyAbo9LF5UwWhYuc/NOn3JlhhIknQavRNbcBz1+3mYntUZKvSDtJw/OwDzGQvKcUQ0EdCaO
	w1r5N0ssP4tKbosDLJR2Ak2l6MsV/TexUWd7KvsCKl3PgvKTSuXcbAvS4p5sxnGZOAcGw0Etqd5
	b3lhvhn8hurGKy/l3cIOFDrawkjN1+XZYabp7f28R2sNnEi9fF3LInSrt7iTycRVWcw6Ou3y/+a
	837YjWgkrL3eCup7QPIZkUVty90cxeY9ojRDRcAaE0Bz433RxEJfFS1IMQZJL6ywh7+fj2i8iQX
	PdjjKQ1LlUEK82amWNM9SciLEdVkGAFEsBvGqqUKG4ZGmQ==
X-Received: by 2002:a05:6000:22ca:b0:48d:f3a5:4563 with SMTP id ffacd0b85a97d-49274bc839emr695784f8f.20.1793900592571;
        Thu, 05 Nov 2026 09:43:12 -0800 (PST)
Received: from cachyos-x8664.hgw.local ([2a00:1d34:861b:8500:1b0d:8ca0:906:12b1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm10182903f8f.43.2026.11.05.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:43:12 -0800 (PST)
From: Muhammed Sariyildiz <asiyee994@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: multitouch: Preserve class quirks when inverting orientation
Date: Thu,  5 Nov 2026 20:42:52 +0300
Message-ID: <20261105174252.36714-1-asiyee994@gmail.com>
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

When exactly one coordinate axis is inverted, mt_probe() replaces the
device class quirks with MT_QUIRK_ORIENTATION_INVERT. This drops all
quirks selected for the device class. Applications created later
inherit the truncated quirk mask, which can break device-specific
contact handling.

Add the orientation quirk instead of replacing the existing mask.

Signed-off-by: Muhammed Sariyildiz <asiyee994@gmail.com>
---
 drivers/hid/hid-multitouch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 4e19a0c..94e83fc 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2155,7 +2155,7 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (hdev->quirks & (HID_QUIRK_X_INVERT | HID_QUIRK_Y_INVERT) &&
 	    !((hdev->quirks & HID_QUIRK_X_INVERT)
 	      && (hdev->quirks & HID_QUIRK_Y_INVERT)))
-		td->mtclass.quirks = MT_QUIRK_ORIENTATION_INVERT;
+		td->mtclass.quirks |= MT_QUIRK_ORIENTATION_INVERT;
 
 	/* This allows the driver to correctly support devices
 	 * that emit events over several HID messages.
-- 
2.47.3

