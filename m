Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE93F9F2E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791151159; cv=none; b=mqfZd92iOQ4dgiMoGYO4WbrUdh7Zr7ozxK9NKg8KB8VUN8/gptkhpDIElYLwr2focsZsdM30XCUfF+OPDagaNR1DS8qROpk6A0ZFTEoKtcqu64oK06BabzqW9SccVZXcCw+zRm/ctJtS5x5h3uMwGGZzJIQbB9BoceSpARruYZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791151159; c=relaxed/simple;
	bh=xSsWoQDL4dIlGNJ9wr1M+vrMDyqm0ULhiBw4GMXGvwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqwIVauzTSfTU8hMthTPQgrnkH/NPtRkW300x8CW+whbEfbWZxTQD1nJKFPX0ajDjiRXzUi4Oc4zlFuxZaPSgoJNlGaW+uZPid90B4O1Csq1XDkqRvudqjbh28O+/63/Kt4ASXG8qgw8qZtoiG8v7b6/smfk265garO+gwTWv64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBkgMApS; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBkgMApS"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d58a3b05so7030075ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 14:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791151158; x=1791755958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lnok/HFBQll15hO2K4C4DwZm1VWqGd0S2304QV3/5M8=;
        b=VBkgMApScoPIcjnmMJCZcMMkZEXpRisBxPbqZhYV5JQtraCZOjdH61Pg1Vf7AhbocJ
         5XzWVMys8CePTucBbp/4oD/I/7FZNEmsIHsMiHV/wOMRE7jFAmKtd/hyf4eVQvi9cKuQ
         TX+EIv2m3+g4qwEr3WJzHTUhzyTFt2MfKa9I2lB0KjXIGY3LvuQFmB4WX5/bki1AvTLj
         G8YLzNajhYkKIxvb58LkW3vhuirV4B2pZDywn31/DHWt8dKH+EnGAM+mVwam5mNlxIPi
         kexIU5YcYqddua5nKBfQO2RCLx0OVFEvDVdVFMIuYRLBDDkLTv/L++JKqeYzbJEJlO1w
         g37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791151158; x=1791755958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnok/HFBQll15hO2K4C4DwZm1VWqGd0S2304QV3/5M8=;
        b=FNPiyCLTARrt5TjvkFy3nI8ZmX2wZye9AncGyZodHihO5bR/eKCX6TUWhRwgNVdY8X
         JLfaqev90nAvhgxHOetys1mlkS1n/6kRVCB6ikj10j0gnwdU7pWpT2bzLKuNtrasSgPM
         BplucJphHrMDIf0IFSRXeIFud3dP5VM8Dc2IKidVDrQx9+HdHOp/+lAYUHk7j5PkQHaT
         L7EK6OjFtEc3mD/pVZyrMRUgL1jgNwQIl36kHY6OQCFszxoHCO7ZyXdXhYzeVa4B9XZd
         8wer3KZK1lRI62sO8k5DqQmSLOoveYm9VGLRzDt4jXS/6ULm1dhQdcLLUqFkEJhnHkT1
         KjqA==
X-Forwarded-Encrypted: i=1; AKwUvBydE4K4x93kg1AjitRGhKFHoS7p9Zn5yUjyvvGo1PyNjfyF6IIDZqnKRR2mortmIqR33pElu6oo+BPudTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXGkftGp6EB1i130UAOVPpTtde4IDWkOrGu395PzK7lr8zg614
	cM2OpOK7b3uLsG7nu9UHCqLUfqAvCsaTk/cQ71BWglsp2p87lUK9Q3iIFRuE1cuz
X-Gm-Gg: AYBFou1GQ4Ew6S5K8yzef16kAMfpEAn/hyGnUaGsbKho3CG8nchNMw+kK/DaF9GvXqY
	v4eDFETDeIIIfVAXnln7Q97sPxR8zQt3PMToGvrz4J1Tmx7teJxFA97NDUPtrKRYid3mi+CrlpO
	wB0PXi+m3LemvxozVRaww2xONpi68XVPSfQXFRpavHQmA6139LNnRgaGJDe+f9AJnUg1xTkzbiY
	r5wZS0qR3MzJDiRI7BrhsUc0JSFiirxB8Ant7tCyedb1Fh4dG+TTAaOGM96s1JscmXTQpFYl/XK
	MayU8CJEvcnXCzlkBZXLkEPUQXAJZxn6HmFr1MQCXQevOM4DoNwkcUE1lSTepEV42YtjLGiPxs9
	qXyrgN/ZUDBgtSBdCxgfv1sXzARJd0ErFN4g2pNY7/9QbU3rtK1TEP1CdqBAr+X3sPsOkUPAgRM
	AFv9z9GDHyYrGtR8tWjkwPxgLDDGygRxyzY/77N3EF+tNXQP8mLt/EAGtny8/4xj8+1NnT11jMQ
	7Pd9nV9VIqeGwK/vg4D9C96hBgxe8IiEHVd5lEO4wFWF5HLw2HhfQm3McSJbtCmNg/r6f5GnXFG
	6KY2BL69CrqFZPJzusyD+XNWfWzKHEmOlY7lX1pQFizTAFQe
X-Received: by 2002:a17:902:eccf:b0:2dd:c100:9435 with SMTP id d9443c01a7336-2e49b7ec629mr74653145ad.51.1791151157615;
        Sun, 04 Oct 2026 14:59:17 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e4bd7a0f07sm19822045ad.26.2026.10.04.14.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 14:59:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Johan Hovold <johan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rtc: omap: wait for !BUSY before reading time for the power-off alarm
Date: Sun,  4 Oct 2026 14:59:14 -0700
Message-ID: <20261004215914.397512-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap_rtc_power_off_program() reads the time registers to arm ALARM2
one second ahead, but does not wait for STATUS.BUSY to clear first,
unlike omap_rtc_read_time(). The time registers must not be accessed
while BUSY is set, as the counters may be partway through an update.

A read during an update can return, for example, seconds already
wrapped to 0 with minutes still at the old value. The rollover check
after arming only compares the seconds register, which no longer
changes, so it passes and ALARM2 is armed for a time that has already
passed. Power-off or rtc-only suspend then waits for an alarm that
does not fire as intended.

Call rtc_wait_not_busy() before the read, as omap_rtc_read_time()
does. Both callers run with local interrupts disabled, as the access
window requires.

Fixes: 222a12fca604 ("rtc: omap: add support for pmic_power_en")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-omap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index 540232d6f26c..4e9b4f601a9c 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -437,6 +437,7 @@ int omap_rtc_power_off_program(void)
 	rtc_writel(rtc, OMAP_RTC_STATUS_REG, OMAP_RTC_STATUS_ALARM2);
 
 	/* set alarm one second from now */
+	rtc_wait_not_busy(rtc);
 	omap_rtc_read_time_raw(rtc, &tm);
 	seconds = tm.tm_sec;
 	bcd2tm(&tm);
-- 
2.56.0

