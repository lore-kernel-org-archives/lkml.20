Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAF3486BBF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866152; cv=none; b=mAwtAFPHdV25s+a75fXmZqbRX004RE2Dk1hW1UcCmNYaf1CoJCeFL5JOe9R0jENQBjVDVL23rKGmJhuvVoRkaUYtECM2C6ZaqDKgyM6zMjYGwYY3n/8HBJmNlFAExTgK1dsCtOsMTl80mnO2KVCCcTvUu0ASHXGF7kP3rSigczs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866152; c=relaxed/simple;
	bh=hvxP+Br1wdZ4GMUYTPpUO75T42uiOGjNEGNUTUrPXZM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LFJtoIUPQlvU44arEyfOEkNPom/z/cUCYorqgxP6dfmdg77+j9XCNpeQL92usE4IISh3Fyp+RfJ5HruxbjhCBjL8QQzunIoF1pGJLCrqbG5uAOQQ7IPty3Y7CdhCsNcguiLxsEqfACerjCnSDe37Fwo/gdQr98Sl+gJUoHbsOaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjE+Cm1g; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjE+Cm1g"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677dbe051d4so2316875d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866149; x=1792470949; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uZmMXlQEPn/Zuz4J8J6iJ6oFHFWuuc9FMm2/aQX315E=;
        b=fjE+Cm1g3l1ezU6sN1LtpyoX0NF1ceaIOEoaG9v6s5EpQcVe5IkWpIr6ommnpiyM/E
         f6doYo5gtCyPBpU/Q4sVGB3ms84njazNYouBMTNxnrB7mAXD1XYhlDW/33HAcDU9Qm8q
         IUDukdl0s4vD6w5yPNCnn2+sHBtGAyOvrymYKeTUN6mi3eXqhEMQO5N1v6nvOtWIbhw9
         YACKec+NUm2oFyVSTCb8EZr9jcIRxt0MnCkEmFbBJLgyPhl9Sc4zTcvQ6NnD5Nd5ixTR
         vyS0RJAdMsZGtKbM3ntrDTnTHvyjeJqnFHRuNn85kMzZUcPEU/Hc4MwH1cqxil6oAF8S
         xEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866149; x=1792470949;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uZmMXlQEPn/Zuz4J8J6iJ6oFHFWuuc9FMm2/aQX315E=;
        b=LfUqSMqu9hxQ5GY55/A452PCgnT/MHQIemIdm4s4wnTLU62vsxqQ0iNep3fDfVg5we
         TUGiVEPs6Rez2bsA1fP6ONyOd0BBu03ccg+gprkOkwVEE8hZGm/z+7t5VzvlE/7xJ47Q
         42ksLxgZKBawvZb1d+hJk5ZvCYSs4IyXRo/JC0Ac6zFdF4eNOTNwgl9EI6CPhPOZpnrq
         l+0cxvz23ZOFqlr8Oi6JtjD2KgzybOTUiILlB3PZR+xzC/9RtjBWB1cXkOEh14iMvcpB
         HZmjolx93rh0rBr3hpUkEz9DxY/eOvJmM7b9UAb6Az8G2rnBiiGWqOt/7IT5V7o5cD6n
         2Fyg==
X-Forwarded-Encrypted: i=1; AKwUvByASJ4ljKOYISRDPwDp3jc2u3G3EM9bA4aQm1Wy5n17S9DpINvjoMk9X9c3oyuN8r/5NeNoEGasK2WTIMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtaI0lBaMkZbbfESDwhJa1cvKUM+tSogtTz1Pxja8GPvWew7Iv
	DmRpPmzitVZ+9Lv8z6JE3NHA3vC4/gUCNe4jcYDyi5lRa9LEcWpN2CyK
