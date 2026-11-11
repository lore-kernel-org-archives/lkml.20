Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391976;
	b=4zAkbSgttiorx4x0fGBn0TNJBcmphz5q2apAPIs+aK7JvgnAd1hC2Xji7YyBcYCVTLlG
	 FyU2ONypMEaXdozC3Ae28kKZUwHapOGHGIZ/dsXxICHT+BA22Rt3cOTpO1249za1L+oko
	 T4KLKhiGXPErdkOjR3bPrcA+6RiZk8mXllE3jnWAUC3J4VJPfDFzZ8Mi7vLEfuNjQX18z
	 xe+Z/ilZDTCa5i67gvaTMPDFslt2eeDeznx+mtSZoAFWJbmNanivRvzl+m8PPcNNOJVgt
	 ctiVaC/sQy4jZFInKcqLEeCdBBcZuKmNoXRNQFgIewVhWd1/ksnhlNijp9QTGY1EEAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oXvxlksaJblGC0L39L7NSIn5/6y+4uN6j+x6V/9C4m4=;
	b=xg2tsp00TOqLu25SelMe9NMzIWiDhF7qQ9kRTZvrSRXEL73+ojJcnKY19kMlTzmLb4cA
	 2BMo552VYcu37GyzJST3oP5yB1/xe2nxPfQnuDJitEM06bYon9o2vCydIQeB70QVjE9RB
	 AOpjJDTSWcWpjo5nLVKOTA0j5XM9qlB+He4EeZaTZVoHiRRQ8lP7g2D2M03mJhHUNxeU+
	 nL5o3ZvlWU0pe0l36eoYT2d3gtEtj58MDTGgcdWAZiIw9F/pakyK9/zb8PHfhnz9yI2+x
	 KcIB50FgajdI6ayOs6Psgz8rlBtoQVOfDGjoObC24l38g5dJNAMsZ4jW3GKr8C58Upg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GjZIysKJ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC8E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GjZIysKJ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso23067855e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391974; x=1794996774; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oXvxlksaJblGC0L39L7NSIn5/6y+4uN6j+x6V/9C4m4=;
        b=GjZIysKJ4Zo2FlOpnPA1lY8VVf9/PtYoWL543A1B/i17u/UzF4HgAOSIkZG3XqiIjV
         8tpXPUvSD9dVnZ5gwBl5JwVyHqXgT9LBOWEgLnbBwNdhMPPfku1YEA8f9gQI1+5iLKbi
         2+fTxwx45wGlGBqFmOmBUI3NPzmw0ooFeFIT3RTq/mbdFo/DdRnuzbWBYD7g5R5Xkm+v
         RHUREHYrHIoQ5Wm/XiymthUrkeEIiCneD61gxkaVPL1tmcPIofT3oVexztatde8HaVcb
         jpDlFQrShb/Qqf6Uh11pfb8g6Zc9+cdXXn1u3QS9wWGNcQF3paZC5BVrAigg4xoHKpqR
         Apcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391974; x=1794996774;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oXvxlksaJblGC0L39L7NSIn5/6y+4uN6j+x6V/9C4m4=;
        b=XOjcK1c+bXFYWT45o4MRnlqMfv8GFnvQlRkVM3ubIU0CCdhZxTQ7RBXgXCnnalZQSR
         IFHzdsBZwjOpgZdEs7af1gNVewrWz+GEEFVRwHAGoZZOwkApMVm6Dr1YUxAuaUSa/ics
         2+PB6BDk7B22oWBnwxAUNUO8heqWXcimOqcMkg4aSwP9hZDZbxiQdLGAJ6GGCGpbIfti
         m2BmmqUjaIXJIn6DwK7opKRi6PUi7rETBN8/uj6PSunbJI620NVCGrz+3bGqLtrLBpQe
         snuDQTcrKvGDctKVUHPj6Vw6Cmv10xkVh03tcy9h+yYYQAJ1F/Ajr8EZniG70aVV3bTg
         oyAA==
X-Forwarded-Encrypted: i=1; AL+hErGS33K4ekKBt+uiPYE7gbza9MZket+gCjEeoFEoZRhvVRT5WrQstl+I1fiPgU7PVKeNxTEpvUj8rgbacZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BGea+pgl/GZ7j4JARoCiuFFWTxnl/H5vbZkJV0Z7uyWUo1OB2
	lAjpq//G3u1BmkOJV49XxQSyrZRGV+NbtPH3ZDNg4OLmoUaEP788Jqoj241/dIS0R4IckQmafvI
	skRugSPA=
