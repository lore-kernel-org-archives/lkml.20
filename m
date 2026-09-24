Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB03428463
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234519; cv=none; b=ojw1vE9SbKAJlPMtru4LPLzZHL35rQPffnFeiRrHH+HoBO1KCFAsDYZEC0IjwL8tfFT53WAU2uTNYivbNlnJGdQLHgPhYpa9AX1l04RIe5s2mwT215SNT4mTO7l8IbYroqARoF8o2tGHdkx3kXsa0mR+4MsYb8TnrfietpKZWo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234519; c=relaxed/simple;
	bh=rzUGhvKXG1QedQRI9Pa8yyhEiMF19LqXarJtEqui360=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gNPQf8KxuI4o/U1YePnZ6CLrDTFADn7hh2N9CDapI1NEGrA759i1ys/LLRjNfZ+XHRvWN3Tb//rTzo/iBczCDW2fFJ1O/p9nket89ePLvxbo8Qh7HUhUATmQ5xzqKLF/hlADlz+96fY7cFu1a3VvO/D0ShBu7g7CjWbWqVImqe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VczU9ZMw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VczU9ZMw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so9518775e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790234515; x=1790839315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDX1YWZgv2v5Sh7tItNyghYlDCdlCLpMr/PsN3YN948=;
        b=VczU9ZMwCCwSNcoDfTN3WwzIiudtBriTNrPRnW7017/HlNR/T543mjuamjkXWtDzgy
         hWATGjSGM7hiXLAzKKAr0IcM4rImS4SpLgEgQjsgkVtzHzRUvLuK3dBDZNTNCCYcgYT2
         SefZqVPNQ2QagszCuN2QNamGmNWfCxKtMlRsYPAcn9HtHJuLy+caNqeGS6XXel5PtrZQ
         zRbugh++8TK01K7JKKy3/Mhowfw4EvQHBMcHiPo0nG3EH62favhhAoJcCv5Ou8/DIVZ0
         6rXiXnohJ4L2gbDyrQNXU9ILPE/MetTjDxUQLiPxwWK+oAh+UUo/f9yrfLEuJBms+lZT
         A+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234515; x=1790839315;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDX1YWZgv2v5Sh7tItNyghYlDCdlCLpMr/PsN3YN948=;
        b=DGhLCPaUUMgP5bo+Lkc8D3T8rpgdljYTaaW9zS43/Mgawt2yRy6bw4HejV//dpQj9e
         wIfgyzXOXpyuXBb7YtCASKYybQICtsNLM44W+/XZlIbBzQZfRTqYhzE/vUGuyNQkMQty
         qNN5MIYFXs6y38fTkLfCC+jpG/viCz429rWHFzyzLjPOU3qZRNcOjxkOPSjEoK+jP55d
         g30bAMVPg/kI0Drolo5cqBUtigAcu5jXyrqZ4mJi0EqOjBmWeZDDUqJf3LE+9z4dHN4P
         0ZHu4rhQvomwZf5z/OpXiiK/hTl6poeDevcmrFBSCDTGZpac1KAGXozlzgiD8AwfxiVg
         kFSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUbu2AXXFxq7Ac+lJZ6X9J1WKgqzdndqkCoxutVhkqb1LBDKmGe6cjwq5yEp4A35MnsblYhHzr8Ok0iDA=@vger.kernel.org
X-Gm-Message-State: AFuF++k3TTD0WA0TndKOvig5Q1nAaqdace7pLHrvSfpxfDiQosy4MjAs
	EeOQE2r3W+n4bY8mCLWK46O60D9QXxPaZ2OJ7REm4wExfsVKISf7AH6B
