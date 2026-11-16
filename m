Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830204;
	b=xClg7sU/W0WTCVP5bcKaXSEuER5DEknAph9hT4Izl0mtRo6LwfOmgfPBIh66Dqik+I42
	 gYelEI3bniG292a0/5yes1/z3bcFdQzQDOX2OuqEpoLuk/646JoS11dBYMgEuHTizDVbP
	 P/94NATGgou1YpbXm2q8CmF6+n/LD2M+D/9r6CQWv5Ha0kGQjOrSWmW+XO+Csf+y7fVJc
	 of3EVmJRlhRk3W1BrLz0/RsDwOxHw7uf3y3XARzvC5qK7MQMEvZ3cLxAbR9AgOQmox/OY
	 igZUkuCdb0pq3QL2ArMQLyxny/fCYuZupHOl6vLhpBWWGuilR5cgXx/IGSj/i/j7YHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=75BqASa3pQSiCLazbg9HUnip9NSP2k2e52gEQNem2NY=;
	b=APbJyYN94RhOqb64SGlMPwpGd+pFiS5vDdUIulaH9wSIQi3Xt1HzMmwgRdCSsgdAhGyT
	 kwWvtmDOD4dTScd22DOYeBxXPPUrsXcaiygrWhuf/frnk5XwHHYNsrG1OVhRYMZY5zMyI
	 savhcsZpVhHgM/iV94Sn8vSp2eSC/znRf/PCeH7zM0JiziAmGOv3jO0Gyw4KRSgd4qC+u
	 b6tmyH7XQbo9aHwnq4M52Wej+GuBC18mJ6pqJn85dmAxqg00ujP0wVlkW/0M2ntkn26jS
	 vTZ9U+mJ2uHMAefjxlC0K6Nxu7Ea2o2tWNRzyUAbM2rul5wkSQeddqqrv7X2tfLkkWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R7eMeQvc;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0275F606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0275F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R7eMeQvc
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3acff56a300so29122691fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794830201; x=1795435001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=75BqASa3pQSiCLazbg9HUnip9NSP2k2e52gEQNem2NY=;
        b=R7eMeQvcKmV+YQ0RO1A52l9WKu6AgEr6CjleT4AbxpCF087ib+8qBbk7ylI3LyhvGW
         nl9mwEBSL5R3YwT8HcD8fSldh9XD0xvhB1oGKgsDUm3nfxN2sXcfT0rJRpvYfdS+rI0B
         ano23tip8N3VL1zCVMp+MZ4hN0+YQDLDOcFQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830201; x=1795435001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75BqASa3pQSiCLazbg9HUnip9NSP2k2e52gEQNem2NY=;
        b=XVprCl0tl01npbZ/YEmM/i+IyntNPagAK0hXzqPPwhrpATHwnjR/3qxcjJZS+vIg63
         /A47c4hA+U+1dGzLCzvS2CJ/33Y6QLvkUIuqw8NY/yncSGGS0SR/g79rPPCF2uHj6uij
         Ewu1K3qJKmJORu4TM6svA6uxhC95BUKWjF4xUpQxIb3X1i000snWD+aADwTgX/UtOeYy
         VnvB2uUF2c4zBbD1DUA5tJ2QjXwml6h+bnJyNIz1TWThcf3wwQErnUgeqNpwBrFkWTh7
         4ihLONjXuWzNS+QZm/LOgzvTG9YFOUggiAmzAn8u1iE6i/QCpMr0OH+KboEMBSw/CL9n
         R6lA==
X-Forwarded-Encrypted: i=1; AL+hErG04ZmKKwStk394oKGyUfFyQhNHk5ZdBdZKeujz8MiskIZM46oEaJKDyQluR20cHdQ3N5rQDAadgi7ZQRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y/lyLn5ogS8nyQ0BCk4tULac6iURssfCIaRB4ztG4BvlTaeg3
	EuVQI8Zv+Hm/pIFXKELC5ooZPTbvEMPa9mdtA/TVpEeCvzENdZfAgMuqxh9Vb3cKwQ==
X-Gm-Gg: AYBFou2Aa2bfOhrzgO9X4LPPdr9dbKWl4A0kad7itm9Dt8iUFVnu/fB2b9xmuH6LoHg
	1P0yhM3eRBQhRvByN+oU76OZ960hkVaKTDIyUOM+AUUs2rxYMhNChGbzXhPC6azGEwOfx2LpRW7
	NxI3E2NkY514vMTVQcdE+fp8KkUhAE0+HwY+orE2SEiG+wyT6qmdpaCplkST2J9bU4lxtAkh4kI
	WwxyWvYvPM2fmeJFZmW37cXmlHCF9TJok6u/MnA1CLTO+N6SJDdiMGQeYfbuSX8gyMdOd1uTf/1
	GYuhjoPC/w5bFfd+7lvAPnZJfaQxr9/i0OmWXE3FbdiBgGfuXkEVhBMpAHyASNoNa4sRfN7HZ25
	OQHHR4fIGfWT9IjykXoUcHejyvF3HkZieonOtAkMDOKvY8ZBEogtXncd9LhNViqaIAE7YN6rcBk
	WLl0SWYj1mY60LODiIdMRS0W7UqnGo6V4po616xdOexDApuFrWkg6ZHWUe0gevYf/5LLnW5aISX
	q7qVeMCda7C+Byg8doba93nDkZ1CFT2bl67Ej8HM/OPvad9ogD9M3ZWff/oHJZUb40G8MsUurqy
	ExUtBRDbFxSzmK1s35Nm4L1iBxwvAheEYnN9SubdPcnhuUxJpEw/7Hh7IKLlhFe2PZE3VYjwpS7
	FAmk012lvOw==
X-Received: by 2002:a2e:8a88:0:b0:3aa:fd7d:6164 with SMTP id 38308e7fff4ca-3ae2b68121fmr25930611fa.25.1794830201228;
        Mon, 16 Nov 2026 03:56:41 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad7dsm3183754e87.9.2026.11.16.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:40 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: uvcvideo: Improve checks for medatata size
Date: Mon, 16 Nov 2026 11:56:36 +0000
Message-Id: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
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
X-B4-Tracking: v=1; b=H4sIAHTv+moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mz3dKyZN3ijPyiktzUkkRdc9Pk5CQzcwPzFMsUJaCegqLUtMwKsHn
 RsbW1ALgAAO5fAAAA
X-Change-ID: 20261116-uvc-shortmeta-75ccb6707d9d
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Sinan Turunc <enscrpt@pm.me>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

In some parts of the code we have not been very strict when checking the
payload header size; fix this.

While doing that, I also spotted an unaligned and OOB access in a debug
message, so I added a fix for it to this series.

This work was triggered by:
https://lore.kernel.org/linux-media/20261115121701.189-1-enscrpt@pm.me

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: uvcvideo: Reject short metadata
      media: uvcvideo: Check header length in uvc_video_clock_decode()
      media: uvcvideo: Fix unaligned and OOB access

 drivers/media/usb/uvc/uvc_video.c | 20 ++++++++++++++++----
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)
---
base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
change-id: 20261116-uvc-shortmeta-75ccb6707d9d

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