X-Gm-Gg: AYBFou05fLqVvNiWIN4LdTQejVNCTRs/1OQZPc4QldjNuImcGwTaMqPVJS8UapvhVKh
	4yAw/SoRwCTrSzNDRE17MLFUf1lhbWWFcG8moLK2TnOfo/G/vrFL7hnBEiImrD7j21+bkLNMal7
	75aMU6cEVO8CEXhOBZlASO964OkKjKRIA0Gsua1GIesDum/KDlrGd1O97WXjV+M1Ythiv0Wokfe
	MY1sV6/WHOs1Uv+5Mw9Fprl3iHaHHEtuGjS+7iJiKsqKrMA/wK0Mp5vE3VLUKdtS3b5Lk7KJo+7
	6t+Ygk9il0C6W5PTecRLaTCPl65AipjkhNLxa3EpvQjNXMgVIlnQkSvdNe3KDXrK4mPufKt/5sa
	VvxUW1EuocnNu0J1Mopcs0T9M5KVuaO+e/nvwF14WkgM2aKU6T0aYEIkixciqUdQnb/4gFS3VuM
	ABhg+Ox+qFmX5+/7UYYaFn4sToNvZZ9A62cFKPqo9xnIA0rdXW8LX7wN1sPIW86966mQlZT9GIR
	2G53ONFwZNnS3g9b0avR/Nim8DEhlM4Wrhh2V3DXa1IIpJ5miAbpc+CX/3Jv2zj0cbO+qvasNdl
	Msr0vjooF6H1a/jSKJzAYhnyD00=
X-Received: by 2002:a05:600d:82e8:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ba093a902fmr32682805e9.29.1794391973923;
        Wed, 11 Nov 2026 02:12:53 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm124194375e9.10.2026.11.11.02.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:12:53 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 0/2] ASoC: meson: gx-formatter: change stream lock from
 mutex to spinlock
Date: Wed, 11 Nov 2026 11:12:47 +0100
Message-Id: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAJ8/9GoC/42NQQ6CMBBFr0K6dgwdCIor72FY0DLAKLSkLQRCu
 LuAF3D5kvffX4Unx+TFI1qFo4k9W7MDXiKh29I0BFztLDDGTMYooZmhtq4vQyAHoyfwA5vO6g/
 gPVcJIaVZVYt9PziqeT7br+LHflRv0uEIHkbLPli3nOeTPLx/fiYJEm6SlM4RUx0nT1UuHStHV
 217UWzb9gWq0QqX1wAAAA==
X-Change-ID: 20261021-gx-formatter-use-spinlock-289b3e2e46df
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Bisk8TI8S7BLxKLf6s4XhQgEn2v4oH3ufymXr3gbBhE=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7Jfcf+tnuI7rVZ/Sw+13DifL+z5rsbLxPXXKjsN8m
 3hF1MPFHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIjOuMDAe2+cgvmDBnRmvT
 rHvsrx2kbBy+zivWWerNzPPj1DSmZWGMDJear/7xEu2Qf2aa91j7s4Ud6xxpnwshdwsnyyku9ft
 9lhEA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Patch 1 fixes a pre-existing bugs, present since v7.3, reported by
Sashiko [1] while reviewing the series adding I2S input support for
Amlogic GX SoCs [2].
[2] depends on patch 1 to address Sashiko's comment.

Patch 2 adds a hardening check suggested by Martin while reviewing v1.

[1] https://lore.kernel.org/all/sashiko-outbox-176054@kernel.org/
[2] https://lore.kernel.org/all/20261018-audin-v5-0-4b8cc13a1b22@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Changes in v2:
- Moved 'gx_formatter_disable()' under the spinlock guard in
  'gx_formatter_detach'. [Martin]
- Added a new commit to introduce the 'lockdep_assert_held' check before
  calling formatter's prepare/enable/disable callbacks. [Martin]
- Link to v1: https://patch.msgid.link/20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com

To: Jerome Brunet <jbrunet@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Valerio Setti (2):
      ASoC: meson: gx-formatter: change stream lock from mutex to spinlock
      ASoC: meson: gx-formatter: add lockdep_assert_held check

 sound/soc/meson/gx-formatter.c | 26 +++++++++++++++-----------
 sound/soc/meson/gx-formatter.h |  4 ++++
 sound/soc/meson/gx-interface.h |  3 ++-
 3 files changed, 21 insertions(+), 12 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261021-gx-formatter-use-spinlock-289b3e2e46df

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

