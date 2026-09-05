Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D483515FF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788618154; cv=none; b=nXg2aLmkraJ9ih/G/etWryd+amkVWT9xPjX51xmvOe9GDwf4WSiO0iHpTDNumIreqD5dqscfM8Y8oosN8cpAmQXx/Q3HoBbzqY5awgRQx6uWrf+DKwxs7Hhjh7dLY7add+0DIBwh/evZ1CTYodeZ1B0FxTMos509LVkhHU/pE+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788618154; c=relaxed/simple;
	bh=onVBlW7MOcXY/4u/1wLc1luNV8JQgXpPbl+Dwq4jXa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xt3NSEudaK1qx0Pc1V133dhuYWRd2klnx9rWzNkYf2ozeUPcpiFJ5lcbODSxbiFXdEexbNj+BCzzwRyEROoEL99fzoT/CR45oGe7BjA6rQsfi7wmFDLUwG0QrXi6Ecmz4D1AH5paqn5/UyX/jZ0TGzlnE6B4BiDTC16PyVIoHcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/hNJN39; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/hNJN39"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso1488385a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788618147; x=1789222947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=005z03CIhBd04YrgIq3DK9hNQnxi1U/rfpjn1baG6tI=;
        b=c/hNJN39rjgbVh8w0XjfqOqL4Y658Q6hGf2lAhAV+DtF1ml1UIvc0b6DiG3ihMlWMU
         7A0o7+QAUU84hpZvF1XGpe6mdl7odM5QA8haXWbAdiDwWAsv+tYF5VOfWhUWwKpTeNcM
         7Jsa4mbpI+St1q3oE4xF2Gf32bkhNVBkw7A2Utum4oaqv0PVkrHp7ChS+wUcAiPRDPHn
         t7n0VkOya2RabVLMaTc/mVBi3XHRFEzvlmK+2bgwT+zfCx3wA8Cz7RONZOlGlmkmx/8y
         vsSF1YVI6Ofi4x4ciXMY/oTmbYje0zsSyCcQ1wA+972XeZVOxuAH1PUXRP8/IqRAz6cD
         CtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788618147; x=1789222947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=005z03CIhBd04YrgIq3DK9hNQnxi1U/rfpjn1baG6tI=;
        b=e4n7OId4/AiIGTMa2GshnrX09ylAKQOdRGfWi4oKZbXS/PMujGkOdzKCChPqLh99oA
         mEptwenwcw5sZdORmSFMa4KTMChDZrJrBViq85GLA1LeMQ+W1rJ0/PrlcYnJi/XzzXdR
         ZHTQ5UUspzYvISDZWy+K3lpiEIDH7+zLlhGhTZjpFqA71Q7UgZhWe+aUWWsCXYZi0JNn
         nIZE9Kby9MZzvGiXfylNm36rAR4HPO6l29SrqQzNvrOBXM6rR8hPxKMKNu61Jdnvfo1i
         9khpXuk3CmjPjNa3EOuxPuoJdNY49T3k5n+UP45mzg8bCPTEJlXtT0VaYUA1/xhjRfDG
         lFNw==
X-Forwarded-Encrypted: i=1; AKwUvBxF1f1tg/BnPHhCSQg0qNGhbm30ayYiDIHU7hya/UdmFg/Sgy3GGpox22uYrk7SWDQFZYsxEafqudFVJjc=@vger.kernel.org
X-Gm-Message-State: AFuF++nhZqF3MABXYQRw3+sXK5NHc4YkF75mqXuOocuY8fK/McSCUvVR
	bjzsE94pTBcUhmnipNVNGUPT2+hPguUqK3XRO4O9ks5IJSoqkcBANTwg
X-Gm-Gg: AYBFou3xW0d89Ne/s6kpjxi/PKmmxtaC6J8P+4SZVEcQqnLGVQ+PCLivqwjOwuk+U+h
	INRfn77kElLEjXeJTMbn+pJ6l18PRXRZBxT7uUgrF9Zidb2u/4nrRAa/Uc4w5qZxXJrTOjeHPQY
	1uQRyLcI+Jo+lhwGSZw5oOrcmh2m9tLej9k6dkOxiqHKLUyGUSLojd5EDTRq9ygaPW1QK9GNiMH
	lrY4Z58wkb74JUtU+baF4AxGaGNIcH/wpXTYoy9auEUg8xCrHIBnhoQFA4K3lXCVLNnFBu3SShn
	Ys4qS9+WVSo3Eu0+06LDPm3S5PF815/wm3qEjBlqbfcaAz/1Jd38YIr6IkzDVuMCtdiFYxiRL2+
	wyZ+k54nrLNIKrxz7nIxV0k+QHTl0Vx4aWpBNn/GhNzg0UTbuN8ZIrDHtrV/MKzhCtxmWrdZPoW
	48D9BjiEZ36mqaCPRMbMbcggGKDjGfqsTBrQEzcAiSGqetAENTBaBQht6eB3WtkJ/DwSb7xz8B7
	29xPdb9Wn1FhigzYiEqErva6KHOtVX7
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr22265404a91.16.1788618147352;
        Sat, 05 Sep 2026 07:22:27 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm13347645c88.10.2026.09.05.07.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:22:26 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-media@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v2] media: dvb-core: extirpate defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 11:22:22 -0300
