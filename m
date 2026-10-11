Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31A154781
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791679413; cv=none; b=SS5IWk4/1sHj7Lal3PUd4GOb4zKHbBdV8Jaid2ty1skX5ovIpzlfg2q6hgkCzrjUD5lZr+rFxpvUy4npx3vkZNLzWoY2JgCrPRGPHWicXaChZERrov0zbpWx9bXbVPeLJf2DSx9l1b+N9yAT0thst6VNYKeAJv4ijM0fSMMyRWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791679413; c=relaxed/simple;
	bh=jZNt1ZV4wpx5fuswN2QfhrfNVFBBOsFWlIrHoSF9TNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hhr7PI2b+ygJJT0bUvAYUe9XiJZZmN0IDGiPvTAUynfppUHTaD4/En9F2qZDYG4c6Uvt/+272ocr6lakBRTzEoRbWS1gfuKGKkrv4SEi9JYTJe/ITWCHKP94+JVWAMJsFkHVdK455UvHW02Bs7IBIA+95rievGqya2yBB+w2QSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZ3/wQl0; arc=none smtp.client-ip=74.125.230.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZ3/wQl0"
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-534b7b19206so10205301cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679411; x=1792284211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/sSbLwCPSp4q8xFYrtdK+Sl95iWhYZVxZM9PhMl9mI=;
        b=LZ3/wQl0nJugaYuwpyt+WKRTt9JQKkH0THmo4gF9fNL28Sph1AeuObDc76li+3h+Wg
         m9TqcOxEjyNp3gbKr9unZjEe5kRG7RBCqbXz+P6DXDw5dP4MggY4qtyadCuVV7Qa7HnF
         1EoklueJg4EcHGwOujyazRqkRYMGhwvhK1+2oKXPsq4QEzjAlXZ4cJnkHjVH0VOEHu0t
         MdZGOMXezvQIZnl3ujK0arIuxdiQYAfkLlzAeZwc+m8+G7I8NbVSHTd5jr8vIrahNLNn
         MZh6pPb/bZQqHak/eVQtqn8F4z11BaFbmJjBLyobWXQ4J/uL15TLT4j9Xx1nkS8+mSPc
         9DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679411; x=1792284211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/sSbLwCPSp4q8xFYrtdK+Sl95iWhYZVxZM9PhMl9mI=;
        b=Ir3Cxsb53N8S0HMcs70dPRw9qOIHhapCJXH1WPznusjzqbMlSUlbCn2fQ1YSH0f1a6
         WQ2QGun+1U8HpBtyIAa+65WSorVq+uW/3QKHYbMW86JDtJ8KyZdqDJea41he3TvwsTZB
         W3AJ0dlTEoWH/jYhrcEtQIRLUqZls8tdo/PfNDvHevX7WPmlcnWcNeAC5XRjIgLULCow
         rhM83GTb+LEPvdFKtwAHK06j/nzetQGaqA2N8fsjRYe+9aqv6r79Urv3FCdErgFhLlwQ
         gAUKErwo/qoRH3+kiVUHjI7xr524U0R+lXspjWJ3HTGcBzQvqCSEGe0T+xCWbdtLOA5g
         1UTA==
X-Forwarded-Encrypted: i=1; AKwUvBzKgUQL7ncFIDEpG9AlVHg9xLODCDYhCnZ2PsLkFoET6J63F3eqD/2EM2KR5NyFGkvcUdh3rug5FSre71s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJruoObvHs8tKHkXWphl0iX/qpEwCGNc2r/kLjDdyisJXlV1TWj
	9pknVZQpsDqFkj21O/sxzZUjfsDGFa8TTv55SD3HnCymXWzd5yDhhZpj
X-Gm-Gg: AYBFou2NrDq/4sctJI37gP7SJww8C8HFOjlAioyfbqHc/YwJF5QRDGkD11BMyL3BYgq
	yBNYDmoI+zATGc5XSJx/lqaD34FqZcE4+TzrFHtCCwnmfbwVR4PRHrCRXL5npOS2rg+CsZuYWlv
	wOEu11KRd7tkCRbcb2MXT4YtkvQR4GgRAYdePtJP2ogdp4XxVDsu2qDfBk0XAMYYC6VoSk22wY5
	dX8miDfeaMdpYPIfwIH0XW5S19+j0hKwy7geuoUIlJKJDe0Hr4YEhszLOZ0WkX5wkNvgN9Zx9HA
	9UEgQA1oJ2nMyiFyC6herAe99PobW/IjCEU1wIfgNzyisGDzucfxLpAkVtQl/wRJpjd2wYYghDs
	lKIto9OgKCx894hO61KWGWzJZAlDQHSUxfu31MIeBXoE878Dyehc6acv2sGWPMiLtE5tL9lbTPp
	/Q+RRq1RYnyevEM/DBzNNNW7BW1CiPwBENyx8HBU2gP0g01FC5t6UpS++uPhCXXEzE5DU=
X-Received: by 2002:ac8:5dcb:0:b0:533:79cf:18ea with SMTP id d75a77b69052e-5359fb88606mr102144591cf.57.1791679410806;
        Sat, 10 Oct 2026 17:43:30 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7dd1a0sm49229871cf.27.2026.10.10.17.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:30 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Freddy Hsin <freddy.hsin@mediatek.com>,
	linux-watchdog@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: mtk_wdt: Stop a running watchdog over system sleep even if not opened
Date: Sat, 10 Oct 2026 20:43:22 -0400
Message-ID: <20261011004322.1118027-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_wdt_suspend() and mtk_wdt_resume() only stop and restart the
watchdog when it is active, that is, when userspace has opened it.

But a watchdog that the bootloader left enabled stays enabled at probe,
marked WDOG_HW_RUNNING, and the watchdog core pings it until userspace
takes over; that has been the case since
commit bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe()
to prevent the system freeze and it doesn't reboot by watchdog problem").
If the system suspends before userspace opens the device, or userspace
never does, nothing stops the watchdog and nothing pings it while the
system sleeps, so it resets the system one timeout (31 s by default)
into the sleep.

Also stop it on suspend and restart it on resume when it is running in
hardware, like sp805_wdt does.

Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---

Notes:
    Testing: on an MT8189 Chromebook (next-20261008 plus MT8189 support)
    whose firmware leaves the watchdog off; a local module parameter starts
    it in probe the same way a bootloader-enabled watchdog is picked up
    (WDOG_HW_RUNNING set, fed by the watchdog core, nobody opening
    /dev/watchdog). Without this patch the board reset about 30 s into
    s2idle; with it a 10-minute s2idle sleep came back without a reset.
    Not tested with a watchdog actually left enabled by a bootloader.
    Compile-tested (W=1) on next-20261008.

 drivers/watchdog/mtk_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 1630ab65d593..ff72e0fb1154 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -572,7 +572,8 @@ static int mtk_wdt_suspend(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&mtk_wdt->wdt_dev))
+	if (watchdog_active(&mtk_wdt->wdt_dev) ||
+	    watchdog_hw_running(&mtk_wdt->wdt_dev))
 		mtk_wdt_stop(&mtk_wdt->wdt_dev);
 
 	return 0;
@@ -582,7 +583,8 @@ static int mtk_wdt_resume(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&mtk_wdt->wdt_dev)) {
+	if (watchdog_active(&mtk_wdt->wdt_dev) ||
+	    watchdog_hw_running(&mtk_wdt->wdt_dev)) {
 		mtk_wdt_start(&mtk_wdt->wdt_dev);
 		mtk_wdt_ping(&mtk_wdt->wdt_dev);
 	}

base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.43.0

