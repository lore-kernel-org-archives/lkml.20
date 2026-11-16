Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851538;
	b=0f/JBe728uFZi1SvT7W+5CPUSBeZhun8MP77pfBi0KSZh3qXyZmO5XQKzvFklcGBHe7P
	 zT8bAv6dpDm9CZOLIKvdRtqzmowXqLQVOklYyY+zjfgslORzGyKFUeI/MJ4AnG4touG3p
	 AV/hNms//3xj4Tpc3fPYnTcA52VHtSwv6SVdTjrDTj4epRMYvlEeShuCi1ASE8AbYOr3M
	 XrVAV22CSOjjtP0v21AriKn+GbtiJ6pJn6YGF9phYp8zAhHFKw8LNKg7KoBUdiRBJyPB9
	 An5Gef/Ph9b2eg5GJ1tS5MO/Jagyj4RcyGm4sIYgENcRtTkm5CkjKzZgg3PmsnqBqBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=433xRDin6SERxQl4zr7qCG8UKdvmvBEfHT10lpucpws=;
	b=m0x3oQftkAEn/sNrMvncczg3NWIxt3VxdBqkhUTSMzeUrilVwW/bXZeDnwUDtWMfT9sF
	 7ZXWZj0NsMATNAvY0D4M2KEZ64BmuIoizVQHoTXs//x49FwWnaxUi8zQSqNjLA9H3F2Rf
	 Qcv/9sjvAf32wvGbKWZZs6rymm8c/2Fu/yLXtuKs5P9kO/wQ6Aisi7lGVaiiqe0NgHiF2
	 PcSba4p/Dxm6urje/4o1HDuuF2Pxa5Tat2rX7KVYUYl8xM9lXVoH2KFqFqayxftKN/idy
	 m7b7xRfgX0MkZSbcttzX2ChzhJRHUsqk2Mk+xEKSRDsBNMlQdNJJMk7wa9CyBp4musw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WiiQQwfv;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11CB606A89B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11CB606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WiiQQwfv
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso4680449e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851534; x=1795456334; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=433xRDin6SERxQl4zr7qCG8UKdvmvBEfHT10lpucpws=;
        b=WiiQQwfv3C1J+lYmCRVn+Rk4GZnRw+IphmS2VK6qOyfRA9YY4ipM2WuKUKlkI6ba/x
         2YqiFMyz00ABeyanHS/PS6TJRsN+Jj6RJHC4wnTyEbZxoEImDq411q8IKSuqnxrPQVv9
         Dc0l68dIxEIbm6whSJpHoVtUMz2t/3JXQhY74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851534; x=1795456334;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=433xRDin6SERxQl4zr7qCG8UKdvmvBEfHT10lpucpws=;
        b=tW72/iT9LMN2+3FBddLoPYFOeRCJ4Hnza67iIGgoB/61e/WzfOwnGYLXve9Nm6GYJt
         ZRsF5X3fPxSK449dvnu5qbM2gv9o8axgkxXNCWiPDft3b6cvYO5eV9CeWrlIuvbJg/B5
         +ucUOtdm/E7LChg1En9KLzt9/x5FRNDmcaT6UWiSqB3hN9lbCYWSwxi31DFybmZ1X01D
         11OsZucIwB0jjKaSpY3wJ1pvDHTMa9wMVehsnjLzmVKTMqWWVQKJqEmjaQIiAC9V8jZz
         WpaWjaO+ukMsa74FcTzDn3QDaRiBU+uMxfQD96WLl68tI2yosBkRV8T18PLoyX6StxS8
         3R+g==
X-Forwarded-Encrypted: i=1; AL+hErEAf3eudtMRlJhKmbMfXLiJiv4CMOuQEcTTROHGIVqa0PNCoXj0NZ9bKDRqsV4Uhmeb2p1lvW37UvhE9EI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zNoW8YUfMm2V5BtJ5QbO+L3k5zcIdgAR5gc4RziSL1gZmqlpM
	yZ40ttnC3id1NrVAuYSPdvpZLR3+w+cMBVhxz84kVRYX7XmeKvp8cFjcoudw9tdmAg==