X-Gm-Gg: AYBFou00i/qESeUJSikGsxS0nhbMjPv+dVuNQx88cU+2F1B3lJbG+1Pac9dBaZtgm2s
	Ogm6buJEiFgD0Frk5MwGOcO0qBeqC+JYCb7J8tXlpURcumL9Lg5CpBQQa8PpurOedARaKmRpv9m
	PwzYZ4OgchMS4pC7x1BQ++Mzum4GQniqDqDz7y48816/UAHRWjF1iLOKX/0kWblZOazIOzyjuB+
	4uvAtWQicIR6kMH76OQivUu2YbxompKwe+kyyqauUECVFGscuVwG6+QXQn6rTukf4JhDbz8syVj
	vtLplUMVwWDHnE+2RJKf4rCi7Uw4J1ZixC2qEC59rfrn7hsPiiR4E5FTVtTlnQhPG3D4QrXbt8V
	gQsAw/SM560PveEehl/rvq9+VssGt5H9sfXW+TSKEzkIT5YF+Wg3MPOQB6UaDw1O9aUKNeAbQFZ
	9PmQQwlgiKnjAKkDIdc1pAIaOHXNW3yjXw6jdN7OIpHvhGCzqMYV6DZaO+VLhwQECVsg0JDRQ2J
	rdElaGILyJLvw==
X-Received: by 2002:a05:690e:d59:b0:674:a21e:bd20 with SMTP id 956f58d0204a3-67936267934mr2403854d50.78.1791866149013;
        Mon, 12 Oct 2026 21:35:49 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67935606f5esm4448152d50.4.2026.10.12.21.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:35:47 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Subject: [PATCH 0/4] drm/panel: Convert four panel drivers to
 mipi_dsi_*_multi()
Date: Mon, 12 Oct 2026 23:34:35 -0500
Message-Id: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0ND3dzMgkzd3NKckkxdiFZds2RLi6TUZINkc9NUJaC+gqLUtMwKsJn
 RsbW1ANERJ+RjAAAA
X-Change-ID: 20261011-mipi-multi-series-6c98bec0c75e
To: Doug Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akash Sukhavasi <akash.sukhavasi@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chris Morgan <macromorgan@hotmail.com>
X-Mailer: b4 0.14.3

This series converts deprecated mipi_dsi_dcs_*() calls to their
_multi() equivalents in four panel drivers: leadtek-ltk500hd1829,
kingdisplay-kd097d04, innolux-p079zca, and newvision-nv3051d. The
first two drivers also convert mipi_dsi_generic_write().

In patches 2-4, unprepare() previously returned early when
enter_sleep_mode() failed, skipping GPIO and regulator teardown.
Because drm_panel_unprepare() leaves panel->prepared set when the
callback returns an error, the panel could not be prepared again.
These patches remove the early return, so GPIO and regulator
teardown always runs, and have unprepare() always return 0, so
drm_panel_unprepare() clears panel->prepared. Patches 2 and 3
likewise stop returning regulator disable errors from unprepare().

In patches 1, 3, and 4, the original code treated a set_display_off()
failure as non-fatal and still attempted enter_sleep_mode(). These
patches clear accum_err after set_display_off_multi() to keep that
behaviour.

All four patches are compile tested only. checkpatch and a W=1 build
are clean. Tested-by tags would be very welcome.

While converting nv3051d, I noticed that panel_nv3051d_init_sequence()
always returns 0, so init sequence errors never reach prepare(). This
series leaves that unchanged, and I plan to send a separate fix.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
Akash Sukhavasi (4):
      drm/panel: leadtek-ltk500hd1829: Use mipi_dsi_*_multi()
      drm/panel: kingdisplay-kd097d04: Use mipi_dsi_*_multi(); fix minor bugs
      drm/panel: innolux-p079zca: Use mipi_dsi_*_multi(); fix minor bugs
      drm/panel: newvision-nv3051d: Use mipi_dsi_*_multi(); fix minor bugs

 drivers/gpu/drm/panel/panel-innolux-p079zca.c      | 43 +++++++-----------
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 53 ++++++++--------------
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 40 ++++++----------
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    | 36 ++++++---------
 4 files changed, 61 insertions(+), 111 deletions(-)
---
base-commit: 725953d4da85cfb97a4c309fad6346b72f8529e7
change-id: 20261011-mipi-multi-series-6c98bec0c75e

Best regards,
-- 
Akash Sukhavasi <akash.sukhavasi@gmail.com>

