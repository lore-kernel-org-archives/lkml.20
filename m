Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637412;
	b=yQxEv1pzGTqe9UFTLYKJ+ac3nSh1r/AI7Q+K7ZM/qKPDy9xV/suh+ANYJAGVkD/HzEG6
	 gfbZPbjP/6/Gyg2kw0C3CxzhXGwKw0LKZwhJzZ2HazGWlT1vxW+P1qQDPYYPfw9SL7y2D
	 W21mj4pKLU3MLiWRufqEikpjV3eGq55e99LWzyc0hClhB+0MbMO5wI4+JYw7MgTi4O7Ar
	 Wm9gZANiHpzM292vBzKorDmIqLAzCkefYUHb61eIH90ofowNcPOv6j2a/HspWRhSeAU21
	 aG5rI0nkOf5qOK/wTO40EXkqCtNM3VOOJalZ3WOdEtbOHWg11XRaRXgOJqn071x4G8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8yw1LePh+ceLAcf0GPSoWpXNbz23OP5vkg6CsQhLXiE=;
	b=GiZSTQnznHUE0VNq7tK3eBqGxdp5O/i8X5Bkq8aiwYax+a8W31aFPa1xAZ8SxXugN8Rm
	 hiO+1z84T2A4QMcDhn5mSrh2T9ldiDDa3OIeEN5X5V0YCIncUFJjoLZtP6eri7KeEl7JQ
	 sxbE5T1/fqySNZ1swpOehIfx4ZoEzP4un7N8DXFPD2ipScxK8flk4NT0keZYECerpMAKc
	 I1N0KmpHjffkxt6DbzAFAFhvr70K+qEHeuzzaE96GoLBiUGreIOqqzpgzbSp1yHObJoKQ
	 rvTiuADwS+qTLfqCBItDGYza9sCQpuyVPBPledCEHMESbl+kPGmS0wUBb9L63Qv5PAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PWWryPfy;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03130606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03130606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PWWryPfy
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso1604107a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637411; x=1795242211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8yw1LePh+ceLAcf0GPSoWpXNbz23OP5vkg6CsQhLXiE=;
        b=PWWryPfyePReYg513MkcydiHR37We48bWP3QTuBkchma2bF1cEpOyTrVBQGJjP2Ukv
         7nNnI1eDYb3I1aN6UNLxOQfwsILy3eYHg/5akxDW6tD1ygCMIyf4hjaFOuPFXZqkKpAD
         AuuF85L1MQ4phxvLchiGDWx/+G72C1AE+u2z46NynFqJxL/rh6mbGXpLr7jmEsY8fdg5
         vOXGCDx5zumBJNteHt5n6tLP16OlwMk1vWFcrCBvI2TzIE9JloU97NyfyY225++ngmdy
         NiOF6cJomWo8kTH5QyYZGDWwIQQ+Wcy8X9RhK7lfsDufEd6kCKobuX8osGw0UXLdzm0S
         HM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637411; x=1795242211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yw1LePh+ceLAcf0GPSoWpXNbz23OP5vkg6CsQhLXiE=;
        b=QRJ8IAqnmFkbKT2wyiEe2iV66h86tn21sZhvG3C1ojQJo3cnTOt0k2FkYS2Is//k47
         giz0nGyZWHsIZYWj0FI3RSHLsru9xrLafgjyr7bIYydbcksnUi3nEdoos8CN0XckKRTq
         5qZ3XK7q0c+P/YW2Ibgro5uP7IPn77Pfbljcmk6Tq3w7LjjcknqbitKPfUEUuvTEHEOI
         f/LwAVv1avm5ZL09JNlymN5fVOsCBSdvCveM5Y/pUZwxdYtUMBb5pLZ6Ov6U7SeUicme
         /kNra62Or30ChjMssH+OAW/EoXj+NSy43OQE9N8qU1hx87OEzZMe4qOUkW7bmDh7DZjQ
         yPPA==
