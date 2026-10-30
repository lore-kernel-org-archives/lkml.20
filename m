Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397596;
	b=QV2PVb8Fz6rKVP4ooNBCQiQRX+DdzHQmDH/I7Vceh45Y7XC3m0XZzZnV7bGbWPOQAOCc
	 AhPHGKKkigB/eXe9YVi02uhhoeqcBYeJx3rtnkxFXTNo2KovjficM/w+ZATAsjR+7I5Vi
	 rC9OYwmXAh4eua3skTtJ5ObzWJmh6BMO03muMKJZMsCzhHj+lNZybyB7YWHy9ZsmX43TJ
	 NGtn1e/NkjYVpcCth7kkvuQOCukllm9r5SNr4Etn7SnaJ9UN+7ZKDTSpbFS/Yt3jFSst8
	 Sp+AF9Zz1V5XG1QHabM5Gar/NOyBqXDOcCbfmvn1vEl/yNqI4vv08BfsKXgGIqcMvQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cqVPzAxRYBnfkyaou+ZmBagBM9cb7geifcCND68rtOU=;
	b=2TfsgERXYwfW8FtxaisbsE3OdzjpjYd5YpIgDolECi+lXKgwQGwS6QzUhchtwX7kajhg
	 66LSoI/D026Y+YA+k5ad/hfnaZpzRx+qEy3cxR2XJcaKBL9f6wh+5XZeXCcTfTBUyRjyv
	 5uUoOVq7C6K28cx5qduGTnPPttoLlTc3jWwvx0ZJ2vd3w61meM3YOgSE5wVsyRhI/iUGC
	 lKy8PX2pwoOIePoUwSiNNPzXUHNR9JTtfHYWd34yY3egRS2gzNSfpG1SHhLzrrDp6VjTe
	 wbLn4/XKrLNc6sv4WumdmBjBnxhjCQ1zsNElFyBfJcVNjBWPiYvb8U6BMx5IVmwI41g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHPTiUxQ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58953606A332
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58953606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHPTiUxQ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c5358fc28so932091f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793397595; x=1794002395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqVPzAxRYBnfkyaou+ZmBagBM9cb7geifcCND68rtOU=;
        b=xHPTiUxQxKUdyd/EaSzHOImOy3GuKB/zxcHmflNS1dg1DgOLot8Vow7pGI+iuNaH2P
         tnN1LWEwiIL8DU5gqGs8jUlDih25km7SPhB2SsFNSOLFbAqt4wpSpl9IPOOcZSnrl1Mr
         Ga8ucI4GPk4RabaPCKN0GJOG9Ks1crXraHfqpe+OeVK3GUkhxBaj4tD3Nc/zaj5upuiT
         dhmXLYmcZPiWCWzfN7obJUFhmAqEEHjt44efiMOgfj9xaZjvK3LVZDB8ByyP5LlZQLyv
         4QZYcPxsljDjU0EnpANUgBWSV3/FGDe96vk2v3WaE50gqyoKSm5gsUs2uwEXSjjUA7Tj
         QAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397595; x=1794002395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqVPzAxRYBnfkyaou+ZmBagBM9cb7geifcCND68rtOU=;
        b=fFDYYBxi9wPGPqIwbnhcwiVkTl+QLJrj0iwxQ80IZfTkcvGAhnOyIY616IbDWVG0Et
         fkC77Rc05MXgny8Tmp1XX/0cm9uRqwPBY7acdFfHZHYSpSy3NqHFyEucsRpWlYGG55ty
         1QWYdf73UmtGcTAC7x0AVaX1kqfdI/duIjKkxHQ4BjqFcCCTPmOyCZBqk89Sgu1L7cuK
         0biAMsAjprRRJDEOPIkZiInC3oGE/Na/quBzKXRuBqZufcOWNI5LDHgUEjy33Z81cIzT
         YeYWoa+X1t4EvdipPrxUxDloB+cJLlC1VGU8gVQblRgimFH9tmZ9YS9cyrU30fXFXIoo
         mhYg==
X-Gm-Message-State: AFq9FYIwNav+GBnH3w+Ou4TjhCp8m5flQpwrtXoGOJoZ1+o4APtKSzr9
	ZUdDpOeOmGQwUnlikV7mPNfKLBG6OEdKaKwdzT4OcfFIS+VeUemKSE1qtqUSyzmqxcI=
