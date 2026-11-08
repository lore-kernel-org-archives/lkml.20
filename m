Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127923;
	b=ZuS0lJetW32kkM/Nj9NwtkkRaSX9Zvt3XSfOwYdqnR9RrFSnd2IPQUwZtvyE35TrlLUi
	 RIfplI5RmOzEyWymoH60dp9yYL+p6jH+TaR6Qmh3eqXOLllQbDj2Tq9HDI2NuLc4dc9Fo
	 OOY0yRZgXklpMAAwL2bhNGEjVAKdMkNWhQVwMbltwAtfH0csBk7RXxFiabeTAn0xTVp8U
	 129L/ylzAT6oymfXQE97WhE9+aDYOlf/9cYKkeG8FBx89I/twuxZB7+S8glRUN6gCRHP/
	 90SXaKZyl8hzYUVgUPiQ60EkiLQbln7gtI7qIcL5IvGoivSO4RJKTOhJ1QbQpYPWv9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RJbWaJjgjN43H+YPwyTietmCaiEekitc0GHzYxRgstY=;
	b=Kb5omZ690qe7jm5rg5WEct6NOTkiMn8b3H7Rp/fcz9N/ENTgLtcq2MGWnfNNwqh5AOKs
	 kSO/joEjo8vaYk6ps9lOka+IJkBMnmkzHlF9nBggltOBQ6wdY8sxp5bgozf0QE87VJgyO
	 b4QDM9xogOkj7BoeQOGAIHA/Jz5ih2FoSVLFWMCgdQmqiDNhAL7ESAQn67CxxibeMg1v2
	 J10pD5nv5XZtVwBzjD5jYMn6pxEq9zoTw5BwXxsH5g23nhijbwI7VVjKwrItUE1OVkTFp
	 H+c68usvoFGafOph17xiWjGrgHtUVkBz8sVwaKQXRHtUc8JAipYGojG6lCT6YT4Q9Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emdfmfm0;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AF5606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66AF5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emdfmfm0
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37000e7234bso949941eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794127921; x=1794732721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJbWaJjgjN43H+YPwyTietmCaiEekitc0GHzYxRgstY=;
        b=emdfmfm0BXFpEfI7kQP2mi3IKOR2QKDvNBrcv2h5RG/pppTyAu3Tb090VyPxFoHktC
         Jf7P6j7UmdoJyL8WvZ1EwwIjUIZKIr9Z9jjHCbo3E5ewN7I5dqpCKHbDY2wE3hbX8ENe
         cfeauQ71hwiYz5HobcaJdhM/ue5yyZVwaqIeK/Ul9cLUuH6lueQ+Ob7tca4POPQS/o6E
         HR3tfWdMZ1gEtGzjD6khxj5xao1x29hFz0lJW3j0etdwuVCrpVOSEGizlMjl4xosUTBd
         zy1+QR3obhfMvgq5oXaGrSFkr41luhJiKZuBp2Ppho0Q3PQJ/Yte/Kw/EhoxUN5hM0oZ
         fClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127921; x=1794732721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJbWaJjgjN43H+YPwyTietmCaiEekitc0GHzYxRgstY=;
        b=i9NoQwHGSHSTQLYUayBKJk5wVK5zEG91+XgFqnKc9PB0qKO9HF8CRbfcaBByOGVoK7
         cddieiqZuYFohU734r1sGwKWjCQrGwvmu+HzxPBDhooQpIoQvpcQMbTo0sDjSx6ufH9f
         HA0a5/Wv7otkM92gOAHMrhmCpi4F5vNAZ38a9jO34T99Pgg+ugFq3lVHHAMeAj9Uf2Lx
         VBLM2SxToaf6nqGEMNR5mfwZEvN10jgwG0/yKSlxlqqX1gbJx+2o0Dh6ofBWSvpWCvhx
         so20M/xqtqhKpnmIcAe27DAHerDaSVRPJ6zCO95b4Xs1F8I8YjRF0ROoj4esqgsakfYO
         eiTw==
X-Forwarded-Encrypted: i=1; AL+hErEGqfTs2ZZk0AZ2ngK7/Kc/0QYDUKwfX5cUWvfVnWEQE6DPkD5Dzs+scWTm+rlaDotmO8aK0lB1s5Ye+dw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4apBewHD6Rtb6zYY10uls0rwpFyqTR9kaxVV2CV690mnfQlFK
	hZl01sT9DjuKzQ16aDGQ3ErXd1RTspvSV7W1+DmRfTVJQ/hkZJ9Za4js
