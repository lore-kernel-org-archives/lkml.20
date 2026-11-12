Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453406;
	b=qf2aUmfWpj6MGBgUFScpHWS5FapBWAIgobLMWJTBtrrbjT+OAu2/mYoBcMguO6/1vWfp
	 ejvgOHHg6OBnvQbW5cVsbzIXgHPdY83mkfCcD6mb6PkzOpv5q5sVN7f6qPpOxJz8OPL3/
	 ekj5LvxPdcm3luplVytxOy3YA9sUDH6lH1j3ZPEaO8VB6y8ZlGw/Yi501y8EfM4Oo1z2J
	 rKQT8h1Nw4vVLl2NwD15NClhr5Y+qK90Jo4+hktjzrQ5mq57QSghPakiXE/TgBBtj5ozR
	 Mtk21ctYd89SVPoKqCNnklk9IO6VrE8oKVkD2qA1CFI6Jf91Lo5UVakX7O/l9Mk7i8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hWKawNdn0hEGYVFD9BxgfOol/1CwMbnzrNRl9vbJ07E=;
	b=WBqGnThPtjoqkccCDNmtNsBWghI4YwaeeFaec9JZY7epkG+62oPsFo+06NZXpuE370Z9
	 Y9ioBLWTbH6jIwDkqRUZNUrBWvZNcJAX/0MvMp5pDLS/8lnes5Kqa+nCFqN3anSwGNst6
	 yOHI0Zc0MSi2b4YEHsrH+npYVwCVfgKXwiiPTJzg1D8hJ7xp43QfMzoGBwdibMFucc/hz
	 g6Goget+xfiLRANvacS3wVFfE6LVaWUwwi5kkWVJP62bit2Sy+29/pg/pJb/ms84xyIvA
	 YDxhQBUbyPhBIRGdClGNy/p7tNnFcieqm9feeub23FRx5sJybbGPflVrmpFpHhHESIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Ea/4LJ9Z";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B5560A260D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B5560A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ea/4LJ9Z
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so6300785eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794453405; x=1795058205; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWKawNdn0hEGYVFD9BxgfOol/1CwMbnzrNRl9vbJ07E=;
        b=Ea/4LJ9Znxf+/qcCYyUIdcKwbpGKvfC60TUIuO/uVVJ0/eB+rPYs+bR1sTYDqnwMuL
         PWwwLjI9bdrFjY0VMhep+ociG/QLkAFmjhGcya0Ry/enx4auK3iUDRMS22ZjPrV0ctXZ
         liVO8HnuhUwtgaY6Cj63YQ5Mh/cncnMPEg9PjhvH+2ltRF7VoYatOvoYMCx+Sqh6w/aT
         WMy9Uus5GmaOHankSoEHnd8jV1Tg5WjztTLABi8kiuiXGbyi9btMBnRyrwS1UKP/XUfT
         mmFtiN1uymkVlmW0MqOGxCzdNDeTbNy4nMKhLssxXOlvvcaIV/2yD5yLl7ouZeUrzHyh
         E8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453405; x=1795058205;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWKawNdn0hEGYVFD9BxgfOol/1CwMbnzrNRl9vbJ07E=;
        b=ZABCi9HLpwQ8UbNVfcOljeak0/lFR31qzRfYxCA3rp9x4c6SK3ltuvZd1InBFq3htB
         dLdcHVVlPoaRkF/u7ZTE8pZ/bk4m//OdTmtzZtt7WX2ju0kDzyaxeaedqklVdIXLWt3H
         ShCOVnQUjcV8PtPvJ421tylEkUkYqcH3s0Rgml/XcRF3ey9eKXFklN9yeUJAJAWJFFwA
         Fa97IShXsSKvrsqXLsHelzfG4guVleYtPIkx60rQwksc5/+UbGU9Vg7ngW28Ju7JR4y9
         OY77Ih5E9h92yi6RoltJMKCy4TSKjPSn6RAKbxaeA9OFVSE9g1590dzrzRypUjfj28iL
         1jqQ==
X-Forwarded-Encrypted: i=1; AL+hErFqERQDxQnUXzsEWVsglZ2QSfeJKkhBe/eo5gPnTFIvSsxurKggXooAaIMCe3wwqgBEFzFyNjGyyJWXYX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2OzZGm0TNz9TP6H0ic3nHRKp9v8hW9Y9ipXiqre2BQytkCWKg
	/SLOC2yomYrajdvIsQ6CAwNXBsg65SWIe6DEpNAbOYqTCeRBYvuCDhsZh7MEWFmf0/7vPdn1w7R
	iw1M+/5JOpA==
X-Received: from dybry8.prod.google.com ([2002:a05:7301:4d08:b0:35f:390d:248a])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:87c1:20b0:36c:c483:7077
 with SMTP id 5a478bee46e88-377abbd9353mr1683715eec.14.1794453405137; Wed, 11
 Nov 2026 19:16:45 -0800 (PST)
Date: Wed, 11 Nov 2026 19:16:28 -0800
In-Reply-To: <20261112031629.396819-1-mrungta@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261112031629.396819-7-mrungta@google.com>
Subject: [PATCH v4 6/7] watchdog: pretimeout_panic: Use nmi_panic() when
 invoked from NMI context
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Marc Zyngier <maz@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A . Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"

When a watchdog pretimeout interrupt is registered as an NMI (or
pseudo-NMI), pretimeout_panic() executes in NMI context. Calling plain
panic() from NMI context is unsafe if the current CPU was already inside
vpanic() with regular interrupts disabled (where the watchdog is no
longer fed): vpanic() assumes panic_cpu == raw_smp_processor_id() only
occurs when entered via nmi_panic(), so it falls through into a
recursive panic on the same CPU, corrupting the static panic buffer,
panic notifiers, and crash dump state.

Invoke nmi_panic() when in_nmi() is true so that an NMI interrupting a
CPU that is already panicking safely returns, or stops via
nmi_panic_self_stop() if another CPU is panicking.

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 drivers/watchdog/pretimeout_panic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/pretimeout_panic.c b/drivers/watchdog/pretimeout_panic.c
index 8c3ac674dc45..634ae3b6c961 100644
--- a/drivers/watchdog/pretimeout_panic.c
+++ b/drivers/watchdog/pretimeout_panic.c
@@ -5,7 +5,10 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/panic.h>
+#include <linux/preempt.h>
 #include <linux/watchdog.h>
+#include <asm/irq_regs.h>
 
 #include "watchdog_pretimeout.h"
 
@@ -17,7 +20,10 @@
  */
 static void pretimeout_panic(struct watchdog_device *wdd)
 {
-	panic("watchdog pretimeout event\n");
+	if (in_nmi())
+		nmi_panic(get_irq_regs(), "watchdog pretimeout event\n");
+	else
+		panic("watchdog pretimeout event\n");
 }
 
 static struct watchdog_governor watchdog_gov_panic = {
-- 
2.56.0.611.g1030f0b940-goog