X-Forwarded-Encrypted: i=1; AL+hErHBwzahRqTd19x41NZRgHUE+0Jd+Nj3BFp10J6G2dwXWPmAzrJifKQot0k/iMsItZoAoEwt9N5DsK5FE68=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tiq+0qjb9gBoRTrtT6mV5xwCn05hRydSXcYKkVdKP7f06CAiQ
	sHN6GNzSHIIkSE0swkDIdzZGCxdkvA/DbFgnnEIU/zMbW1OtHt8tupWN
X-Gm-Gg: AYBFou0dXYVf/mPD1LL0QltrdE7BYQtDlI+zbN5hsmuEqBZJ499RN2hjhOsgcChElTF
	0LHtdAA6U3wyaJl26Te4K2B1bs31OBKiUyWziCebNj+kwJ0mk7NiL6d3eFnohnp0or99XWZ6DDH
	3HyuZc29yJ0Q71N6+RS89MW/VmOpZ86j5rXN++1BytnZpnDO2D/yVYk8GlPvSlBoJnWXkbv/Ywr
	Z2KkHIfdvnmiay7EXBrqJeIyCLgA+TTasPFttWqTPi5LvzdqRU0uCU0dkMFdQ8XGHqQPmGDYZIQ
	7XLrARMcIlu9aGvZqjHHSKYxD5iZnib0mjzGyOP/i0v7lSszaqpZE/pQXoY0jW0PgL2igpAQtsj
	fT4CEhwimhaHT/gyUdAhC2EkcY1Po89HfekdvPOZlk5t34o4jaN42MuZo0OgQ1obibE4wkF3kxj
	eNV2+Evu1cCLZg/UGbFuyT7pw9QmsU28Dqg8sVgwW6wtN2ozGnEawdR1UoeUmIVPIySZ65wxZPE
	BTQi5REm5oL9vJKjRq2J4W1yLT11+hrjoI96H0r5NypmFnkQF6K0XJvDJfoFNxiwxbDATUw9ifV
	w9BRX7VgA+bthQEn5aYGDNV2muhNvT4AroFqCOGuFGChA/rOomLIlieMQ/8dBWj4OxLqf4NSRrY
	xbAVr6667d7B+uYLVQFjk/3YzopnOBwdd7AL8yCpcnx5LhTlY6VxOibciL4Mjrm5hzIBUpyfWrh
	sIQQ==
X-Received: by 2002:a17:90a:d2cf:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3b1b0a50370mr4457667a91.41.1794637411258;
        Fri, 13 Nov 2026 22:23:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb3d2d4sm7635927a91.7.2026.11.13.22.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:23:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-smo8800: Suppress bind attributes of the platform driver
Date: Fri, 13 Nov 2026 22:23:25 -0800
Message-ID: <0c1bfd7d87cb29c503cbfd17eb64ca88fd12f18c.1794633181.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

struct smo8800_device, which holds the misc device and its wait
queue, is allocated with devm_kzalloc() and freed when the device is
unbound. misc_deregister() does not close files that are already
open, so if /dev/freefall is open when the driver is unbound through
sysfs, a reader blocked in smo8800_misc_read() is left sleeping on a
wait queue in freed memory, and smo8800_misc_release() later clears a
bit in it.

Module removal is not affected, since an open /dev/freefall holds a
reference to the module. Unbinding by hand is the only other way to
remove the device, and it is not useful, so hide the bind and unbind
files.

Fixes: 4738d8aabe89 ("platform: x86: dell-smo8800: Dell Latitude freefall driver (ACPI SMO8800/SMO8810)")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
Developed with the help of an AI coding assistant (Claude Opus 5.5),
which found the issue and drafted the fix; I reviewed it and am
responsible for it. Builds cleanly with W=1.
Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules: the driver loads and the bind/unbind files are gone.

 drivers/platform/x86/dell/dell-smo8800.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index e056664656a7..aae9a028d69e 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -169,6 +169,7 @@ static struct platform_driver smo8800_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.acpi_match_table = smo8800_ids,
+		.suppress_bind_attrs = true,
 	},
 };
 module_platform_driver(smo8800_driver);

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