X-Gm-Gg: AYBFou07U/iXPtFUEjZBdHYOHXSI7cqtpGCF44rftyA1SJ0AAEleJkrEsLKa8Pag9Ez
	O4yJH9LcbN/ZEOb3GqSU2N6wQomYXAU7BWZUFAsnVVck/ecdGmAW8jRVX8pI0PotyUfNR81YjQi
	KLEC++GequBf1zVsGeAZJrljQgGUDTn1SdrpcNOjpnb34Y5/ISF+qErTLBCY3b2l1VE+E9Y4caa
	IZfEHMAZD/4aqRPzmZPWv9fxDifPJpSSTG/6/WpAgOv/PqTakG4Pko+X5p18Jj/BJed9Mpo6W2k
	fd7gxjerBoO/O2O162qqmnOZevde4vJ6LeJ1+Oo/crBerjpgSygGj40gi/6Z4tguNLyBqLKcWCU
	drVw2Ip0Cow6zJTNI+weIGb8uK+yEOEBKDr93g4XgHjbnUte3e0MrgjMcXoqZ2oWA8wWgL+c1bO
	CHJPMzA6DS79nrs3kwP5lfxL+xJlWkXPjqSMgyWpOvzQm/8flflOosjmP3b4WJtY2KN3U8VRG49
	dqcKM5yN6LNXolg0gGwCB3xuP9R2GY67J1I7EdZTVGBl/L3ZYWdm9Qa+Nsn486AaO56PEtxW4qI
	49j7Gp3GobkAKSw+OKdtoVVY5SbdKirKxHrJ1+nSblF+CrKJo9gjQSPILGRfVQ2AOp9IVSEbLc5
	x0G+Jml7y5A==
X-Received: by 2002:a05:6512:2214:b0:5c1:57f7:f4f with SMTP id 2adb3069b0e04-5c170b36a78mr4191576e87.43.1794851533981;
        Mon, 16 Nov 2026 09:52:13 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] media: uvcvideo: Improve checks for payload header
 size
Date: Mon, 16 Nov 2026 17:52:07 +0000
Message-Id: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
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
X-B4-Tracking: v=1; b=H4sIAMdC+2oC/3XMQQ6DIBCF4auYWZdGiAXtyns0LiyMMgulGZC0M
 d691H2X/0vet0NEJoxwr3ZgzBQprCXUpQLrx3VGQa40qFppKaUWW7Yi+sBpwTQKc7P2qU1tXOe
 gfF6ME71P7zGU9hRT4M/JZ/lb/0lZilo0rbETNmoa2663nsNC23INPMNwHMcXyoY3160AAAA=
X-Change-ID: 20261116-uvc-shortmeta-75ccb6707d9d
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Sinan Turunc <enscrpt@pm.me>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Payload header length checks against the PTS/SCR flags are scattered
through the driver, with different behaviour in each place, and
uvc_video_decode_meta() lacked the check altogether, which could lead to
out of bounds reads.

Validate the header length once in uvc_video_decode_start(), dropping
non-compliant packets with a warning, and remove the now redundant
checks.

While doing that, I also spotted an unaligned and OOB access in a debug
message, and two places in stats and clock decode that used the minimum
header size instead of bHeaderLength when checking if a packet contains
payload data. Fix those and factor out header timestamp parsing into a
new uvc_video_parse_pts_stc_sof() helper.

I have used an LLM to review the code and commit messages.

This work was triggered by:
https://lore.kernel.org/linux-media/20261115121701.189-1-enscrpt@pm.me

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Validate the header length once in uvc_video_decode_start() and drop
  non-compliant packets, instead of adding more scattered checks
  (Laurent).
- Drop "Check header length in uvc_video_clock_decode()", now covered by
  patch 1.
- New patches fixing stats and clock decode to use bHeaderLength
  (data[0]) instead of the minimum header size when checking for payload
  data.
- New patch removing the now redundant checks in clock and stats decode.
- New patch adding uvc_video_parse_pts_stc_sof() to factor out header
  timestamp parsing (inspired by Laurent's review).
- Link to v1: https://lore.kernel.org/r/20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org

---
Ricardo Ribalda (6):
      media: uvcvideo: Reject payloads with a short header
      media: uvcvideo: Fix unaligned and OOB access in uvc_video_decode_meta()
      media: uvcvideo: Use bHeaderLength for payload size in stats
      media: uvcvideo: Use bHeaderLength to detect empty packets in clock decode
      media: uvcvideo: Remove redundant payload header length checks
      media: uvcvideo: Add uvc_video_parse_pts_stc_sof()

 drivers/media/usb/uvc/uvc_video.c | 173 +++++++++++++++++---------------------
 drivers/media/usb/uvc/uvcvideo.h  |   4 +-
 2 files changed, 78 insertions(+), 99 deletions(-)
---
base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
change-id: 20261116-uvc-shortmeta-75ccb6707d9d

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