X-Gm-Gg: AYBFou1MHHR6umkF9uQWM3IfC/BZ0yZQ7Hi1H6qrXmnvJr2qc0XIS2foo8qAUIVOD1A
	P1KuzNTQoNQvmPkSKnwF4qObdSJ+O4xi/Mmdpx/fVnXLzmGj1jPDsU6CRzW0ag8H/QxUbTQ0scj
	NAxfjhLgSAIEBPWpa5w0PxRShwbtNFj74lPVWXLW6MtMOn/DIx+7JKhfYlql7mpnhrIauEGWvpO
	FgEjRWfPNd/Rr7aCWUmgSPIX1EFwQypkxlUU5YTemKeDzzknldGNKjtFIj7FFoepWqu2/jazTh9
	KReMy75eda5E8vSdgTg+Vrp66YZvN1VTyyMNlgTAGHhxh4LHNCZLMe70uZTQ+ULk28fO+jET1OU
	JU4x1ybrW1O4xGlen960lTyzNeo2xKSVBuZspFDb30UMuPVoVxvPts0pbL4FcVuUEtj/AzXr16y
	UHqK7jdRCXbKQnDUSP2WFyM1dV4yJ/Yg3yfjpuw/jm3Yy4hY3G/hlFIL3sCQJc+CW3Fn9gNQA0m
	FaDym7pEOk8K8ywy+awHKlaIcBW9KogqZhKwiIASdBPQBKoV0ATJ+O7Fe18upeRXpfUtHYVIEM9
	rvVi7Sne3q99PYLupLKyF4qTWK7Z2k6NPgMDyvoF6WBXzMj1Hvel3x9XNQ==
X-Received: by 2002:a05:600c:1385:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-49fe66fa5c2mr21450465e9.24.1790234514858;
        Thu, 24 Sep 2026 00:21:54 -0700 (PDT)
Received: from AHERLNXVDANI01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bb9891sm41051975e9.6.2026.09.24.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:21:54 -0700 (PDT)
From: =?UTF-8?q?Daniel=20Via=C3=B1o?= <danividanivi@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Michal Simek <michal.simek@amd.com>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Daniel=20Via=C3=B1o?= <danividanivi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] rtc: zynqmp: Enable crystal oscillator in initialization
Date: Thu, 24 Sep 2026 09:19:16 +0200
Message-ID: <20260924071917.80004-1-danividanivi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable the RTC crystal oscillator bit in the control register (RTC_CTRL,
offset 0x40) during driver initialization.

Although the RTC_OSC_EN macro was defined when the driver was originally
introduced, it was never asserted in xlnx_init_rtc(). On cold boots, after
battery exhaustion, or on platforms where firmware does not pre-initialize
RTC_CTRL, the oscillator remains disabled and the counter never ticks.

Asserting RTC_OSC_EN alongside RTC_BATT_EN ensures the oscillator starts
without relying on bootloader initialization. Per the Zynq UltraScale+
TRM (UG1085), bit 24 (OSC_CNTRL) is a static level enable for the crystal
inverter rather than an edge-triggered reset; re-asserting it when the
oscillator is already running is a non-destructive no-op that does not
glitch or reset the ticking counters.

Tested on Zynq UltraScale+ hardware, confirming that the counter freezes
when RTC_OSC_EN is cleared, advances reliably once enabled, and is
unaffected when re-asserted while running.

Fixes: 11143c19eb57 ("rtc: add xilinx zynqmp rtc driver")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Viaño <danividanivi@gmail.com>
---
 drivers/rtc/rtc-zynqmp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 5bcb7536e973..278705ec09f5 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -167,9 +167,12 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
 {
 	u32 rtc_ctrl;
 
-	/* Enable RTC switch to battery when VCC_PSAUX is not available */
+	/*
+	 * Enable crystal oscillator, and enable RTC switch to battery
+	 * when VCC_PSAUX is not available.
+	 */
 	rtc_ctrl = readl(xrtcdev->reg_base + RTC_CTRL);
-	rtc_ctrl |= RTC_BATT_EN;
+	rtc_ctrl |= RTC_BATT_EN | RTC_OSC_EN;
 	writel(rtc_ctrl, xrtcdev->reg_base + RTC_CTRL);
 }
 
-- 
2.53.0

