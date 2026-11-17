Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915933;
	b=z2jId0WlUyrVE+3W9IdbfWWwHgI4ODQKbCSwJLn684N4Nfb4Vc61SEttDvipoJNgtYBB
	 p6XIp+gEGPVV5Ur8jI7CpuJjJZJvE6jbDKTU11ePjbstg5yaZQSCuuWorogn8w8PT/5FD
	 qPhdRjwV3AHnflwJUjMR1NSH2TZoBdXaGVKsXRxaFKHbgacOinWZJ3tzCApkMNWAA+ITI
	 96ECoVrgnyy+/MEdpDy81MzNP/a2CezX9xnCqYVBuwgNYW9zIKuhQTMOl0PopbWQiAPEz
	 T4HBhmzzh1jtnalPN/Jw6T62QmWK83rGWGIjh36qaS2Pe2MWz55mDuNIWRXef1iCEtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=17Of1ohVlTnK3P4A9jeZWTwwsZHNP9e2kxpo4Cftll0=;
	b=wN1dd7FdKZLiWdyNUoMBwHzULGcC9J/VQ2YBzh8wngEhKq4kex27p5fmddXQUsOTutIb
	 5mQulXrD7y5wgCBXdqxM0odsn7W2hBPQ2hAbmWUE3Z2AOYYuiwG75NfkIoDVU+kDdy2JF
	 xSLl/c7vuGqs4ol21iFZdhhSPLHQr4Wu0jLkqDMtQEkQN3f9ujHvt2x89cKqFwB4A683W
	 CMTpS6PoyjRmQCjpWsXbA7Iw/1XAB/S65sgyXybxseT8oxK9UHOvlxAHFwMaOuSUpJlsj
	 feAZaooztzyXiVvUHXKxwJvblX5S27F4ge51UUlBLcEGXBfpFvuS2ap43EfWKLpwyfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=S8I8RmoN;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CFE606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5CFE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=S8I8RmoN
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c17a1775fcso2908969e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794915931; x=1795520731; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=17Of1ohVlTnK3P4A9jeZWTwwsZHNP9e2kxpo4Cftll0=;
        b=S8I8RmoNLJKbPWlBsMnp6qxBDKnOAimv5Lv4AbuMtxCxxooienFAIRt7stT2m/7d/l
         5ze9aOCWZ8EMaQOAEdq7w2cEApjUiek0Z4C0RKeamBqE4dR0DY2pKdgGVhUzGxjW/Ucs
         kf1NaE84PL3nA1NwPC82stJux+MbGzMluAmW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915931; x=1795520731;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=17Of1ohVlTnK3P4A9jeZWTwwsZHNP9e2kxpo4Cftll0=;
        b=Wrr+eqbAJHRvJsz7rmM6L5gcEvm2l9uMca1QiS/soO/WhAkZM0ecqZSVlbokwNI+v+
         nZRncJGfdfDg2JKMnjXXWw4IY6+vAtA2sbe+naTApXFUmVKnmc0H6TgAiJy6tRFRVCyD
         CjQuCR4MtvGH7LUQSPgHKSatmR86epnNK1rEP3spI35GixMAsUSO2aihz4yu8DLV8Uhs
         0aC3qZ+buq8LIUtRRzY4Cqx2chNCnz6Yuvtuh+cvFDrBm+Af0kPqIRlOVnapMH6mdv+V
         vu0OwDWsCL4y6rhHysbWe+6O5JRtDVQw+rZZPR0jCxn/hDgpKYUW5m3rxSkvyp+69MiQ
         /0ng==
X-Forwarded-Encrypted: i=1; AL+hErEyhU4FdLGJDniHPJq30dqdyJwJTJRPdwJEKTFgrRmZw/oZ9jAbDIprGX+YgQqOJs310Yz3Ct4CkeV1XlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m4pBEVJ0Oo7jvLbHwLsbgxDJSvx8pS0e3maUqX7CADf/8+XHv
	CFMtUQV+ojxt9NQcWsAwktAMeJ/DSBSEpfnAew9mSHBQSra8DG4yMSOh1NVKwIj6nA==
X-Gm-Gg: AYBFou1HTG7UeRHvp2pZFYQR15afFnTpiggb0Q96xL0vug3yp58Y1z0S2k9vyLsiDI4
	NVVIceZPwKqLEoM3z8CKgkUtTKSvpqIWJdnIbzc4UDxSv1Pk7z1F+N225Z7sWEwSgpW60tXkd7J
	N1USJQKXyf5u8SUGxnK5c7a5V+TZdQxhe/l0ZsobJsjzCKfXuR1gSYi6sXmxjZCDTLcsf8o6LYW
	cVlpyISsy0XIHGM2whqj9dPaL5UfqscLgFZGH9BfZD4UEJz+Uk0oDteDmXe1Xg0wOlmn+tgIqgK
	roFJId2cgmo2gcK28jpJVMLVZZNSUAvZ64TBbSZIca/L4+N3Y0kmamgaIlqyVmCE0KlNQadh5Gl
	bzjSSWOHag/XLaC5KWWrLYiGGoqnJponkPh8a1IEEy8ZQCKwnxWtzXNSs2bzmFC3UzGlUyupk9d
	dTp3IabiC8UtyeB6hM4wN+KrF2fTszcj4NovUvQf5ZxEWu2LkgMDmRWoLHoS5+TY6I5bFxEjyPx
	elXACQg6SYULQtdVCnvc/8P3FnRP3pBs9u2NELPW1Z+cZE6imjukXlxvlclScJHaCAwObLSpifN
	c7M7HpaNc36FMQCfVvTKUYpCP8qRj/y0GooQ+AX6rGc8p+FK7TTugH3wijXJ6OkPHbFivpcIcZ3
	fzNonYnH9Tw==
X-Received: by 2002:a05:6512:3182:b0:5c1:5bcc:bf0e with SMTP id 2adb3069b0e04-5c170b1c308mr5151649e87.14.1794915930932;
        Tue, 17 Nov 2026 03:45:30 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9dd4sm3955141e87.7.2026.11.17.03.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:45:30 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: uvcvideo: Fix HEVC formats for DJI cameras
Date: Tue, 17 Nov 2026 11:45:24 +0000
Message-Id: <20261117-uvc-dji-v1-0-7cb3cf3b4b5a@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQ+/GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nz3dKyZN2UrExd88Q0C6PERFNzIKEEVF1QlJqWWQE2KTq2thYASjd
 ud1kAAAA=
X-Change-ID: 20261117-uvc-dji-7af82aa572aa
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
 Jordan Moormann <service@jordan-systems.de>
X-Mailer: b4 0.14.3

DJI cameras seem to have incorrect descriptors that do not set the
compressed flag for HEVC formats. Fix that.

While at it, fix a nasty warning when the buffersize is 0

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: uvcvideo: Do not setup queues with buffersize 0
      media: uvcvideo: Force the COMPRESSED flag for compressed formats

 drivers/media/usb/uvc/uvc_driver.c | 20 +++++++++++++++++++-
 drivers/media/usb/uvc/uvc_queue.c  |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)
---
base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
change-id: 20261117-uvc-dji-7af82aa572aa

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