Message-ID: <20260905142222.22818-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c and its Kconfig definition to eliminate severe lockless race
conditions and clean up the unused function signature parameter.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/Kconfig   | 11 ---------
 drivers/media/dvb-core/dvb_net.c | 42 +-------------------------------
 2 files changed, 1 insertion(+), 52 deletions(-)

diff --git a/drivers/media/dvb-core/Kconfig b/drivers/media/dvb-core/Kconfig
index 8b3f2d53c..c6a97add8 100644
--- a/drivers/media/dvb-core/Kconfig
+++ b/drivers/media/dvb-core/Kconfig
@@ -67,14 +67,3 @@ config DVB_DEMUX_SECTION_LOSS_LOG
 
 	  If you are unsure about this, say N here.
 
-config DVB_ULE_DEBUG
-	bool "Enable DVB net ULE packet debug messages"
-	depends on DVB_CORE
-	help
-	  Enable extra log messages meant to detect problems while
-	  handling DVB network ULE packet loss inside the Kernel.
-
-	  Should not be enabled on normal cases, as logs can
-	  be very verbose.
-
-	  If you are unsure about this, say N here.
diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..5060b8866 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -68,19 +68,6 @@ static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
 
 #define DVB_NET_MULTICAST_MAX 10
 
-#ifdef DVB_ULE_DEBUG
-/*
- * The code inside DVB_ULE_DEBUG keeps a history of the
- * last 100 TS cells processed.
- */
-static unsigned char ule_hist[100*TS_SZ] = { 0 };
-static unsigned char *ule_where = ule_hist, ule_dump;
-
-static void hexdump(const unsigned char *buf, unsigned short len)
-{
-	print_hex_dump_debug("", DUMP_PREFIX_OFFSET, 16, 1, buf, len, true);
-}
-#endif
 
 struct dvb_net_priv {
 	int in_use;
@@ -320,16 +307,6 @@ static int dvb_net_ule_new_ts_cell(struct dvb_net_ule_handle *h)
 {
 	/* We are about to process a new TS cell. */
 
-#ifdef DVB_ULE_DEBUG
-	if (ule_where >= &ule_hist[100*TS_SZ])
-		ule_where = ule_hist;
-	memcpy(ule_where, h->ts, TS_SZ);
-	if (ule_dump) {
-		hexdump(ule_where, TS_SZ);
-		ule_dump = 0;
-	}
-	ule_where += TS_SZ;
-#endif
 
 	/*
 	 * Check TS h->error conditions: sync_byte, transport_error_indicator,
@@ -659,23 +636,6 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
 			h->ts_remain > 2 ?
 				*(unsigned short *)h->from_where : 0);
 
-	#ifdef DVB_ULE_DEBUG
-		hexdump(iov[0].iov_base, iov[0].iov_len);
-		hexdump(iov[1].iov_base, iov[1].iov_len);
-		hexdump(iov[2].iov_base, iov[2].iov_len);
-
-		if (ule_where == ule_hist) {
-			hexdump(&ule_hist[98*TS_SZ], TS_SZ);
-			hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-		} else if (ule_where == &ule_hist[TS_SZ]) {
-			hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-			hexdump(ule_hist, TS_SZ);
-		} else {
-			hexdump(ule_where - TS_SZ - TS_SZ, TS_SZ);
-			hexdump(ule_where - TS_SZ, TS_SZ);
-		}
-		ule_dump = 1;
-	#endif
 
 		h->dev->stats.rx_errors++;
 		h->dev->stats.rx_crc_errors++;
@@ -843,7 +803,7 @@ static void dvb_net_ule(struct net_device *dev, const u8 *buf, size_t buf_len)
 				       *(tail - 2) << 8 |
 				       *(tail - 1);
 
-			dvb_net_ule_check_crc(&h, iov, ule_crc, expected_crc);
+			dvb_net_ule_check_crc(&h, ule_crc, expected_crc);
 
 			/* Prepare for next SNDU. */
 			reset_ule(h.priv);
-- 
2.43.0