X-Gm-Gg: AYBFou3InONumJQkEvNFViD0ldi/JPLdDIipC0ZTBdUXWH4/ALNedVYli5+UYh4kUNz
	K1Psui8PnjUkFtUoHHYA96xKEf0xPuahZfLBPhUuK7wqtB4HBRwUeyAy46+qjOzwoz/JvzE0unV
	ggsXy8bYGxv+4xf/w/1ZRC5JKQi3jaVO43XugXNDtRTcHAXOD/K8+tAk8mzZTEegpVHjYiPRdB2
	DS1WPlpD4uZKo+TfA1BYW3RgSGG1Ya/vr+v3W+FtsINNFQJlVh5XedUr0alHtRpXGn4WEg5f3ME
	FX1Ug5svZRgMbK/wBGqbChsl58KxEHpQLrcTSYo+te+HD3+mFfPGQW0sdPVBjJJ1CCtCsaQlI+6
	g/NlwyPPGoXTiiY1e3VXmu8c5rnuTX/rBDsjkaUukIqwHzKB8eS67H8XmTjAhsUQh1NHEoG/UjM
	Z5dI96Oo/xwk6PTbt2wRei1yTPsCX7lcJGTgUSIw7Vxam8R9Ym+wxPoJ8nAlogjor9+By4CmolZ
	ho51FaTs/Ojycn2x+vFldgTtiTJO0E3M+6mh+ovcAmxS+96MzzbHKrO5uEVd4yMiQUZNthiTV/w
	528UZV4AcpMjJSXfVIRg14xsRLekrOPSqp5zVnA=
X-Received: by 2002:a05:7301:9f18:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-3725641e19bmr3441153eec.29.1794127921303;
        Sun, 08 Nov 2026 00:52:01 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm4050694eec.26.2026.11.08.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:52:00 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com
Cc: luka.gejak@linux.dev,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v3 0/2] wifi: rtw88: firmware recovery fixes and LPS hang handling
Date: Sun,  8 Nov 2026 14:21:23 +0530
Message-ID: <20261108085126.331784-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series addresses firmware recovery issues in rtw88.

Patch 1/2 from the v2 series (DMI quirk for HP Laptop 15s-fr5xxx) was
already applied to rtw-next. In this v3 series, patch 2/2 is replaced
and an additional fix is included based on feedback from Luka Gejak:

1. Patch 1/2 clears RTW_FLAG_RESTARTING in rtw_ops_stop() to fix a
   pre-existing bug where recovery remains permanently disabled if the
   interface is stopped or suspended before drv_reconfig_complete() is
   called.

2. Patch 2/2 replaces the previous LPS leave recovery change: instead
   of immediately triggering hardware restart on a single timeout (which
   causes spurious resets on noisy links or beacon loss), it introduces
   a consecutive hang counter (RTW_PS_HANG_MAX_CNT = 3) matching rtw89.
   The counter is reset on success and in rtw_core_start().

Changes in v3:
- Note: v2 patch 1/2 (DMI quirk) is already applied in rtw-next.
- Add patch 1/2 to clear RTW_FLAG_RESTARTING in rtw_ops_stop()
  with Fixes tag.
- In patch 2/2:
  - Count consecutive failures before triggering recovery
    (RTW_PS_HANG_MAX_CNT = 3).
  - Reset ps_hang_cnt on successful LPS leave and in rtw_core_start().
  - Suppress raw register dump on transient failures to avoid log spam.

Kalpesh Solanki (2):
  wifi: rtw88: clear RTW_FLAG_RESTARTING in rtw_ops_stop()
  wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS
    leave failures

 drivers/net/wireless/realtek/rtw88/mac80211.c | 1 +
 drivers/net/wireless/realtek/rtw88/main.c     | 2 ++
 drivers/net/wireless/realtek/rtw88/main.h     | 1 +
 drivers/net/wireless/realtek/rtw88/ps.c       | 9 ++++++++-
 drivers/net/wireless/realtek/rtw88/ps.h       | 1 +
 5 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.53.0
