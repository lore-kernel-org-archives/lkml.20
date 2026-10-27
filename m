Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067060;
	b=lpUedkGfZw3ai/5N+rJ+7oDTjCJUSXFwW3VEN5bTvpIO1dVaKUZF50kG3sqLhOEISRpi
	 7Q7UTcXBMDkpn41o66H+pEAcZ6XdEr7anGXJqH4AJJ0bPr8cWr3EYPBV8G0RFy9UpCrbC
	 XwFX2qjU7M0ZzxWK5AfCu6M3N55ruOHvAEntuBtGwIdgSAhMDxFgKr89hXrX+NyDFxp/N
	 QzmY0Nplux+TJVM0hrXVK5HCgFnddThggCTQnvQ2wRfCYU32n5wkc4coU/+wDAdYM/Izg
	 ogpXG+kU0uAdj+KJ86HPAQJ7/wq+k/bPPgldqGtqOqs70X/I9a3KWYYGeDbGB62Cpxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GxBA4J5RiUUMvNo6tl6YNVwy0jvR1eX7L3/i8ZVGdD8=;
	b=P/0onv+zNscbQMcS6przYMou+9YVwaicFoqZ9YgdQ+1vrUScHDHYOYe4Yc/lQTyOa0kG
	 wCxGxYTlMvhcHoN0nJnMsD8mVA1bHBX1OlS1NXhVCKKJodIMRiY7cJxmEIKU2xu1TuwK2
	 IjSu0g0mMuwWjTfW1sqrH3PN9P8dBPDDV/GOSzGqizdOVg2Ck0hwJTdriEiPewosO0gn+
	 H7AcGxvOQWvA2NGCoQOxFB/QgMv9x+5Sm3iDTMwztUGvNfh4M3GUVhLkaynwN57ouvV7M
	 h3Iuhf5IWEyVZvi1pWUE1Uskm29kGfVHh1RSL4L6Sdr1ucmejm456IUjAKxlhkmzEdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sIejQ8qz;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182B6606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 182B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sIejQ8qz
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5910524eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067059; x=1793671859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxBA4J5RiUUMvNo6tl6YNVwy0jvR1eX7L3/i8ZVGdD8=;
        b=sIejQ8qz4jeYBukvPiHcU5OiqfVAGRR1Y5iW3mSFDPbGf7Qc7I6Xy0KucnZ62HZMvi
         +j7LliwyQmb0kvrDCP30zY7umd3dRzJzAxn3pYjDv0NuYVRHIaSyvRbzKCCX8M7ehACU
         EEzFYh9CMSaDro/XzTC6/34PnYqVaAvUvZLxNVMS4UZGrnpLNroVBwzbFqFa+1cvm8h2
         0ngaFsGwrqVJiVaWaDKyEiAknhfZFC5Txp4V5JMu7FhC7li9vdC2fFG2O3NKu2cOZquw
         o33SbzM9auEEZkF62upKr7BTly+nDkRfS80siVlToI7TkaSCVztpNra2jNvlXcuMjrq1
         QU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067059; x=1793671859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxBA4J5RiUUMvNo6tl6YNVwy0jvR1eX7L3/i8ZVGdD8=;
        b=KHDRWPf8jz+1jEUMmYggxEAMKgEoAUlHqBpadNXqwc8dPrRVt0F998D/LwhSwv9H6O
         D+3OV+kTxjzEpTifw8c5jhccWd3CrR8VqlB6j2t8tHnQHW5D3qbV9vz18WddWIjb/TR3
         A7YnrZM+l8YtVGM7MAnzqTHhMRKX2ZfkDLe7qXmL8KfPa1fIrQhQ+QkYK5aYlv2S1OND
         39dDSSMwuO1Nn6+4jbqjb+M26LNhlCeJfNrbaqbMisVZpJ6fH6DHqSLtH5CqXsPT4SfA
         IvWAk+JUjCSs7x5FBaWN98vujH1r79gtxCUtWItZt+wNRQk/iKbdFQNvF3EpRw1EE3Xu
         KiTg==
X-Forwarded-Encrypted: i=1; AKwUvBySZTHXOnxQK//7fjnSWgTBouxZ4nZpcPUaa9H7zrpr+q60vCTlWtFSwKgIjEuU744hkfkRlUcwrQEfM40=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOXJhZv9tsXS4gR76DT93KN962POIjKBWofsb8/yr5jbuUsY+A
	skMG3zyw5nbte92n5S1ZLfiC0k0NfgbpZz8tvazJo9CjJ4XsSf8KvgWS
X-Gm-Gg: AYBFou18tPTpDJ9aevNMkIz/+dgj3A3FTVpPcjXUSewY3ls9Wi6vZj70Ko+CvltwRUG
	++n9tlTDdkMmJYOBk1xzYsXj6cOOdQfGkFeT82kOoMxEik5l18bBRttYhGkHodRkJAHN24UmCGj
	tQKaaLHoHJgtAFhvwdnskCqooikbMaqmwFmNhVumqrkI+PT9pSs/8OU8vloytIBOHn+gwpTKGAi
	GEgIpktj5BvZAH7jKf4mrumU+hU6r9VOAejwlKQ/a+DVWHjUOnNUL8htF2i3+c7Ur9vvkxt8at1
	mElshBnRWcC4PsEsVoRNeCOdcLAoNK9fBboVXNNUN8fRZPx2XKV6uMiaaCdB+KnoYpuvwpHjVH9
	rTTBi4DCnlksSuSYhiQymt5lhZYh3ptCVEfaXfiJGQdsex+M5wft+v8S3ISNPgaVdLcnLaIhNHB
	n25U0Iu7t/MlZtUEk5LGCmE9jvXlekA6wJljPpYqfEJ32D3zC0ybkph65P+V4qmW7LkIzImZTTj
	TsAJJ2nhcFLyWg8lSNSwkD+JlZP5SMTo1CwaCiarvDZKJzJN5POBpcmTKhoJW8ji3XEv3ztNY+U
	q4yXZobPa4A=
X-Received: by 2002:a05:7301:5158:b0:369:fe81:a575 with SMTP id 5a478bee46e88-369fe81aa97mr7798024eec.35.1793067059062;
        Mon, 26 Oct 2026 19:10:59 -0700 (PDT)
Received: from localhost ([112.204.100.142])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-369e8daa3a8sm36120822eec.16.2026.10.26.19.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:10:58 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: panasonic-laptop: add pr_fmt
Date: Tue, 27 Oct 2026 10:09:53 +0800
Message-ID: <20261027020954.92205-1-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Kernel messages originating from panasonic-laptop on dmesg do not
specify its origin.

ex:
[  +6.009811] Unknown hotkey event: 0x0030
[  +0.229942] Unknown hotkey event: 0x0031

Add pr_fmt so that messages from this module now show up as:

[  +0.209860] panasonic_laptop: Unknown hotkey event: 0x0031
[  +0.160149] panasonic_laptop: Unknown hotkey event: 0x0030

Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 19d194ff37ca..080e306f796c 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -119,6 +119,8 @@
  *		- v0.1  start from toshiba_acpi driver written by John Belmonte
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/acpi.h>
 #include <linux/backlight.h>
 #include <linux/bits.h>
-- 
2.55.0