X-Gm-Gg: AYBFou3YN2u2w6S2sMAEz34ER/U0DB3E2nxkw3HMwldQuhgstnQKjf0Ze1kcRqI0G0H
	Stk3U7kHhI3KP6ONF8w5JzIk/+KvYPnsOTbyQTstGXil/EwQe18qMf2ddqf3csxRjY2KpZUfuHD
	QopWm8+lNNxDFuuzFnBQEAFJW5eu84GbPxKM90pAerclUsXDdGhU33Dncg2RaYlNrOf6DJ0aers
	IWfFUoG7H8Mx/JGk2XOMkbFp87U2gr2qwia5BbspjwaGDIYlLajimkkV9qec5YC7UFUijNuI0Gi
	K9lKMqeFgMpX/WEMvp5S1c81Rbz5lzP8OUIJC0kYfpuTJu+I3BiL0utOszxczbQErMbFVJ+tZlf
	NbffE+pqua/FGZuPwPpxNv9cxE86zTwHXvDv6BoAjbplqSaXAFpUO+/bDkDSegGGXPqbQ8r398J
	UuvT1N7AtNwQbc90HCifG57hGL4KFKNEXPTcoEAEit2rCxd9t99i82IVSKPNE4B/3kA1iEeC+GQ
	OhM6dkhc4/WMfyQ01x5g1XqPzdwRRvMEAd7vatgXbV2t7U1ft4xzXFhE3DAJYh0SpAVKGGwTGhM
	2setjc6zVS8BHdFgIZbgPU2W3ooavMb5H5WTodJBCq4A
X-Received: by 2002:a05:600c:a0b:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4ac183d2043mr76677775e9.33.1793397594525;
        Fri, 30 Oct 2026 14:59:54 -0700 (PDT)
Received: from linux-virtualbox ([176.123.27.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf723b5dcsm87207155e9.14.2026.10.30.14.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:59:54 -0700 (PDT)
From: Salah Ahmed <haddad2inc@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] wifi: mac80211: keep the tpt LED solid below an idle threshold
Date: Sat, 31 Oct 2026 00:59:37 +0300
Message-ID: <20261030215937.18103-3-haddad2inc@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030215937.18103-1-haddad2inc@gmail.com>
References: <20261030215937.18103-1-haddad2inc@gmail.com>
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

The phy throughput LED blinks whenever the counted traffic is non-zero:
tpt_trig_timer() walks the blink table from the top and only falls back to
solid on when no entry matches, which needs tpt == 0 exactly. An access
point transmits the broadcast and multicast it bridges even with zero
associated stations - measured at roughly 2 KiB/s on a quiet LAN - so the
LED blinks at the slowest table step (334 ms) forever and stops indicating
whether anything is actually being transferred.

Count anything below 12 KiB/s (96 kbit/s) as idle instead. That is the
threshold the userspace activity monitors used on these devices were tuned
against: it is above the background of a quiet LAN and well below any real
transfer, so the LED is solid while nothing moves and still tracks the
blink table as soon as a station transfers data.

Signed-off-by: Salah Ahmed <haddad2inc@gmail.com>
---
 net/mac80211/led.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/net/mac80211/led.c b/net/mac80211/led.c
index b5600d223..78fffe122 100644
--- a/net/mac80211/led.c
+++ b/net/mac80211/led.c
@@ -9,6 +9,16 @@
 #include <linux/export.h>
 #include "led.h"
 
+/*
+ * Below this throughput the tpt LED stays solid on instead of blinking at the
+ * slowest step of the table. An access point transmits the LAN broadcast and
+ * multicast it bridges even with zero associated stations (measured ~2 KiB/s),
+ * which is enough to keep the LED blinking forever while nothing is actually
+ * transferred. 12 KiB/s (96 kbit/s) is the idle rate the userspace activity
+ * monitors this behaviour was derived from were tuned against.
+ */
+#define IEEE80211_TPT_LED_IDLE_KBIT	(12 * 8)
+
 void ieee80211_led_assoc(struct ieee80211_local *local, bool associated)
 {
 	if (!atomic_read(&local->assoc_led_active))
@@ -270,6 +280,12 @@ static void tpt_trig_timer(struct timer_list *t)
 
 	tpt = tpt_trig_traffic(local, tpt_trig);
 
+	/* Treat anything below the idle threshold as no traffic, so that the
+	 * LED is solid while the radio only carries background broadcast.
+	 */
+	if (tpt < IEEE80211_TPT_LED_IDLE_KBIT)
+		tpt = 0;
+
 	/* default to just solid on */
 	on = 1;
 	off = 0;
-- 
2.53.0

